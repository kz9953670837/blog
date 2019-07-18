<?php
/**
 * Created by PhpStorm.
 * User: apple
 * Date: 2019-07-11
 * Time: 19:00
 */

namespace app\fun\validate;


use think\Validate;

class Footer extends Validate
{
    protected $rule =   [
        'footer_text'  => 'require|max:255',
        'icon'   => 'require|max:255',
        'icon_link'   => 'max:255|url',
    ];

    protected $message  =   [
        'footer_text.require' => '底部文字必须',
        'footer_text.max' => '底部文字最多不能超过255个字符',
        'icon.require' => 'icon必须',
        'icon.max' => 'ico最多不能超过255个字符',
        'icon_link.max' => 'icon链接最多不能超过255个字符',
        'icon_link.url' => 'icon必须为URL格式',
    ];
}