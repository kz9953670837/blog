<?php
//配置文件
return [
    // 公共请求参数
	'request_param' => [
		[
			'name' => 'User-Token',
			'type' => 'String',
			'is_must' => '是',
			'default' => '',
			'desc' => '用户 <a href="/doc?id=1" target="_blank" style="text-decoration:underline;">登录授权</a> 成功后，颁发给应用的授权凭证',
		],
		[
			'name' => 'Access-Token',
			'type' => 'string',
			'is_must' => '是',
			'default' => '',
			'desc' => '通过 <a href="/doc?id=2" target="_blank" style="text-decoration:underline;">Access-Token接口</a> 获取到的调用凭证',
		],
		[
			'name' => 'Timestamp',
			'type' => 'string',
			'is_must' => '是',
			'default' => '',
			'desc' => '发送请求的时间，格式"yyyy-MM-dd HH:mm:ss"',
		],
		[
			'name' => 'Format',
			'type' => 'string',
			'is_must' => '否',
			'default' => 'json',
			'desc' => '响应格式。默认为json格式，可选值：xml，json',
		],
	],
];