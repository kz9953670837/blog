<?php


namespace app\fun\model;



class InfoCard extends Base
{
    /**
     * 获取个人的数据
     * @param $id
     * @return mixed
     */
    public function getInfoCard()
    {
        return self::get(1);
    }

    /**
     * 修改个人数据
     * @param $id
     * @param $postData
     * @return bool
     */
    public function editAbout($id,$postData)
    {
        $info = self::get($id);
        $info->info_name = $postData['info_name'];
        $info->info_desc = $postData['info_desc'];
        $info->info_image = $postData['info_image'];
        $info->info_git = $postData['info_git'];
        $info->info_twitter = $postData['info_twitter'];
        $info->info_telegram = $postData['info_telegram'];
        $info->info_weibo = $postData['info_weibo'];
        $info->info_wechat = $postData['info_wechat'];
        $result = $info->allowField(true)->save();
        if ($result){
            return true;
        }else{
            $this->error = '修改失败';
            return false;
        }
    }
}