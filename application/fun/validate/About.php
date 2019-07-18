<?php
/**
 * Created by PhpStorm.
 * User: apple
 * Date: 2019-07-11
 * Time: 22:12
 */

namespace app\fun\validate;


use think\Validate;

class About extends Validate
{
    protected $rule =   [
        'title'  => 'require|max:255',
    ];

    protected $message  =   [
        'title.require' => '标题必须',
        'title.max'     => '标题最多不能超过255个字符',
    ];
}