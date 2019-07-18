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
use app\api\model\ApiDoc as DocModel;

class Doc extends Admin
{
    protected $hisiModel = 'ApiDoc';
    protected $hisiValidate = 'ApiDoc';
    
    protected function initialize()
    {
        parent::initialize();
        if ($this->request->action() != 'index') {
            $this->assign('tab_type', 3);
        }
    }

    public function index()
    {
    	if ($this->request->isAjax()) {
    		$limit    = $this->request->param('limit', 20);
    		$page     = $this->request->param('page', 1);

    		$where = [];
    		$data['code']     = 0;
    		$data['data']     = DocModel::with('hasCategory')->where($where)->limit($limit)->page($page)->select();
    		$data['count']    = DocModel::where($where)->count('id');
    		return json($data);
    	}
        return $this->fetch();
    }
}