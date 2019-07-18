<?php


namespace app\fun\admin;


use app\fun\model\ArticleCate as ArticleCateModel;
use app\system\admin\Admin;

class ArticleCate extends Admin
{
    protected $hisiModel = 'ArticleCate';//模型名称[通用添加、修改专用]
    protected $hisiTable = 'ArticleCate';//表名称[通用添加、修改专用]
    protected $hisiValidate = 'ArticleCate';//验证器
    protected $hisiAddScene = 'addArticleCate';//添加数据验证场景名
    protected $hisiEditScene = 'editArticleCate';//更新数据验证场景名


    /**
     * 查询文章类别
     * @return string|\think\response\Json
     */
    public function articleCate()
    {
        if ($this->request->isAjax()){
             $page = (int)$this->request->param('page');
             $limit = (int)$this->request->param('limit');

             //查询文章类别
             $articleCateModel = new ArticleCateModel();
             $list = $articleCateModel->getArticleCate($page,$limit);
             return json(array(
                 'code' => 200,
                 'msg' => 'success',
                 'data' => $list['data'],
                 'total' => $list['total']
             ));
        }
        return $this->fetch();
    }

    /**
     * 展示文章列表页面
     * @return string
     */
    public function articleCateAdd()
    {
        return $this->fetch();
    }

    /**
     * 查询修改条件的基础数据
     * @return string|\think\response\Json
     */
    public function articleCateEdit()
    {
        if ($this->request->isPost()){
            $id = (int)$this->request->param('id');

            //查询修改条件的基础数据
            $articleCateModel = new ArticleCateModel();
            $articleCate = $articleCateModel->getIdArticleCate($id);
            return json(array(
                'code' => 200,
                'msg' => 'success',
                'data' => $articleCate
            ));
        }
        return $this->fetch();
    }

    /**
     * 删除文章类别
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function articleCateDelete()
    {
        if ($this->request->isDelete()){
            $id = (int)$this->request->param('id');

            //删除文章类别
            $articleCateModel = new ArticleCateModel();
            return $articleCateModel->deleteArticleCate($id) ? json(array('code'=>200)) : json(array('code'=>400,'msg'=>$articleCateModel->getError()));
        }
    }
}