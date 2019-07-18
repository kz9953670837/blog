<?php
/**
 * Created by PhpStorm.
 * User: apple
 * Date: 2019-07-11
 * Time: 21:50
 */

namespace app\fun\model;



class About extends Base
{
    protected $autoWriteTimestamp = 'datetime';

    /**
     * 修改关于我的内容
     * @param $data
     * @return bool
     */
    public function editAbout($data)
    {
        $about = self::get(1);
        $about->title     = $data['title'];
        $about->content    = $data['content'];
        $result = $about->allowField(true)->save();
        if ($result){
            return true;
        }else{
            $this->error = '修改失败';
            return false;
        }
    }

    /**
     * 获取关于我的数据
     * @return mixed
     */
    public function getAbout()
    {
        return self::get(1);
    }
}