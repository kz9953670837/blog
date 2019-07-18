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

Route::domain('api', 'api');

// 接口文档路由
Route::rule('wiki/:version/:routemap', 'api/wiki/index');

// 资源路由嵌套
Route::resource(':version/Articles', 'api/:version.Articles')->before(function() {
                if (defined('ENTRANCE')) {// 防止后台路由冲突
                    return false;
                }
            })->after('\app\api\behavior\Auth');   Route::resource(':version/InfoCard', 'api/:version.InfoCard')->before(function() {
                if (defined('ENTRANCE')) {// 防止后台路由冲突
                    return false;
                }
            })->after('\app\api\behavior\Auth');   Route::resource(':version/header', 'api/:version.header')->before(function() {
                if (defined('ENTRANCE')) {// 防止后台路由冲突
                    return false;
                }
            })->after('\app\api\behavior\Auth');   Route::resource(':version/Footer', 'api/:version.Footer')->before(function() {
                if (defined('ENTRANCE')) {// 防止后台路由冲突
                    return false;
                }
            })->after('\app\api\behavior\Auth');   Route::resource(':version/About', 'api/:version.About')->before(function() {
                if (defined('ENTRANCE')) {// 防止后台路由冲突
                    return false;
                }
            })->after('\app\api\behavior\Auth');   