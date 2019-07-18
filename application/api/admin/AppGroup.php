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
use app\api\model\ApiAppGroup as GroupModel;

class AppGroup extends Admin
{
    protected $hisiModel = 'ApiAppGroup';

    public function index()
    {
    	if ($this->request->isAjax()) {
    		$limit    = $this->request->param('limit', 20);
    		$page     = $this->request->param('page', 1);

    		$where = [];
    		$data['code']     = 0;
    		$data['data']     = GroupModel::where($where)->limit($limit)->page($page)->select();
    		$data['count']    = GroupModel::where($where)->count('id');
    		return json($data);
    	}
        return $this->fetch();
    }

    public function del()
    {
        $id = get_num();
        $model = new GroupModel;

        if (!$model->del($id)) {
            return $this->error($model->getError());
        }

        return $this->success('删除成功');
    }
}