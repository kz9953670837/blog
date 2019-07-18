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
use app\api\model\ApiGroup as GroupModel;
use app\api\model\Api as ApiModel;
use app\api\model\ApiParam as ParamModel;
use hisi\Tree;

/**
 * API文档控制器
 * @package app\api\home
 */
class Wiki extends Controller
{
    public function index($routemap = '', $version = '')
    {
        $cid        = $this->request->get('cid/d', 0);
        $versions   = config('module_api.api_version') ? config('module_api.api_version') : 'v1';
        $versions   = explode(',', $versions);

        if (empty($version)) {
            $version = end($versions);
        }

    	$data['groups'] = GroupModel::where('status', 1)->order('sort asc')->field('id,name,desc')->select();

    	if ($cid <= 0 && isset($data['groups'][0]['id'])) {
    		$data['api_list'] = ApiModel::where('group_id', $data['groups'][0]['id'])
                                ->where('status', 1)
                                ->where('version', $version)
                                ->field('id,group_id,name,path,route_map,version')
                                ->select();
    	} else {
    		$data['api_list'] = ApiModel::where('group_id', $cid)
                                ->where('status', 1)
                                ->where('version', $version)
                                ->field('id,group_id,name,path,route_map,version')
                                ->select();
    	}

    	if ($routemap && $routemap != 'index') {
    		$data['api_detail'] = ApiModel::where('route_map', $routemap)->find();
    	} else if (isset($data['api_list'][0]['id'])) {
    		$routemap = $data['api_list'][0]['route_map'];
    		$data['api_detail'] = ApiModel::where('route_map', $routemap)->find();
    	} else {
    		return $this->error('暂无接口数据');
    	}
        
    	$requestParam = ParamModel::where('api_id', $data['api_detail']['id'])
                        ->where('type', 1)
                        ->where('status', 1)
                        ->column('id,pid,is_must,name,data_type,value,desc');
                        
        $returnParam = ParamModel::where('api_id', $data['api_detail']['id'])
                        ->where('type', 2)
                        ->where('status', 1)
                        ->column('id,pid,name,data_type,value,desc');

        $data['return_param']           = Tree::toTree($returnParam);
        $data['request_param']          = Tree::toTree($requestParam);
        $data['api_detail']['error']    = ['code' => 404, 'message' => 'empty method!'];
        $data['params']['version']      = $version;
        $data['versions']               = $versions;

    	$this->assign('data', $data);
    	return $this->fetch();
    }
}