<?php


namespace app\api\home\v1;


use app\api\home\Api;
use app\common\model\Footer as FooterModel;

class Footer extends Api
{
    /**
     * 获取底部信息
     * @return string
     */
    public function index()
    {
        if ($this->request->isGet()){
            //获取底部信息
            $footerModel = new FooterModel();
            $footer = $footerModel->getFooter();
            return $this->output('success', 200, $footer);
        }
    }
}