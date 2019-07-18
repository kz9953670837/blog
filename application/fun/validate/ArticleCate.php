<?php


namespace app\fun\validate;


use think\Validate;

class ArticleCate extends Validate
{
    protected $rule =   [
        'cate_name'  => 'require|max:128',
        'sort'   => 'require|integer|max:3',
    ];

    protected $message  =   [
        'cate_name.require' => '文章类别必须',
        'cate_name.max'     => '文章类别最多不能超过128个字符',
        'sort.require'   => '排序必须',
        'sort.integer'   => '排序必须是数字',
        'sort.max'   => '排序最多不能超过3个字符',
    ];

    protected $scene = [
        'addArticleCate'  =>  ['cate_name','sort'],
        'editArticleCate'  =>  ['cate_name','sort'],
    ];
}