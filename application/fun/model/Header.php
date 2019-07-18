<?php
/**
 * Created by PhpStorm.
 * User: apple
 * Date: 2019-07-11
 * Time: 20:00
 */

namespace app\fun\model;



class Header extends Base
{
    /**
     * 获取头部信息
     * @return mixed
     */
    public function getHeader()
    {
        return self::get(1);
    }

    /**
     * 修改头部信息
     * @param $data
     * @return bool
     */
    public function editHeader($data)
    {
        $header = self::get(1);
        $header->title     = $data['title'];
        $header->subhead    = $data['subhead'];
        $result= $header->save();
        if ($result){
            return true;
        }else{
            $this->error = '修改失败';
            return false;
        }
    }
}