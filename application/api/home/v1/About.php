<?php
/**
 * Created by PhpStorm.
 * User: apple
 * Date: 2019-07-12
 * Time: 02:51
 */

namespace app\api\home\v1;


use app\api\home\Api;
use app\common\model\About as AboutModel;

class About extends Api
{
    /**
     * 获取关于我资料
     * @return string
     */
    public function index()
    {
        if ($this->request->isGet()){
            //获取关于我资料
            $aboutModel = new AboutModel();
            $about = $aboutModel->getAbout();
            return $this->output('success', 200, $about);
        }
    }
}