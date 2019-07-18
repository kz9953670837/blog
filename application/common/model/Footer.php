<?php
/**
 * Created by PhpStorm.
 * User: apple
 * Date: 2019-07-12
 * Time: 01:48
 */

namespace app\common\model;


use think\Model;

class Footer extends Model
{
    /**
     * 获取底部信息
     * @return mixed
     */
    public function getFooter()
    {
        return self::cache(true)->find(1);
    }
}