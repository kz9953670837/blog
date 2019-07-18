<?php
/**
 * Created by PhpStorm.
 * User: apple
 * Date: 2019-07-11
 * Time: 20:06
 */

namespace app\fun\validate;


use think\Validate;

class Header extends Validate
{
    protected $rule =   [
        'title'  => 'require|max:255',
        'subhead'   => 'max:255',
    ];

    protected $message  =   [
        'title.require' => '标题文字必须',
        'title.max' => '标题最多不能超过255个字符',
        'subhead.max' => '副标题最多不能超过255个字符',
    ];
}