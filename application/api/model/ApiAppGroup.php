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
namespace app\api\model;
use app\api\model\ApiApp as AppModel;

class ApiAppGroup extends Common
{
    protected $autoWriteTimestamp = false;

    public function del($id)
    {
    	if (AppModel::where('group_id', $id)->find()) {
    		$this->error = '删除失败（此分组下面已有应用关联）';
    		return false;
    	}

    	return $this->where('id', $id)->delete();
    }
}