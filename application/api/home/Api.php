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
namespace app\api\home;

use Request;
use Response;
use think\Controller;
use app\api\model\ApiErrorCode as ErrorCodeModel;

/**
 * API公共控制器
 * @package app\api\home
 */
class Api extends Controller
{
    // 跨域配置
    protected static $crossDoamin = [
        'Access-Control-Allow-Origin'       => '*',
        'Access-Control-Allow-Methods'      => 'GET, POST, PUT, DELETE',
        'Access-Control-Allow-Credentials'  => 'true',
        'Access-Control-Allow-By'           => 'zASGlzaVBIUAZa',
        'Access-Control-Allow-Headers'      => 'Access-Token, User-Token, Custom-Tag, Format, Timestamp, User-Agent, Keep-Alive, Origin, No-Cache, X-Requested-With, If-Modified-Since, Pragma, Last-Modified, Cache-Control, Expires, Content-Type, X-E4M-With',
    ];

    /**
     * 控制器初始化操作
     */
    public function initialize()
    {   
        $this->request = Request::instance();
        // 防止绕过接入认证
        if (!defined('IS_API')) {
            // 此处必须返回200，否者ajax预请求会报错
            http_response_code(200);
            foreach (self::$crossDoamin as $k => $v) {
                header($k . ':' . $v);
            }

            $data = [];
            $data['code'] = 401;
            $data['message'] = 'Illegal request!';
            $data['document']['developer_document_url'] = get_domain().'/doc';
            $data['document']['api_document_url'] = get_domain().'/wiki';
            
            if ($this->request->header('Format') == 'xml') {
                header('Content-Type: text/xml; charset=utf-8');
                $str = arrayToXml($data);
            } else {
                header('Content-Type: application/json; charset=utf-8');
                $str = json_encode($data, 1);
            }
            die($str);
        }
    }

    /**
     * 重置error方法
     * @return string
     */
    public function error($msg = '', $code = 400, $data = '', $wait = 3, array $header = [])
    {
        return self::output($msg, $code, $data, $header);
    }

    /**
     * 重置success方法
     * @return string
     */
    public function success($msg = '', $data = '', $code = 200, $wait = 3, array $header = [])
    {
        return self::output($msg, $code, $data, $header);
    }

    /**
     * 空方法
     * @return string
     */
	public function _empty()
    {
        return $this->output('empty method!', 404);
    }

	/**
	 * 接口响应输出
     * @param int|string $msg 错误码或错误信息
     * @param int $code 错误码 [结果码 200:正常/ 4** 数据问题/ 5** 服务器问题]
     * @param array $data 接口要返回数据
     * @param array $header 头部信息
     * @return string
	 */
	public static function output($msg = '', $code = 200, $data = [], $header = [])
	{

        if ($header) {
            $header = array_merge($header, self::$crossDoamin);
        } else {
            $header = self::$crossDoamin;
        }

        if (is_numeric($msg)) {
            $code = $msg;
            $msg = self::getErrorInfo($code);
        }

        $return             = [];
        $return['code']     = $code;
        $return['message']  = $msg;
        $return['data']     = is_array($data) || is_object($data) ? $data : ['info' => $data];
        $return             = array_filter($return);
        $code = substr($code, 0, 3);
        if (Request::instance()->header('Format') == 'xml') {
            return Response::create($return, 'xml', $code, $header, ['root_node' => 'xml']);
        } else {
            return Response::create($return, 'json', $code, $header);
        }
	}

    /**
     * 根据错误码获取错误信息
     * @param int $code 错误码
     * @return string
     */
    public static function getErrorInfo($code)
    {
        $data = cache('api_error_code');
        if (!$data) {
            $data = ErrorCodeModel::column('code,desc');
            cache('api_error_code', $data);
        }

        return isset($data[$code]) ? $data[$code] : '未知错误';
    }

    /**
     * 数据加密（唯一）
     * @param string $data 要加密的数据
     * @param int $key 私钥
     * @return string
     */
    public static function encrypt($data, $key)
    {
        $key    = md5($key);
        $x      = 0;
        $len    = strlen($data);
        $l      = strlen($key);
        $char   = '';
        $str    = '';
        for ($i = 0; $i < $len; $i++) {
            if ($x == $l) {
                $x = 0;
            }
            $char .= $key{$x};
            $x++;
        }

        for ($i = 0; $i < $len; $i++) {
            $str .= chr(ord($data{$i}) + (ord($char{$i})) % 256);
        }
        return base64_encode($str);
    }

    /**
     * 数据解密
     * @param string $data 要解密的密码串
     * @param int $key 私钥
     * @return string
     */
    public static function decrypt($data, $key)
    {
        $key    = md5($key);
        $x      = 0;
        $data   = base64_decode($data);
        $len    = strlen($data);
        $l      = strlen($key);
        $char   = '';
        $str    = '';
        for ($i = 0; $i < $len; $i++) {
            if ($x == $l) {
                $x = 0;
            }
            $char .= substr($key, $x, 1);
            $x++;
        }

        for ($i = 0; $i < $len; $i++) {
            if (ord(substr($data, $i, 1)) < ord(substr($char, $i, 1))) {
                $str .= chr((ord(substr($data, $i, 1)) + 256) - ord(substr($char, $i, 1)));
            } else {
                $str .= chr(ord(substr($data, $i, 1)) - ord(substr($char, $i, 1)));
            }
        }
        return $str;
    }

    /**
     * 生成签名
     * @param $secert
     * @param $data
     * @return string
     */
    public static function getSignature($param, $secert) {
        if (empty($param)) {
            return '';
        }
        $arr = array_merge($param);
        ksort($arr);
        reset($arr);
        $str = '';
        foreach ($arr as $k => $v) {
            if ($v !== '' && trim($v) !== '') {
                $str .= $k.$v;
            }
        }
        return strtoupper(md5($secert.$str.$secert));
    }
}