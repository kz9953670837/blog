<?php


namespace app\fun\model;


use think\model\concern\SoftDelete;
use app\fun\model\ArticleContent as ArticleContentModel;
use app\fun\model\ArticleIntro as ArticleIntroModel;

use think\Db;
use think\facade\Cache;

class Article extends Base
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
     * 标题搜索器
     * @param $query
     * @param $value
     */
    public function searchTitleAttr($query, $value)
    {
        if ($value){
            $query->where('title','like', '%'.$value . '%');
        }
    }

    /**
     * 文章类别搜索器
     * @param $query
     * @param $value
     */
    public function searchArticleCateIdAttr($query, $value)
    {
        if ($value){
            $query->where('article_cate_id',$value);
        }
    }

    /**
     * 查询文章
     * @param $page
     * @param $limit
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getArticle($page,$limit,$search)
    {
        $data = self::withSearch(['title','article_cate_id'], [
            'title'			=>	$search['title'],
            'article_cate_id'	=>	$search['article_cate_id'],
        ])
            ->with(['articleCate'])
            ->page($page,$limit)
            ->order('create_time','desc')
            ->select();

        $total = self::withSearch(['title','article_cate_id'], [
            'title'			=>	$search['title'],
            'article_cate_id'	=>	$search['article_cate_id'],
        ])
            ->count();

        return [
            'data' => $data,
            'total' => $total
        ];
    }

    /**
     * 新增文章
     * @param $article
     * @param $intro
     * @param $content
     * @return bool
     */
    public function addArticle($article,$intro,$content)
    {

        Db::startTrans();
        try {

            //新增文章引言
            $articleIntroModel = new ArticleIntroModel();
            $articleIntro = $articleIntroModel->addArticleIntro($intro);

            //新增文章内容
            $articleContentModel = new ArticleContentModel();
            $articleContent = $articleContentModel->addArticleContent($content);

            //新增文章基本数据
            $this->article_cate_id = $article['article_cate'];
            $this->is_top = $article['is_top'];
            $this->title = $article['title'];
            $this->author = $article['author'];
            $this->intro_id = $articleIntro;
            $this->content_id = $articleContent;
            $this->allowField(true)->save();

            // 提交事务
            Db::commit();
            Cache::rm('TopArticle');
            return true;
        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
            $this->error = '新增失败';
            return false;
        }
    }

    /**
     * 根据ID查询文章内容
     * @param $id
     * @return array|\PDOStatement|string|Model|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getIdArticle($id)
    {
        return self::with(['articleCate','articleIntro','articleContent'])
            ->where('id',$id)
            ->order('create_time','desc')
            ->find();
    }


    /**
     * 修改文章
     * @param $id
     * @param $article
     * @param $intro
     * @param $content
     * @return bool
     */
    public function editArticle($id,$article,$intro,$content)
    {
        Db::startTrans();
        try {

            $result = self::get($id);
            $result->article_cate_id     = $article['article_cate'];
            $result->is_top    = $article['is_top'];
            $result->title     = $article['title'];
            $result->author    = $article['author'];
            $result->allowField(true)->save();

            //修改文章引言
            $articleIntroModel = new ArticleIntroModel();
            $articleIntroModel->editArticleIntro($result['intro_id'],$intro);

            //修改文章内容
            $articleContentModel = new ArticleContentModel();
            $articleContentModel->editArticleContent($result['content_id'],$content);

            // 提交事务
            Db::commit();
            Cache::rm('TopArticle');
            return true;
        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
            $this->error = '修改失败';
            return false;
        }
    }

    /**
     * 删除文章
     * @param $id
     * @return bool
     */
    public function deleteArticle($id)
    {
        $article = self::get($id);
        $result = $article->delete();
        if ($result){
            //删除缓存
            Cache::rm('TopArticle');
            return true;
        }else{
            $this->error = '删除失败';
            return false;
        }
    }

    /**
     * 更新置顶状态
     * @param $id
     * @return bool
     */
    public function editIsTop($id)
    {
        $article = self::get($id);
        $is_top = $article->is_top;
        $is_top === 0 ? $article->is_top = 1 : $article->is_top = 0;
        $result = $article->allowField(true)->save();
        if ($result){
            return true;
        }else{
            $this->error = "更新失败";
            return false;
        }
    }

    /**
     * 获取软删除的数据
     * @param $page
     * @param $limit
     * @param $search
     * @return array
     */
    public function getDelArticle($page,$limit,$search)
    {
        $data = self::onlyTrashed()
            ->withSearch(['title','article_cate_id'], [
            'title'			=>	$search['title'],
            'article_cate_id'	=>	$search['article_cate_id'],
        ])
            ->with(['articleCate'])
            ->page($page,$limit)
            ->order('create_time','desc')
            ->select();

        $total = self::onlyTrashed()
            ->withSearch(['title','article_cate_id'], [
            'title'			=>	$search['title'],
            'article_cate_id'	=>	$search['article_cate_id'],
        ])
            ->count();

        return [
            'data' => $data,
            'total' => $total
        ];
    }

    /**
     * 恢复文章
     * @param $id
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function restoreArticle($id)
    {
        $article = self::onlyTrashed()->find($id);
        $result = $article->restore();
        if ($result){
            Cache::rm('TopArticle');
            return true;
        }else{
            $this->error = '恢复失败';
            return false;
        }
    }

    /**
     * 彻底删除
     * @param $id
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function trashedArticle($id)
    {
        // 启动事务
        Db::startTrans();
        try {

            $article = self::withTrashed()->find($id);
            //修改文章引言
            $articleIntroModel = new ArticleIntroModel();
            $articleIntroModel->deleteArticleIntro($article['intro_id']);

            //修改文章内容
            $articleContentModel = new ArticleContentModel();
            $articleContentModel->deleteArticleContent($article['content_id']);

            $result = $article->delete(true);
            // 提交事务
            Db::commit();
            Cache::rm('TopArticle');
            return true;
        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
            $this->error = $e->getMessage();
            return false;
        }
    }
}