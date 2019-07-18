<?php


namespace app\fun\model;



class ArticleContent extends Base
{
    /**
     * 新增文章内容
     * @param $content
     * @return mixed
     */
    public function addArticleContent($content)
    {
        $this->content = $content['content'];
        $result = $this->allowField(true)->save();
        if ($result){
            return $this->id;
        }else{
            $this->error = '新增内容失败';
        }
    }

    /**
     * 修改文章内容
     * @param $id
     * @param $content
     * @return bool
     */
    public function editArticleContent($id,$content)
    {
        $articleContent = self::get($id);
        $articleContent->content  = $content['content'];
        $result = $articleContent->allowField(true)->save();

        if ($result){
            return true;
        }else{
            $this->error = '修改内容失败';
            return false;
        }
    }

    /**
     * 删除文章内容
     * @param $id
     * @return bool
     */
    public function deleteArticleContent($id)
    {
        $content = self::get($id);
        $result = $content->delete();
        if ($result){
            return true;
        }else{
            $this->error = '删除内容失败';
            return false;
        }
    }
}