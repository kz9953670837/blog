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
 * 错误码验证器
 * @package app\api\validate
 */
class ApiErrorCode extends Validate
{
    //定义验证规则
    protected $rule = [
        'code|错误码' => 'require|unique:api_doc,api_id^code',
        'desc|错误说明' => 'require|max:200',
        'solution|解决方案' => 'requireWith:solution|max:255',
    ];

    protected $scene = [
    	'sort' => [
    		'sort|排序' => 'requireWith:sort|number',
    	],
    ];
}
