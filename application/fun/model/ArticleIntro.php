<?php


namespace app\fun\model;



class ArticleIntro extends Base
{
    /**
     * 新增文章引言
     * @param $intro
     * @return bool|mixed
     */
    public function addArticleIntro($intro)
    {
        $this->intro     = $intro['intro'];
        $this->intro_image    = $intro['introImage'];
        $result = $this->allowField(true)->save();
        if ($result){
            return $this->id;
        }else{
            $this->error = '新增引言失败';
            return false;
        }
    }

    /**
     * 修改文章引言
     * @param $id
     * @param $intro
     * @return bool
     */
    public function editArticleIntro($id,$intro)
    {
        $articleIntro = self::get($id);
        $articleIntro->intro     = $intro['intro'];
        $articleIntro->intro_image    = $intro['introImage'];
        $result = $articleIntro->allowField(true)->save();

        if ($result){
            return true;
        }else{
            $this->error = '修改引言失败';
            return false;
        }
    }

    /**
     * 删除文章引言
     * @param $id
     * @return bool
     */
    public function deleteArticleIntro($id)
    {
        $intro = self::get($id);
        $result = $intro->delete();
        if ($result){
            return true;
        }else{
            $this->error = '删除引言失败';
            return false;
        }
    }
}