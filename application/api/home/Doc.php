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
use app\api\model\ApiDocCategory as CategoryModel;
use app\api\model\ApiDoc as DocModel;

/**
 * 开发文档控制器
 * @package app\api\home
 */
class Doc extends Controller
{
    public function index($id = 0)
    {
    	$data['menu'] = CategoryModel::with([
    		'hasDocs' => function($query) {
    			$query->where('status', 1)->order('sort asc')->field('category_id,id,title');
    		}
    	])->where('status', 1)->field('id,name')->select();

    	if ($id) {
    		$data['detail'] = DocModel::get($id);
    	} elseif (isset($data['menu'][0]['has_docs'][0]['id'])) {
    		$id = $data['menu'][0]['has_docs'][0]['id'];
    		$data['detail'] = DocModel::get($id);
    	} else {
    		$data['detail'] = ['title' => '', 'content' => '', 'mtime' => time()];
    	}
    	
        if ($id) {
    		DocModel::where('id', $id)->setInc('views');
    	}

    	$this->assign('data', $data);
    	return $this->fetch();
    }
}