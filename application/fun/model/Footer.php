<?php


namespace app\fun\model;



class Footer extends Base
{
    /**
     * 获取底部数据
     * @return mixed
     */
    public function getFooter()
    {
        return self::get(1);
    }

    /**
     * 修改底部文字数据
     * @param $data
     * @return bool
     */
    public function editFooter($data)
    {
        $footer = self::get(1);
        $footer->footer_text     = $data['footer_text'];
        $footer->icon    = $data['icon'];
        $footer->icon_link    = $data['icon_link'];
        $result= $footer->save();
        if ($result){
            return true;
        }else{
            $this->error = '修改失败';
            return false;
        }
    }
}