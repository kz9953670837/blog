<?php
/**
 * Created by PhpStorm.
 * User: apple
 * Date: 2019-07-12
 * Time: 01:43
 */

namespace app\api\home\v1;


use app\api\home\Api;
use app\common\model\Header as HeaderModel;

class Header extends Api
{
    /**
     * 获取头部信息
     * @return string
     */
    public function index()
    {
        if ($this->request->isGet()){
            //获取头部信息
            $headerModel = new HeaderModel();
            $header = $headerModel->getHeader();
            return $this->output('success', 200, $header);
        }
    }
}