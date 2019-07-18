<?php
// +----------------------------------------------------------------------
// | HisiPHP框架[基于ThinkPHP5开发]
// +----------------------------------------------------------------------
// | Copyright (c) 2016-2018 http://www.hisiphp.com
// +----------------------------------------------------------------------
// | HisiPHP承诺基础框架永久免费开源，您可用于学习和商用，但必须保留软件版权信息。
// +----------------------------------------------------------------------
// | Author: 橘子俊 <364666827@qq.com>，开发者QQ群：50304283
// +----------------------------------------------------------------------
namespace app\api\model;

use think\Model;

class Common extends Model
{
    // 定义时间戳字段名
    protected $createTime = 'ctime';
    // 更新时间
    protected $updateTime = 'mtime';

    // 自动写入时间戳
    protected $autoWriteTimestamp = true;
    
    /**
     * 将数据集格式化成父子结构
     * @param int $id 选中的ID
     * @param int $status 状态值
     * @param int $level 层级
     * @param int $data  要格式化的数据集
     * @author 橘子俊 <364666827@qq.com>
     * @return string
     */
    public static function getChilds($pid = 0, $status = 0, $pField = 'pid', $field = 'id,name,pid,status', $level = 0, $data = [])
    {
        $trees = [];
        if (empty($data)) {
            $map = [];
            if ($status == 1) {
                $map['status'] = 1;
            }

            $data = self::where($map)->column($field);
            $data = array_values($data); 
        }

        foreach ($data as $k => $v) {
            if ($v[$pField] == $pid) {
                unset($data[$k]);
                $v['childs'] = self::getChilds($v['id'], $status, $pField, $field, $level+1, $data);
                $trees[] = $v;
            }
        }
        return $trees;
    }

    /**
     * 将数据集格式化成下拉选项
     * @param int $id 选中的ID
     * @author 橘子俊 <364666827@qq.com>
     * @return string
     */
    public static function getSelect($data = [], $id = 0, $childField = 'childs', $level = 0)
    {
        if (empty($data)) {
            return '';
        }
        $str = $separ = '';
        if ($level > 0) {
            for ($i=0; $i < $level; $i++) {
                $separ .= '&nbsp;&nbsp;&nbsp;';
            }
            $separ .= '┣&nbsp;';
        }

        foreach ($data as $k => $v) {
            if ($id == $v['id']) {
                $str .= '<option value="'.$v['id'].'" selected>'.$separ.$v['name'].'</option>';
            } else {
                $str .= '<option value="'.$v['id'].'">'.$separ.$v['name'].'</option>';
            }
            if (isset($v[$childField])) {
                $str.= self::getSelect($v[$childField], $id, $childField, $level+1);
            }
        }
        return $str;
    }
}