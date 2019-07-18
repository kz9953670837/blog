<?php


namespace app\fun\admin;


use app\system\admin\Admin;
use app\fun\model\InfoCard as InfoCardModel;
use app\fun\validate\Info as InfoValidate;

class Info extends Admin
{
    /**
     * 修改关于我的数据
     * @return string|\think\response\Json
     */
    public function info()
    {
        if ($this->request->isPost()){
            $id = 1;
            $postData = json_decode(html_entity_decode(htmlspecialchars_decode($this->request->param('postData'))),true);

            $data = [
                'info_name' => trim($postData['info_name']),
                'info_desc' => trim($postData['info_desc']),
                'info_image' => trim($postData['info_image']),
                'info_git' => trim($postData['info_git']) ?: null,
                'info_twitter' => trim($postData['info_twitter']) ?: null,
                'info_telegram' => trim($postData['info_telegram']) ?: null,
                'info_weibo' => trim($postData['info_weibo']) ?: null,
                'info_wechat' => trim($postData['info_wechat']) ?: null,
            ];

            //验证器
            $infoValidate = new InfoValidate();
            if (!$infoValidate->check($data)) {
                return json(array('code'=>400,'msg'=>$infoValidate->getError()));
            }


            //修改关于我的数据
            $aboutModel = new InfoCardModel();
            return $aboutModel->editAbout($id,$data) ? json(array('code'=>200)) : json(array('code'=>400,'msg'=>$aboutModel->getError()));
        }
        return $this->fetch();
    }

    /**
     * 查询个人关于我数据
     * @return \think\response\Json
     */
    public function infoBase()
    {
        if ($this->request->isAjax()){
            //查询个人关于我数据
            $aboutModel = new InfoCardModel();
            $userAbout = $aboutModel->getInfoCard();
            return json(array('code'=>200,'msg'=>'success','data'=>$userAbout));
        }
    }

    /**
     * 关于我的图片上传
     * @return \think\response\Json
     */
    public function UploadImage()
    {
        if ($this->request->isPost()){
            $file = $this->request->file('file');
            $info = $file->move( 'upload/fun/info');
            //验证
            //size	上传文件的最大字节
            //ext	文件后缀，多个用逗号分割或者数组
            //type	文件MIME类型，多个用逗号分割或者数组
            //$info = $file->validate(['size'=>102400,'ext'=>'jpeg,jpg,png,gif'])->move( 'upload/fun/about');
            if($info){
                return json(array(
                    'code'=>200,
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
}