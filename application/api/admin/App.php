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
use app\api\model\ApiApp as AppModel;
use app\api\model\ApiAppGroup as GroupModel;

class App extends Admin
{
    protected $hisiModel = 'ApiApp';
    
    protected function initialize()
    {
        parent::initialize();
        if ($this->request->action() != 'index') {
            $tabData            = [];
            $tabData['menu']    = [
                ['title' => '基础信息'],
                ['title' => '权限设置'],
            ];
            $tabData['current'] = url('');

            $this->assign('hisiTabData', $tabData);
            $this->assign('hisiTabType', 2);
        }
    }

    public function index()
    {
    	if ($this->request->isAjax()) {
    		$limit    = $this->request->param('limit', 20);
    		$page     = $this->request->param('page', 1);

    		$where = [];
    		$data['code']     = 0;
    		$data['data']     = AppModel::with('hasGroup')->where($where)->limit($limit)->page($page)->select();
    		$data['count']    = AppModel::where($where)->count('id');
    		return json($data);
    	}
        return $this->fetch();
    }

    public function refreshAppSecret()
    {
        $id = get_num();
        if (!AppModel::where('id', $id)->setField('app_secret', random(32, 0))) {
            return $this->error('操作失败');
        }
        return $this->success('操作成功');
    }
}