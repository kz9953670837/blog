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

class ApiApp extends Common
{
	public function setAuthAttr($value)
	{
		if (empty($value)) return '';
		return json_encode($value, 1);
	}
	public function getAuthAttr($value)
	{
		if (empty($value)) return '';
		return json_decode($value, 1);
	}
	
	public function hasGroup()
	{
		return $this->hasOne('ApiAppGroup', 'id', 'group_id');
	}
}