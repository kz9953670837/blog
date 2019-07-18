<?php


namespace app\fun\model;


use app\fun\model\Article as ArticleModel;

class ArticleCate extends Base
{
    /**
     * 获取文章列表
     * @param $page
     * @param $limit
     * @return array
     */
    public function getArticleCate($page,$limit)
    {
        $data = self::page($page,$limit)->order('sort','desc')->select();

        $total = self::count();

        return [
            'data' => $data,
            'total' => $total
        ];
    }

    /**
     * 查询所有的文章类别
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getAllArticleCate()
    {
        return self::field('id,cate_name')->select();
    }

    /**
     * 根据ID查询文章类别
     * @param $id
     * @return mixed
     */
    public function getIdArticleCate($id)
    {
        return self::get($id);
    }

    /**
     * 删除文章类别
     * @param $id
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function deleteArticleCate($id)
    {
        $article = ArticleModel::withTrashed()->where('article_cate_id',$id)->find();
        if ($article === null){
            $articleCate = self::get($id);
            $result = $articleCate->delete();
            if ($result){
                return true;
            }else{
                $this->error = '删除失败';
                return false;
            }
        }else{
            $this->error = '文章存在该类别,不允许删除';
            return false;
        }

    }
}