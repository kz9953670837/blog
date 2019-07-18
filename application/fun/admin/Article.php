<?php


namespace app\fun\admin;



use app\system\admin\Admin;
use app\fun\model\Article as ArticleModel;
use app\fun\model\ArticleCate as ArticleCateModel;
use app\fun\validate\Article as ArticleValidate;
use app\fun\validate\ArticleContent as ArticleContentValidate;
use app\fun\validate\ArticleIntro as ArticleIntroValidate;


class Article extends Admin
{
    protected $hisiModel = 'Article';//模型名称[通用添加、修改专用]
    protected $hisiTable = 'Article';//表名称[通用添加、修改专用]
    protected $hisiValidate = '';//验证器
    protected $hisiAddScene = '';//添加数据验证场景名
    protected $hisiEditScene = '';//更新数据验证场景名

    /**
     * 文章标题查询
     * @return string|\think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function article()
    {
        if ($this->request->isAjax()){
            $page = (int)$this->request->param('page');
            $limit = (int)$this->request->param('limit');

            $search = [
                'title' => trim($this->request->param('title')),
                'article_cate_id' => (int)$this->request->param('article_cate_id')
            ];

            $articleModel = new ArticleModel();
            $list = $articleModel->getArticle($page,$limit,$search);
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
     * 新增文章
     * @return string|\think\response\Json
     */
    public function articleAdd()
    {
        if ($this->request->isPost()){
            $postData = json_decode(html_entity_decode(htmlspecialchars_decode($this->request->param('postData'))),true);

            $article = [
                'article_cate' => (int)$postData['article_cate'],
                'title' => trim($postData['title']),
                'is_top' => empty($postData['is_top']) ? 0 : 1,
                'author' => trim($postData['author']),
            ];
            $intro = [
                'intro' => trim($postData['intro']),
                'introImage' => empty($postData['introImage']) ? null : trim($postData['introImage'])
            ];
            $content = [
                'content' => trim($postData['content'])
            ];

            //文章引言验证器
            $articleIntro = new ArticleIntroValidate();
            if (!$articleIntro->scene('addArticleIntro')->check($intro)) {
                return json(array('code'=>400,'msg'=>$articleIntro->getError()));
            }

            //文章内容验证器
            $articleContentValidate = new ArticleContentValidate();
            if (!$articleContentValidate->scene('addArticleContent')->check($content)) {
                return json(array('code'=>400,'msg'=>$articleContentValidate->getError()));
            }

            //文章验证器
            $articleValidate = new ArticleValidate();
            if (!$articleValidate->scene('addArticle')->check($article)) {
                return json(array('code'=>400,'msg'=>$articleValidate->getError()));
            }

            //新增文章
            $articleModel = new ArticleModel();
            return $articleModel->addArticle($article,$intro,$content) ? json(array('code'=>200)) : json(array('code'=>400,'msg'=>$articleModel->getError()));
        }
        return $this->fetch();
    }

    /**
     * 修改文章
     * @return string|\think\response\Json
     */
    public function articleEdit()
    {
        if ($this->request->isPost()){
            $postData = json_decode(html_entity_decode(htmlspecialchars_decode($this->request->param('postData'))),true);
            $id = (int)$this->request->param('id');
            $article = [
                'article_cate' => (int)$postData['article_cate'],
                'title' => trim($postData['title']),
                'is_top' => empty($postData['is_top']) ? 0 : 1,
                'author' => trim($postData['author']),
                'sort' => empty((int)$postData['sort']) ? 0 : (int)$postData['sort']
            ];
            $intro = [
                'intro' => trim($postData['intro']),
                'introImage' => empty($postData['introImage']) ? null : trim($postData['introImage'])
            ];
            $content = [
                'content' => trim($postData['content'])
            ];

            //文章引言验证器
            $articleIntro = new ArticleIntroValidate();
            if (!$articleIntro->scene('editArticleIntro')->check($intro)) {
                return json(array('code'=>400,'msg'=>$articleIntro->getError()));
            }

            //文章内容验证器
            $articleContentValidate = new ArticleContentValidate();
            if (!$articleContentValidate->scene('editArticleContent')->check($content)) {
                return json(array('code'=>400,'msg'=>$articleContentValidate->getError()));
            }

            //文章验证器
            $articleValidate = new ArticleValidate();
            if (!$articleValidate->scene('editArticle')->check($article)) {
                return json(array('code'=>400,'msg'=>$articleValidate->getError()));
            }

            //新增文章
            $articleModel = new ArticleModel();
            return $articleModel->editArticle($id,$article,$intro,$content) ? json(array('code'=>200)) : json(array('code'=>400,'msg'=>$articleModel->getError()));
        }
        return $this->fetch();
    }

    /**
     * 根据ID文章类别
     * @return string|\think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function articleBase()
    {
        if ($this->request->isAjax()){
            //根据ID文章类别
            $articleCateModel = new ArticleCateModel();
            $articleCate = $articleCateModel->getAllArticleCate();

            switch ($this->request->param('status')){
                case 'add':
                    return json(array('code'=>200,'msg'=>'success','data'=>$articleCate));
                case 'edit':
                    //根据ID查询文章
                    $id = (int)$this->request->param('id');
                    $articleModel = new ArticleModel();
                    $article = $articleModel->getIdArticle($id);
                    return json(array(
                        'code'=>200,
                        'msg'=>'success',
                        'data'=>[
                            'articleCate' => $articleCate,
                            'article' => $article
                        ]
                    ));
                    break;

            }

        }
        return $this->fetch();
    }

    /**
     * 删除文章
     * @return \think\response\Json
     */
    public function articleDelete()
    {
        if ($this->request->isDelete()){
            $id = (int)$this->request->param('id');

            //删除文章
            $articleModel = new ArticleModel();
            return $articleModel->deleteArticle($id) ? json(array('code'=>200)) : json(array('code'=>400,'msg'=>$articleModel->getError()));
        }
    }



    /**
     * 引荐的图片上传
     * @return \think\response\Json
     */
    public function introUploadImage()
    {
        if ($this->request->isPost()){
            $file = $this->request->file('file');
            $info = $file->move( 'upload/fun/article');
            //验证
            //size	上传文件的最大字节
            //ext	文件后缀，多个用逗号分割或者数组
            //type	文件MIME类型，多个用逗号分割或者数组
            //$info = $file->validate(['size'=>102400,'ext'=>'jpeg,jpg,png,gif'])->move( 'upload/fun/article');
            if($info){
                return json(array(
                    'code'=>200,
                    'msg'=> 'success',
                    'data'=>[
                        'src'=>'/upload/fun/article/'.$info->getSaveName()
                    ]
                ));
            }else{
                // 上传失败获取错误信息
                return json(array(
                    'code'=>400,
                    'msg'=> $file->getError()
                ));
            }
        }
    }

    /**
     * 内容编辑器图片上传
     * @return \think\response\Json
     */
    public function contentUploadImage()
    {
        if ($this->request->isPost()){
            $file = $this->request->file('file');
            $info = $file->move( 'upload/fun/article');
            //验证
            //size	上传文件的最大字节
            //ext	文件后缀，多个用逗号分割或者数组
            //type	文件MIME类型，多个用逗号分割或者数组
            //$info = $file->validate(['size'=>102400,'ext'=>'jpeg,jpg,png,gif'])->move( 'upload/fun/article');
            if($info){
                return json(array(
                    'code'=>0,
                    'msg'=> 'success',
                    'data'=>[
                        'src'=>'/upload/fun/article/'.$info->getSaveName()
                    ]
                ));
            }else{
                // 上传失败获取错误信息
                return json(array(
                    'code'=>400,
                    'msg'=> $file->getError()
                ));
            }
        }
    }

    /**
     * 更新置顶的状态
     * @return \think\response\Json
     */
    public function editStatus()
    {
        if ($this->request->isGet()){
            $id = (int)$this->request->param('id');

            //更新置顶的状态
            $articleModel = new ArticleModel();
            return $articleModel->editIsTop($id) ? json(array('code'=>200,'msg'=>'更新成功')) : json(array('code'=>0,'msg'=>$articleModel->getError()));
        }
    }

    /**
     * 查询软删除的文章
     * @return string|\think\response\Json
     */
    public function delArticle()
    {
        if ($this->request->isAjax()){


            $page = (int)$this->request->param('page');
            $limit = (int)$this->request->param('limit');

            $search = [
                'title' => trim($this->request->param('title')),
                'article_cate_id' => (int)$this->request->param('article_cate_id')
            ];

            //查询软删除的文章
            $articleModel = new ArticleModel();
            $list = $articleModel->getDelArticle($page,$limit,$search);

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
     * 恢复文章
     * @return \think\response\Json
     */
    public function articleRestore()
    {
        if ($this->request->isPost()){
            $id = (int)$this->request->param('id');

            //恢复文章
            $articleModel = new ArticleModel();
            return $articleModel->restoreArticle($id) ? json(array('code'=>200)) : json(array('code'=>400,'msg'=>$articleModel->getError()));
        }
    }

    /**
     * 彻底删除文章
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function articleTrashed()
    {
        if ($this->request->isDelete()){
            $id = (int)$this->request->param('id');

            //彻底删除文章
            $articleModel = new ArticleModel();
            return $articleModel->trashedArticle($id) ? json(array('code'=>200)) : json(array('code'=>400,'msg'=>$articleModel->getError()));
        }
    }

}