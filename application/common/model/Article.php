<?php


namespace app\common\model;


use think\Model;
use think\model\concern\SoftDelete;

class Article extends Model
{
    use SoftDelete;
    protected $deleteTime = 'delete_time';
    protected $autoWriteTimestamp = 'datetime';

    //关联文章类别
    public function articleCate()
    {
        return $this->belongsTo('ArticleCate','article_cate_id')->bind('cate_name');
    }

    //关联文章内容
    public function articleIntro()
    {
        return $this->belongsTo('ArticleIntro','intro_id')->bind(['intro','intro_image']);
    }

    //关联文章内容
    public function articleContent()
    {
        return $this->belongsTo('ArticleContent','content_id')->bind('content');
    }

    /**
     * 获取置顶文章文章
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getTopArticle()
    {
        return self::with(['articleCate','articleIntro'])
            ->order('create_time','desc')
            ->field('id,article_cate_id,is_top,title,intro_id,create_time,update_time')
            ->where('is_top',1)
            ->cache('TopArticle')
            ->select();
    }

    /**
     * 根据ID获取文章
     * @param $id
     * @return array|\PDOStatement|string|Model|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getIdArticle($id)
    {
        return self::with(['articleCate','articleContent'])
            ->field('id,article_cate_id,is_top,title,content_id,create_time,update_time')
            ->cache(true)
            ->find($id);
    }
}