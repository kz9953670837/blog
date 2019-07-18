<?php


namespace app\common\model;


use think\Model;

class InfoCard extends Model
{
    /**
     * 获取个人信息
     * @return array|\PDOStatement|string|Model|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getInfoCard()
    {
        return self::cache(true)->find(1);
    }
}