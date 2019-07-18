<?php


namespace app\fun\validate;


use think\Validate;

class ArticleContent extends Validate
{
    protected $rule =   [
        'content'  => 'require',
    ];

    protected $message  =   [
        'content.require' => '内容必须',
    ];

    protected $scene = [
        'addArticleContent'  =>  ['content'],
        'editArticleContent'  =>  ['content'],
    ];
}