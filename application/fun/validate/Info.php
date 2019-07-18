<?php


namespace app\fun\validate;


use think\Validate;

class Info extends Validate
{
    protected $rule =   [
        'info_name'  => 'require|max:128',
        'info_desc'   => 'require|max:255',
        'info_image' =>  'require|max:255',
        'info_git' => 'url|max:255',
        'info_twitter' => 'url|max:255',
        'info_telegram' => 'url|max:255',
        'info_weibo' => 'url|max:255',
        'info_wechat' => 'url|max:255',
    ];

    protected $message  =   [
        'info_name.require' => '关于我姓名必须',
        'info_name.max'     => '关于我姓名最多不能超过128个字符',
        'info_desc.require'     => '关于我描述必须',
        'info_desc.max'   => '关于我描述最多不能超过255个字符',
        'info_image.require'   => '关于我图片必须',
        'info_image.max'   => '关于我图片不能超过255个字符',
        'info_git.url'   => 'github必须为URL',
        'info_git.max'   => 'github最多不能超过255个字符',
        'info_twitter.url'   => 'twitter必须为URL',
        'info_twitter.max'   => 'twitter最多不能超过255个字符',
        'info_telegram.url'   => 'telegram必须为URL',
        'info_telegram.max'   => 'telegram最多不能超过255个字符',
        'info_weibo.url'   => '微博必须为URL',
        'info_weibo.max'   => '微博最多不能超过255个字符',
        'info_wechat.url'   => '微信必须为URL',
        'info_wechat.max'   => '微信最多不能超过255个字符',
    ];
}