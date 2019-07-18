<?php
/**
 * Created by PhpStorm.
 * User: apple
 * Date: 2019-07-12
 * Time: 01:45
 */

namespace app\common\model;


use think\Model;

class Header extends Model
{
    /**
     * 获取头部信息
     * @return mixed
     */
    public function getHeader()
    {
        return self::cache(true)->find();
    }
}