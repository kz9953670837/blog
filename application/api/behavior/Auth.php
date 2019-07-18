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
namespace app\api\behavior;

use Cache;
use Request;
use think\Validate;
use app\api\home\Api;
use app\api\model\Api as ApiModel;
use app\api\model\ApiApp as AppModel;
use app\api\model\ApiToken as TokenModel;


/**
 * 接入认证
 */
class Auth {
    /**
     * @var Request
     */
    private $request;

    /**
     * 默认行为方法
     */
    public function run() {
        define('IS_API', true);
        $this->request  = Request::instance();
        $routeInfo      = $this->request->routeInfo();
        $route          = explode('/', $routeInfo['route']);
        if (count($route) != 3) {
            return Api::output('Routing error（format：module/:version.controller/action）', 502);
        }

        $contr = explode('.', $route[1]);
        if (count($contr) != 2) {
            return Api::output('Routing error（format：module/:version.controller/action）', 502);
        }

        $checkResult = $this->checkTimestamp();
        if ($checkResult !== true) {
            return Api::output($checkResult, 4011);
        }
        
        $where                  = [];
        $where['version']       = $routeInfo['var']['version'];
        $where['module']        = $route[0]; 
        $where['controller']    = $contr[1]; 
        $where['action']        = $route[2];

        $apiInfo = ApiModel::with('hasParams')->where($where)->find();
        if (!$apiInfo) {
            return Api::output('Interface don\'t exist!', 404);
        } else if ($apiInfo->status == 0) {
            return Api::output('Interface is disabled!', 403);
        }

        $params     = $apiInfo->hasParams()->where('type', 1)->select();
        $apiInfo    = $apiInfo->toArray();

        if ($apiInfo['user_token'] || $apiInfo['access_token']) {
            if ($apiInfo['access_token']) {
                $cacheResult = $this->checkAccessToken();
                if (!is_array($cacheResult)) {
                    return Api::output($cacheResult, 4012);
                }
            }

            if ($apiInfo['user_token']) {
                $cacheResult = $this->checkUserToken($apiInfo['id']);
                if (!is_array($cacheResult)) {
                    return Api::output($cacheResult, 4013);
                }
                
                define('API_USER_ID', $cacheResult['user_info']['id']);
                if (version_compare(PHP_VERSION,'7.0.0','<')) {
                    define('API_USER_INFO', json_encode($cacheResult['user_info']));
                } else {
                    define('API_USER_INFO', $cacheResult['user_info']);
                }
            }

            $appInfo = $this->getAppInfo($cacheResult);
            if (!is_array($appInfo)) {
                return Api::output($appInfo, 4014);
            }

            $checkResult = $this->checkPermission($apiInfo['id'], $appInfo);
            if ($checkResult !== true) {
                return Api::output($checkResult, 4015);
            }

            $checkResult = $this->checkWhitelist($appInfo);
            if ($checkResult !== true) {
                return Api::output($checkResult, 4016);
            }
        }

        $checkResult = $this->checkParams($params);
        if ($checkResult !== true) {
            return Api::output($checkResult, 4017);
        }
    }

    /**
     * 请求参数验证
     * @date   2018-10-19
     * @access private
     * @author 橘子俊 364666827@qq.com
     * @param  array     $rules 参数规则
     * @return bool|string
     */
    private function checkParams($rules)
    {
        switch (strtoupper($this->request->method())) {
            case 'GET':
                $data = $this->request->get();
                break;
            case 'POST':
                $data = $this->request->post();
                break;
            case 'DELETE':
                $data = $this->request->delete();
                break;
            case 'PUT':
                $data = $this->request->put();
                break;
            default :
                $data = [];
                break;
        }

        // 生成验证规则
        $newRule = [];
        foreach ($rules as $k => $v) {
            $rule = htmlspecialchars_decode($v['rule']);
            if (!empty($rule)) {
                $newRule[$v['name']] = $rule;
            }

            if ($v['is_must'] == 1 && empty($rule)) {
                $newRule[$v['name']] = 'require';
            } else if ($v['is_must'] == 1 && strpos($rule, 'require') === false) {
                $newRule[$v['name']] = 'require|'.$rule;
            }
        }
        
        $validate = new Validate($newRule);
        if (!$validate->check($data)) {
            return $validate->getError();
        }
        return true;
    }

    /**
     * 超时检查
     * @date   2018-10-19
     * @access private
     * @author 橘子俊 364666827@qq.com
     * @return bool|string
     */
    private function checkTimestamp()
    {
        $timstamp = $this->request->header('Timestamp');
        $timeDiff = time() - strtotime($timstamp);
        if (!$timstamp) {
            return 'Timestamp must!';
        } else if ( $timeDiff > 60 || $timeDiff < -60 ) {
            return 'Request timed out!';
        }
        return true;
    }
    
    /**
     * 获取应用信息
     * @date   2018-10-19
     * @access private
     * @author 橘子俊 364666827@qq.com
     * @param  array     $data 应用数据
     * @return bool|string
     */
    private function getAppInfo($data)
    {
        if (!isset($data['app_id']) || empty($data['app_id'])) {
            return 'app_id exception!';
        }

        $app = AppModel::where('app_id', $data['app_id'])->cache(10)->find();
        if (!$app) {
            return 'app_id don\'t exist!';
        } else if ($app->status != 1) {
            return 'app_id is disabled!';
        }
        return $app->toArray();
    }

    /**
     * IP白名单检查
     * @date   2018-10-19
     * @access private
     * @author 橘子俊 364666827@qq.com
     * @param  array     $appInfo 应用信息
     * @return bool|string
     */
    private function checkWhitelist($appInfo)
    {
        if (!isset($appInfo['whitelist']) || empty($appInfo['whitelist'])) {
            return true;
        }
        
        $whitelist = explode(',', $appInfo['whitelist']);
        $ip = $this->request->ip(0, false);
        if (in_array($ip, $whitelist) === false) {
            return 'Illegal request!';
        }
        return true;
    }

    /**
     * 应用权限检查
     * @date   2018-10-19
     * @access private
     * @author 橘子俊 364666827@qq.com
     * @param  array      $apiId   接口ID
     * @param  array      $appInfo 应用信息
     * @return bool|string
     */
    private function checkPermission($apiId, $appInfo)
    {
        if (!isset($appInfo['auth']) || empty($appInfo['auth'])) {
            return 'Sorry, you don\'t have permission to access!';
        }
        
        if (in_array($apiId, $appInfo['auth']) === false) {
            return 'Sorry, you don\'t have permission to access!';
        }
        return true;
    }

    /**
     * 接口调用凭证检查
     * @date   2018-10-19
     * @access private
     * @author 橘子俊 364666827@qq.com
     * @return bool|string
     */
    private function checkAccessToken() {
        $token = $this->request->header('Access-Token');
        if (!$token) {
            return 'Access-Token must!';
        }

        $data = Cache::get('hisiApiAccessToken:' . $token);
        if (!$data) {
            $row = TokenModel::where('token', $token)->field('data,expires')->find();
            if (!$row) {
                return 'Access-Token expired!';
            } else if ($row['expires'] > 0 && $row['expires'] < time()) {
                $row->delete();
                return 'Access-Token expired!';
            }
            $data = json_decode($row['data'], 1);
            Cache::set('hisiApiAccessToken:'.$token, $data, ($row['expires'] - time()));
        }
        return $data;
    }

    /**
     * 用户授权凭证检查
     * @date   2018-10-19
     * @access private
     * @author 橘子俊 364666827@qq.com
     * @return bool|string
     */
    private function checkUserToken($id) {
        $token = $this->request->header('User-Token');
        if (!$token) {
            return 'User-Token must!';
        }

        $data = Cache::get('hisiApiUserToken:' . $token);
        if (!$data) {
            $row = TokenModel::where('token', $token)->field('data,expires')->find();
            if (!$row) {
                return 'User-Token expired!';
            } else if ($row['expires'] > 0 && $row['expires'] < time()) {
                $row->delete();
                return 'User-Token expired!';
            }
            $data = json_decode($row['data'], 1);
            Cache::set('hisiApiUserToken:'.$token, $data, ($row['expires'] - time()));
        }

        // 用户授权的接口检查
        if (!isset($data['user_info']['auth_scope']) || empty($data['user_info']['auth_scope'])) {
            return 'user authorization error!';
        }
        
        if (!in_array($id, $data['user_info']['auth_scope'])) {
            return 'user did not agree to authorize!';
        }
        
        return $data;
    }
}
