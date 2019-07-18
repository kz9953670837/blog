<?php


namespace app\fun\admin;


use app\system\admin\Admin;

class Base extends Admin
{
    /**
     * get 查询
     * put 新增
     * post 更新
     * delete  删除
     * @var array
     */
    protected $actionMethod = [];

    //初始化
    protected function initialize()
    {
        parent::initialize();
        $this->checkActionMethod();
    }

    //检车请求类型
    protected function checkActionMethod()
    {
        if (array_key_exists($this->request->action(),$this->actionMethod)){
            if (in_array($this->request->method(),explode('|',$this->actionMethod[$this->request->action()]),true)){
            }else{
                $this->error('请求无效,请检查HTTP请求类型');
            }
        }else{
            $this->error('请求无效,请检查HTTP请求类型');
        }
    }
}