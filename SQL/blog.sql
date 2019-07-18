/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 17/07/2019 05:15:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog_about
-- ----------------------------
DROP TABLE IF EXISTS `blog_about`;
CREATE TABLE `blog_about` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text COMMENT '关于我内容',
  `create_time` datetime NOT NULL COMMENT '发布时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_about
-- ----------------------------
BEGIN;
INSERT INTO `blog_about` VALUES (1, '这是我的第一博客网站,网站还在持续不断的迭代中', '<p><img src=\"/upload/fun/about/20190711/962be078348d6527e39ccdc39374ed4c.jpg\" alt=\"undefined\"><br></p><p>这是我的第一个博客网站,请大家多多包涵</p>\n            ', '2019-07-11 22:07:18', '2019-07-12 03:25:40');
COMMIT;

-- ----------------------------
-- Table structure for blog_api
-- ----------------------------
DROP TABLE IF EXISTS `blog_api`;
CREATE TABLE `blog_api` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '接口分组',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '接口名称',
  `method` varchar(10) NOT NULL DEFAULT '' COMMENT '请求方法(GET,POST,PUT,DELETE)',
  `module` varchar(30) NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(30) NOT NULL DEFAULT '' COMMENT '方法',
  `route_map` varchar(100) NOT NULL DEFAULT '' COMMENT '模块_控制器_方法',
  `path` varchar(100) NOT NULL DEFAULT '' COMMENT '接口地址',
  `rule` varchar(200) DEFAULT '' COMMENT '路由规则',
  `route` varchar(150) NOT NULL DEFAULT '' COMMENT '路由地址',
  `access_token` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'accessToken验证',
  `user_token` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'userToken验证',
  `version` varchar(20) NOT NULL DEFAULT 'v1' COMMENT '支持的版本号',
  `desc` varchar(255) DEFAULT '' COMMENT '接口描述',
  `return_example` text COMMENT '返回实例',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1启用，0停用)',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='[api] 接口列表';

-- ----------------------------
-- Records of blog_api
-- ----------------------------
BEGIN;
INSERT INTO `blog_api` VALUES (16, 2, '获取置顶文章列表', 'GET', 'api', 'Articles', 'index', 'api_Articles_index', 'v1/Articles', 'v1/Articles', 'api/v1.Articles', 1, 0, 'v1', '', '', 1, 1562324172, 1562760376);
INSERT INTO `blog_api` VALUES (21, 2, '根据ID获取文章列表', 'GET', 'api', 'Articles', 'read', 'api_Articles_read', 'v1/Articles/:id', 'v1/Articles', 'api/v1.Articles', 1, 0, 'v1', '', '', 1, 1562760023, 1562760023);
INSERT INTO `blog_api` VALUES (22, 3, '个人信息卡', 'GET', 'api', 'InfoCard', 'index', 'api_InfoCard_index', 'v1/InfoCard', 'v1/InfoCard', 'api/v1.InfoCard', 0, 0, 'v1', '', '', 1, 1562760230, 1562760230);
INSERT INTO `blog_api` VALUES (23, 4, '头部配置', 'GET', 'api', 'Header', 'index', 'api_Header_index', 'v1/header', 'v1/header', 'api/v1.header', 0, 0, 'v1', '', '', 1, 1562867001, 1562867032);
INSERT INTO `blog_api` VALUES (24, 5, '底部配置', 'GET', 'api', 'Footer', 'index', 'api_Footer_index', 'v1/Footer', 'v1/Footer', 'api/v1.Footer', 0, 0, 'v1', '', '', 1, 1562867344, 1562867344);
INSERT INTO `blog_api` VALUES (25, 6, '关于我', 'GET', 'api', 'About', 'index', 'api_About_index', 'v1/About', 'v1/About', 'api/v1.About', 0, 0, 'v1', '', '', 1, 1562870965, 1562870965);
COMMIT;

-- ----------------------------
-- Table structure for blog_api_app
-- ----------------------------
DROP TABLE IF EXISTS `blog_api_app`;
CREATE TABLE `blog_api_app` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属会员',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '应用分组',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '应用名称',
  `app_id` int(10) unsigned NOT NULL COMMENT '应用AppId',
  `app_secret` varchar(128) NOT NULL DEFAULT '' COMMENT '应用AppSecret',
  `site_name` varchar(50) DEFAULT '' COMMENT '网站名称',
  `site_domain` varchar(100) DEFAULT '' COMMENT '网站域名',
  `callback_domain` varchar(100) DEFAULT '' COMMENT '授权回调域',
  `desc` varchar(255) DEFAULT '' COMMENT '应用描述',
  `auth` text COMMENT '接口权限',
  `whitelist` varchar(150) NOT NULL DEFAULT '' COMMENT '访问白名单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1显示0隐藏)',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `app_id` (`app_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='[api] 应用列表';

-- ----------------------------
-- Records of blog_api_app
-- ----------------------------
BEGIN;
INSERT INTO `blog_api_app` VALUES (1, 0, 1, '测试应用', 2026668444, 'i77E7x3zQX8PH6nQP6G6p7JmWXmmZ407', '测试网站', 'api.app.50.hisiphp.test', 'http://api.app.50.hisiphp.test/index/token', '这是一个测试接口', '[\"16\",\"21\",\"22\",\"23\",\"24\",\"25\"]', '', 1, 0, 1562870978);
COMMIT;

-- ----------------------------
-- Table structure for blog_api_app_group
-- ----------------------------
DROP TABLE IF EXISTS `blog_api_app_group`;
CREATE TABLE `blog_api_app_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '分组名称',
  `desc` varchar(255) DEFAULT '' COMMENT '分组描述',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(1显示0隐藏)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='[api] 应用分组';

-- ----------------------------
-- Records of blog_api_app_group
-- ----------------------------
BEGIN;
INSERT INTO `blog_api_app_group` VALUES (1, '测试分组', '测试分组', 1);
COMMIT;

-- ----------------------------
-- Table structure for blog_api_doc
-- ----------------------------
DROP TABLE IF EXISTS `blog_api_doc`;
CREATE TABLE `blog_api_doc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '文档标题',
  `content` text NOT NULL COMMENT '文档详情',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1显示，0隐藏)',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览统计',
  `ctime` int(11) unsigned NOT NULL DEFAULT '0',
  `mtime` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blog_api_doc
-- ----------------------------
BEGIN;
INSERT INTO `blog_api_doc` VALUES (1, 14, '登录授权', '&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;-授权流程说明&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;OAuth2.0授权登录让用户使用HisiPHP身份安全登录第三方应用或网站，在HisiPHP用户授权登录已接入微信OAuth2.0的第三方应用后，第三方可以获取到用户的接口调用凭证（User-Token），通过User-Token可以进行HisiPHP开放平台授权关系接口调用，从而可实现获取HisiPHP用户基本开放信息和帮助用户实现基础开放功能等。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;OAuth2.0授权登录目前支持authorization_code模式，适用于拥有server端的应用授权。该模式整体流程为：&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;1. 第三方发起授权登录请求，HisiPHP用户允许授权第三方应用后，HisiPHP会拉起应用或重定向到第三方网站，并且带上授权临时票据code参数；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;2. 通过code参数加上AppID和AppSecret等，通过API换取User-Token；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;3. 通过User-Token进行接口调用，获取用户基本数据资源或帮助用户实现基本操作。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;-第一步：请求CODE&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;strong&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;请求方式：GET&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;strong&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;请求地址：&lt;a href=&quot;http://api.hisiphp.com/oauth/authorize&quot;&gt;http://api.hisiphp.com/oauth/authorize&lt;/a&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;strong&gt;&amp;nbsp; &amp;nbsp; 请求参数：&lt;/strong&gt;&lt;/p&gt;&lt;table&gt;&lt;tbody&gt;&lt;tr class=&quot;firstRow&quot;&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;参数&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; width=&quot;118&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;strong&gt;&amp;nbsp; &amp;nbsp; &lt;/strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;是否必须&lt;/span&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/strong&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;说明&lt;/span&gt;&lt;/strong&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;app_id&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; width=&quot;118&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;是&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;应用唯一标识&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;response_type&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; width=&quot;118&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;是&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;固定值：code&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;redirect_uri&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; align=&quot;center&quot; width=&quot;118&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;是&lt;br/&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;授权地址，请使用urlEncode对链接进行处理&amp;nbsp;&amp;nbsp;&lt;br/&gt;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;scope&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; align=&quot;center&quot; width=&quot;118&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;是&lt;br/&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;应用授权作用域，拥有多个作用域用逗号（,）分隔&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&amp;nbsp; &amp;nbsp;&lt;br/&gt;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;state&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; align=&quot;center&quot; width=&quot;118&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;是&lt;br/&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;授权请求后原样带回给第三方，该参数可用于防止csrf攻击&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;br/&gt;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;用户允许授权后，将会重定向到redirect_uri的网址上，并且带上code和state参数&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;-第二步：通过code获取User-Token&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;strong&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;请求方式：GET&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;strong&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;请求地址：&lt;a href=&quot;http://api.hisiphp.com/oauth/token&quot; target=&quot;_self&quot;&gt;http://api.hisiphp.com/oauth/token&lt;/a&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;strong&gt;&amp;nbsp; &amp;nbsp; 请求参数：&lt;/strong&gt;&lt;/p&gt;&lt;table&gt;&lt;tbody&gt;&lt;tr class=&quot;firstRow&quot;&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;参数&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/strong&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; width=&quot;118&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;是否必须&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/strong&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;说明&lt;/strong&gt;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;app_id&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot; width=&quot;118&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;是&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;text-align: -webkit-center;&quot;&gt;应用唯一标识&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;grant_type&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot; width=&quot;118&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;是&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;固定值：authorization_code&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;timestamp&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot; width=&quot;118&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;是&lt;br/&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;发送请求的时间，格式&amp;quot;yyyy-MM-dd HH:mm:ss&amp;quot;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;br/&gt;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;code&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot; width=&quot;118&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;是&lt;br/&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;填写第一步获取的code参数&amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;br/&gt;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;signature&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot; width=&quot;118&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;是&lt;br/&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;请求参数签名，&lt;/span&gt;&lt;span style=&quot;font-size: 14px; text-decoration: none; color: rgb(0, 112, 192);&quot;&gt;&lt;a href=&quot;/doc?id=4&quot; target=&quot;_self&quot;&gt;点此查看签名算法&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;br/&gt;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;- 成功返回示例&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;pre class=&quot;brush:js;toolbar:false&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{\r\n	&amp;quot;code&amp;quot;:&amp;nbsp;200,\r\n	&amp;quot;message&amp;quot;:&amp;nbsp;&amp;quot;success&amp;quot;,\r\n	&amp;quot;data&amp;quot;:&amp;nbsp;{\r\n		&amp;quot;openid&amp;quot;:&amp;nbsp;&amp;quot;FD8E157F15D6747F&amp;quot;,\r\n		&amp;quot;user_token&amp;quot;:&amp;nbsp;&amp;quot;28C52ACF66BA91B0FD8E157F15D6747F&amp;quot;,\r\n		&amp;quot;refresh_token&amp;quot;:&amp;nbsp;&amp;quot;456A2ACF66BG91B0FF8D157C15D4678E&amp;quot;,\r\n		&amp;quot;expires_in&amp;quot;:&amp;nbsp;&amp;quot;7200&amp;quot;\r\n	}\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&lt;/pre&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;table&gt;&lt;tbody&gt;&lt;tr class=&quot;firstRow&quot;&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;参数&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/strong&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;说明&lt;/strong&gt;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; align=&quot;left&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;code&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;状态码（200 正常）&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; align=&quot;left&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;message&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;结果说明，正常返回suceess&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; align=&quot;left&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;data&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;数据结果&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot; align=&quot;left&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp; └&amp;nbsp;&lt;/span&gt;openid&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;授权用户唯一标识&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot; align=&quot;left&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp; └&amp;nbsp;&lt;/span&gt;user_token&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;接口调用凭证&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot; align=&quot;left&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp; └ refresh&lt;/span&gt;_token&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;color: rgb(34, 34, 34); font-family: &quot;&gt;刷新user_token&lt;/span&gt;的调用凭证&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot; align=&quot;left&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;└&amp;nbsp;&lt;/span&gt;&lt;/span&gt;expires_in&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/span&gt;凭证有效时间，单位：秒&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;- 失败返回示例&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;pre class=&quot;brush:js;toolbar:false&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;quot;code&amp;quot;:&amp;nbsp;401,\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;quot;message&amp;quot;:&amp;nbsp;&amp;quot;Request&amp;nbsp;timed&amp;nbsp;out!&amp;quot;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&lt;/pre&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;table&gt;&lt;tbody&gt;&lt;tr class=&quot;firstRow&quot;&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;参数&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/strong&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;说明&lt;/strong&gt;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; align=&quot;left&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;code&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;状态码&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; align=&quot;left&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;message&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;返回失败原因&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;', 1, 1, 121, 1538985153, 1539936175);
INSERT INTO `blog_api_doc` VALUES (2, 14, '获取Access-Token', '&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;- 接口说明&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Access-Token是全局唯一接口调用凭据，开发者需要进行妥善保存。Access-Token的存储至少要保留128个字符空间。Access-Token的有效期为2个小时，需定时刷新，重复获取将导致上次获取的Access-Token失效。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;API调用所需的Access-Token的使用及生成方式说明：&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;1、建议开发者使用中控服务器统一获取和刷新Access-Token，其他业务逻辑服务器所使用的Access-Token均来自于该中控服务器，不应该各自去刷新，否则容易造成冲突，导致Access-Token覆盖而影响业务；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;2、目前Access-Token的有效期通过返回的expire_in来传达，目前是7200秒之内的值。中控服务器需要根据这个有效时间提前去刷新新Access-Token。在刷新过程中，中控服务器可对外继续输出的老Access-Token，此时后台会保证在5分钟内，新老Access-Token都可用，这保证了第三方业务的平滑过渡；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;3、Access-Token的有效时间可能会在未来有调整，所以中控服务器不仅需要内部定时主动刷新，还需要提供被动刷新Access-Token的接口，这样便于业务服务器在API调用获知Access-Token已超时的情况下，可以触发Access-Token的刷新流程。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;- 请求地址&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;请求方式：GET&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;请求地址：&lt;a href=&quot;http://api.hisiphp.com/oauth/token&quot;&gt;http://api.hisiphp.com/oauth/token&lt;/a&gt; &lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;- 请求参数&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;table&gt;&lt;tbody&gt;&lt;tr class=&quot;firstRow&quot;&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;参数&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/strong&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; width=&quot;118&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;是否必须&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/strong&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;说明&lt;/strong&gt;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;app_id&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot; width=&quot;118&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;是&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;grant_type&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot; width=&quot;118&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;是&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;固定值：access_token&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;timestamp&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot; width=&quot;118&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;是&lt;br/&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;发送请求的时间，格式&amp;quot;yyyy-MM-dd HH:mm:ss&amp;quot;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;br/&gt;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;signature&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot; width=&quot;118&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;是&lt;br/&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;请求参数签名，&lt;/span&gt;&lt;span style=&quot;font-size: 14px; text-decoration: none; color: rgb(0, 112, 192);&quot;&gt;&lt;a href=&quot;/doc?id=4&quot; target=&quot;_self&quot;&gt;点此查看签名算法&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;br/&gt;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;- 成功返回示例&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;pre class=&quot;brush:js;toolbar:false&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{\r\n	&amp;quot;code&amp;quot;:&amp;nbsp;200,\r\n	&amp;quot;message&amp;quot;:&amp;nbsp;&amp;quot;success&amp;quot;,\r\n	&amp;quot;data&amp;quot;:&amp;nbsp;{\r\n		&amp;quot;access_token&amp;quot;:&amp;nbsp;&amp;quot;28C52ACF66BA91B0FD8E157F15D6747F&amp;quot;,\r\n		&amp;quot;expires_in&amp;quot;:&amp;nbsp;&amp;quot;7200&amp;quot;\r\n	}\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&lt;/pre&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;table&gt;&lt;tbody&gt;&lt;tr class=&quot;firstRow&quot;&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;参数&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/strong&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;说明&lt;/strong&gt;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; align=&quot;left&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;code&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;状态码（200 正常）&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; align=&quot;left&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;message&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;结果说明，正常返回suceess&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; align=&quot;left&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;data&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;数据结果&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot; align=&quot;left&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp; └&amp;nbsp;&lt;/span&gt;access_token&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;获取到接口调用的凭证&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot; align=&quot;left&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;└&amp;nbsp;&lt;/span&gt;&lt;/span&gt;expires_in&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot; align=&quot;center&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/span&gt;凭证有效时间，单位：秒&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;- 失败返回示例&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;pre class=&quot;brush:js;toolbar:false&quot;&gt;{\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;quot;code&amp;quot;:&amp;nbsp;401,\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;quot;message&amp;quot;:&amp;nbsp;&amp;quot;Request&amp;nbsp;timed&amp;nbsp;out!&amp;quot;\r\n}&lt;/pre&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;table&gt;&lt;tbody&gt;&lt;tr class=&quot;firstRow&quot;&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;参数&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/strong&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;说明&lt;/strong&gt;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; align=&quot;left&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;code&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;状态码&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; align=&quot;left&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;height:30px;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;message&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all; border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;返回失败原因&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;', 2, 1, 207, 1538984808, 1539391353);
INSERT INTO `blog_api_doc` VALUES (3, 14, '刷新User-Token', '&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;- 接口说明&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;通过用户授权登录获取的User-Token有效期默认是3个月，过期后需要用户重新授权才能获得新的&lt;span style=&quot;font-size: 14px;&quot;&gt;User-Token&lt;/span&gt;。本步骤可以实现授权自动续期，避免要求用户再次授权的操作，提升用户体验。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;- 请求地址&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(51, 51, 51); font-family: &quot;&gt;&lt;strong&gt;请求方式：GET&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(51, 51, 51); font-family: &quot;&gt;&lt;strong&gt;请求地址：&lt;a href=&quot;http://api.hisiphp.com/oauth/token&quot; style=&quot;color: rgb(51, 51, 51); text-decoration-line: none; outline: none; cursor: pointer;&quot;&gt;http://api.hisiphp.com/oauth/token&lt;/a&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;- 请求参数&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;table&gt;&lt;tbody&gt;&lt;tr class=&quot;firstRow&quot;&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;参数&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; width=&quot;118&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;strong&gt;&amp;nbsp; &amp;nbsp; &lt;/strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;是否必须&lt;/span&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/strong&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;说明&lt;/span&gt;&lt;/strong&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;app_id&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; width=&quot;118&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;是&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;grant_type&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; width=&quot;118&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;是&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;固定值：refresh_token&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;timestamp&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; align=&quot;center&quot; width=&quot;118&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;是&lt;br/&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;发送请求的时间，格式&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;&amp;quot;yyyy-MM-dd HH:mm:ss&amp;quot;&lt;/span&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;br/&gt;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;signature&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; align=&quot;center&quot; width=&quot;118&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;是&lt;br/&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;请求参数签名，&lt;a href=&quot;/doc?id=4&quot; target=&quot;_self&quot;&gt;点此查看签名算法&lt;/a&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;br/&gt;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;refresh_token&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; align=&quot;center&quot; width=&quot;118&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;是&lt;br/&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;在获取授权登录时返回的&lt;span style=&quot;font-size: 14px; text-align: -webkit-center;&quot;&gt;refresh_token&lt;/span&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;br/&gt;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;- 成功返回示例&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;pre class=&quot;brush:js;toolbar:false&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{\r\n	&amp;quot;code&amp;quot;:&amp;nbsp;200,\r\n	&amp;quot;message&amp;quot;:&amp;nbsp;&amp;quot;success&amp;quot;,\r\n	&amp;quot;data&amp;quot;:&amp;nbsp;{\r\n		&amp;quot;user_token&amp;quot;:&amp;nbsp;&amp;quot;28C52ACF66BA91B0FD8E157F15D6747F&amp;quot;,\r\n		&amp;quot;refresh_token&amp;quot;:&amp;nbsp;&amp;quot;24V62ACF66BA91B0FD8E157F15DDF4GH&amp;quot;,\r\n		&amp;quot;expires_in&amp;quot;:&amp;nbsp;&amp;quot;7776000&amp;quot;\r\n	}\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&lt;/pre&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;table&gt;&lt;tbody&gt;&lt;tr class=&quot;firstRow&quot;&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;参数&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/strong&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;说明&lt;/span&gt;&lt;/strong&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; align=&quot;left&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;code&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;状态码（200 正常）&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; align=&quot;left&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;message&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;结果说明，正常返回suceess&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; align=&quot;left&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;data&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;数据结果&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; align=&quot;left&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp; └&amp;nbsp;&lt;/span&gt;user_token&lt;span style=&quot;text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;获取到接口调用的凭证&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; align=&quot;left&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;└&amp;nbsp;&lt;/span&gt;expires_in&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp;凭证有效时间，单位：秒&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; align=&quot;left&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;└&amp;nbsp;&lt;/span&gt;refresh_token&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp; &amp;nbsp; 在授权自动续期步骤中，获取新的Access-Token时需要提供的参数&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;- 失败返回示例&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;pre class=&quot;brush:js;toolbar:false&quot;&gt;{\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;quot;code&amp;quot;:&amp;nbsp;401,\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;quot;message&amp;quot;:&amp;nbsp;&amp;quot;Request&amp;nbsp;timed&amp;nbsp;out!&amp;quot;\r\n}&lt;/pre&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;table&gt;&lt;tbody&gt;&lt;tr class=&quot;firstRow&quot;&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;参数&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/strong&gt;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; colspan=&quot;1&quot; rowspan=&quot;1&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;说明&lt;/strong&gt;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; align=&quot;left&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;code&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;状态码&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td valign=&quot;middle&quot; align=&quot;left&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;text-align: -webkit-center;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;message&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/td&gt;&lt;td valign=&quot;middle&quot; align=&quot;center&quot; style=&quot;word-break: break-all;height:30px;border-color: rgb(221, 221, 221); border-width: 1px; border-style: solid;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;返回失败原因&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 3, 1, 103, 1538984821, 1539403984);
INSERT INTO `blog_api_doc` VALUES (4, 14, '签名规则', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;调用 &lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;/oauth/token&lt;/span&gt;&lt;/strong&gt; 接口时需要对请求参数进行签名，服务器端会验证请求参数是否合法。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;- 加密规则说明&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;strong&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/strong&gt;加密示例参数：app_id=20180101&amp;amp;grant_type=authorization_code&amp;amp;code=C155FF&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;strong&gt;&amp;nbsp; &amp;nbsp;&lt;/strong&gt;① 所有请求参数按照字母先后顺序排列&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;例如：将app_id,grant_type,code 排序为app_id,code,grant_type&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp;② 把所有参数名和参数值进行拼装，参数值为空的不参与签名(&lt;span style=&quot;font-size: 14px; color: rgb(255, 0, 0);&quot;&gt;红色为参数名&lt;/span&gt;)&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;例如：&lt;span style=&quot;font-size: 14px; color: rgb(255, 0, 0);&quot;&gt;app_id&lt;/span&gt;20180101&lt;span style=&quot;font-size: 14px; color: rgb(255, 0, 0);&quot;&gt;code&lt;/span&gt;C155FF&lt;span style=&quot;font-size: 14px; color: rgb(255, 0, 0);&quot;&gt;grant_type&lt;/span&gt;authorization_code&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp;③ 拼装加密原始字符串，把appSecret拼装在字符串的两端(&lt;span style=&quot;font-size: 14px; color: rgb(255, 0, 0);&quot;&gt;appSecret示例值：45B308&lt;/span&gt;)&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 例如：&lt;span style=&quot;font-size: 14px; color: rgb(255, 0, 0);&quot;&gt;45B308&lt;/span&gt;app_id20180101code&lt;span style=&quot;font-size: 14px;&quot;&gt;C155FF&lt;/span&gt;grant_typeauthorization_code&lt;span style=&quot;font-size: 14px; color: rgb(255, 0, 0);&quot;&gt;45B308&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;④ 使用MD5加密原始字符串，再转化成大写&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;例如：strtoupper(&lt;span style=&quot;font-size: 14px;&quot;&gt;md5(&amp;#39;&lt;/span&gt;&lt;span style=&quot;font-size: medium;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;45B308&lt;/span&gt;app_id20180101codeC155FFgrant_typeauthorization_code&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;45B308&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size: medium;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;#39;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;)&lt;/span&gt;);&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong style=&quot;white-space: normal;&quot;&gt;- PHP签名函数示例代码&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;pre class=&quot;brush:php;toolbar:false&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;/**\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;*&amp;nbsp;生成签名\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;*&amp;nbsp;@param&amp;nbsp;array&amp;nbsp;$param&amp;nbsp;要参与签名的参数\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;*&amp;nbsp;@param&amp;nbsp;string&amp;nbsp;$secert&amp;nbsp;app_secert\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;*&amp;nbsp;@return&amp;nbsp;string\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;*/\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;function&amp;nbsp;build_signature($param,&amp;nbsp;$secert)&amp;nbsp;{\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;if&amp;nbsp;(empty($param))&amp;nbsp;{\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;return&amp;nbsp;&amp;#39;&amp;#39;;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$arr&amp;nbsp;=&amp;nbsp;array_merge($param);\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;ksort($arr);\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;reset($arr);\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$str&amp;nbsp;=&amp;nbsp;&amp;#39;&amp;#39;;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;//&amp;nbsp;排除参数值为空的\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;foreach&amp;nbsp;($arr&amp;nbsp;as&amp;nbsp;$k&amp;nbsp;=&amp;gt;&amp;nbsp;$v)&amp;nbsp;{\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;if&amp;nbsp;($v&amp;nbsp;!==&amp;nbsp;&amp;#39;&amp;#39;&amp;nbsp;&amp;amp;&amp;amp;&amp;nbsp;trim($v)&amp;nbsp;!==&amp;nbsp;&amp;#39;&amp;#39;)&amp;nbsp;{\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$str&amp;nbsp;.=&amp;nbsp;$k.$v;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;return&amp;nbsp;strtoupper(md5($secert.$str.$secert));\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&lt;/pre&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;strong style=&quot;white-space: normal;&quot;&gt;&lt;/strong&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;', 4, 1, 121, 1538984150, 1539219129);
COMMIT;

-- ----------------------------
-- Table structure for blog_api_doc_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_api_doc_category`;
CREATE TABLE `blog_api_doc_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(1显示0隐藏)',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='[api] 文档分类';

-- ----------------------------
-- Records of blog_api_doc_category
-- ----------------------------
BEGIN;
INSERT INTO `blog_api_doc_category` VALUES (14, 0, '快速接入', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for blog_api_error_code
-- ----------------------------
DROP TABLE IF EXISTS `blog_api_error_code`;
CREATE TABLE `blog_api_error_code` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属接口',
  `code` int(8) unsigned NOT NULL COMMENT '错误代码',
  `desc` varchar(200) NOT NULL DEFAULT '' COMMENT '错误说明',
  `solution` varchar(255) DEFAULT '' COMMENT '解决方案',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='[api] 接口错误码';

-- ----------------------------
-- Table structure for blog_api_group
-- ----------------------------
DROP TABLE IF EXISTS `blog_api_group`;
CREATE TABLE `blog_api_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '分组名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1显示，0隐藏)',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `desc` varchar(255) DEFAULT '' COMMENT '分组描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blog_api_group
-- ----------------------------
BEGIN;
INSERT INTO `blog_api_group` VALUES (2, '文章列表', 1, 0, '');
INSERT INTO `blog_api_group` VALUES (3, '个人信息卡', 1, 0, '');
INSERT INTO `blog_api_group` VALUES (4, '头部配置', 1, 0, '');
INSERT INTO `blog_api_group` VALUES (5, '底部配置', 1, 0, '');
INSERT INTO `blog_api_group` VALUES (6, '关于我', 1, 0, '');
COMMIT;

-- ----------------------------
-- Table structure for blog_api_param
-- ----------------------------
DROP TABLE IF EXISTS `blog_api_param`;
CREATE TABLE `blog_api_param` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `api_id` int(11) NOT NULL DEFAULT '0' COMMENT '应用ID',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '参数类型(1请求参数，2返回参数)',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '参数名称',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT 'TP5验证规则',
  `data_type` varchar(20) NOT NULL DEFAULT 'String' COMMENT '数据类型（wiki用）',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必须（wiki用）',
  `value` varchar(100) DEFAULT '' COMMENT '默认值（wiki用）',
  `desc` varchar(250) DEFAULT '' COMMENT '参数说明',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1显示，0隐藏)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='[api] 接口请求参数';

-- ----------------------------
-- Table structure for blog_api_token
-- ----------------------------
DROP TABLE IF EXISTS `blog_api_token`;
CREATE TABLE `blog_api_token` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `app_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型(1 access_token,2 user_token,3 refresh_token)',
  `token` varchar(128) NOT NULL DEFAULT '' COMMENT 'token',
  `data` text NOT NULL COMMENT '数据',
  `expires` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '到期时间,0永久',
  `ctime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `token` (`token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1091 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blog_api_token
-- ----------------------------
BEGIN;
INSERT INTO `blog_api_token` VALUES (1090, 0, 2026668444, 1, '6A563849124A64D66FA6E6DBE917D98D', '{\"app_id\":2026668444}', 1563318879, 1563311679);
COMMIT;

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_cate_id` int(11) unsigned NOT NULL COMMENT '标记',
  `is_top` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶\r\n0-不置顶\r\n1-置顶',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `author` varchar(128) DEFAULT NULL COMMENT '作者',
  `intro_id` int(11) unsigned NOT NULL COMMENT '引言',
  `content_id` int(11) unsigned NOT NULL COMMENT '内容',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `update_time` datetime NOT NULL COMMENT '更新日期',
  `delete_time` datetime DEFAULT NULL COMMENT '软删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
BEGIN;
INSERT INTO `blog_article` VALUES (1, 1, 0, '4444', '文章作者', 1, 1, '2019-07-03 15:54:04', '2019-07-10 22:52:09', '2019-07-10 22:52:09');
INSERT INTO `blog_article` VALUES (2, 22, 0, '3333', '文章作者', 2, 2, '2019-07-03 17:50:03', '2019-07-10 22:52:12', '2019-07-10 22:52:12');
INSERT INTO `blog_article` VALUES (3, 1, 0, '2222', '文章引言', 3, 3, '2019-07-03 18:40:33', '2019-07-10 22:52:14', '2019-07-10 22:52:14');
INSERT INTO `blog_article` VALUES (4, 1, 1, '11111', '文章作者', 4, 4, '2019-07-03 18:41:43', '2019-07-10 22:52:15', '2019-07-10 22:52:15');
INSERT INTO `blog_article` VALUES (5, 2, 1, '创建ThinkPHP项目', 'upchen', 5, 5, '2019-07-10 23:12:45', '2019-07-13 03:11:15', NULL);
INSERT INTO `blog_article` VALUES (6, 26, 1, '文章标题', '', 6, 6, '2019-07-12 03:47:28', '2019-07-13 00:10:58', '2019-07-13 00:10:58');
INSERT INTO `blog_article` VALUES (7, 2, 0, '文章标题', '', 11, 11, '2019-07-13 00:16:54', '2019-07-13 01:36:59', '2019-07-13 01:36:59');
INSERT INTO `blog_article` VALUES (8, 2, 0, '文章标题', '', 13, 13, '2019-07-13 01:40:24', '2019-07-13 01:40:33', '2019-07-13 01:40:33');
INSERT INTO `blog_article` VALUES (9, 2, 0, '文章标题', '', 14, 14, '2019-07-13 01:44:54', '2019-07-13 01:45:02', '2019-07-13 01:45:02');
INSERT INTO `blog_article` VALUES (10, 2, 0, '文章标题', '', 15, 15, '2019-07-13 01:46:06', '2019-07-13 01:46:09', '2019-07-13 01:46:09');
INSERT INTO `blog_article` VALUES (11, 2, 1, '文章标题', '', 16, 16, '2019-07-13 02:14:22', '2019-07-13 02:42:59', '2019-07-13 02:42:59');
INSERT INTO `blog_article` VALUES (12, 2, 1, '文章标题', '', 17, 17, '2019-07-13 02:15:23', '2019-07-13 02:43:00', '2019-07-13 02:43:00');
COMMIT;

-- ----------------------------
-- Table structure for blog_article_cate
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_cate`;
CREATE TABLE `blog_article_cate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(128) NOT NULL COMMENT '类别名称',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blog_article_cate
-- ----------------------------
BEGIN;
INSERT INTO `blog_article_cate` VALUES (2, 'php', 0);
INSERT INTO `blog_article_cate` VALUES (26, 'vue', 0);
COMMIT;

-- ----------------------------
-- Table structure for blog_article_content
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_content`;
CREATE TABLE `blog_article_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blog_article_content
-- ----------------------------
BEGIN;
INSERT INTO `blog_article_content` VALUES (1, '<p><span style=\"text-align: right;\">文章内容</span></p><p><span style=\"text-align: right;\"><img src=\"\\upload\\fun\\article\\20190703\\003083ebddc7599b0176689db4d06d60.jpg\" alt=\"undefined\"><br></span></p>');
INSERT INTO `blog_article_content` VALUES (2, '<p><span style=\"text-align: right;\">文章内容</span></p><p><span style=\"text-align: right;\"><img src=\"\\upload\\fun\\article\\20190703\\16359def57f233b76f1566c863d90732.jpg\" alt=\"undefined\"><br></span></p>');
INSERT INTO `blog_article_content` VALUES (3, '<p><span style=\"text-align: right;\">文章引言</span></p><p><span style=\"text-align: right;\"><img src=\"/upload/fun/article/20190709/cf4e363869b2e42e6a060ac7cfa6e12d.jpg\" alt=\"undefined\"><br></span></p>');
INSERT INTO `blog_article_content` VALUES (4, '<p style=\"text-align: center;\"><img src=\"https://ss.csdn.net/p?https://mmbiz.qpic.cn/mmbiz_jpg/W9YcQcK245ajzptZd7LTDWxYs91nUHUXMB2zH2bjxUo4EkfctiaXQEx9bnz6iaeRWv1O4R7AcArbKBDX5Qbfe4Ag/640?wx_fmt=jpeg\" alt=\"640?wx_fmt=jpeg\"></p><p style=\"text-align: center;\"><br></p><p><span></span></p><p class=\"ql-long-6595630\"><span>当你一路过关斩将，终于通过面试，</span></p><p class=\"ql-long-6595630\"><span>成功进入互联网公司工作时，周围会有各种羡慕的目光：</span></p><p><span> </span></p><p class=\"ql-long-6595630\"><span><span class=\"ql-author-6595630\"><span>看呐，</span>这就是被互联网公司选中的天之骄子!</span><span class=\"ql-author-6595630\"></span></span></p><p class=\"ql-long-6595630\"><span><span class=\"ql-author-6595630\"><br></span></span></p><p class=\"ql-long-6595630\"><span>一举手一投足是多么的风光！</span></p><p class=\"ql-long-6595630\"><span><br></span></p><p class=\"ql-long-6595630\"><span>但<span>人前高光</span>过后，是只有自己才知道的<span>人后崩溃</span>时刻：</span></p>');
INSERT INTO `blog_article_content` VALUES (5, '<p>1.创建php项目test</p><p>我使用zend studio创建后，项目下默认有index.php</p><p><br></p><p>2.导入ThinkPHP</p><p>下载thinkphp，然后将thinkphp文件夹复制到项目中，与index.php同级</p><p></p><pre lay-lang=\"PHP\">define(\'APP_DEBUG\', TRUE);\ndefine(\'APP_NAME\', \'App\');\ndefine(\'APP_PATH\', \'./App/\');\nrequire \'./ThinkPHP/ThinkPHP.php\';</pre><p></p><p><span style=\"background-color: rgb(242, 242, 242); color: rgb(51, 51, 51);\">4.测试</span></p><p></p><p>然后打开服务器，访问该项目，出现以下界面，说明thinkphp导入成功</p><p><img src=\"/upload/fun/article/20190710/62f651447bbdab2eb354a8c852fdeaf7.jpg\" alt=\"undefined\"><br></p><p><span>回到zend studio，刷新，发现多了个App文件夹，就是我们刚刚在入口文件中配置的APP_NAME和APP_PATH</span></p><p><span><img src=\"/upload/fun/article/20190710/2cd184ffd9744b31fac3172e8290ee04.jpg\" alt=\"undefined\"><br></span></p><p><span>App目录结构如下：</span></p><p><span><img src=\"/upload/fun/article/20190710/76c58cd24c3f08f2f7619624abfae6fc.jpg\" alt=\"undefined\"><br></span></p><p><span>刚刚我们访问index.php其实就是访问上图中/Home/Controller下的IndexController中的index方法，我们可以更改其内容试试</span></p><p><span><img src=\"/upload/fun/article/20190710/4b5e34fec8ed26aa2f21853885cb80a4.jpg\" alt=\"undefined\"><br></span></p><p><span><img src=\"/upload/fun/article/20190710/84adb011dabd05e086baf57424ba8275.jpg\" alt=\"undefined\"><br></span></p>');
INSERT INTO `blog_article_content` VALUES (6, '<p><span class=\"layui-badge-dot\" style=\"text-align: center;\"></span><span style=\"text-align: right;\"> 文章引言</span><span class=\"layui-badge-dot\" style=\"text-align: center;\"></span><span style=\"text-align: right;\"> 文章引言</span><span class=\"layui-badge-dot\" style=\"text-align: center;\"></span><span style=\"text-align: right;\"> 文章引言111</span></p><span class=\"layui-badge-dot\" style=\"text-align: center;\"></span>');
INSERT INTO `blog_article_content` VALUES (11, '<p><span style=\"text-align: right;\">文章标题</span></p>');
INSERT INTO `blog_article_content` VALUES (13, '<p><span style=\"text-align: right;\">文章引言</span></p>');
INSERT INTO `blog_article_content` VALUES (14, '<p><span style=\"text-align: right;\">文章引言</span></p>');
INSERT INTO `blog_article_content` VALUES (15, '<p><span style=\"text-align: right;\">文章引言</span></p>');
INSERT INTO `blog_article_content` VALUES (16, '<p><span style=\"text-align: right;\">文章标题</span></p>');
INSERT INTO `blog_article_content` VALUES (17, '<p><span style=\"text-align: right;\">文章标题111</span></p>');
COMMIT;

-- ----------------------------
-- Table structure for blog_article_intro
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_intro`;
CREATE TABLE `blog_article_intro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intro` text NOT NULL COMMENT '引言',
  `intro_image` varchar(255) DEFAULT NULL COMMENT '引言图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blog_article_intro
-- ----------------------------
BEGIN;
INSERT INTO `blog_article_intro` VALUES (1, '文章引言', '/upload/fun/article/20190708/ffa02c01725f147978f8fb44451a46bc.jpg');
INSERT INTO `blog_article_intro` VALUES (2, '文章引言111', '/upload/fun/article/20190708/70deb5c67ea1b04c945c153e0db1e810.jpg');
INSERT INTO `blog_article_intro` VALUES (3, '2222', '/upload/fun/article/20190708/4b331b0580646ff99a14dbeffd7995de.jpg');
INSERT INTO `blog_article_intro` VALUES (4, '文章引言11', '/upload/fun/article/20190709/e9f0650e2b6040094e5ea42eb5fb2b93.jpg');
INSERT INTO `blog_article_intro` VALUES (5, 'thinkphp是单一入口的php框架，现在我们来创建一个thinkphp项目。', NULL);
INSERT INTO `blog_article_intro` VALUES (6, '文章引言11', NULL);
INSERT INTO `blog_article_intro` VALUES (11, '文章标题', NULL);
INSERT INTO `blog_article_intro` VALUES (13, '文章引言', NULL);
INSERT INTO `blog_article_intro` VALUES (14, '文章引言', NULL);
INSERT INTO `blog_article_intro` VALUES (15, '文章引言', NULL);
INSERT INTO `blog_article_intro` VALUES (16, '文章标题', NULL);
INSERT INTO `blog_article_intro` VALUES (17, '文章标题', NULL);
COMMIT;

-- ----------------------------
-- Table structure for blog_developer_versions
-- ----------------------------
DROP TABLE IF EXISTS `blog_developer_versions`;
CREATE TABLE `blog_developer_versions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型：1模块，2插件，3模板',
  `app_name` varchar(100) NOT NULL DEFAULT '' COMMENT '应用code',
  `app_version` varchar(30) NOT NULL DEFAULT '' COMMENT '应用版本号',
  `update_log` text COMMENT '应用更新日志',
  `update_file` text COMMENT '更新文件记录',
  `delete_file` text COMMENT '删除文件记录',
  `update_sql` text COMMENT '更新sql',
  `install_package` varchar(255) DEFAULT '' COMMENT '安装包',
  `upgrade_package` varchar(255) DEFAULT '' COMMENT '升级包',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发布状态：1已发布，0待发布',
  `ctime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='[开发助手] 版本记录';

-- ----------------------------
-- Table structure for blog_footer
-- ----------------------------
DROP TABLE IF EXISTS `blog_footer`;
CREATE TABLE `blog_footer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `footer_text` varchar(255) NOT NULL COMMENT '底部文字',
  `icon` varchar(255) NOT NULL COMMENT 'icon样式',
  `icon_link` varchar(255) DEFAULT NULL COMMENT 'icon链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blog_footer
-- ----------------------------
BEGIN;
INSERT INTO `blog_footer` VALUES (1, '感谢大伙的强力支持', 'el-icon-user', 'https://element.eleme.io/#/zh-CN/component/icon');
COMMIT;

-- ----------------------------
-- Table structure for blog_header
-- ----------------------------
DROP TABLE IF EXISTS `blog_header`;
CREATE TABLE `blog_header` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '头部标题',
  `subhead` varchar(255) DEFAULT NULL COMMENT '头部副标题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_header
-- ----------------------------
BEGIN;
INSERT INTO `blog_header` VALUES (1, '技术陈', '什么都喜欢');
COMMIT;

-- ----------------------------
-- Table structure for blog_info_card
-- ----------------------------
DROP TABLE IF EXISTS `blog_info_card`;
CREATE TABLE `blog_info_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `info_name` varchar(128) NOT NULL COMMENT '关于我自己姓名',
  `info_desc` varchar(255) NOT NULL COMMENT '关于我自己描述',
  `info_image` varchar(255) NOT NULL COMMENT '关于我自己头像',
  `info_git` varchar(255) DEFAULT NULL COMMENT '关于我github地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blog_info_card
-- ----------------------------
BEGIN;
INSERT INTO `blog_info_card` VALUES (1, '技术陈', '大家好,我是PHP程序员技术陈', '/upload/fun/about/20190710/a0dd05923c2aa7397b1b98bdf3d5a9bf.jpg', 'https://github.com/yyx990803');
COMMIT;

-- ----------------------------
-- Table structure for blog_jobs
-- ----------------------------
DROP TABLE IF EXISTS `blog_jobs`;
CREATE TABLE `blog_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for blog_system_annex
-- ----------------------------
DROP TABLE IF EXISTS `blog_system_annex`;
CREATE TABLE `blog_system_annex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联的数据ID',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '类型',
  `group` varchar(100) NOT NULL DEFAULT 'sys' COMMENT '文件分组',
  `file` varchar(255) NOT NULL COMMENT '上传文件',
  `hash` varchar(64) NOT NULL COMMENT '文件hash值',
  `size` decimal(12,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '附件大小KB',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '使用状态(0未使用，1已使用)',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `hash` (`hash`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='[系统] 上传附件';

-- ----------------------------
-- Table structure for blog_system_annex_group
-- ----------------------------
DROP TABLE IF EXISTS `blog_system_annex_group`;
CREATE TABLE `blog_system_annex_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '附件分组',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `size` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '附件大小kb',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='[系统] 附件分组';

-- ----------------------------
-- Table structure for blog_system_config
-- ----------------------------
DROP TABLE IF EXISTS `blog_system_config`;
CREATE TABLE `blog_system_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统配置(1是，0否)',
  `group` varchar(20) NOT NULL DEFAULT 'base' COMMENT '分组',
  `title` varchar(20) NOT NULL COMMENT '配置标题',
  `name` varchar(50) NOT NULL COMMENT '配置名称，由英文字母和下划线组成',
  `value` text NOT NULL COMMENT '配置值',
  `type` varchar(20) NOT NULL DEFAULT 'input' COMMENT '配置类型()',
  `options` text NOT NULL COMMENT '配置项(选项名:选项值)',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文件上传接口',
  `tips` varchar(255) NOT NULL COMMENT '配置提示',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='[系统] 系统配置';

-- ----------------------------
-- Records of blog_system_config
-- ----------------------------
BEGIN;
INSERT INTO `blog_system_config` VALUES (1, 1, 'sys', '扩展配置分组', 'config_group', '', 'array', ' ', '', '请按如下格式填写：&lt;br&gt;键值:键名&lt;br&gt;键值:键名&lt;br&gt;&lt;span style=&quot;color:#f00&quot;&gt;键值只能为英文、数字、下划线&lt;/span&gt;', 2, 1, 1492140215, 1492140215);
INSERT INTO `blog_system_config` VALUES (13, 1, 'base', '网站域名', 'site_domain', '', 'input', '', '', '', 2, 1, 1492140215, 1492140215);
INSERT INTO `blog_system_config` VALUES (14, 1, 'upload', '图片上传大小限制', 'upload_image_size', '0', 'input', '', '', '单位：KB，0表示不限制大小', 3, 1, 1490841797, 1491040778);
INSERT INTO `blog_system_config` VALUES (15, 1, 'upload', '允许上传图片格式', 'upload_image_ext', 'jpg,png,gif,jpeg,ico', 'input', '', '', '多个格式请用英文逗号（,）隔开', 4, 1, 1490842130, 1491040778);
INSERT INTO `blog_system_config` VALUES (16, 1, 'upload', '缩略图裁剪方式', 'thumb_type', '2', 'select', '1:等比例缩放\r\n2:缩放后填充\r\n3:居中裁剪\r\n4:左上角裁剪\r\n5:右下角裁剪\r\n6:固定尺寸缩放\r\n', '', '', 5, 1, 1490842450, 1491040778);
INSERT INTO `blog_system_config` VALUES (17, 1, 'upload', '图片水印开关', 'image_watermark', '1', 'switch', '0:关闭\r\n1:开启', '', '', 6, 1, 1490842583, 1491040778);
INSERT INTO `blog_system_config` VALUES (18, 1, 'upload', '图片水印图', 'image_watermark_pic', '', 'image', '', '', '', 7, 1, 1490842679, 1491040778);
INSERT INTO `blog_system_config` VALUES (19, 1, 'upload', '图片水印透明度', 'image_watermark_opacity', '50', 'input', '', '', '可设置值为0~100，数字越小，透明度越高', 8, 1, 1490857704, 1491040778);
INSERT INTO `blog_system_config` VALUES (20, 1, 'upload', '图片水印图位置', 'image_watermark_location', '9', 'select', '7:左下角\r\n1:左上角\r\n4:左居中\r\n9:右下角\r\n3:右上角\r\n6:右居中\r\n2:上居中\r\n8:下居中\r\n5:居中', '', '', 9, 1, 1490858228, 1491040778);
INSERT INTO `blog_system_config` VALUES (21, 1, 'upload', '文件上传大小限制', 'upload_file_size', '0', 'input', '', '', '单位：KB，0表示不限制大小', 1, 1, 1490859167, 1491040778);
INSERT INTO `blog_system_config` VALUES (22, 1, 'upload', '允许上传文件格式', 'upload_file_ext', 'doc,docx,xls,xlsx,ppt,pptx,pdf,wps,txt,rar,zip', 'input', '', '', '多个格式请用英文逗号（,）隔开', 2, 1, 1490859246, 1491040778);
INSERT INTO `blog_system_config` VALUES (23, 1, 'upload', '文字水印开关', 'text_watermark', '0', 'switch', '0:关闭\r\n1:开启', '', '', 10, 1, 1490860872, 1491040778);
INSERT INTO `blog_system_config` VALUES (24, 1, 'upload', '文字水印内容', 'text_watermark_content', '', 'input', '', '', '', 11, 1, 1490861005, 1491040778);
INSERT INTO `blog_system_config` VALUES (25, 1, 'upload', '文字水印字体', 'text_watermark_font', '', 'file', '', '', '不上传将使用系统默认字体', 12, 1, 1490861117, 1491040778);
INSERT INTO `blog_system_config` VALUES (26, 1, 'upload', '文字水印字体大小', 'text_watermark_size', '20', 'input', '', '', '单位：px(像素)', 13, 1, 1490861204, 1491040778);
INSERT INTO `blog_system_config` VALUES (27, 1, 'upload', '文字水印颜色', 'text_watermark_color', '#000000', 'input', '', '', '文字水印颜色，格式:#000000', 14, 1, 1490861482, 1491040778);
INSERT INTO `blog_system_config` VALUES (28, 1, 'upload', '文字水印位置', 'text_watermark_location', '7', 'select', '7:左下角\r\n1:左上角\r\n4:左居中\r\n9:右下角\r\n3:右上角\r\n6:右居中\r\n2:上居中\r\n8:下居中\r\n5:居中', '', '', 11, 1, 1490861718, 1491040778);
INSERT INTO `blog_system_config` VALUES (29, 1, 'upload', '缩略图尺寸', 'thumb_size', '300x300;500x500', 'input', '', '', '为空则不生成，生成 500x500 的缩略图，则填写 500x500，多个规格填写参考 300x300;500x500;800x800', 4, 1, 1490947834, 1491040778);
INSERT INTO `blog_system_config` VALUES (30, 1, 'sys', '开发模式', 'app_debug', '1', 'switch', '0:关闭\r\n1:开启', '', '&lt;strong class=&quot;red&quot;&gt;生产环境下一定要关闭此配置&lt;/strong&gt;', 3, 1, 1491005004, 1492093874);
INSERT INTO `blog_system_config` VALUES (31, 1, 'sys', '页面Trace', 'app_trace', '1', 'switch', '0:关闭\r\n1:开启', '', '&lt;strong class=&quot;red&quot;&gt;生产环境下一定要关闭此配置&lt;/strong&gt;', 4, 1, 1491005081, 1492093874);
INSERT INTO `blog_system_config` VALUES (33, 1, 'sys', '富文本编辑器', 'editor', 'umeditor', 'select', 'ueditor:UEditor\r\numeditor:UMEditor\r\nkindeditor:KindEditor\r\nckeditor:CKEditor', '', '', 0, 1, 1491142648, 1492140215);
INSERT INTO `blog_system_config` VALUES (35, 1, 'databases', '备份目录', 'backup_path', './backup/database/', 'input', '', '', '数据库备份路径,路径必须以 / 结尾', 0, 1, 1491881854, 1491965974);
INSERT INTO `blog_system_config` VALUES (36, 1, 'databases', '备份分卷大小', 'part_size', '20971520', 'input', '', '', '用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 0, 1, 1491881975, 1491965974);
INSERT INTO `blog_system_config` VALUES (37, 1, 'databases', '备份压缩开关', 'compress', '1', 'switch', '0:关闭\r\n1:开启', '', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 0, 1, 1491882038, 1491965974);
INSERT INTO `blog_system_config` VALUES (38, 1, 'databases', '备份压缩级别', 'compress_level', '4', 'radio', '1:最低\r\n4:一般\r\n9:最高', '', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 0, 1, 1491882154, 1491965974);
INSERT INTO `blog_system_config` VALUES (39, 1, 'base', '网站状态', 'site_status', '1', 'switch', '0:关闭\r\n1:开启', '', '站点关闭后将不能访问，后台可正常登录', 1, 1, 1492049460, 1494690024);
INSERT INTO `blog_system_config` VALUES (40, 1, 'sys', '后台管理路径', 'admin_path', 'admin.php', 'input', '', '', '必须以.php为后缀', 1, 1, 1492139196, 1492140215);
INSERT INTO `blog_system_config` VALUES (41, 1, 'base', '网站标题', 'site_title', '技术胖', 'input', '', '', '网站标题是体现一个网站的主旨，要做到主题突出、标题简洁、连贯等特点，建议不超过28个字', 6, 1, 1492502354, 1494695131);
INSERT INTO `blog_system_config` VALUES (42, 1, 'base', '网站关键词', 'site_keywords', '技术胖', 'input', '', '', '网页内容所包含的核心搜索关键词，多个关键字请用英文逗号&quot;,&quot;分隔', 7, 1, 1494690508, 1494690780);
INSERT INTO `blog_system_config` VALUES (43, 1, 'base', '网站描述', 'site_description', '', 'textarea', '', '', '网页的描述信息，搜索引擎采纳后，作为搜索结果中的页面摘要显示，建议不超过80个字', 8, 1, 1494690669, 1494691075);
INSERT INTO `blog_system_config` VALUES (44, 1, 'base', 'ICP备案信息', 'site_icp', '', 'input', '', '', '请填写ICP备案号，用于展示在网站底部，ICP备案官网：&lt;a href=&quot;http://www.miibeian.gov.cn&quot; target=&quot;_blank&quot;&gt;http://www.miibeian.gov.cn&lt;/a&gt;', 9, 1, 1494691721, 1494692046);
INSERT INTO `blog_system_config` VALUES (45, 1, 'base', '站点统计代码', 'site_statis', '', 'textarea', '', '', '第三方流量统计代码，前台调用时请先用 htmlspecialchars_decode函数转义输出', 10, 1, 1494691959, 1494694797);
INSERT INTO `blog_system_config` VALUES (46, 1, 'base', '网站名称', 'site_name', '技术胖', 'input', '', '', '将显示在浏览器窗口标题等位置', 3, 1, 1494692103, 1494694680);
INSERT INTO `blog_system_config` VALUES (47, 1, 'base', '网站LOGO', 'site_logo', '', 'image', '', '', '网站LOGO图片', 4, 1, 1494692345, 1494693235);
INSERT INTO `blog_system_config` VALUES (48, 1, 'base', '网站图标', 'site_favicon', '', 'image', '', '/system/annex/favicon', '又叫网站收藏夹图标，它显示位于浏览器的地址栏或者标题前面，&lt;strong class=&quot;red&quot;&gt;.ico格式&lt;/strong&gt;，&lt;a href=&quot;https://www.baidu.com/s?ie=UTF-8&amp;wd=favicon&quot; target=&quot;_blank&quot;&gt;点此了解网站图标&lt;/a&gt;', 5, 1, 1494692781, 1494693966);
INSERT INTO `blog_system_config` VALUES (49, 1, 'base', '手机网站', 'wap_site_status', '0', 'switch', '0:关闭\r\n1:开启', '', '如果有手机网站，请设置为开启状态，否则只显示PC网站', 2, 1, 1498405436, 1498405436);
INSERT INTO `blog_system_config` VALUES (50, 1, 'sys', '云端推送', 'cloud_push', '0', 'switch', '0:关闭\r\n1:开启', '', '关闭之后，无法通过云端推送安装扩展', 5, 1, 1504250320, 1504250320);
INSERT INTO `blog_system_config` VALUES (51, 1, 'base', '手机网站域名', 'wap_domain', '', 'input', '', '', '手机访问将自动跳转至此域名', 2, 1, 1504304776, 1504304837);
INSERT INTO `blog_system_config` VALUES (52, 1, 'sys', '多语言支持', 'multi_language', '0', 'switch', '0:关闭\r\n1:开启', '', '开启后你可以自由上传多种语言包', 6, 1, 1506532211, 1506532211);
INSERT INTO `blog_system_config` VALUES (53, 1, 'sys', '后台白名单验证', 'admin_whitelist_verify', '0', 'switch', '0:禁用\r\n1:启用', '', '禁用后不存在的菜单节点将不在提示', 7, 1, 1542012232, 1542012321);
INSERT INTO `blog_system_config` VALUES (54, 1, 'sys', '系统日志保留', 'system_log_retention', '30', 'input', '', '', '单位天，系统将自动清除 ? 天前的系统日志', 8, 1, 1542013958, 1542014158);
INSERT INTO `blog_system_config` VALUES (55, 1, 'upload', '上传驱动', 'upload_driver', 'local', 'select', 'local:本地上传', '', '资源上传驱动设置', 0, 1, 1558599270, 1558618703);
COMMIT;

-- ----------------------------
-- Table structure for blog_system_hook
-- ----------------------------
DROP TABLE IF EXISTS `blog_system_hook`;
CREATE TABLE `blog_system_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '系统插件',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `source` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子来源[plugins.插件名，module.模块名]',
  `intro` varchar(200) NOT NULL DEFAULT '' COMMENT '钩子简介',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='[系统] 钩子表';

-- ----------------------------
-- Records of blog_system_hook
-- ----------------------------
BEGIN;
INSERT INTO `blog_system_hook` VALUES (1, 1, 'system_admin_index', '', '后台首页', 1, 1490885108, 1490885108);
INSERT INTO `blog_system_hook` VALUES (2, 1, 'system_admin_tips', '', '后台所有页面提示', 1, 1490713165, 1490885137);
INSERT INTO `blog_system_hook` VALUES (3, 1, 'system_annex_upload', '', '附件上传钩子，可扩展上传到第三方存储', 1, 1490884242, 1490885121);
INSERT INTO `blog_system_hook` VALUES (4, 1, 'system_member_login', '', '会员登陆成功之后的动作', 1, 1490885108, 1490885108);
INSERT INTO `blog_system_hook` VALUES (5, 1, 'system_member_register', '', '会员注册成功后的动作', 1, 1512610518, 1512610518);
INSERT INTO `blog_system_hook` VALUES (6, 0, 'user_login', 'module.user', '会员登陆成功之后的动作', 1, 1563310876, 1563310876);
INSERT INTO `blog_system_hook` VALUES (7, 0, 'user_register', 'module.user', '会员注册成功后的动作', 1, 1563310876, 1563310876);
INSERT INTO `blog_system_hook` VALUES (8, 0, 'user_delete', 'module.user', '会员删除成功后的动作', 1, 1563310876, 1563310876);
COMMIT;

-- ----------------------------
-- Table structure for blog_system_hook_plugins
-- ----------------------------
DROP TABLE IF EXISTS `blog_system_hook_plugins`;
CREATE TABLE `blog_system_hook_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hook` varchar(32) NOT NULL COMMENT '钩子id',
  `plugins` varchar(32) NOT NULL COMMENT '插件标识',
  `ctime` int(11) unsigned NOT NULL DEFAULT '0',
  `mtime` int(11) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='[系统] 钩子-插件对应表';

-- ----------------------------
-- Records of blog_system_hook_plugins
-- ----------------------------
BEGIN;
INSERT INTO `blog_system_hook_plugins` VALUES (1, 'system_admin_index', 'hisiphp', 1509380301, 1509380301, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for blog_system_language
-- ----------------------------
DROP TABLE IF EXISTS `blog_system_language`;
CREATE TABLE `blog_system_language` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '语言包名称',
  `code` varchar(20) NOT NULL DEFAULT '' COMMENT '编码',
  `locale` varchar(255) NOT NULL DEFAULT '' COMMENT '本地浏览器语言编码',
  `icon` varchar(30) NOT NULL DEFAULT '' COMMENT '图标',
  `pack` varchar(100) NOT NULL DEFAULT '' COMMENT '上传的语言包',
  `sort` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='[系统] 语言包';

-- ----------------------------
-- Records of blog_system_language
-- ----------------------------
BEGIN;
INSERT INTO `blog_system_language` VALUES (1, '简体中文', 'zh-cn', 'zh-CN,zh-CN.UTF-8,zh-cn', '', '1', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for blog_system_log
-- ----------------------------
DROP TABLE IF EXISTS `blog_system_log`;
CREATE TABLE `blog_system_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) DEFAULT '',
  `url` varchar(200) DEFAULT '',
  `param` text,
  `remark` varchar(255) DEFAULT '',
  `count` int(10) unsigned NOT NULL DEFAULT '1',
  `ip` varchar(128) DEFAULT '',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=323 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='[系统] 操作日志';

-- ----------------------------
-- Records of blog_system_log
-- ----------------------------
BEGIN;
INSERT INTO `blog_system_log` VALUES (1, 1, '后台首页', '/admin.php/system/index/index.html', '[]', '浏览数据', 71, '::1', 1561551719, 1562956658);
INSERT INTO `blog_system_log` VALUES (2, 1, '本地模块', '/admin.php/system/module/index.html', '[]', '浏览数据', 21, '::1', 1561551727, 1562847936);
INSERT INTO `blog_system_log` VALUES (3, 1, '应用市场', '/admin.php/system/store/index.html', '[]', '浏览数据', 16, '10.9.17.58', 1561551728, 1562326314);
INSERT INTO `blog_system_log` VALUES (4, 1, '应用市场', '/admin.php/system/store/index.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', 15, '10.9.17.58', 1561551739, 1562326314);
INSERT INTO `blog_system_log` VALUES (5, 1, '系统菜单', '/admin.php/system/menu/index.html', '[]', '浏览数据', 80, '::1', 1561551757, 1562947740);
INSERT INTO `blog_system_log` VALUES (6, 1, '系统设置', '/admin.php/system/system/index.html', '[]', '浏览数据', 12, '::1', 1561551759, 1562947744);
INSERT INTO `blog_system_log` VALUES (7, 1, '配置管理', '/admin.php/system/config/index.html', '[]', '浏览数据', 8, '::1', 1561551783, 1562947743);
INSERT INTO `blog_system_log` VALUES (8, 1, '配置管理', '/admin.php/system/config/index.html?page=1&limit=20', '{\"page\":\"1\",\"limit\":\"20\"}', '浏览数据', 8, '::1', 1561551784, 1562947743);
INSERT INTO `blog_system_log` VALUES (9, 1, '系统管理员', '/admin.php/system/user/index.html', '[]', '浏览数据', 12, '::1', 1561551786, 1562947742);
INSERT INTO `blog_system_log` VALUES (10, 1, '系统管理员', '/admin.php/system/user/index.html?page=1&limit=20', '{\"page\":\"1\",\"limit\":\"20\"}', '浏览数据', 11, '::1', 1561551786, 1562947742);
INSERT INTO `blog_system_log` VALUES (11, 1, '数据库管理', '/admin.php/system/database/index.html', '[]', '浏览数据', 5, '127.0.0.1', 1561551787, 1561700972);
INSERT INTO `blog_system_log` VALUES (12, 1, '数据库管理', '/admin.php/system/database/index.html?group=export&page=1&limit=10', '{\"group\":\"export\",\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', 6, '127.0.0.1', 1561551787, 1561700972);
INSERT INTO `blog_system_log` VALUES (13, 1, '数据库管理', '/admin.php/system/database/index/group/import.html', '{\"group\":\"import\"}', '浏览数据', 1, '127.0.0.1', 1561551825, 1561551825);
INSERT INTO `blog_system_log` VALUES (14, 1, '数据库管理', '/admin.php/system/database/index.html?group=import&page=1&limit=10', '{\"group\":\"import\",\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', 1, '127.0.0.1', 1561551825, 1561551825);
INSERT INTO `blog_system_log` VALUES (15, 1, '数据库管理', '/admin.php/system/database/index/group/export.html', '{\"group\":\"export\"}', '浏览数据', 1, '127.0.0.1', 1561551826, 1561551826);
INSERT INTO `blog_system_log` VALUES (16, 1, '系统日志', '/admin.php/system/log/index.html', '[]', '浏览数据', 4, '127.0.0.1', 1561551827, 1561556509);
INSERT INTO `blog_system_log` VALUES (17, 1, '系统日志', '/admin.php/system/log/index.html?page=1&limit=20', '{\"page\":\"1\",\"limit\":\"20\"}', '浏览数据', 4, '127.0.0.1', 1561551827, 1561556509);
INSERT INTO `blog_system_log` VALUES (18, 1, '本地插件', '/admin.php/system/plugins/index.html', '[]', '浏览数据', 7, '127.0.0.1', 1561551831, 1561801159);
INSERT INTO `blog_system_log` VALUES (19, 1, '基础配置', '/admin.php/system/system/index/group/base.html', '{\"id\":{\"site_status\":\"1\",\"site_domain\":\"\",\"wap_domain\":\"\",\"site_name\":\"\\u6280\\u672f\\u80d6\",\"site_logo\":\"\",\"site_favicon\":\"\",\"site_title\":\"\\u6280\\u672f\\u80d6\",\"site_keywords\":\"\\u6280\\u672f\\u80d6\",\"site_description\":\"\",\"site_icp\":\"\",\"site_statis\":\"\"},\"type\":{\"site_status\":\"switch\",\"site_domain\":\"input\",\"wap_site_status\":\"switch\",\"wap_domain\":\"input\",\"site_name\":\"input\",\"site_logo\":\"image\",\"site_favicon\":\"image\",\"site_title\":\"input\",\"site_keywords\":\"input\",\"site_description\":\"textarea\",\"site_icp\":\"input\",\"site_statis\":\"textarea\"},\"__token__\":\"2eb6c8f8d009084cd5e4380e3e8d5a94\",\"group\":\"base\"}', '保存数据', 1, '127.0.0.1', 1561551858, 1561551858);
INSERT INTO `blog_system_log` VALUES (20, 1, '基础配置', '/admin.php/system/system/index/group/base.html', '{\"group\":\"base\"}', '浏览数据', 3, '::1', 1561551861, 1562947731);
INSERT INTO `blog_system_log` VALUES (21, 1, '系统配置', '/admin.php/system/system/index/group/sys.html', '{\"group\":\"sys\"}', '浏览数据', 8, '::1', 1561551874, 1562947753);
INSERT INTO `blog_system_log` VALUES (22, 1, '系统配置', '/admin.php/system/system/index/group/sys.html', '{\"id\":{\"editor\":\"umeditor\",\"admin_path\":\"admin.php\",\"config_group\":\"\",\"app_debug\":\"1\",\"app_trace\":\"1\",\"system_log_retention\":\"30\"},\"type\":{\"editor\":\"select\",\"admin_path\":\"input\",\"config_group\":\"array\",\"app_debug\":\"switch\",\"app_trace\":\"switch\",\"cloud_push\":\"switch\",\"multi_language\":\"switch\",\"admin_whitelist_verify\":\"switch\",\"system_log_retention\":\"input\"},\"__token__\":\"d3d86bdf91a2838195a0669895b3b7b9\",\"group\":\"sys\"}', '保存数据', 6, '::1', 1561552187, 1562947750);
INSERT INTO `blog_system_log` VALUES (23, 1, '插件钩子', '/admin.php/system/hook/index.html', '[]', '浏览数据', 3, '127.0.0.1', 1561556513, 1561801161);
INSERT INTO `blog_system_log` VALUES (24, 1, '插件钩子', '/admin.php/system/hook/index.html?page=1&limit=20', '{\"page\":\"1\",\"limit\":\"20\"}', '浏览数据', 3, '127.0.0.1', 1561556513, 1561801161);
INSERT INTO `blog_system_log` VALUES (25, 1, '框架升级', '/admin.php/system/upgrade/index.html', '[]', '浏览数据', 2, '127.0.0.1', 1561556514, 1561801162);
INSERT INTO `blog_system_log` VALUES (26, 1, '生成模块', '/admin.php/system/module/design.html', '[]', '浏览数据', 5, '127.0.0.1', 1561557928, 1561702286);
INSERT INTO `blog_system_log` VALUES (27, 1, '本地模块', '/admin.php/system/module/index/status/1.html', '{\"status\":\"1\"}', '浏览数据', 2, '127.0.0.1', 1561634753, 1561634773);
INSERT INTO `blog_system_log` VALUES (28, 1, '本地模块', '/admin.php/system/module/index/status/2.html', '{\"status\":\"2\"}', '浏览数据', 2, '127.0.0.1', 1561634754, 1561702333);
INSERT INTO `blog_system_log` VALUES (29, 1, '本地模块', '/admin.php/system/module/index/status/0.html', '{\"status\":\"0\"}', '浏览数据', 2, '127.0.0.1', 1561634774, 1561702320);
INSERT INTO `blog_system_log` VALUES (30, 1, '导入模块', '/admin.php/system/module/import.html', '[]', '浏览数据', 1, '127.0.0.1', 1561634774, 1561634774);
INSERT INTO `blog_system_log` VALUES (31, 1, '管理员角色', '/admin.php/system/user/role.html', '[]', '浏览数据', 5, '127.0.0.1', 1561700975, 1561701022);
INSERT INTO `blog_system_log` VALUES (32, 1, '管理员角色', '/admin.php/system/user/role.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', 5, '127.0.0.1', 1561700976, 1561701023);
INSERT INTO `blog_system_log` VALUES (33, 1, '添加角色', '/admin.php/system/user/addrole.html', '[]', '浏览数据', 1, '127.0.0.1', 1561700984, 1561700984);
INSERT INTO `blog_system_log` VALUES (34, 1, '添加管理员', '/admin.php/system/user/adduser.html?hisi_iframe=yes', '{\"hisi_iframe\":\"yes\"}', '浏览数据', 2, '127.0.0.1', 1561700996, 1561701025);
INSERT INTO `blog_system_log` VALUES (35, 1, '修改角色', '/admin.php/system/user/editrole.html?id=2', '{\"id\":\"2\"}', '浏览数据', 1, '127.0.0.1', 1561701006, 1561701006);
INSERT INTO `blog_system_log` VALUES (36, 1, '添加管理员', '/admin.php/system/user/adduser.html', '{\"role_id\":\"3\",\"username\":\"admin\",\"nick\":\"make\",\"password\":\"123456\",\"password_confirm\":\"123456\",\"email\":\"\",\"mobile\":\"\",\"iframe\":\"0\",\"status\":\"1\",\"__token__\":\"8b3770065bc09829f900acb2ab801081\",\"id\":\"\"}', '保存数据', 1, '127.0.0.1', 1561701046, 1561701046);
INSERT INTO `blog_system_log` VALUES (37, 1, '删除管理员', '/admin.php/system/user/deluser.html?id=2', '{\"id\":\"2\"}', '浏览数据', 1, '127.0.0.1', 1561702198, 1561702198);
INSERT INTO `blog_system_log` VALUES (38, 1, '生成插件', '/admin.php/system/plugins/design.html', '[]', '浏览数据', 2, '127.0.0.1', 1561702282, 1561724353);
INSERT INTO `blog_system_log` VALUES (39, 1, '生成模块', '/admin.php/system/module/design.html', '{\"name\":\"fun\",\"title\":\"\\u529f\\u80fd\",\"identifier\":\"fun.kuaizi.module\",\"intro\":\"\",\"author\":\"kuaizi\",\"url\":\"\",\"version\":\"1.0.0\",\"file\":\"common.php\",\"dir\":\"admin\\r\\nhome\\r\\nconfig\\r\\nmodel\\r\\nlang\\r\\nsql\\r\\nvalidate\\r\\nview\"}', '保存数据', 1, '127.0.0.1', 1561702317, 1561702317);
INSERT INTO `blog_system_log` VALUES (40, 1, '状态设置', '/admin.php/system/module/status/id/4.html?val=1', '{\"val\":\"1\",\"id\":\"4\"}', '浏览数据', 1, '127.0.0.1', 1561702327, 1561702327);
INSERT INTO `blog_system_log` VALUES (41, 1, '安装模块', '/admin.php/system/module/install/id/4.html', '{\"id\":\"4\"}', '浏览数据', 1, '127.0.0.1', 1561702328, 1561702328);
INSERT INTO `blog_system_log` VALUES (42, 1, '安装模块', '/admin.php/system/module/install.html', '{\"clear\":\"0\",\"demo_data\":\"0\",\"id\":\"4\"}', '保存数据', 1, '127.0.0.1', 1561702330, 1561702330);
INSERT INTO `blog_system_log` VALUES (43, 1, '添加菜单', '/admin.php/system/menu/add/pid/141/mod/fun.html', '{\"pid\":\"141\",\"mod\":\"fun\"}', '浏览数据', 4, '::1', 1561702343, 1562848460);
INSERT INTO `blog_system_log` VALUES (44, 1, '添加菜单', '/admin.php/system/menu/add.html', '{\"pid\":\"222\",\"title\":\"\\u5173\\u4e8e\\u6211\\u6587\\u7ae0\",\"icon\":\"aicon ai-caidan\",\"url\":\"fun\\/about\\/about\",\"param\":\"\",\"status\":\"1\",\"system\":\"0\",\"nav\":\"1\",\"id\":\"\",\"module\":\"fun\"}', '保存数据', 10, '::1', 1561702542, 1562848502);
INSERT INTO `blog_system_log` VALUES (45, 1, '添加菜单', '/admin.php/system/menu/add/pid/142/mod/fun.html', '{\"pid\":\"142\",\"mod\":\"fun\"}', '浏览数据', 2, '127.0.0.1', 1561702552, 1561702780);
INSERT INTO `blog_system_log` VALUES (46, 1, '文章类别', '/admin.php/fun/article/articlecate.html', '[]', '浏览数据', 63, '127.0.0.1', 1561703494, 1561810731);
INSERT INTO `blog_system_log` VALUES (47, 1, '文章列表', '/admin.php/fun/article/article.html', '[]', '浏览数据', 284, '::1', 1561703512, 1562958638);
INSERT INTO `blog_system_log` VALUES (48, 1, '文章类别', '/admin.php/fun/article/articlecate.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', 52, '127.0.0.1', 1561721460, 1561810731);
INSERT INTO `blog_system_log` VALUES (49, 1, '未加入系统菜单', '/admin.php/fun/article/articlecateadd.html?hisi_iframe=yes', '{\"hisi_iframe\":\"yes\"}', '浏览数据', 48, '127.0.0.1', 1561722426, 1561816080);
INSERT INTO `blog_system_log` VALUES (50, 1, '框架升级', '/admin.php/system/upgrade/index.html', '{\"account\":\"php8pst@gmail.com\",\"password\":\"d8999e28759641b4b540d4554bc56f59\"}', '保存数据', 6, '127.0.0.1', 1561724323, 1561800973);
INSERT INTO `blog_system_log` VALUES (51, 1, '安装应用', '/admin.php/system/store/install.html?app_name=developer&app_type=1&app_keys=1172a5dd6b33a34630ca7fd39792b961&branch_id=2000015', '{\"app_name\":\"developer\",\"app_type\":\"1\",\"app_keys\":\"1172a5dd6b33a34630ca7fd39792b961\",\"branch_id\":\"2000015\"}', '浏览数据', 1, '127.0.0.1', 1561724330, 1561724330);
INSERT INTO `blog_system_log` VALUES (52, 1, '插件列表', '/admin.php/developer/plugins/index.html', '[]', '浏览数据', 5, '127.0.0.1', 1561724339, 1561724362);
INSERT INTO `blog_system_log` VALUES (53, 1, '模块列表', '/admin.php/developer/module/index.html', '[]', '浏览数据', 6, '127.0.0.1', 1561724339, 1562238129);
INSERT INTO `blog_system_log` VALUES (54, 1, '生成模块', '/admin.php/developer/module/build.html', '[]', '浏览数据', 3, '127.0.0.1', 1561724342, 1562162079);
INSERT INTO `blog_system_log` VALUES (55, 1, '生成插件', '/admin.php/developer/plugins/build.html', '[]', '浏览数据', 1, '127.0.0.1', 1561724347, 1561724347);
INSERT INTO `blog_system_log` VALUES (56, 1, '个人信息设置', '/admin.php/system/user/info.html', '[]', '浏览数据', 1, '127.0.0.1', 1561724381, 1561724381);
INSERT INTO `blog_system_log` VALUES (57, 1, '安装应用', '/admin.php/system/store/install.html?app_name=api&app_type=1&app_keys=22e6e1ae77c5ec850e743b3ea2ffcad1&branch_id=2000021', '{\"app_name\":\"api\",\"app_type\":\"1\",\"app_keys\":\"22e6e1ae77c5ec850e743b3ea2ffcad1\",\"branch_id\":\"2000021\"}', '浏览数据', 1, '127.0.0.1', 1561800982, 1561800982);
INSERT INTO `blog_system_log` VALUES (58, 1, '应用分组', '/admin.php/api/app_group/index.html', '[]', '浏览数据', 14, '::1', 1561801077, 1562870929);
INSERT INTO `blog_system_log` VALUES (59, 1, '应用分组', '/admin.php/api/app_group/index.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', 14, '::1', 1561801077, 1562870930);
INSERT INTO `blog_system_log` VALUES (60, 1, '应用列表', '/admin.php/api/app/index.html', '[]', '浏览数据', 27, '::1', 1561801078, 1562870985);
INSERT INTO `blog_system_log` VALUES (61, 1, '应用列表', '/admin.php/api/app/index.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', 27, '::1', 1561801078, 1562870986);
INSERT INTO `blog_system_log` VALUES (62, 1, '接口分组', '/admin.php/api/api_group/index.html', '[]', '浏览数据', 31, '::1', 1561801080, 1562870939);
INSERT INTO `blog_system_log` VALUES (63, 1, '接口分组', '/admin.php/api/api_group/index.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', 31, '::1', 1561801080, 1562870939);
INSERT INTO `blog_system_log` VALUES (64, 1, '接口列表', '/admin.php/api/api/index.html', '[]', '浏览数据', 46, '::1', 1561801082, 1562870994);
INSERT INTO `blog_system_log` VALUES (65, 1, '接口列表', '/admin.php/api/api/index.html?page=1&limit=20', '{\"page\":\"1\",\"limit\":\"20\"}', '浏览数据', 46, '::1', 1561801083, 1562870994);
INSERT INTO `blog_system_log` VALUES (66, 1, '接口参数', '/admin.php/api/param/index.html', '[]', '浏览数据', 5, '::1', 1561801083, 1562870940);
INSERT INTO `blog_system_log` VALUES (67, 1, '接口参数', '/admin.php/api/param/index.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', 5, '::1', 1561801083, 1562870940);
INSERT INTO `blog_system_log` VALUES (68, 1, '未加入系统菜单', '/admin.php/fun/article/articlecateedit.html?hisi_iframe=yes&id=1', '{\"hisi_iframe\":\"yes\",\"id\":\"1\"}', '浏览数据', 6, '127.0.0.1', 1561801458, 1561817637);
INSERT INTO `blog_system_log` VALUES (69, 1, '未加入系统菜单', '/admin.php/fun/article/articlecateadd.html', '{\"cate_name\":\"11\",\"sort\":\"0\"}', '保存数据', 4, '127.0.0.1', 1561806017, 1561807253);
INSERT INTO `blog_system_log` VALUES (70, 1, '未加入系统菜单', '/admin.php/fun/article/undefined', '[]', '浏览数据', 4, '127.0.0.1', 1561806020, 1561807256);
INSERT INTO `blog_system_log` VALUES (71, 1, '未加入系统菜单', '/admin.php/fun/article/add.html', '{\"cate_name\":\"\\u6587\\u7ae0\\u7c7b\\u522b\",\"sort\":\"0\"}', '保存数据', 25, '127.0.0.1', 1561808530, 1561816646);
INSERT INTO `blog_system_log` VALUES (72, 1, '文章类别', '/admin.php/fun/article/articlecate.html?page=3&limit=10', '{\"page\":\"3\",\"limit\":\"10\"}', '浏览数据', 1, '127.0.0.1', 1561810665, 1561810665);
INSERT INTO `blog_system_log` VALUES (73, 1, '修改菜单', '/admin.php/system/menu/edit/id/144/mod/fun.html', '{\"id\":\"144\",\"mod\":\"fun\"}', '浏览数据', 8, '127.0.0.1', 1561813573, 1561816607);
INSERT INTO `blog_system_log` VALUES (74, 1, '修改菜单', '/admin.php/system/menu/edit/id/4/mod/system.html', '{\"id\":\"4\",\"mod\":\"system\"}', '浏览数据', 4, '127.0.0.1', 1561813608, 1561814607);
INSERT INTO `blog_system_log` VALUES (75, 1, '修改菜单', '/admin.php/system/menu/edit/id/25/mod/system.html', '{\"id\":\"25\",\"mod\":\"system\"}', '浏览数据', 2, '127.0.0.1', 1561813612, 1561814604);
INSERT INTO `blog_system_log` VALUES (76, 1, '修改菜单', '/admin.php/system/menu/edit/id/24/mod/system.html', '{\"id\":\"24\",\"mod\":\"system\"}', '浏览数据', 1, '127.0.0.1', 1561813615, 1561813615);
INSERT INTO `blog_system_log` VALUES (77, 1, '修改菜单', '/admin.php/system/menu/edit/id/10/mod/system.html', '{\"id\":\"10\",\"mod\":\"system\"}', '浏览数据', 1, '127.0.0.1', 1561813619, 1561813619);
INSERT INTO `blog_system_log` VALUES (78, 1, '修改菜单', '/admin.php/system/menu/edit/id/169/mod/api.html', '{\"id\":\"169\",\"mod\":\"api\"}', '浏览数据', 1, '127.0.0.1', 1561813629, 1561813629);
INSERT INTO `blog_system_log` VALUES (79, 1, '修改菜单', '/admin.php/system/menu/edit/id/170/mod/api.html', '{\"id\":\"170\",\"mod\":\"api\"}', '浏览数据', 1, '127.0.0.1', 1561813636, 1561813636);
INSERT INTO `blog_system_log` VALUES (80, 1, '修改菜单', '/admin.php/system/menu/edit/id/149/mod/developer.html', '{\"id\":\"149\",\"mod\":\"developer\"}', '浏览数据', 1, '127.0.0.1', 1561813643, 1561813643);
INSERT INTO `blog_system_log` VALUES (81, 1, '修改菜单', '/admin.php/system/menu/edit/id/60/mod/system.html', '{\"id\":\"60\",\"mod\":\"system\"}', '浏览数据', 1, '127.0.0.1', 1561814594, 1561814594);
INSERT INTO `blog_system_log` VALUES (82, 1, '修改菜单', '/admin.php/system/menu/edit/id/106/mod/system.html', '{\"id\":\"106\",\"mod\":\"system\"}', '浏览数据', 1, '127.0.0.1', 1561814610, 1561814610);
INSERT INTO `blog_system_log` VALUES (83, 1, '修改菜单', '/admin.php/system/menu/edit/id/142/mod/fun.html', '{\"id\":\"142\",\"mod\":\"fun\"}', '浏览数据', 1, '127.0.0.1', 1561814618, 1561814618);
INSERT INTO `blog_system_log` VALUES (84, 1, '修改菜单', '/admin.php/system/menu/edit/id/143/mod/fun.html', '{\"id\":\"143\",\"mod\":\"fun\"}', '浏览数据', 4, '127.0.0.1', 1561814627, 1561816597);
INSERT INTO `blog_system_log` VALUES (85, 1, '修改菜单', '/admin.php/system/menu/edit/id/5/mod/system.html', '{\"id\":\"5\",\"mod\":\"system\"}', '浏览数据', 1, '127.0.0.1', 1561814643, 1561814643);
INSERT INTO `blog_system_log` VALUES (86, 1, '修改菜单', '/admin.php/system/menu/edit/id/91/mod/system.html', '{\"id\":\"91\",\"mod\":\"system\"}', '浏览数据', 1, '127.0.0.1', 1561814647, 1561814647);
INSERT INTO `blog_system_log` VALUES (87, 1, '修改菜单', '/admin.php/system/menu/edit/id/57/mod/system.html', '{\"id\":\"57\",\"mod\":\"system\"}', '浏览数据', 1, '127.0.0.1', 1561814652, 1561814652);
INSERT INTO `blog_system_log` VALUES (88, 1, '修改菜单', '/admin.php/system/menu/edit/id/113/mod/system.html', '{\"id\":\"113\",\"mod\":\"system\"}', '浏览数据', 1, '127.0.0.1', 1561814654, 1561814654);
INSERT INTO `blog_system_log` VALUES (89, 1, '修改菜单', '/admin.php/system/menu/edit.html', '{\"pid\":\"222\",\"title\":\"\\u5173\\u4e8e\\u6211\\u6587\\u7ae0\",\"icon\":\"aicon ai-caidan\",\"url\":\"fun\\/about\\/about\",\"param\":\"\",\"status\":\"1\",\"system\":\"0\",\"nav\":\"1\",\"id\":\"223\",\"module\":\"fun\"}', '保存数据', 11, '::1', 1561814668, 1562850940);
INSERT INTO `blog_system_log` VALUES (90, 1, '文章类别', '/admin.php/fun/article_cate/index.html', '[]', '浏览数据', 17, '127.0.0.1', 1561815714, 1561816575);
INSERT INTO `blog_system_log` VALUES (91, 1, '文章类别', '/admin.php/fun/article_cate/index.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', 12, '127.0.0.1', 1561815828, 1561816417);
INSERT INTO `blog_system_log` VALUES (92, 1, '文章列表', '/admin.php/fun/article/index.html', '[]', '浏览数据', 2, '127.0.0.1', 1561815963, 1561816584);
INSERT INTO `blog_system_log` VALUES (93, 1, '未加入系统菜单', '/admin.php/fun/article_cate/add.html?hisi_iframe=yes', '{\"hisi_iframe\":\"yes\"}', '浏览数据', 5, '127.0.0.1', 1561816233, 1561816418);
INSERT INTO `blog_system_log` VALUES (94, 1, '文章类别', '/admin.php/fun/article_cate/articlecate.html', '[]', '浏览数据', 90, '::1', 1561816621, 1562956915);
INSERT INTO `blog_system_log` VALUES (95, 1, '文章类别', '/admin.php/fun/article_cate/articlecate.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', 82, '::1', 1561816621, 1562956915);
INSERT INTO `blog_system_log` VALUES (96, 1, '未加入系统菜单', '/admin.php/fun/article_cate/articlecateadd.html?hisi_iframe=yes', '{\"hisi_iframe\":\"yes\"}', '浏览数据', 11, '::1', 1561816641, 1562837057);
INSERT INTO `blog_system_log` VALUES (97, 1, '未加入系统菜单', '/admin.php/fun/article_cate/add.html', '{\"cate_name\":\"vue\",\"sort\":\"0\"}', '保存数据', 4, '::1', 1561816688, 1562837060);
INSERT INTO `blog_system_log` VALUES (98, 1, '未加入系统菜单', '/admin.php/fun/article_cate/articlecateedit.html?hisi_iframe=yes&id=1', '{\"hisi_iframe\":\"yes\",\"id\":\"1\"}', '浏览数据', 11, '10.9.17.58', 1561890849, 1562671175);
INSERT INTO `blog_system_log` VALUES (99, 1, '未加入系统菜单', '/admin.php/fun/article_cate/articlecateedit.html', '{\"id\":\"1\"}', '保存数据', 12, '10.9.17.58', 1561892179, 1562671175);
INSERT INTO `blog_system_log` VALUES (100, 1, '未加入系统菜单', '/admin.php/fun/article_cate/articlecateedit.html?hisi_iframe=yes&id=25', '{\"hisi_iframe\":\"yes\",\"id\":\"25\"}', '浏览数据', 3, '127.0.0.1', 1561892181, 1562058098);
INSERT INTO `blog_system_log` VALUES (101, 1, '未加入系统菜单', '/admin.php/fun/article_cate/edit.html?id=1', '{\"id\":\"1\",\"cate_name\":\"Vue\",\"sort\":\"90\"}', '保存数据', 2, '127.0.0.1', 1561969246, 1561969261);
INSERT INTO `blog_system_log` VALUES (102, 1, '未加入系统菜单', '/admin.php/fun/article_cate/articlecateedit.html?hisi_iframe=yes&id=24', '{\"hisi_iframe\":\"yes\",\"id\":\"24\"}', '浏览数据', 1, '127.0.0.1', 1561969266, 1561969266);
INSERT INTO `blog_system_log` VALUES (103, 1, '未加入系统菜单', '/admin.php/fun/article_cate/edit.html?id=24', '{\"id\":\"24\",\"cate_name\":\"\\u6587\\u7ae0\\u7c7b\\u522b123\",\"sort\":\"0\"}', '保存数据', 1, '127.0.0.1', 1561969268, 1561969268);
INSERT INTO `blog_system_log` VALUES (104, 1, '未加入系统菜单', '/admin.php/fun/article_cate/edit.html?id=25', '{\"id\":\"25\",\"cate_name\":\"\\u6587\\u7ae0\\u7c7b\\u522b\",\"sort\":\"2\"}', '保存数据', 1, '127.0.0.1', 1561969441, 1561969441);
INSERT INTO `blog_system_log` VALUES (105, 1, '文章列表', '/admin.php/fun/article/article.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', 258, '::1', 1561970239, 1562958639);
INSERT INTO `blog_system_log` VALUES (106, 1, '未加入系统菜单', '/admin.php/fun/article_cate/add.html?id={{%20d.id%20}%20}}&val=0', '{\"id\":\"{{ d.id } }}\",\"val\":\"0\"}', '浏览数据', 1, '127.0.0.1', 1561973939, 1561973939);
INSERT INTO `blog_system_log` VALUES (107, 1, '未加入系统菜单', '/admin.php/fun/article/is_top.html?id={{%20d.id%20}%20}}&val=0&val=0', '{\"id\":\"{{ d.id } }}\",\"val\":\"0\"}', '浏览数据', 1, '127.0.0.1', 1561974129, 1561974129);
INSERT INTO `blog_system_log` VALUES (108, 1, '未加入系统菜单', '/admin.php/fun/article/status.html?id={{%20d.id%20}%20}}&field=is_top&val=0&val=0', '{\"id\":\"{{ d.id } }}\",\"field\":\"is_top\",\"val\":\"0\"}', '浏览数据', 1, '127.0.0.1', 1561974189, 1561974189);
INSERT INTO `blog_system_log` VALUES (109, 1, '未加入系统菜单', '/admin.php/fun/article/status.html?id={{%20d.id%20}%20}}&field=is_top&val=0&val=1', '{\"id\":\"{{ d.id } }}\",\"field\":\"is_top\",\"val\":\"1\"}', '浏览数据', 1, '127.0.0.1', 1561974191, 1561974191);
INSERT INTO `blog_system_log` VALUES (110, 1, '未加入系统菜单', '/admin.php/fun/article/status.html?id={{%20d.id%20}%20}}&field=is_top&val=1&val=1', '{\"id\":\"{{ d.id } }}\",\"field\":\"is_top\",\"val\":\"1\"}', '浏览数据', 2, '127.0.0.1', 1561974201, 1561974248);
INSERT INTO `blog_system_log` VALUES (111, 1, '未加入系统菜单', '/admin.php/fun/article/status.html?id=1&field=is_top&val=1&val=1', '{\"id\":\"1\",\"field\":\"is_top\",\"val\":\"1\"}', '浏览数据', 3, '127.0.0.1', 1561974292, 1562157137);
INSERT INTO `blog_system_log` VALUES (112, 1, '未加入系统菜单', '/admin.php/fun/article/status.html?id=1&field=is_top&val=0&val=0', '{\"id\":\"1\",\"field\":\"is_top\",\"val\":\"0\"}', '浏览数据', 4, '10.9.17.58', 1561974302, 1562506570);
INSERT INTO `blog_system_log` VALUES (113, 1, '未加入系统菜单', '/admin.php/fun/article/status.html?id=2&field=is_top&val=0&val=0', '{\"id\":\"2\",\"field\":\"is_top\",\"val\":\"0\"}', '浏览数据', 4, '10.9.17.58', 1561974305, 1562506570);
INSERT INTO `blog_system_log` VALUES (114, 1, '未加入系统菜单', '/admin.php/fun/article/status.html?id=1&field=is_top&val=0&val=1', '{\"id\":\"1\",\"field\":\"is_top\",\"val\":\"1\"}', '浏览数据', 1, '127.0.0.1', 1561974307, 1561974307);
INSERT INTO `blog_system_log` VALUES (115, 1, '未加入系统菜单', '/admin.php/fun/article/status.html?id=2&field=is_top&val=0&val=1', '{\"id\":\"2\",\"field\":\"is_top\",\"val\":\"1\"}', '浏览数据', 1, '127.0.0.1', 1561974308, 1561974308);
INSERT INTO `blog_system_log` VALUES (116, 1, '未加入系统菜单', '/admin.php/fun/article/articleadd.html?hisi_iframe=yes', '{\"hisi_iframe\":\"yes\"}', '浏览数据', 67, '::1', 1561975410, 1562874439);
INSERT INTO `blog_system_log` VALUES (117, 1, '未加入系统菜单', '/admin.php/fun/article/uploadimage.html', '[]', '保存数据', 5, '127.0.0.1', 1561981734, 1562226541);
INSERT INTO `blog_system_log` VALUES (118, 1, '未加入系统菜单', '/admin.php/fun/article/introuploadimage.html', '[]', '保存数据', 26, '10.9.17.58', 1561986757, 1562671219);
INSERT INTO `blog_system_log` VALUES (119, 1, '未加入系统菜单', '/admin.php/fun/article/contentuploadimage.html', '[]', '保存数据', 33, '10.9.17.58', 1561987222, 1562671184);
INSERT INTO `blog_system_log` VALUES (120, 1, '未加入系统菜单', '/admin.php/fun/article/20190701/e68156da4caa18208f00e65b0b28ae91.jpg', '[]', '浏览数据', 1, '127.0.0.1', 1561987222, 1561987222);
INSERT INTO `blog_system_log` VALUES (121, 1, '未加入系统菜单', '/admin.php/fun/article/articlebase.html', '[]', '浏览数据', 22, '127.0.0.1', 1562058104, 1562150435);
INSERT INTO `blog_system_log` VALUES (122, 1, '未加入系统菜单', '/admin.php/fun/article/articleadd.html', '{\"postData\":\"{&quot;article_cate&quot;:&quot;26&quot;,&quot;title&quot;:&quot;\\u6587\\u7ae0\\u6807\\u9898&quot;,&quot;intro&quot;:&quot; \\u6587\\u7ae0\\u5f15\\u8a00&quot;,&quot;author&quot;:&quot;&quot;,&quot;content&quot;:&quot;&lt;p&gt;&lt;span class=\\\\&quot;layui-badge-dot\\\\&quot; style=\\\\&quot;text-align: center;\\\\&quot;&gt;&lt;\\/span&gt;&lt;span style=\\\\&quot;text-align: right;\\\\&quot;&gt;&amp;nbsp;\\u6587\\u7ae0\\u5f15\\u8a00&lt;\\/span&gt;&lt;span class=\\\\&quot;layui-badge-dot\\\\&quot; style=\\\\&quot;text-align: center;\\\\&quot;&gt;&lt;\\/span&gt;&lt;span style=\\\\&quot;text-align: right;\\\\&quot;&gt;&amp;nbsp;\\u6587\\u7ae0\\u5f15\\u8a00&lt;\\/span&gt;&lt;span class=\\\\&quot;layui-badge-dot\\\\&quot; style=\\\\&quot;text-align: center;\\\\&quot;&gt;&lt;\\/span&gt;&lt;span style=\\\\&quot;text-align: right;\\\\&quot;&gt;&amp;nbsp;\\u6587\\u7ae0\\u5f15\\u8a00&lt;\\/span&gt;&lt;\\/p&gt;&lt;span class=\\\\&quot;layui-badge-dot\\\\&quot; style=\\\\&quot;text-align: center;\\\\&quot;&gt;&lt;\\/span&gt;&quot;}\"}', '保存数据', 80, '::1', 1562058810, 1562874447);
INSERT INTO `blog_system_log` VALUES (123, 1, '未加入系统菜单', '/admin.php/fun/article/articleedit.html?hisi_iframe=yes&id=1', '{\"hisi_iframe\":\"yes\",\"id\":\"1\"}', '浏览数据', 13, '10.9.17.58', 1562147635, 1562670415);
INSERT INTO `blog_system_log` VALUES (124, 1, '未加入系统菜单', '/admin.php/fun/article/articleedit.html?hisi_iframe=yes&id=2', '{\"hisi_iframe\":\"yes\",\"id\":\"2\"}', '浏览数据', 30, '10.9.17.58', 1562150511, 1562591408);
INSERT INTO `blog_system_log` VALUES (125, 1, '未加入系统菜单', '/admin.php/fun/article/articleedit.html?hisi_iframe=yes&id=4', '{\"hisi_iframe\":\"yes\",\"id\":\"4\"}', '浏览数据', 49, '10.9.17.58', 1562152840, 1562757466);
INSERT INTO `blog_system_log` VALUES (126, 1, '未加入系统菜单', '/admin.php/fun/article/status.html?id=1&field=is_top&val=1&val=0', '{\"id\":\"1\",\"field\":\"is_top\",\"val\":\"0\"}', '浏览数据', 1, '127.0.0.1', 1562154012, 1562154012);
INSERT INTO `blog_system_log` VALUES (127, 1, '未加入系统菜单', '/admin.php/fun/article/articlebase.html?status=edit&id=4', '{\"status\":\"edit\",\"id\":\"4\"}', '浏览数据', 40, '10.9.17.58', 1562156692, 1562757467);
INSERT INTO `blog_system_log` VALUES (128, 1, '未加入系统菜单', '/admin.php/fun/article/articlebase.html?status=edit&id=2', '{\"status\":\"edit\",\"id\":\"2\"}', '浏览数据', 28, '10.9.17.58', 1562156804, 1562591408);
INSERT INTO `blog_system_log` VALUES (129, 1, '未加入系统菜单', '/admin.php/fun/article/status.html?id=4&field=is_top&val=1&val=1', '{\"id\":\"4\",\"field\":\"is_top\",\"val\":\"1\"}', '浏览数据', 1, '127.0.0.1', 1562157135, 1562157135);
INSERT INTO `blog_system_log` VALUES (130, 1, '未加入系统菜单', '/admin.php/fun/article/status.html?id=3&field=is_top&val=1&val=1', '{\"id\":\"3\",\"field\":\"is_top\",\"val\":\"1\"}', '浏览数据', 2, '127.0.0.1', 1562157136, 1562161980);
INSERT INTO `blog_system_log` VALUES (131, 1, '未加入系统菜单', '/admin.php/fun/article/status.html?id=2&field=is_top&val=1&val=1', '{\"id\":\"2\",\"field\":\"is_top\",\"val\":\"1\"}', '浏览数据', 1, '127.0.0.1', 1562157137, 1562157137);
INSERT INTO `blog_system_log` VALUES (132, 1, '未加入系统菜单', '/admin.php/fun/article/status.html?id=3&field=is_top&val=0&val=0', '{\"id\":\"3\",\"field\":\"is_top\",\"val\":\"0\"}', '浏览数据', 2, '10.9.17.58', 1562158516, 1562506568);
INSERT INTO `blog_system_log` VALUES (133, 1, '未加入系统菜单', '/admin.php/fun/article/articleedit.html?hisi_iframe=yes&id=3', '{\"hisi_iframe\":\"yes\",\"id\":\"3\"}', '浏览数据', 21, '10.9.17.58', 1562158518, 1562671179);
INSERT INTO `blog_system_log` VALUES (134, 1, '未加入系统菜单', '/admin.php/fun/article/articlebase.html?status=edit&id=3', '{\"status\":\"edit\",\"id\":\"3\"}', '浏览数据', 20, '10.9.17.58', 1562158518, 1562671179);
INSERT INTO `blog_system_log` VALUES (135, 1, '未加入系统菜单', '/admin.php/fun/article/articleedit.html', '{\"id\":\"12\",\"postData\":\"{&quot;article_cate&quot;:&quot;2&quot;,&quot;title&quot;:&quot;\\u6587\\u7ae0\\u6807\\u9898&quot;,&quot;intro&quot;:&quot;\\u6587\\u7ae0\\u6807\\u9898&quot;,&quot;is_top&quot;:&quot;1&quot;,&quot;author&quot;:&quot;&quot;,&quot;content&quot;:&quot;&lt;p&gt;&lt;span style=\\\\&quot;text-align: right;\\\\&quot;&gt;\\u6587\\u7ae0\\u6807\\u9898111&lt;\\/span&gt;&lt;\\/p&gt;&quot;}\"}', '保存数据', 55, '::1', 1562161296, 1562956975);
INSERT INTO `blog_system_log` VALUES (136, 1, '未加入系统菜单', '/admin.php/fun/article/articlebase.html?status=edit&id=1', '{\"status\":\"edit\",\"id\":\"1\"}', '浏览数据', 9, '10.9.17.58', 1562161307, 1562670415);
INSERT INTO `blog_system_log` VALUES (137, 1, '添加菜单', '/admin.php/system/menu/add/pid/217/mod/fun.html', '{\"pid\":\"217\",\"mod\":\"fun\"}', '浏览数据', 1, '127.0.0.1', 1562162131, 1562162131);
INSERT INTO `blog_system_log` VALUES (138, 1, '关于我', '/admin.php/fun/about/about.html', '[]', '浏览数据', 76, '::1', 1562224298, 1562847921);
INSERT INTO `blog_system_log` VALUES (139, 1, '未加入系统菜单', '/admin.php/fun/about/uploadimage.html', '[]', '保存数据', 23, '::1', 1562226557, 1562855046);
INSERT INTO `blog_system_log` VALUES (140, 1, '未加入系统菜单', '/admin.php/fun/about/aboutbase.html', '[]', '浏览数据', 53, '::1', 1562228528, 1562956875);
INSERT INTO `blog_system_log` VALUES (141, 1, '关于我', '/admin.php/fun/about/about.html', '{\"postData\":\"{&quot;about_name&quot;:&quot;\\u5c0f\\u80d6&quot;,&quot;about_desc&quot;:&quot;\\u5927\\u5bb6\\u597d,\\u6211\\u662fPHP\\u7a0b\\u5e8f\\u5458\\u5c0f\\u80d6,\\u53cc\\u6728\\u6797&quot;,&quot;about_image&quot;:&quot;\\/upload\\/fun\\/about\\/20190709\\/7d1625fbdbb94dcfed10862d6e52729d.jpg&quot;,&quot;about_git&quot;:&quot;https:\\/\\/github.com\\/yyx990803&quot;}\"}', '保存数据', 7, '10.9.17.58', 1562232284, 1562671128);
INSERT INTO `blog_system_log` VALUES (142, 1, '修改菜单', '/admin.php/system/menu/edit/id/217/mod/fun.html', '{\"id\":\"217\",\"mod\":\"fun\"}', '浏览数据', 3, '::1', 1562235420, 1562847963);
INSERT INTO `blog_system_log` VALUES (143, 1, '添加菜单', '/admin.php/system/menu/add/pid/219/mod/fun.html', '{\"pid\":\"219\",\"mod\":\"fun\"}', '浏览数据', 4, '::1', 1562235445, 1562845634);
INSERT INTO `blog_system_log` VALUES (144, 1, '底部配置', '/admin.php/fun/footer/footer.html', '[]', '浏览数据', 37, '::1', 1562235757, 1562956880);
INSERT INTO `blog_system_log` VALUES (145, 1, '未加入系统菜单', '/admin.php/fun/about/aboutbase', '[]', '浏览数据', 5, '127.0.0.1', 1562237207, 1562237382);
INSERT INTO `blog_system_log` VALUES (146, 1, '新增', '/admin.php/api/api/add.html?hisi_iframe=yes', '{\"hisi_iframe\":\"yes\"}', '浏览数据', 16, '::1', 1562237660, 1562870942);
INSERT INTO `blog_system_log` VALUES (147, 1, '新增', '/admin.php/api/api_group/add.html?hisi_model=apiGroup&hisi_iframe=yes', '{\"hisi_model\":\"apiGroup\",\"hisi_iframe\":\"yes\"}', '浏览数据', 6, '::1', 1562237667, 1562870918);
INSERT INTO `blog_system_log` VALUES (148, 1, '新增', '/admin.php/api/api/add.html', '{\"group_id\":\"6\",\"name\":\"\\u5173\\u4e8e\\u6211\",\"version\":\"v1\",\"module\":\"api\",\"controller\":\"About\",\"action\":\"index\",\"path\":\"\",\"rule\":\"\",\"route\":\"\",\"access_token\":\"0\",\"user_token\":\"0\",\"desc\":\"\",\"return_example\":\"\",\"id\":\"\",\"method\":\"\",\"route_map\":\"\"}', '保存数据', 10, '::1', 1562238253, 1562870965);
INSERT INTO `blog_system_log` VALUES (149, 1, '接口参数', '/admin.php/api/param/index.html?api_id=14&type=1', '{\"api_id\":\"14\",\"type\":\"1\"}', '浏览数据', 1, '127.0.0.1', 1562238689, 1562238689);
INSERT INTO `blog_system_log` VALUES (150, 1, '接口参数', '/admin.php/api/param/index/api_id/14/type/1.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\",\"api_id\":\"14\",\"type\":\"1\"}', '浏览数据', 1, '127.0.0.1', 1562238689, 1562238689);
INSERT INTO `blog_system_log` VALUES (151, 1, '新增', '/admin.php/api/param/add/api_id/14/type/1.html?hisi_iframe=yes', '{\"hisi_iframe\":\"yes\",\"api_id\":\"14\",\"type\":\"1\"}', '浏览数据', 1, '127.0.0.1', 1562238691, 1562238691);
INSERT INTO `blog_system_log` VALUES (152, 1, '接口配置', '/admin.php/system/system/index/group/api.html', '{\"group\":\"api\"}', '浏览数据', 7, '::1', 1562238779, 1562947728);
INSERT INTO `blog_system_log` VALUES (153, 1, '接口配置', '/admin.php/system/system/index/group/api.html', '{\"id\":{\"0\":\"\",\"1\":\"\",\"2\":\"7200\",\"3\":\"600\",\"4\":\"90\",\"5\":\"\",\"6\":\"v1\",\"8\":\"\",\"9\":\"\"},\"type\":[\"input\",\"input\",\"input\",\"input\",\"input\",\"input\",\"input\",\"switch\",\"input\",\"image\"],\"module\":\"api\",\"__token__\":\"321a931dcc68e32556b803cf0cd1ff8e\",\"group\":\"api\"}', '保存数据', 4, '::1', 1562238792, 1562947725);
INSERT INTO `blog_system_log` VALUES (154, 1, '状态', '/admin.php/api/api/status/table/api.html?field=access_token&id=14&val=1', '{\"field\":\"access_token\",\"id\":\"14\",\"val\":\"1\",\"table\":\"api\"}', '浏览数据', 1, '127.0.0.1', 1562238978, 1562238978);
INSERT INTO `blog_system_log` VALUES (155, 1, '编辑', '/admin.php/api/app/edit.html?id=1&hisi_model=apiApp', '{\"id\":\"1\",\"hisi_model\":\"apiApp\"}', '浏览数据', 18, '::1', 1562239014, 1562870981);
INSERT INTO `blog_system_log` VALUES (156, 1, '编辑', '/admin.php/api/app/edit/hisi_model/apiApp.html', '{\"group_id\":\"1\",\"name\":\"\\u6d4b\\u8bd5\\u5e94\\u7528\",\"site_name\":\"\\u6d4b\\u8bd5\\u7f51\\u7ad9\",\"site_domain\":\"api.app.50.hisiphp.test\",\"callback_domain\":\"http:\\/\\/api.app.50.hisiphp.test\\/index\\/token\",\"whitelist\":\"\",\"app_id\":\"2026668444\",\"app_secret\":\"i77E7x3zQX8PH6nQP6G6p7JmWXmmZ407\",\"desc\":\"\\u8fd9\\u662f\\u4e00\\u4e2a\\u6d4b\\u8bd5\\u63a5\\u53e3\",\"auth\":[\"16\",\"21\",\"22\",\"23\",\"24\",\"25\"],\"id\":\"1\",\"hisi_model\":\"apiApp\"}', '保存数据', 7, '::1', 1562239017, 1562870978);
INSERT INTO `blog_system_log` VALUES (157, 1, '文档分类', '/admin.php/api/doc_category/index.html', '[]', '浏览数据', 2, '127.0.0.1', 1562239878, 1562239881);
INSERT INTO `blog_system_log` VALUES (158, 1, '文档分类', '/admin.php/api/doc_category/index.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', 2, '127.0.0.1', 1562239879, 1562239882);
INSERT INTO `blog_system_log` VALUES (159, 1, '文档列表', '/admin.php/api/doc/index.html', '[]', '浏览数据', 1, '127.0.0.1', 1562239879, 1562239879);
INSERT INTO `blog_system_log` VALUES (160, 1, '文档列表', '/admin.php/api/doc/index.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', 1, '127.0.0.1', 1562239880, 1562239880);
INSERT INTO `blog_system_log` VALUES (161, 1, '删除', '/admin.php/api/api/del.html?id=9', '{\"id\":\"9\"}', '浏览数据', 1, '127.0.0.1', 1562239892, 1562239892);
INSERT INTO `blog_system_log` VALUES (162, 1, '删除', '/admin.php/api/api/del.html?id=10', '{\"id\":\"10\"}', '浏览数据', 1, '127.0.0.1', 1562239894, 1562239894);
INSERT INTO `blog_system_log` VALUES (163, 1, '删除', '/admin.php/api/api/del.html?id=11', '{\"id\":\"11\"}', '浏览数据', 1, '127.0.0.1', 1562239899, 1562239899);
INSERT INTO `blog_system_log` VALUES (164, 1, '删除', '/admin.php/api/api/del.html?id=12', '{\"id\":\"12\"}', '浏览数据', 1, '127.0.0.1', 1562239900, 1562239900);
INSERT INTO `blog_system_log` VALUES (165, 1, '删除', '/admin.php/api/api/del.html?id=13', '{\"id\":\"13\"}', '浏览数据', 1, '127.0.0.1', 1562239902, 1562239902);
INSERT INTO `blog_system_log` VALUES (166, 1, '删除', '/admin.php/api/api/del.html?id=14', '{\"id\":\"14\"}', '浏览数据', 1, '127.0.0.1', 1562239904, 1562239904);
INSERT INTO `blog_system_log` VALUES (167, 1, '删除', '/admin.php/api/api_group/del.html?id=1', '{\"id\":\"1\"}', '浏览数据', 1, '127.0.0.1', 1562239909, 1562239909);
INSERT INTO `blog_system_log` VALUES (168, 1, '错误码维护', '/admin.php/api/error_code/index.html', '[]', '浏览数据', 4, '10.9.17.58', 1562239914, 1562586740);
INSERT INTO `blog_system_log` VALUES (169, 1, '错误码维护', '/admin.php/api/error_code/index.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', 4, '10.9.17.58', 1562239914, 1562586740);
INSERT INTO `blog_system_log` VALUES (170, 1, '未加入系统菜单', '/admin.php/api/error_code/add.html?hisi_iframe=yes', '{\"hisi_iframe\":\"yes\"}', '浏览数据', 1, '127.0.0.1', 1562239916, 1562239916);
INSERT INTO `blog_system_log` VALUES (171, 1, '新增', '/admin.php/api/api_group/add/hisi_model/apiGroup.html', '{\"name\":\"\\u5173\\u4e8e\\u6211\",\"desc\":\"\",\"id\":\"\",\"hisi_model\":\"apiGroup\"}', '保存数据', 4, '::1', 1562324064, 1562870924);
INSERT INTO `blog_system_log` VALUES (172, 1, '编辑', '/admin.php/api/api/edit.html?id=15&hisi_model=api&hisi_iframe=yes', '{\"id\":\"15\",\"hisi_model\":\"api\",\"hisi_iframe\":\"yes\"}', '浏览数据', 1, '10.9.17.58', 1562324137, 1562324137);
INSERT INTO `blog_system_log` VALUES (173, 1, '编辑', '/admin.php/api/api/edit.html', '{\"group_id\":\"4\",\"name\":\"\\u5934\\u90e8\\u914d\\u7f6e\",\"version\":\"v1\",\"module\":\"api\",\"controller\":\"Header\",\"action\":\"index\",\"path\":\"v1\\/header\",\"rule\":\"v1\\/header\",\"route\":\"api\\/v1.header\",\"access_token\":\"0\",\"user_token\":\"0\",\"desc\":\"\",\"return_example\":\"\",\"id\":\"23\",\"method\":\"\",\"route_map\":\"\"}', '保存数据', 2, '::1', 1562324138, 1562867032);
INSERT INTO `blog_system_log` VALUES (174, 1, '删除', '/admin.php/api/api/del.html?id=15', '{\"id\":\"15\"}', '浏览数据', 1, '10.9.17.58', 1562324164, 1562324164);
INSERT INTO `blog_system_log` VALUES (175, 1, '编辑', '/admin.php/api/api/edit.html?id=16&hisi_model=api&hisi_iframe=yes', '{\"id\":\"16\",\"hisi_model\":\"api\",\"hisi_iframe\":\"yes\"}', '浏览数据', 2, '10.9.17.58', 1562324913, 1562573467);
INSERT INTO `blog_system_log` VALUES (176, 1, '接口参数', '/admin.php/api/param/index.html?api_id=16&type=1', '{\"api_id\":\"16\",\"type\":\"1\"}', '浏览数据', 1, '10.9.17.58', 1562325883, 1562325883);
INSERT INTO `blog_system_log` VALUES (177, 1, '接口参数', '/admin.php/api/param/index/api_id/16/type/1.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\",\"api_id\":\"16\",\"type\":\"1\"}', '浏览数据', 1, '10.9.17.58', 1562325883, 1562325883);
INSERT INTO `blog_system_log` VALUES (178, 1, '状态', '/admin.php/api/api/status/table/api.html?field=user_token&id=16&val=1', '{\"field\":\"user_token\",\"id\":\"16\",\"val\":\"1\",\"table\":\"api\"}', '浏览数据', 1, '10.9.17.58', 1562328120, 1562328120);
INSERT INTO `blog_system_log` VALUES (179, 1, '状态', '/admin.php/api/api/status/table/api.html?field=access_token&id=16&val=1', '{\"field\":\"access_token\",\"id\":\"16\",\"val\":\"1\",\"table\":\"api\"}', '浏览数据', 2, '10.9.17.58', 1562328120, 1562330871);
INSERT INTO `blog_system_log` VALUES (180, 1, '状态', '/admin.php/api/api/status/table/api.html?field=user_token&id=16&val=0', '{\"field\":\"user_token\",\"id\":\"16\",\"val\":\"0\",\"table\":\"api\"}', '浏览数据', 1, '10.9.17.58', 1562330826, 1562330826);
INSERT INTO `blog_system_log` VALUES (181, 1, '状态', '/admin.php/api/api/status/table/api.html?field=access_token&id=16&val=0', '{\"field\":\"access_token\",\"id\":\"16\",\"val\":\"0\",\"table\":\"api\"}', '浏览数据', 1, '10.9.17.58', 1562330826, 1562330826);
INSERT INTO `blog_system_log` VALUES (182, 1, '状态', '/admin.php/api/app/status.html?id=1&val=0', '{\"id\":\"1\",\"val\":\"0\"}', '浏览数据', 1, '10.9.17.58', 1562331517, 1562331517);
INSERT INTO `blog_system_log` VALUES (183, 1, '状态', '/admin.php/api/app/status.html?id=1&val=1', '{\"id\":\"1\",\"val\":\"1\"}', '浏览数据', 1, '10.9.17.58', 1562331518, 1562331518);
INSERT INTO `blog_system_log` VALUES (184, 1, '刷新AppSecret', '/admin.php/api/app/refreshappsecret.html?id=1', '{\"id\":\"1\"}', '浏览数据', 3, '10.9.17.58', 1562331519, 1562331604);
INSERT INTO `blog_system_log` VALUES (185, 1, '新增', '/admin.php/api/app/add.html', '[]', '浏览数据', 1, '10.9.17.58', 1562331547, 1562331547);
INSERT INTO `blog_system_log` VALUES (186, 1, '删除', '/admin.php/api/api/del.html?id=17', '{\"id\":\"17\"}', '浏览数据', 1, '10.9.17.58', 1562573473, 1562573473);
INSERT INTO `blog_system_log` VALUES (187, 1, '状态', '/admin.php/api/api/status/table/api.html?field=user_token&id=18&val=0', '{\"field\":\"user_token\",\"id\":\"18\",\"val\":\"0\",\"table\":\"api\"}', '浏览数据', 1, '10.9.17.58', 1562573865, 1562573865);
INSERT INTO `blog_system_log` VALUES (188, 1, '编辑', '/admin.php/api/api/edit.html?id=18&hisi_model=api&hisi_iframe=yes', '{\"id\":\"18\",\"hisi_model\":\"api\",\"hisi_iframe\":\"yes\"}', '浏览数据', 1, '10.9.17.58', 1562573871, 1562573871);
INSERT INTO `blog_system_log` VALUES (189, 1, '编辑', '/admin.php/api/api_group/edit.html?id=2&hisi_model=apiGroup&hisi_iframe=yes', '{\"id\":\"2\",\"hisi_model\":\"apiGroup\",\"hisi_iframe\":\"yes\"}', '浏览数据', 1, '10.9.17.58', 1562573873, 1562573873);
INSERT INTO `blog_system_log` VALUES (190, 1, '编辑', '/admin.php/api/app_group/edit.html?id=1&hisi_model=apiAppGroup&hisi_iframe=yes', '{\"id\":\"1\",\"hisi_model\":\"apiAppGroup\",\"hisi_iframe\":\"yes\"}', '浏览数据', 2, '::1', 1562573878, 1562870931);
INSERT INTO `blog_system_log` VALUES (191, 1, '未加入系统菜单', '/admin.php/fun/article/upload/fun/article/20190708/dfd2cb03dc43afb5ef06161adc2e16f2.jpg', '{\"fun\":\"article\",\"0\":\"dfd2cb03dc43afb5ef06161adc2e16f2.jpg\"}', '浏览数据', 2, '10.9.17.58', 1562586258, 1562586334);
INSERT INTO `blog_system_log` VALUES (192, 1, '编辑', '/admin.php/api/api/edit.html?id=20&hisi_model=api&hisi_iframe=yes', '{\"id\":\"20\",\"hisi_model\":\"api\",\"hisi_iframe\":\"yes\"}', '浏览数据', 2, '10.9.17.58', 1562664153, 1562664162);
INSERT INTO `blog_system_log` VALUES (193, 1, '接口参数', '/admin.php/api/param/index.html?api_id=20&type=1', '{\"api_id\":\"20\",\"type\":\"1\"}', '浏览数据', 1, '10.9.17.58', 1562664155, 1562664155);
INSERT INTO `blog_system_log` VALUES (194, 1, '接口参数', '/admin.php/api/param/index/api_id/20/type/1.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\",\"api_id\":\"20\",\"type\":\"1\"}', '浏览数据', 1, '10.9.17.58', 1562664155, 1562664155);
INSERT INTO `blog_system_log` VALUES (195, 1, '接口参数', '/admin.php/api/param/index.html?api_id=20&type=2', '{\"api_id\":\"20\",\"type\":\"2\"}', '浏览数据', 1, '10.9.17.58', 1562664159, 1562664159);
INSERT INTO `blog_system_log` VALUES (196, 1, '接口参数', '/admin.php/api/param/index/api_id/20/type/2.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\",\"api_id\":\"20\",\"type\":\"2\"}', '浏览数据', 1, '10.9.17.58', 1562664159, 1562664159);
INSERT INTO `blog_system_log` VALUES (197, 1, '后台首页', '/system/index/index.html', '[]', '浏览数据', 8, '::1', 1562752646, 1563310809);
INSERT INTO `blog_system_log` VALUES (198, 1, '设置默认模块', '/admin.php/system/module/setdefault/id/4.html?val=1', '{\"val\":\"1\",\"id\":\"4\"}', '浏览数据', 1, '10.9.17.58', 1562753683, 1562753683);
INSERT INTO `blog_system_log` VALUES (199, 1, '设置默认模块', '/admin.php/system/module/setdefault/id/4.html?val=0', '{\"val\":\"0\",\"id\":\"4\"}', '浏览数据', 1, '10.9.17.58', 1562753777, 1562753777);
INSERT INTO `blog_system_log` VALUES (200, 1, '文章列表', '/fun/article/article.html', '[]', '浏览数据', 52, '::1', 1562754387, 1563311492);
INSERT INTO `blog_system_log` VALUES (201, 1, '文章列表', '/fun/article/article.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', 52, '::1', 1562754387, 1563311492);
INSERT INTO `blog_system_log` VALUES (202, 1, '关于我', '/fun/about/about.html', '[]', '浏览数据', 10, '10.9.17.58', 1562756158, 1562771722);
INSERT INTO `blog_system_log` VALUES (203, 1, '未加入系统菜单', '/fun/about/aboutbase.html', '[]', '浏览数据', 14, '::1', 1562756159, 1563311502);
INSERT INTO `blog_system_log` VALUES (204, 1, '关于我', '/fun/about/about.html', '{\"postData\":\"{&quot;about_name&quot;:&quot;\\u5c0f\\u80d6&quot;,&quot;about_desc&quot;:&quot;\\u5927\\u5bb6\\u597d,\\u6211\\u662fPHP\\u7a0b\\u5e8f\\u5458\\u5c0f\\u80d6,\\u53cc\\u6728\\u6797&quot;,&quot;about_image&quot;:&quot;\\/upload\\/fun\\/about\\/20190710\\/a0dd05923c2aa7397b1b98bdf3d5a9bf.jpg&quot;,&quot;about_git&quot;:&quot;https:\\/\\/github.com\\/yyx990803&quot;}\"}', '保存数据', 4, '10.9.17.58', 1562756295, 1562771721);
INSERT INTO `blog_system_log` VALUES (205, 1, '底部配置', '/fun/footer/footer.html', '[]', '浏览数据', 2, '::1', 1562757098, 1563311497);
INSERT INTO `blog_system_log` VALUES (206, 1, '接口分组', '/api/api_group/index.html', '[]', '浏览数据', 5, '10.9.17.58', 1562759940, 1562760148);
INSERT INTO `blog_system_log` VALUES (207, 1, '接口分组', '/api/api_group/index.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', 5, '10.9.17.58', 1562759941, 1562760148);
INSERT INTO `blog_system_log` VALUES (208, 1, '接口列表', '/api/api/index.html', '[]', '浏览数据', 19, '10.9.17.58', 1562759942, 1562770732);
INSERT INTO `blog_system_log` VALUES (209, 1, '接口列表', '/api/api/index.html?page=1&limit=20', '{\"page\":\"1\",\"limit\":\"20\"}', '浏览数据', 19, '10.9.17.58', 1562759943, 1562770732);
INSERT INTO `blog_system_log` VALUES (210, 1, '编辑', '/api/api/edit.html?id=18&hisi_model=api&hisi_iframe=yes', '{\"id\":\"18\",\"hisi_model\":\"api\",\"hisi_iframe\":\"yes\"}', '浏览数据', 1, '10.9.17.58', 1562759946, 1562759946);
INSERT INTO `blog_system_log` VALUES (211, 1, '编辑', '/api/api/edit.html?id=19&hisi_model=api&hisi_iframe=yes', '{\"id\":\"19\",\"hisi_model\":\"api\",\"hisi_iframe\":\"yes\"}', '浏览数据', 1, '10.9.17.58', 1562759977, 1562759977);
INSERT INTO `blog_system_log` VALUES (212, 1, '删除', '/api/api/del.html?id=19', '{\"id\":\"19\"}', '浏览数据', 1, '10.9.17.58', 1562759981, 1562759981);
INSERT INTO `blog_system_log` VALUES (213, 1, '删除', '/api/api/del.html?id=18', '{\"id\":\"18\"}', '浏览数据', 1, '10.9.17.58', 1562759984, 1562759984);
INSERT INTO `blog_system_log` VALUES (214, 1, '编辑', '/api/api/edit.html?id=16&hisi_model=api&hisi_iframe=yes', '{\"id\":\"16\",\"hisi_model\":\"api\",\"hisi_iframe\":\"yes\"}', '浏览数据', 10, '10.9.17.58', 1562759985, 1562767448);
INSERT INTO `blog_system_log` VALUES (215, 1, '新增', '/api/api/add.html?hisi_iframe=yes', '{\"hisi_iframe\":\"yes\"}', '浏览数据', 3, '10.9.17.58', 1562759993, 1562760197);
INSERT INTO `blog_system_log` VALUES (216, 1, '新增', '/api/api/add.html', '{\"group_id\":\"3\",\"name\":\"\\u4e2a\\u4eba\\u4fe1\\u606f\\u5361\",\"version\":\"v1\",\"module\":\"api\",\"controller\":\"InfoCard\",\"action\":\"index\",\"path\":\"\",\"rule\":\"\",\"route\":\"\",\"access_token\":\"1\",\"user_token\":\"1\",\"desc\":\"\",\"return_example\":\"\",\"id\":\"\",\"method\":\"\",\"route_map\":\"\"}', '保存数据', 2, '10.9.17.58', 1562760023, 1562760230);
INSERT INTO `blog_system_log` VALUES (217, 1, '状态', '/api/api/status/table/api.html?field=user_token&id=21&val=0', '{\"field\":\"user_token\",\"id\":\"21\",\"val\":\"0\",\"table\":\"api\"}', '浏览数据', 1, '10.9.17.58', 1562760032, 1562760032);
INSERT INTO `blog_system_log` VALUES (218, 1, '编辑', '/api/api/edit.html?id=21&hisi_model=api&hisi_iframe=yes', '{\"id\":\"21\",\"hisi_model\":\"api\",\"hisi_iframe\":\"yes\"}', '浏览数据', 6, '10.9.17.58', 1562760037, 1562767668);
INSERT INTO `blog_system_log` VALUES (219, 1, '删除', '/api/api/del.html?id=20', '{\"id\":\"20\"}', '浏览数据', 1, '10.9.17.58', 1562760129, 1562760129);
INSERT INTO `blog_system_log` VALUES (220, 1, '新增', '/api/api_group/add.html?hisi_model=apiGroup&hisi_iframe=yes', '{\"hisi_model\":\"apiGroup\",\"hisi_iframe\":\"yes\"}', '浏览数据', 1, '10.9.17.58', 1562760134, 1562760134);
INSERT INTO `blog_system_log` VALUES (221, 1, '新增', '/api/api_group/add/hisi_model/apiGroup.html', '{\"name\":\"\\u4e2a\\u4eba\\u4fe1\\u606f\\u5361\",\"desc\":\"\",\"id\":\"\",\"hisi_model\":\"apiGroup\"}', '保存数据', 1, '10.9.17.58', 1562760142, 1562760142);
INSERT INTO `blog_system_log` VALUES (222, 1, '编辑', '/api/api_group/edit.html?id=2&hisi_model=apiGroup&hisi_iframe=yes', '{\"id\":\"2\",\"hisi_model\":\"apiGroup\",\"hisi_iframe\":\"yes\"}', '浏览数据', 1, '10.9.17.58', 1562760149, 1562760149);
INSERT INTO `blog_system_log` VALUES (223, 1, '状态', '/api/api/status/table/api.html?field=user_token&id=22&val=0', '{\"field\":\"user_token\",\"id\":\"22\",\"val\":\"0\",\"table\":\"api\"}', '浏览数据', 1, '10.9.17.58', 1562760234, 1562760234);
INSERT INTO `blog_system_log` VALUES (224, 1, '应用列表', '/api/app/index.html', '[]', '浏览数据', 3, '10.9.17.58', 1562760237, 1562767223);
INSERT INTO `blog_system_log` VALUES (225, 1, '应用列表', '/api/app/index.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', 3, '10.9.17.58', 1562760237, 1562767223);
INSERT INTO `blog_system_log` VALUES (226, 1, '编辑', '/api/app/edit.html?id=1&hisi_model=apiApp', '{\"id\":\"1\",\"hisi_model\":\"apiApp\"}', '浏览数据', 2, '10.9.17.58', 1562760239, 1562767220);
INSERT INTO `blog_system_log` VALUES (227, 1, '编辑', '/api/app/edit/hisi_model/apiApp.html', '{\"group_id\":\"1\",\"name\":\"\\u6d4b\\u8bd5\\u5e94\\u7528\",\"site_name\":\"\\u6d4b\\u8bd5\\u7f51\\u7ad9\",\"site_domain\":\"api.app.50.hisiphp.test\",\"callback_domain\":\"http:\\/\\/api.app.50.hisiphp.test\\/index\\/token\",\"whitelist\":\"\",\"app_id\":\"2026668444\",\"app_secret\":\"i77E7x3zQX8PH6nQP6G6p7JmWXmmZ407\",\"desc\":\"\\u8fd9\\u662f\\u4e00\\u4e2a\\u6d4b\\u8bd5\\u63a5\\u53e3\",\"auth\":[\"16\",\"21\",\"22\"],\"id\":\"1\",\"hisi_model\":\"apiApp\"}', '保存数据', 1, '10.9.17.58', 1562760242, 1562760242);
INSERT INTO `blog_system_log` VALUES (228, 1, '状态', '/api/api/status/table/api.html?field=access_token&id=22&val=0', '{\"field\":\"access_token\",\"id\":\"22\",\"val\":\"0\",\"table\":\"api\"}', '浏览数据', 1, '10.9.17.58', 1562760249, 1562760249);
INSERT INTO `blog_system_log` VALUES (229, 1, '接口列表', '/api/api/index.html?page=1&limit=20&group_id=2&version=&keyword=', '{\"page\":\"1\",\"limit\":\"20\",\"group_id\":\"2\",\"version\":\"\",\"keyword\":\"\"}', '浏览数据', 2, '10.9.17.58', 1562760255, 1562760333);
INSERT INTO `blog_system_log` VALUES (230, 1, '接口列表', '/api/api/index.html?page=1&limit=20&group_id=3&version=&keyword=', '{\"page\":\"1\",\"limit\":\"20\",\"group_id\":\"3\",\"version\":\"\",\"keyword\":\"\"}', '浏览数据', 1, '10.9.17.58', 1562760257, 1562760257);
INSERT INTO `blog_system_log` VALUES (231, 1, '接口列表', '/api/api/index.html?page=1&limit=20&group_id=&version=&keyword=', '{\"page\":\"1\",\"limit\":\"20\",\"group_id\":\"\",\"version\":\"\",\"keyword\":\"\"}', '浏览数据', 1, '10.9.17.58', 1562760259, 1562760259);
INSERT INTO `blog_system_log` VALUES (232, 1, '编辑', '/api/api/edit.html', '{\"group_id\":\"2\",\"name\":\"\\u83b7\\u53d6\\u7f6e\\u9876\\u6587\\u7ae0\\u5217\\u8868\",\"version\":\"v1\",\"module\":\"api\",\"controller\":\"Articles\",\"action\":\"index\",\"path\":\"v1\\/Articles\",\"rule\":\"v1\\/Articles\",\"route\":\"api\\/v1.Articles\",\"access_token\":\"1\",\"user_token\":\"0\",\"desc\":\"\",\"return_example\":\"\",\"id\":\"16\",\"method\":\"\",\"route_map\":\"\"}', '保存数据', 1, '10.9.17.58', 1562760376, 1562760376);
INSERT INTO `blog_system_log` VALUES (233, 1, '接口参数', '/api/param/index.html', '[]', '浏览数据', 1, '10.9.17.58', 1562760414, 1562760414);
INSERT INTO `blog_system_log` VALUES (234, 1, '接口参数', '/api/param/index.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', 1, '10.9.17.58', 1562760414, 1562760414);
INSERT INTO `blog_system_log` VALUES (235, 1, '错误码维护', '/api/error_code/index.html', '[]', '浏览数据', 1, '10.9.17.58', 1562760416, 1562760416);
INSERT INTO `blog_system_log` VALUES (236, 1, '错误码维护', '/api/error_code/index.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', 1, '10.9.17.58', 1562760416, 1562760416);
INSERT INTO `blog_system_log` VALUES (237, 1, '接口参数', '/api/param/index.html?api_id=16&type=1', '{\"api_id\":\"16\",\"type\":\"1\"}', '浏览数据', 2, '10.9.17.58', 1562760421, 1562760427);
INSERT INTO `blog_system_log` VALUES (238, 1, '接口参数', '/api/param/index/api_id/16/type/1.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\",\"api_id\":\"16\",\"type\":\"1\"}', '浏览数据', 2, '10.9.17.58', 1562760422, 1562760427);
INSERT INTO `blog_system_log` VALUES (239, 1, '状态', '/api/api/status/table/api.html?field=access_token&id=21&val=0', '{\"field\":\"access_token\",\"id\":\"21\",\"val\":\"0\",\"table\":\"api\"}', '浏览数据', 1, '10.9.17.58', 1562767302, 1562767302);
INSERT INTO `blog_system_log` VALUES (240, 1, '状态', '/api/api/status/table/api.html?field=access_token&id=16&val=0', '{\"field\":\"access_token\",\"id\":\"16\",\"val\":\"0\",\"table\":\"api\"}', '浏览数据', 1, '10.9.17.58', 1562767302, 1562767302);
INSERT INTO `blog_system_log` VALUES (241, 1, '状态', '/api/api/status/table/api.html?field=access_token&id=16&val=1', '{\"field\":\"access_token\",\"id\":\"16\",\"val\":\"1\",\"table\":\"api\"}', '浏览数据', 1, '10.9.17.58', 1562767310, 1562767310);
INSERT INTO `blog_system_log` VALUES (242, 1, '状态', '/api/api/status/table/api.html?field=access_token&id=21&val=1', '{\"field\":\"access_token\",\"id\":\"21\",\"val\":\"1\",\"table\":\"api\"}', '浏览数据', 1, '10.9.17.58', 1562767311, 1562767311);
INSERT INTO `blog_system_log` VALUES (243, 1, '编辑', '/api/api/edit.html?id=22&hisi_model=api&hisi_iframe=yes', '{\"id\":\"22\",\"hisi_model\":\"api\",\"hisi_iframe\":\"yes\"}', '浏览数据', 1, '10.9.17.58', 1562767450, 1562767450);
INSERT INTO `blog_system_log` VALUES (244, 1, '文章类别', '/fun/article_cate/articlecate.html', '[]', '浏览数据', 3, '::1', 1562769688, 1563311491);
INSERT INTO `blog_system_log` VALUES (245, 1, '文章类别', '/fun/article_cate/articlecate.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', 3, '::1', 1562769688, 1563311491);
INSERT INTO `blog_system_log` VALUES (246, 1, '未加入系统菜单', '/fun/article/articledelete.html', '{\"id\":\"10\"}', '浏览数据', 13, '::1', 1562770329, 1562953568);
INSERT INTO `blog_system_log` VALUES (247, 1, '未加入系统菜单', '/fun/article/articleadd.html?hisi_iframe=yes', '{\"hisi_iframe\":\"yes\"}', '浏览数据', 22, '::1', 1562770337, 1562955318);
INSERT INTO `blog_system_log` VALUES (248, 1, '未加入系统菜单', '/fun/article/articlebase.html?status=add', '{\"status\":\"add\"}', '浏览数据', 22, '::1', 1562770337, 1562955318);
INSERT INTO `blog_system_log` VALUES (249, 1, '未加入系统菜单', '/fun/article/contentuploadimage.html', '[]', '保存数据', 5, '10.9.17.58', 1562771423, 1562771561);
INSERT INTO `blog_system_log` VALUES (250, 1, '未加入系统菜单', '/fun/article/articleadd.html', '{\"postData\":\"{&quot;article_cate&quot;:&quot;2&quot;,&quot;title&quot;:&quot;\\u6587\\u7ae0\\u6807\\u9898&quot;,&quot;intro&quot;:&quot;\\u6587\\u7ae0\\u6807\\u9898&quot;,&quot;author&quot;:&quot;&quot;,&quot;content&quot;:&quot;&lt;p&gt;&lt;span style=\\\\&quot;text-align: right;\\\\&quot;&gt;\\u6587\\u7ae0\\u6807\\u9898&lt;\\/span&gt;&lt;\\/p&gt;\\\\n            &quot;}\"}', '保存数据', 12, '::1', 1562771564, 1562955322);
INSERT INTO `blog_system_log` VALUES (251, 1, '未加入系统菜单', '/fun/article/status.html?id=5&field=is_top&val=1&val=1', '{\"id\":\"5\",\"field\":\"is_top\",\"val\":\"1\"}', '浏览数据', 1, '10.9.17.58', 1562771574, 1562771574);
INSERT INTO `blog_system_log` VALUES (252, 1, '未加入系统菜单', '/fun/article/articleedit.html?hisi_iframe=yes&id=5', '{\"hisi_iframe\":\"yes\",\"id\":\"5\"}', '浏览数据', 5, '::1', 1562771616, 1562955819);
INSERT INTO `blog_system_log` VALUES (253, 1, '未加入系统菜单', '/fun/article/articlebase.html?status=edit&id=5', '{\"status\":\"edit\",\"id\":\"5\"}', '浏览数据', 5, '::1', 1562771616, 1562955820);
INSERT INTO `blog_system_log` VALUES (254, 1, '未加入系统菜单', '/fun/article/articleedit.html', '{\"id\":\"12\",\"postData\":\"{&quot;article_cate&quot;:&quot;2&quot;,&quot;title&quot;:&quot;\\u6587\\u7ae0\\u6807\\u9898&quot;,&quot;intro&quot;:&quot;\\u6587\\u7ae0\\u6807\\u989811&quot;,&quot;is_top&quot;:&quot;1&quot;,&quot;author&quot;:&quot;&quot;,&quot;content&quot;:&quot;&lt;p&gt;&lt;span style=\\\\&quot;text-align: right;\\\\&quot;&gt;\\u6587\\u7ae0\\u6807\\u9898&lt;\\/span&gt;&lt;\\/p&gt;&quot;}\"}', '保存数据', 9, '::1', 1562771661, 1562955709);
INSERT INTO `blog_system_log` VALUES (255, 1, '未加入系统菜单', '/fun/about/uploadimage.html', '[]', '保存数据', 2, '10.9.17.58', 1562771714, 1562771719);
INSERT INTO `blog_system_log` VALUES (256, 1, '未加入系统菜单', '/admin.php/fun/article/articleedit.html?hisi_iframe=yes&id=5', '{\"hisi_iframe\":\"yes\",\"id\":\"5\"}', '浏览数据', 11, '::1', 1562800001, 1562957042);
INSERT INTO `blog_system_log` VALUES (257, 1, '未加入系统菜单', '/admin.php/fun/article/articlebase.html?status=edit&id=5', '{\"status\":\"edit\",\"id\":\"5\"}', '浏览数据', 9, '::1', 1562800001, 1562957043);
INSERT INTO `blog_system_log` VALUES (258, 1, '未加入系统菜单', '/admin.php/fun/article/articlebase.html?status=add', '{\"status\":\"add\"}', '浏览数据', 4, '::1', 1562804243, 1562874440);
INSERT INTO `blog_system_log` VALUES (259, 1, '未加入系统菜单', '/admin.php/fun/article_cate/articlecatedelete.html', '{\"id\":\"24\"}', '保存数据', 4, '::1', 1562835095, 1562836918);
INSERT INTO `blog_system_log` VALUES (260, 1, '未加入系统菜单', '/admin.php/fun/article_cate/articlecatedelete.html', '{\"id\":\"2\"}', '浏览数据', 7, '::1', 1562836946, 1562837053);
INSERT INTO `blog_system_log` VALUES (261, 1, '修改菜单', '/admin.php/system/menu/edit/id/220/mod/fun.html', '{\"id\":\"220\",\"mod\":\"fun\"}', '浏览数据', 1, '::1', 1562839214, 1562839214);
INSERT INTO `blog_system_log` VALUES (262, 1, '未加入系统菜单', '/admin.php/fun/footer/footerbase.html', '[]', '浏览数据', 16, '::1', 1562841998, 1562956880);
INSERT INTO `blog_system_log` VALUES (263, 1, '底部配置', '/admin.php/fun/footer/footer.html', '{\"postData\":\"{&quot;footer_text&quot;:&quot;\\u611f\\u8c22\\u5927\\u4f19\\u7684\\u5f3a\\u529b\\u652f\\u6301&quot;,&quot;icon&quot;:&quot;el-icon-user&quot;,&quot;icon_link&quot;:&quot;https:\\/\\/element.eleme.io\\/#\\/zh-CN\\/component\\/icon&quot;}\"}', '保存数据', 5, '::1', 1562842636, 1562868589);
INSERT INTO `blog_system_log` VALUES (264, 1, '修改菜单', '/admin.php/system/menu/edit/id/219/mod/fun.html', '{\"id\":\"219\",\"mod\":\"fun\"}', '浏览数据', 1, '::1', 1562845622, 1562845622);
INSERT INTO `blog_system_log` VALUES (265, 1, '头部配置', '/admin.php/fun/header/header.html', '[]', '浏览数据', 17, '::1', 1562846648, 1562956881);
INSERT INTO `blog_system_log` VALUES (266, 1, '未加入系统菜单', '/admin.php/fun/header/headerbase.html', '[]', '浏览数据', 17, '::1', 1562846648, 1562956881);
INSERT INTO `blog_system_log` VALUES (267, 1, '头部配置', '/admin.php/fun/header/header.html', '{\"postData\":\"{&quot;title&quot;:&quot;\\u6280\\u672f\\u9648&quot;,&quot;subhead&quot;:&quot;\\u4ec0\\u4e48\\u90fd\\u559c\\u6b22&quot;}\"}', '保存数据', 8, '::1', 1562847111, 1562867930);
INSERT INTO `blog_system_log` VALUES (268, 1, '修改菜单', '/admin.php/system/menu/edit/id/218/mod/fun.html', '{\"id\":\"218\",\"mod\":\"fun\"}', '浏览数据', 2, '::1', 1562847975, 1562847998);
INSERT INTO `blog_system_log` VALUES (269, 1, '个人信息卡', '/admin.php/fun/info/info.html', '[]', '浏览数据', 14, '::1', 1562848077, 1562866893);
INSERT INTO `blog_system_log` VALUES (270, 1, '未加入系统菜单', '/admin.php/fun/info/infobase.html', '[]', '浏览数据', 13, '::1', 1562848188, 1562866893);
INSERT INTO `blog_system_log` VALUES (271, 1, '个人信息卡', '/admin.php/fun/info/info.html', '{\"postData\":\"{&quot;about_name&quot;:&quot;\\u6280\\u672f\\u9648&quot;,&quot;about_desc&quot;:&quot;\\u5927\\u5bb6\\u597d,\\u6211\\u662fPHP\\u7a0b\\u5e8f\\u5458\\u6280\\u672f\\u9648&quot;,&quot;about_image&quot;:&quot;\\/upload\\/fun\\/about\\/20190710\\/a0dd05923c2aa7397b1b98bdf3d5a9bf.jpg&quot;,&quot;about_git&quot;:&quot;https:\\/\\/github.com\\/yyx990803&quot;}\"}', '保存数据', 1, '::1', 1562848258, 1562848258);
INSERT INTO `blog_system_log` VALUES (272, 1, '添加菜单', '/admin.php/system/menu/add/pid/222/mod/fun.html', '{\"pid\":\"222\",\"mod\":\"fun\"}', '浏览数据', 1, '::1', 1562848479, 1562848479);
INSERT INTO `blog_system_log` VALUES (273, 1, '修改菜单', '/admin.php/system/menu/edit/id/223/mod/fun.html', '{\"id\":\"223\",\"mod\":\"fun\"}', '浏览数据', 2, '::1', 1562850909, 1562850936);
INSERT INTO `blog_system_log` VALUES (274, 1, '关于我文章', '/admin.php/fun/about/about.html', '[]', '浏览数据', 35, '::1', 1562851075, 1562956875);
INSERT INTO `blog_system_log` VALUES (275, 1, '未加入系统菜单', '/admin.php/fun/about/aboutadd.html', '{\"postData\":\"{&quot;content&quot;:&quot;&lt;img src=\\\\&quot;\\/upload\\/fun\\/about\\/20190711\\/29436d410c0a3a3b2cdb38fd2f41f5f3.jpg\\\\&quot; alt=\\\\&quot;undefined\\\\&quot;&gt;\\\\n            &quot;}\"}', '保存数据', 2, '::1', 1562852723, 1562852765);
INSERT INTO `blog_system_log` VALUES (276, 1, '关于我文章', '/admin.php/fun/about/about.html', '{\"postData\":\"{&quot;title&quot;:&quot;\\u8fd9\\u662f\\u6211\\u7684\\u7b2c\\u4e00\\u535a\\u5ba2\\u7f51\\u7ad9,\\u7f51\\u7ad9\\u8fd8\\u5728\\u6301\\u7eed\\u4e0d\\u65ad\\u7684\\u8fed\\u4ee3\\u4e2d&quot;,&quot;content&quot;:&quot;&lt;p&gt;&lt;img src=\\\\&quot;\\/upload\\/fun\\/about\\/20190711\\/962be078348d6527e39ccdc39374ed4c.jpg\\\\&quot; alt=\\\\&quot;undefined\\\\&quot;&gt;&lt;br&gt;&lt;\\/p&gt;&lt;p&gt;\\u8fd9\\u662f\\u6211\\u7684\\u7b2c\\u4e00\\u4e2a\\u535a\\u5ba2\\u7f51\\u7ad9,\\u8bf7\\u5927\\u5bb6\\u591a\\u591a\\u5305\\u6db5&lt;\\/p&gt;\\\\n            &quot;}\"}', '保存数据', 17, '::1', 1562852786, 1562873140);
INSERT INTO `blog_system_log` VALUES (277, 1, '编辑', '/admin.php/api/api/edit.html?id=23&hisi_model=api&hisi_iframe=yes', '{\"id\":\"23\",\"hisi_model\":\"api\",\"hisi_iframe\":\"yes\"}', '浏览数据', 3, '::1', 1562867028, 1562868082);
INSERT INTO `blog_system_log` VALUES (278, 1, '编辑', '/admin.php/api/api/edit.html?id=24&hisi_model=api&hisi_iframe=yes', '{\"id\":\"24\",\"hisi_model\":\"api\",\"hisi_iframe\":\"yes\"}', '浏览数据', 1, '::1', 1562868073, 1562868073);
INSERT INTO `blog_system_log` VALUES (279, 1, '未加入系统菜单', '/admin.php/fun/article/status.html?id=6&field=is_top&val=1&val=1', '{\"id\":\"6\",\"field\":\"is_top\",\"val\":\"1\"}', '浏览数据', 1, '::1', 1562874454, 1562874454);
INSERT INTO `blog_system_log` VALUES (280, 1, '未加入系统菜单', '/admin.php/fun/article/articleedit.html?hisi_iframe=yes&id=6', '{\"hisi_iframe\":\"yes\",\"id\":\"6\"}', '浏览数据', 2, '::1', 1562874537, 1562874544);
INSERT INTO `blog_system_log` VALUES (281, 1, '未加入系统菜单', '/admin.php/fun/article/articlebase.html?status=edit&id=6', '{\"status\":\"edit\",\"id\":\"6\"}', '浏览数据', 2, '::1', 1562874537, 1562874544);
INSERT INTO `blog_system_log` VALUES (282, 1, '个人信息卡', '/fun/info/info.html', '[]', '浏览数据', 5, '::1', 1562946908, 1563311494);
INSERT INTO `blog_system_log` VALUES (283, 1, '未加入系统菜单', '/fun/info/infobase.html', '[]', '浏览数据', 5, '::1', 1562946909, 1563311494);
INSERT INTO `blog_system_log` VALUES (284, 1, '系统菜单', '/system/menu/index.html', '[]', '浏览数据', 1, '::1', 1562947702, 1562947702);
INSERT INTO `blog_system_log` VALUES (285, 1, '系统设置', '/system/system/index.html', '[]', '浏览数据', 2, '::1', 1562947703, 1563311001);
INSERT INTO `blog_system_log` VALUES (286, 1, '系统配置', '/system/system/index/group/sys.html', '{\"group\":\"sys\"}', '浏览数据', 1, '::1', 1562947706, 1562947706);
INSERT INTO `blog_system_log` VALUES (287, 1, '系统配置', '/system/system/index/group/sys.html', '{\"id\":{\"editor\":\"umeditor\",\"admin_path\":\"admin.php\",\"config_group\":\"\",\"app_debug\":\"1\",\"app_trace\":\"1\",\"system_log_retention\":\"30\"},\"type\":{\"editor\":\"select\",\"admin_path\":\"input\",\"config_group\":\"array\",\"app_debug\":\"switch\",\"app_trace\":\"switch\",\"cloud_push\":\"switch\",\"multi_language\":\"switch\",\"admin_whitelist_verify\":\"switch\",\"system_log_retention\":\"input\"},\"__token__\":\"e6e4d3f650d952b03d90f545285e017f\",\"group\":\"sys\"}', '保存数据', 1, '::1', 1562947708, 1562947708);
INSERT INTO `blog_system_log` VALUES (288, 1, '未加入系统菜单', '/admin.php/fun/article/articledelete.html', '{\"id\":\"12\"}', '浏览数据', 3, '::1', 1562947760, 1562956980);
INSERT INTO `blog_system_log` VALUES (289, 1, '未加入系统菜单', '/fun/article/status.html?id=12&field=is_top&val=1&val=1', '{\"id\":\"12\",\"field\":\"is_top\",\"val\":\"1\"}', '浏览数据', 1, '::1', 1562955343, 1562955343);
INSERT INTO `blog_system_log` VALUES (290, 1, '未加入系统菜单', '/fun/article/status.html?id=11&field=is_top&val=1&val=1', '{\"id\":\"11\",\"field\":\"is_top\",\"val\":\"1\"}', '浏览数据', 1, '::1', 1562955344, 1562955344);
INSERT INTO `blog_system_log` VALUES (291, 1, '未加入系统菜单', '/fun/article/articleedit.html?hisi_iframe=yes&id=12', '{\"hisi_iframe\":\"yes\",\"id\":\"12\"}', '浏览数据', 7, '::1', 1562955636, 1562956221);
INSERT INTO `blog_system_log` VALUES (292, 1, '未加入系统菜单', '/fun/article/articlebase.html?status=edit&id=12', '{\"status\":\"edit\",\"id\":\"12\"}', '浏览数据', 7, '::1', 1562955636, 1562956221);
INSERT INTO `blog_system_log` VALUES (293, 1, '未加入系统菜单', '/fun/article/articleedit.html?hisi_iframe=yes&id=11', '{\"hisi_iframe\":\"yes\",\"id\":\"11\"}', '浏览数据', 4, '::1', 1562955661, 1562956147);
INSERT INTO `blog_system_log` VALUES (294, 1, '未加入系统菜单', '/fun/article/articlebase.html?status=edit&id=11', '{\"status\":\"edit\",\"id\":\"11\"}', '浏览数据', 4, '::1', 1562955662, 1562956147);
INSERT INTO `blog_system_log` VALUES (295, 1, '关于我文章', '/fun/about/about.html', '[]', '浏览数据', 4, '::1', 1562956269, 1563311502);
INSERT INTO `blog_system_log` VALUES (296, 1, '未加入系统菜单', '/admin.php/fun/article/articleedit.html?hisi_iframe=yes&id=12', '{\"hisi_iframe\":\"yes\",\"id\":\"12\"}', '浏览数据', 6, '::1', 1562956472, 1562956919);
INSERT INTO `blog_system_log` VALUES (297, 1, '未加入系统菜单', '/admin.php/fun/article/articlebase.html?status=edit&id=12', '{\"status\":\"edit\",\"id\":\"12\"}', '浏览数据', 6, '::1', 1562956473, 1562956919);
INSERT INTO `blog_system_log` VALUES (298, 1, '未加入系统菜单', '/admin.php/fun/article/status.html?id=5&field=is_top&val=0&val=0', '{\"id\":\"5\",\"field\":\"is_top\",\"val\":\"0\"}', '浏览数据', 1, '::1', 1562957741, 1562957741);
INSERT INTO `blog_system_log` VALUES (299, 1, '未加入系统菜单', '/admin.php/fun/article/editstatus.html?id=5&val=1', '{\"id\":\"5\",\"val\":\"1\"}', '浏览数据', 2, '::1', 1562958639, 1562958675);
INSERT INTO `blog_system_log` VALUES (300, 1, '未加入系统菜单', '/admin.php/fun/article/editstatus.html?id=5&val=0', '{\"id\":\"5\",\"val\":\"0\"}', '浏览数据', 1, '::1', 1562958671, 1562958671);
INSERT INTO `blog_system_log` VALUES (301, 1, '应用市场', '/system/store/index.html', '[]', '浏览数据', 7, '::1', 1563310818, 1563311021);
INSERT INTO `blog_system_log` VALUES (302, 1, '应用市场', '/system/store/index.html?page=1&limit=10', '{\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', 7, '::1', 1563310821, 1563311021);
INSERT INTO `blog_system_log` VALUES (303, 1, '框架升级', '/system/upgrade/index.html', '{\"account\":\"18600000000\",\"password\":\"6b9693591c526220d012ffbef07f0bc8\"}', '保存数据', 1, '::1', 1563310863, 1563310863);
INSERT INTO `blog_system_log` VALUES (304, 1, '安装应用', '/system/store/install.html?app_name=user&app_type=1&app_keys=824999d8f3b6c7048cd461515c8ebb22&branch_id=2000019', '{\"app_name\":\"user\",\"app_type\":\"1\",\"app_keys\":\"824999d8f3b6c7048cd461515c8ebb22\",\"branch_id\":\"2000019\"}', '浏览数据', 1, '::1', 1563310873, 1563310873);
INSERT INTO `blog_system_log` VALUES (305, 1, '本地模块', '/system/module/index.html', '[]', '浏览数据', 4, '::1', 1563310900, 1563311023);
INSERT INTO `blog_system_log` VALUES (306, 1, '个人信息设置', '/system/user/info.html', '[]', '浏览数据', 1, '::1', 1563310903, 1563310903);
INSERT INTO `blog_system_log` VALUES (307, 1, '系统管理员', '/system/user/index.html', '[]', '浏览数据', 1, '::1', 1563310905, 1563310905);
INSERT INTO `blog_system_log` VALUES (308, 1, '系统管理员', '/system/user/index.html?page=1&limit=20', '{\"page\":\"1\",\"limit\":\"20\"}', '浏览数据', 1, '::1', 1563310905, 1563310905);
INSERT INTO `blog_system_log` VALUES (309, 1, '框架升级', '/system/upgrade/index.html', '[]', '浏览数据', 3, '::1', 1563310936, 1563311006);
INSERT INTO `blog_system_log` VALUES (310, 1, '获取升级列表', '/system/upgrade/lists.html', '[]', '浏览数据', 2, '::1', 1563310947, 1563310971);
INSERT INTO `blog_system_log` VALUES (311, 1, '获取升级列表', '/system/upgrade/lists.html', '{\"identifier\":\"system\",\"app_type\":\"system\",\"app_version\":\"2.0.6\"}', '保存数据', 2, '::1', 1563310948, 1563310972);
INSERT INTO `blog_system_log` VALUES (312, 1, '下载升级包', '/system/upgrade/download.html', '{\"identifier\":\"system\",\"app_type\":\"system\",\"app_version\":\"2.0.5\",\"version\":\"2.0.6\"}', '保存数据', 1, '::1', 1563310960, 1563310960);
INSERT INTO `blog_system_log` VALUES (313, 1, '安装升级包', '/system/upgrade/install.html', '{\"identifier\":\"system\",\"app_type\":\"system\",\"app_version\":\"2.0.5\",\"file\":\"1563310960.zip\",\"version\":\"2.0.6\"}', '保存数据', 1, '::1', 1563310965, 1563310965);
INSERT INTO `blog_system_log` VALUES (314, 1, '插件钩子', '/system/hook/index.html', '[]', '浏览数据', 1, '::1', 1563310992, 1563310992);
INSERT INTO `blog_system_log` VALUES (315, 1, '插件钩子', '/system/hook/index.html?page=1&limit=20', '{\"page\":\"1\",\"limit\":\"20\"}', '浏览数据', 1, '::1', 1563310992, 1563310992);
INSERT INTO `blog_system_log` VALUES (316, 1, '本地插件', '/system/plugins/index.html', '[]', '浏览数据', 2, '::1', 1563310992, 1563311488);
INSERT INTO `blog_system_log` VALUES (317, 1, '配置管理', '/system/config/index.html', '[]', '浏览数据', 1, '::1', 1563311488, 1563311488);
INSERT INTO `blog_system_log` VALUES (318, 1, '配置管理', '/system/config/index.html?page=1&limit=20', '{\"page\":\"1\",\"limit\":\"20\"}', '浏览数据', 1, '::1', 1563311489, 1563311489);
INSERT INTO `blog_system_log` VALUES (319, 1, '未加入系统菜单', '/fun/article/articlebase.html', '{\"status\":\"add\"}', '保存数据', 1, '::1', 1563311493, 1563311493);
INSERT INTO `blog_system_log` VALUES (320, 1, '未加入系统菜单', '/fun/footer/footerbase.html', '[]', '浏览数据', 1, '::1', 1563311497, 1563311497);
INSERT INTO `blog_system_log` VALUES (321, 1, '头部配置', '/fun/header/header.html', '[]', '浏览数据', 2, '::1', 1563311500, 1563311505);
INSERT INTO `blog_system_log` VALUES (322, 1, '未加入系统菜单', '/fun/header/headerbase.html', '[]', '浏览数据', 2, '::1', 1563311500, 1563311507);
COMMIT;

-- ----------------------------
-- Table structure for blog_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `blog_system_menu`;
CREATE TABLE `blog_system_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID(快捷菜单专用)',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL COMMENT '模块名或插件名，插件名格式:plugins.插件名',
  `title` varchar(20) NOT NULL COMMENT '菜单标题',
  `icon` varchar(80) NOT NULL DEFAULT 'aicon ai-shezhi' COMMENT '菜单图标',
  `url` varchar(200) NOT NULL COMMENT '链接地址(模块/控制器/方法)',
  `param` varchar(200) NOT NULL DEFAULT '' COMMENT '扩展参数',
  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '打开方式(_blank,_self)',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `debug` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '开发模式可见',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统菜单，系统菜单不可删除',
  `nav` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否为菜单显示，1显示0不显示',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态1显示，0隐藏',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='[系统] 管理菜单';

-- ----------------------------
-- Records of blog_system_menu
-- ----------------------------
BEGIN;
INSERT INTO `blog_system_menu` VALUES (1, 0, 0, 'system', '首页', '', 'system/index', '', '_self', 0, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (2, 0, 0, 'system', '系统', '', 'system/system', '', '_self', 1, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (3, 0, 0, 'system', '插件', 'aicon ai-shezhi', 'system/plugins', '', '_self', 2, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (4, 0, 1, 'system', '快捷菜单', 'aicon ai-caidan', 'system/quick', '', '_self', 0, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (5, 0, 3, 'system', '插件列表', 'aicon ai-mokuaiguanli', 'system/plugins', '', '_self', 0, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (6, 0, 2, 'system', '系统基础', 'aicon ai-gongneng', 'system/system', '', '_self', 1, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (7, 0, 17, 'system', '导入主题SQL', '', 'system/module/exeSql', '', '_self', 10, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (8, 0, 2, 'system', '系统扩展', 'aicon ai-shezhi', 'system/extend', '', '_self', 3, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (9, 0, 4, 'system', '预留占位', '', '', '', '_self', 4, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (10, 0, 6, 'system', '系统设置', 'aicon ai-icon01', 'system/system/index', '', '_self', 1, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (11, 0, 6, 'system', '配置管理', 'aicon ai-peizhiguanli', 'system/config/index', '', '_self', 2, 1, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (12, 0, 6, 'system', '系统菜单', 'aicon ai-systemmenu', 'system/menu/index', '', '_self', 3, 1, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (13, 0, 6, 'system', '管理员角色', '', 'system/user/role', '', '_self', 4, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (14, 0, 6, 'system', '系统管理员', 'aicon ai-tubiao05', 'system/user/index', '', '_self', 5, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (15, 0, 6, 'system', '系统日志', 'aicon ai-xitongrizhi-tiaoshi', 'system/log/index', '', '_self', 7, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (16, 0, 6, 'system', '附件管理', '', 'system/annex/index', '', '_self', 8, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (17, 0, 8, 'system', '本地模块', 'aicon ai-mokuaiguanli1', 'system/module/index', '', '_self', 1, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (18, 0, 8, 'system', '本地插件', 'aicon ai-chajianguanli', 'system/plugins/index', '', '_self', 2, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (19, 0, 8, 'system', '插件钩子', 'aicon ai-icon-test', 'system/hook/index', '', '_self', 3, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (20, 0, 4, 'system', '预留占位', '', '', '', '_self', 1, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (21, 0, 4, 'system', '预留占位', '', '', '', '_self', 2, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (22, 0, 4, 'system', '预留占位', '', '', '', '_self', 1, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (23, 0, 4, 'system', '预留占位', '', '', '', '_self', 2, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (24, 0, 4, 'system', '后台首页', '', 'system/index/index', '', '_self', 100, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (25, 0, 4, 'system', '清空缓存', '', 'system/index/clear', '', '_self', 2, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (26, 0, 12, 'system', '添加菜单', '', 'system/menu/add', '', '_self', 1, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (27, 0, 12, 'system', '修改菜单', '', 'system/menu/edit', '', '_self', 2, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (28, 0, 12, 'system', '删除菜单', '', 'system/menu/del', '', '_self', 3, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (29, 0, 12, 'system', '状态设置', '', 'system/menu/status', '', '_self', 4, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (30, 0, 12, 'system', '排序设置', '', 'system/menu/sort', '', '_self', 5, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (31, 0, 12, 'system', '添加快捷菜单', '', 'system/menu/quick', '', '_self', 6, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (32, 0, 12, 'system', '导出菜单', '', 'system/menu/export', '', '_self', 7, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (33, 0, 13, 'system', '添加角色', '', 'system/user/addrole', '', '_self', 1, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (34, 0, 13, 'system', '修改角色', '', 'system/user/editrole', '', '_self', 2, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (35, 0, 13, 'system', '删除角色', '', 'system/user/delrole', '', '_self', 3, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (36, 0, 13, 'system', '状态设置', '', 'system/user/statusRole', '', '_self', 4, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (37, 0, 14, 'system', '添加管理员', '', 'system/user/adduser', '', '_self', 1, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (38, 0, 14, 'system', '修改管理员', '', 'system/user/edituser', '', '_self', 2, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (39, 0, 14, 'system', '删除管理员', '', 'system/user/deluser', '', '_self', 3, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (40, 0, 14, 'system', '状态设置', '', 'system/user/status', '', '_self', 4, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (41, 0, 4, 'system', '个人信息设置', '', 'system/user/info', '', '_self', 5, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (42, 0, 18, 'system', '安装插件', '', 'system/plugins/install', '', '_self', 1, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (43, 0, 18, 'system', '卸载插件', '', 'system/plugins/uninstall', '', '_self', 2, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (44, 0, 18, 'system', '删除插件', '', 'system/plugins/del', '', '_self', 3, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (45, 0, 18, 'system', '状态设置', '', 'system/plugins/status', '', '_self', 4, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (46, 0, 18, 'system', '生成插件', '', 'system/plugins/design', '', '_self', 5, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (47, 0, 18, 'system', '运行插件', '', 'system/plugins/run', '', '_self', 6, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (48, 0, 18, 'system', '更新插件', '', 'system/plugins/update', '', '_self', 7, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (49, 0, 18, 'system', '插件配置', '', 'system/plugins/setting', '', '_self', 8, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (50, 0, 19, 'system', '添加钩子', '', 'system/hook/add', '', '_self', 1, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (51, 0, 19, 'system', '修改钩子', '', 'system/hook/edit', '', '_self', 2, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (52, 0, 19, 'system', '删除钩子', '', 'system/hook/del', '', '_self', 3, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (53, 0, 19, 'system', '状态设置', '', 'system/hook/status', '', '_self', 4, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (54, 0, 19, 'system', '插件排序', '', 'system/hook/sort', '', '_self', 5, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (55, 0, 11, 'system', '添加配置', '', 'system/config/add', '', '_self', 1, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (56, 0, 11, 'system', '修改配置', '', 'system/config/edit', '', '_self', 2, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (57, 0, 11, 'system', '删除配置', '', 'system/config/del', '', '_self', 3, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (58, 0, 11, 'system', '状态设置', '', 'system/config/status', '', '_self', 4, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (59, 0, 11, 'system', '排序设置', '', 'system/config/sort', '', '_self', 5, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (60, 0, 10, 'system', '基础配置', '', 'system/system/index', 'group=base', '_self', 1, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (61, 0, 10, 'system', '系统配置', '', 'system/system/index', 'group=sys', '_self', 2, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (62, 0, 10, 'system', '上传配置', '', 'system/system/index', 'group=upload', '_self', 3, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (63, 0, 10, 'system', '开发配置', '', 'system/system/index', 'group=develop', '_self', 4, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (64, 0, 17, 'system', '生成模块', '', 'system/module/design', '', '_self', 6, 1, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (65, 0, 17, 'system', '安装模块', '', 'system/module/install', '', '_self', 1, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (66, 0, 17, 'system', '卸载模块', '', 'system/module/uninstall', '', '_self', 2, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (67, 0, 17, 'system', '状态设置', '', 'system/module/status', '', '_self', 3, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (68, 0, 17, 'system', '设置默认模块', '', 'system/module/setdefault', '', '_self', 4, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (69, 0, 17, 'system', '删除模块', '', 'system/module/del', '', '_self', 5, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (70, 0, 4, 'system', '预留占位', '', '', '', '_self', 1, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (71, 0, 4, 'system', '预留占位', '', '', '', '_self', 2, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (72, 0, 4, 'system', '预留占位', '', '', '', '_self', 3, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (73, 0, 4, 'system', '预留占位', '', '', '', '_self', 4, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (74, 0, 4, 'system', '预留占位', '', '', '', '_self', 5, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (75, 0, 4, 'system', '预留占位', '', '', '', '_self', 0, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (76, 0, 4, 'system', '预留占位', '', '', '', '_self', 0, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (77, 0, 4, 'system', '预留占位', '', '', '', '_self', 0, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (78, 0, 16, 'system', '附件上传', '', 'system/annex/upload', '', '_self', 1, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (79, 0, 16, 'system', '删除附件', '', 'system/annex/del', '', '_self', 2, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (80, 0, 8, 'system', '框架升级', 'aicon ai-iconfontshengji', 'system/upgrade/index', '', '_self', 4, 0, 1, 1, 1, 1491352728);
INSERT INTO `blog_system_menu` VALUES (81, 0, 80, 'system', '获取升级列表', '', 'system/upgrade/lists', '', '_self', 0, 0, 1, 1, 1, 1491353504);
INSERT INTO `blog_system_menu` VALUES (82, 0, 80, 'system', '安装升级包', '', 'system/upgrade/install', '', '_self', 0, 0, 1, 1, 1, 1491353568);
INSERT INTO `blog_system_menu` VALUES (83, 0, 80, 'system', '下载升级包', '', 'system/upgrade/download', '', '_self', 0, 0, 1, 1, 1, 1491395830);
INSERT INTO `blog_system_menu` VALUES (84, 0, 6, 'system', '数据库管理', 'aicon ai-shujukuguanli', 'system/database/index', '', '_self', 6, 0, 1, 1, 1, 1491461136);
INSERT INTO `blog_system_menu` VALUES (85, 0, 84, 'system', '备份数据库', '', 'system/database/export', '', '_self', 0, 0, 1, 1, 1, 1491461250);
INSERT INTO `blog_system_menu` VALUES (86, 0, 84, 'system', '恢复数据库', '', 'system/database/import', '', '_self', 0, 0, 1, 1, 1, 1491461315);
INSERT INTO `blog_system_menu` VALUES (87, 0, 84, 'system', '优化数据库', '', 'system/database/optimize', '', '_self', 0, 0, 1, 1, 1, 1491467000);
INSERT INTO `blog_system_menu` VALUES (88, 0, 84, 'system', '删除备份', '', 'system/database/del', '', '_self', 0, 0, 1, 1, 1, 1491467058);
INSERT INTO `blog_system_menu` VALUES (89, 0, 84, 'system', '修复数据库', '', 'system/database/repair', '', '_self', 0, 0, 1, 1, 1, 1491880879);
INSERT INTO `blog_system_menu` VALUES (90, 0, 21, 'system', '设置默认等级', '', 'system/member/setdefault', '', '_self', 0, 0, 1, 1, 1, 1491966585);
INSERT INTO `blog_system_menu` VALUES (91, 0, 10, 'system', '数据库配置', '', 'system/system/index', 'group=databases', '_self', 5, 0, 1, 0, 1, 1492072213);
INSERT INTO `blog_system_menu` VALUES (92, 0, 17, 'system', '模块打包', '', 'system/module/package', '', '_self', 7, 0, 1, 1, 1, 1492134693);
INSERT INTO `blog_system_menu` VALUES (93, 0, 18, 'system', '插件打包', '', 'system/plugins/package', '', '_self', 0, 0, 1, 1, 1, 1492134743);
INSERT INTO `blog_system_menu` VALUES (94, 0, 17, 'system', '主题管理', '', 'system/module/theme', '', '_self', 8, 0, 1, 1, 1, 1492433470);
INSERT INTO `blog_system_menu` VALUES (95, 0, 17, 'system', '设置默认主题', '', 'system/module/setdefaulttheme', '', '_self', 9, 0, 1, 1, 1, 1492433618);
INSERT INTO `blog_system_menu` VALUES (96, 0, 17, 'system', '删除主题', '', 'system/module/deltheme', '', '_self', 10, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (97, 0, 6, 'system', '语言包管理', '', 'system/language/index', '', '_self', 9, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (98, 0, 97, 'system', '添加语言包', '', 'system/language/add', '', '_self', 100, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (99, 0, 97, 'system', '修改语言包', '', 'system/language/edit', '', '_self', 100, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (100, 0, 97, 'system', '删除语言包', '', 'system/language/del', '', '_self', 100, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (101, 0, 97, 'system', '排序设置', '', 'system/language/sort', '', '_self', 100, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (102, 0, 97, 'system', '状态设置', '', 'system/language/status', '', '_self', 100, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (103, 0, 16, 'system', '收藏夹图标上传', '', 'system/annex/favicon', '', '_self', 3, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (104, 0, 17, 'system', '导入模块', '', 'system/module/import', '', '_self', 11, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (105, 0, 4, 'system', '后台首页', '', 'system/index/welcome', '', '_self', 100, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (106, 0, 4, 'system', '布局切换', '', 'system/user/iframe', '', '_self', 100, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (107, 0, 15, 'system', '删除日志', '', 'system/log/del', 'table=admin_log', '_self', 100, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (108, 0, 15, 'system', '清空日志', '', 'system/log/clear', '', '_self', 100, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (109, 0, 17, 'system', '编辑模块', '', 'system/module/edit', '', '_self', 100, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (110, 0, 17, 'system', '模块图标上传', '', 'system/module/icon', '', '_self', 100, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (111, 0, 18, 'system', '导入插件', '', 'system/plugins/import', '', '_self', 100, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (112, 0, 4, 'system', '钩子插件状态', '', 'system/hook/hookPluginsStatus', '', '_self', 100, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (113, 0, 4, 'system', '设置主题', '', 'system/user/setTheme', '', '_self', 100, 0, 1, 0, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (114, 0, 8, 'system', '应用市场', 'aicon ai-app-store', 'system/store/index', '', '_self', 0, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (115, 0, 114, 'system', '安装应用', '', 'system/store/install', '', '_self', 0, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (116, 0, 21, 'system', '重置密码', '', 'system/member/resetPwd', '', '_self', 6, 0, 1, 1, 1, 1490315067);
INSERT INTO `blog_system_menu` VALUES (117, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (118, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (119, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (120, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (121, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (122, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (123, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (124, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (125, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (126, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (127, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (128, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (129, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (130, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (131, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (132, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (133, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (134, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (135, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (136, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (137, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (138, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (139, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (140, 0, 4, 'system', '预留占位', '', '', '', '_self', 100, 0, 1, 1, 0, 1490315067);
INSERT INTO `blog_system_menu` VALUES (141, 0, 0, 'fun', '功能', 'aicon ai-shezhi', 'fun', '', '_self', 100, 0, 0, 1, 1, 1561702330);
INSERT INTO `blog_system_menu` VALUES (142, 0, 141, 'fun', '文章管理', 'aicon ai-shouye', 'fun/article', '', '_self', 0, 0, 0, 1, 1, 1561702542);
INSERT INTO `blog_system_menu` VALUES (143, 0, 142, 'fun', '文章类别', 'aicon ai-caidan', 'fun/articleCate/articleCate', '', '_self', 0, 0, 0, 1, 1, 1561702765);
INSERT INTO `blog_system_menu` VALUES (144, 0, 142, 'fun', '文章列表', 'aicon ai-caidan', 'fun/article/article', '', '_self', 0, 0, 0, 1, 1, 1561702800);
INSERT INTO `blog_system_menu` VALUES (145, 0, 0, 'developer', '开发助手', 'aicon ai-shezhi', 'developer', '', '_self', 100, 0, 0, 1, 1, 1561724333);
INSERT INTO `blog_system_menu` VALUES (146, 0, 145, 'developer', '应用中心', 'aicon ai-shezhi', 'developer/index', '', '_self', 0, 0, 0, 1, 1, 1561724333);
INSERT INTO `blog_system_menu` VALUES (147, 0, 146, 'developer', '模块列表', 'aicon ai-caidan', 'developer/module/index', '', '_self', 0, 0, 0, 1, 1, 1561724333);
INSERT INTO `blog_system_menu` VALUES (148, 0, 147, 'developer', '设计模块', '', 'developer/module/design', '', '_self', 0, 0, 0, 0, 1, 1561724333);
INSERT INTO `blog_system_menu` VALUES (149, 0, 147, 'developer', '版本管理', '', 'developer/module/versions', '', '_self', 0, 0, 0, 0, 1, 1561724333);
INSERT INTO `blog_system_menu` VALUES (150, 0, 147, 'developer', '发布新版本', '', 'developer/module/addVersion', '', '_self', 0, 0, 0, 0, 1, 1561724333);
INSERT INTO `blog_system_menu` VALUES (151, 0, 147, 'developer', '修改版本', '', 'developer/module/editVersion', '', '_self', 0, 0, 0, 0, 1, 1561724333);
INSERT INTO `blog_system_menu` VALUES (152, 0, 147, 'developer', '版本打包', '', 'developer/module/package', '', '_self', 0, 0, 0, 0, 1, 1561724333);
INSERT INTO `blog_system_menu` VALUES (153, 0, 147, 'developer', '版本状态', '', 'developer/module/status', 'table=developer_versions', '_self', 0, 0, 0, 0, 1, 1561724333);
INSERT INTO `blog_system_menu` VALUES (154, 0, 147, 'developer', '删除版本', '', 'developer/module/delVersion', '', '_self', 0, 0, 0, 0, 1, 1561724333);
INSERT INTO `blog_system_menu` VALUES (155, 0, 147, 'developer', '生成模块', '', 'developer/module/build', '', '_self', 0, 0, 0, 0, 1, 1561724333);
INSERT INTO `blog_system_menu` VALUES (156, 0, 147, 'developer', '图标上传', '', 'developer/module/icon', '', '_self', 0, 0, 0, 0, 1, 1561724333);
INSERT INTO `blog_system_menu` VALUES (157, 0, 146, 'developer', '插件列表', 'aicon ai-caidan', 'developer/plugins/index', '', '_self', 0, 0, 0, 1, 1, 1561724333);
INSERT INTO `blog_system_menu` VALUES (158, 0, 157, 'developer', '设计插件', '', 'developer/plugins/design', '', '_self', 0, 0, 0, 0, 1, 1561724333);
INSERT INTO `blog_system_menu` VALUES (159, 0, 157, 'developer', '版本管理', '', 'developer/plugins/versions', '', '_self', 0, 0, 0, 0, 1, 1561724333);
INSERT INTO `blog_system_menu` VALUES (160, 0, 157, 'developer', '发布新版本', '', 'developer/plugins/addVersion', '', '_self', 0, 0, 0, 0, 1, 1561724333);
INSERT INTO `blog_system_menu` VALUES (161, 0, 157, 'developer', '修改版本', '', 'developer/plugins/editVersion', '', '_self', 0, 0, 0, 0, 1, 1561724333);
INSERT INTO `blog_system_menu` VALUES (162, 0, 157, 'developer', '版本打包', '', 'developer/plugins/package', '', '_self', 0, 0, 0, 0, 1, 1561724333);
INSERT INTO `blog_system_menu` VALUES (163, 0, 157, 'developer', '版本状态', '', 'developer/plugins/status', 'table=developer_versions', '_self', 0, 0, 0, 0, 1, 1561724333);
INSERT INTO `blog_system_menu` VALUES (164, 0, 157, 'developer', '删除版本', '', 'developer/plugins/delVersion', '', '_self', 0, 0, 0, 0, 1, 1561724333);
INSERT INTO `blog_system_menu` VALUES (165, 0, 157, 'developer', '生成插件', '', 'developer/plugins/build', '', '_self', 0, 0, 0, 0, 1, 1561724333);
INSERT INTO `blog_system_menu` VALUES (166, 0, 157, 'developer', '图标上传', '', 'developer/plugins/icon', '', '_self', 0, 0, 0, 0, 1, 1561724333);
INSERT INTO `blog_system_menu` VALUES (167, 0, 0, 'api', '接口', 'fa fa-plug', 'api', '', '_self', 100, 0, 0, 1, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (168, 0, 167, 'api', '应用管理', 'fa fa-adn', 'api/app', '', '_self', 0, 0, 0, 1, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (169, 0, 168, 'api', '应用分组', '', 'api/appGroup/index', '', '_self', 0, 0, 0, 1, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (170, 0, 169, 'api', '新增', '', 'api/appGroup/add', '', '_self', 0, 0, 0, 0, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (171, 0, 169, 'api', '编辑', '', 'api/appGroup/edit', '', '_self', 0, 0, 0, 0, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (172, 0, 169, 'api', '状态', '', 'api/appGroup/status', '', '_self', 0, 0, 0, 0, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (173, 0, 169, 'api', '删除', '', 'api/appGroup/del', '', '_self', 0, 0, 0, 0, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (174, 0, 168, 'api', '应用列表', '', 'api/app/index', '', '_self', 0, 0, 0, 1, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (175, 0, 174, 'api', '新增', '', 'api/app/add', '', '_self', 0, 0, 0, 0, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (176, 0, 174, 'api', '编辑', '', 'api/app/edit', '', '_self', 0, 0, 0, 0, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (177, 0, 174, 'api', '状态', '', 'api/app/status', '', '_self', 0, 0, 0, 0, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (178, 0, 174, 'api', '删除', '', 'api/app/del', '', '_self', 0, 0, 0, 0, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (179, 0, 174, 'api', '刷新AppSecret', '', 'api/app/refreshAppSecret', '', '_self', 0, 0, 0, 0, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (180, 0, 167, 'api', '接口管理', 'fa fa-sitemap', 'app/api', '', '_self', 0, 0, 0, 1, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (181, 0, 180, 'api', '接口分组', '', 'api/apiGroup/index', '', '_self', 0, 0, 0, 1, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (182, 0, 181, 'api', '新增', '', 'api/apiGroup/add', '', '_self', 0, 0, 0, 0, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (183, 0, 181, 'api', '编辑', '', 'api/apiGroup/edit', '', '_self', 0, 0, 0, 0, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (184, 0, 181, 'api', '状态', '', 'api/apiGroup/status', '', '_self', 0, 0, 0, 0, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (185, 0, 181, 'api', '删除', '', 'api/apiGroup/del', '', '_self', 0, 0, 0, 0, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (186, 0, 180, 'api', '接口列表', '', 'api/api/index', '', '_self', 0, 0, 0, 1, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (187, 0, 186, 'api', '新增', '', 'api/api/add', '', '_self', 0, 0, 0, 0, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (188, 0, 186, 'api', '编辑', '', 'api/api/edit', '', '_self', 0, 0, 0, 0, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (189, 0, 186, 'api', '状态', '', 'api/api/status', '', '_self', 0, 0, 0, 0, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (190, 0, 186, 'api', '删除', '', 'api/api/del', '', '_self', 0, 0, 0, 0, 1, 1561800987);
INSERT INTO `blog_system_menu` VALUES (191, 0, 186, 'api', '刷新路由', '', 'api/api/refreshRoute', '', '_self', 0, 0, 0, 0, 1, 1561800988);
INSERT INTO `blog_system_menu` VALUES (192, 0, 180, 'api', '接口参数', '', 'api/param/index', '', '_self', 0, 0, 0, 1, 1, 1561800988);
INSERT INTO `blog_system_menu` VALUES (193, 0, 192, 'api', '新增', '', 'api/param/add', '', '_self', 0, 0, 0, 0, 1, 1561800988);
INSERT INTO `blog_system_menu` VALUES (194, 0, 192, 'api', '编辑', '', 'api/param/edit', '', '_self', 0, 0, 0, 0, 1, 1561800988);
INSERT INTO `blog_system_menu` VALUES (195, 0, 192, 'api', '状态', '', 'api/param/status', '', '_self', 0, 0, 0, 0, 1, 1561800988);
INSERT INTO `blog_system_menu` VALUES (196, 0, 192, 'api', '删除', '', 'api/param/del', '', '_self', 0, 0, 0, 0, 1, 1561800988);
INSERT INTO `blog_system_menu` VALUES (197, 0, 180, 'api', '错误码维护', '', 'api/errorCode/index', '', '_self', 0, 0, 0, 1, 1, 1561800988);
INSERT INTO `blog_system_menu` VALUES (198, 0, 197, 'api', '新增', '', 'api/errorCode/add', 'hisi_model=apiErrorCode', '_self', 0, 0, 0, 0, 1, 1561800988);
INSERT INTO `blog_system_menu` VALUES (199, 0, 197, 'api', '编辑', '', 'api/errorCode/edit', 'hisi_model=apiErrorCode', '_self', 0, 0, 0, 0, 1, 1561800988);
INSERT INTO `blog_system_menu` VALUES (200, 0, 197, 'api', '排序', '', 'api/errorCode/sort', '', '_self', 0, 0, 0, 0, 1, 1561800988);
INSERT INTO `blog_system_menu` VALUES (201, 0, 197, 'api', '状态设置', '', 'api/errorCode/status', '', '_self', 0, 0, 0, 0, 1, 1561800988);
INSERT INTO `blog_system_menu` VALUES (202, 0, 197, 'api', '删除', '', 'api/errorCode/del', '', '_self', 0, 0, 0, 0, 1, 1561800988);
INSERT INTO `blog_system_menu` VALUES (203, 0, 167, 'api', '开发文档', 'fa fa-file-word-o', 'api/doc', '', '_self', 0, 0, 0, 1, 1, 1561800988);
INSERT INTO `blog_system_menu` VALUES (204, 0, 203, 'api', '文档分类', '', 'api/docCategory/index', '', '_self', 0, 0, 0, 1, 1, 1561800988);
INSERT INTO `blog_system_menu` VALUES (205, 0, 204, 'api', '新增', '', 'api/DocCategory/add', '', '_self', 0, 0, 0, 0, 1, 1561800988);
INSERT INTO `blog_system_menu` VALUES (206, 0, 204, 'api', '编辑', '', 'api/DocCategory/edit', '', '_self', 0, 0, 0, 0, 1, 1561800988);
INSERT INTO `blog_system_menu` VALUES (207, 0, 204, 'api', '删除', '', 'api/DocCategory/del', '', '_self', 0, 0, 0, 0, 1, 1561800988);
INSERT INTO `blog_system_menu` VALUES (208, 0, 204, 'api', '状态', '', 'api/DocCategory/status', '', '_self', 0, 0, 0, 0, 1, 1561800988);
INSERT INTO `blog_system_menu` VALUES (209, 0, 204, 'api', '排序', '', 'api/DocCategory/sort', '', '_self', 0, 0, 0, 0, 1, 1561800988);
INSERT INTO `blog_system_menu` VALUES (210, 0, 203, 'api', '文档列表', '', 'api/doc/index', '', '_self', 0, 0, 0, 1, 1, 1561800988);
INSERT INTO `blog_system_menu` VALUES (211, 0, 210, 'api', '新增', '', 'api/Doc/add', '', '_self', 0, 0, 0, 0, 1, 1561800988);
INSERT INTO `blog_system_menu` VALUES (212, 0, 210, 'api', '编辑', '', 'api/Doc/edit', '', '_self', 0, 0, 0, 0, 1, 1561800988);
INSERT INTO `blog_system_menu` VALUES (213, 0, 210, 'api', '删除', '', 'api/Doc/del', '', '_self', 0, 0, 0, 0, 1, 1561800989);
INSERT INTO `blog_system_menu` VALUES (214, 0, 210, 'api', '状态', '', 'api/Doc/status', '', '_self', 0, 0, 0, 0, 1, 1561800989);
INSERT INTO `blog_system_menu` VALUES (215, 0, 210, 'api', '排序', '', 'api/Doc/sort', '', '_self', 0, 0, 0, 0, 1, 1561800989);
INSERT INTO `blog_system_menu` VALUES (216, 0, 10, 'api', '接口配置', 'aicon ai-shezhi', 'system/system/index', 'group=api', '_self', 100, 0, 0, 1, 1, 1561800989);
INSERT INTO `blog_system_menu` VALUES (217, 0, 141, 'fun', '个人信息卡', 'aicon ai-shouye', 'fun/info', '', '_self', 0, 0, 0, 1, 1, 1562162124);
INSERT INTO `blog_system_menu` VALUES (218, 0, 217, 'fun', '个人信息卡', 'aicon ai-caidan', 'fun/info/info', '', '_self', 0, 0, 0, 1, 1, 1562162147);
INSERT INTO `blog_system_menu` VALUES (219, 0, 141, 'fun', '配置', 'aicon ai-shouye', 'fun/config', '', '_self', 0, 0, 0, 1, 1, 1562235408);
INSERT INTO `blog_system_menu` VALUES (220, 0, 219, 'fun', '底部配置', 'aicon ai-caidan', 'fun/footer/footer', '', '_self', 0, 0, 0, 1, 1, 1562235485);
INSERT INTO `blog_system_menu` VALUES (221, 0, 219, 'fun', '头部配置', 'aicon ai-caidan', 'fun/header/header', '', '_self', 0, 0, 0, 1, 1, 1562845654);
INSERT INTO `blog_system_menu` VALUES (222, 0, 141, 'fun', '关于我', 'aicon ai-caidan', 'fun/about', '', '_self', 0, 0, 0, 1, 1, 1562848473);
INSERT INTO `blog_system_menu` VALUES (223, 0, 222, 'fun', '关于我文章', 'aicon ai-caidan', 'fun/about/about', '', '_self', 0, 0, 0, 1, 1, 1562848502);
INSERT INTO `blog_system_menu` VALUES (224, 0, 0, 'user', '会员', 'hs-icon hs-icon-vip', 'user', '', '_self', 100, 0, 0, 1, 1, 1563310876);
INSERT INTO `blog_system_menu` VALUES (225, 0, 224, 'user', '会员管理', 'hs-icon hs-icon-users', 'user/index', '', '_self', 2, 0, 1, 1, 1, 1563310876);
INSERT INTO `blog_system_menu` VALUES (226, 0, 225, 'user', '会员分组', '', 'user/group/index', '', '_self', 1, 0, 1, 1, 1, 1563310876);
INSERT INTO `blog_system_menu` VALUES (227, 0, 226, 'user', '添加分组', '', 'user/group/add', '', '_self', 0, 0, 1, 1, 1, 1563310876);
INSERT INTO `blog_system_menu` VALUES (228, 0, 226, 'user', '修改分组', '', 'user/group/edit', '', '_self', 0, 0, 1, 1, 1, 1563310876);
INSERT INTO `blog_system_menu` VALUES (229, 0, 226, 'user', '删除分组', '', 'user/group/del', '', '_self', 0, 0, 1, 1, 1, 1563310876);
INSERT INTO `blog_system_menu` VALUES (230, 0, 226, 'user', '设置默认分组', '', 'user/group/setDefault', '', '_self', 0, 0, 1, 1, 1, 1563310876);
INSERT INTO `blog_system_menu` VALUES (231, 0, 225, 'user', '会员列表', '', 'user/index/index', '', '_self', 2, 0, 1, 1, 1, 1563310876);
INSERT INTO `blog_system_menu` VALUES (232, 0, 231, 'user', '添加会员', '', 'user/index/add', '', '_self', 1, 0, 1, 1, 1, 1563310876);
INSERT INTO `blog_system_menu` VALUES (233, 0, 231, 'user', '修改会员', '', 'user/index/edit', '', '_self', 2, 0, 1, 1, 1, 1563310876);
INSERT INTO `blog_system_menu` VALUES (234, 0, 231, 'user', '删除会员', '', 'user/index/del', '', '_self', 3, 0, 1, 1, 1, 1563310876);
INSERT INTO `blog_system_menu` VALUES (235, 0, 231, 'user', '状态设置', '', 'user/index/status', '', '_self', 4, 0, 1, 1, 1, 1563310876);
INSERT INTO `blog_system_menu` VALUES (236, 0, 231, 'user', '[弹窗]会员选择', '', 'user/index/pop', '', '_self', 5, 0, 1, 1, 1, 1563310876);
INSERT INTO `blog_system_menu` VALUES (237, 0, 231, 'user', '重置密码', '', 'user/index/resetPwd', '', '_self', 6, 0, 1, 1, 1, 1563310876);
COMMIT;

-- ----------------------------
-- Table structure for blog_system_menu_lang
-- ----------------------------
DROP TABLE IF EXISTS `blog_system_menu_lang`;
CREATE TABLE `blog_system_menu_lang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) NOT NULL DEFAULT '' COMMENT '标题',
  `lang` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '语言包',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='[系统] 管理菜单语言包';

-- ----------------------------
-- Records of blog_system_menu_lang
-- ----------------------------
BEGIN;
INSERT INTO `blog_system_menu_lang` VALUES (131, 1, '首页', 1);
INSERT INTO `blog_system_menu_lang` VALUES (132, 2, '系统', 1);
INSERT INTO `blog_system_menu_lang` VALUES (133, 3, '插件', 1);
INSERT INTO `blog_system_menu_lang` VALUES (134, 4, '快捷菜单', 1);
INSERT INTO `blog_system_menu_lang` VALUES (135, 5, '插件列表', 1);
INSERT INTO `blog_system_menu_lang` VALUES (136, 6, '系统基础', 1);
INSERT INTO `blog_system_menu_lang` VALUES (137, 7, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (138, 8, '系统扩展', 1);
INSERT INTO `blog_system_menu_lang` VALUES (139, 9, '开发专用', 1);
INSERT INTO `blog_system_menu_lang` VALUES (140, 10, '系统设置', 1);
INSERT INTO `blog_system_menu_lang` VALUES (141, 11, '配置管理', 1);
INSERT INTO `blog_system_menu_lang` VALUES (142, 12, '系统菜单', 1);
INSERT INTO `blog_system_menu_lang` VALUES (143, 13, '管理员角色', 1);
INSERT INTO `blog_system_menu_lang` VALUES (144, 14, '系统管理员', 1);
INSERT INTO `blog_system_menu_lang` VALUES (145, 15, '系统日志', 1);
INSERT INTO `blog_system_menu_lang` VALUES (146, 16, '附件管理', 1);
INSERT INTO `blog_system_menu_lang` VALUES (147, 17, '本地模块', 1);
INSERT INTO `blog_system_menu_lang` VALUES (148, 18, '本地插件', 1);
INSERT INTO `blog_system_menu_lang` VALUES (149, 19, '插件钩子', 1);
INSERT INTO `blog_system_menu_lang` VALUES (150, 20, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (151, 21, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (152, 22, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (153, 23, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (154, 24, '后台首页', 1);
INSERT INTO `blog_system_menu_lang` VALUES (155, 25, '清空缓存', 1);
INSERT INTO `blog_system_menu_lang` VALUES (156, 26, '添加菜单', 1);
INSERT INTO `blog_system_menu_lang` VALUES (157, 27, '修改菜单', 1);
INSERT INTO `blog_system_menu_lang` VALUES (158, 28, '删除菜单', 1);
INSERT INTO `blog_system_menu_lang` VALUES (159, 29, '状态设置', 1);
INSERT INTO `blog_system_menu_lang` VALUES (160, 30, '排序设置', 1);
INSERT INTO `blog_system_menu_lang` VALUES (161, 31, '添加快捷菜单', 1);
INSERT INTO `blog_system_menu_lang` VALUES (162, 32, '导出菜单', 1);
INSERT INTO `blog_system_menu_lang` VALUES (163, 33, '添加角色', 1);
INSERT INTO `blog_system_menu_lang` VALUES (164, 34, '修改角色', 1);
INSERT INTO `blog_system_menu_lang` VALUES (165, 35, '删除角色', 1);
INSERT INTO `blog_system_menu_lang` VALUES (166, 36, '状态设置', 1);
INSERT INTO `blog_system_menu_lang` VALUES (167, 37, '添加管理员', 1);
INSERT INTO `blog_system_menu_lang` VALUES (168, 38, '修改管理员', 1);
INSERT INTO `blog_system_menu_lang` VALUES (169, 39, '删除管理员', 1);
INSERT INTO `blog_system_menu_lang` VALUES (170, 40, '状态设置', 1);
INSERT INTO `blog_system_menu_lang` VALUES (171, 41, '个人信息设置', 1);
INSERT INTO `blog_system_menu_lang` VALUES (172, 42, '安装插件', 1);
INSERT INTO `blog_system_menu_lang` VALUES (173, 43, '卸载插件', 1);
INSERT INTO `blog_system_menu_lang` VALUES (174, 44, '删除插件', 1);
INSERT INTO `blog_system_menu_lang` VALUES (175, 45, '状态设置', 1);
INSERT INTO `blog_system_menu_lang` VALUES (176, 46, '生成插件', 1);
INSERT INTO `blog_system_menu_lang` VALUES (177, 47, '运行插件', 1);
INSERT INTO `blog_system_menu_lang` VALUES (178, 48, '更新插件', 1);
INSERT INTO `blog_system_menu_lang` VALUES (179, 49, '插件配置', 1);
INSERT INTO `blog_system_menu_lang` VALUES (180, 50, '添加钩子', 1);
INSERT INTO `blog_system_menu_lang` VALUES (181, 51, '修改钩子', 1);
INSERT INTO `blog_system_menu_lang` VALUES (182, 52, '删除钩子', 1);
INSERT INTO `blog_system_menu_lang` VALUES (183, 53, '状态设置', 1);
INSERT INTO `blog_system_menu_lang` VALUES (184, 54, '插件排序', 1);
INSERT INTO `blog_system_menu_lang` VALUES (185, 55, '添加配置', 1);
INSERT INTO `blog_system_menu_lang` VALUES (186, 56, '修改配置', 1);
INSERT INTO `blog_system_menu_lang` VALUES (187, 57, '删除配置', 1);
INSERT INTO `blog_system_menu_lang` VALUES (188, 58, '状态设置', 1);
INSERT INTO `blog_system_menu_lang` VALUES (189, 59, '排序设置', 1);
INSERT INTO `blog_system_menu_lang` VALUES (190, 60, '基础配置', 1);
INSERT INTO `blog_system_menu_lang` VALUES (191, 61, '系统配置', 1);
INSERT INTO `blog_system_menu_lang` VALUES (192, 62, '上传配置', 1);
INSERT INTO `blog_system_menu_lang` VALUES (193, 63, '开发配置', 1);
INSERT INTO `blog_system_menu_lang` VALUES (194, 64, '生成模块', 1);
INSERT INTO `blog_system_menu_lang` VALUES (195, 65, '安装模块', 1);
INSERT INTO `blog_system_menu_lang` VALUES (196, 66, '卸载模块', 1);
INSERT INTO `blog_system_menu_lang` VALUES (197, 67, '状态设置', 1);
INSERT INTO `blog_system_menu_lang` VALUES (198, 68, '设置默认模块', 1);
INSERT INTO `blog_system_menu_lang` VALUES (199, 69, '删除模块', 1);
INSERT INTO `blog_system_menu_lang` VALUES (200, 70, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (201, 71, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (202, 72, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (203, 73, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (204, 74, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (205, 75, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (206, 76, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (207, 77, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (208, 78, '附件上传', 1);
INSERT INTO `blog_system_menu_lang` VALUES (209, 79, '删除附件', 1);
INSERT INTO `blog_system_menu_lang` VALUES (210, 80, '框架升级', 1);
INSERT INTO `blog_system_menu_lang` VALUES (211, 81, '获取升级列表', 1);
INSERT INTO `blog_system_menu_lang` VALUES (212, 82, '安装升级包', 1);
INSERT INTO `blog_system_menu_lang` VALUES (213, 83, '下载升级包', 1);
INSERT INTO `blog_system_menu_lang` VALUES (214, 84, '数据库管理', 1);
INSERT INTO `blog_system_menu_lang` VALUES (215, 85, '备份数据库', 1);
INSERT INTO `blog_system_menu_lang` VALUES (216, 86, '恢复数据库', 1);
INSERT INTO `blog_system_menu_lang` VALUES (217, 87, '优化数据库', 1);
INSERT INTO `blog_system_menu_lang` VALUES (218, 88, '删除备份', 1);
INSERT INTO `blog_system_menu_lang` VALUES (219, 89, '修复数据库', 1);
INSERT INTO `blog_system_menu_lang` VALUES (220, 90, '设置默认等级', 1);
INSERT INTO `blog_system_menu_lang` VALUES (221, 91, '数据库配置', 1);
INSERT INTO `blog_system_menu_lang` VALUES (222, 92, '模块打包', 1);
INSERT INTO `blog_system_menu_lang` VALUES (223, 93, '插件打包', 1);
INSERT INTO `blog_system_menu_lang` VALUES (224, 94, '主题管理', 1);
INSERT INTO `blog_system_menu_lang` VALUES (225, 95, '设置默认主题', 1);
INSERT INTO `blog_system_menu_lang` VALUES (226, 96, '删除主题', 1);
INSERT INTO `blog_system_menu_lang` VALUES (227, 97, '语言包管理', 1);
INSERT INTO `blog_system_menu_lang` VALUES (228, 98, '添加语言包', 1);
INSERT INTO `blog_system_menu_lang` VALUES (229, 99, '修改语言包', 1);
INSERT INTO `blog_system_menu_lang` VALUES (230, 100, '删除语言包', 1);
INSERT INTO `blog_system_menu_lang` VALUES (231, 101, '排序设置', 1);
INSERT INTO `blog_system_menu_lang` VALUES (232, 102, '状态设置', 1);
INSERT INTO `blog_system_menu_lang` VALUES (233, 103, '收藏夹图标上传', 1);
INSERT INTO `blog_system_menu_lang` VALUES (234, 104, '导入模块', 1);
INSERT INTO `blog_system_menu_lang` VALUES (235, 105, '后台首页', 1);
INSERT INTO `blog_system_menu_lang` VALUES (236, 106, '布局切换', 1);
INSERT INTO `blog_system_menu_lang` VALUES (237, 107, '删除日志', 1);
INSERT INTO `blog_system_menu_lang` VALUES (238, 108, '清空日志', 1);
INSERT INTO `blog_system_menu_lang` VALUES (239, 109, '编辑模块', 1);
INSERT INTO `blog_system_menu_lang` VALUES (240, 110, '模块图标上传', 1);
INSERT INTO `blog_system_menu_lang` VALUES (241, 111, '导入插件', 1);
INSERT INTO `blog_system_menu_lang` VALUES (242, 112, '钩子插件状态', 1);
INSERT INTO `blog_system_menu_lang` VALUES (243, 113, '设置主题', 1);
INSERT INTO `blog_system_menu_lang` VALUES (244, 114, '应用市场', 1);
INSERT INTO `blog_system_menu_lang` VALUES (245, 115, '安装应用', 1);
INSERT INTO `blog_system_menu_lang` VALUES (246, 116, '重置密码', 1);
INSERT INTO `blog_system_menu_lang` VALUES (247, 117, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (248, 118, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (249, 119, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (250, 120, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (251, 121, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (252, 122, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (253, 123, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (254, 124, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (255, 125, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (256, 126, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (257, 127, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (258, 128, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (259, 129, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (260, 130, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (261, 131, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (262, 132, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (263, 133, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (264, 134, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (265, 135, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (266, 136, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (267, 137, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (268, 138, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (269, 139, '预留占位', 1);
INSERT INTO `blog_system_menu_lang` VALUES (270, 140, '预留占位', 1);
COMMIT;

-- ----------------------------
-- Table structure for blog_system_module
-- ----------------------------
DROP TABLE IF EXISTS `blog_system_module`;
CREATE TABLE `blog_system_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '系统模块',
  `name` varchar(50) NOT NULL COMMENT '模块名(英文)',
  `identifier` varchar(100) NOT NULL COMMENT '模块标识(模块名(字母).开发者标识.module)',
  `title` varchar(50) NOT NULL COMMENT '模块标题',
  `intro` varchar(255) NOT NULL COMMENT '模块简介',
  `author` varchar(100) NOT NULL COMMENT '作者',
  `icon` varchar(80) NOT NULL DEFAULT 'aicon ai-mokuaiguanli' COMMENT '图标',
  `version` varchar(20) NOT NULL COMMENT '版本号',
  `url` varchar(255) NOT NULL COMMENT '链接',
  `sort` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未安装，1未启用，2已启用',
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '默认模块(只能有一个)',
  `config` text NOT NULL COMMENT '配置',
  `app_id` varchar(30) NOT NULL DEFAULT '0' COMMENT '应用市场ID(0本地)',
  `app_keys` varchar(200) DEFAULT '' COMMENT '应用秘钥',
  `theme` varchar(50) NOT NULL DEFAULT 'default' COMMENT '主题模板',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='[系统] 模块';

-- ----------------------------
-- Records of blog_system_module
-- ----------------------------
BEGIN;
INSERT INTO `blog_system_module` VALUES (1, 1, 'system', 'system.hisiphp.module', '系统管理模块', '系统核心模块，用于后台各项管理功能模块及功能拓展', 'HisiPHP官方出品', '', '1.0.0', 'http://www.hisiphp.com', 0, 2, 0, '', '0', '', 'default', 1489998096, 1489998096);
INSERT INTO `blog_system_module` VALUES (2, 1, 'index', 'index.hisiphp.module', '默认模块', '推荐使用扩展模块作为默认首页。', 'HisiPHP官方出品', '', '1.0.0', 'http://www.hisiphp.com', 0, 2, 0, '', '0', '', 'default', 1489998096, 1489998096);
INSERT INTO `blog_system_module` VALUES (3, 1, 'install', 'install.hisiphp.module', '系统安装模块', '系统安装模块，勿动。', 'HisiPHP官方出品', '', '1.0.0', 'http://www.hisiphp.com', 0, 2, 0, '', '0', '', 'default', 1489998096, 1489998096);
INSERT INTO `blog_system_module` VALUES (4, 0, 'fun', 'fun.kuaizi.module', '功能', '', 'kuaizi', '/static/fun/fun.png', '1.0.0', '', 0, 2, 0, '', '0', '', 'default', 1561702317, 1561702317);
INSERT INTO `blog_system_module` VALUES (5, 0, 'developer', 'developer.1000016.module.2000015', '开发助手', '为您提供了模块、插件可视化设计，还支持一键打包应用', 'HisiPHP', '/static/developer/developer.png', '1.0.1', 'http://www.hisiphp.com', 0, 2, 0, '', '0', '1172a5dd6b33a34630ca7fd39792b961', 'default', 1561724332, 1561724332);
INSERT INTO `blog_system_module` VALUES (6, 0, 'api', 'api.1000022.module.2000021', '接口', '通用RESTfulAPI接口，基于TP5的资源路由功能而开发。接口文档自动生成，接口输入参数自动检查，集成Oauth授权登录、在线测试工具等。', 'hisiphp', '/static/api/api.png', '1.0.3', 'http://www.hisiphp.com', 0, 2, 0, '[{\"sort\":100,\"title\":\"\\u6b63\\u5f0f\\u73af\\u5883\",\"name\":\"formal_url\",\"type\":\"input\",\"options\":\"\",\"value\":\"\",\"tips\":\"\\u6b63\\u5f0f\\u73af\\u5883\\u5730\\u5740\\uff0c\\u5fc5\\u987b\\u4ee5http\\u6216https\\u5f00\\u5934\"},{\"sort\":101,\"title\":\"\\u6c99\\u7bb1\\u73af\\u5883\",\"name\":\"sandbox_url\",\"type\":\"input\",\"options\":\"\",\"value\":\"\",\"tips\":\"\\u6c99\\u7bb1\\u73af\\u5883\\u5730\\u5740\\uff0c\\u5fc5\\u987b\\u4ee5http\\u6216https\\u5f00\\u5934\"},{\"sort\":102,\"title\":\"accessToken\",\"name\":\"access_token_expires\",\"type\":\"input\",\"options\":\"\",\"value\":\"7200\",\"tips\":\"\\u6388\\u6743\\u4ee4\\u724c\\u6709\\u6548\\u671f\\uff0c\\u5355\\u4f4d\\u79d2\"},{\"sort\":103,\"title\":\"authorizationCode\",\"name\":\"authorization_code_expires\",\"type\":\"input\",\"options\":\"\",\"value\":\"600\",\"tips\":\"\\u7528\\u6237\\u6388\\u6743\\u767b\\u5f55\\u56de\\u8c03Code\\u6709\\u6548\\u671f\\uff0c\\u5355\\u4f4d\\u79d2\"},{\"sort\":104,\"title\":\"userToken\",\"name\":\"user_token_expires\",\"type\":\"input\",\"options\":\"\",\"value\":\"90\",\"tips\":\"\\u7528\\u6237\\u767b\\u5f55\\u6388\\u6743\\u7684\\u6709\\u6548\\u671f\\uff0c\\u5355\\u4f4d\\u5929\"},{\"sort\":105,\"title\":\"\\u81ea\\u5b9a\\u4e49\\u767b\\u5f55\\u65b9\\u6cd5\",\"name\":\"login_action_expand\",\"type\":\"input\",\"options\":\"\",\"value\":\"\",\"tips\":\"[\\u9009\\u586b] \\u683c\\u5f0f\\uff1a\\u6a21\\u5757\\/\\u63a7\\u5236\\u5668\\/\\u65b9\\u6cd5\\uff0c\\u9ed8\\u8ba4\\u4f7f\\u7528\\u7cfb\\u7edf\\u4f1a\\u5458(AdminMember)\"},{\"sort\":106,\"title\":\"\\u7248\\u672c\\u7ba1\\u7406\",\"name\":\"api_version\",\"type\":\"input\",\"options\":\"\",\"value\":\"v1\",\"tips\":\"\\u591a\\u4e2a\\u7248\\u672c\\u53f7\\u4f7f\\u7528\\u82f1\\u6587\\u9017\\u53f7&quot;,&quot;\\u9694\\u5f00\\u3002\\u4f8b\\uff1av1,v2,v3\"},{\"sort\":107,\"title\":\"OAuth\\u6388\\u6743\\u767b\\u5f55\",\"name\":\"oauth_login\",\"type\":\"switch\",\"options\":[\"\\u7981\\u7528\",\"\\u542f\\u7528\"],\"value\":0,\"tips\":\"\\u5173\\u95ed\\u540e\\u5c06\\u65e0\\u6cd5\\u4f7f\\u7528\\u6388\\u6743\\u767b\\u5f55\"},{\"sort\":108,\"title\":\"OpenID\\u79c1\\u94a5\",\"name\":\"openid_key\",\"type\":\"input\",\"options\":\"\",\"value\":\"\",\"tips\":\"\\u7528\\u4e8e\\u751f\\u6210\\u6388\\u6743\\u7528\\u6237\\u6807\\u8bc6\\uff0c&lt;strong class=&quot;red&quot;&gt;\\u8bbe\\u7f6e\\u540e\\u4e0d\\u53ef\\u66f4\\u6539&lt;\\/strong&gt;\\uff0c\\u4e0d\\u8bbe\\u7f6e\\u5c06\\u76f4\\u63a5\\u8fd4\\u56de\\u6388\\u6743\\u7528\\u6237\\u771f\\u5b9eID\"},{\"sort\":109,\"title\":\"logo\",\"name\":\"logo\",\"type\":\"image\",\"options\":\"\",\"value\":\"\",\"tips\":\"API\\u7f51\\u7ad9logo\"}]', '0', '22e6e1ae77c5ec850e743b3ea2ffcad1', 'default', 1561800984, 1561800984);
INSERT INTO `blog_system_module` VALUES (7, 0, 'user', 'user.1000020.module.2000019', '会员', '', 'hisiphp', '/static/user/user.png', '1.0.2', 'http://www.hisiphp.com', 0, 2, 0, '', '0', '824999d8f3b6c7048cd461515c8ebb22', 'default', 1563310876, 1563310876);
COMMIT;

-- ----------------------------
-- Table structure for blog_system_plugins
-- ----------------------------
DROP TABLE IF EXISTS `blog_system_plugins`;
CREATE TABLE `blog_system_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL COMMENT '插件名称(英文)',
  `title` varchar(32) NOT NULL COMMENT '插件标题',
  `icon` varchar(64) NOT NULL COMMENT '图标',
  `intro` text NOT NULL COMMENT '插件简介',
  `author` varchar(32) NOT NULL COMMENT '作者',
  `url` varchar(255) NOT NULL COMMENT '作者主页',
  `version` varchar(16) NOT NULL DEFAULT '' COMMENT '版本号',
  `identifier` varchar(64) NOT NULL DEFAULT '' COMMENT '插件唯一标识符',
  `config` text NOT NULL COMMENT '插件配置',
  `app_id` varchar(30) NOT NULL DEFAULT '0' COMMENT '来源(0本地)',
  `app_keys` varchar(200) DEFAULT '' COMMENT '应用秘钥',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='[系统] 插件表';

-- ----------------------------
-- Records of blog_system_plugins
-- ----------------------------
BEGIN;
INSERT INTO `blog_system_plugins` VALUES (1, 1, 'hisiphp', '系统基础信息', '/static/plugins/hisiphp/hisiphp.png', '后台首页展示系统基础信息和开发团队信息', 'HisiPHP', 'http://www.hisiphp.com', '1.0.0', 'hisiphp.hisiphp.plugins', '', '0', '', 1509379331, 1509379331, 0, 2);
COMMIT;

-- ----------------------------
-- Table structure for blog_system_role
-- ----------------------------
DROP TABLE IF EXISTS `blog_system_role`;
CREATE TABLE `blog_system_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `intro` varchar(200) NOT NULL COMMENT '角色简介',
  `auth` text NOT NULL COMMENT '角色权限',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='[系统] 管理角色';

-- ----------------------------
-- Records of blog_system_role
-- ----------------------------
BEGIN;
INSERT INTO `blog_system_role` VALUES (1, '超级管理员', '拥有系统最高权限', '0', 1489411760, 0, 1);
INSERT INTO `blog_system_role` VALUES (2, '系统管理员', '拥有系统管理员权限', '[\"1\",\"4\",\"25\",\"24\",\"2\",\"6\",\"10\",\"60\",\"61\",\"62\",\"63\",\"91\",\"11\",\"55\",\"56\",\"57\",\"58\",\"59\",\"12\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"13\",\"33\",\"34\",\"35\",\"36\",\"14\",\"37\",\"38\",\"39\",\"40\",\"41\",\"16\",\"78\",\"79\",\"84\",\"85\",\"86\",\"87\",\"88\",\"89\",\"7\",\"20\",\"75\",\"76\",\"77\",\"21\",\"90\",\"70\",\"71\",\"72\",\"73\",\"74\",\"8\",\"17\",\"65\",\"66\",\"67\",\"68\",\"94\",\"95\",\"18\",\"42\",\"43\",\"45\",\"47\",\"48\",\"49\",\"19\",\"80\",\"81\",\"82\",\"83\",\"9\",\"22\",\"23\",\"3\",\"5\"]', 1489411760, 1507731116, 1);
INSERT INTO `blog_system_role` VALUES (3, '普通管理员', '普通管理员', '{\"0\":\"1\",\"1\":\"4\",\"2\":\"25\",\"4\":\"24\",\"6\":\"106\",\"8\":\"113\"}', 1507737902, 1542075415, 1);
COMMIT;

-- ----------------------------
-- Table structure for blog_system_user
-- ----------------------------
DROP TABLE IF EXISTS `blog_system_user`;
CREATE TABLE `blog_system_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL,
  `nick` varchar(50) NOT NULL COMMENT '昵称',
  `mobile` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `auth` text NOT NULL COMMENT '权限',
  `iframe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0默认，1框架',
  `theme` varchar(50) NOT NULL DEFAULT 'default' COMMENT '主题',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `last_login_ip` varchar(128) NOT NULL COMMENT '最后登陆IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登陆时间',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='[系统] 管理用户';

-- ----------------------------
-- Records of blog_system_user
-- ----------------------------
BEGIN;
INSERT INTO `blog_system_user` VALUES (1, 1, 'root', '$2y$10$YcoP8EkTlIkji0Fb1a5vIumLWMKG5Zq5TblIt0jD9bmUcJBAMPhDa', '超级管理员', '', '', '', 0, 'default', 1, '0.0.0.0', 1563310806, 1561551704, 1563310806);
COMMIT;

-- ----------------------------
-- Table structure for blog_user
-- ----------------------------
DROP TABLE IF EXISTS `blog_user`;
CREATE TABLE `blog_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员分组ID',
  `nick` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '手机号',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `password` varchar(128) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(16) NOT NULL DEFAULT '' COMMENT '密码混淆',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '可用金额',
  `frozen_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '冻结金额',
  `income` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '收入统计',
  `expend` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '开支统计',
  `exper` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '经验值',
  `integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `frozen_integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '冻结积分',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '性别(1男，0女)',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `last_login_ip` varchar(128) NOT NULL DEFAULT '' COMMENT '最后登陆IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登陆时间',
  `login_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '到期时间(0永久)',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0禁用，1正常)',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000002 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='[系统] 会员表';

-- ----------------------------
-- Records of blog_user
-- ----------------------------
BEGIN;
INSERT INTO `blog_user` VALUES (1000001, 1, 'ceshi', 'ceshi', 0, '', '7a2936cbd4de2638447a2ac96112a24e', 'xUofqHuwo8kUV3fv', 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 1, '', '', 0, 0, 0, 0, 1545095106, 1546343702);
COMMIT;

-- ----------------------------
-- Table structure for blog_user_group
-- ----------------------------
DROP TABLE IF EXISTS `blog_user_group`;
CREATE TABLE `blog_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL COMMENT '等级名称',
  `min_exper` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最小经验值',
  `max_exper` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大经验值',
  `discount` int(2) unsigned NOT NULL DEFAULT '100' COMMENT '折扣率(%)',
  `intro` varchar(255) NOT NULL COMMENT '等级简介',
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '默认等级',
  `expire` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员有效期(天)',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='[系统] 会员等级';

-- ----------------------------
-- Records of blog_user_group
-- ----------------------------
BEGIN;
INSERT INTO `blog_user_group` VALUES (1, '注册会员', 0, 0, 100, '', 1, 0, 1, 0, 1545105600);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
