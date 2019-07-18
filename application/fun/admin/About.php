<?php
/**
 * Created by PhpStorm.
 * User: apple
 * Date: 2019-07-11
 * Time: 21:17
 */

namespace app\fun\admin;


use app\system\admin\Admin;
use app\fun\model\About as AboutModel;
use app\fun\validate\About as AboutValidate;

class About extends Admin
{
    /**
     * 修改关于我
     * @return string|\think\response\Json
     */
    public function about()
    {
        if ($this->request->isPost()){
            $postData = json_decode(html_entity_decode(htmlspecialchars_decode($this->request->param('postData'))),true);
            $data = [
                'title' => trim($postData['title']),
                'content' => $postData['content']
            ];

            //验证器
            $aboutValidate = new AboutValidate();
            if (!$aboutValidate->check($data)) {
                return json(array('code'=>400,'msg'=>$aboutValidate->getError()));
            }

            //修改关于我的信息
            $aboutModel = new AboutModel();
            return $aboutModel->editAbout($data) ? json(array('code'=>200)) : json(array('code'=>400,'msg'=>$aboutModel->getError()));
        }

        return $this->fetch();
    }

    /**
     * 关于我图片上传
     * @return \think\response\Json
     */
    public function UploadImage()
    {
        if ($this->request->isPost()){
            $file = $this->request->file('file');
            $info = $file->move( 'upload/fun/about');
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
                        'src'=>'/upload/fun/about/'.$info->getSaveName()
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
     * 关于我的基础数据
     * @return \think\response\Json
     */
    public function aboutBase()
    {
        if ($this->request->isGet()){
            //关于我的基础数据
            $aboutModel = new AboutModel();
            $about = $aboutModel->getAbout();
            return json(array('code'=>200,'msg'=>'success','data'=>$about));
        }
    }
}