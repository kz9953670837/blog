<?php


namespace app\fun\validate;


use think\Validate;

class ArticleIntro extends Validate
{
    protected $rule =   [
        'intro'  => 'require',
        'introImage'   => 'max:255',
    ];

    protected $message  =   [
        'intro.require' => '引言必须',
        'introImage.max' => '引言图片最多不能超过128个字符',
    ];

    protected $scene = [
        'addArticleIntro'  =>  ['intro','introImage'],
        'editArticleIntro'  =>  ['intro','introImage'],
    ];
}