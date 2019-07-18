<?php
namespace app\api\home\v1;
use app\api\home\Api;
use app\common\model\Article as ArticleModel;


class Articles extends Api
{
    /**
     * 获取置顶文章
     * @return string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
	public function index()
	{
	    if ($this->request->isGet()) {
	        //获取置顶文章
            $articleModel = new ArticleModel();
            $article = $articleModel->getTopArticle();
            return $this->output('success', 200, $article);
        }
	}

    /**
     * 根据ID获取文章
     * @return string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
	public function read()
    {
        if ($this->request->isGet()){
            $id = $this->request->param('id');
            //根据ID获取文章
            $articleModel = new ArticleModel();
            $article = $articleModel->getIdArticle($id);
            if ($article){
                return $this->output('success', 200, $article);
            }else{
                return $this->output('error', 404);
            }
        }
    }
}