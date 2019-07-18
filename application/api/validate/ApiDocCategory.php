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
namespace app\api\validate;

use think\Validate;

/**
 * 开发文档分类验证器
 * @package app\api\validate
 */
class ApiDocCategory extends Validate
{
    //定义验证规则
    protected $rule = [
        'name|分类名称' => 'require|unique:api_doc_category',
    ];

    protected $scene = [
    	'sort' => [
    		'sort|排序' => 'requireWith:sort|number',
    	],
    ];
}
