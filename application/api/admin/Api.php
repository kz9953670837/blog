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
namespace app\api\admin;

use app\system\admin\Admin;
use app\api\model\Api as ApiModel;
use Env;

class Api extends Admin
{
    protected $hisiModel = 'Api';
    
    public function index()
    {
    	if ($this->request->isAjax()) {
            $limit      = $this->request->param('limit', 20);
            $page       = $this->request->param('page', 1);
            $version    = $this->request->param('version');
            $groupId    = $this->request->param('group_id');
            $keyword    = $this->request->param('keyword');

    		$where = [];
            if ($version) {
                $where[] = ['version', '=', $version];
            }
            if ($groupId) {
                $where[] = ['group_id', '=', $groupId];
            }
            if ($keyword) {
                $where[] = ['name', 'like', "%{$keyword}%"];
            }

    		$data['code']     = 0;
    		$data['data']     = ApiModel::with('hasGroup')->where($where)->limit($limit)->page($page)->select();
    		$data['count']    = ApiModel::where($where)->count('id');
    		return json($data);
    	}
        return $this->fetch();
    }

    public function refreshRoute()
    {
        $rows = ApiModel::where('status', 1)->order('version asc')->column('rule,route,version');
        $route = '';

        foreach ($rows as $k => $v) {
            $ruleStr = str_replace($v['version'], ':version', $v['rule']);
            $routeStr = str_replace($v['version'], ':version', $v['route']);
            $route .= "Route::resource('{$ruleStr}', '{$routeStr}')->before(function() {
                if (defined('ENTRANCE')) {// 防止后台路由冲突
                    return false;
                }
            })->after('\app\api\behavior\Auth');\r   ";
        }

        $appPath = Env::get('app_path');
        $file = $appPath.'api/route.php';
        if (!is_file($file)) {
            return $this->error('路由模板不存在');
        }
        
        if (is_file($appPath.'api.php')) {
            unlink($appPath.'api.php');
        }

        $content = file_get_contents($file);
        if (!file_put_contents(Env::get('route_path').'api.php', str_replace('//{resource}', $route."\r", $content))) {
            return $this->error('操作失败');
        }
        return $this->success('操作成功');
    }

    public function del()
    {
        $id = $this->request->param('id/a');
        if (!ApiModel::del($id)) {
            return $this->error('删除失败');
        }
        return $this->success('删除成功');
    }
}
