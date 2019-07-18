<?php
/**
 * 模块基本信息
 */
return [
    // 核心框架[必填]
    'framework' => 'thinkphp5.1',
    // 模块名[必填]
    'name'        => 'api',
    // 模块标题[必填]
    'title'       => '接口',
    // 模块唯一标识[必填]，格式：模块名.[应用市场ID].module.[应用市场分支ID]
    'identifier'  => 'api.1000022.module.2000021',
    // 主题模板[必填]，默认default
    'theme'        => 'default',
    // 模块图标[选填]
    'icon'        => '/static/api/api.png',
    // 模块简介[选填]
    'intro' => '通用RESTfulAPI接口，基于TP5的资源路由功能而开发。接口文档自动生成，接口输入参数自动检查，集成Oauth授权登录、在线测试工具等。',
    // 开发者[必填]
    'author'      => 'hisiphp',
    // 开发者网址[选填]
    'author_url'  => 'http://www.hisiphp.com',
    // 版本[必填],格式采用三段式：主版本号.次版本号.修订版本号
    // 主版本号【位数变化：1-99】：当模块出现大更新或者很大的改动，比如整体架构发生变化。此版本号会变化。
    // 次版本号【位数变化：0-999】：当模块功能有新增或删除，此版本号会变化，如果仅仅是补充原有功能时，此版本号不变化。
    // 修订版本号【位数变化：0-999】：一般是 Bug 修复或是一些小的变动，功能上没有大的变化，修复一个严重的bug即发布一个修订版。
    'version'     => '1.0.3',
    // 模块依赖[可选]，格式[[模块名, 模块唯一标识, 依赖版本, 对比方式]]
    'module_depend' => [],
    // 插件依赖[可选]，格式[[插件名, 插件唯一标识, 依赖版本, 对比方式]]
    'plugin_depend' => [],
    // 模块数据表[有数据库表时必填,不包含表前缀]
    'tables' => [
        'api',
        'api_app',
        'api_app_group',
        'api_doc',
        'api_doc_category',
        'api_group',
        'api_param',
        'api_token',
        'api_error_code',
    ],
    // 原始数据库表前缀,模块带sql文件时必须配置
    'db_prefix' => 'hisiphp_',
    // 模块预埋钩子[非系统钩子，必须填写]
    'hooks' => [],
    // 模块配置，格式['sort' => '100','title' => '配置标题','name' => '配置名称','type' => '配置类型','options' => '配置选项','value' => '配置默认值', 'tips' => '配置提示'],各参数设置可参考管理后台->系统->系统功能->配置管理->添加
    'config' => [
            [
            'sort' => 100, 
            'title' => '正式环境', 
            'name' => 'formal_url', 
            'type' => 'input', 
            'options' => '', 
            'value' => '', 
            'tips' => '正式环境地址，必须以http或https开头',
        ], 
        [
            'sort' => 101, 
            'title' => '沙箱环境', 
            'name' => 'sandbox_url', 
            'type' => 'input', 
            'options' => '', 
            'value' => '', 
            'tips' => '沙箱环境地址，必须以http或https开头',
        ], 
        [
            'sort' => 102, 
            'title' => 'accessToken', 
            'name' => 'access_token_expires', 
            'type' => 'input', 
            'options' => '', 
            'value' => '7200', 
            'tips' => '授权令牌有效期，单位秒',
        ], 
        [
            'sort' => 103, 
            'title' => 'authorizationCode', 
            'name' => 'authorization_code_expires', 
            'type' => 'input', 
            'options' => '', 
            'value' => '600', 
            'tips' => '用户授权登录回调Code有效期，单位秒',
        ], 
        [
            'sort' => 104, 
            'title' => 'userToken', 
            'name' => 'user_token_expires', 
            'type' => 'input', 
            'options' => '', 
            'value' => '90', 
            'tips' => '用户登录授权的有效期，单位天',
        ], 
        [
            'sort' => 105, 
            'title' => '自定义登录方法', 
            'name' => 'login_action_expand', 
            'type' => 'input', 
            'options' => '', 
            'value' => '', 
            'tips' => '[选填] 格式：模块/控制器/方法，默认使用系统会员(AdminMember)',
        ], 
        [
            'sort' => 106, 
            'title' => '版本管理', 
            'name' => 'api_version', 
            'type' => 'input', 
            'options' => '', 
            'value' => 'v1', 
            'tips' => '多个版本号使用英文逗号&quot;,&quot;隔开。例：v1,v2,v3',
        ], 
        [
            'sort' => 107, 
            'title' => 'OAuth授权登录', 
            'name' => 'oauth_login', 
            'type' => 'switch', 
            'options' => [
                '0'=> '禁用',
                '1'=> '启用',
            ], 
            'value' => '0', 
            'tips' => '关闭后将无法使用授权登录',
        ], 
        [
            'sort' => 108, 
            'title' => 'OpenID私钥', 
            'name' => 'openid_key', 
            'type' => 'input', 
            'options' => '', 
            'value' => '', 
            'tips' => '用于生成授权用户标识，&lt;strong class=&quot;red&quot;&gt;设置后不可更改&lt;/strong&gt;，不设置将直接返回授权用户真实ID',
        ], 
        [
            'sort' => 109, 
            'title' => 'logo', 
            'name' => 'logo', 
            'type' => 'image', 
            'options' => '', 
            'value' => '', 
            'tips' => 'API网站logo',
        ], 
    ],
];