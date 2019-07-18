<?php


namespace app\api\home\v1;


use app\api\home\Api;
use app\common\model\InfoCard as InfoCardModel;

class InfoCard extends Api
{
    /**
     * 获取个人信息
     * @return string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index()
    {
        if ($this->request->isGet()){
            //获取个人信息
            $infoCardModel = new InfoCardModel();
            $infoCard = $infoCardModel->getInfoCard();
            return $this->output('success', 200, $infoCard);
        }
    }
}