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
namespace app\api\admin;

use app\system\admin\Admin;
use app\api\model\ApiParam as ParamModel;

class Param extends Admin
{
    protected $hisiModel = 'ApiParam';

    public function index()
    {
        if ($this->request->isAjax()) {
            $pid    = $this->request->param('pid', 0);
            $type   = $this->request->param('type');
            $apiId  = $this->request->param('api_id');
            $limit  = $this->request->param('limit', 20);
            $page   = $this->request->param('page', 1);

            $where = [];
            $where['pid'] = $pid;
            if ($apiId) {
                $where['api_id'] = $apiId;
            }
            if ($type) {
                $where['type'] = $type;
            }
            if ($pid > 0) {
                $limit = 200;
            }
            $data['code']   = 0;
            $data['data']   = ParamModel::with('hasApi,hasChilds')->where($where)->limit($limit)->page($page)->select();
            $data['count']  = ParamModel::where($where)->count('id');
            return json($data);
        }
        return $this->fetch();
    }
}