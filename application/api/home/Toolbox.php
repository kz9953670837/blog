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
use Cookie;
use Cache;
use hisi\Http;
use app\api\home\Api;
use app\api\model\Api as ApiModel;

/**
 * 工具箱控制器
 * @package app\api\home
 */
class Toolbox extends Controller
{
	// 获取accessToken
	public function accessToken()
	{
		if ($this->request->isPost()) {
			$appId 		= $this->request->post('app_id');
			$appSecret 	= $this->request->post('app_secret');
			$env		= $this->request->post('env', 1);
			if (empty($appId) || empty($appSecret)) {
				return $this->error('appId,app_secret为必传参数');
			}

			$param = [];
	        $param['app_id']		= $appId;
	        $param['grant_type']	= 'access_token';
	        $param['timestamp'] 	= date('Y-m-d H:i:s');
	        $param['signature'] 	= Api::getSignature($param, $appSecret);

	        $host 	= $env == 2 ? config('module_api.sandbox_url') : config('module_api.formal_url');
			$result = Http::get($host.'/oauth/token', $param);

			if (is_array($result)) {
				return $this->error($result['msg']);
			}

			$data = json_decode($result, 1);
			if ($data['code'] == 200) {
				Cookie::set('apiTestAccessToken', $data['data']['access_token'], $data['data']['expires_in']);
			} else {
				return $this->error($data['message']);
			}

			return $this->success('success', '', $data);
		}
	}

	// 测试工具
    public function test()
    {
		if ($this->request->isPost()) {
	    	$param				= $this->request->post();
	    	$head 				= isset($param['head']) ? $param['head'] : [];
	    	$head['Timestamp'] 	= date('Y-m-d H:i:s');// 重置模板里面的发送请求时间
	    	$apiId 				= $param['api_id'];
	    	$env 				= $param['env'];
	    	$path 				= $param['path'];
	    	$host 				= $env == 2 ? config('module_api.sandbox_url') : config('module_api.formal_url');
	    	$row 				= ApiModel::get($apiId);
	    	$url 				= $host.$path;
	    	unset($param['head'], $param['api_id'], $param['env'], $param['path']);
	    	$header = [];
	    	foreach ($head as $k => $v) {
	    		$header[] = $k.': '.$v;
	    	}

	    	$method = $row->method;
	    	$result = Http::$method($url, $param, $header);
	    	if (is_array($result)) {
	    		$json = $result;
	    	} else {
	    		$json = json_decode($result, 1);
	    	}

	    	if ($head['Format'] == 'xml') {
	    		exit(arrayToXml($json));
	    	} else {
	    		exit(json_encode($json, JSON_UNESCAPED_UNICODE|JSON_PRETTY_PRINT));
	    	}
	    }
    }
}