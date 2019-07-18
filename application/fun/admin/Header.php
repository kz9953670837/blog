<?php
/**
 * Created by PhpStorm.
 * User: apple
 * Date: 2019-07-11
 * Time: 19:48
 */

namespace app\fun\admin;


use app\system\admin\Admin;
use app\fun\model\Header as HeaderModel;
use app\fun\validate\Header as HeaderValidate;

class Header extends Admin
{
    /**
     * 修改头部信息
     * @return string|\think\response\Json
     */
    public function header()
    {
        if ($this->request->isPost()){
            $postData = json_decode(html_entity_decode(htmlspecialchars_decode($this->request->param('postData'))),true);


            $data = [
                'title' => trim($postData['title']),
                'subhead' => trim($postData['subhead']) ?: null
            ];


            //验证器
            $headerValidate = new HeaderValidate();
            if (!$headerValidate->check($data)) {
                return json(array('code'=>400,'msg'=>$headerValidate->getError()));
            }

            //修改头部信息
            $headerModel = new HeaderModel();
            return $headerModel->editHeader($data) ? json(array('code'=>200)) : json(array('code'=>400,'msg'=>$headerModel->getError()));

        }
        return $this->fetch();
    }

    /**
     * 获取头部信息
     * @return \think\response\Json
     */
    public function headerBase()
    {
        if ($this->request->isGet()){

            //获取头部信息
            $headerModel = new HeaderModel();
            $header = $headerModel->getHeader();
            return json(array('code'=>200,'msg'=>'success','data'=>$header));
        }
    }
}