<?php


namespace app\fun\validate;


use think\Validate;

class Article extends Validate
{
    protected $rule =   [
        'article_cate'  => 'require|integer|max:11',
        'is_top'   => 'require|integer|length:1',
        'title' =>  'require|max:255',
        'author' => 'max:128',
        'sort' => 'require|integer|max:3'
    ];

    protected $message  =   [
        'article_cate.require' => '文章类别必须',
        'article_cate.integer'     => '文章类别必须为正整数',
        'article_cate.max'     => '文章类别最多不能超过11个字符',
        'is_top.require'   => '置顶必须',
        'is_top.integer'   => '置顶必须为正整数',
        'is_top.length'   => '置顶最多不能超过1个字符',
        'title.require'   => '标题必须',
        'title.max'   => '标题最多不能超过255个字符',
        'author.max'   => '作者最多不能超过128个字符',
        'sort.require'   => '排序必须',
        'sort.integer' => '排序的必须正整数',
        'sort.max' => '排序的最大长度为3个字符',
    ];

    protected $scene = [
        'addArticle'  =>  ['article_cate_id','is_top','title','author','sort'],
        'editArticle'  =>  ['article_cate_id','is_top','title','sort'],
    ];
}