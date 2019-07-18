<?php
// +----------------------------------------------------------------------
// | HisiPHP框架[基于ThinkPHP5开发]
// +----------------------------------------------------------------------
// | Copyright (c) 2016-2018 http://www.hisiphp.com
// +----------------------------------------------------------------------
// | HisiPHP承诺基础框架永久免费开源，您可用于学习和商用，但必须保留软件版权信息。
// +----------------------------------------------------------------------
// | Author: 橘子俊 <364666827@qq.com>，开发者QQ群：50304283
// +----------------------------------------------------------------------
namespace app\api\home;

use think\Controller;
use Request;
use Cache;
use Db;
use Loader;
use app\api\home\Api;
use app\api\model\ApiApp as AppModel;
use app\api\model\Api as ApiModel;
use app\api\model\ApiToken as TokenModel;

/**
 * Oauth控制器
 * @package app\api\home
 */
class Oauth extends Controller
{

    /**
     * 授权登录
     * @return string
     */
    public function authorize()
    {
        $param                  = [];
        $param['iframe']        = $this->request->param('iframe/d', 0);
        $param['app_id']        = $this->request->param('app_id');
        $param['scope']         = $this->request->param('scope');
        $param['state']         = $this->request->param('state');
        $param['redirect_uri']  = $this->request->param('redirect_uri');
        $param['response_type'] = $this->request->param('response_type');
        if ((int)config('module_api.oauth_login') != 1) {
            return $this->error('Oauth login has been disabled!');
        }
        if (empty($param['app_id'])) {
            return $this->error('parameter app_id must!');
        }

        if (empty($param['scope'])) {
            return $this->error('parameter scope must!');
        }

        if (empty($param['state'])) {
            return $this->error('parameter state must!');
        }

        if (empty($param['redirect_uri'])) {
            return $this->error('parameter redirect_uri must!');
        }

        if (empty($param['response_type'])) {
            return $this->error('parameter response_type must!');
        }

        $appInfo = self::getAppInfo($param['app_id']);
        if (!is_array($appInfo)) {
            return $this->error($appInfo);
        }

        // 授权回调地址检查
        if (base64_encode($param['redirect_uri']) != base64_encode($appInfo['callback_domain'])) {
            return $this->error('Illegal request!');
        }

        $apiList = ApiModel::where('user_token', 1)->column('id,name,route_map,status');
        if ($this->request->isPost()) {
            $postData   = $this->request->post();
            $scope      = explode(',', $param['scope']);
            if (isset($postData['user_scope']) && !empty($postData['user_scope'])) {
                $scope = array_merge($scope, $postData['user_scope']);
            }

            foreach ($scope as $k => $v) {
                if (!in_array($v, $appInfo['auth'])) {
                    unset($scope[$k]);
                }
            }

            if (empty($scope)) {
                return $this->error('scope is must!');
            }

            $account    = $this->request->post('account');
            $pwd        = $this->request->post('password');
            $code       = self::buildAccessToken($appInfo['app_id']);
            
            if ($loginExpand = config('module_api.login_action_expand')) {
                $loginResult = action($loginExpand, ['account' => $account, 'password' => $pwd], 'home');
                if ($loginResult == false) {
                    return $this->error('error!');
                }
                if (!isset($loginResult['id'])) {
                    return $this->error("[{$loginExpand}] missing ID field!");
                }
            } else {
                $userModel = model('user/User');
                $loginResult = $userModel->login($account, $pwd);
                if ($loginResult == false) {
                    return $this->error($userModel->getError());
                }
            }

            $loginResult['auth_scope'] = $scope;
            if (strpos($param['redirect_uri'], '?') == false) {
                $redirectUri = $param['redirect_uri'].'?code='.$code.'&state='.$param['state'].'&id='.$loginResult['id'];
            } else {
                $redirectUri = $param['redirect_uri'].'&code='.$code.'&state='.$param['state'].'&id='.$loginResult['id'];
            }

            $expires = config('module_api.authorization_code_expires');

            Cache::set('hisiApiAuthorizationCode:'.$code, $loginResult, ($expires ? $expires : 600));

            return $this->success('登录成功，自动跳转中...', $redirectUri);
        }

        // 展示授权接口明细
        $scope = ApiModel::where('route_map', 'in', $param['scope'])->column('id');

        $data['scope']      = $scope;
        $data['api_list']   = $apiList;
        $data['app_info']   = $appInfo;
        $param['scope']     = implode(',', $scope);
        $data['params']     = $param;

        $this->assign('data', $data);
        return $this->fetch( $param['iframe'] ? 'pop' : '' );
    }

    /**
     * 获取token（authorization_code,access_token,refresh_token）
     * @return array|string
     */
    public function token()
    {
        $param = $return        = [];
        $param['app_id']        = $this->request->get('app_id');
        $param['grant_type']    = $this->request->get('grant_type', 'access_token');
        $param['signature']     = $this->request->get('signature');
        $param['code']          = $this->request->get('code');
        $param['timestamp']     = urldecode($this->request->get('timestamp'));
        $param['refresh_token'] = $this->request->get('refresh_token');

        if (empty($param['app_id'])) {
            return Api::output('parameter app_id must!', 401);
        }

        if (empty($param['signature'])) {
            return Api::output('parameter signature must!', 401);
        }

        if ( (time() - strtotime($param['timestamp'])) > 60 ) {
            return Api::output('Request timed out!', 401);
        }

        $appInfo = self::getAppInfo($param['app_id']);
        if (!is_array($appInfo)) {
            return Api::output($appInfo, 401);
        }

        $signature = $param['signature'];
        unset($param['signature']);

        if ($signature != Api::getSignature($param, $appInfo['app_secret'])) {
            return Api::output('signature verification failed!', 401);
        }
        $sqlmap = $return = [];
        switch ($param['grant_type']) {
            case 'authorization_code':// 通过授权登录获取授权码,必传参数(app_id,code,grant_type,timestamp,signature)
                $userInfo = Cache::pull('hisiApiAuthorizationCode:'.$param['code']);
                if (empty($userInfo)) {
                    return Api::output('code expired!', 401);
                }

                $memebrId       = $userInfo['id'];
                $expires        = config('module_api.user_token_expires') ? : 90;
                $startDate      = strtotime(date('Y-m-d 00:00:00'));
                $endDate        = strtotime(date('Y-m-d 00:00:00', strtotime('+'.$expires.' days')));
                $expires        = $endDate - $startDate;
                $userToken      = self::buildAccessToken($appInfo['app_id']);
                $refreshToken   = self::buildAccessToken($appInfo['app_id']);

                $cacheData                  = [];
                $cacheData['app_id']        = $appInfo['app_id'];
                $cacheData['user_info']     = $userInfo;
                $cacheData['user_token']    = $userToken;

                Cache::set('hisiApiUserToken:'.$userToken, $cacheData, $expires);
                Cache::set('hisiApiRefreshToken:'.$refreshToken, $cacheData);

                $sqlmap = [
                    [
                        'type'      => 2,
                        'member_id' => $memebrId,
                        'app_id'    => $appInfo['app_id'],
                        'token'     => $userToken,
                        'expires'   => $endDate,
                        'data'      => json_encode($cacheData, 1),
                        'ctime'     => time(),
                    ],
                    [
                        'type'      => 3,
                        'member_id' => $memebrId,
                        'app_id'    => $appInfo['app_id'],
                        'token'     => $refreshToken,
                        'expires'   => 0,
                        'data'      => json_encode($cacheData, 1),
                        'ctime'     => time(),
                    ],
                ];

                if (config('module_api.openid_key')) {
                    $return['openid'] = Api::encrypt($param['app_id'].'_'.$memebrId, config('module_api.openid_key'));
                } else {
                    $return['openid'] = $memebrId;
                }

                $return['user_token']       = $userToken;
                $return['refresh_token']    = $refreshToken;
                $return['expires_in']       = $expires;

                // 删除旧数据
                Db::name('api_token')->where('app_id', $appInfo['app_id'])->where('member_id', $memebrId)->delete();
                break;

            case 'access_token':// 获取授权码,必传参数(app_id,grant_type,timestamp,signature)
                $expires            = config('module_api.access_token_expires') ? : 7200;
                $accessToken        = self::buildAccessToken($appInfo['app_id']);
                $cacheData          = [];
                $cacheData['app_id']= $appInfo['app_id'];

                Cache::set('hisiApiAccessToken:'.$accessToken, $cacheData, $expires);

                $sqlmap = [
                    [
                        'type'      => 1,
                        'app_id'    => $appInfo['app_id'],
                        'token'     => $accessToken,
                        'expires'   => strtotime('+'.$expires.' second'),
                        'data'      => json_encode($cacheData, 1),
                        'ctime'     => time(),
                    ],
                ];

                $return['access_token'] = $accessToken;
                $return['expires_in']   = $expires;

                // 删除旧数据
                Db::name('api_token')->where('app_id', $appInfo['app_id'])->where('type', 1)->delete();
                break;

            case 'refresh_token':// 刷新授权码,必传参数(app_id,grant_type,timestamp,signature,refresh_token)
                if (empty($param['refresh_token'])) {
                    return Api::output('refresh_token must!', 401);
                }

                $cacheData = Cache::pull('hisiApiRefreshToken:'.$param['refresh_token']);
                if (empty($cacheData)) {
                    // 缓存没有就读备用数据库
                    $cacheData = Db::name('api_token')->where('token', $param['refresh_token'])->value('data');
                    if (!$cacheData) {
                        return Api::output('refresh_token expired!', 401);  
                    }
                }

                $oldData        = $cacheData;
                $expires        = config('module_api.user_token_expires') ? config('module_api.user_token_expires') : 90;
                $startDate      = strtotime(date('Y-m-d 00:00:00'));
                $endDate        = strtotime(date('Y-m-d 00:00:00', strtotime('+'.$expires.' days')));
                $expires        = $endDate - $startDate;
                $userToken      = self::buildAccessToken($cacheData['app_id']);
                $refreshToken   = self::buildAccessToken($cacheData['app_id']);

                $cacheData['user_token'] = $userToken;

                Cache::set('hisiApiUserToken:'.$userToken, $cacheData, $expires);
                Cache::set('hisiApiRefreshToken:'.$refreshToken, $cacheData);

                $sqlmap = [
                    [
                        'type'      => 2,
                        'member_id' => $cacheData['user_info']['id'],
                        'app_id'    => $appInfo['app_id'],
                        'token'     => $oldData['user_token'],
                        'expires'   => strtotime('+5 Minute'),
                        'data'      => json_encode($oldData, 1),
                        'ctime'     => time(),
                    ],
                    [
                        'type'      => 2,
                        'member_id' => $cacheData['user_info']['id'],
                        'app_id'    => $appInfo['app_id'],
                        'token'     => $userToken,
                        'expires'   => $endDate,
                        'data'      => json_encode($cacheData, 1),
                        'ctime'     => time(),
                    ],
                    [
                        'type'      => 3,
                        'member_id' => $cacheData['user_info']['id'],
                        'app_id'    => $appInfo['app_id'],
                        'token'     => $refreshToken,
                        'expires'   => 0,
                        'data'      => json_encode($cacheData, 1),
                        'ctime'     => time(),
                    ],
                ];

                $return['user_token']       = $userToken;
                $return['refresh_token']    = $refreshToken;
                $return['expires_in']       = $expires;

                // 删除旧数据
                Db::name('api_token')->where('app_id', $appInfo['app_id'])
                                    ->where('member_id', $cacheData['user_info']['id'])->delete();

                // 旧的userToken重置有效期为300秒
                Cache::set('hisiApiUserToken:'.$oldData['user_token'], $oldData, 300);
                break;
            
            default:
                return Api::output('parameter grant_type must!', 401);
                break;
        }

        // 清理过期的数据
        Db::name('api_token')->where('expires', '<', time())->delete();

        // 插入新的缓存数据
        if ($sqlmap) {
            if (!Db::name('api_token')->insertAll($sqlmap)) {
                return Api::output('data storage exception!', 500);
            }
        }

        return Api::output('success', 200, $return);
    }
    
    /**
     * 获取应用信息
     * @param $appId 应用ID
     * @return array
     */
    private static function getAppInfo($appId)
    {
        $appInfo = AppModel::where(['app_id' => $appId])->find();
        if (!$appInfo) {
            return 'app_id invalid!';
        }

        if ($appInfo['status'] != 1) {
            return 'app_id is disabled!';
        }
        return $appInfo->toArray();
    }

    /**
     * 生成签名
     * @param array $param 要参与签名的参数
     * @param string $secert app_secert
     * @return string
     */
    private static function getSignature($param, $secert) {
        if (empty($param)) {
            return '';
        }
        $arr = array_merge($param);
        ksort($arr);
        reset($arr);
        $str = '';
        foreach ($arr as $k => $v) {
            if ($v !== '' && trim($v) !== '') {
                $str .= $k.$v;
            }
        }
        return strtoupper(md5($secert.$str.$secert));
    }

    /**
     * 生成令牌
     * @param $appId
     * @return string
     */
    private static function buildAccessToken($appId) {
        $preStr = random(rand(1, 20), 0) . md5($appId) . time() . md5(config('authkey')) . random(rand(1, 20), 0);
        return strtoupper(md5($preStr));
    }
}
