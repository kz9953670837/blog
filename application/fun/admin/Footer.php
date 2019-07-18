<?php


namespace app\fun\admin;


use app\system\admin\Admin;
use app\fun\model\Footer as FooterModel;
use app\fun\validate\Footer as FooterValidate;

class Footer extends Admin
{
    /**
     * 修改底部配置
     * @return string|\think\response\Json
     */
    public function footer()
    {
        if ($this->request->isPost()){
            $postData = json_decode(html_entity_decode(htmlspecialchars_decode($this->request->param('postData'))),true);

            //数据处理
            $data = [
                'footer_text' => trim($postData['footer_text']),
                'icon' => trim($postData['icon']),
                'icon_link' => trim($postData['icon_link'])
            ];


            //验证器
            $footerValidate = new FooterValidate();
            if (!$footerValidate->check($data)) {
                return json(array('code'=>400,'msg'=>$footerValidate->getError()));
            }

            //改底部配置
            $footerModel = new FooterModel();
            return $footerModel->editFooter($data) ? json(array('code'=>200)) : json(array('code'=>400,'msg'=>$footerModel->getError()));

        }
        return $this->fetch();
    }

    /**
     * 获取底部基本的数据
     * @return \think\response\Json
     */
    public function footerBase()
    {
        if ($this->request->isGet()){
            $footerModel = new FooterModel();
            $footer = $footerModel->getFooter();
            return json(array('code'=>200,'msg'=>'success','data'=>$footer));
        }
    }
}