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
use app\api\model\ApiErrorCode as CodeModel;

class ErrorCode extends Admin
{
    protected $hisiModel = 'ApiErrorCode';
    protected $hisiValidate = 'ApiErrorCode';
    
    public function index()
    {
        if ($this->request->isAjax()) {
            $apiId  = $this->request->param('api_id');
            $limit  = $this->request->param('limit', 20);
            $page   = $this->request->param('page', 1);

            $where = [];
            if ($apiId) {
                $where['api_id'] = $apiId;
            }
            
            $data['code']   = 0;
            $data['data']   = CodeModel::with('hasApi')->where($where)->limit($limit)->page($page)->select();
            $data['count']  = CodeModel::where($where)->count('id');
            return json($data);
        }
        return $this->fetch();
    }
}