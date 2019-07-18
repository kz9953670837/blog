<?php
/**
 * Created by PhpStorm.
 * User: apple
 * Date: 2019-07-12
 * Time: 02:51
 */

namespace app\common\model;


use think\Model;

class About extends Model
{
    /**
     * 获取关于我的信息
     * @return mixed
     */
    public function getAbout()
    {
        return self::cache(true)->find(1);
    }
}