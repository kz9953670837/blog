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
use app\api\model\ApiParam as ParamModel;

class Api extends Common
{
	public function setPathAttr($value, $data)
	{
		if ($value) return $value;
		switch ($data['action']) {
			case 'index':
				return $data['version'].'/'.$data['controller'];
				break;

			case 'create':
				return $data['version'].'/'.$data['controller'].'/create';
				break;

			case 'save':
				return $data['version'].'/'.$data['controller'];
				break;

			case 'edit':
				return $data['version'].'/'.$data['controller'].'/:id/edit';
				break;
			
			default:// read、update、delete
				return $data['version'].'/'.$data['controller'].'/:id';
				break;
		}
		return '';
	}

	public function setMethodAttr($value, $data) {
		switch ($data['action']) {
			case 'save':
				return 'POST';
				break;

			case 'update':
				return 'PUT';
				break;

			case 'delete':
				return 'DELETE';
				break;
			
			default:
				return 'GET';
				break;
		}
	}

	public function setRouteMapAttr($value, $data)
	{
		return $data['module'].'_'.$data['controller'].'_'.$data['action'];
	}

	public function setRuleAttr($value, $data)
	{
		if ($value) return $value;
		return $data['version'].'/'.$data['controller'];
	}

	public function setRouteAttr($value, $data)
	{
		if ($value) return $value;
		return $data['module'].'/'.$data['version'].'.'.$data['controller'];
	}

	public function getReturnExampleAttr($value)
	{
		return htmlspecialchars_decode($value);	
	}

	public function getReturnExampleArrAttr($value, $data)
	{
		if (!$data['return_example']) return [];
		$str = htmlspecialchars_decode($data['return_example']);
		return json_decode($str, 1);
	}

	public function hasGroup()
	{
		return $this->hasOne('ApiGroup', 'id', 'group_id');
	}

	public function hasParams()
	{
		return $this->hasMany('ApiParam', 'api_id', 'id');
	}

	public function hasErrors()
	{
		return $this->hasMany('ApiErrorCode', 'api_id', 'id');
	}

    // 模型事件
    public static function init()
    {

        // 新增后
        self::event('after_insert', function ($obj) {
        	
        	// 刷新路由
        	action('api/Api/refreshRoute', [], 'admin');
            
            return true;

        });

        // 更新后
        self::event('after_update', function ($obj) {
        	
        	// 刷新路由
        	action('api/Api/refreshRoute', [], 'admin');

            return true;
        
        });

        // 删除后
        self::event('after_delete', function ($obj) {
        	
        	// 刷新路由
        	action('api/Api/refreshRoute', [], 'admin');
        	
            return true;
        
        });

    }

	public function authList()
	{
		$rows = self::with('hasGroup')->field('id,group_id,version,name')->order('version desc')->select();
        $newArr = [];
        foreach ($rows as $k => $v) {
        	$newArr[$v['version']][$v['group_id']]['name'] = $v['has_group']['name'];
        	unset($v['has_group']);
            $newArr[$v['version']][$v['group_id']]['childs'][] = $v;
        }
        return $newArr;
	}

	public static function del($id = [])
	{
		// 删除参数
		foreach ($id as $v) {
			$model = new ParamModel;
			$model->startTrans();
			$model->where('api_id', $v)->delete();


			// 删除当前数据
			self::startTrans();
			if (!self::where('id', $v)->delete()) {
				self::rollback();
				self::rollback();
			}

			$model->commit();
			self::commit();
		}
		
		return true;
	}
}