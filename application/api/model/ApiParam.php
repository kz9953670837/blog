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

class ApiParam extends Common
{
    protected $autoWriteTimestamp = false;
    
	public function hasApi()
	{
		return $this->hasOne('Api', 'id', 'api_id');
	}

	public function hasChilds()
	{
		return $this->hasMany('ApiParam', 'pid', 'id');
	}

    /**
     * 添加子ID
     * @param int $id 子ID
     * @param int $pid 父ID
     * @author 橘子俊 <364666827@qq.com>
     * @return string
     */
    public static function addChilds($id, $pid = 0)
    {
        if ($pid == 0) {
            $row = self::where('id', $id)->find();
            self::where('id', $id)->setField('childs', $id);
        } else {
            $row = self::where('id', $pid)->find();
            self::where('id', $pid)->setField('childs', $row['childs'].','.$id);
        }
        if ($row['pid'] > 0) {
            self::addChilds($id, $row['pid']);
        }
    }

    /**
     * 剔除子ID
     * @param int $id 子ID
     * @param int $pid 父ID
     * @author 橘子俊 <364666827@qq.com>
     * @return string
     */
    public static function delChilds($id, $pid = 0)
    {
        if (!$pid) return true;
        $row = self::where('id', $pid)->find();
        $childs = explode(',', $row['childs']);
        $childs = implode(',', array_diff($childs, [$id]));
        self::where('id', $pid)->setField('childs', $childs);
        if ($row['pid'] > 0) {
            self::delChilds($id, $row['pid']);
        }
    }

    /**
     * 删除分类
     * @param int $id 子ID
     * @param int $pid 父ID
     * @author 橘子俊 <364666827@qq.com>
     * @return bool
     */
    public static function del($id, $pid = 0)
    {
        if ($pid == 0) {
            $row = self::where('id', $id)->find();
            if ( (string)$row['childs'] != (string)$id || $row['pid'] == 0 ) {
                return false;
            }
            $row->delete();
        } else {
            $row = self::where('id', $pid)->find();
            $childs = explode(',', $row['childs']);
            $childs = implode(',', array_diff($childs, [$id]));
            self::where('id', $pid)->setField('childs', $childs);
        }

        if ($row['pid'] > 0) {
            self::del($id, $row['pid']);
        }
        return true;
    }
}