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
use app\api\model\ApiDocCategory as CategoryModel;

class DocCategory extends Admin
{
    protected $hisiModel = 'ApiDocCategory';
    protected $hisiValidate = 'ApiDocCategory';

    public function index()
    {
        if ($this->request->isAjax()) {
            $pid = $this->request->param('pid', 0);

            $where = [];
            $where['pid'] = $pid;
            $data['code'] = 0;
            $data['data'] = CategoryModel::where($where)->order('sort asc')->select();
            return json($data);
        }
        return $this->fetch();
    }
}