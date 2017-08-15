-- -----------------------------
-- Think MySQL Data Transfer 
-- 
-- dsn     : mysql:host=localhost;dbname=yii2admin
-- 
-- Part : #1
-- Date : 2016-11-16 02:15:49
-- -----------------------------

SET FOREIGN_KEY_CHECKS = 0;


-- -----------------------------
-- Table structure for `yii2_ad`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_ad`;
CREATE TABLE `yii2_ad` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) NOT NULL COMMENT '类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `image` varchar(255) NOT NULL COMMENT '图片路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转地址',
  `sort` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='图片广告';

-- -----------------------------
-- Records of `yii2_ad`
-- -----------------------------
INSERT INTO `yii2_ad` VALUES ('1', '1', '测试广告1', '1', 'http://www.imhaigui.com', '1', '1');

-- -----------------------------
-- Table structure for `yii2_admin`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_admin`;
CREATE TABLE `yii2_admin` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(60) NOT NULL COMMENT '密码',
  `salt` char(32) NOT NULL COMMENT '密码干扰字符',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态 1正常 0禁用',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- -----------------------------
-- Records of `yii2_admin`
-- -----------------------------
INSERT INTO `yii2_admin` VALUES ('1', 'admin', '$2y$13$0UVcG.mXF6Og0rnjfwJd2.wixT2gdn.wDO9rN44jGtIGc6JvBqR7i', 'SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ', 'phphome111@qq.com', '13565231112', '1457922160', '2130706433', '1457922174', '2130706433', '1476437014', '1');
INSERT INTO `yii2_admin` VALUES ('2', 'feifei', '$2y$13$jqWGlVo8T3qtnWUX0kTX/ON5ctvokzkQ7RAvKuNRjN.WvxgBlFK4u', 'tzDsmCSLbtktnvbgn1YeEqslYOBo1Cn9', 'php11111@qq.com', '13631568985', '1458028401', '2130706433', '1458028401', '2130706433', '1468230085', '1');
INSERT INTO `yii2_admin` VALUES ('6', 'guanli', '$2y$13$QK.CEi7HHuTSIMbq5RbzeOfTNgrX8mUTl/noBkHtD/zKEf7y.SQO6', '_4F9_ptxkohU247kgi7UB4rg3UMYqo14', 'phphome222@qq.com', '13565656565', '1476438209', '2130706433', '0', '2130706433', '0', '1');

-- -----------------------------
-- Table structure for `yii2_article`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_article`;
CREATE TABLE `yii2_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `cover` varchar(255) NOT NULL DEFAULT '' COMMENT '封面',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `content` text NOT NULL COMMENT '内容',
  `extend` text COMMENT '扩展内容array',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '外链',
  `sort` int(4) NOT NULL DEFAULT '0' COMMENT '排序值',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- -----------------------------
-- Records of `yii2_article`
-- -----------------------------
INSERT INTO `yii2_article` VALUES ('3', '1', 'jieshao', '帆海汇介绍', '4', '帆海汇介绍', '<p><img src=\"/storage/web/image/201610/1476271961130042.png\" title=\"1476271961130042.png\" alt=\"icon_nav_button.png\"/></p>', '', '2', '0', '', '0', '1473606822', '1476272167', '1');
INSERT INTO `yii2_article` VALUES ('2', '1', 'aboutus', '关于我们', '7', '关于我们', '<p><img src=\"http://www.yii2.cn/storage/web/image/201611/editor1477984899430443.png\" title=\"editor1477984899430443.png\" alt=\"qrcode.png\"/>这里是关于我们的内容</p>', 'a:4:{i:1;s:3:\"222\";i:3;s:4:\"3434\";i:6;s:5:\"sdfsa\";s:1:\"s\";s:4:\"sdsf\";}', '2', '0', '', '0', '1472611249', '1477984905', '1');
INSERT INTO `yii2_article` VALUES ('4', '1', 'julebu', '帆船俱乐部', '', '帆船俱乐部', '<p>帆船俱乐部帆船俱乐部帆船俱乐部帆船俱乐部帆船俱乐部帆船俱乐部帆船俱乐部</p>', '', '2', '0', '', '0', '1473606857', '0', '1');
INSERT INTO `yii2_article` VALUES ('5', '1', 'peixun', '培训中心', '', '培训中心', '<p>培训中心培训中心培训中心培训中心培训中心培训中心培训中心培训中心培训中心培训中心培训中心</p>', '', '2', '0', '', '0', '1473606890', '0', '1');
INSERT INTO `yii2_article` VALUES ('6', '1', 'lianxi', '联系我们', '', '联系我们', '<p>联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们</p>', '', '2', '0', '', '0', '1473606916', '0', '1');
INSERT INTO `yii2_article` VALUES ('7', '1', 'hezuo', '合作伙伴', '', '合作伙伴', '<p>合作伙伴合作伙伴合作伙伴合作伙伴合作伙伴合作伙伴合作伙伴合作伙伴合作伙伴合作伙伴合作伙伴合作伙伴合作伙伴合作伙伴</p>', '', '2', '0', '', '0', '1473606940', '0', '1');
INSERT INTO `yii2_article` VALUES ('8', '3', '', '活动内容1111111', '', '活动内容1111111', '<p>活动内容1111111活动内容1111111活动内容1111111活动内容1111111活动内容1111111活动内容1111111活动内容1111111活动内容1111111</p>', '', '2', '0', '', '0', '1473607011', '1473608688', '1');
INSERT INTO `yii2_article` VALUES ('9', '3', '', '活动内容222222', '', '活动内容222222', '<p>活动内容222222活动内容222222活动内容222222活动内容222222活动内容222222活动内容222222活动内容222222活动内容222222活动内容222222活动内容222222活动内容222222</p>', '', '2', '0', '', '0', '1473607032', '1473608697', '1');
INSERT INTO `yii2_article` VALUES ('10', '3', '', '活动内容333333', '11', '活动内容333333', '<p><img src=\"http://www.yii2.cn/storage/web/image/201610/editor1477901835457115.png\" title=\"editor1477901835457115.png\" alt=\"icon_nav_dialog.png\"/>活动内容333333活动内容333333活动内容333333活动内容333333活动内容333333活动内容333333活动内容333333活动内容333333活动内容333333活动内容333333活动内容333333活动内容333333</p>', '', '2', '0', '', '0', '1473607048', '1478854005', '1');

-- -----------------------------
-- Table structure for `yii2_auth_assignment`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_auth_assignment`;
CREATE TABLE `yii2_auth_assignment` (
  `item_name` varchar(64) NOT NULL COMMENT '角色名称 role',
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `yii2_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `yii2_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -----------------------------
-- Records of `yii2_auth_assignment`
-- -----------------------------
INSERT INTO `yii2_auth_assignment` VALUES ('administrator', '1', '1479233593');
INSERT INTO `yii2_auth_assignment` VALUES ('administrator', '4', '1460012730');
INSERT INTO `yii2_auth_assignment` VALUES ('administrator', '6', '1476438227');
INSERT INTO `yii2_auth_assignment` VALUES ('editor', '2', '1476437926');

-- -----------------------------
-- Table structure for `yii2_auth_item`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_auth_item`;
CREATE TABLE `yii2_auth_item` (
  `name` varchar(64) NOT NULL COMMENT '角色或权限名称',
  `type` int(11) NOT NULL COMMENT '1角色 2权限',
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -----------------------------
-- Records of `yii2_auth_item`
-- -----------------------------
INSERT INTO `yii2_auth_item` VALUES ('action/actionlog', '2', '', 'action/actionlog', '', '1460031880', '1460031880');
INSERT INTO `yii2_auth_item` VALUES ('action/edit', '2', '', 'action/edit', '', '1460031880', '1460031880');
INSERT INTO `yii2_auth_item` VALUES ('ad/add', '2',  NULL, 'ad/add',  NULL, '1476437984', '1476437984');
INSERT INTO `yii2_auth_item` VALUES ('ad/delete', '2',  NULL, 'ad/delete',  NULL, '1476437984', '1476437984');
INSERT INTO `yii2_auth_item` VALUES ('ad/edit', '2',  NULL, 'ad/edit',  NULL, '1476437984', '1476437984');
INSERT INTO `yii2_auth_item` VALUES ('ad/index', '2',  NULL, 'ad/index',  NULL, '1476437984', '1476437984');
INSERT INTO `yii2_auth_item` VALUES ('Addons/addHook', '2',  NULL, 'Addons/addHook',  NULL, '1472528088', '1472528088');
INSERT INTO `yii2_auth_item` VALUES ('Addons/adminList', '2',  NULL, 'Addons/adminList',  NULL, '1472528088', '1472528088');
INSERT INTO `yii2_auth_item` VALUES ('Addons/edithook', '2',  NULL, 'Addons/edithook',  NULL, '1472528088', '1472528088');
INSERT INTO `yii2_auth_item` VALUES ('Addons/execute', '2',  NULL, 'Addons/execute',  NULL, '1472528088', '1472528088');
INSERT INTO `yii2_auth_item` VALUES ('Addons/hooks', '2',  NULL, 'Addons/hooks',  NULL, '1472528088', '1472528088');
INSERT INTO `yii2_auth_item` VALUES ('Addons/index', '2', '', 'Addons/index', '', '1460030539', '1460030539');
INSERT INTO `yii2_auth_item` VALUES ('admin/add', '2',  NULL, 'admin/add',  NULL, '1472528089', '1472528089');
INSERT INTO `yii2_auth_item` VALUES ('admin/auth', '2',  NULL, 'admin/auth',  NULL, '1472528089', '1472528089');
INSERT INTO `yii2_auth_item` VALUES ('admin/edit', '2',  NULL, 'admin/edit',  NULL, '1472528089', '1472528089');
INSERT INTO `yii2_auth_item` VALUES ('admin/index', '2',  NULL, 'admin/index',  NULL, '1472528089', '1472528089');
INSERT INTO `yii2_auth_item` VALUES ('administrator', '1', 'administrator角色',  NULL,  NULL, '1465352150', '1479233625');
INSERT INTO `yii2_auth_item` VALUES ('article/add', '2', '', 'article/add', '', '1460027926', '1460027926');
INSERT INTO `yii2_auth_item` VALUES ('article/autoSave', '2', '', 'article/autoSave', '', '1460027926', '1460027926');
INSERT INTO `yii2_auth_item` VALUES ('article/batchOperate', '2', '', 'article/batchOperate', '', '1460027926', '1460027926');
INSERT INTO `yii2_auth_item` VALUES ('article/clear', '2', '', 'article/clear', '', '1460027927', '1460027927');
INSERT INTO `yii2_auth_item` VALUES ('article/copy', '2', '', 'article/copy', '', '1460027926', '1460027926');
INSERT INTO `yii2_auth_item` VALUES ('article/edit', '2', '', 'article/edit', '', '1460027926', '1460027926');
INSERT INTO `yii2_auth_item` VALUES ('Article/examine', '2', '', 'Article/examine', '', '1460027927', '1460027927');
INSERT INTO `yii2_auth_item` VALUES ('article/index', '2', '', 'article/index', '', '1460027926', '1460027926');
INSERT INTO `yii2_auth_item` VALUES ('article/move', '2', '', 'article/move', '', '1460027926', '1460027926');
INSERT INTO `yii2_auth_item` VALUES ('article/paste', '2', '', 'article/paste', '', '1460027926', '1460027926');
INSERT INTO `yii2_auth_item` VALUES ('article/permit', '2', '', 'article/permit', '', '1460027927', '1460027927');
INSERT INTO `yii2_auth_item` VALUES ('article/recycle', '2', '', 'article/recycle', '', '1460027927', '1460027927');
INSERT INTO `yii2_auth_item` VALUES ('article/setStatus', '2', '', 'article/setStatus', '', '1460027926', '1460027926');
INSERT INTO `yii2_auth_item` VALUES ('Article/sort', '2', '', 'Article/sort', '', '1460027927', '1460027927');
INSERT INTO `yii2_auth_item` VALUES ('article/update', '2', '', 'article/update', '', '1460027926', '1460027926');
INSERT INTO `yii2_auth_item` VALUES ('attribute/add', '2', '', 'attribute/add', '', '1460031881', '1460031881');
INSERT INTO `yii2_auth_item` VALUES ('attribute/edit', '2', '', 'attribute/edit', '', '1460031881', '1460031881');
INSERT INTO `yii2_auth_item` VALUES ('attribute/index1', '2', '', 'attribute/index1', '', '1460031881', '1460031881');
INSERT INTO `yii2_auth_item` VALUES ('attribute/setStatus', '2', '', 'attribute/setStatus', '', '1460031881', '1460031881');
INSERT INTO `yii2_auth_item` VALUES ('attribute/update', '2', '', 'attribute/update', '', '1460031881', '1460031881');
INSERT INTO `yii2_auth_item` VALUES ('auth/access', '2', '', 'auth/access', '', '1460031879', '1460031879');
INSERT INTO `yii2_auth_item` VALUES ('auth/add', '2',  NULL, 'auth/add',  NULL, '1472528089', '1472528089');
INSERT INTO `yii2_auth_item` VALUES ('auth/addToCategory', '2', '', 'auth/addToCategory', '', '1460031880', '1460031880');
INSERT INTO `yii2_auth_item` VALUES ('auth/addToGroup', '2', '', 'auth/addToGroup', '', '1460031880', '1460031880');
INSERT INTO `yii2_auth_item` VALUES ('auth/addToModel', '2', '', 'auth/addToModel', '', '1460031880', '1460031880');
INSERT INTO `yii2_auth_item` VALUES ('auth/auth', '2', '', 'auth/auth', '', '1460031879', '1460031879');
INSERT INTO `yii2_auth_item` VALUES ('auth/category', '2', '', 'auth/category', '', '1460031880', '1460031880');
INSERT INTO `yii2_auth_item` VALUES ('auth/changeStatus?method=deleteGroup', '2', '', 'auth/changeStatus?method=deleteGroup', '', '1460031879', '1460031879');
INSERT INTO `yii2_auth_item` VALUES ('auth/changeStatus?method=forbidGroup', '2', '', 'auth/changeStatus?method=forbidGroup', '', '1460031879', '1460031879');
INSERT INTO `yii2_auth_item` VALUES ('auth/changeStatus?method=resumeGroup', '2', '', 'auth/changeStatus?method=resumeGroup', '', '1460031879', '1460031879');
INSERT INTO `yii2_auth_item` VALUES ('auth/createGroup', '2', '', 'auth/createGroup', '', '1460031879', '1460031879');
INSERT INTO `yii2_auth_item` VALUES ('auth/delete', '2',  NULL, 'auth/delete',  NULL, '1472528089', '1472528089');
INSERT INTO `yii2_auth_item` VALUES ('auth/edit', '2',  NULL, 'auth/edit',  NULL, '1472528089', '1472528089');
INSERT INTO `yii2_auth_item` VALUES ('auth/editGroup', '2', '', 'auth/editGroup', '', '1460031879', '1460031879');
INSERT INTO `yii2_auth_item` VALUES ('auth/index', '2', '', 'auth/index', '', '1200000000', '1300000000');
INSERT INTO `yii2_auth_item` VALUES ('auth/modelauth', '2', '', 'auth/modelauth', '', '1460031880', '1460031880');
INSERT INTO `yii2_auth_item` VALUES ('auth/removeFromGroup', '2', '', 'auth/removeFromGroup', '', '1460031880', '1460031880');
INSERT INTO `yii2_auth_item` VALUES ('auth/user', '2', '', 'auth/user', '', '1460031880', '1460031880');
INSERT INTO `yii2_auth_item` VALUES ('auth/writeGroup', '2', '', 'auth/writeGroup', '', '1460031879', '1460031879');
INSERT INTO `yii2_auth_item` VALUES ('category/add', '2', '', 'category/add', '', '1460031882', '1460031882');
INSERT INTO `yii2_auth_item` VALUES ('category/edit', '2', '', 'category/edit', '', '1460031882', '1460031882');
INSERT INTO `yii2_auth_item` VALUES ('category/index', '2', '', 'category/index', '', '1460031882', '1460031882');
INSERT INTO `yii2_auth_item` VALUES ('category/operate/type/merge', '2', '', 'category/operate/type/merge', '', '1460031882', '1460031882');
INSERT INTO `yii2_auth_item` VALUES ('category/operate/type/move', '2', '', 'category/operate/type/move', '', '1460031882', '1460031882');
INSERT INTO `yii2_auth_item` VALUES ('category/remove', '2', '', 'category/remove', '', '1460031882', '1460031882');
INSERT INTO `yii2_auth_item` VALUES ('certificate/delete', '2',  NULL, 'certificate/delete',  NULL, '1476437984', '1476437984');
INSERT INTO `yii2_auth_item` VALUES ('certificate/edit', '2',  NULL, 'certificate/edit',  NULL, '1476437983', '1476437983');
INSERT INTO `yii2_auth_item` VALUES ('certificate/index', '2',  NULL, 'certificate/index',  NULL, '1476437983', '1476437983');
INSERT INTO `yii2_auth_item` VALUES ('channel/add', '2', '', 'channel/add', '', '1460031884', '1460031884');
INSERT INTO `yii2_auth_item` VALUES ('channel/del', '2', '', 'channel/del', '', '1460031885', '1460031885');
INSERT INTO `yii2_auth_item` VALUES ('channel/edit', '2', '', 'channel/edit', '', '1460031884', '1460031884');
INSERT INTO `yii2_auth_item` VALUES ('channel/index', '2', '', 'channel/index', '', '1460031884', '1460031884');
INSERT INTO `yii2_auth_item` VALUES ('config/add', '2', '', 'config/add', '', '1460031883', '1460031883');
INSERT INTO `yii2_auth_item` VALUES ('config/del', '2', '', 'config/del', '', '1460031883', '1460031883');
INSERT INTO `yii2_auth_item` VALUES ('config/edit', '2', '', 'config/edit', '', '1460031883', '1460031883');
INSERT INTO `yii2_auth_item` VALUES ('config/group', '2', '', 'config/group', '', '1452653200', '1452653210');
INSERT INTO `yii2_auth_item` VALUES ('config/index', '2', '', 'config/index', '', '1452653200', '1452653210');
INSERT INTO `yii2_auth_item` VALUES ('config/save', '2', '', 'config/save', '', '1460031883', '1460031883');
INSERT INTO `yii2_auth_item` VALUES ('Config/sort', '2', '', 'Config/sort', '', '1460031884', '1460031884');
INSERT INTO `yii2_auth_item` VALUES ('database/del', '2', '', 'database/del', '', '1460031882', '1460031882');
INSERT INTO `yii2_auth_item` VALUES ('database/export', '2', '', 'database/export', '', '1460031881', '1460031881');
INSERT INTO `yii2_auth_item` VALUES ('database/import', '2', '', 'database/import', '', '1460031882', '1460031882');
INSERT INTO `yii2_auth_item` VALUES ('database/index?type=export', '2', '数据库导出', 'database/index?type=export', '', '120000000', '130000000');
INSERT INTO `yii2_auth_item` VALUES ('database/index?type=import', '2', '数据库导入', 'database/index?type=import', '', '1200000000', '1300000000');
INSERT INTO `yii2_auth_item` VALUES ('database/optimize', '2', '', 'database/optimize', '', '1460031881', '1460031881');
INSERT INTO `yii2_auth_item` VALUES ('database/repair', '2', '', 'database/repair', '', '1460031881', '1460031881');
INSERT INTO `yii2_auth_item` VALUES ('editor', '1', 'editor 网站编辑角色',  NULL, '', '1356232000', '1400000000');
INSERT INTO `yii2_auth_item` VALUES ('group/add', '2',  NULL, 'group/add',  NULL, '1476437986', '1476437986');
INSERT INTO `yii2_auth_item` VALUES ('group/delete', '2',  NULL, 'group/delete',  NULL, '1476437986', '1476437986');
INSERT INTO `yii2_auth_item` VALUES ('group/edit', '2',  NULL, 'group/edit',  NULL, '1476437986', '1476437986');
INSERT INTO `yii2_auth_item` VALUES ('group/index', '2',  NULL, 'group/index',  NULL, '1476437986', '1476437986');
INSERT INTO `yii2_auth_item` VALUES ('index/index', '2', '', 'index/index', '', '1356542542', '1425652320');
INSERT INTO `yii2_auth_item` VALUES ('log/index', '2',  NULL, 'log/index',  NULL, '1472528090', '1472528090');
INSERT INTO `yii2_auth_item` VALUES ('log/view', '2',  NULL, 'log/view',  NULL, '1472528090', '1472528090');
INSERT INTO `yii2_auth_item` VALUES ('login/logout', '2', '', 'login/logout', '', '1356565230', '1452653210');
INSERT INTO `yii2_auth_item` VALUES ('menu/add', '2', '', 'menu/add', '', '1460031884', '1460031884');
INSERT INTO `yii2_auth_item` VALUES ('menu/edit', '2', '', 'menu/edit', '', '1460031884', '1460031884');
INSERT INTO `yii2_auth_item` VALUES ('Menu/import', '2', '', 'Menu/import', '', '1460031884', '1460031884');
INSERT INTO `yii2_auth_item` VALUES ('menu/index', '2', '', 'menu/index', '', '1452653200', '1452653210');
INSERT INTO `yii2_auth_item` VALUES ('Menu/sort', '2', '', 'Menu/sort', '', '1460031884', '1460031884');
INSERT INTO `yii2_auth_item` VALUES ('model/add', '2', '', 'model/add', '', '1460031882', '1460031882');
INSERT INTO `yii2_auth_item` VALUES ('model/edit', '2', '', 'model/edit', '', '1460031883', '1460031883');
INSERT INTO `yii2_auth_item` VALUES ('Model/generate', '2', '', 'Model/generate', '', '1460031019', '1460031019');
INSERT INTO `yii2_auth_item` VALUES ('Model/index', '2', '', 'Model/index', '', '1460031882', '1460031882');
INSERT INTO `yii2_auth_item` VALUES ('model/setStatus', '2', '', 'model/setStatus', '', '1460031883', '1460031883');
INSERT INTO `yii2_auth_item` VALUES ('model/update', '2', '', 'model/update', '', '1460031883', '1460031883');
INSERT INTO `yii2_auth_item` VALUES ('order/add', '2',  NULL, 'order/add',  NULL, '1476438050', '1476438050');
INSERT INTO `yii2_auth_item` VALUES ('order/delete', '2',  NULL, 'order/delete',  NULL, '1476438050', '1476438050');
INSERT INTO `yii2_auth_item` VALUES ('order/edit', '2',  NULL, 'order/edit',  NULL, '1476438049', '1476438049');
INSERT INTO `yii2_auth_item` VALUES ('order/index', '2',  NULL, 'order/index',  NULL, '1472528088', '1472528088');
INSERT INTO `yii2_auth_item` VALUES ('other', '2',  NULL, 'other',  NULL, '1472528090', '1472528090');
INSERT INTO `yii2_auth_item` VALUES ('shop/add', '2',  NULL, 'shop/add',  NULL, '1476437985', '1476437985');
INSERT INTO `yii2_auth_item` VALUES ('shop/delete', '2',  NULL, 'shop/delete',  NULL, '1476437985', '1476437985');
INSERT INTO `yii2_auth_item` VALUES ('shop/edit', '2',  NULL, 'shop/edit',  NULL, '1476437985', '1476437985');
INSERT INTO `yii2_auth_item` VALUES ('shop/group', '2',  NULL, 'shop/group',  NULL, '1472528088', '1472528088');
INSERT INTO `yii2_auth_item` VALUES ('shop/index', '2',  NULL, 'shop/index',  NULL, '1479233606', '1479233606');
INSERT INTO `yii2_auth_item` VALUES ('shop/index&type=1', '2',  NULL, 'shop/index&type=1',  NULL, '1472528087', '1472528087');
INSERT INTO `yii2_auth_item` VALUES ('shop/index&type=2', '2',  NULL, 'shop/index&type=2',  NULL, '1472528087', '1472528087');
INSERT INTO `yii2_auth_item` VALUES ('shop/index&type=3', '2',  NULL, 'shop/index&type=3',  NULL, '1472528087', '1472528087');
INSERT INTO `yii2_auth_item` VALUES ('shop/index&type=4', '2',  NULL, 'shop/index&type=4',  NULL, '1472528088', '1472528088');
INSERT INTO `yii2_auth_item` VALUES ('shop/index?type=1', '2',  NULL, 'shop/index?type=1',  NULL, '1476437985', '1476437985');
INSERT INTO `yii2_auth_item` VALUES ('shop/index?type=2', '2',  NULL, 'shop/index?type=2',  NULL, '1476437986', '1476437986');
INSERT INTO `yii2_auth_item` VALUES ('shop/index?type=3', '2',  NULL, 'shop/index?type=3',  NULL, '1476437986', '1476437986');
INSERT INTO `yii2_auth_item` VALUES ('shop/index?type=4', '2',  NULL, 'shop/index?type=4',  NULL, '1476437986', '1476437986');
INSERT INTO `yii2_auth_item` VALUES ('think/add', '2', '', 'think/add', '', '1460031883', '1460031883');
INSERT INTO `yii2_auth_item` VALUES ('think/edit', '2', '', 'think/edit', '', '1460031019', '1460031019');
INSERT INTO `yii2_auth_item` VALUES ('think/lists', '2', '', 'think/lists', '', '1460031020', '1460031020');
INSERT INTO `yii2_auth_item` VALUES ('train/add', '2',  NULL, 'train/add',  NULL, '1476437985', '1476437985');
INSERT INTO `yii2_auth_item` VALUES ('train/delete', '2',  NULL, 'train/delete',  NULL, '1476437984', '1476437984');
INSERT INTO `yii2_auth_item` VALUES ('train/edit', '2',  NULL, 'train/edit',  NULL, '1476437984', '1476437984');
INSERT INTO `yii2_auth_item` VALUES ('train/index', '2',  NULL, 'train/index',  NULL, '1472528088', '1472528088');
INSERT INTO `yii2_auth_item` VALUES ('traintype/delete', '2',  NULL, 'traintype/delete',  NULL, '1476437984', '1476437984');
INSERT INTO `yii2_auth_item` VALUES ('traintype/edit', '2',  NULL, 'traintype/edit',  NULL, '1476437984', '1476437984');
INSERT INTO `yii2_auth_item` VALUES ('traintype/index', '2',  NULL, 'traintype/index',  NULL, '1476437984', '1476437984');
INSERT INTO `yii2_auth_item` VALUES ('user/action', '2', '', 'user/action', '', '1460031878', '1460031878');
INSERT INTO `yii2_auth_item` VALUES ('user/add', '2', '', 'user/add', '', '1460031878', '1460031878');
INSERT INTO `yii2_auth_item` VALUES ('user/addaction', '2', '', 'user/addaction', '', '1460031878', '1460031878');
INSERT INTO `yii2_auth_item` VALUES ('user/auth', '2', '', 'user/auth', '', '1460031878', '1460031878');
INSERT INTO `yii2_auth_item` VALUES ('User/changeStatus?method=deleteUser', '2', '', 'User/changeStatus?method=deleteUser', '', '1460031879', '1460031879');
INSERT INTO `yii2_auth_item` VALUES ('user/changeStatus?method=forbidUser', '2', '', 'user/changeStatus?method=forbidUser', '', '1460031878', '1460031878');
INSERT INTO `yii2_auth_item` VALUES ('user/changeStatus?method=resumeUser', '2', '', 'user/changeStatus?method=resumeUser', '', '1460031878', '1460031878');
INSERT INTO `yii2_auth_item` VALUES ('user/delete', '2',  NULL, 'user/delete',  NULL, '1476438050', '1476438050');
INSERT INTO `yii2_auth_item` VALUES ('user/edit', '2',  NULL, 'user/edit',  NULL, '1476438051', '1476438051');
INSERT INTO `yii2_auth_item` VALUES ('user/editaction', '2', '', 'user/editaction', '', '1460031878', '1460031878');
INSERT INTO `yii2_auth_item` VALUES ('user/index', '2', '', 'user/index', '', '1200000000', '1230000000');
INSERT INTO `yii2_auth_item` VALUES ('user/saveAction', '2', '', 'user/saveAction', '', '1460031878', '1460031878');
INSERT INTO `yii2_auth_item` VALUES ('user/setStatus', '2', '', 'user/setStatus', '', '1460031878', '1460031878');
INSERT INTO `yii2_auth_item` VALUES ('user/updateNickname', '2', '', 'user/updateNickname', '', '1460031881', '1460031881');
INSERT INTO `yii2_auth_item` VALUES ('user/updatePassword', '2', '', 'user/updatePassword', '', '1460031881', '1460031881');

-- -----------------------------
-- Table structure for `yii2_auth_item_child`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_auth_item_child`;
CREATE TABLE `yii2_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `yii2_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `yii2_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `yii2_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `yii2_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -----------------------------
-- Records of `yii2_auth_item_child`
-- -----------------------------
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'ad/add');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'ad/add');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'ad/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'ad/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'ad/edit');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'ad/edit');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'ad/index');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'ad/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'admin/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'article/add');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'article/add');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'article/autoSave');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'article/autoSave');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'article/clear');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'article/clear');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'article/edit');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'article/edit');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'article/index');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'article/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'article/move');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'article/move');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'article/permit');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'article/permit');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'article/recycle');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'article/recycle');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'article/setStatus');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'article/setStatus');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'article/update');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'article/update');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'attribute/add');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'attribute/edit');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'attribute/index1');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'attribute/setStatus');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'attribute/update');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'auth/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'category/add');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'category/add');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'category/edit');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'category/edit');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'category/index');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'category/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'category/operate/type/merge');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'category/operate/type/merge');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'category/operate/type/move');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'category/remove');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'category/remove');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'certificate/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'certificate/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'certificate/edit');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'certificate/edit');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'certificate/index');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'certificate/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'config/add');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'config/del');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'config/edit');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'config/group');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'config/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'config/save');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'Config/sort');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'database/del');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'database/export');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'database/import');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'database/index?type=export');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'database/index?type=import');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'database/optimize');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'database/repair');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'group/add');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'group/add');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'group/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'group/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'group/edit');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'group/edit');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'group/index');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'group/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'index/index');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'index/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'log/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'log/view');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'menu/add');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'menu/edit');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'Menu/import');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'menu/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'Menu/sort');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'order/add');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'order/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'order/edit');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'order/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'other');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'shop/add');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'shop/add');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'shop/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'shop/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'shop/edit');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'shop/edit');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'shop/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'shop/index?type=1');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'shop/index?type=1');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'shop/index?type=2');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'shop/index?type=2');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'shop/index?type=3');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'shop/index?type=3');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'shop/index?type=4');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'shop/index?type=4');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'train/add');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'train/add');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'train/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'train/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'train/edit');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'train/edit');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'train/index');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'train/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'traintype/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'traintype/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'traintype/edit');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'traintype/edit');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'traintype/index');
INSERT INTO `yii2_auth_item_child` VALUES ('editor', 'traintype/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'user/add');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'user/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'user/edit');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'user/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'user/updateNickname');
INSERT INTO `yii2_auth_item_child` VALUES ('administrator', 'user/updatePassword');

-- -----------------------------
-- Table structure for `yii2_auth_rule`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_auth_rule`;
CREATE TABLE `yii2_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text COMMENT 'serialize后的rule对象',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -----------------------------
-- Records of `yii2_auth_rule`
-- -----------------------------
INSERT INTO `yii2_auth_rule` VALUES ('action/actionlog', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:16:\"action/actionlog\";s:9:\"createdAt\";i:1460031880;s:9:\"updatedAt\";i:1460031880;}', '1460031880', '1460031880');
INSERT INTO `yii2_auth_rule` VALUES ('action/edit', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"action/edit\";s:9:\"createdAt\";i:1460031880;s:9:\"updatedAt\";i:1460031880;}', '1460031880', '1460031880');
INSERT INTO `yii2_auth_rule` VALUES ('ad/add', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:6:\"ad/add\";s:9:\"createdAt\";i:1476437984;s:9:\"updatedAt\";i:1476437984;}', '1476437984', '1476437984');
INSERT INTO `yii2_auth_rule` VALUES ('ad/delete', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:9:\"ad/delete\";s:9:\"createdAt\";i:1476437984;s:9:\"updatedAt\";i:1476437984;}', '1476437984', '1476437984');
INSERT INTO `yii2_auth_rule` VALUES ('ad/edit', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:7:\"ad/edit\";s:9:\"createdAt\";i:1476437984;s:9:\"updatedAt\";i:1476437984;}', '1476437984', '1476437984');
INSERT INTO `yii2_auth_rule` VALUES ('ad/index', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:8:\"ad/index\";s:9:\"createdAt\";i:1476437984;s:9:\"updatedAt\";i:1476437984;}', '1476437984', '1476437984');
INSERT INTO `yii2_auth_rule` VALUES ('Addons/addHook', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:14:\"Addons/addHook\";s:9:\"createdAt\";i:1472528088;s:9:\"updatedAt\";i:1472528088;}', '1472528088', '1472528088');
INSERT INTO `yii2_auth_rule` VALUES ('Addons/adminList', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:16:\"Addons/adminList\";s:9:\"createdAt\";i:1472528088;s:9:\"updatedAt\";i:1472528088;}', '1472528088', '1472528088');
INSERT INTO `yii2_auth_rule` VALUES ('Addons/edithook', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:15:\"Addons/edithook\";s:9:\"createdAt\";i:1472528088;s:9:\"updatedAt\";i:1472528088;}', '1472528088', '1472528088');
INSERT INTO `yii2_auth_rule` VALUES ('Addons/execute', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:14:\"Addons/execute\";s:9:\"createdAt\";i:1472528088;s:9:\"updatedAt\";i:1472528088;}', '1472528088', '1472528088');
INSERT INTO `yii2_auth_rule` VALUES ('Addons/hooks', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:12:\"Addons/hooks\";s:9:\"createdAt\";i:1472528088;s:9:\"updatedAt\";i:1472528088;}', '1472528088', '1472528088');
INSERT INTO `yii2_auth_rule` VALUES ('Addons/index', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:12:\"Addons/index\";s:9:\"createdAt\";i:1460030539;s:9:\"updatedAt\";i:1460030539;}', '1460030539', '1460030539');
INSERT INTO `yii2_auth_rule` VALUES ('admin/add', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:9:\"admin/add\";s:9:\"createdAt\";i:1472528089;s:9:\"updatedAt\";i:1472528089;}', '1472528089', '1472528089');
INSERT INTO `yii2_auth_rule` VALUES ('admin/auth', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:10:\"admin/auth\";s:9:\"createdAt\";i:1472528089;s:9:\"updatedAt\";i:1472528089;}', '1472528089', '1472528089');
INSERT INTO `yii2_auth_rule` VALUES ('admin/edit', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:10:\"admin/edit\";s:9:\"createdAt\";i:1472528089;s:9:\"updatedAt\";i:1472528089;}', '1472528089', '1472528089');
INSERT INTO `yii2_auth_rule` VALUES ('admin/index', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"admin/index\";s:9:\"createdAt\";i:1472528089;s:9:\"updatedAt\";i:1472528089;}', '1472528089', '1472528089');
INSERT INTO `yii2_auth_rule` VALUES ('article/add', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"article/add\";s:9:\"createdAt\";i:1460027926;s:9:\"updatedAt\";i:1460027926;}', '1460027926', '1460027926');
INSERT INTO `yii2_auth_rule` VALUES ('article/autoSave', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:16:\"article/autoSave\";s:9:\"createdAt\";i:1460027926;s:9:\"updatedAt\";i:1460027926;}', '1460027926', '1460027926');
INSERT INTO `yii2_auth_rule` VALUES ('article/batchOperate', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:20:\"article/batchOperate\";s:9:\"createdAt\";i:1460027926;s:9:\"updatedAt\";i:1460027926;}', '1460027926', '1460027926');
INSERT INTO `yii2_auth_rule` VALUES ('article/clear', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:13:\"article/clear\";s:9:\"createdAt\";i:1460027927;s:9:\"updatedAt\";i:1460027927;}', '1460027927', '1460027927');
INSERT INTO `yii2_auth_rule` VALUES ('article/copy', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:12:\"article/copy\";s:9:\"createdAt\";i:1460027926;s:9:\"updatedAt\";i:1460027926;}', '1460027926', '1460027926');
INSERT INTO `yii2_auth_rule` VALUES ('article/edit', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:12:\"article/edit\";s:9:\"createdAt\";i:1460027926;s:9:\"updatedAt\";i:1460027926;}', '1460027926', '1460027926');
INSERT INTO `yii2_auth_rule` VALUES ('Article/examine', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:15:\"Article/examine\";s:9:\"createdAt\";i:1460027927;s:9:\"updatedAt\";i:1460027927;}', '1460027927', '1460027927');
INSERT INTO `yii2_auth_rule` VALUES ('article/index', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:13:\"article/index\";s:9:\"createdAt\";i:1460027926;s:9:\"updatedAt\";i:1460027926;}', '1460027926', '1460027926');
INSERT INTO `yii2_auth_rule` VALUES ('article/move', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:12:\"article/move\";s:9:\"createdAt\";i:1460027926;s:9:\"updatedAt\";i:1460027926;}', '1460027926', '1460027926');
INSERT INTO `yii2_auth_rule` VALUES ('article/paste', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:13:\"article/paste\";s:9:\"createdAt\";i:1460027926;s:9:\"updatedAt\";i:1460027926;}', '1460027926', '1460027926');
INSERT INTO `yii2_auth_rule` VALUES ('article/permit', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:14:\"article/permit\";s:9:\"createdAt\";i:1460027927;s:9:\"updatedAt\";i:1460027927;}', '1460027927', '1460027927');
INSERT INTO `yii2_auth_rule` VALUES ('article/recycle', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:15:\"article/recycle\";s:9:\"createdAt\";i:1460027927;s:9:\"updatedAt\";i:1460027927;}', '1460027927', '1460027927');
INSERT INTO `yii2_auth_rule` VALUES ('article/setStatus', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:17:\"article/setStatus\";s:9:\"createdAt\";i:1460027926;s:9:\"updatedAt\";i:1460027926;}', '1460027926', '1460027926');
INSERT INTO `yii2_auth_rule` VALUES ('Article/sort', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:12:\"Article/sort\";s:9:\"createdAt\";i:1460027927;s:9:\"updatedAt\";i:1460027927;}', '1460027927', '1460027927');
INSERT INTO `yii2_auth_rule` VALUES ('article/update', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:14:\"article/update\";s:9:\"createdAt\";i:1460027926;s:9:\"updatedAt\";i:1460027926;}', '1460027926', '1460027926');
INSERT INTO `yii2_auth_rule` VALUES ('attribute/add', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:13:\"attribute/add\";s:9:\"createdAt\";i:1460031881;s:9:\"updatedAt\";i:1460031881;}', '1460031881', '1460031881');
INSERT INTO `yii2_auth_rule` VALUES ('attribute/edit', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:14:\"attribute/edit\";s:9:\"createdAt\";i:1460031881;s:9:\"updatedAt\";i:1460031881;}', '1460031881', '1460031881');
INSERT INTO `yii2_auth_rule` VALUES ('attribute/index1', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:16:\"attribute/index1\";s:9:\"createdAt\";i:1460031881;s:9:\"updatedAt\";i:1460031881;}', '1460031881', '1460031881');
INSERT INTO `yii2_auth_rule` VALUES ('attribute/setStatus', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:19:\"attribute/setStatus\";s:9:\"createdAt\";i:1460031881;s:9:\"updatedAt\";i:1460031881;}', '1460031881', '1460031881');
INSERT INTO `yii2_auth_rule` VALUES ('attribute/update', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:16:\"attribute/update\";s:9:\"createdAt\";i:1460031881;s:9:\"updatedAt\";i:1460031881;}', '1460031881', '1460031881');
INSERT INTO `yii2_auth_rule` VALUES ('auth/access', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"auth/access\";s:9:\"createdAt\";i:1460031879;s:9:\"updatedAt\";i:1460031879;}', '1460031879', '1460031879');
INSERT INTO `yii2_auth_rule` VALUES ('auth/add', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:8:\"auth/add\";s:9:\"createdAt\";i:1472528089;s:9:\"updatedAt\";i:1472528089;}', '1472528089', '1472528089');
INSERT INTO `yii2_auth_rule` VALUES ('auth/addToCategory', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:18:\"auth/addToCategory\";s:9:\"createdAt\";i:1460031880;s:9:\"updatedAt\";i:1460031880;}', '1460031880', '1460031880');
INSERT INTO `yii2_auth_rule` VALUES ('auth/addToGroup', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:15:\"auth/addToGroup\";s:9:\"createdAt\";i:1460031880;s:9:\"updatedAt\";i:1460031880;}', '1460031880', '1460031880');
INSERT INTO `yii2_auth_rule` VALUES ('auth/addToModel', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:15:\"auth/addToModel\";s:9:\"createdAt\";i:1460031880;s:9:\"updatedAt\";i:1460031880;}', '1460031880', '1460031880');
INSERT INTO `yii2_auth_rule` VALUES ('auth/auth', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:9:\"auth/auth\";s:9:\"createdAt\";i:1460031879;s:9:\"updatedAt\";i:1460031879;}', '1460031879', '1460031879');
INSERT INTO `yii2_auth_rule` VALUES ('auth/category', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:13:\"auth/category\";s:9:\"createdAt\";i:1460031880;s:9:\"updatedAt\";i:1460031880;}', '1460031880', '1460031880');
INSERT INTO `yii2_auth_rule` VALUES ('auth/changeStatus?method=deleteGroup', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:36:\"auth/changeStatus?method=deleteGroup\";s:9:\"createdAt\";i:1460031879;s:9:\"updatedAt\";i:1460031879;}', '1460031879', '1460031879');
INSERT INTO `yii2_auth_rule` VALUES ('auth/changeStatus?method=forbidGroup', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:36:\"auth/changeStatus?method=forbidGroup\";s:9:\"createdAt\";i:1460031879;s:9:\"updatedAt\";i:1460031879;}', '1460031879', '1460031879');
INSERT INTO `yii2_auth_rule` VALUES ('auth/changeStatus?method=resumeGroup', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:36:\"auth/changeStatus?method=resumeGroup\";s:9:\"createdAt\";i:1460031879;s:9:\"updatedAt\";i:1460031879;}', '1460031879', '1460031879');
INSERT INTO `yii2_auth_rule` VALUES ('auth/createGroup', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:16:\"auth/createGroup\";s:9:\"createdAt\";i:1460031879;s:9:\"updatedAt\";i:1460031879;}', '1460031879', '1460031879');
INSERT INTO `yii2_auth_rule` VALUES ('auth/delete', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"auth/delete\";s:9:\"createdAt\";i:1472528089;s:9:\"updatedAt\";i:1472528089;}', '1472528089', '1472528089');
INSERT INTO `yii2_auth_rule` VALUES ('auth/edit', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:9:\"auth/edit\";s:9:\"createdAt\";i:1472528089;s:9:\"updatedAt\";i:1472528089;}', '1472528089', '1472528089');
INSERT INTO `yii2_auth_rule` VALUES ('auth/editGroup', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:14:\"auth/editGroup\";s:9:\"createdAt\";i:1460031879;s:9:\"updatedAt\";i:1460031879;}', '1460031879', '1460031879');
INSERT INTO `yii2_auth_rule` VALUES ('auth/index', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:10:\"auth/index\";s:9:\"createdAt\";i:1459148617;s:9:\"updatedAt\";i:1459148627;}', '1456542110', '1456542120');
INSERT INTO `yii2_auth_rule` VALUES ('auth/modelauth', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:14:\"auth/modelauth\";s:9:\"createdAt\";i:1460031880;s:9:\"updatedAt\";i:1460031880;}', '1460031880', '1460031880');
INSERT INTO `yii2_auth_rule` VALUES ('auth/removeFromGroup', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:20:\"auth/removeFromGroup\";s:9:\"createdAt\";i:1460031880;s:9:\"updatedAt\";i:1460031880;}', '1460031880', '1460031880');
INSERT INTO `yii2_auth_rule` VALUES ('auth/user', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:9:\"auth/user\";s:9:\"createdAt\";i:1460031880;s:9:\"updatedAt\";i:1460031880;}', '1460031880', '1460031880');
INSERT INTO `yii2_auth_rule` VALUES ('auth/writeGroup', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:15:\"auth/writeGroup\";s:9:\"createdAt\";i:1460031879;s:9:\"updatedAt\";i:1460031879;}', '1460031879', '1460031879');
INSERT INTO `yii2_auth_rule` VALUES ('category/add', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:12:\"category/add\";s:9:\"createdAt\";i:1460031882;s:9:\"updatedAt\";i:1460031882;}', '1460031882', '1460031882');
INSERT INTO `yii2_auth_rule` VALUES ('category/edit', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:13:\"category/edit\";s:9:\"createdAt\";i:1460031882;s:9:\"updatedAt\";i:1460031882;}', '1460031882', '1460031882');
INSERT INTO `yii2_auth_rule` VALUES ('category/index', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:14:\"category/index\";s:9:\"createdAt\";i:1460031882;s:9:\"updatedAt\";i:1460031882;}', '1460031882', '1460031882');
INSERT INTO `yii2_auth_rule` VALUES ('category/operate/type/merge', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:27:\"category/operate/type/merge\";s:9:\"createdAt\";i:1460031882;s:9:\"updatedAt\";i:1460031882;}', '1460031882', '1460031882');
INSERT INTO `yii2_auth_rule` VALUES ('category/operate/type/move', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:26:\"category/operate/type/move\";s:9:\"createdAt\";i:1460031882;s:9:\"updatedAt\";i:1460031882;}', '1460031882', '1460031882');
INSERT INTO `yii2_auth_rule` VALUES ('category/remove', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:15:\"category/remove\";s:9:\"createdAt\";i:1460031882;s:9:\"updatedAt\";i:1460031882;}', '1460031882', '1460031882');
INSERT INTO `yii2_auth_rule` VALUES ('certificate/delete', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:18:\"certificate/delete\";s:9:\"createdAt\";i:1476437984;s:9:\"updatedAt\";i:1476437984;}', '1476437984', '1476437984');
INSERT INTO `yii2_auth_rule` VALUES ('certificate/edit', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:16:\"certificate/edit\";s:9:\"createdAt\";i:1476437983;s:9:\"updatedAt\";i:1476437983;}', '1476437983', '1476437983');
INSERT INTO `yii2_auth_rule` VALUES ('certificate/index', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:17:\"certificate/index\";s:9:\"createdAt\";i:1476437983;s:9:\"updatedAt\";i:1476437983;}', '1476437983', '1476437983');
INSERT INTO `yii2_auth_rule` VALUES ('channel/add', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"channel/add\";s:9:\"createdAt\";i:1460031884;s:9:\"updatedAt\";i:1460031884;}', '1460031884', '1460031884');
INSERT INTO `yii2_auth_rule` VALUES ('channel/del', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"channel/del\";s:9:\"createdAt\";i:1460031884;s:9:\"updatedAt\";i:1460031884;}', '1460031884', '1460031884');
INSERT INTO `yii2_auth_rule` VALUES ('channel/edit', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:12:\"channel/edit\";s:9:\"createdAt\";i:1460031884;s:9:\"updatedAt\";i:1460031884;}', '1460031884', '1460031884');
INSERT INTO `yii2_auth_rule` VALUES ('channel/index', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:13:\"channel/index\";s:9:\"createdAt\";i:1460031884;s:9:\"updatedAt\";i:1460031884;}', '1460031884', '1460031884');
INSERT INTO `yii2_auth_rule` VALUES ('config/add', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:10:\"config/add\";s:9:\"createdAt\";i:1460031883;s:9:\"updatedAt\";i:1460031883;}', '1460031883', '1460031883');
INSERT INTO `yii2_auth_rule` VALUES ('config/del', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:10:\"config/del\";s:9:\"createdAt\";i:1460031883;s:9:\"updatedAt\";i:1460031883;}', '1460031883', '1460031883');
INSERT INTO `yii2_auth_rule` VALUES ('config/edit', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"config/edit\";s:9:\"createdAt\";i:1460031883;s:9:\"updatedAt\";i:1460031883;}', '1460031883', '1460031883');
INSERT INTO `yii2_auth_rule` VALUES ('config/group', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:12:\"config/group\";s:9:\"createdAt\";i:1459148617;s:9:\"updatedAt\";i:1459148627;}', '1200000000', '1300000000');
INSERT INTO `yii2_auth_rule` VALUES ('config/index', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:12:\"config/index\";s:9:\"createdAt\";i:1459148617;s:9:\"updatedAt\";i:1459148627;}', '1200000000', '1300000000');
INSERT INTO `yii2_auth_rule` VALUES ('config/save', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"config/save\";s:9:\"createdAt\";i:1460031883;s:9:\"updatedAt\";i:1460031883;}', '1460031883', '1460031883');
INSERT INTO `yii2_auth_rule` VALUES ('Config/sort', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"Config/sort\";s:9:\"createdAt\";i:1460031884;s:9:\"updatedAt\";i:1460031884;}', '1460031884', '1460031884');
INSERT INTO `yii2_auth_rule` VALUES ('database/del', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:12:\"database/del\";s:9:\"createdAt\";i:1460031882;s:9:\"updatedAt\";i:1460031882;}', '1460031882', '1460031882');
INSERT INTO `yii2_auth_rule` VALUES ('database/export', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:15:\"database/export\";s:9:\"createdAt\";i:1460031881;s:9:\"updatedAt\";i:1460031881;}', '1460031881', '1460031881');
INSERT INTO `yii2_auth_rule` VALUES ('database/import', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:15:\"database/import\";s:9:\"createdAt\";i:1460031882;s:9:\"updatedAt\";i:1460031882;}', '1460031882', '1460031882');
INSERT INTO `yii2_auth_rule` VALUES ('database/index?type=export', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:26:\"database/index?type=export\";s:9:\"createdAt\";i:1459148617;s:9:\"updatedAt\";i:1459148627;}', '1456542110', '1456542120');
INSERT INTO `yii2_auth_rule` VALUES ('database/index?type=import', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:26:\"database/index?type=import\";s:9:\"createdAt\";i:1459148617;s:9:\"updatedAt\";i:1459148627;}', '1456542110', '1456542120');
INSERT INTO `yii2_auth_rule` VALUES ('database/optimize', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:17:\"database/optimize\";s:9:\"createdAt\";i:1460031881;s:9:\"updatedAt\";i:1460031881;}', '1460031881', '1460031881');
INSERT INTO `yii2_auth_rule` VALUES ('database/repair', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:15:\"database/repair\";s:9:\"createdAt\";i:1460031881;s:9:\"updatedAt\";i:1460031881;}', '1460031881', '1460031881');
INSERT INTO `yii2_auth_rule` VALUES ('group/add', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:9:\"group/add\";s:9:\"createdAt\";i:1476437986;s:9:\"updatedAt\";i:1476437986;}', '1476437986', '1476437986');
INSERT INTO `yii2_auth_rule` VALUES ('group/delete', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:12:\"group/delete\";s:9:\"createdAt\";i:1476437986;s:9:\"updatedAt\";i:1476437986;}', '1476437986', '1476437986');
INSERT INTO `yii2_auth_rule` VALUES ('group/edit', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:10:\"group/edit\";s:9:\"createdAt\";i:1476437986;s:9:\"updatedAt\";i:1476437986;}', '1476437986', '1476437986');
INSERT INTO `yii2_auth_rule` VALUES ('group/index', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"group/index\";s:9:\"createdAt\";i:1476437986;s:9:\"updatedAt\";i:1476437986;}', '1476437986', '1476437986');
INSERT INTO `yii2_auth_rule` VALUES ('index/index', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"index/index\";s:9:\"createdAt\";i:1459148617;s:9:\"updatedAt\";i:1459148627;}', '1456542110', '1456542120');
INSERT INTO `yii2_auth_rule` VALUES ('log/index', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:9:\"log/index\";s:9:\"createdAt\";i:1472528090;s:9:\"updatedAt\";i:1472528090;}', '1472528090', '1472528090');
INSERT INTO `yii2_auth_rule` VALUES ('log/view', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:8:\"log/view\";s:9:\"createdAt\";i:1472528090;s:9:\"updatedAt\";i:1472528090;}', '1472528090', '1472528090');
INSERT INTO `yii2_auth_rule` VALUES ('login/logout', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:12:\"login/logout\";s:9:\"createdAt\";i:1459148665;s:9:\"updatedAt\";i:1459148675;}', '1456542110', '1456542120');
INSERT INTO `yii2_auth_rule` VALUES ('menu/add', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:8:\"menu/add\";s:9:\"createdAt\";i:1460031884;s:9:\"updatedAt\";i:1460031884;}', '1460031884', '1460031884');
INSERT INTO `yii2_auth_rule` VALUES ('menu/edit', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:9:\"menu/edit\";s:9:\"createdAt\";i:1460031884;s:9:\"updatedAt\";i:1460031884;}', '1460031884', '1460031884');
INSERT INTO `yii2_auth_rule` VALUES ('Menu/import', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"Menu/import\";s:9:\"createdAt\";i:1460031884;s:9:\"updatedAt\";i:1460031884;}', '1460031884', '1460031884');
INSERT INTO `yii2_auth_rule` VALUES ('menu/index', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:10:\"menu/index\";s:9:\"createdAt\";i:1459148617;s:9:\"updatedAt\";i:1459148627;}', '1200000000', '1300000000');
INSERT INTO `yii2_auth_rule` VALUES ('Menu/sort', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:9:\"Menu/sort\";s:9:\"createdAt\";i:1460031884;s:9:\"updatedAt\";i:1460031884;}', '1460031884', '1460031884');
INSERT INTO `yii2_auth_rule` VALUES ('model/add', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:9:\"model/add\";s:9:\"createdAt\";i:1460031882;s:9:\"updatedAt\";i:1460031882;}', '1460031882', '1460031882');
INSERT INTO `yii2_auth_rule` VALUES ('model/edit', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:10:\"model/edit\";s:9:\"createdAt\";i:1460031883;s:9:\"updatedAt\";i:1460031883;}', '1460031883', '1460031883');
INSERT INTO `yii2_auth_rule` VALUES ('Model/generate', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:14:\"Model/generate\";s:9:\"createdAt\";i:1460031019;s:9:\"updatedAt\";i:1460031019;}', '1460031019', '1460031019');
INSERT INTO `yii2_auth_rule` VALUES ('Model/index', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"Model/index\";s:9:\"createdAt\";i:1460031882;s:9:\"updatedAt\";i:1460031882;}', '1460031882', '1460031882');
INSERT INTO `yii2_auth_rule` VALUES ('model/setStatus', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:15:\"model/setStatus\";s:9:\"createdAt\";i:1460031883;s:9:\"updatedAt\";i:1460031883;}', '1460031883', '1460031883');
INSERT INTO `yii2_auth_rule` VALUES ('model/update', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:12:\"model/update\";s:9:\"createdAt\";i:1460031883;s:9:\"updatedAt\";i:1460031883;}', '1460031883', '1460031883');
INSERT INTO `yii2_auth_rule` VALUES ('order/add', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:9:\"order/add\";s:9:\"createdAt\";i:1476438050;s:9:\"updatedAt\";i:1476438050;}', '1476438050', '1476438050');
INSERT INTO `yii2_auth_rule` VALUES ('order/delete', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:12:\"order/delete\";s:9:\"createdAt\";i:1476438049;s:9:\"updatedAt\";i:1476438049;}', '1476438049', '1476438049');
INSERT INTO `yii2_auth_rule` VALUES ('order/edit', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:10:\"order/edit\";s:9:\"createdAt\";i:1476438049;s:9:\"updatedAt\";i:1476438049;}', '1476438049', '1476438049');
INSERT INTO `yii2_auth_rule` VALUES ('order/index', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"order/index\";s:9:\"createdAt\";i:1472528088;s:9:\"updatedAt\";i:1472528088;}', '1472528088', '1472528088');
INSERT INTO `yii2_auth_rule` VALUES ('other', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:5:\"other\";s:9:\"createdAt\";i:1472528090;s:9:\"updatedAt\";i:1472528090;}', '1472528090', '1472528090');
INSERT INTO `yii2_auth_rule` VALUES ('shop/add', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:8:\"shop/add\";s:9:\"createdAt\";i:1476437985;s:9:\"updatedAt\";i:1476437985;}', '1476437985', '1476437985');
INSERT INTO `yii2_auth_rule` VALUES ('shop/delete', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"shop/delete\";s:9:\"createdAt\";i:1476437985;s:9:\"updatedAt\";i:1476437985;}', '1476437985', '1476437985');
INSERT INTO `yii2_auth_rule` VALUES ('shop/edit', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:9:\"shop/edit\";s:9:\"createdAt\";i:1476437985;s:9:\"updatedAt\";i:1476437985;}', '1476437985', '1476437985');
INSERT INTO `yii2_auth_rule` VALUES ('shop/group', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:10:\"shop/group\";s:9:\"createdAt\";i:1472528088;s:9:\"updatedAt\";i:1472528088;}', '1472528088', '1472528088');
INSERT INTO `yii2_auth_rule` VALUES ('shop/index', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:10:\"shop/index\";s:9:\"createdAt\";i:1479233606;s:9:\"updatedAt\";i:1479233606;}', '1479233606', '1479233606');
INSERT INTO `yii2_auth_rule` VALUES ('shop/index&type=1', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:17:\"shop/index&type=1\";s:9:\"createdAt\";i:1472528087;s:9:\"updatedAt\";i:1472528087;}', '1472528087', '1472528087');
INSERT INTO `yii2_auth_rule` VALUES ('shop/index&type=2', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:17:\"shop/index&type=2\";s:9:\"createdAt\";i:1472528087;s:9:\"updatedAt\";i:1472528087;}', '1472528087', '1472528087');
INSERT INTO `yii2_auth_rule` VALUES ('shop/index&type=3', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:17:\"shop/index&type=3\";s:9:\"createdAt\";i:1472528087;s:9:\"updatedAt\";i:1472528087;}', '1472528087', '1472528087');
INSERT INTO `yii2_auth_rule` VALUES ('shop/index&type=4', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:17:\"shop/index&type=4\";s:9:\"createdAt\";i:1472528088;s:9:\"updatedAt\";i:1472528088;}', '1472528088', '1472528088');
INSERT INTO `yii2_auth_rule` VALUES ('shop/index?type=1', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:17:\"shop/index?type=1\";s:9:\"createdAt\";i:1476437985;s:9:\"updatedAt\";i:1476437985;}', '1476437985', '1476437985');
INSERT INTO `yii2_auth_rule` VALUES ('shop/index?type=2', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:17:\"shop/index?type=2\";s:9:\"createdAt\";i:1476437985;s:9:\"updatedAt\";i:1476437985;}', '1476437985', '1476437985');
INSERT INTO `yii2_auth_rule` VALUES ('shop/index?type=3', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:17:\"shop/index?type=3\";s:9:\"createdAt\";i:1476437986;s:9:\"updatedAt\";i:1476437986;}', '1476437986', '1476437986');
INSERT INTO `yii2_auth_rule` VALUES ('shop/index?type=4', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:17:\"shop/index?type=4\";s:9:\"createdAt\";i:1476437986;s:9:\"updatedAt\";i:1476437986;}', '1476437986', '1476437986');
INSERT INTO `yii2_auth_rule` VALUES ('think/add', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:9:\"think/add\";s:9:\"createdAt\";i:1460031883;s:9:\"updatedAt\";i:1460031883;}', '1460031883', '1460031883');
INSERT INTO `yii2_auth_rule` VALUES ('think/edit', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:10:\"think/edit\";s:9:\"createdAt\";i:1460031019;s:9:\"updatedAt\";i:1460031019;}', '1460031019', '1460031019');
INSERT INTO `yii2_auth_rule` VALUES ('think/lists', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"think/lists\";s:9:\"createdAt\";i:1460031020;s:9:\"updatedAt\";i:1460031020;}', '1460031020', '1460031020');
INSERT INTO `yii2_auth_rule` VALUES ('train/add', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:9:\"train/add\";s:9:\"createdAt\";i:1476437985;s:9:\"updatedAt\";i:1476437985;}', '1476437985', '1476437985');
INSERT INTO `yii2_auth_rule` VALUES ('train/delete', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:12:\"train/delete\";s:9:\"createdAt\";i:1476437984;s:9:\"updatedAt\";i:1476437984;}', '1476437984', '1476437984');
INSERT INTO `yii2_auth_rule` VALUES ('train/edit', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:10:\"train/edit\";s:9:\"createdAt\";i:1476437984;s:9:\"updatedAt\";i:1476437984;}', '1476437984', '1476437984');
INSERT INTO `yii2_auth_rule` VALUES ('train/index', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"train/index\";s:9:\"createdAt\";i:1472528088;s:9:\"updatedAt\";i:1472528088;}', '1472528088', '1472528088');
INSERT INTO `yii2_auth_rule` VALUES ('traintype/delete', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:16:\"traintype/delete\";s:9:\"createdAt\";i:1476437984;s:9:\"updatedAt\";i:1476437984;}', '1476437984', '1476437984');
INSERT INTO `yii2_auth_rule` VALUES ('traintype/edit', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:14:\"traintype/edit\";s:9:\"createdAt\";i:1476437984;s:9:\"updatedAt\";i:1476437984;}', '1476437984', '1476437984');
INSERT INTO `yii2_auth_rule` VALUES ('traintype/index', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:15:\"traintype/index\";s:9:\"createdAt\";i:1476437984;s:9:\"updatedAt\";i:1476437984;}', '1476437984', '1476437984');
INSERT INTO `yii2_auth_rule` VALUES ('user/action', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"user/action\";s:9:\"createdAt\";i:1460031878;s:9:\"updatedAt\";i:1460031878;}', '1460031878', '1460031878');
INSERT INTO `yii2_auth_rule` VALUES ('user/add', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:8:\"user/add\";s:9:\"createdAt\";i:1460031877;s:9:\"updatedAt\";i:1460031877;}', '1460031877', '1460031877');
INSERT INTO `yii2_auth_rule` VALUES ('user/addaction', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:14:\"user/addaction\";s:9:\"createdAt\";i:1460031878;s:9:\"updatedAt\";i:1460031878;}', '1460031878', '1460031878');
INSERT INTO `yii2_auth_rule` VALUES ('user/auth', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:9:\"user/auth\";s:9:\"createdAt\";i:1460031878;s:9:\"updatedAt\";i:1460031878;}', '1460031878', '1460031878');
INSERT INTO `yii2_auth_rule` VALUES ('User/changeStatus?method=deleteUser', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:35:\"User/changeStatus?method=deleteUser\";s:9:\"createdAt\";i:1460031879;s:9:\"updatedAt\";i:1460031879;}', '1460031879', '1460031879');
INSERT INTO `yii2_auth_rule` VALUES ('user/changeStatus?method=forbidUser', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:35:\"user/changeStatus?method=forbidUser\";s:9:\"createdAt\";i:1460031878;s:9:\"updatedAt\";i:1460031878;}', '1460031878', '1460031878');
INSERT INTO `yii2_auth_rule` VALUES ('user/changeStatus?method=resumeUser', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:35:\"user/changeStatus?method=resumeUser\";s:9:\"createdAt\";i:1460031878;s:9:\"updatedAt\";i:1460031878;}', '1460031878', '1460031878');
INSERT INTO `yii2_auth_rule` VALUES ('user/delete', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"user/delete\";s:9:\"createdAt\";i:1476438050;s:9:\"updatedAt\";i:1476438050;}', '1476438050', '1476438050');
INSERT INTO `yii2_auth_rule` VALUES ('user/edit', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:9:\"user/edit\";s:9:\"createdAt\";i:1476438051;s:9:\"updatedAt\";i:1476438051;}', '1476438051', '1476438051');
INSERT INTO `yii2_auth_rule` VALUES ('user/editaction', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:15:\"user/editaction\";s:9:\"createdAt\";i:1460031878;s:9:\"updatedAt\";i:1460031878;}', '1460031878', '1460031878');
INSERT INTO `yii2_auth_rule` VALUES ('user/index', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:10:\"user/index\";s:9:\"createdAt\";i:1459148617;s:9:\"updatedAt\";i:1459148627;}', '1456542110', '1456542120');
INSERT INTO `yii2_auth_rule` VALUES ('user/saveAction', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:15:\"user/saveAction\";s:9:\"createdAt\";i:1460031878;s:9:\"updatedAt\";i:1460031878;}', '1460031878', '1460031878');
INSERT INTO `yii2_auth_rule` VALUES ('user/setStatus', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:14:\"user/setStatus\";s:9:\"createdAt\";i:1460031878;s:9:\"updatedAt\";i:1460031878;}', '1460031878', '1460031878');
INSERT INTO `yii2_auth_rule` VALUES ('user/updateNickname', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:19:\"user/updateNickname\";s:9:\"createdAt\";i:1460031881;s:9:\"updatedAt\";i:1460031881;}', '1460031881', '1460031881');
INSERT INTO `yii2_auth_rule` VALUES ('user/updatePassword', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:19:\"user/updatePassword\";s:9:\"createdAt\";i:1460031880;s:9:\"updatedAt\";i:1460031880;}', '1460031880', '1460031880');

-- -----------------------------
-- Table structure for `yii2_captcha`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_captcha`;
CREATE TABLE `yii2_captcha` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0' COMMENT 'IP地址',
  `mobile` char(20) NOT NULL COMMENT '手机号',
  `captcha` char(6) NOT NULL COMMENT '验证码',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='验证码表';

-- -----------------------------
-- Records of `yii2_captcha`
-- -----------------------------
INSERT INTO `yii2_captcha` VALUES ('1', '127.0.0.1', '13631539420', '7978', '1474196824');
INSERT INTO `yii2_captcha` VALUES ('2', '127.0.0.1', '13631639420', '6743', '1474197192');
INSERT INTO `yii2_captcha` VALUES ('3', '59.40.134.141', '13631539420', '8879', '1474199719');
INSERT INTO `yii2_captcha` VALUES ('4', '59.40.134.141', '13631639420', '1111', '1474206930');
INSERT INTO `yii2_captcha` VALUES ('5', '113.116.72.128', '13631539420', '2216', '1474278556');
INSERT INTO `yii2_captcha` VALUES ('6', '113.116.72.128', '13631539420', '6349', '1474279293');
INSERT INTO `yii2_captcha` VALUES ('7', '113.116.72.128', '13631539420', '8966', '1474279946');
INSERT INTO `yii2_captcha` VALUES ('8', '14.154.236.128', '13631539420', '4171', '1474281062');
INSERT INTO `yii2_captcha` VALUES ('9', '14.154.236.128', '13631539420', '3651', '1474281145');
INSERT INTO `yii2_captcha` VALUES ('10', '116.6.88.148', '18665354960', '8448', '1474334541');
INSERT INTO `yii2_captcha` VALUES ('11', '113.104.231.102', '13421839870', '3321', '1474365606');
INSERT INTO `yii2_captcha` VALUES ('12', '113.104.231.102', '13421839870', '8593', '1474378859');
INSERT INTO `yii2_captcha` VALUES ('13', '113.104.231.102', '13421839870', '6249', '1474380034');
INSERT INTO `yii2_captcha` VALUES ('14', '113.104.231.102', '13421839870', '9893', '1474380089');
INSERT INTO `yii2_captcha` VALUES ('15', '113.104.231.102', '13316922246', '9521', '1474380153');
INSERT INTO `yii2_captcha` VALUES ('16', '113.104.231.115', '13421839870', '1606', '1474443343');
INSERT INTO `yii2_captcha` VALUES ('17', '113.104.231.115', '13421839870', '9673', '1474443423');
INSERT INTO `yii2_captcha` VALUES ('18', '113.104.231.115', '13421839870', '3285', '1474443621');
INSERT INTO `yii2_captcha` VALUES ('19', '183.11.157.104', '13631539420', '6292', '1474444126');
INSERT INTO `yii2_captcha` VALUES ('20', '183.11.157.104', '13631539420', '3221', '1474444208');
INSERT INTO `yii2_captcha` VALUES ('21', '113.104.231.115', '13421839870', '9664', '1474444261');
INSERT INTO `yii2_captcha` VALUES ('22', '113.104.231.115', '13421839870', '6477', '1474444479');
INSERT INTO `yii2_captcha` VALUES ('23', '120.234.16.114', '13316922246', '2312', '1474612724');

-- -----------------------------
-- Table structure for `yii2_category`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_category`;
CREATE TABLE `yii2_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `link` varchar(250) DEFAULT '' COMMENT '外链',
  `extend` text COMMENT '扩展设置',
  `meta_title` varchar(50) DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键字',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- -----------------------------
-- Records of `yii2_category`
-- -----------------------------
INSERT INTO `yii2_category` VALUES ('1', '0', 'about', '关于我们', '', '', '', '', '', '1379474947', '1476341718', '2', '1');
INSERT INTO `yii2_category` VALUES ('3', '0', 'event', '活动', '', 'a:2:{s:2:\"sd\";s:2:\"11\";s:4:\"sdfs\";s:3:\"222\";}', '测试标题', '测试seo关键词', '测试描述', '1471947194', '1473604631', '1', '1');

-- -----------------------------
-- Table structure for `yii2_config`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_config`;
CREATE TABLE `yii2_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `value` text COMMENT '配置值',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `yii2_config`
-- -----------------------------
INSERT INTO `yii2_config` VALUES ('1', 'WEB_SITE_TITLE', '网站标题', '1', '1', '内容管理框架122', '', '网站标题前台显示标题', '1378898976', '1479233715', '0', '1');
INSERT INTO `yii2_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '网站描述', '1', '2', '内容管理框架1', '', '网站搜索引擎描述', '1378898976', '1479233697', '1', '1');
INSERT INTO `yii2_config` VALUES ('3', 'WEB_SITE_KEYWORD', '网站关键字', '1', '2', '黄龙飞111', '', '网站搜索引擎关键字', '1378898976', '1479233697', '8', '1');
INSERT INTO `yii2_config` VALUES ('4', 'WEB_SITE_CLOSE', '关闭站点', '4', '4', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1463024280', '1', '0');
INSERT INTO `yii2_config` VALUES ('9', 'CONFIG_TYPE_LIST', '配置类型列表', '3', '3', '0:数字
1:字符
2:文本
3:数组
4:枚举', '', '主要用于数据解析和页面表单的生成', '1378898976', '1463024244', '2', '1');
INSERT INTO `yii2_config` VALUES ('10', 'WEB_SITE_ICP', '网站备案号', '1', '1', '沪ICP备12007941号-2', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1479233697', '9', '1');
INSERT INTO `yii2_config` VALUES ('11', 'DATA_BACKUP_PATH', '数据库备份路径', '4', '1', '/storage/web/database/', '', '路径必须以 / 结尾', '1379053380', '1476448404', '3', '1');
INSERT INTO `yii2_config` VALUES ('12', 'DOCUMENT_DISPLAY', '文档可见性', '2', '3', '0:所有人可见
1:仅注册会员可见
2:仅管理员可见', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1463041605', '4', '1');
INSERT INTO `yii2_config` VALUES ('13', 'COLOR_STYLE', '后台色系', '1', '4', 'default_color', 'default_color:默认
blue_color:紫罗兰', '后台颜色风格', '1379122533', '1479233697', '10', '1');

-- -----------------------------
-- Table structure for `yii2_log`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_log`;
CREATE TABLE `yii2_log` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `uid` int(8) NOT NULL COMMENT '用户uid',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `controller` varchar(50) NOT NULL COMMENT '控制器',
  `action` varchar(50) NOT NULL COMMENT '动作',
  `querystring` varchar(255) NOT NULL COMMENT '查询字符串',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `ip` varchar(15) NOT NULL DEFAULT '0.0.0.0' COMMENT 'IP',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台日志';

-- -----------------------------
-- Records of `yii2_log`
-- -----------------------------
INSERT INTO `yii2_log` VALUES ('1', '2', '修改菜单', 'menu', 'index', '/admin.php/menu/index?id=4', '用户修改了菜单', '192.168.0.101', '1435658950', '1');

-- -----------------------------
-- Table structure for `yii2_menu`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_menu`;
CREATE TABLE `yii2_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `yii2_menu`
-- -----------------------------
INSERT INTO `yii2_menu` VALUES ('1', '首页', '0', '1', 'index/index', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('2', '内容', '0', '2', 'article/index', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('3', '文章管理', '2', '1', 'article/index', '0', '文章管理|icon-note', '1');
INSERT INTO `yii2_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('139', '潜水管理', '2', '22', 'shop/index?type=3', '0', '商城管理|icon-basket', '1');
INSERT INTO `yii2_menu` VALUES ('13', '回收站', '2', '99', 'article/recycle', '1', '内容', '1');
INSERT INTO `yii2_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('16', '用户', '0', '4', 'admin/index', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('17', '管理员管理', '16', '1', 'admin/index', '0', '后台用户|icon-user', '1');
INSERT INTO `yii2_menu` VALUES ('18', '新增管理员', '17', '0', 'admin/add', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('137', '更新', '17', '0', 'admin/edit', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('144', '商城套餐', '2', '29', 'group/index', '0', '商城管理|icon-basket', '1');
INSERT INTO `yii2_menu` VALUES ('155', '删除', '144', '0', 'group/delete', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('156', '添加培训', '2', '0', 'train/add', '1', '', '1');
INSERT INTO `yii2_menu` VALUES ('157', '编辑培训', '2', '0', 'train/edit', '1', '', '1');
INSERT INTO `yii2_menu` VALUES ('27', '权限管理', '16', '2', 'auth/index', '0', '后台用户|icon-user', '1');
INSERT INTO `yii2_menu` VALUES ('28', '删除', '27', '0', 'auth/delete', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('29', '编辑', '27', '0', 'auth/edit', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('30', '恢复', '27', '0', 'auth/add', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('154', '编辑', '144', '0', 'group/edit', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('153', '添加', '144', '0', 'group/add', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('152', '删除商品', '2', '0', 'shop/delete', '1', '', '1');
INSERT INTO `yii2_menu` VALUES ('34', '授权', '27', '0', 'auth/auth', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('35', '访问授权', '27', '0', 'auth/access', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('36', '成员授权', '27', '0', 'auth/user', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('145', '添加', '142', '0', 'user/add', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('146', '编辑', '142', '0', 'user/edit', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('147', '删除', '142', '0', 'user/delete', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('150', '添加商品', '2', '0', 'shop/add', '1', '', '1');
INSERT INTO `yii2_menu` VALUES ('151', '编辑商品', '2', '0', 'shop/edit', '1', '', '1');
INSERT INTO `yii2_menu` VALUES ('43', '订单', '0', '3', 'order/index', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('44', '订单列表', '43', '1', 'order/index', '0', '订单管理|fa fa-cny', '1');
INSERT INTO `yii2_menu` VALUES ('143', '海钓管理', '2', '23', 'shop/index?type=4', '0', '商城管理|icon-basket', '1');
INSERT INTO `yii2_menu` VALUES ('142', '前台用户', '16', '20', 'user/index', '0', '前台用户|icon-users', '1');
INSERT INTO `yii2_menu` VALUES ('141', '帆船管理', '2', '21', 'shop/index?type=2', '0', '商城管理|icon-basket', '1');
INSERT INTO `yii2_menu` VALUES ('55', '添加', '44', '0', 'order/add', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('56', '编辑', '44', '0', 'order/edit', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('148', '删除', '44', '0', 'order/delete', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('63', '属性管理', '68', '0', 'attribute/index1', '1', '', '1');
INSERT INTO `yii2_menu` VALUES ('64', '新增', '63', '0', 'attribute/add', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('65', '编辑', '63', '0', 'attribute/edit', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('66', '改变状态', '63', '0', 'attribute/setStatus', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('67', '保存数据', '63', '0', 'attribute/update', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('68', '系统', '0', '5', 'config/group', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('69', '网站设置', '68', '1', 'config/group', '0', '系统设置|icon-settings', '1');
INSERT INTO `yii2_menu` VALUES ('70', '配置管理', '68', '1', 'config/index', '0', '系统设置|icon-settings', '1');
INSERT INTO `yii2_menu` VALUES ('71', '编辑', '70', '0', 'config/edit', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('72', '删除', '70', '0', 'config/del', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('73', '新增', '70', '0', 'config/add', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('74', '保存', '70', '0', 'config/save', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('75', '菜单管理', '68', '5', 'menu/index', '0', '系统设置|icon-settings', '1');
INSERT INTO `yii2_menu` VALUES ('80', '分类管理', '2', '2', 'category/index', '0', '文章管理|icon-note', '1');
INSERT INTO `yii2_menu` VALUES ('81', '编辑', '80', '0', 'category/edit', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('82', '新增', '80', '0', 'category/add', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('83', '删除', '80', '0', 'category/remove', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('84', '移动', '80', '0', 'category/operate/type/move', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('85', '合并', '80', '0', 'category/operate/type/merge', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('86', '备份数据库', '68', '10', 'database/index?type=export', '0', '数据备份|fa fa-database', '1');
INSERT INTO `yii2_menu` VALUES ('87', '备份', '86', '0', 'database/export', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('88', '优化表', '86', '0', 'database/optimize', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('89', '修复表', '86', '0', 'database/repair', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('90', '还原数据库', '68', '11', 'database/index?type=import', '0', '数据备份|fa fa-database', '1');
INSERT INTO `yii2_menu` VALUES ('91', '恢复', '90', '0', 'database/import', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('92', '删除', '90', '0', 'database/del', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('93', '其他栏目', '0', '5', 'other', '1', '', '1');
INSERT INTO `yii2_menu` VALUES ('96', '新增', '75', '0', 'menu/add', '0', '系统设置|icon-legal', '1');
INSERT INTO `yii2_menu` VALUES ('98', '编辑', '75', '0', 'menu/edit', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('106', '行为日志', '16', '30', 'log/index', '0', '用户日志|icon-check', '1');
INSERT INTO `yii2_menu` VALUES ('108', '修改密码', '16', '0', 'user/updatePassword', '1', '', '1');
INSERT INTO `yii2_menu` VALUES ('109', '修改昵称', '16', '0', 'user/updateNickname', '1', '', '1');
INSERT INTO `yii2_menu` VALUES ('110', '查看行为日志', '106', '0', 'log/view', '1', '', '1');
INSERT INTO `yii2_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('149', '培训课程', '2', '51', 'train/index', '0', '培训管理|fa fa-certificate', '1');
INSERT INTO `yii2_menu` VALUES ('138', '酒店管理', '2', '20', 'shop/index?type=1', '0', '商城管理|icon-basket', '1');
INSERT INTO `yii2_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '1');
INSERT INTO `yii2_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '1');
INSERT INTO `yii2_menu` VALUES ('129', '管理员授权', '17', '0', 'admin/auth', '0', '', '0');
INSERT INTO `yii2_menu` VALUES ('131', '待完成任务', '1', '0', 'index/index', '0', '任务列表|icon-speech', '0');
INSERT INTO `yii2_menu` VALUES ('158', '删除培训', '2', '0', 'train/delete', '1', '', '1');
INSERT INTO `yii2_menu` VALUES ('159', '广告管理', '2', '0', 'ad/index', '0', '广告管理|icon-target', '1');
INSERT INTO `yii2_menu` VALUES ('160', '添加', '159', '0', 'ad/add', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('161', '编辑', '159', '0', 'ad/edit', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('162', '删除', '159', '0', 'ad/delete', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('163', '证书管理', '2', '0', 'certificate/index', '0', '培训管理|fa fa-certificate', '1');
INSERT INTO `yii2_menu` VALUES ('164', '添加/修改证书', '163', '0', 'certificate/edit', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('165', '删除证书', '163', '0', 'certificate/delete', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('166', '培训类型', '2', '0', 'traintype/index', '0', '培训管理|fa fa-certificate', '1');
INSERT INTO `yii2_menu` VALUES ('167', '添加/修改类型', '166', '0', 'traintype/edit', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('168', '删除类型', '166', '0', 'traintype/delete', '0', '', '1');
INSERT INTO `yii2_menu` VALUES ('169', '商城管理', '2', '0', 'shop/index', '1', '', '1');

-- -----------------------------
-- Table structure for `yii2_order`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_order`;
CREATE TABLE `yii2_order` (
  `order_id` int(8) NOT NULL AUTO_INCREMENT,
  `order_sn` char(10) NOT NULL COMMENT '订单号',
  `uid` int(8) DEFAULT '0' COMMENT '用户id',
  `name` char(30) DEFAULT '' COMMENT '姓名',
  `tel` char(20) DEFAULT '' COMMENT '电话',
  `sfz` char(20) DEFAULT '' COMMENT '身份证号',
  `type` char(10) NOT NULL COMMENT '订单类型 shop或train',
  `aid` int(8) NOT NULL COMMENT '商品或培训ID',
  `title` varchar(100) NOT NULL COMMENT '商品名称',
  `province` int(6) DEFAULT '0' COMMENT '省',
  `city` int(6) DEFAULT '0' COMMENT '市',
  `area` int(6) DEFAULT '0' COMMENT '区',
  `start_time` int(10) NOT NULL COMMENT '起租时间',
  `end_time` int(10) NOT NULL COMMENT '退租时间',
  `num` int(4) NOT NULL DEFAULT '1' COMMENT '数量',
  `pay_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态 0未支付 1已支付',
  `pay_time` int(10) NOT NULL COMMENT '支付时间',
  `pay_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '支付类型 1微信 2支付宝 3银联',
  `pay_source` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '支付途径 1网站 2微信 3后台',
  `create_time` int(10) NOT NULL COMMENT '订单创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- -----------------------------
-- Records of `yii2_order`
-- -----------------------------
INSERT INTO `yii2_order` VALUES ('1', '135555111', '6', '', '', '', 'shop', '1', '商品名称', '0', '0', '0', '1345678940', '1345688940', '1', '0', '1345668940', '1', '1', '1345678940', '1');
INSERT INTO `yii2_order` VALUES ('2', '135555111', '7', '', '', '', 'shop', '1', '商品名称1111', '0', '0', '0', '1345678940', '1345688940', '1', '1', '1365668940', '2', '2', '1365678940', '1');
INSERT INTO `yii2_order` VALUES ('3', '1473787901', '0', '', '', '', 'shop', '1', '大床双人房特价', '0', '0', '0', '1473811200', '1474416000', '1', '1', '1473787901', '1', '1', '1473787924', '1');
INSERT INTO `yii2_order` VALUES ('4', '1473788097', '0', '龙凤', '15956985698', '', 'train', '3', '帆船培训2', '5', '65', '629', '1473811200', '1474416000', '1', '0', '1478145300', '1', '1', '1473788126', '1');
INSERT INTO `yii2_order` VALUES ('5', '1474094023', '0', '1112222', '222', '', 'shop', '3', '大床双人房特价', '6', '80', '748', '1474529400', '1344600', '1', '1', '1479233520', '2', '1', '1474094061', '1');

-- -----------------------------
-- Table structure for `yii2_picture`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_picture`;
CREATE TABLE `yii2_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `md5` (`md5`) USING HASH
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `yii2_picture`
-- -----------------------------
INSERT INTO `yii2_picture` VALUES ('1', '201610/1477562926256.png', 'f1510ddb99606c5aa75fdf9c9e245136', '1477562926', '1');
INSERT INTO `yii2_picture` VALUES ('2', '201610/1477564226300.png', '86375d934477a20aaf0f446b12a17cfb', '1477564226', '1');
INSERT INTO `yii2_picture` VALUES ('7', '201611/1477984758635.png', '90b4da99d2fc0ea4435b19e674e2ddf0', '1477984758', '1');
INSERT INTO `yii2_picture` VALUES ('4', '201610/1477567061651.png', 'db09e4d570a5d46bda6782cff9ead020', '1477567061', '1');
INSERT INTO `yii2_picture` VALUES ('5', '201610/1477894552955.png', '3c680300f3ae5c417f1eec06e8e012ca', '1477894552', '1');
INSERT INTO `yii2_picture` VALUES ('6', '201610/1477895930794.png', '4f9a57edb7971bdcf5195cc79a9ab4f2', '1477895930', '1');
INSERT INTO `yii2_picture` VALUES ('8', '201611/1477986537333.png', '8a7102fa0ed5cdea5a359f5d068e3838', '1477986537', '1');
INSERT INTO `yii2_picture` VALUES ('9', '201611/1478850859946.jpg', 'b80a764cc220b8044e933df30774b218', '1478850859', '1');
INSERT INTO `yii2_picture` VALUES ('11', '201611/1478854002500.jpg', '04e145672b976fb47164dd96e0090fd1', '1478854002', '1');
INSERT INTO `yii2_picture` VALUES ('12', '201611/1478854666137.jpg', '1f611a254f541830ab3a3490e32368c2', '1478854666', '1');

-- -----------------------------
-- Table structure for `yii2_region`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_region`;
CREATE TABLE `yii2_region` (
  `region_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `region_name` varchar(120) NOT NULL DEFAULT '',
  `region_type` tinyint(1) NOT NULL DEFAULT '2',
  `initial` varchar(16) NOT NULL DEFAULT 'Z',
  `latitude` double DEFAULT NULL COMMENT '纬度',
  `longitude` double DEFAULT NULL COMMENT '经度',
  PRIMARY KEY (`region_id`),
  KEY `parent_id` (`parent_id`),
  KEY `region_type` (`region_type`),
  KEY `agency_id` (`initial`)
) ENGINE=MyISAM AUTO_INCREMENT=3410 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `yii2_region`
-- -----------------------------
INSERT INTO `yii2_region` VALUES ('1', '0', '中国', '0', '0',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2', '1', '北京', '1', 'BJ', '39.904214', '116.407413');
INSERT INTO `yii2_region` VALUES ('3', '1', '安徽', '1', 'AH',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('4', '1', '福建', '1', 'FJ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('5', '1', '甘肃', '1', 'GS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('6', '1', '广东', '1', 'GD',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('7', '1', '广西', '1', 'GX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('8', '1', '贵州', '1', 'GZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('9', '1', '海南', '1', 'HN',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('10', '1', '河北', '1', 'HB',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('11', '1', '河南', '1', 'HN',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('12', '1', '黑龙江', '1', 'HLJ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('13', '1', '湖北', '1', 'HB',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('14', '1', '湖南', '1', 'HN',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('15', '1', '吉林', '1', 'JL',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('16', '1', '江苏', '1', 'JS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('17', '1', '江西', '1', 'JX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('18', '1', '辽宁', '1', 'LN',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('19', '1', '内蒙古', '1', 'NMG',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('20', '1', '宁夏', '1', 'NX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('21', '1', '青海', '1', 'QH',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('22', '1', '山东', '1', 'SD',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('23', '1', '山西', '1', 'SX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('24', '1', '陕西', '1', 'SX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('25', '1', '上海', '1', 'SH',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('26', '1', '四川', '1', 'SC',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('27', '1', '天津', '1', 'TJ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('28', '1', '西藏', '1', 'XC',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('29', '1', '新疆', '1', 'XJ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('30', '1', '云南', '1', 'YN',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('31', '1', '浙江', '1', 'ZJ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('32', '1', '重庆', '1', 'ZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('33', '1', '香港', '1', 'XG',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('34', '1', '澳门', '1', 'AM',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('35', '1', '台湾', '1', 'TW',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('36', '3', '安庆', '2', 'AQ', '30.524895', '117.056857');
INSERT INTO `yii2_region` VALUES ('37', '3', '蚌埠', '2', 'BB', '32.916287', '117.389719');
INSERT INTO `yii2_region` VALUES ('38', '3', '巢湖', '2', 'CH', '31.597853', '117.864722');
INSERT INTO `yii2_region` VALUES ('39', '3', '池州', '2', 'CZ', '30.6648', '117.491568');
INSERT INTO `yii2_region` VALUES ('40', '3', '滁州', '2', 'CZ', '32.301556', '118.317107');
INSERT INTO `yii2_region` VALUES ('41', '3', '阜阳', '2', 'FY', '32.890124', '115.814205');
INSERT INTO `yii2_region` VALUES ('42', '3', '淮北', '2', 'HB', '33.955845', '116.798265');
INSERT INTO `yii2_region` VALUES ('43', '3', '淮南', '2', 'HN', '32.625478', '116.999933');
INSERT INTO `yii2_region` VALUES ('44', '3', '黄山', '2', 'HS', '29.714683', '118.337476');
INSERT INTO `yii2_region` VALUES ('45', '3', '六安', '2', 'LA', '31.745011', '116.505693');
INSERT INTO `yii2_region` VALUES ('46', '3', '马鞍山', '2', 'MAS', '31.670452', '118.50676');
INSERT INTO `yii2_region` VALUES ('47', '3', '宿州', '2', 'SZ', '33.639394', '116.985301');
INSERT INTO `yii2_region` VALUES ('48', '3', '铜陵', '2', 'TL', '30.94453', '117.810841');
INSERT INTO `yii2_region` VALUES ('49', '3', '芜湖', '2', 'WH', '31.352859', '118.432941');
INSERT INTO `yii2_region` VALUES ('50', '3', '宣城', '2', 'XC', '30.940718', '118.758816');
INSERT INTO `yii2_region` VALUES ('51', '3', '亳州', '2', 'Z', '33.844582', '115.778676');
INSERT INTO `yii2_region` VALUES ('52', '2', '北京', '2', 'BJ', '39.904214', '116.407413');
INSERT INTO `yii2_region` VALUES ('53', '4', '福州', '2', 'FZ', '26.074508', '119.296494');
INSERT INTO `yii2_region` VALUES ('54', '4', '龙岩', '2', 'LY', '25.075129', '117.017705');
INSERT INTO `yii2_region` VALUES ('55', '4', '南平', '2', 'NP', '26.641769', '118.177708');
INSERT INTO `yii2_region` VALUES ('56', '4', '宁德', '2', 'ND', '26.665617', '119.547933');
INSERT INTO `yii2_region` VALUES ('57', '4', '莆田', '2', 'PT', '25.454085', '119.007777');
INSERT INTO `yii2_region` VALUES ('58', '4', '泉州', '2', 'QZ', '24.907574', '118.586812');
INSERT INTO `yii2_region` VALUES ('59', '4', '三明', '2', 'SM', '26.263407', '117.638678');
INSERT INTO `yii2_region` VALUES ('60', '4', '厦门', '2', 'XM', '24.479836', '118.08942');
INSERT INTO `yii2_region` VALUES ('61', '4', '漳州', '2', 'ZZ', '24.512949', '117.647481');
INSERT INTO `yii2_region` VALUES ('62', '5', '兰州', '2', 'LZ', '36.061255', '103.834377');
INSERT INTO `yii2_region` VALUES ('63', '5', '白银', '2', 'BY', '36.544827', '104.137619');
INSERT INTO `yii2_region` VALUES ('64', '5', '定西', '2', 'DX', '35.580623', '104.626278');
INSERT INTO `yii2_region` VALUES ('65', '5', '甘南', '2', 'GN', '34.983296', '102.911262');
INSERT INTO `yii2_region` VALUES ('66', '5', '嘉峪关', '2', 'JYG', '39.77313', '98.289152');
INSERT INTO `yii2_region` VALUES ('67', '5', '金昌', '2', 'JC', '38.520089', '102.188043');
INSERT INTO `yii2_region` VALUES ('68', '5', '酒泉', '2', 'JQ', '39.732488', '98.494411');
INSERT INTO `yii2_region` VALUES ('69', '5', '临夏', '2', 'LX', '35.601182', '103.210539');
INSERT INTO `yii2_region` VALUES ('70', '5', '陇南', '2', 'LN', '33.400766', '104.922071');
INSERT INTO `yii2_region` VALUES ('71', '5', '平凉', '2', 'PL', '35.542686', '106.665106');
INSERT INTO `yii2_region` VALUES ('72', '5', '庆阳', '2', 'QY', '35.738668', '107.632469');
INSERT INTO `yii2_region` VALUES ('73', '5', '天水', '2', 'TS', '34.580862', '105.724947');
INSERT INTO `yii2_region` VALUES ('74', '5', '武威', '2', 'WW', '37.928336', '102.638009');
INSERT INTO `yii2_region` VALUES ('75', '5', '张掖', '2', 'ZY', '38.925646', '100.449822');
INSERT INTO `yii2_region` VALUES ('76', '6', '广州', '2', 'GZ', '23.129163', '113.264435');
INSERT INTO `yii2_region` VALUES ('77', '6', '深圳', '2', 'S', '22.543099', '114.057868');
INSERT INTO `yii2_region` VALUES ('78', '6', '潮州', '2', 'CZ', '23.656972', '116.622597');
INSERT INTO `yii2_region` VALUES ('79', '6', '东莞', '2', 'D', '23.020536', '113.751765');
INSERT INTO `yii2_region` VALUES ('80', '6', '佛山', '2', 'FS', '23.021548', '113.121416');
INSERT INTO `yii2_region` VALUES ('81', '6', '河源', '2', 'HY', '23.743538', '114.700447');
INSERT INTO `yii2_region` VALUES ('82', '6', '惠州', '2', 'HZ', '23.111847', '114.416196');
INSERT INTO `yii2_region` VALUES ('83', '6', '江门', '2', 'JM', '22.578738', '113.081901');
INSERT INTO `yii2_region` VALUES ('84', '6', '揭阳', '2', 'JY', '23.549993', '116.372831');
INSERT INTO `yii2_region` VALUES ('85', '6', '茂名', '2', 'MM', '21.662999', '110.925456');
INSERT INTO `yii2_region` VALUES ('86', '6', '梅州', '2', 'MZ', '24.288384', '116.122469');
INSERT INTO `yii2_region` VALUES ('87', '6', '清远', '2', 'QY', '23.681764', '113.056031');
INSERT INTO `yii2_region` VALUES ('88', '6', '汕头', '2', 'ST', '23.353299', '116.681838');
INSERT INTO `yii2_region` VALUES ('89', '6', '汕尾', '2', 'SW', '22.786211', '115.375279');
INSERT INTO `yii2_region` VALUES ('90', '6', '韶关', '2', 'SG', '24.810403', '113.597522');
INSERT INTO `yii2_region` VALUES ('91', '6', '阳江', '2', 'YJ', '21.857958', '111.982232');
INSERT INTO `yii2_region` VALUES ('92', '6', '云浮', '2', 'YF', '22.915094', '112.044491');
INSERT INTO `yii2_region` VALUES ('93', '6', '湛江', '2', 'ZJ', '21.270702', '110.359387');
INSERT INTO `yii2_region` VALUES ('94', '6', '肇庆', '2', 'ZQ', '23.047192', '112.465091');
INSERT INTO `yii2_region` VALUES ('95', '6', '中山', '2', 'ZS', '22.516686', '113.392795');
INSERT INTO `yii2_region` VALUES ('96', '6', '珠海', '2', 'ZH', '22.270715', '113.576726');
INSERT INTO `yii2_region` VALUES ('97', '7', '南宁', '2', 'NN', '22.817642', '108.365631');
INSERT INTO `yii2_region` VALUES ('98', '7', '桂林', '2', 'GL', '25.273566', '110.290195');
INSERT INTO `yii2_region` VALUES ('99', '7', '百色', '2', 'BS', '23.902371', '106.618275');
INSERT INTO `yii2_region` VALUES ('100', '7', '北海', '2', 'BH', '21.481217', '109.119899');
INSERT INTO `yii2_region` VALUES ('101', '7', '崇左', '2', 'CZ', '22.377281', '107.364962');
INSERT INTO `yii2_region` VALUES ('102', '7', '防城港', '2', 'FCG', '21.686114', '108.355638');
INSERT INTO `yii2_region` VALUES ('103', '7', '贵港', '2', 'GG', '23.111531', '109.598927');
INSERT INTO `yii2_region` VALUES ('104', '7', '河池', '2', 'HC', '24.692931', '108.085261');
INSERT INTO `yii2_region` VALUES ('105', '7', '贺州', '2', 'HZ', '24.40357', '111.566753');
INSERT INTO `yii2_region` VALUES ('106', '7', '来宾', '2', 'LB', '23.750312', '109.22146');
INSERT INTO `yii2_region` VALUES ('107', '7', '柳州', '2', 'LZ', '24.325502', '109.415953');
INSERT INTO `yii2_region` VALUES ('108', '7', '钦州', '2', 'QZ', '21.980968', '108.654543');
INSERT INTO `yii2_region` VALUES ('109', '7', '梧州', '2', 'WZ', '23.47691', '111.27917');
INSERT INTO `yii2_region` VALUES ('110', '7', '玉林', '2', 'YL', '22.636379', '110.164756');
INSERT INTO `yii2_region` VALUES ('111', '8', '贵阳', '2', 'GY', '26.647449', '106.630143');
INSERT INTO `yii2_region` VALUES ('112', '8', '安顺', '2', 'AS', '26.253072', '105.947594');
INSERT INTO `yii2_region` VALUES ('113', '8', '毕节', '2', 'BJ', '27.302589', '105.283992');
INSERT INTO `yii2_region` VALUES ('114', '8', '六盘水', '2', 'LPS', '26.592666', '104.830359');
INSERT INTO `yii2_region` VALUES ('115', '8', '黔东南', '2', 'QDN', '26.58355', '107.982828');
INSERT INTO `yii2_region` VALUES ('116', '8', '黔南', '2', 'QN', '26.254092', '107.52214');
INSERT INTO `yii2_region` VALUES ('117', '8', '黔西南', '2', 'QXN', '25.087825', '104.906397');
INSERT INTO `yii2_region` VALUES ('118', '8', '铜仁', '2', 'TR', '27.731515', '109.189598');
INSERT INTO `yii2_region` VALUES ('119', '8', '遵义', '2', 'ZY', '27.725654', '106.927389');
INSERT INTO `yii2_region` VALUES ('120', '9', '海口', '2', 'HK', '20.030793', '110.328859');
INSERT INTO `yii2_region` VALUES ('121', '9', '三亚', '2', 'SY', '18.252847', '109.511909');
INSERT INTO `yii2_region` VALUES ('122', '9', '白沙', '2', 'BS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('123', '9', '保亭', '2', 'BT',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('124', '9', '昌江', '2', 'CJ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('125', '9', '澄迈县', '2', 'CMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('126', '9', '定安县', '2', 'DAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('127', '9', '东方', '2', 'DF',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('128', '9', '乐东', '2', 'LD',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('129', '9', '临高县', '2', 'LGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('130', '9', '陵水', '2', 'LS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('131', '9', '琼海', '2', 'QH',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('132', '9', '琼中', '2', 'QZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('133', '9', '屯昌县', '2', 'TCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('134', '9', '万宁', '2', 'WN',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('135', '9', '文昌', '2', 'WC',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('136', '9', '五指山', '2', 'WZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('137', '9', '儋州', '2', 'Z',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('138', '10', '石家庄', '2', 'SJZ', '38.042307', '114.51486');
INSERT INTO `yii2_region` VALUES ('139', '10', '保定', '2', 'BD', '38.873891', '115.464806');
INSERT INTO `yii2_region` VALUES ('140', '10', '沧州', '2', 'CZ', '38.304477', '116.838835');
INSERT INTO `yii2_region` VALUES ('141', '10', '承德', '2', 'CD', '40.954071', '117.962411');
INSERT INTO `yii2_region` VALUES ('142', '10', '邯郸', '2', 'HD', '36.625604', '114.539085');
INSERT INTO `yii2_region` VALUES ('143', '10', '衡水', '2', 'HS', '37.735302', '115.69868');
INSERT INTO `yii2_region` VALUES ('144', '10', '廊坊', '2', 'LF', '39.538047', '116.683752');
INSERT INTO `yii2_region` VALUES ('145', '10', '秦皇岛', '2', 'QHD', '39.935377', '119.600492');
INSERT INTO `yii2_region` VALUES ('146', '10', '唐山', '2', 'TS', '39.630476', '118.180407');
INSERT INTO `yii2_region` VALUES ('147', '10', '邢台', '2', 'XT', '37.070589', '114.504844');
INSERT INTO `yii2_region` VALUES ('148', '10', '张家口', '2', 'ZJK', '40.824418', '114.887543');
INSERT INTO `yii2_region` VALUES ('149', '11', '郑州', '2', 'ZZ', '34.7466', '113.625368');
INSERT INTO `yii2_region` VALUES ('150', '11', '洛阳', '2', 'LY', '34.618452', '112.45429');
INSERT INTO `yii2_region` VALUES ('151', '11', '开封', '2', 'KF', '34.797239', '114.307582');
INSERT INTO `yii2_region` VALUES ('152', '11', '安阳', '2', 'AY', '36.097593', '114.392756');
INSERT INTO `yii2_region` VALUES ('153', '11', '鹤壁', '2', 'HB', '35.747225', '114.297273');
INSERT INTO `yii2_region` VALUES ('154', '11', '济源', '2', 'JY',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('155', '11', '焦作', '2', 'JZ', '35.215893', '113.241823');
INSERT INTO `yii2_region` VALUES ('156', '11', '南阳', '2', 'NY', '32.990614', '112.528345');
INSERT INTO `yii2_region` VALUES ('157', '11', '平顶山', '2', 'PDS', '33.76619', '113.192814');
INSERT INTO `yii2_region` VALUES ('158', '11', '三门峡', '2', 'SMX', '34.772424', '111.20023');
INSERT INTO `yii2_region` VALUES ('159', '11', '商丘', '2', 'SQ', '34.414172', '115.65637');
INSERT INTO `yii2_region` VALUES ('160', '11', '新乡', '2', 'XX', '35.303004', '113.9268');
INSERT INTO `yii2_region` VALUES ('161', '11', '信阳', '2', 'XY', '32.147015', '114.091289');
INSERT INTO `yii2_region` VALUES ('162', '11', '许昌', '2', 'XC', '34.035506', '113.85264');
INSERT INTO `yii2_region` VALUES ('163', '11', '周口', '2', 'ZK', '33.618686', '114.657616');
INSERT INTO `yii2_region` VALUES ('164', '11', '驻马店', '2', 'ZMD', '33.011529', '114.022298');
INSERT INTO `yii2_region` VALUES ('165', '11', '漯河', '2', 'H', '33.581413', '114.016539');
INSERT INTO `yii2_region` VALUES ('166', '11', '濮阳', '2', 'Y', '35.762141', '115.02933');
INSERT INTO `yii2_region` VALUES ('167', '12', '哈尔滨', '2', 'HEB', '45.803775', '126.534967');
INSERT INTO `yii2_region` VALUES ('168', '12', '大庆', '2', 'DQ', '46.59019', '125.104637');
INSERT INTO `yii2_region` VALUES ('169', '12', '大兴安岭', '2', 'DXAL', '52.335206', '124.711081');
INSERT INTO `yii2_region` VALUES ('170', '12', '鹤岗', '2', 'HG', '47.349935', '130.298101');
INSERT INTO `yii2_region` VALUES ('171', '12', '黑河', '2', 'HH', '50.245297', '127.52846');
INSERT INTO `yii2_region` VALUES ('172', '12', '鸡西', '2', 'JX', '45.295075', '130.969333');
INSERT INTO `yii2_region` VALUES ('173', '12', '佳木斯', '2', 'JMS', '46.799923', '130.318917');
INSERT INTO `yii2_region` VALUES ('174', '12', '牡丹江', '2', 'MDJ', '44.551653', '129.633169');
INSERT INTO `yii2_region` VALUES ('175', '12', '七台河', '2', 'QTH', '45.771975', '131.004915');
INSERT INTO `yii2_region` VALUES ('176', '12', '齐齐哈尔', '2', 'QQHE', '47.354348', '123.918186');
INSERT INTO `yii2_region` VALUES ('177', '12', '双鸭山', '2', 'SYS', '46.646923', '131.159553');
INSERT INTO `yii2_region` VALUES ('178', '12', '绥化', '2', 'SH', '46.636631', '126.980006');
INSERT INTO `yii2_region` VALUES ('179', '12', '伊春', '2', 'YC', '47.727542', '128.840661');
INSERT INTO `yii2_region` VALUES ('180', '13', '武汉', '2', 'WH', '30.593087', '114.305357');
INSERT INTO `yii2_region` VALUES ('181', '13', '仙桃', '2', 'XT',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('182', '13', '鄂州', '2', 'EZ', '30.39194', '114.894843');
INSERT INTO `yii2_region` VALUES ('183', '13', '黄冈', '2', 'HG', '30.453906', '114.872316');
INSERT INTO `yii2_region` VALUES ('184', '13', '黄石', '2', 'HS', '30.199652', '115.03852');
INSERT INTO `yii2_region` VALUES ('185', '13', '荆门', '2', 'JM', '31.035423', '112.199265');
INSERT INTO `yii2_region` VALUES ('186', '13', '荆州', '2', 'JZ', '30.335165', '112.239741');
INSERT INTO `yii2_region` VALUES ('187', '13', '潜江', '2', 'QJ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('188', '13', '神农架林区', '2', 'SNJLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('189', '13', '十堰', '2', 'SY', '32.629397', '110.797991');
INSERT INTO `yii2_region` VALUES ('190', '13', '随州', '2', 'SZ', '31.690216', '113.382458');
INSERT INTO `yii2_region` VALUES ('191', '13', '天门', '2', 'TM',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('192', '13', '咸宁', '2', 'XN', '29.841443', '114.322492');
INSERT INTO `yii2_region` VALUES ('193', '13', '襄樊', '2', 'XF', '32.012633', '112.155115');
INSERT INTO `yii2_region` VALUES ('194', '13', '孝感', '2', 'XG', '30.924568', '113.916903');
INSERT INTO `yii2_region` VALUES ('195', '13', '宜昌', '2', 'YC', '30.691967', '111.286471');
INSERT INTO `yii2_region` VALUES ('196', '13', '恩施', '2', 'ES', '30.272156', '109.488172');
INSERT INTO `yii2_region` VALUES ('197', '14', '长沙', '2', 'CS', '28.228209', '112.938814');
INSERT INTO `yii2_region` VALUES ('198', '14', '张家界', '2', 'ZJJ', '29.117096', '110.479191');
INSERT INTO `yii2_region` VALUES ('199', '14', '常德', '2', 'CD', '29.031673', '111.698497');
INSERT INTO `yii2_region` VALUES ('200', '14', '郴州', '2', 'CZ', '25.77051', '113.014718');
INSERT INTO `yii2_region` VALUES ('201', '14', '衡阳', '2', 'HY', '26.89384', '112.5719');
INSERT INTO `yii2_region` VALUES ('202', '14', '怀化', '2', 'HH', '27.554978', '109.998488');
INSERT INTO `yii2_region` VALUES ('203', '14', '娄底', '2', 'LD', '27.701693', '111.996001');
INSERT INTO `yii2_region` VALUES ('204', '14', '邵阳', '2', 'SY', '27.238893', '111.467791');
INSERT INTO `yii2_region` VALUES ('205', '14', '湘潭', '2', 'XT', '27.829738', '112.944049');
INSERT INTO `yii2_region` VALUES ('206', '14', '湘西', '2', 'XX', '28.311948', '109.739172');
INSERT INTO `yii2_region` VALUES ('207', '14', '益阳', '2', 'YY', '28.55386', '112.35518');
INSERT INTO `yii2_region` VALUES ('208', '14', '永州', '2', 'YZ', '26.420394', '111.613445');
INSERT INTO `yii2_region` VALUES ('209', '14', '岳阳', '2', 'YY', '29.357104', '113.128958');
INSERT INTO `yii2_region` VALUES ('210', '14', '株洲', '2', 'ZZ', '27.827827', '113.133775');
INSERT INTO `yii2_region` VALUES ('211', '15', '长春', '2', 'CC', '43.817084', '125.323542');
INSERT INTO `yii2_region` VALUES ('212', '15', '吉林', '2', 'JL', '43.896082', '125.326065');
INSERT INTO `yii2_region` VALUES ('213', '15', '白城', '2', 'BC', '45.619641', '122.839024');
INSERT INTO `yii2_region` VALUES ('214', '15', '白山', '2', 'BS', '42.437637', '128.114674');
INSERT INTO `yii2_region` VALUES ('215', '15', '辽源', '2', 'LY', '42.887918', '125.143532');
INSERT INTO `yii2_region` VALUES ('216', '15', '四平', '2', 'SP', '43.16642', '124.350398');
INSERT INTO `yii2_region` VALUES ('217', '15', '松原', '2', 'SY', '45.141789', '124.825118');
INSERT INTO `yii2_region` VALUES ('218', '15', '通化', '2', 'TH', '41.728401', '125.939697');
INSERT INTO `yii2_region` VALUES ('219', '15', '延边', '2', 'YB', '42.891254', '129.508946');
INSERT INTO `yii2_region` VALUES ('220', '16', '南京', '2', 'NJ', '32.060255', '118.796877');
INSERT INTO `yii2_region` VALUES ('221', '16', '苏州', '2', 'SZ', '31.298886', '120.585316');
INSERT INTO `yii2_region` VALUES ('222', '16', '无锡', '2', 'WX', '31.566145', '120.303027');
INSERT INTO `yii2_region` VALUES ('223', '16', '常州', '2', 'CZ', '31.810077', '119.974454');
INSERT INTO `yii2_region` VALUES ('224', '16', '淮安', '2', 'HA', '33.61036', '119.015288');
INSERT INTO `yii2_region` VALUES ('225', '16', '连云港', '2', 'LYG', '34.596544', '119.221282');
INSERT INTO `yii2_region` VALUES ('226', '16', '南通', '2', 'NT', '31.980184', '120.894332');
INSERT INTO `yii2_region` VALUES ('227', '16', '宿迁', '2', 'SQ', '33.961994', '118.275497');
INSERT INTO `yii2_region` VALUES ('228', '16', '泰州', '2', 'TZ', '32.455778', '119.923116');
INSERT INTO `yii2_region` VALUES ('229', '16', '徐州', '2', 'XZ', '34.20475', '117.284067');
INSERT INTO `yii2_region` VALUES ('230', '16', '盐城', '2', 'YC', '33.347378', '120.163561');
INSERT INTO `yii2_region` VALUES ('231', '16', '扬州', '2', 'YZ', '32.39421', '119.412966');
INSERT INTO `yii2_region` VALUES ('232', '16', '镇江', '2', 'ZJ', '32.199147', '119.45722');
INSERT INTO `yii2_region` VALUES ('233', '17', '南昌', '2', 'NC', '28.68316', '115.858089');
INSERT INTO `yii2_region` VALUES ('234', '17', '抚州', '2', 'FZ', '27.9492', '116.358176');
INSERT INTO `yii2_region` VALUES ('235', '17', '赣州', '2', 'GZ', '25.831925', '114.935025');
INSERT INTO `yii2_region` VALUES ('236', '17', '吉安', '2', 'JA', '27.113039', '114.992912');
INSERT INTO `yii2_region` VALUES ('237', '17', '景德镇', '2', 'JDZ', '29.268836', '117.17842');
INSERT INTO `yii2_region` VALUES ('238', '17', '九江', '2', 'JJ', '29.705103', '116.001951');
INSERT INTO `yii2_region` VALUES ('239', '17', '萍乡', '2', 'PX', '27.622865', '113.854676');
INSERT INTO `yii2_region` VALUES ('240', '17', '上饶', '2', 'SR', '28.454863', '117.943433');
INSERT INTO `yii2_region` VALUES ('241', '17', '新余', '2', 'XY', '27.817819', '114.91741');
INSERT INTO `yii2_region` VALUES ('242', '17', '宜春', '2', 'YC', '27.815619', '114.416778');
INSERT INTO `yii2_region` VALUES ('243', '17', '鹰潭', '2', 'YT', '28.260189', '117.069202');
INSERT INTO `yii2_region` VALUES ('244', '18', '沈阳', '2', 'SY', '41.80572', '123.43147');
INSERT INTO `yii2_region` VALUES ('245', '18', '大连', '2', 'DL', '38.914003', '121.614682');
INSERT INTO `yii2_region` VALUES ('246', '18', '鞍山', '2', 'AS', '41.108546', '122.994646');
INSERT INTO `yii2_region` VALUES ('247', '18', '本溪', '2', 'BX', '41.294176', '123.766485');
INSERT INTO `yii2_region` VALUES ('248', '18', '朝阳', '2', 'CY', '41.573734', '120.450372');
INSERT INTO `yii2_region` VALUES ('249', '18', '丹东', '2', 'DD', '40.127344', '124.384913');
INSERT INTO `yii2_region` VALUES ('250', '18', '抚顺', '2', 'FS', '41.880872', '123.957208');
INSERT INTO `yii2_region` VALUES ('251', '18', '阜新', '2', 'FX', '42.021619', '121.670325');
INSERT INTO `yii2_region` VALUES ('252', '18', '葫芦岛', '2', 'HLD', '40.711052', '120.836932');
INSERT INTO `yii2_region` VALUES ('253', '18', '锦州', '2', 'JZ', '41.09512', '121.127004');
INSERT INTO `yii2_region` VALUES ('254', '18', '辽阳', '2', 'LY', '41.269493', '123.172838');
INSERT INTO `yii2_region` VALUES ('255', '18', '盘锦', '2', 'PJ', '41.119997', '122.070714');
INSERT INTO `yii2_region` VALUES ('256', '18', '铁岭', '2', 'TL', '42.22297', '123.726163');
INSERT INTO `yii2_region` VALUES ('257', '18', '营口', '2', 'YK', '40.667012', '122.235418');
INSERT INTO `yii2_region` VALUES ('258', '19', '呼和浩特', '2', 'HHHT', '40.84231', '111.748847');
INSERT INTO `yii2_region` VALUES ('259', '19', '阿拉善盟', '2', 'ALSM', '38.851892', '105.728969');
INSERT INTO `yii2_region` VALUES ('260', '19', '巴彦淖尔盟', '2', 'BYNEM',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('261', '19', '包头', '2', 'BT', '40.657447', '109.840386');
INSERT INTO `yii2_region` VALUES ('262', '19', '赤峰', '2', 'CF', '42.257817', '118.886856');
INSERT INTO `yii2_region` VALUES ('263', '19', '鄂尔多斯', '2', 'EEDS', '39.608266', '109.781327');
INSERT INTO `yii2_region` VALUES ('264', '19', '呼伦贝尔', '2', 'HLBE', '49.211572', '119.765739');
INSERT INTO `yii2_region` VALUES ('265', '19', '通辽', '2', 'TL', '43.61944', '122.265737');
INSERT INTO `yii2_region` VALUES ('266', '19', '乌海', '2', 'WH', '39.655024', '106.794205');
INSERT INTO `yii2_region` VALUES ('267', '19', '乌兰察布市', '2', 'WLCBS', '40.994786', '113.132585');
INSERT INTO `yii2_region` VALUES ('268', '19', '锡林郭勒盟', '2', 'XLGLM', '43.933454', '116.048222');
INSERT INTO `yii2_region` VALUES ('269', '19', '兴安盟', '2', 'XAM', '46.077561', '122.067042');
INSERT INTO `yii2_region` VALUES ('270', '20', '银川', '2', 'YC', '38.487194', '106.230909');
INSERT INTO `yii2_region` VALUES ('271', '20', '固原', '2', 'GY', '36.015855', '106.24261');
INSERT INTO `yii2_region` VALUES ('272', '20', '石嘴山', '2', 'SZS', '38.984346', '106.383047');
INSERT INTO `yii2_region` VALUES ('273', '20', '吴忠', '2', 'WZ', '37.997476', '106.198225');
INSERT INTO `yii2_region` VALUES ('274', '20', '中卫', '2', 'ZW', '37.516892', '105.173837');
INSERT INTO `yii2_region` VALUES ('275', '21', '西宁', '2', 'XN', '36.617144', '101.778228');
INSERT INTO `yii2_region` VALUES ('276', '21', '果洛', '2', 'GL', '34.471675', '100.245027');
INSERT INTO `yii2_region` VALUES ('277', '21', '海北', '2', 'HB', '36.954273', '100.900931');
INSERT INTO `yii2_region` VALUES ('278', '21', '海东', '2', 'HD', '36.502216', '102.104346');
INSERT INTO `yii2_region` VALUES ('279', '21', '海南', '2', 'HN', '20.030793', '110.328859');
INSERT INTO `yii2_region` VALUES ('280', '21', '海西', '2', 'HX', '37.377139', '97.369752');
INSERT INTO `yii2_region` VALUES ('281', '21', '黄南', '2', 'HN', '35.519549', '102.015248');
INSERT INTO `yii2_region` VALUES ('282', '21', '玉树', '2', 'YS', '33.005822', '97.006636');
INSERT INTO `yii2_region` VALUES ('283', '22', '济南', '2', 'JN', '36.665282', '116.994917');
INSERT INTO `yii2_region` VALUES ('284', '22', '青岛', '2', 'QD', '36.06722', '120.382504');
INSERT INTO `yii2_region` VALUES ('285', '22', '滨州', '2', 'BZ', '37.38199', '117.970703');
INSERT INTO `yii2_region` VALUES ('286', '22', '德州', '2', 'DZ', '37.434093', '116.357465');
INSERT INTO `yii2_region` VALUES ('287', '22', '东营', '2', 'DY', '37.434751', '118.674767');
INSERT INTO `yii2_region` VALUES ('288', '22', '菏泽', '2', 'HZ', '35.23375', '115.480656');
INSERT INTO `yii2_region` VALUES ('289', '22', '济宁', '2', 'JN', '35.414921', '116.587099');
INSERT INTO `yii2_region` VALUES ('290', '22', '莱芜', '2', 'LW', '36.213691', '117.676731');
INSERT INTO `yii2_region` VALUES ('291', '22', '聊城', '2', 'LC', '36.456704', '115.985371');
INSERT INTO `yii2_region` VALUES ('292', '22', '临沂', '2', 'LY', '35.104672', '118.356448');
INSERT INTO `yii2_region` VALUES ('293', '22', '日照', '2', 'RZ', '35.416377', '119.526888');
INSERT INTO `yii2_region` VALUES ('294', '22', '泰安', '2', 'TA', '36.200252', '117.087614');
INSERT INTO `yii2_region` VALUES ('295', '22', '威海', '2', 'WH', '37.513068', '122.12042');
INSERT INTO `yii2_region` VALUES ('296', '22', '潍坊', '2', 'WF', '36.706691', '119.16193');
INSERT INTO `yii2_region` VALUES ('297', '22', '烟台', '2', 'YT', '37.463819', '121.447926');
INSERT INTO `yii2_region` VALUES ('298', '22', '枣庄', '2', 'ZZ', '34.810488', '117.323725');
INSERT INTO `yii2_region` VALUES ('299', '22', '淄博', '2', 'ZB', '36.813497', '118.055007');
INSERT INTO `yii2_region` VALUES ('300', '23', '太原', '2', 'TY', '37.870662', '112.550619');
INSERT INTO `yii2_region` VALUES ('301', '23', '长治', '2', 'CZ', '36.195386', '113.116255');
INSERT INTO `yii2_region` VALUES ('302', '23', '大同', '2', 'DT', '40.076816', '113.300126');
INSERT INTO `yii2_region` VALUES ('303', '23', '晋城', '2', 'JC', '35.49087', '112.851768');
INSERT INTO `yii2_region` VALUES ('304', '23', '晋中', '2', 'JZ', '37.687024', '112.752695');
INSERT INTO `yii2_region` VALUES ('305', '23', '临汾', '2', 'LF', '36.088067', '111.51888');
INSERT INTO `yii2_region` VALUES ('306', '23', '吕梁', '2', 'LL', '37.518314', '111.144319');
INSERT INTO `yii2_region` VALUES ('307', '23', '朔州', '2', 'SZ', '39.331595', '112.432825');
INSERT INTO `yii2_region` VALUES ('308', '23', '忻州', '2', 'XZ', '38.416663', '112.734174');
INSERT INTO `yii2_region` VALUES ('309', '23', '阳泉', '2', 'YQ', '37.856658', '113.580415');
INSERT INTO `yii2_region` VALUES ('310', '23', '运城', '2', 'YC', '35.026372', '111.007324');
INSERT INTO `yii2_region` VALUES ('311', '24', '西安', '2', 'XA', '34.264987', '108.944269');
INSERT INTO `yii2_region` VALUES ('312', '24', '安康', '2', 'AK', '32.684781', '109.029303');
INSERT INTO `yii2_region` VALUES ('313', '24', '宝鸡', '2', 'BJ', '34.362053', '107.237539');
INSERT INTO `yii2_region` VALUES ('314', '24', '汉中', '2', 'HZ', '33.06748', '107.023323');
INSERT INTO `yii2_region` VALUES ('315', '24', '商洛', '2', 'SL', '33.870422', '109.940477');
INSERT INTO `yii2_region` VALUES ('316', '24', '铜川', '2', 'TC', '34.896747', '108.945142');
INSERT INTO `yii2_region` VALUES ('317', '24', '渭南', '2', 'WN', '34.499995', '109.509786');
INSERT INTO `yii2_region` VALUES ('318', '24', '咸阳', '2', 'XY', '34.329563', '108.709003');
INSERT INTO `yii2_region` VALUES ('319', '24', '延安', '2', 'YA', '36.585424', '109.489635');
INSERT INTO `yii2_region` VALUES ('320', '24', '榆林', '2', 'YL', '38.285342', '109.734556');
INSERT INTO `yii2_region` VALUES ('321', '25', '上海', '2', 'SH', '31.230393', '121.473704');
INSERT INTO `yii2_region` VALUES ('322', '26', '成都', '2', 'CD', '30.658601', '104.064856');
INSERT INTO `yii2_region` VALUES ('323', '26', '绵阳', '2', 'MY', '31.46745', '104.679114');
INSERT INTO `yii2_region` VALUES ('324', '26', '阿坝', '2', 'AB', '31.899413', '102.224653');
INSERT INTO `yii2_region` VALUES ('325', '26', '巴中', '2', 'BZ', '31.865236', '106.744729');
INSERT INTO `yii2_region` VALUES ('326', '26', '达州', '2', 'DZ', '31.209572', '107.468023');
INSERT INTO `yii2_region` VALUES ('327', '26', '德阳', '2', 'DY', '31.126856', '104.398021');
INSERT INTO `yii2_region` VALUES ('328', '26', '甘孜', '2', 'GZ', '30.04952', '101.962311');
INSERT INTO `yii2_region` VALUES ('329', '26', '广安', '2', 'GA', '30.455962', '106.633212');
INSERT INTO `yii2_region` VALUES ('330', '26', '广元', '2', 'GY', '32.435435', '105.843357');
INSERT INTO `yii2_region` VALUES ('331', '26', '乐山', '2', 'LS', '29.552106', '103.765568');
INSERT INTO `yii2_region` VALUES ('332', '26', '凉山', '2', 'LS', '27.881611', '102.267335');
INSERT INTO `yii2_region` VALUES ('333', '26', '眉山', '2', 'MS', '30.07544', '103.848538');
INSERT INTO `yii2_region` VALUES ('334', '26', '南充', '2', 'NC', '30.837793', '106.110698');
INSERT INTO `yii2_region` VALUES ('335', '26', '内江', '2', 'NJ', '29.580229', '105.058433');
INSERT INTO `yii2_region` VALUES ('336', '26', '攀枝花', '2', 'PZH', '26.582347', '101.718637');
INSERT INTO `yii2_region` VALUES ('337', '26', '遂宁', '2', 'SN', '30.532847', '105.592898');
INSERT INTO `yii2_region` VALUES ('338', '26', '雅安', '2', 'YA', '29.980537', '103.013261');
INSERT INTO `yii2_region` VALUES ('339', '26', '宜宾', '2', 'YB', '28.751812', '104.643382');
INSERT INTO `yii2_region` VALUES ('340', '26', '资阳', '2', 'ZY', '30.128901', '104.627636');
INSERT INTO `yii2_region` VALUES ('341', '26', '自贡', '2', 'ZG', '29.33903', '104.778442');
INSERT INTO `yii2_region` VALUES ('342', '26', '泸州', '2', 'Z', '28.87182', '105.442347');
INSERT INTO `yii2_region` VALUES ('343', '27', '天津', '2', 'TJ', '39.084158', '117.200983');
INSERT INTO `yii2_region` VALUES ('344', '28', '拉萨', '2', 'LS', '29.645554', '91.140856');
INSERT INTO `yii2_region` VALUES ('345', '28', '阿里', '2', 'AL', '32.501034', '80.105652');
INSERT INTO `yii2_region` VALUES ('346', '28', '昌都', '2', 'CD', '31.140969', '97.17202');
INSERT INTO `yii2_region` VALUES ('347', '28', '林芝', '2', 'LZ', '29.649128', '94.36149');
INSERT INTO `yii2_region` VALUES ('348', '28', '那曲', '2', 'NQ', '31.476198', '92.051241');
INSERT INTO `yii2_region` VALUES ('349', '28', '日喀则', '2', 'RKZ', '29.26687', '88.880583');
INSERT INTO `yii2_region` VALUES ('350', '28', '山南', '2', 'SN', '29.237137', '91.773134');
INSERT INTO `yii2_region` VALUES ('351', '29', '乌鲁木齐', '2', 'WLMQ', '43.825645', '87.616823');
INSERT INTO `yii2_region` VALUES ('352', '29', '阿克苏', '2', 'AKS', '41.168779', '80.260605');
INSERT INTO `yii2_region` VALUES ('353', '29', '阿拉尔', '2', 'ALE',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('354', '29', '巴音郭楞', '2', 'BYGL', '41.764131', '86.145267');
INSERT INTO `yii2_region` VALUES ('355', '29', '博尔塔拉', '2', 'BETL', '44.905588', '82.066159');
INSERT INTO `yii2_region` VALUES ('356', '29', '昌吉', '2', 'CJ', '44.011183', '87.308225');
INSERT INTO `yii2_region` VALUES ('357', '29', '哈密', '2', 'HM', '42.818501', '93.514917');
INSERT INTO `yii2_region` VALUES ('358', '29', '和田', '2', 'HT', '37.114157', '79.922211');
INSERT INTO `yii2_region` VALUES ('359', '29', '喀什', '2', 'KS', '39.4704', '75.989755');
INSERT INTO `yii2_region` VALUES ('360', '29', '克拉玛依', '2', 'KLMY', '45.579889', '84.889207');
INSERT INTO `yii2_region` VALUES ('361', '29', '克孜勒苏', '2', 'KZLS', '39.714556', '76.167644');
INSERT INTO `yii2_region` VALUES ('362', '29', '石河子', '2', 'SHZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('363', '29', '图木舒克', '2', 'TMSK',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('364', '29', '吐鲁番', '2', 'TLF', '42.951384', '89.189655');
INSERT INTO `yii2_region` VALUES ('365', '29', '五家渠', '2', 'WJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('366', '29', '伊犁', '2', 'YL', '43.916862', '81.324096');
INSERT INTO `yii2_region` VALUES ('367', '30', '昆明', '2', 'KM', '25.037721', '102.722202');
INSERT INTO `yii2_region` VALUES ('368', '30', '怒江', '2', 'NJ', '25.852548', '98.853097');
INSERT INTO `yii2_region` VALUES ('369', '30', '普洱', '2', 'PE', '22.777765', '100.970152');
INSERT INTO `yii2_region` VALUES ('370', '30', '丽江', '2', 'LJ', '26.876774', '100.230376');
INSERT INTO `yii2_region` VALUES ('371', '30', '保山', '2', 'BS', '25.112065', '99.161471');
INSERT INTO `yii2_region` VALUES ('372', '30', '楚雄', '2', 'CX', '25.045532', '101.528069');
INSERT INTO `yii2_region` VALUES ('373', '30', '大理', '2', 'DL', '25.606486', '100.267638');
INSERT INTO `yii2_region` VALUES ('374', '30', '德宏', '2', 'DH', '24.433353', '98.584895');
INSERT INTO `yii2_region` VALUES ('375', '30', '迪庆', '2', 'DQ', '27.818882', '99.702234');
INSERT INTO `yii2_region` VALUES ('376', '30', '红河', '2', 'HH', '23.36313', '103.374799');
INSERT INTO `yii2_region` VALUES ('377', '30', '临沧', '2', 'LC', '23.877573', '100.079583');
INSERT INTO `yii2_region` VALUES ('378', '30', '曲靖', '2', 'QJ', '25.49001', '103.796167');
INSERT INTO `yii2_region` VALUES ('379', '30', '文山', '2', 'WS', '23.368817', '104.251045');
INSERT INTO `yii2_region` VALUES ('380', '30', '西双版纳', '2', 'XSBN', '22.008193', '100.797353');
INSERT INTO `yii2_region` VALUES ('381', '30', '玉溪', '2', 'YX', '24.352036', '102.546543');
INSERT INTO `yii2_region` VALUES ('382', '30', '昭通', '2', 'ZT', '27.338257', '103.717465');
INSERT INTO `yii2_region` VALUES ('383', '31', '杭州', '2', 'HZ', '30.274089', '120.155069');
INSERT INTO `yii2_region` VALUES ('384', '31', '湖州', '2', 'HZ', '30.894348', '120.086823');
INSERT INTO `yii2_region` VALUES ('385', '31', '嘉兴', '2', 'JX', '30.753924', '120.758543');
INSERT INTO `yii2_region` VALUES ('386', '31', '金华', '2', 'JH', '29.079059', '119.647445');
INSERT INTO `yii2_region` VALUES ('387', '31', '丽水', '2', 'LS', '28.46763', '119.922796');
INSERT INTO `yii2_region` VALUES ('388', '31', '宁波', '2', 'NB', '29.868336', '121.54399');
INSERT INTO `yii2_region` VALUES ('389', '31', '绍兴', '2', 'SX', '29.995762', '120.586109');
INSERT INTO `yii2_region` VALUES ('390', '31', '台州', '2', 'TZ', '28.656386', '121.420757');
INSERT INTO `yii2_region` VALUES ('391', '31', '温州', '2', 'WZ', '27.994267', '120.699367');
INSERT INTO `yii2_region` VALUES ('392', '31', '舟山', '2', 'ZS', '29.985451', '122.206604');
INSERT INTO `yii2_region` VALUES ('393', '31', '衢州', '2', 'Z', '28.93581', '118.874375');
INSERT INTO `yii2_region` VALUES ('394', '32', '重庆', '2', 'ZQ', '29.56301', '106.551557');
INSERT INTO `yii2_region` VALUES ('395', '33', '香港', '2', 'XG', '22.396428', '114.109497');
INSERT INTO `yii2_region` VALUES ('396', '34', '澳门', '2', 'AM', '22.198745', '113.543873');
INSERT INTO `yii2_region` VALUES ('397', '35', '台湾', '2', 'TW', '23.69781', '120.960515');
INSERT INTO `yii2_region` VALUES ('398', '36', '迎江区', '3', 'YJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('399', '36', '大观区', '3', 'DGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('400', '36', '宜秀区', '3', 'YXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('401', '36', '桐城市', '3', 'TCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('402', '36', '怀宁县', '3', 'HNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('403', '36', '枞阳县', '3', 'YX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('404', '36', '潜山县', '3', 'QSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('405', '36', '太湖县', '3', 'THX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('406', '36', '宿松县', '3', 'SSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('407', '36', '望江县', '3', 'WJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('408', '36', '岳西县', '3', 'YXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('409', '37', '中市区', '3', 'ZSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('410', '37', '东市区', '3', 'DSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('411', '37', '西市区', '3', 'XSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('412', '37', '郊区', '3', 'JQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('413', '37', '怀远县', '3', 'HYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('414', '37', '五河县', '3', 'WHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('415', '37', '固镇县', '3', 'GZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('416', '38', '居巢区', '3', 'JCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('417', '38', '庐江县', '3', 'LJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('418', '38', '无为县', '3', 'WWX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('419', '38', '含山县', '3', 'HSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('420', '38', '和县', '3', 'HX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('421', '39', '贵池区', '3', 'GCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('422', '39', '东至县', '3', 'DZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('423', '39', '石台县', '3', 'STX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('424', '39', '青阳县', '3', 'QYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('425', '40', '琅琊区', '3', 'LQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('426', '40', '南谯区', '3', 'NQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('427', '40', '天长市', '3', 'TCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('428', '40', '明光市', '3', 'MGS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('429', '40', '来安县', '3', 'LAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('430', '40', '全椒县', '3', 'QJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('431', '40', '定远县', '3', 'DYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('432', '40', '凤阳县', '3', 'FYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('433', '41', '蚌山区', '3', 'BSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('434', '41', '龙子湖区', '3', 'LZHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('435', '41', '禹会区', '3', 'YHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('436', '41', '淮上区', '3', 'HSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('437', '41', '颍州区', '3', 'ZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('438', '41', '颍东区', '3', 'DQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('439', '41', '颍泉区', '3', 'QQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('440', '41', '界首市', '3', 'JSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('441', '41', '临泉县', '3', 'LQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('442', '41', '太和县', '3', 'THX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('443', '41', '阜南县', '3', 'FNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('444', '41', '颖上县', '3', 'YSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('445', '42', '相山区', '3', 'XSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('446', '42', '杜集区', '3', 'DJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('447', '42', '烈山区', '3', 'LSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('448', '42', '濉溪县', '3', 'XX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('449', '43', '田家庵区', '3', 'TJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('450', '43', '大通区', '3', 'DTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('451', '43', '谢家集区', '3', 'XJJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('452', '43', '八公山区', '3', 'BGSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('453', '43', '潘集区', '3', 'PJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('454', '43', '凤台县', '3', 'FTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('455', '44', '屯溪区', '3', 'TXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('456', '44', '黄山区', '3', 'HSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('457', '44', '徽州区', '3', 'HZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('458', '44', '歙县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('459', '44', '休宁县', '3', 'XNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('460', '44', '黟县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('461', '44', '祁门县', '3', 'QMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('462', '45', '金安区', '3', 'JAQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('463', '45', '裕安区', '3', 'YAQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('464', '45', '寿县', '3', 'SX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('465', '45', '霍邱县', '3', 'HQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('466', '45', '舒城县', '3', 'SCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('467', '45', '金寨县', '3', 'JZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('468', '45', '霍山县', '3', 'HSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('469', '46', '雨山区', '3', 'YSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('470', '46', '花山区', '3', 'HSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('471', '46', '金家庄区', '3', 'JJZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('472', '46', '当涂县', '3', 'DTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('473', '47', '埇桥区', '3', 'QQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('474', '47', '砀山县', '3', 'SX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('475', '47', '萧县', '3', 'XX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('476', '47', '灵璧县', '3', 'LX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('477', '47', '泗县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('478', '48', '铜官山区', '3', 'TGSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('479', '48', '狮子山区', '3', 'SZSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('480', '48', '郊区', '3', 'JQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('481', '48', '铜陵县', '3', 'TLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('482', '49', '镜湖区', '3', 'JHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('483', '49', '弋江区', '3', 'JQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('484', '49', '鸠江区', '3', 'JQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('485', '49', '三山区', '3', 'SSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('486', '49', '芜湖县', '3', 'WHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('487', '49', '繁昌县', '3', 'FCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('488', '49', '南陵县', '3', 'NLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('489', '50', '宣州区', '3', 'XZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('490', '50', '宁国市', '3', 'NGS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('491', '50', '郎溪县', '3', 'LXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('492', '50', '广德县', '3', 'GDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('493', '50', '泾县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('494', '50', '绩溪县', '3', 'JXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('495', '50', '旌德县', '3', 'DX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('496', '51', '涡阳县', '3', 'WYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('497', '51', '蒙城县', '3', 'MCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('498', '51', '利辛县', '3', 'LXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('499', '51', '谯城区', '3', 'CQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('500', '52', '东城区', '3', 'DCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('501', '52', '西城区', '3', 'XCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('502', '52', '海淀区', '3', 'HDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('503', '52', '朝阳区', '3', 'CYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('504', '52', '崇文区', '3', 'CWQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('505', '52', '宣武区', '3', 'XWQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('506', '52', '丰台区', '3', 'FTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('507', '52', '石景山区', '3', 'SJSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('508', '52', '房山区', '3', 'FSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('509', '52', '门头沟区', '3', 'MTGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('510', '52', '通州区', '3', 'TZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('511', '52', '顺义区', '3', 'SYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('512', '52', '昌平区', '3', 'CPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('513', '52', '怀柔区', '3', 'HRQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('514', '52', '平谷区', '3', 'PGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('515', '52', '大兴区', '3', 'DXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('516', '52', '密云县', '3', 'MYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('517', '52', '延庆县', '3', 'YQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('518', '53', '鼓楼区', '3', 'GLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('519', '53', '台江区', '3', 'TJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('520', '53', '仓山区', '3', 'CSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('521', '53', '马尾区', '3', 'MWQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('522', '53', '晋安区', '3', 'JAQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('523', '53', '福清市', '3', 'FQS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('524', '53', '长乐市', '3', 'CLS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('525', '53', '闽侯县', '3', 'MHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('526', '53', '连江县', '3', 'LJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('527', '53', '罗源县', '3', 'LYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('528', '53', '闽清县', '3', 'MQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('529', '53', '永泰县', '3', 'YTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('530', '53', '平潭县', '3', 'PTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('531', '54', '新罗区', '3', 'XLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('532', '54', '漳平市', '3', 'ZPS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('533', '54', '长汀县', '3', 'CTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('534', '54', '永定县', '3', 'YDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('535', '54', '上杭县', '3', 'SHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('536', '54', '武平县', '3', 'WPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('537', '54', '连城县', '3', 'LCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('538', '55', '延平区', '3', 'YPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('539', '55', '邵武市', '3', 'SWS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('540', '55', '武夷山市', '3', 'WYSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('541', '55', '建瓯市', '3', 'JS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('542', '55', '建阳市', '3', 'JYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('543', '55', '顺昌县', '3', 'SCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('544', '55', '浦城县', '3', 'PCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('545', '55', '光泽县', '3', 'GZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('546', '55', '松溪县', '3', 'SXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('547', '55', '政和县', '3', 'ZHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('548', '56', '蕉城区', '3', 'JCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('549', '56', '福安市', '3', 'FAS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('550', '56', '福鼎市', '3', 'FDS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('551', '56', '霞浦县', '3', 'XPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('552', '56', '古田县', '3', 'GTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('553', '56', '屏南县', '3', 'PNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('554', '56', '寿宁县', '3', 'SNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('555', '56', '周宁县', '3', 'ZNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('556', '56', '柘荣县', '3', 'RX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('557', '57', '城厢区', '3', 'CXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('558', '57', '涵江区', '3', 'HJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('559', '57', '荔城区', '3', 'LCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('560', '57', '秀屿区', '3', 'XYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('561', '57', '仙游县', '3', 'XYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('562', '58', '鲤城区', '3', 'LCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('563', '58', '丰泽区', '3', 'FZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('564', '58', '洛江区', '3', 'LJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('565', '58', '清濛开发区', '3', 'QKFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('566', '58', '泉港区', '3', 'QGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('567', '58', '石狮市', '3', 'SSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('568', '58', '晋江市', '3', 'JJS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('569', '58', '南安市', '3', 'NAS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('570', '58', '惠安县', '3', 'HAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('571', '58', '安溪县', '3', 'AXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('572', '58', '永春县', '3', 'YCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('573', '58', '德化县', '3', 'DHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('574', '58', '金门县', '3', 'JMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('575', '59', '梅列区', '3', 'MLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('576', '59', '三元区', '3', 'SYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('577', '59', '永安市', '3', 'YAS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('578', '59', '明溪县', '3', 'MXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('579', '59', '清流县', '3', 'QLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('580', '59', '宁化县', '3', 'NHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('581', '59', '大田县', '3', 'DTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('582', '59', '尤溪县', '3', 'YXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('583', '59', '沙县', '3', 'SX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('584', '59', '将乐县', '3', 'JLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('585', '59', '泰宁县', '3', 'TNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('586', '59', '建宁县', '3', 'JNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('587', '60', '思明区', '3', 'SMQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('588', '60', '海沧区', '3', 'HCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('589', '60', '湖里区', '3', 'HLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('590', '60', '集美区', '3', 'JMQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('591', '60', '同安区', '3', 'TAQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('592', '60', '翔安区', '3', 'XAQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('593', '61', '芗城区', '3', 'CQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('594', '61', '龙文区', '3', 'LWQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('595', '61', '龙海市', '3', 'LHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('596', '61', '云霄县', '3', 'YXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('597', '61', '漳浦县', '3', 'ZPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('598', '61', '诏安县', '3', 'AX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('599', '61', '长泰县', '3', 'CTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('600', '61', '东山县', '3', 'DSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('601', '61', '南靖县', '3', 'NJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('602', '61', '平和县', '3', 'PHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('603', '61', '华安县', '3', 'HAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('604', '62', '皋兰县', '3', 'GLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('605', '62', '城关区', '3', 'CGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('606', '62', '七里河区', '3', 'QLHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('607', '62', '西固区', '3', 'XGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('608', '62', '安宁区', '3', 'ANQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('609', '62', '红古区', '3', 'HGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('610', '62', '永登县', '3', 'YDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('611', '62', '榆中县', '3', 'YZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('612', '63', '白银区', '3', 'BYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('613', '63', '平川区', '3', 'PCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('614', '63', '会宁县', '3', 'HNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('615', '63', '景泰县', '3', 'JTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('616', '63', '靖远县', '3', 'JYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('617', '64', '临洮县', '3', 'LX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('618', '64', '陇西县', '3', 'LXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('619', '64', '通渭县', '3', 'TWX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('620', '64', '渭源县', '3', 'WYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('621', '64', '漳县', '3', 'ZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('622', '64', '岷县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('623', '64', '安定区', '3', 'ADQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('624', '64', '安定区', '3', 'ADQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('625', '65', '合作市', '3', 'HZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('626', '65', '临潭县', '3', 'LTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('627', '65', '卓尼县', '3', 'ZNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('628', '65', '舟曲县', '3', 'ZQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('629', '65', '迭部县', '3', 'DBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('630', '65', '玛曲县', '3', 'MQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('631', '65', '碌曲县', '3', 'LQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('632', '65', '夏河县', '3', 'XHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('633', '66', '嘉峪关市', '3', 'JYGS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('634', '67', '金川区', '3', 'JCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('635', '67', '永昌县', '3', 'YCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('636', '68', '肃州区', '3', 'SZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('637', '68', '玉门市', '3', 'YMS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('638', '68', '敦煌市', '3', 'DHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('639', '68', '金塔县', '3', 'JTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('640', '68', '瓜州县', '3', 'GZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('641', '68', '肃北', '3', 'SB',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('642', '68', '阿克塞', '3', 'AKS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('643', '69', '临夏市', '3', 'LXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('644', '69', '临夏县', '3', 'LXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('645', '69', '康乐县', '3', 'KLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('646', '69', '永靖县', '3', 'YJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('647', '69', '广河县', '3', 'GHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('648', '69', '和政县', '3', 'HZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('649', '69', '东乡族自治县', '3', 'DXZZZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('650', '69', '积石山', '3', 'JSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('651', '70', '成县', '3', 'CX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('652', '70', '徽县', '3', 'HX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('653', '70', '康县', '3', 'KX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('654', '70', '礼县', '3', 'LX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('655', '70', '两当县', '3', 'LDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('656', '70', '文县', '3', 'WX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('657', '70', '西和县', '3', 'XHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('658', '70', '宕昌县', '3', 'CX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('659', '70', '武都区', '3', 'WDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('660', '71', '崇信县', '3', 'CXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('661', '71', '华亭县', '3', 'HTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('662', '71', '静宁县', '3', 'JNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('663', '71', '灵台县', '3', 'LTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('664', '71', '崆峒区', '3', 'Q',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('665', '71', '庄浪县', '3', 'ZLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('666', '71', '泾川县', '3', 'CX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('667', '72', '合水县', '3', 'HSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('668', '72', '华池县', '3', 'HCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('669', '72', '环县', '3', 'HX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('670', '72', '宁县', '3', 'NX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('671', '72', '庆城县', '3', 'QCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('672', '72', '西峰区', '3', 'XFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('673', '72', '镇原县', '3', 'ZYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('674', '72', '正宁县', '3', 'ZNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('675', '73', '甘谷县', '3', 'GGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('676', '73', '秦安县', '3', 'QAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('677', '73', '清水县', '3', 'QSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('678', '73', '秦州区', '3', 'QZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('679', '73', '麦积区', '3', 'MJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('680', '73', '武山县', '3', 'WSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('681', '73', '张家川', '3', 'ZJC',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('682', '74', '古浪县', '3', 'GLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('683', '74', '民勤县', '3', 'MQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('684', '74', '天祝', '3', 'TZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('685', '74', '凉州区', '3', 'LZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('686', '75', '高台县', '3', 'GTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('687', '75', '临泽县', '3', 'LZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('688', '75', '民乐县', '3', 'MLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('689', '75', '山丹县', '3', 'SDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('690', '75', '肃南', '3', 'SN',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('691', '75', '甘州区', '3', 'GZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('692', '76', '从化市', '3', 'CHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('693', '76', '天河区', '3', 'THQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('694', '76', '东山区', '3', 'DSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('695', '76', '白云区', '3', 'BYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('696', '76', '海珠区', '3', 'HZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('697', '76', '荔湾区', '3', 'LWQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('698', '76', '越秀区', '3', 'YXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('699', '76', '黄埔区', '3', 'HPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('700', '76', '番禺区', '3', 'FQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('701', '76', '花都区', '3', 'HDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('702', '76', '增城区', '3', 'ZCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('703', '76', '从化区', '3', 'CHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('704', '76', '市郊', '3', 'SJ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('705', '77', '福田区', '3', 'FTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('706', '77', '罗湖区', '3', 'LHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('707', '77', '南山区', '3', 'NSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('708', '77', '宝安区', '3', 'BAQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('709', '77', '龙岗区', '3', 'LGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('710', '77', '盐田区', '3', 'YTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('711', '78', '湘桥区', '3', 'XQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('712', '78', '潮安县', '3', 'CAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('713', '78', '饶平县', '3', 'RPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('714', '79', '南城区', '3', 'NCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('715', '79', '东城区', '3', 'DCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('716', '79', '万江区', '3', 'WJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('717', '79', '莞城区', '3', 'CQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('718', '79', '石龙镇', '3', 'SLZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('719', '79', '虎门镇', '3', 'HMZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('720', '79', '麻涌镇', '3', 'MYZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('721', '79', '道滘镇', '3', 'DZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('722', '79', '石碣镇', '3', 'SZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('723', '79', '沙田镇', '3', 'STZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('724', '79', '望牛墩镇', '3', 'WNDZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('725', '79', '洪梅镇', '3', 'HMZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('726', '79', '茶山镇', '3', 'CSZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('727', '79', '寮步镇', '3', 'BZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('728', '79', '大岭山镇', '3', 'DLSZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('729', '79', '大朗镇', '3', 'DLZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('730', '79', '黄江镇', '3', 'HJZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('731', '79', '樟木头', '3', 'ZMT',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('732', '79', '凤岗镇', '3', 'FGZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('733', '79', '塘厦镇', '3', 'TXZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('734', '79', '谢岗镇', '3', 'XGZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('735', '79', '厚街镇', '3', 'HJZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('736', '79', '清溪镇', '3', 'QXZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('737', '79', '常平镇', '3', 'CPZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('738', '79', '桥头镇', '3', 'QTZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('739', '79', '横沥镇', '3', 'HLZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('740', '79', '东坑镇', '3', 'DKZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('741', '79', '企石镇', '3', 'QSZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('742', '79', '石排镇', '3', 'SPZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('743', '79', '长安镇', '3', 'CAZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('744', '79', '中堂镇', '3', 'ZTZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('745', '79', '高埗镇', '3', 'GZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('746', '80', '禅城区', '3', 'CQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('747', '80', '南海区', '3', 'NHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('748', '80', '顺德区', '3', 'SDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('749', '80', '三水区', '3', 'SSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('750', '80', '高明区', '3', 'GMQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('751', '81', '东源县', '3', 'DYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('752', '81', '和平县', '3', 'HPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('753', '81', '源城区', '3', 'YCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('754', '81', '连平县', '3', 'LPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('755', '81', '龙川县', '3', 'LCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('756', '81', '紫金县', '3', 'ZJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('757', '82', '惠阳区', '3', 'HYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('758', '82', '惠城区', '3', 'HCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('759', '82', '大亚湾', '3', 'DYW',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('760', '82', '博罗县', '3', 'BLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('761', '82', '惠东县', '3', 'HDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('762', '82', '龙门县', '3', 'LMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('763', '83', '江海区', '3', 'JHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('764', '83', '蓬江区', '3', 'PJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('765', '83', '新会区', '3', 'XHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('766', '83', '台山市', '3', 'TSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('767', '83', '开平市', '3', 'KPS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('768', '83', '鹤山市', '3', 'HSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('769', '83', '恩平市', '3', 'EPS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('770', '84', '榕城区', '3', 'CQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('771', '84', '普宁市', '3', 'PNS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('772', '84', '揭东县', '3', 'JDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('773', '84', '揭西县', '3', 'JXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('774', '84', '惠来县', '3', 'HLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('775', '85', '茂南区', '3', 'MNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('776', '85', '茂港区', '3', 'MGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('777', '85', '高州市', '3', 'GZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('778', '85', '化州市', '3', 'HZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('779', '85', '信宜市', '3', 'XYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('780', '85', '电白县', '3', 'DBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('781', '86', '梅县', '3', 'MX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('782', '86', '梅江区', '3', 'MJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('783', '86', '兴宁市', '3', 'XNS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('784', '86', '大埔县', '3', 'DPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('785', '86', '丰顺县', '3', 'FSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('786', '86', '五华县', '3', 'WHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('787', '86', '平远县', '3', 'PYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('788', '86', '蕉岭县', '3', 'JLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('789', '87', '清城区', '3', 'QCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('790', '87', '英德市', '3', 'YDS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('791', '87', '连州市', '3', 'LZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('792', '87', '佛冈县', '3', 'FGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('793', '87', '阳山县', '3', 'YSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('794', '87', '清新县', '3', 'QXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('795', '87', '连山', '3', 'LS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('796', '87', '连南', '3', 'LN',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('797', '88', '南澳县', '3', 'NAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('798', '88', '潮阳区', '3', 'CYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('799', '88', '澄海区', '3', 'CHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('800', '88', '龙湖区', '3', 'LHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('801', '88', '金平区', '3', 'JPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('802', '88', '濠江区', '3', 'JQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('803', '88', '潮南区', '3', 'CNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('804', '89', '城区', '3', 'CQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('805', '89', '陆丰市', '3', 'LFS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('806', '89', '海丰县', '3', 'HFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('807', '89', '陆河县', '3', 'LHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('808', '90', '曲江县', '3', 'QJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('809', '90', '浈江区', '3', 'JQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('810', '90', '武江区', '3', 'WJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('811', '90', '曲江区', '3', 'QJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('812', '90', '乐昌市', '3', 'LCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('813', '90', '南雄市', '3', 'NXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('814', '90', '始兴县', '3', 'SXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('815', '90', '仁化县', '3', 'RHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('816', '90', '翁源县', '3', 'WYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('817', '90', '新丰县', '3', 'XFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('818', '90', '乳源', '3', 'RY',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('819', '91', '江城区', '3', 'JCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('820', '91', '阳春市', '3', 'YCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('821', '91', '阳西县', '3', 'YXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('822', '91', '阳东县', '3', 'YDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('823', '92', '云城区', '3', 'YCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('824', '92', '罗定市', '3', 'LDS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('825', '92', '新兴县', '3', 'XXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('826', '92', '郁南县', '3', 'YNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('827', '92', '云安县', '3', 'YAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('828', '93', '赤坎区', '3', 'CKQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('829', '93', '霞山区', '3', 'XSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('830', '93', '坡头区', '3', 'PTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('831', '93', '麻章区', '3', 'MZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('832', '93', '廉江市', '3', 'LJS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('833', '93', '雷州市', '3', 'LZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('834', '93', '吴川市', '3', 'WCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('835', '93', '遂溪县', '3', 'SXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('836', '93', '徐闻县', '3', 'XWX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('837', '94', '肇庆市', '3', 'ZQS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('838', '94', '高要市', '3', 'GYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('839', '94', '四会市', '3', 'SHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('840', '94', '广宁县', '3', 'GNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('841', '94', '怀集县', '3', 'HJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('842', '94', '封开县', '3', 'FKX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('843', '94', '德庆县', '3', 'DQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('844', '95', '石岐街道', '3', 'SJD',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('845', '95', '东区街道', '3', 'DQJD',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('846', '95', '西区街道', '3', 'XQJD',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('847', '95', '环城街道', '3', 'HCJD',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('848', '95', '中山港街道', '3', 'ZSGJD',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('849', '95', '五桂山街道', '3', 'WGSJD',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('850', '96', '香洲区', '3', 'XZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('851', '96', '斗门区', '3', 'DMQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('852', '96', '金湾区', '3', 'JWQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('853', '97', '邕宁区', '3', 'NQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('854', '97', '青秀区', '3', 'QXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('855', '97', '兴宁区', '3', 'XNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('856', '97', '良庆区', '3', 'LQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('857', '97', '西乡塘区', '3', 'XXTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('858', '97', '江南区', '3', 'JNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('859', '97', '武鸣县', '3', 'WMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('860', '97', '隆安县', '3', 'LAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('861', '97', '马山县', '3', 'MSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('862', '97', '上林县', '3', 'SLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('863', '97', '宾阳县', '3', 'BYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('864', '97', '横县', '3', 'HX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('865', '98', '秀峰区', '3', 'XFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('866', '98', '叠彩区', '3', 'DCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('867', '98', '象山区', '3', 'XSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('868', '98', '七星区', '3', 'QXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('869', '98', '雁山区', '3', 'YSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('870', '98', '阳朔县', '3', 'YSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('871', '98', '临桂县', '3', 'LGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('872', '98', '灵川县', '3', 'LCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('873', '98', '全州县', '3', 'QZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('874', '98', '平乐县', '3', 'PLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('875', '98', '兴安县', '3', 'XAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('876', '98', '灌阳县', '3', 'GYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('877', '98', '荔浦县', '3', 'LPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('878', '98', '资源县', '3', 'ZYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('879', '98', '永福县', '3', 'YFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('880', '98', '龙胜', '3', 'LS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('881', '98', '恭城', '3', 'GC',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('882', '99', '右江区', '3', 'YJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('883', '99', '凌云县', '3', 'LYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('884', '99', '平果县', '3', 'PGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('885', '99', '西林县', '3', 'XLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('886', '99', '乐业县', '3', 'LYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('887', '99', '德保县', '3', 'DBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('888', '99', '田林县', '3', 'TLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('889', '99', '田阳县', '3', 'TYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('890', '99', '靖西县', '3', 'JXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('891', '99', '田东县', '3', 'TDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('892', '99', '那坡县', '3', 'NPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('893', '99', '隆林', '3', 'LL',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('894', '100', '海城区', '3', 'HCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('895', '100', '银海区', '3', 'YHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('896', '100', '铁山港区', '3', 'TSGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('897', '100', '合浦县', '3', 'HPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('898', '101', '江州区', '3', 'JZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('899', '101', '凭祥市', '3', 'PXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('900', '101', '宁明县', '3', 'NMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('901', '101', '扶绥县', '3', 'FSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('902', '101', '龙州县', '3', 'LZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('903', '101', '大新县', '3', 'DXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('904', '101', '天等县', '3', 'TDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('905', '102', '港口区', '3', 'GKQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('906', '102', '防城区', '3', 'FCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('907', '102', '东兴市', '3', 'DXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('908', '102', '上思县', '3', 'SSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('909', '103', '港北区', '3', 'GBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('910', '103', '港南区', '3', 'GNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('911', '103', '覃塘区', '3', 'TQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('912', '103', '桂平市', '3', 'GPS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('913', '103', '平南县', '3', 'PNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('914', '104', '金城江区', '3', 'JCJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('915', '104', '宜州市', '3', 'YZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('916', '104', '天峨县', '3', 'TEX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('917', '104', '凤山县', '3', 'FSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('918', '104', '南丹县', '3', 'NDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('919', '104', '东兰县', '3', 'DLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('920', '104', '都安', '3', 'DA',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('921', '104', '罗城', '3', 'LC',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('922', '104', '巴马', '3', 'BM',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('923', '104', '环江', '3', 'HJ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('924', '104', '大化', '3', 'DH',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('925', '105', '八步区', '3', 'BBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('926', '105', '钟山县', '3', 'ZSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('927', '105', '昭平县', '3', 'ZPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('928', '105', '富川', '3', 'FC',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('929', '106', '兴宾区', '3', 'XBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('930', '106', '合山市', '3', 'HSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('931', '106', '象州县', '3', 'XZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('932', '106', '武宣县', '3', 'WXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('933', '106', '忻城县', '3', 'XCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('934', '106', '金秀', '3', 'JX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('935', '107', '城中区', '3', 'CZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('936', '107', '鱼峰区', '3', 'YFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('937', '107', '柳北区', '3', 'LBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('938', '107', '柳南区', '3', 'LNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('939', '107', '柳江县', '3', 'LJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('940', '107', '柳城县', '3', 'LCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('941', '107', '鹿寨县', '3', 'LZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('942', '107', '融安县', '3', 'RAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('943', '107', '融水', '3', 'RS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('944', '107', '三江', '3', 'SJ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('945', '108', '钦南区', '3', 'QNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('946', '108', '钦北区', '3', 'QBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('947', '108', '灵山县', '3', 'LSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('948', '108', '浦北县', '3', 'PBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('949', '109', '万秀区', '3', 'WXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('950', '109', '蝶山区', '3', 'DSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('951', '109', '长洲区', '3', 'CZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('952', '109', '岑溪市', '3', 'XS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('953', '109', '苍梧县', '3', 'CWX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('954', '109', '藤县', '3', 'TX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('955', '109', '蒙山县', '3', 'MSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('956', '110', '玉州区', '3', 'YZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('957', '110', '北流市', '3', 'BLS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('958', '110', '容县', '3', 'RX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('959', '110', '陆川县', '3', 'LCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('960', '110', '博白县', '3', 'BBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('961', '110', '兴业县', '3', 'XYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('962', '111', '南明区', '3', 'NMQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('963', '111', '云岩区', '3', 'YYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('964', '111', '花溪区', '3', 'HXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('965', '111', '乌当区', '3', 'WDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('966', '111', '白云区', '3', 'BYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('967', '111', '小河区', '3', 'XHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('968', '111', '金阳新区', '3', 'JYXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('969', '111', '新天园区', '3', 'XTYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('970', '111', '清镇市', '3', 'QZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('971', '111', '开阳县', '3', 'KYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('972', '111', '修文县', '3', 'XWX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('973', '111', '息烽县', '3', 'XFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('974', '112', '西秀区', '3', 'XXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('975', '112', '关岭', '3', 'GL',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('976', '112', '镇宁', '3', 'ZN',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('977', '112', '紫云', '3', 'ZY',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('978', '112', '平坝县', '3', 'PBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('979', '112', '普定县', '3', 'PDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('980', '113', '毕节市', '3', 'BJS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('981', '113', '大方县', '3', 'DFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('982', '113', '黔西县', '3', 'QXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('983', '113', '金沙县', '3', 'JSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('984', '113', '织金县', '3', 'ZJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('985', '113', '纳雍县', '3', 'NYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('986', '113', '赫章县', '3', 'HZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('987', '113', '威宁', '3', 'WN',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('988', '114', '钟山区', '3', 'ZSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('989', '114', '六枝特区', '3', 'LZTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('990', '114', '水城县', '3', 'SCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('991', '114', '盘县', '3', 'PX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('992', '115', '凯里市', '3', 'KLS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('993', '115', '黄平县', '3', 'HPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('994', '115', '施秉县', '3', 'SBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('995', '115', '三穗县', '3', 'SSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('996', '115', '镇远县', '3', 'ZYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('997', '115', '岑巩县', '3', 'GX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('998', '115', '天柱县', '3', 'TZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('999', '115', '锦屏县', '3', 'JPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1000', '115', '剑河县', '3', 'JHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1001', '115', '台江县', '3', 'TJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1002', '115', '黎平县', '3', 'LPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1003', '115', '榕江县', '3', 'JX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1004', '115', '从江县', '3', 'CJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1005', '115', '雷山县', '3', 'LSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1006', '115', '麻江县', '3', 'MJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1007', '115', '丹寨县', '3', 'DZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1008', '116', '都匀市', '3', 'DYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1009', '116', '福泉市', '3', 'FQS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1010', '116', '荔波县', '3', 'LBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1011', '116', '贵定县', '3', 'GDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1012', '116', '瓮安县', '3', 'WAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1013', '116', '独山县', '3', 'DSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1014', '116', '平塘县', '3', 'PTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1015', '116', '罗甸县', '3', 'LDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1016', '116', '长顺县', '3', 'CSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1017', '116', '龙里县', '3', 'LLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1018', '116', '惠水县', '3', 'HSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1019', '116', '三都', '3', 'SD',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1020', '117', '兴义市', '3', 'XYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1021', '117', '兴仁县', '3', 'XRX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1022', '117', '普安县', '3', 'PAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1023', '117', '晴隆县', '3', 'QLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1024', '117', '贞丰县', '3', 'ZFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1025', '117', '望谟县', '3', 'WX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1026', '117', '册亨县', '3', 'CHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1027', '117', '安龙县', '3', 'ALX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1028', '118', '铜仁市', '3', 'TRS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1029', '118', '江口县', '3', 'JKX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1030', '118', '石阡县', '3', 'SX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1031', '118', '思南县', '3', 'SNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1032', '118', '德江县', '3', 'DJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1033', '118', '玉屏', '3', 'YP',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1034', '118', '印江', '3', 'YJ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1035', '118', '沿河', '3', 'YH',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1036', '118', '松桃', '3', 'ST',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1037', '118', '万山特区', '3', 'WSTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1038', '119', '红花岗区', '3', 'HHGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1039', '119', '务川县', '3', 'WCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1040', '119', '道真县', '3', 'DZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1041', '119', '汇川区', '3', 'HCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1042', '119', '赤水市', '3', 'CSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1043', '119', '仁怀市', '3', 'RHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1044', '119', '遵义县', '3', 'ZYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1045', '119', '桐梓县', '3', 'TX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1046', '119', '绥阳县', '3', 'SYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1047', '119', '正安县', '3', 'ZAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1048', '119', '凤冈县', '3', 'FGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1049', '119', '湄潭县', '3', 'TX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1050', '119', '余庆县', '3', 'YQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1051', '119', '习水县', '3', 'XSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1052', '119', '道真', '3', 'DZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1053', '119', '务川', '3', 'WC',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1054', '120', '秀英区', '3', 'XYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1055', '120', '龙华区', '3', 'LHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1056', '120', '琼山区', '3', 'QSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1057', '120', '美兰区', '3', 'MLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1058', '137', '市区', '3', 'SQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1059', '137', '洋浦开发区', '3', 'YPKFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1060', '137', '那大镇', '3', 'NDZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1061', '137', '王五镇', '3', 'WWZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1062', '137', '雅星镇', '3', 'YXZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1063', '137', '大成镇', '3', 'DCZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1064', '137', '中和镇', '3', 'ZHZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1065', '137', '峨蔓镇', '3', 'EMZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1066', '137', '南丰镇', '3', 'NFZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1067', '137', '白马井镇', '3', 'BMJZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1068', '137', '兰洋镇', '3', 'LYZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1069', '137', '和庆镇', '3', 'HQZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1070', '137', '海头镇', '3', 'HTZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1071', '137', '排浦镇', '3', 'PPZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1072', '137', '东成镇', '3', 'DCZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1073', '137', '光村镇', '3', 'GCZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1074', '137', '木棠镇', '3', 'MTZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1075', '137', '新州镇', '3', 'XZZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1076', '137', '三都镇', '3', 'SDZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1077', '137', '其他', '3', 'QT',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1078', '138', '长安区', '3', 'CAQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1079', '138', '桥东区', '3', 'QDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1080', '138', '桥西区', '3', 'QXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1081', '138', '新华区', '3', 'XHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1082', '138', '裕华区', '3', 'YHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1083', '138', '井陉矿区', '3', 'JKQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1084', '138', '高新区', '3', 'GXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1085', '138', '辛集市', '3', 'XJS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1086', '138', '藁城市', '3', 'CS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1087', '138', '晋州市', '3', 'JZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1088', '138', '新乐市', '3', 'XLS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1089', '138', '鹿泉市', '3', 'LQS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1090', '138', '井陉县', '3', 'JX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1091', '138', '正定县', '3', 'ZDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1092', '138', '栾城县', '3', 'CX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1093', '138', '行唐县', '3', 'XTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1094', '138', '灵寿县', '3', 'LSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1095', '138', '高邑县', '3', 'GYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1096', '138', '深泽县', '3', 'SZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1097', '138', '赞皇县', '3', 'ZHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1098', '138', '无极县', '3', 'WJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1099', '138', '平山县', '3', 'PSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1100', '138', '元氏县', '3', 'YSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1101', '138', '赵县', '3', 'ZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1102', '139', '新市区', '3', 'XSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1103', '139', '南市区', '3', 'NSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1104', '139', '北市区', '3', 'BSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1105', '139', '涿州市', '3', 'ZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1106', '139', '定州市', '3', 'DZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1107', '139', '安国市', '3', 'AGS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1108', '139', '高碑店市', '3', 'GBDS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1109', '139', '满城县', '3', 'MCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1110', '139', '清苑县', '3', 'QYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1111', '139', '涞水县', '3', 'SX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1112', '139', '阜平县', '3', 'FPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1113', '139', '徐水县', '3', 'XSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1114', '139', '定兴县', '3', 'DXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1115', '139', '唐县', '3', 'TX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1116', '139', '高阳县', '3', 'GYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1117', '139', '容城县', '3', 'RCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1118', '139', '涞源县', '3', 'YX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1119', '139', '望都县', '3', 'WDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1120', '139', '安新县', '3', 'AXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1121', '139', '易县', '3', 'YX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1122', '139', '曲阳县', '3', 'QYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1123', '139', '蠡县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1124', '139', '顺平县', '3', 'SPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1125', '139', '博野县', '3', 'BYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1126', '139', '雄县', '3', 'XX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1127', '140', '运河区', '3', 'YHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1128', '140', '新华区', '3', 'XHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1129', '140', '泊头市', '3', 'BTS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1130', '140', '任丘市', '3', 'RQS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1131', '140', '黄骅市', '3', 'HS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1132', '140', '河间市', '3', 'HJS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1133', '140', '沧县', '3', 'CX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1134', '140', '青县', '3', 'QX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1135', '140', '东光县', '3', 'DGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1136', '140', '海兴县', '3', 'HXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1137', '140', '盐山县', '3', 'YSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1138', '140', '肃宁县', '3', 'SNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1139', '140', '南皮县', '3', 'NPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1140', '140', '吴桥县', '3', 'WQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1141', '140', '献县', '3', 'XX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1142', '140', '孟村', '3', 'MC',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1143', '141', '双桥区', '3', 'SQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1144', '141', '双滦区', '3', 'SLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1145', '141', '鹰手营子矿区', '3', 'YSYZKQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1146', '141', '承德县', '3', 'CDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1147', '141', '兴隆县', '3', 'XLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1148', '141', '平泉县', '3', 'PQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1149', '141', '滦平县', '3', 'LPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1150', '141', '隆化县', '3', 'LHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1151', '141', '丰宁', '3', 'FN',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1152', '141', '宽城', '3', 'KC',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1153', '141', '围场', '3', 'WC',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1154', '142', '从台区', '3', 'CTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1155', '142', '复兴区', '3', 'FXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1156', '142', '邯山区', '3', 'HSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1157', '142', '峰峰矿区', '3', 'FFKQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1158', '142', '武安市', '3', 'WAS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1159', '142', '邯郸县', '3', 'HDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1160', '142', '临漳县', '3', 'LZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1161', '142', '成安县', '3', 'CAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1162', '142', '大名县', '3', 'DMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1163', '142', '涉县', '3', 'SX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1164', '142', '磁县', '3', 'CX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1165', '142', '肥乡县', '3', 'FXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1166', '142', '永年县', '3', 'YNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1167', '142', '邱县', '3', 'QX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1168', '142', '鸡泽县', '3', 'JZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1169', '142', '广平县', '3', 'GPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1170', '142', '馆陶县', '3', 'GTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1171', '142', '魏县', '3', 'WX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1172', '142', '曲周县', '3', 'QZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1173', '143', '桃城区', '3', 'TCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1174', '143', '冀州市', '3', 'JZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1175', '143', '深州市', '3', 'SZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1176', '143', '枣强县', '3', 'ZQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1177', '143', '武邑县', '3', 'WYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1178', '143', '武强县', '3', 'WQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1179', '143', '饶阳县', '3', 'RYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1180', '143', '安平县', '3', 'APX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1181', '143', '故城县', '3', 'GCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1182', '143', '景县', '3', 'JX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1183', '143', '阜城县', '3', 'FCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1184', '144', '安次区', '3', 'ACQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1185', '144', '广阳区', '3', 'GYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1186', '144', '霸州市', '3', 'BZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1187', '144', '三河市', '3', 'SHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1188', '144', '固安县', '3', 'GAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1189', '144', '永清县', '3', 'YQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1190', '144', '香河县', '3', 'XHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1191', '144', '大城县', '3', 'DCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1192', '144', '文安县', '3', 'WAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1193', '144', '大厂', '3', 'DC',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1194', '145', '海港区', '3', 'HGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1195', '145', '山海关区', '3', 'SHGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1196', '145', '北戴河区', '3', 'BDHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1197', '145', '昌黎县', '3', 'CLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1198', '145', '抚宁县', '3', 'FNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1199', '145', '卢龙县', '3', 'LLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1200', '145', '青龙', '3', 'QL',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1201', '146', '路北区', '3', 'LBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1202', '146', '路南区', '3', 'LNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1203', '146', '古冶区', '3', 'GYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1204', '146', '开平区', '3', 'KPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1205', '146', '丰南区', '3', 'FNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1206', '146', '丰润区', '3', 'FRQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1207', '146', '遵化市', '3', 'ZHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1208', '146', '迁安市', '3', 'QAS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1209', '146', '滦县', '3', 'LX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1210', '146', '滦南县', '3', 'LNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1211', '146', '乐亭县', '3', 'LTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1212', '146', '迁西县', '3', 'QXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1213', '146', '玉田县', '3', 'YTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1214', '146', '唐海县', '3', 'THX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1215', '147', '桥东区', '3', 'QDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1216', '147', '桥西区', '3', 'QXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1217', '147', '南宫市', '3', 'NGS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1218', '147', '沙河市', '3', 'SHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1219', '147', '邢台县', '3', 'XTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1220', '147', '临城县', '3', 'LCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1221', '147', '内丘县', '3', 'NQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1222', '147', '柏乡县', '3', 'BXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1223', '147', '隆尧县', '3', 'LYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1224', '147', '任县', '3', 'RX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1225', '147', '南和县', '3', 'NHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1226', '147', '宁晋县', '3', 'NJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1227', '147', '巨鹿县', '3', 'JLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1228', '147', '新河县', '3', 'XHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1229', '147', '广宗县', '3', 'GZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1230', '147', '平乡县', '3', 'PXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1231', '147', '威县', '3', 'WX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1232', '147', '清河县', '3', 'QHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1233', '147', '临西县', '3', 'LXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1234', '148', '桥西区', '3', 'QXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1235', '148', '桥东区', '3', 'QDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1236', '148', '宣化区', '3', 'XHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1237', '148', '下花园区', '3', 'XHYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1238', '148', '宣化县', '3', 'XHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1239', '148', '张北县', '3', 'ZBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1240', '148', '康保县', '3', 'KBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1241', '148', '沽源县', '3', 'GYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1242', '148', '尚义县', '3', 'SYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1243', '148', '蔚县', '3', 'WX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1244', '148', '阳原县', '3', 'YYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1245', '148', '怀安县', '3', 'HAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1246', '148', '万全县', '3', 'WQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1247', '148', '怀来县', '3', 'HLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1248', '148', '涿鹿县', '3', 'LX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1249', '148', '赤城县', '3', 'CCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1250', '148', '崇礼县', '3', 'CLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1251', '149', '金水区', '3', 'JSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1252', '149', '邙山区', '3', 'SQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1253', '149', '二七区', '3', 'EQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1254', '149', '管城区', '3', 'GCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1255', '149', '中原区', '3', 'ZYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1256', '149', '上街区', '3', 'SJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1257', '149', '惠济区', '3', 'HJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1258', '149', '郑东新区', '3', 'ZDXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1259', '149', '经济技术开发区', '3', 'JJJSKFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1260', '149', '高新开发区', '3', 'GXKFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1261', '149', '出口加工区', '3', 'CKJGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1262', '149', '巩义市', '3', 'GYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1263', '149', '荥阳市', '3', 'YS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1264', '149', '新密市', '3', 'XMS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1265', '149', '新郑市', '3', 'XZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1266', '149', '登封市', '3', 'DFS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1267', '149', '中牟县', '3', 'ZMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1268', '150', '西工区', '3', 'XGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1269', '150', '老城区', '3', 'LCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1270', '150', '涧西区', '3', 'JXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1271', '150', '瀍河回族区', '3', 'HHZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1272', '150', '洛龙区', '3', 'LLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1273', '150', '吉利区', '3', 'JLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1274', '150', '偃师市', '3', 'SS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1275', '150', '孟津县', '3', 'MJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1276', '150', '新安县', '3', 'XAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1277', '150', '栾川县', '3', 'CX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1278', '150', '嵩县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1279', '150', '汝阳县', '3', 'RYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1280', '150', '宜阳县', '3', 'YYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1281', '150', '洛宁县', '3', 'LNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1282', '150', '伊川县', '3', 'YCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1283', '151', '鼓楼区', '3', 'GLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1284', '151', '龙亭区', '3', 'LTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1285', '151', '顺河回族区', '3', 'SHHZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1286', '151', '金明区', '3', 'JMQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1287', '151', '禹王台区', '3', 'YWTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1288', '151', '杞县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1289', '151', '通许县', '3', 'TXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1290', '151', '尉氏县', '3', 'WSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1291', '151', '开封县', '3', 'KFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1292', '151', '兰考县', '3', 'LKX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1293', '152', '北关区', '3', 'BGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1294', '152', '文峰区', '3', 'WFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1295', '152', '殷都区', '3', 'YDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1296', '152', '龙安区', '3', 'LAQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1297', '152', '林州市', '3', 'LZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1298', '152', '安阳县', '3', 'AYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1299', '152', '汤阴县', '3', 'TYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1300', '152', '滑县', '3', 'HX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1301', '152', '内黄县', '3', 'NHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1302', '153', '淇滨区', '3', 'BQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1303', '153', '山城区', '3', 'SCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1304', '153', '鹤山区', '3', 'HSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1305', '153', '浚县', '3', 'JX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1306', '153', '淇县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1307', '154', '济源市', '3', 'JYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1308', '155', '解放区', '3', 'JFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1309', '155', '中站区', '3', 'ZZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1310', '155', '马村区', '3', 'MCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1311', '155', '山阳区', '3', 'SYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1312', '155', '沁阳市', '3', 'QYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1313', '155', '孟州市', '3', 'MZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1314', '155', '修武县', '3', 'XWX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1315', '155', '博爱县', '3', 'BAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1316', '155', '武陟县', '3', 'WX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1317', '155', '温县', '3', 'WX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1318', '156', '卧龙区', '3', 'WLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1319', '156', '宛城区', '3', 'WCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1320', '156', '邓州市', '3', 'DZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1321', '156', '南召县', '3', 'NZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1322', '156', '方城县', '3', 'FCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1323', '156', '西峡县', '3', 'XXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1324', '156', '镇平县', '3', 'ZPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1325', '156', '内乡县', '3', 'NXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1326', '156', '淅川县', '3', 'CX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1327', '156', '社旗县', '3', 'SQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1328', '156', '唐河县', '3', 'THX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1329', '156', '新野县', '3', 'XYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1330', '156', '桐柏县', '3', 'TBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1331', '157', '新华区', '3', 'XHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1332', '157', '卫东区', '3', 'WDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1333', '157', '湛河区', '3', 'ZHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1334', '157', '石龙区', '3', 'SLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1335', '157', '舞钢市', '3', 'WGS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1336', '157', '汝州市', '3', 'RZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1337', '157', '宝丰县', '3', 'BFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1338', '157', '叶县', '3', 'YX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1339', '157', '鲁山县', '3', 'LSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1340', '157', '郏县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1341', '158', '湖滨区', '3', 'HBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1342', '158', '义马市', '3', 'YMS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1343', '158', '灵宝市', '3', 'LBS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1344', '158', '渑池县', '3', 'CX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1345', '158', '陕县', '3', 'SX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1346', '158', '卢氏县', '3', 'LSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1347', '159', '梁园区', '3', 'LYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1348', '159', '睢阳区', '3', 'YQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1349', '159', '永城市', '3', 'YCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1350', '159', '民权县', '3', 'MQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1351', '159', '睢县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1352', '159', '宁陵县', '3', 'NLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1353', '159', '虞城县', '3', 'YCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1354', '159', '柘城县', '3', 'CX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1355', '159', '夏邑县', '3', 'XYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1356', '160', '卫滨区', '3', 'WBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1357', '160', '红旗区', '3', 'HQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1358', '160', '凤泉区', '3', 'FQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1359', '160', '牧野区', '3', 'MYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1360', '160', '卫辉市', '3', 'WHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1361', '160', '辉县市', '3', 'HXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1362', '160', '新乡县', '3', 'XXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1363', '160', '获嘉县', '3', 'HJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1364', '160', '原阳县', '3', 'YYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1365', '160', '延津县', '3', 'YJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1366', '160', '封丘县', '3', 'FQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1367', '160', '长垣县', '3', 'CYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1368', '161', '浉河区', '3', 'HQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1369', '161', '平桥区', '3', 'PQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1370', '161', '罗山县', '3', 'LSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1371', '161', '光山县', '3', 'GSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1372', '161', '新县', '3', 'XX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1373', '161', '商城县', '3', 'SCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1374', '161', '固始县', '3', 'GSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1375', '161', '潢川县', '3', 'CX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1376', '161', '淮滨县', '3', 'HBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1377', '161', '息县', '3', 'XX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1378', '162', '魏都区', '3', 'WDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1379', '162', '禹州市', '3', 'YZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1380', '162', '长葛市', '3', 'CGS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1381', '162', '许昌县', '3', 'XCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1382', '162', '鄢陵县', '3', 'LX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1383', '162', '襄城县', '3', 'XCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1384', '163', '川汇区', '3', 'CHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1385', '163', '项城市', '3', 'XCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1386', '163', '扶沟县', '3', 'FGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1387', '163', '西华县', '3', 'XHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1388', '163', '商水县', '3', 'SSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1389', '163', '沈丘县', '3', 'SQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1390', '163', '郸城县', '3', 'DCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1391', '163', '淮阳县', '3', 'HYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1392', '163', '太康县', '3', 'TKX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1393', '163', '鹿邑县', '3', 'LYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1394', '164', '驿城区', '3', 'CQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1395', '164', '西平县', '3', 'XPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1396', '164', '上蔡县', '3', 'SCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1397', '164', '平舆县', '3', 'PYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1398', '164', '正阳县', '3', 'ZYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1399', '164', '确山县', '3', 'QSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1400', '164', '泌阳县', '3', 'MYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1401', '164', '汝南县', '3', 'RNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1402', '164', '遂平县', '3', 'SPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1403', '164', '新蔡县', '3', 'XCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1404', '165', '郾城区', '3', 'CQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1405', '165', '源汇区', '3', 'YHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1406', '165', '召陵区', '3', 'ZLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1407', '165', '舞阳县', '3', 'WYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1408', '165', '临颍县', '3', 'LX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1409', '166', '华龙区', '3', 'HLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1410', '166', '清丰县', '3', 'QFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1411', '166', '南乐县', '3', 'NLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1412', '166', '范县', '3', 'FX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1413', '166', '台前县', '3', 'TQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1414', '166', '濮阳县', '3', 'YX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1415', '167', '道里区', '3', 'DLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1416', '167', '南岗区', '3', 'NGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1417', '167', '动力区', '3', 'DLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1418', '167', '平房区', '3', 'PFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1419', '167', '香坊区', '3', 'XFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1420', '167', '太平区', '3', 'TPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1421', '167', '道外区', '3', 'DWQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1422', '167', '阿城区', '3', 'ACQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1423', '167', '呼兰区', '3', 'HLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1424', '167', '松北区', '3', 'SBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1425', '167', '尚志市', '3', 'SZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1426', '167', '双城市', '3', 'SCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1427', '167', '五常市', '3', 'WCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1428', '167', '方正县', '3', 'FZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1429', '167', '宾县', '3', 'BX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1430', '167', '依兰县', '3', 'YLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1431', '167', '巴彦县', '3', 'BYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1432', '167', '通河县', '3', 'THX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1433', '167', '木兰县', '3', 'MLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1434', '167', '延寿县', '3', 'YSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1435', '168', '萨尔图区', '3', 'SETQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1436', '168', '红岗区', '3', 'HGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1437', '168', '龙凤区', '3', 'LFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1438', '168', '让胡路区', '3', 'RHLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1439', '168', '大同区', '3', 'DTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1440', '168', '肇州县', '3', 'ZZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1441', '168', '肇源县', '3', 'ZYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1442', '168', '林甸县', '3', 'LDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1443', '168', '杜尔伯特', '3', 'DEBT',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1444', '169', '呼玛县', '3', 'HMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1445', '169', '漠河县', '3', 'MHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1446', '169', '塔河县', '3', 'THX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1447', '170', '兴山区', '3', 'XSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1448', '170', '工农区', '3', 'GNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1449', '170', '南山区', '3', 'NSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1450', '170', '兴安区', '3', 'XAQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1451', '170', '向阳区', '3', 'XYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1452', '170', '东山区', '3', 'DSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1453', '170', '萝北县', '3', 'LBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1454', '170', '绥滨县', '3', 'SBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1455', '171', '爱辉区', '3', 'AHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1456', '171', '五大连池市', '3', 'WDLCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1457', '171', '北安市', '3', 'BAS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1458', '171', '嫩江县', '3', 'NJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1459', '171', '逊克县', '3', 'XKX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1460', '171', '孙吴县', '3', 'SWX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1461', '172', '鸡冠区', '3', 'JGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1462', '172', '恒山区', '3', 'HSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1463', '172', '城子河区', '3', 'CZHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1464', '172', '滴道区', '3', 'DDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1465', '172', '梨树区', '3', 'LSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1466', '172', '虎林市', '3', 'HLS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1467', '172', '密山市', '3', 'MSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1468', '172', '鸡东县', '3', 'JDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1469', '173', '前进区', '3', 'QJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1470', '173', '郊区', '3', 'JQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1471', '173', '向阳区', '3', 'XYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1472', '173', '东风区', '3', 'DFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1473', '173', '同江市', '3', 'TJS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1474', '173', '富锦市', '3', 'FJS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1475', '173', '桦南县', '3', 'NX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1476', '173', '桦川县', '3', 'CX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1477', '173', '汤原县', '3', 'TYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1478', '173', '抚远县', '3', 'FYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1479', '174', '爱民区', '3', 'AMQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1480', '174', '东安区', '3', 'DAQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1481', '174', '阳明区', '3', 'YMQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1482', '174', '西安区', '3', 'XAQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1483', '174', '绥芬河市', '3', 'SFHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1484', '174', '海林市', '3', 'HLS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1485', '174', '宁安市', '3', 'NAS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1486', '174', '穆棱市', '3', 'MLS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1487', '174', '东宁县', '3', 'DNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1488', '174', '林口县', '3', 'LKX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1489', '175', '桃山区', '3', 'TSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1490', '175', '新兴区', '3', 'XXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1491', '175', '茄子河区', '3', 'QZHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1492', '175', '勃利县', '3', 'BLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1493', '176', '龙沙区', '3', 'LSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1494', '176', '昂昂溪区', '3', 'AAXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1495', '176', '铁峰区', '3', 'TFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1496', '176', '建华区', '3', 'JHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1497', '176', '富拉尔基区', '3', 'FLEJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1498', '176', '碾子山区', '3', 'NZSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1499', '176', '梅里斯达斡尔区', '3', 'MLSDWEQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1500', '176', '讷河市', '3', 'HS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1501', '176', '龙江县', '3', 'LJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1502', '176', '依安县', '3', 'YAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1503', '176', '泰来县', '3', 'TLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1504', '176', '甘南县', '3', 'GNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1505', '176', '富裕县', '3', 'FYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1506', '176', '克山县', '3', 'KSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1507', '176', '克东县', '3', 'KDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1508', '176', '拜泉县', '3', 'BQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1509', '177', '尖山区', '3', 'JSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1510', '177', '岭东区', '3', 'LDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1511', '177', '四方台区', '3', 'SFTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1512', '177', '宝山区', '3', 'BSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1513', '177', '集贤县', '3', 'JXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1514', '177', '友谊县', '3', 'YYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1515', '177', '宝清县', '3', 'BQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1516', '177', '饶河县', '3', 'RHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1517', '178', '北林区', '3', 'BLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1518', '178', '安达市', '3', 'ADS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1519', '178', '肇东市', '3', 'ZDS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1520', '178', '海伦市', '3', 'HLS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1521', '178', '望奎县', '3', 'WKX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1522', '178', '兰西县', '3', 'LXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1523', '178', '青冈县', '3', 'QGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1524', '178', '庆安县', '3', 'QAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1525', '178', '明水县', '3', 'MSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1526', '178', '绥棱县', '3', 'SLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1527', '179', '伊春区', '3', 'YCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1528', '179', '带岭区', '3', 'DLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1529', '179', '南岔区', '3', 'NCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1530', '179', '金山屯区', '3', 'JSTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1531', '179', '西林区', '3', 'XLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1532', '179', '美溪区', '3', 'MXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1533', '179', '乌马河区', '3', 'WMHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1534', '179', '翠峦区', '3', 'CLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1535', '179', '友好区', '3', 'YHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1536', '179', '上甘岭区', '3', 'SGLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1537', '179', '五营区', '3', 'WYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1538', '179', '红星区', '3', 'HXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1539', '179', '新青区', '3', 'XQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1540', '179', '汤旺河区', '3', 'TWHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1541', '179', '乌伊岭区', '3', 'WYLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1542', '179', '铁力市', '3', 'TLS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1543', '179', '嘉荫县', '3', 'JYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1544', '180', '江岸区', '3', 'JAQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1545', '180', '武昌区', '3', 'WCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1546', '180', '江汉区', '3', 'JHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1547', '180', '硚口区', '3', 'KQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1548', '180', '汉阳区', '3', 'HYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1549', '180', '青山区', '3', 'QSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1550', '180', '洪山区', '3', 'HSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1551', '180', '东西湖区', '3', 'DXHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1552', '180', '汉南区', '3', 'HNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1553', '180', '蔡甸区', '3', 'CDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1554', '180', '江夏区', '3', 'JXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1555', '180', '黄陂区', '3', 'HQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1556', '180', '新洲区', '3', 'XZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1557', '180', '经济开发区', '3', 'JJKFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1558', '181', '仙桃市', '3', 'XTS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1559', '182', '鄂城区', '3', 'ECQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1560', '182', '华容区', '3', 'HRQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1561', '182', '梁子湖区', '3', 'LZHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1562', '183', '黄州区', '3', 'HZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1563', '183', '麻城市', '3', 'MCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1564', '183', '武穴市', '3', 'WXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1565', '183', '团风县', '3', 'TFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1566', '183', '红安县', '3', 'HAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1567', '183', '罗田县', '3', 'LTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1568', '183', '英山县', '3', 'YSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1569', '183', '浠水县', '3', 'SX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1570', '183', '蕲春县', '3', 'CX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1571', '183', '黄梅县', '3', 'HMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1572', '184', '黄石港区', '3', 'HSGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1573', '184', '西塞山区', '3', 'XSSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1574', '184', '下陆区', '3', 'XLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1575', '184', '铁山区', '3', 'TSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1576', '184', '大冶市', '3', 'DYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1577', '184', '阳新县', '3', 'YXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1578', '185', '东宝区', '3', 'DBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1579', '185', '掇刀区', '3', 'DDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1580', '185', '钟祥市', '3', 'ZXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1581', '185', '京山县', '3', 'JSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1582', '185', '沙洋县', '3', 'SYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1583', '186', '沙市区', '3', 'SSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1584', '186', '荆州区', '3', 'JZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1585', '186', '石首市', '3', 'SSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1586', '186', '洪湖市', '3', 'HHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1587', '186', '松滋市', '3', 'SZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1588', '186', '公安县', '3', 'GAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1589', '186', '监利县', '3', 'JLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1590', '186', '江陵县', '3', 'JLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1591', '187', '潜江市', '3', 'QJS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1592', '188', '神农架林区', '3', 'SNJLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1593', '189', '张湾区', '3', 'ZWQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1594', '189', '茅箭区', '3', 'MJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1595', '189', '丹江口市', '3', 'DJKS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1596', '189', '郧县', '3', 'YX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1597', '189', '郧西县', '3', 'YXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1598', '189', '竹山县', '3', 'ZSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1599', '189', '竹溪县', '3', 'ZXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1600', '189', '房县', '3', 'FX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1601', '190', '曾都区', '3', 'ZDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1602', '190', '广水市', '3', 'GSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1603', '191', '天门市', '3', 'TMS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1604', '192', '咸安区', '3', 'XAQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1605', '192', '赤壁市', '3', 'CBS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1606', '192', '嘉鱼县', '3', 'JYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1607', '192', '通城县', '3', 'TCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1608', '192', '崇阳县', '3', 'CYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1609', '192', '通山县', '3', 'TSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1610', '193', '襄城区', '3', 'XCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1611', '193', '樊城区', '3', 'FCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1612', '193', '襄阳区', '3', 'XYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1613', '193', '老河口市', '3', 'LHKS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1614', '193', '枣阳市', '3', 'ZYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1615', '193', '宜城市', '3', 'YCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1616', '193', '南漳县', '3', 'NZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1617', '193', '谷城县', '3', 'GCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1618', '193', '保康县', '3', 'BKX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1619', '194', '孝南区', '3', 'XNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1620', '194', '应城市', '3', 'YCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1621', '194', '安陆市', '3', 'ALS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1622', '194', '汉川市', '3', 'HCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1623', '194', '孝昌县', '3', 'XCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1624', '194', '大悟县', '3', 'DWX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1625', '194', '云梦县', '3', 'YMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1626', '195', '长阳', '3', 'CY',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1627', '195', '五峰', '3', 'WF',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1628', '195', '西陵区', '3', 'XLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1629', '195', '伍家岗区', '3', 'WJGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1630', '195', '点军区', '3', 'DJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1631', '195', '猇亭区', '3', 'TQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1632', '195', '夷陵区', '3', 'YLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1633', '195', '宜都市', '3', 'YDS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1634', '195', '当阳市', '3', 'DYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1635', '195', '枝江市', '3', 'ZJS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1636', '195', '远安县', '3', 'YAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1637', '195', '兴山县', '3', 'XSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1638', '195', '秭归县', '3', 'GX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1639', '196', '恩施市', '3', 'ESS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1640', '196', '利川市', '3', 'LCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1641', '196', '建始县', '3', 'JSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1642', '196', '巴东县', '3', 'BDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1643', '196', '宣恩县', '3', 'XEX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1644', '196', '咸丰县', '3', 'XFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1645', '196', '来凤县', '3', 'LFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1646', '196', '鹤峰县', '3', 'HFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1647', '197', '岳麓区', '3', 'YLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1648', '197', '芙蓉区', '3', 'RQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1649', '197', '天心区', '3', 'TXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1650', '197', '开福区', '3', 'KFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1651', '197', '雨花区', '3', 'YHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1652', '197', '开发区', '3', 'KFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1653', '197', '浏阳市', '3', 'YS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1654', '197', '长沙县', '3', 'CSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1655', '197', '望城县', '3', 'WCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1656', '197', '宁乡县', '3', 'NXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1657', '198', '永定区', '3', 'YDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1658', '198', '武陵源区', '3', 'WLYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1659', '198', '慈利县', '3', 'CLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1660', '198', '桑植县', '3', 'SZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1661', '199', '武陵区', '3', 'WLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1662', '199', '鼎城区', '3', 'DCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1663', '199', '津市市', '3', 'JSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1664', '199', '安乡县', '3', 'AXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1665', '199', '汉寿县', '3', 'HSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1666', '199', '澧县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1667', '199', '临澧县', '3', 'LX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1668', '199', '桃源县', '3', 'TYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1669', '199', '石门县', '3', 'SMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1670', '200', '北湖区', '3', 'BHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1671', '200', '苏仙区', '3', 'SXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1672', '200', '资兴市', '3', 'ZXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1673', '200', '桂阳县', '3', 'GYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1674', '200', '宜章县', '3', 'YZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1675', '200', '永兴县', '3', 'YXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1676', '200', '嘉禾县', '3', 'JHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1677', '200', '临武县', '3', 'LWX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1678', '200', '汝城县', '3', 'RCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1679', '200', '桂东县', '3', 'GDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1680', '200', '安仁县', '3', 'ARX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1681', '201', '雁峰区', '3', 'YFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1682', '201', '珠晖区', '3', 'ZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1683', '201', '石鼓区', '3', 'SGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1684', '201', '蒸湘区', '3', 'ZXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1685', '201', '南岳区', '3', 'NYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1686', '201', '耒阳市', '3', 'YS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1687', '201', '常宁市', '3', 'CNS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1688', '201', '衡阳县', '3', 'HYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1689', '201', '衡南县', '3', 'HNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1690', '201', '衡山县', '3', 'HSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1691', '201', '衡东县', '3', 'HDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1692', '201', '祁东县', '3', 'QDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1693', '202', '鹤城区', '3', 'HCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1694', '202', '靖州', '3', 'JZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1695', '202', '麻阳', '3', 'MY',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1696', '202', '通道', '3', 'TD',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1697', '202', '新晃', '3', 'XH',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1698', '202', '芷江', '3', 'J',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1699', '202', '沅陵县', '3', 'LX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1700', '202', '辰溪县', '3', 'CXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1701', '202', '溆浦县', '3', 'PX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1702', '202', '中方县', '3', 'ZFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1703', '202', '会同县', '3', 'HTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1704', '202', '洪江市', '3', 'HJS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1705', '203', '娄星区', '3', 'LXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1706', '203', '冷水江市', '3', 'LSJS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1707', '203', '涟源市', '3', 'LYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1708', '203', '双峰县', '3', 'SFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1709', '203', '新化县', '3', 'XHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1710', '204', '城步', '3', 'CB',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1711', '204', '双清区', '3', 'SQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1712', '204', '大祥区', '3', 'DXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1713', '204', '北塔区', '3', 'BTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1714', '204', '武冈市', '3', 'WGS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1715', '204', '邵东县', '3', 'SDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1716', '204', '新邵县', '3', 'XSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1717', '204', '邵阳县', '3', 'SYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1718', '204', '隆回县', '3', 'LHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1719', '204', '洞口县', '3', 'DKX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1720', '204', '绥宁县', '3', 'SNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1721', '204', '新宁县', '3', 'XNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1722', '205', '岳塘区', '3', 'YTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1723', '205', '雨湖区', '3', 'YHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1724', '205', '湘乡市', '3', 'XXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1725', '205', '韶山市', '3', 'SSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1726', '205', '湘潭县', '3', 'XTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1727', '206', '吉首市', '3', 'JSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1728', '206', '泸溪县', '3', 'XX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1729', '206', '凤凰县', '3', 'FHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1730', '206', '花垣县', '3', 'HYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1731', '206', '保靖县', '3', 'BJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1732', '206', '古丈县', '3', 'GZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1733', '206', '永顺县', '3', 'YSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1734', '206', '龙山县', '3', 'LSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1735', '207', '赫山区', '3', 'HSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1736', '207', '资阳区', '3', 'ZYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1737', '207', '沅江市', '3', 'JS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1738', '207', '南县', '3', 'NX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1739', '207', '桃江县', '3', 'TJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1740', '207', '安化县', '3', 'AHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1741', '208', '江华', '3', 'JH',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1742', '208', '冷水滩区', '3', 'LSTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1743', '208', '零陵区', '3', 'LLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1744', '208', '祁阳县', '3', 'QYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1745', '208', '东安县', '3', 'DAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1746', '208', '双牌县', '3', 'SPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1747', '208', '道县', '3', 'DX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1748', '208', '江永县', '3', 'JYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1749', '208', '宁远县', '3', 'NYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1750', '208', '蓝山县', '3', 'LSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1751', '208', '新田县', '3', 'XTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1752', '209', '岳阳楼区', '3', 'YYLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1753', '209', '君山区', '3', 'JSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1754', '209', '云溪区', '3', 'YXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1755', '209', '汨罗市', '3', 'LS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1756', '209', '临湘市', '3', 'LXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1757', '209', '岳阳县', '3', 'YYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1758', '209', '华容县', '3', 'HRX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1759', '209', '湘阴县', '3', 'XYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1760', '209', '平江县', '3', 'PJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1761', '210', '天元区', '3', 'TYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1762', '210', '荷塘区', '3', 'HTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1763', '210', '芦淞区', '3', 'LQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1764', '210', '石峰区', '3', 'SFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1765', '210', '醴陵市', '3', 'LS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1766', '210', '株洲县', '3', 'ZZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1767', '210', '攸县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1768', '210', '茶陵县', '3', 'CLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1769', '210', '炎陵县', '3', 'YLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1770', '211', '朝阳区', '3', 'CYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1771', '211', '宽城区', '3', 'KCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1772', '211', '二道区', '3', 'EDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1773', '211', '南关区', '3', 'NGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1774', '211', '绿园区', '3', 'LYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1775', '211', '双阳区', '3', 'SYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1776', '211', '净月潭开发区', '3', 'JYTKFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1777', '211', '高新技术开发区', '3', 'GXJSKFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1778', '211', '经济技术开发区', '3', 'JJJSKFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1779', '211', '汽车产业开发区', '3', 'QCCYKFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1780', '211', '德惠市', '3', 'DHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1781', '211', '九台市', '3', 'JTS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1782', '211', '榆树市', '3', 'YSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1783', '211', '农安县', '3', 'NAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1784', '212', '船营区', '3', 'CYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1785', '212', '昌邑区', '3', 'CYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1786', '212', '龙潭区', '3', 'LTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1787', '212', '丰满区', '3', 'FMQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1788', '212', '蛟河市', '3', 'HS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1789', '212', '桦甸市', '3', 'DS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1790', '212', '舒兰市', '3', 'SLS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1791', '212', '磐石市', '3', 'PSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1792', '212', '永吉县', '3', 'YJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1793', '213', '洮北区', '3', 'BQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1794', '213', '洮南市', '3', 'NS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1795', '213', '大安市', '3', 'DAS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1796', '213', '镇赉县', '3', 'ZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1797', '213', '通榆县', '3', 'TYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1798', '214', '江源区', '3', 'JYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1799', '214', '八道江区', '3', 'BDJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1800', '214', '长白', '3', 'CB',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1801', '214', '临江市', '3', 'LJS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1802', '214', '抚松县', '3', 'FSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1803', '214', '靖宇县', '3', 'JYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1804', '215', '龙山区', '3', 'LSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1805', '215', '西安区', '3', 'XAQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1806', '215', '东丰县', '3', 'DFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1807', '215', '东辽县', '3', 'DLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1808', '216', '铁西区', '3', 'TXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1809', '216', '铁东区', '3', 'TDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1810', '216', '伊通', '3', 'YT',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1811', '216', '公主岭市', '3', 'GZLS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1812', '216', '双辽市', '3', 'SLS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1813', '216', '梨树县', '3', 'LSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1814', '217', '前郭尔罗斯', '3', 'QGELS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1815', '217', '宁江区', '3', 'NJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1816', '217', '长岭县', '3', 'CLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1817', '217', '乾安县', '3', 'QAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1818', '217', '扶余县', '3', 'FYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1819', '218', '东昌区', '3', 'DCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1820', '218', '二道江区', '3', 'EDJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1821', '218', '梅河口市', '3', 'MHKS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1822', '218', '集安市', '3', 'JAS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1823', '218', '通化县', '3', 'THX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1824', '218', '辉南县', '3', 'HNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1825', '218', '柳河县', '3', 'LHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1826', '219', '延吉市', '3', 'YJS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1827', '219', '图们市', '3', 'TMS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1828', '219', '敦化市', '3', 'DHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1829', '219', '珲春市', '3', 'CS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1830', '219', '龙井市', '3', 'LJS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1831', '219', '和龙市', '3', 'HLS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1832', '219', '安图县', '3', 'ATX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1833', '219', '汪清县', '3', 'WQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1834', '220', '玄武区', '3', 'XWQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1835', '220', '鼓楼区', '3', 'GLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1836', '220', '白下区', '3', 'BXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1837', '220', '建邺区', '3', 'JQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1838', '220', '秦淮区', '3', 'QHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1839', '220', '雨花台区', '3', 'YHTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1840', '220', '下关区', '3', 'XGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1841', '220', '栖霞区', '3', 'QXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1842', '220', '浦口区', '3', 'PKQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1843', '220', '江宁区', '3', 'JNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1844', '220', '六合区', '3', 'LHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1845', '220', '溧水县', '3', 'SX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1846', '220', '高淳县', '3', 'GCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1847', '221', '沧浪区', '3', 'CLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1848', '221', '金阊区', '3', 'JQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1849', '221', '平江区', '3', 'PJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1850', '221', '虎丘区', '3', 'HQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1851', '221', '吴中区', '3', 'WZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1852', '221', '相城区', '3', 'XCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1853', '221', '园区', '3', 'YQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1854', '221', '新区', '3', 'XQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1855', '221', '常熟市', '3', 'CSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1856', '221', '张家港市', '3', 'ZJGS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1857', '221', '玉山镇', '3', 'YSZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1858', '221', '巴城镇', '3', 'BCZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1859', '221', '周市镇', '3', 'ZSZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1860', '221', '陆家镇', '3', 'LJZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1861', '221', '花桥镇', '3', 'HQZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1862', '221', '淀山湖镇', '3', 'DSHZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1863', '221', '张浦镇', '3', 'ZPZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1864', '221', '周庄镇', '3', 'ZZZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1865', '221', '千灯镇', '3', 'QDZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1866', '221', '锦溪镇', '3', 'JXZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1867', '221', '开发区', '3', 'KFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1868', '221', '吴江市', '3', 'WJS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1869', '221', '太仓市', '3', 'TCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1870', '222', '崇安区', '3', 'CAQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1871', '222', '北塘区', '3', 'BTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1872', '222', '南长区', '3', 'NCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1873', '222', '锡山区', '3', 'XSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1874', '222', '惠山区', '3', 'HSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1875', '222', '滨湖区', '3', 'BHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1876', '222', '新区', '3', 'XQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1877', '222', '江阴市', '3', 'JYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1878', '222', '宜兴市', '3', 'YXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1879', '223', '天宁区', '3', 'TNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1880', '223', '钟楼区', '3', 'ZLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1881', '223', '戚墅堰区', '3', 'QSYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1882', '223', '郊区', '3', 'JQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1883', '223', '新北区', '3', 'XBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1884', '223', '武进区', '3', 'WJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1885', '223', '溧阳市', '3', 'YS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1886', '223', '金坛市', '3', 'JTS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1887', '224', '清河区', '3', 'QHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1888', '224', '清浦区', '3', 'QPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1889', '224', '楚州区', '3', 'CZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1890', '224', '淮阴区', '3', 'HYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1891', '224', '涟水县', '3', 'LSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1892', '224', '洪泽县', '3', 'HZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1893', '224', '盱眙县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1894', '224', '金湖县', '3', 'JHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1895', '225', '新浦区', '3', 'XPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1896', '225', '连云区', '3', 'LYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1897', '225', '海州区', '3', 'HZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1898', '225', '赣榆县', '3', 'GYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1899', '225', '东海县', '3', 'DHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1900', '225', '灌云县', '3', 'GYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1901', '225', '灌南县', '3', 'GNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1902', '226', '崇川区', '3', 'CCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1903', '226', '港闸区', '3', 'GZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1904', '226', '经济开发区', '3', 'JJKFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1905', '226', '启东市', '3', 'QDS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1906', '226', '如皋市', '3', 'RGS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1907', '226', '通州市', '3', 'TZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1908', '226', '海门市', '3', 'HMS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1909', '226', '海安县', '3', 'HAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1910', '226', '如东县', '3', 'RDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1911', '227', '宿城区', '3', 'SCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1912', '227', '宿豫区', '3', 'SYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1913', '227', '宿豫县', '3', 'SYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1914', '227', '沭阳县', '3', 'YX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1915', '227', '泗阳县', '3', 'YX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1916', '227', '泗洪县', '3', 'HX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1917', '228', '海陵区', '3', 'HLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1918', '228', '高港区', '3', 'GGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1919', '228', '兴化市', '3', 'XHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1920', '228', '靖江市', '3', 'JJS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1921', '228', '泰兴市', '3', 'TXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1922', '228', '姜堰市', '3', 'JYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1923', '229', '云龙区', '3', 'YLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1924', '229', '鼓楼区', '3', 'GLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1925', '229', '九里区', '3', 'JLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1926', '229', '贾汪区', '3', 'JWQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1927', '229', '泉山区', '3', 'QSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1928', '229', '新沂市', '3', 'XYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1929', '229', '邳州市', '3', 'ZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1930', '229', '丰县', '3', 'FX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1931', '229', '沛县', '3', 'PX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1932', '229', '铜山县', '3', 'TSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1933', '229', '睢宁县', '3', 'NX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1934', '230', '城区', '3', 'CQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1935', '230', '亭湖区', '3', 'THQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1936', '230', '盐都区', '3', 'YDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1937', '230', '盐都县', '3', 'YDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1938', '230', '东台市', '3', 'DTS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1939', '230', '大丰市', '3', 'DFS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1940', '230', '响水县', '3', 'XSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1941', '230', '滨海县', '3', 'BHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1942', '230', '阜宁县', '3', 'FNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1943', '230', '射阳县', '3', 'SYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1944', '230', '建湖县', '3', 'JHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1945', '231', '广陵区', '3', 'GLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1946', '231', '维扬区', '3', 'WYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1947', '231', '邗江区', '3', 'JQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1948', '231', '仪征市', '3', 'YZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1949', '231', '高邮市', '3', 'GYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1950', '231', '江都市', '3', 'JDS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1951', '231', '宝应县', '3', 'BYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1952', '232', '京口区', '3', 'JKQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1953', '232', '润州区', '3', 'RZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1954', '232', '丹徒区', '3', 'DTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1955', '232', '丹阳市', '3', 'DYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1956', '232', '扬中市', '3', 'YZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1957', '232', '句容市', '3', 'JRS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1958', '233', '东湖区', '3', 'DHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1959', '233', '西湖区', '3', 'XHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1960', '233', '青云谱区', '3', 'QYPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1961', '233', '湾里区', '3', 'WLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1962', '233', '青山湖区', '3', 'QSHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1963', '233', '红谷滩新区', '3', 'HGTXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1964', '233', '昌北区', '3', 'CBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1965', '233', '高新区', '3', 'GXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1966', '233', '南昌县', '3', 'NCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1967', '233', '新建县', '3', 'XJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1968', '233', '安义县', '3', 'AYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1969', '233', '进贤县', '3', 'JXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1970', '234', '临川区', '3', 'LCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1971', '234', '南城县', '3', 'NCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1972', '234', '黎川县', '3', 'LCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1973', '234', '南丰县', '3', 'NFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1974', '234', '崇仁县', '3', 'CRX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1975', '234', '乐安县', '3', 'LAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1976', '234', '宜黄县', '3', 'YHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1977', '234', '金溪县', '3', 'JXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1978', '234', '资溪县', '3', 'ZXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1979', '234', '东乡县', '3', 'DXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1980', '234', '广昌县', '3', 'GCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1981', '235', '章贡区', '3', 'ZGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1982', '235', '于都县', '3', 'YDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1983', '235', '瑞金市', '3', 'RJS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1984', '235', '南康市', '3', 'NKS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1985', '235', '赣县', '3', 'GX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1986', '235', '信丰县', '3', 'XFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1987', '235', '大余县', '3', 'DYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1988', '235', '上犹县', '3', 'SYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1989', '235', '崇义县', '3', 'CYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1990', '235', '安远县', '3', 'AYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1991', '235', '龙南县', '3', 'LNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1992', '235', '定南县', '3', 'DNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1993', '235', '全南县', '3', 'QNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1994', '235', '宁都县', '3', 'NDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1995', '235', '兴国县', '3', 'XGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1996', '235', '会昌县', '3', 'HCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1997', '235', '寻乌县', '3', 'XWX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1998', '235', '石城县', '3', 'SCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('1999', '236', '安福县', '3', 'AFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2000', '236', '吉州区', '3', 'JZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2001', '236', '青原区', '3', 'QYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2002', '236', '井冈山市', '3', 'JGSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2003', '236', '吉安县', '3', 'JAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2004', '236', '吉水县', '3', 'JSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2005', '236', '峡江县', '3', 'XJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2006', '236', '新干县', '3', 'XGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2007', '236', '永丰县', '3', 'YFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2008', '236', '泰和县', '3', 'THX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2009', '236', '遂川县', '3', 'SCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2010', '236', '万安县', '3', 'WAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2011', '236', '永新县', '3', 'YXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2012', '237', '珠山区', '3', 'ZSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2013', '237', '昌江区', '3', 'CJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2014', '237', '乐平市', '3', 'LPS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2015', '237', '浮梁县', '3', 'FLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2016', '238', '浔阳区', '3', 'YQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2017', '238', '庐山区', '3', 'LSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2018', '238', '瑞昌市', '3', 'RCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2019', '238', '九江县', '3', 'JJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2020', '238', '武宁县', '3', 'WNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2021', '238', '修水县', '3', 'XSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2022', '238', '永修县', '3', 'YXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2023', '238', '德安县', '3', 'DAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2024', '238', '星子县', '3', 'XZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2025', '238', '都昌县', '3', 'DCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2026', '238', '湖口县', '3', 'HKX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2027', '238', '彭泽县', '3', 'PZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2028', '239', '安源区', '3', 'AYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2029', '239', '湘东区', '3', 'XDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2030', '239', '莲花县', '3', 'LHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2031', '239', '芦溪县', '3', 'LXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2032', '239', '上栗县', '3', 'SLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2033', '240', '信州区', '3', 'XZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2034', '240', '德兴市', '3', 'DXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2035', '240', '上饶县', '3', 'SRX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2036', '240', '广丰县', '3', 'GFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2037', '240', '玉山县', '3', 'YSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2038', '240', '铅山县', '3', 'QSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2039', '240', '横峰县', '3', 'HFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2040', '240', '弋阳县', '3', 'YX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2041', '240', '余干县', '3', 'YGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2042', '240', '波阳县', '3', 'BYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2043', '240', '万年县', '3', 'WNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2044', '240', '婺源县', '3', 'YX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2045', '241', '渝水区', '3', 'YSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2046', '241', '分宜县', '3', 'FYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2047', '242', '袁州区', '3', 'YZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2048', '242', '丰城市', '3', 'FCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2049', '242', '樟树市', '3', 'ZSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2050', '242', '高安市', '3', 'GAS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2051', '242', '奉新县', '3', 'FXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2052', '242', '万载县', '3', 'WZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2053', '242', '上高县', '3', 'SGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2054', '242', '宜丰县', '3', 'YFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2055', '242', '靖安县', '3', 'JAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2056', '242', '铜鼓县', '3', 'TGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2057', '243', '月湖区', '3', 'YHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2058', '243', '贵溪市', '3', 'GXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2059', '243', '余江县', '3', 'YJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2060', '244', '沈河区', '3', 'SHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2061', '244', '皇姑区', '3', 'HGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2062', '244', '和平区', '3', 'HPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2063', '244', '大东区', '3', 'DDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2064', '244', '铁西区', '3', 'TXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2065', '244', '苏家屯区', '3', 'SJTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2066', '244', '东陵区', '3', 'DLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2067', '244', '沈北新区', '3', 'SBXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2068', '244', '于洪区', '3', 'YHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2069', '244', '浑南新区', '3', 'HNXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2070', '244', '新民市', '3', 'XMS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2071', '244', '辽中县', '3', 'LZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2072', '244', '康平县', '3', 'KPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2073', '244', '法库县', '3', 'FKX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2074', '245', '西岗区', '3', 'XGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2075', '245', '中山区', '3', 'ZSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2076', '245', '沙河口区', '3', 'SHKQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2077', '245', '甘井子区', '3', 'GJZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2078', '245', '旅顺口区', '3', 'LSKQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2079', '245', '金州区', '3', 'JZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2080', '245', '开发区', '3', 'KFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2081', '245', '瓦房店市', '3', 'WFDS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2082', '245', '普兰店市', '3', 'PLDS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2083', '245', '庄河市', '3', 'ZHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2084', '245', '长海县', '3', 'CHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2085', '246', '铁东区', '3', 'TDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2086', '246', '铁西区', '3', 'TXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2087', '246', '立山区', '3', 'LSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2088', '246', '千山区', '3', 'QSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2089', '246', '岫岩', '3', 'Y',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2090', '246', '海城市', '3', 'HCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2091', '246', '台安县', '3', 'TAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2092', '247', '本溪', '3', 'BX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2093', '247', '平山区', '3', 'PSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2094', '247', '明山区', '3', 'MSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2095', '247', '溪湖区', '3', 'XHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2096', '247', '南芬区', '3', 'NFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2097', '247', '桓仁', '3', 'HR',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2098', '248', '双塔区', '3', 'STQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2099', '248', '龙城区', '3', 'LCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2100', '248', '喀喇沁左翼蒙古族自治县', '3', 'KLQZYMGZZZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2101', '248', '北票市', '3', 'BPS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2102', '248', '凌源市', '3', 'LYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2103', '248', '朝阳县', '3', 'CYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2104', '248', '建平县', '3', 'JPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2105', '249', '振兴区', '3', 'ZXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2106', '249', '元宝区', '3', 'YBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2107', '249', '振安区', '3', 'ZAQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2108', '249', '宽甸', '3', 'KD',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2109', '249', '东港市', '3', 'DGS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2110', '249', '凤城市', '3', 'FCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2111', '250', '顺城区', '3', 'SCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2112', '250', '新抚区', '3', 'XFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2113', '250', '东洲区', '3', 'DZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2114', '250', '望花区', '3', 'WHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2115', '250', '清原', '3', 'QY',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2116', '250', '新宾', '3', 'XB',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2117', '250', '抚顺县', '3', 'FSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2118', '251', '阜新', '3', 'FX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2119', '251', '海州区', '3', 'HZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2120', '251', '新邱区', '3', 'XQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2121', '251', '太平区', '3', 'TPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2122', '251', '清河门区', '3', 'QHMQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2123', '251', '细河区', '3', 'XHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2124', '251', '彰武县', '3', 'ZWX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2125', '252', '龙港区', '3', 'LGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2126', '252', '南票区', '3', 'NPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2127', '252', '连山区', '3', 'LSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2128', '252', '兴城市', '3', 'XCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2129', '252', '绥中县', '3', 'SZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2130', '252', '建昌县', '3', 'JCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2131', '253', '太和区', '3', 'THQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2132', '253', '古塔区', '3', 'GTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2133', '253', '凌河区', '3', 'LHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2134', '253', '凌海市', '3', 'LHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2135', '253', '北镇市', '3', 'BZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2136', '253', '黑山县', '3', 'HSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2137', '253', '义县', '3', 'YX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2138', '254', '白塔区', '3', 'BTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2139', '254', '文圣区', '3', 'WSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2140', '254', '宏伟区', '3', 'HWQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2141', '254', '太子河区', '3', 'TZHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2142', '254', '弓长岭区', '3', 'GCLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2143', '254', '灯塔市', '3', 'DTS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2144', '254', '辽阳县', '3', 'LYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2145', '255', '双台子区', '3', 'STZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2146', '255', '兴隆台区', '3', 'XLTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2147', '255', '大洼县', '3', 'DWX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2148', '255', '盘山县', '3', 'PSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2149', '256', '银州区', '3', 'YZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2150', '256', '清河区', '3', 'QHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2151', '256', '调兵山市', '3', 'DBSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2152', '256', '开原市', '3', 'KYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2153', '256', '铁岭县', '3', 'TLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2154', '256', '西丰县', '3', 'XFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2155', '256', '昌图县', '3', 'CTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2156', '257', '站前区', '3', 'ZQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2157', '257', '西市区', '3', 'XSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2158', '257', '鲅鱼圈区', '3', 'YQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2159', '257', '老边区', '3', 'LBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2160', '257', '盖州市', '3', 'GZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2161', '257', '大石桥市', '3', 'DSQS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2162', '258', '回民区', '3', 'HMQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2163', '258', '玉泉区', '3', 'YQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2164', '258', '新城区', '3', 'XCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2165', '258', '赛罕区', '3', 'SHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2166', '258', '清水河县', '3', 'QSHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2167', '258', '土默特左旗', '3', 'TMTZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2168', '258', '托克托县', '3', 'TKTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2169', '258', '和林格尔县', '3', 'HLGEX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2170', '258', '武川县', '3', 'WCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2171', '259', '阿拉善左旗', '3', 'ALSZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2172', '259', '阿拉善右旗', '3', 'ALSYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2173', '259', '额济纳旗', '3', 'EJNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2174', '260', '临河区', '3', 'LHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2175', '260', '五原县', '3', 'WYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2176', '260', '磴口县', '3', 'KX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2177', '260', '乌拉特前旗', '3', 'WLTQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2178', '260', '乌拉特中旗', '3', 'WLTZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2179', '260', '乌拉特后旗', '3', 'WLTHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2180', '260', '杭锦后旗', '3', 'HJHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2181', '261', '昆都仑区', '3', 'KDLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2182', '261', '青山区', '3', 'QSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2183', '261', '东河区', '3', 'DHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2184', '261', '九原区', '3', 'JYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2185', '261', '石拐区', '3', 'SGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2186', '261', '白云矿区', '3', 'BYKQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2187', '261', '土默特右旗', '3', 'TMTYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2188', '261', '固阳县', '3', 'GYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2189', '261', '达尔罕茂明安联合旗', '3', 'DEHMMALHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2190', '262', '红山区', '3', 'HSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2191', '262', '元宝山区', '3', 'YBSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2192', '262', '松山区', '3', 'SSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2193', '262', '阿鲁科尔沁旗', '3', 'ALKEQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2194', '262', '巴林左旗', '3', 'BLZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2195', '262', '巴林右旗', '3', 'BLYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2196', '262', '林西县', '3', 'LXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2197', '262', '克什克腾旗', '3', 'KSKTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2198', '262', '翁牛特旗', '3', 'WNTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2199', '262', '喀喇沁旗', '3', 'KLQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2200', '262', '宁城县', '3', 'NCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2201', '262', '敖汉旗', '3', 'AHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2202', '263', '东胜区', '3', 'DSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2203', '263', '达拉特旗', '3', 'DLTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2204', '263', '准格尔旗', '3', 'ZGEQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2205', '263', '鄂托克前旗', '3', 'ETKQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2206', '263', '鄂托克旗', '3', 'ETKQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2207', '263', '杭锦旗', '3', 'HJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2208', '263', '乌审旗', '3', 'WSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2209', '263', '伊金霍洛旗', '3', 'YJHLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2210', '264', '海拉尔区', '3', 'HLEQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2211', '264', '莫力达瓦', '3', 'MLDW',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2212', '264', '满洲里市', '3', 'MZLS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2213', '264', '牙克石市', '3', 'YKSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2214', '264', '扎兰屯市', '3', 'ZLTS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2215', '264', '额尔古纳市', '3', 'EEGNS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2216', '264', '根河市', '3', 'GHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2217', '264', '阿荣旗', '3', 'ARQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2218', '264', '鄂伦春自治旗', '3', 'ELCZZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2219', '264', '鄂温克族自治旗', '3', 'EWKZZZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2220', '264', '陈巴尔虎旗', '3', 'CBEHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2221', '264', '新巴尔虎左旗', '3', 'XBEHZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2222', '264', '新巴尔虎右旗', '3', 'XBEHYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2223', '265', '科尔沁区', '3', 'KEQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2224', '265', '霍林郭勒市', '3', 'HLGLS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2225', '265', '科尔沁左翼中旗', '3', 'KEQZYZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2226', '265', '科尔沁左翼后旗', '3', 'KEQZYHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2227', '265', '开鲁县', '3', 'KLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2228', '265', '库伦旗', '3', 'KLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2229', '265', '奈曼旗', '3', 'NMQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2230', '265', '扎鲁特旗', '3', 'ZLTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2231', '266', '海勃湾区', '3', 'HBWQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2232', '266', '乌达区', '3', 'WDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2233', '266', '海南区', '3', 'HNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2234', '267', '化德县', '3', 'HDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2235', '267', '集宁区', '3', 'JNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2236', '267', '丰镇市', '3', 'FZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2237', '267', '卓资县', '3', 'ZZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2238', '267', '商都县', '3', 'SDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2239', '267', '兴和县', '3', 'XHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2240', '267', '凉城县', '3', 'LCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2241', '267', '察哈尔右翼前旗', '3', 'CHEYYQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2242', '267', '察哈尔右翼中旗', '3', 'CHEYYZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2243', '267', '察哈尔右翼后旗', '3', 'CHEYYHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2244', '267', '四子王旗', '3', 'SZWQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2245', '268', '二连浩特市', '3', 'ELHTS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2246', '268', '锡林浩特市', '3', 'XLHTS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2247', '268', '阿巴嘎旗', '3', 'ABGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2248', '268', '苏尼特左旗', '3', 'SNTZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2249', '268', '苏尼特右旗', '3', 'SNTYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2250', '268', '东乌珠穆沁旗', '3', 'DWZMQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2251', '268', '西乌珠穆沁旗', '3', 'XWZMQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2252', '268', '太仆寺旗', '3', 'TPSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2253', '268', '镶黄旗', '3', 'XHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2254', '268', '正镶白旗', '3', 'ZXBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2255', '268', '正蓝旗', '3', 'ZLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2256', '268', '多伦县', '3', 'DLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2257', '269', '乌兰浩特市', '3', 'WLHTS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2258', '269', '阿尔山市', '3', 'AESS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2259', '269', '科尔沁右翼前旗', '3', 'KEQYYQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2260', '269', '科尔沁右翼中旗', '3', 'KEQYYZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2261', '269', '扎赉特旗', '3', 'ZTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2262', '269', '突泉县', '3', 'TQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2263', '270', '西夏区', '3', 'XXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2264', '270', '金凤区', '3', 'JFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2265', '270', '兴庆区', '3', 'XQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2266', '270', '灵武市', '3', 'LWS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2267', '270', '永宁县', '3', 'YNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2268', '270', '贺兰县', '3', 'HLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2269', '271', '原州区', '3', 'YZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2270', '271', '海原县', '3', 'HYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2271', '271', '西吉县', '3', 'XJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2272', '271', '隆德县', '3', 'LDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2273', '271', '泾源县', '3', 'YX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2274', '271', '彭阳县', '3', 'PYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2275', '272', '惠农县', '3', 'HNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2276', '272', '大武口区', '3', 'DWKQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2277', '272', '惠农区', '3', 'HNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2278', '272', '陶乐县', '3', 'TLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2279', '272', '平罗县', '3', 'PLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2280', '273', '利通区', '3', 'LTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2281', '273', '中卫县', '3', 'ZWX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2282', '273', '青铜峡市', '3', 'QTXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2283', '273', '中宁县', '3', 'ZNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2284', '273', '盐池县', '3', 'YCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2285', '273', '同心县', '3', 'TXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2286', '274', '沙坡头区', '3', 'SPTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2287', '274', '海原县', '3', 'HYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2288', '274', '中宁县', '3', 'ZNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2289', '275', '城中区', '3', 'CZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2290', '275', '城东区', '3', 'CDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2291', '275', '城西区', '3', 'CXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2292', '275', '城北区', '3', 'CBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2293', '275', '湟中县', '3', 'ZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2294', '275', '湟源县', '3', 'YX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2295', '275', '大通', '3', 'DT',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2296', '276', '玛沁县', '3', 'MQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2297', '276', '班玛县', '3', 'BMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2298', '276', '甘德县', '3', 'GDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2299', '276', '达日县', '3', 'DRX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2300', '276', '久治县', '3', 'JZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2301', '276', '玛多县', '3', 'MDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2302', '277', '海晏县', '3', 'HX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2303', '277', '祁连县', '3', 'QLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2304', '277', '刚察县', '3', 'GCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2305', '277', '门源', '3', 'MY',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2306', '278', '平安县', '3', 'PAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2307', '278', '乐都县', '3', 'LDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2308', '278', '民和', '3', 'MH',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2309', '278', '互助', '3', 'HZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2310', '278', '化隆', '3', 'HL',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2311', '278', '循化', '3', 'XH',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2312', '279', '共和县', '3', 'GHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2313', '279', '同德县', '3', 'TDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2314', '279', '贵德县', '3', 'GDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2315', '279', '兴海县', '3', 'XHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2316', '279', '贵南县', '3', 'GNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2317', '280', '德令哈市', '3', 'DLHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2318', '280', '格尔木市', '3', 'GEMS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2319', '280', '乌兰县', '3', 'WLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2320', '280', '都兰县', '3', 'DLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2321', '280', '天峻县', '3', 'TJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2322', '281', '同仁县', '3', 'TRX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2323', '281', '尖扎县', '3', 'JZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2324', '281', '泽库县', '3', 'ZKX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2325', '281', '河南蒙古族自治县', '3', 'HNMGZZZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2326', '282', '玉树县', '3', 'YSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2327', '282', '杂多县', '3', 'ZDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2328', '282', '称多县', '3', 'CDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2329', '282', '治多县', '3', 'ZDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2330', '282', '囊谦县', '3', 'NQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2331', '282', '曲麻莱县', '3', 'QMLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2332', '283', '市中区', '3', 'SZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2333', '283', '历下区', '3', 'LXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2334', '283', '天桥区', '3', 'TQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2335', '283', '槐荫区', '3', 'HYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2336', '283', '历城区', '3', 'LCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2337', '283', '长清区', '3', 'CQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2338', '283', '章丘市', '3', 'ZQS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2339', '283', '平阴县', '3', 'PYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2340', '283', '济阳县', '3', 'JYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2341', '283', '商河县', '3', 'SHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2342', '284', '市南区', '3', 'SNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2343', '284', '市北区', '3', 'SBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2344', '284', '城阳区', '3', 'CYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2345', '284', '四方区', '3', 'SFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2346', '284', '李沧区', '3', 'LCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2347', '284', '黄岛区', '3', 'HDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2348', '284', '崂山区', '3', 'SQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2349', '284', '胶州市', '3', 'JZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2350', '284', '即墨市', '3', 'JMS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2351', '284', '平度市', '3', 'PDS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2352', '284', '胶南市', '3', 'JNS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2353', '284', '莱西市', '3', 'LXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2354', '285', '滨城区', '3', 'BCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2355', '285', '惠民县', '3', 'HMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2356', '285', '阳信县', '3', 'YXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2357', '285', '无棣县', '3', 'WX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2358', '285', '沾化县', '3', 'ZHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2359', '285', '博兴县', '3', 'BXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2360', '285', '邹平县', '3', 'ZPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2361', '286', '德城区', '3', 'DCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2362', '286', '陵县', '3', 'LX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2363', '286', '乐陵市', '3', 'LLS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2364', '286', '禹城市', '3', 'YCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2365', '286', '宁津县', '3', 'NJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2366', '286', '庆云县', '3', 'QYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2367', '286', '临邑县', '3', 'LYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2368', '286', '齐河县', '3', 'QHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2369', '286', '平原县', '3', 'PYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2370', '286', '夏津县', '3', 'XJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2371', '286', '武城县', '3', 'WCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2372', '287', '东营区', '3', 'DYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2373', '287', '河口区', '3', 'HKQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2374', '287', '垦利县', '3', 'KLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2375', '287', '利津县', '3', 'LJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2376', '287', '广饶县', '3', 'GRX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2377', '288', '牡丹区', '3', 'MDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2378', '288', '曹县', '3', 'CX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2379', '288', '单县', '3', 'DX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2380', '288', '成武县', '3', 'CWX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2381', '288', '巨野县', '3', 'JYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2382', '288', '郓城县', '3', 'CX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2383', '288', '鄄城县', '3', 'CX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2384', '288', '定陶县', '3', 'DTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2385', '288', '东明县', '3', 'DMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2386', '289', '市中区', '3', 'SZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2387', '289', '任城区', '3', 'RCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2388', '289', '曲阜市', '3', 'QFS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2389', '289', '兖州市', '3', 'ZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2390', '289', '邹城市', '3', 'ZCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2391', '289', '微山县', '3', 'WSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2392', '289', '鱼台县', '3', 'YTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2393', '289', '金乡县', '3', 'JXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2394', '289', '嘉祥县', '3', 'JXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2395', '289', '汶上县', '3', 'SX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2396', '289', '泗水县', '3', 'SX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2397', '289', '梁山县', '3', 'LSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2398', '290', '莱城区', '3', 'LCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2399', '290', '钢城区', '3', 'GCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2400', '291', '东昌府区', '3', 'DCFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2401', '291', '临清市', '3', 'LQS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2402', '291', '阳谷县', '3', 'YGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2403', '291', '莘县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2404', '291', '茌平县', '3', 'PX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2405', '291', '东阿县', '3', 'DAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2406', '291', '冠县', '3', 'GX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2407', '291', '高唐县', '3', 'GTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2408', '292', '兰山区', '3', 'LSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2409', '292', '罗庄区', '3', 'LZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2410', '292', '河东区', '3', 'HDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2411', '292', '沂南县', '3', 'YNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2412', '292', '郯城县', '3', 'CX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2413', '292', '沂水县', '3', 'YSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2414', '292', '苍山县', '3', 'CSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2415', '292', '费县', '3', 'FX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2416', '292', '平邑县', '3', 'PYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2417', '292', '莒南县', '3', 'NX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2418', '292', '蒙阴县', '3', 'MYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2419', '292', '临沭县', '3', 'LX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2420', '293', '东港区', '3', 'DGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2421', '293', '岚山区', '3', 'SQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2422', '293', '五莲县', '3', 'WLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2423', '293', '莒县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2424', '294', '泰山区', '3', 'TSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2425', '294', '岱岳区', '3', 'YQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2426', '294', '新泰市', '3', 'XTS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2427', '294', '肥城市', '3', 'FCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2428', '294', '宁阳县', '3', 'NYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2429', '294', '东平县', '3', 'DPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2430', '295', '荣成市', '3', 'RCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2431', '295', '乳山市', '3', 'RSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2432', '295', '环翠区', '3', 'HCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2433', '295', '文登市', '3', 'WDS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2434', '296', '潍城区', '3', 'WCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2435', '296', '寒亭区', '3', 'HTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2436', '296', '坊子区', '3', 'FZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2437', '296', '奎文区', '3', 'KWQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2438', '296', '青州市', '3', 'QZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2439', '296', '诸城市', '3', 'ZCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2440', '296', '寿光市', '3', 'SGS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2441', '296', '安丘市', '3', 'AQS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2442', '296', '高密市', '3', 'GMS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2443', '296', '昌邑市', '3', 'CYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2444', '296', '临朐县', '3', 'LX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2445', '296', '昌乐县', '3', 'CLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2446', '297', '芝罘区', '3', 'ZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2447', '297', '福山区', '3', 'FSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2448', '297', '牟平区', '3', 'MPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2449', '297', '莱山区', '3', 'LSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2450', '297', '开发区', '3', 'KFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2451', '297', '龙口市', '3', 'LKS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2452', '297', '莱阳市', '3', 'LYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2453', '297', '莱州市', '3', 'LZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2454', '297', '蓬莱市', '3', 'PLS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2455', '297', '招远市', '3', 'ZYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2456', '297', '栖霞市', '3', 'QXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2457', '297', '海阳市', '3', 'HYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2458', '297', '长岛县', '3', 'CDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2459', '298', '市中区', '3', 'SZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2460', '298', '山亭区', '3', 'STQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2461', '298', '峄城区', '3', 'CQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2462', '298', '台儿庄区', '3', 'TEZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2463', '298', '薛城区', '3', 'XCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2464', '298', '滕州市', '3', 'ZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2465', '299', '张店区', '3', 'ZDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2466', '299', '临淄区', '3', 'LZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2467', '299', '淄川区', '3', 'ZCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2468', '299', '博山区', '3', 'BSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2469', '299', '周村区', '3', 'ZCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2470', '299', '桓台县', '3', 'HTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2471', '299', '高青县', '3', 'GQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2472', '299', '沂源县', '3', 'YYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2473', '300', '杏花岭区', '3', 'XHLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2474', '300', '小店区', '3', 'XDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2475', '300', '迎泽区', '3', 'YZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2476', '300', '尖草坪区', '3', 'JCPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2477', '300', '万柏林区', '3', 'WBLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2478', '300', '晋源区', '3', 'JYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2479', '300', '高新开发区', '3', 'GXKFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2480', '300', '民营经济开发区', '3', 'MYJJKFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2481', '300', '经济技术开发区', '3', 'JJJSKFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2482', '300', '清徐县', '3', 'QXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2483', '300', '阳曲县', '3', 'YQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2484', '300', '娄烦县', '3', 'LFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2485', '300', '古交市', '3', 'GJS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2486', '301', '城区', '3', 'CQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2487', '301', '郊区', '3', 'JQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2488', '301', '沁县', '3', 'QX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2489', '301', '潞城市', '3', 'LCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2490', '301', '长治县', '3', 'CZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2491', '301', '襄垣县', '3', 'XYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2492', '301', '屯留县', '3', 'TLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2493', '301', '平顺县', '3', 'PSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2494', '301', '黎城县', '3', 'LCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2495', '301', '壶关县', '3', 'HGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2496', '301', '长子县', '3', 'CZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2497', '301', '武乡县', '3', 'WXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2498', '301', '沁源县', '3', 'QYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2499', '302', '城区', '3', 'CQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2500', '302', '矿区', '3', 'KQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2501', '302', '南郊区', '3', 'NJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2502', '302', '新荣区', '3', 'XRQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2503', '302', '阳高县', '3', 'YGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2504', '302', '天镇县', '3', 'TZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2505', '302', '广灵县', '3', 'GLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2506', '302', '灵丘县', '3', 'LQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2507', '302', '浑源县', '3', 'HYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2508', '302', '左云县', '3', 'ZYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2509', '302', '大同县', '3', 'DTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2510', '303', '城区', '3', 'CQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2511', '303', '高平市', '3', 'GPS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2512', '303', '沁水县', '3', 'QSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2513', '303', '阳城县', '3', 'YCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2514', '303', '陵川县', '3', 'LCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2515', '303', '泽州县', '3', 'ZZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2516', '304', '榆次区', '3', 'YCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2517', '304', '介休市', '3', 'JXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2518', '304', '榆社县', '3', 'YSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2519', '304', '左权县', '3', 'ZQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2520', '304', '和顺县', '3', 'HSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2521', '304', '昔阳县', '3', 'XYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2522', '304', '寿阳县', '3', 'SYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2523', '304', '太谷县', '3', 'TGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2524', '304', '祁县', '3', 'QX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2525', '304', '平遥县', '3', 'PYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2526', '304', '灵石县', '3', 'LSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2527', '305', '尧都区', '3', 'YDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2528', '305', '侯马市', '3', 'HMS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2529', '305', '霍州市', '3', 'HZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2530', '305', '曲沃县', '3', 'QWX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2531', '305', '翼城县', '3', 'YCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2532', '305', '襄汾县', '3', 'XFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2533', '305', '洪洞县', '3', 'HDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2534', '305', '吉县', '3', 'JX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2535', '305', '安泽县', '3', 'AZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2536', '305', '浮山县', '3', 'FSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2537', '305', '古县', '3', 'GX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2538', '305', '乡宁县', '3', 'XNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2539', '305', '大宁县', '3', 'DNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2540', '305', '隰县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2541', '305', '永和县', '3', 'YHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2542', '305', '蒲县', '3', 'PX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2543', '305', '汾西县', '3', 'FXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2544', '306', '离石市', '3', 'LSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2545', '306', '离石区', '3', 'LSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2546', '306', '孝义市', '3', 'XYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2547', '306', '汾阳市', '3', 'FYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2548', '306', '文水县', '3', 'WSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2549', '306', '交城县', '3', 'JCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2550', '306', '兴县', '3', 'XX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2551', '306', '临县', '3', 'LX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2552', '306', '柳林县', '3', 'LLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2553', '306', '石楼县', '3', 'SLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2554', '306', '岚县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2555', '306', '方山县', '3', 'FSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2556', '306', '中阳县', '3', 'ZYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2557', '306', '交口县', '3', 'JKX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2558', '307', '朔城区', '3', 'SCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2559', '307', '平鲁区', '3', 'PLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2560', '307', '山阴县', '3', 'SYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2561', '307', '应县', '3', 'YX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2562', '307', '右玉县', '3', 'YYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2563', '307', '怀仁县', '3', 'HRX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2564', '308', '忻府区', '3', 'XFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2565', '308', '原平市', '3', 'YPS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2566', '308', '定襄县', '3', 'DXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2567', '308', '五台县', '3', 'WTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2568', '308', '代县', '3', 'DX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2569', '308', '繁峙县', '3', 'FZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2570', '308', '宁武县', '3', 'NWX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2571', '308', '静乐县', '3', 'JLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2572', '308', '神池县', '3', 'SCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2573', '308', '五寨县', '3', 'WZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2574', '308', '岢岚县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2575', '308', '河曲县', '3', 'HQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2576', '308', '保德县', '3', 'BDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2577', '308', '偏关县', '3', 'PGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2578', '309', '城区', '3', 'CQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2579', '309', '矿区', '3', 'KQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2580', '309', '郊区', '3', 'JQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2581', '309', '平定县', '3', 'PDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2582', '309', '盂县', '3', 'YX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2583', '310', '盐湖区', '3', 'YHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2584', '310', '永济市', '3', 'YJS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2585', '310', '河津市', '3', 'HJS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2586', '310', '临猗县', '3', 'LX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2587', '310', '万荣县', '3', 'WRX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2588', '310', '闻喜县', '3', 'WXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2589', '310', '稷山县', '3', 'SX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2590', '310', '新绛县', '3', 'XX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2591', '310', '绛县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2592', '310', '垣曲县', '3', 'YQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2593', '310', '夏县', '3', 'XX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2594', '310', '平陆县', '3', 'PLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2595', '310', '芮城县', '3', 'CX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2596', '311', '莲湖区', '3', 'LHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2597', '311', '新城区', '3', 'XCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2598', '311', '碑林区', '3', 'BLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2599', '311', '雁塔区', '3', 'YTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2600', '311', '灞桥区', '3', 'QQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2601', '311', '未央区', '3', 'WYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2602', '311', '阎良区', '3', 'YLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2603', '311', '临潼区', '3', 'LQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2604', '311', '长安区', '3', 'CAQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2605', '311', '蓝田县', '3', 'LTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2606', '311', '周至县', '3', 'ZZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2607', '311', '户县', '3', 'HX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2608', '311', '高陵县', '3', 'GLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2609', '312', '汉滨区', '3', 'HBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2610', '312', '汉阴县', '3', 'HYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2611', '312', '石泉县', '3', 'SQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2612', '312', '宁陕县', '3', 'NSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2613', '312', '紫阳县', '3', 'ZYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2614', '312', '岚皋县', '3', 'GX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2615', '312', '平利县', '3', 'PLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2616', '312', '镇坪县', '3', 'ZPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2617', '312', '旬阳县', '3', 'XYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2618', '312', '白河县', '3', 'BHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2619', '313', '陈仓区', '3', 'CCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2620', '313', '渭滨区', '3', 'WBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2621', '313', '金台区', '3', 'JTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2622', '313', '凤翔县', '3', 'FXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2623', '313', '岐山县', '3', 'SX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2624', '313', '扶风县', '3', 'FFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2625', '313', '眉县', '3', 'MX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2626', '313', '陇县', '3', 'LX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2627', '313', '千阳县', '3', 'QYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2628', '313', '麟游县', '3', 'YX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2629', '313', '凤县', '3', 'FX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2630', '313', '太白县', '3', 'TBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2631', '314', '汉台区', '3', 'HTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2632', '314', '南郑县', '3', 'NZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2633', '314', '城固县', '3', 'CGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2634', '314', '洋县', '3', 'YX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2635', '314', '西乡县', '3', 'XXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2636', '314', '勉县', '3', 'MX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2637', '314', '宁强县', '3', 'NQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2638', '314', '略阳县', '3', 'LYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2639', '314', '镇巴县', '3', 'ZBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2640', '314', '留坝县', '3', 'LBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2641', '314', '佛坪县', '3', 'FPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2642', '315', '商州区', '3', 'SZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2643', '315', '洛南县', '3', 'LNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2644', '315', '丹凤县', '3', 'DFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2645', '315', '商南县', '3', 'SNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2646', '315', '山阳县', '3', 'SYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2647', '315', '镇安县', '3', 'ZAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2648', '315', '柞水县', '3', 'ZSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2649', '316', '耀州区', '3', 'YZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2650', '316', '王益区', '3', 'WYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2651', '316', '印台区', '3', 'YTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2652', '316', '宜君县', '3', 'YJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2653', '317', '临渭区', '3', 'LWQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2654', '317', '韩城市', '3', 'HCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2655', '317', '华阴市', '3', 'HYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2656', '317', '华县', '3', 'HX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2657', '317', '潼关县', '3', 'GX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2658', '317', '大荔县', '3', 'DLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2659', '317', '合阳县', '3', 'HYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2660', '317', '澄城县', '3', 'CCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2661', '317', '蒲城县', '3', 'PCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2662', '317', '白水县', '3', 'BSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2663', '317', '富平县', '3', 'FPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2664', '318', '秦都区', '3', 'QDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2665', '318', '渭城区', '3', 'WCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2666', '318', '杨陵区', '3', 'YLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2667', '318', '兴平市', '3', 'XPS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2668', '318', '三原县', '3', 'SYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2669', '318', '泾阳县', '3', 'YX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2670', '318', '乾县', '3', 'QX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2671', '318', '礼泉县', '3', 'LQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2672', '318', '永寿县', '3', 'YSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2673', '318', '彬县', '3', 'BX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2674', '318', '长武县', '3', 'CWX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2675', '318', '旬邑县', '3', 'XYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2676', '318', '淳化县', '3', 'CHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2677', '318', '武功县', '3', 'WGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2678', '319', '吴起县', '3', 'WQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2679', '319', '宝塔区', '3', 'BTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2680', '319', '延长县', '3', 'YCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2681', '319', '延川县', '3', 'YCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2682', '319', '子长县', '3', 'ZCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2683', '319', '安塞县', '3', 'ASX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2684', '319', '志丹县', '3', 'ZDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2685', '319', '甘泉县', '3', 'GQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2686', '319', '富县', '3', 'FX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2687', '319', '洛川县', '3', 'LCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2688', '319', '宜川县', '3', 'YCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2689', '319', '黄龙县', '3', 'HLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2690', '319', '黄陵县', '3', 'HLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2691', '320', '榆阳区', '3', 'YYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2692', '320', '神木县', '3', 'SMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2693', '320', '府谷县', '3', 'FGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2694', '320', '横山县', '3', 'HSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2695', '320', '靖边县', '3', 'JBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2696', '320', '定边县', '3', 'DBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2697', '320', '绥德县', '3', 'SDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2698', '320', '米脂县', '3', 'MZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2699', '320', '佳县', '3', 'JX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2700', '320', '吴堡县', '3', 'WBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2701', '320', '清涧县', '3', 'QJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2702', '320', '子洲县', '3', 'ZZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2703', '321', '长宁区', '3', 'CNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2704', '321', '闸北区', '3', 'ZBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2705', '321', '闵行区', '3', 'XQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2706', '321', '徐汇区', '3', 'XHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2707', '321', '浦东新区', '3', 'PDXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2708', '321', '杨浦区', '3', 'YPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2709', '321', '普陀区', '3', 'PTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2710', '321', '静安区', '3', 'JAQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2711', '321', '卢湾区', '3', 'LWQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2712', '321', '虹口区', '3', 'HKQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2713', '321', '黄浦区', '3', 'HPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2714', '321', '南汇区', '3', 'NHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2715', '321', '松江区', '3', 'SJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2716', '321', '嘉定区', '3', 'JDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2717', '321', '宝山区', '3', 'BSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2718', '321', '青浦区', '3', 'QPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2719', '321', '金山区', '3', 'JSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2720', '321', '奉贤区', '3', 'FXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2721', '321', '崇明县', '3', 'CMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2722', '322', '青羊区', '3', 'QYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2723', '322', '锦江区', '3', 'JJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2724', '322', '金牛区', '3', 'JNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2725', '322', '武侯区', '3', 'WHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2726', '322', '成华区', '3', 'CHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2727', '322', '龙泉驿区', '3', 'LQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2728', '322', '青白江区', '3', 'QBJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2729', '322', '新都区', '3', 'XDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2730', '322', '温江区', '3', 'WJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2731', '322', '高新区', '3', 'GXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2732', '322', '高新西区', '3', 'GXXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2733', '322', '都江堰市', '3', 'DJYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2734', '322', '彭州市', '3', 'PZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2735', '322', '邛崃市', '3', 'S',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2736', '322', '崇州市', '3', 'CZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2737', '322', '金堂县', '3', 'JTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2738', '322', '双流县', '3', 'SLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2739', '322', '郫县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2740', '322', '大邑县', '3', 'DYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2741', '322', '蒲江县', '3', 'PJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2742', '322', '新津县', '3', 'XJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2743', '322', '都江堰市', '3', 'DJYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2744', '322', '彭州市', '3', 'PZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2745', '322', '邛崃市', '3', 'S',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2746', '322', '崇州市', '3', 'CZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2747', '322', '金堂县', '3', 'JTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2748', '322', '双流县', '3', 'SLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2749', '322', '郫县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2750', '322', '大邑县', '3', 'DYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2751', '322', '蒲江县', '3', 'PJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2752', '322', '新津县', '3', 'XJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2753', '323', '涪城区', '3', 'FCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2754', '323', '游仙区', '3', 'YXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2755', '323', '江油市', '3', 'JYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2756', '323', '盐亭县', '3', 'YTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2757', '323', '三台县', '3', 'STX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2758', '323', '平武县', '3', 'PWX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2759', '323', '安县', '3', 'AX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2760', '323', '梓潼县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2761', '323', '北川县', '3', 'BCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2762', '324', '马尔康县', '3', 'MEKX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2763', '324', '汶川县', '3', 'CX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2764', '324', '理县', '3', 'LX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2765', '324', '茂县', '3', 'MX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2766', '324', '松潘县', '3', 'SPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2767', '324', '九寨沟县', '3', 'JZGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2768', '324', '金川县', '3', 'JCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2769', '324', '小金县', '3', 'XJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2770', '324', '黑水县', '3', 'HSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2771', '324', '壤塘县', '3', 'RTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2772', '324', '阿坝县', '3', 'ABX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2773', '324', '若尔盖县', '3', 'REGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2774', '324', '红原县', '3', 'HYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2775', '325', '巴州区', '3', 'BZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2776', '325', '通江县', '3', 'TJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2777', '325', '南江县', '3', 'NJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2778', '325', '平昌县', '3', 'PCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2779', '326', '通川区', '3', 'TCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2780', '326', '万源市', '3', 'WYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2781', '326', '达县', '3', 'DX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2782', '326', '宣汉县', '3', 'XHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2783', '326', '开江县', '3', 'KJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2784', '326', '大竹县', '3', 'DZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2785', '326', '渠县', '3', 'QX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2786', '327', '旌阳区', '3', 'YQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2787', '327', '广汉市', '3', 'GHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2788', '327', '什邡市', '3', 'SS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2789', '327', '绵竹市', '3', 'MZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2790', '327', '罗江县', '3', 'LJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2791', '327', '中江县', '3', 'ZJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2792', '328', '康定县', '3', 'KDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2793', '328', '丹巴县', '3', 'DBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2794', '328', '泸定县', '3', 'DX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2795', '328', '炉霍县', '3', 'LHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2796', '328', '九龙县', '3', 'JLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2797', '328', '甘孜县', '3', 'GZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2798', '328', '雅江县', '3', 'YJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2799', '328', '新龙县', '3', 'XLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2800', '328', '道孚县', '3', 'DX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2801', '328', '白玉县', '3', 'BYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2802', '328', '理塘县', '3', 'LTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2803', '328', '德格县', '3', 'DGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2804', '328', '乡城县', '3', 'XCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2805', '328', '石渠县', '3', 'SQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2806', '328', '稻城县', '3', 'DCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2807', '328', '色达县', '3', 'SDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2808', '328', '巴塘县', '3', 'BTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2809', '328', '得荣县', '3', 'DRX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2810', '329', '广安区', '3', 'GAQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2811', '329', '华蓥市', '3', 'HS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2812', '329', '岳池县', '3', 'YCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2813', '329', '武胜县', '3', 'WSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2814', '329', '邻水县', '3', 'LSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2815', '330', '利州区', '3', 'LZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2816', '330', '元坝区', '3', 'YBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2817', '330', '朝天区', '3', 'CTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2818', '330', '旺苍县', '3', 'WCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2819', '330', '青川县', '3', 'QCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2820', '330', '剑阁县', '3', 'JGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2821', '330', '苍溪县', '3', 'CXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2822', '331', '峨眉山市', '3', 'EMSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2823', '331', '乐山市', '3', 'LSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2824', '331', '犍为县', '3', 'WX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2825', '331', '井研县', '3', 'JYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2826', '331', '夹江县', '3', 'JJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2827', '331', '沐川县', '3', 'CX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2828', '331', '峨边', '3', 'EB',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2829', '331', '马边', '3', 'MB',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2830', '332', '西昌市', '3', 'XCS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2831', '332', '盐源县', '3', 'YYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2832', '332', '德昌县', '3', 'DCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2833', '332', '会理县', '3', 'HLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2834', '332', '会东县', '3', 'HDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2835', '332', '宁南县', '3', 'NNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2836', '332', '普格县', '3', 'PGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2837', '332', '布拖县', '3', 'BTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2838', '332', '金阳县', '3', 'JYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2839', '332', '昭觉县', '3', 'ZJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2840', '332', '喜德县', '3', 'XDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2841', '332', '冕宁县', '3', 'MNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2842', '332', '越西县', '3', 'YXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2843', '332', '甘洛县', '3', 'GLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2844', '332', '美姑县', '3', 'MGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2845', '332', '雷波县', '3', 'LBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2846', '332', '木里', '3', 'ML',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2847', '333', '东坡区', '3', 'DPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2848', '333', '仁寿县', '3', 'RSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2849', '333', '彭山县', '3', 'PSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2850', '333', '洪雅县', '3', 'HYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2851', '333', '丹棱县', '3', 'DLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2852', '333', '青神县', '3', 'QSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2853', '334', '阆中市', '3', 'ZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2854', '334', '南部县', '3', 'NBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2855', '334', '营山县', '3', 'YSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2856', '334', '蓬安县', '3', 'PAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2857', '334', '仪陇县', '3', 'YLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2858', '334', '顺庆区', '3', 'SQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2859', '334', '高坪区', '3', 'GPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2860', '334', '嘉陵区', '3', 'JLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2861', '334', '西充县', '3', 'XCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2862', '335', '市中区', '3', 'SZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2863', '335', '东兴区', '3', 'DXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2864', '335', '威远县', '3', 'WYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2865', '335', '资中县', '3', 'ZZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2866', '335', '隆昌县', '3', 'LCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2867', '336', '东  区', '3', 'D  Q',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2868', '336', '西  区', '3', 'X  Q',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2869', '336', '仁和区', '3', 'RHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2870', '336', '米易县', '3', 'MYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2871', '336', '盐边县', '3', 'YBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2872', '337', '船山区', '3', 'CSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2873', '337', '安居区', '3', 'AJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2874', '337', '蓬溪县', '3', 'PXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2875', '337', '射洪县', '3', 'SHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2876', '337', '大英县', '3', 'DYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2877', '338', '雨城区', '3', 'YCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2878', '338', '名山县', '3', 'MSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2879', '338', '荥经县', '3', 'JX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2880', '338', '汉源县', '3', 'HYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2881', '338', '石棉县', '3', 'SMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2882', '338', '天全县', '3', 'TQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2883', '338', '芦山县', '3', 'LSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2884', '338', '宝兴县', '3', 'BXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2885', '339', '翠屏区', '3', 'CPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2886', '339', '宜宾县', '3', 'YBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2887', '339', '南溪县', '3', 'NXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2888', '339', '江安县', '3', 'JAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2889', '339', '长宁县', '3', 'CNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2890', '339', '高县', '3', 'GX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2891', '339', '珙县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2892', '339', '筠连县', '3', 'LX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2893', '339', '兴文县', '3', 'XWX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2894', '339', '屏山县', '3', 'PSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2895', '340', '雁江区', '3', 'YJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2896', '340', '简阳市', '3', 'JYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2897', '340', '安岳县', '3', 'AYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2898', '340', '乐至县', '3', 'LZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2899', '341', '大安区', '3', 'DAQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2900', '341', '自流井区', '3', 'ZLJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2901', '341', '贡井区', '3', 'GJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2902', '341', '沿滩区', '3', 'YTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2903', '341', '荣县', '3', 'RX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2904', '341', '富顺县', '3', 'FSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2905', '342', '江阳区', '3', 'JYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2906', '342', '纳溪区', '3', 'NXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2907', '342', '龙马潭区', '3', 'LMTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2908', '342', '泸县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2909', '342', '合江县', '3', 'HJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2910', '342', '叙永县', '3', 'XYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2911', '342', '古蔺县', '3', 'GX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2912', '343', '和平区', '3', 'HPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2913', '343', '河西区', '3', 'HXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2914', '343', '南开区', '3', 'NKQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2915', '343', '河北区', '3', 'HBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2916', '343', '河东区', '3', 'HDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2917', '343', '红桥区', '3', 'HQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2918', '343', '东丽区', '3', 'DLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2919', '343', '津南区', '3', 'JNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2920', '343', '西青区', '3', 'XQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2921', '343', '北辰区', '3', 'BCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2922', '343', '塘沽区', '3', 'TGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2923', '343', '汉沽区', '3', 'HGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2924', '343', '大港区', '3', 'DGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2925', '343', '武清区', '3', 'WQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2926', '343', '宝坻区', '3', 'BQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2927', '343', '经济开发区', '3', 'JJKFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2928', '343', '宁河县', '3', 'NHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2929', '343', '静海县', '3', 'JHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2930', '343', '蓟县', '3', 'JX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2931', '344', '城关区', '3', 'CGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2932', '344', '林周县', '3', 'LZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2933', '344', '当雄县', '3', 'DXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2934', '344', '尼木县', '3', 'NMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2935', '344', '曲水县', '3', 'QSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2936', '344', '堆龙德庆县', '3', 'DLDQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2937', '344', '达孜县', '3', 'DZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2938', '344', '墨竹工卡县', '3', 'MZGKX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2939', '345', '噶尔县', '3', 'GEX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2940', '345', '普兰县', '3', 'PLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2941', '345', '札达县', '3', 'ZDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2942', '345', '日土县', '3', 'RTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2943', '345', '革吉县', '3', 'GJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2944', '345', '改则县', '3', 'GZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2945', '345', '措勤县', '3', 'CQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2946', '346', '昌都县', '3', 'CDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2947', '346', '江达县', '3', 'JDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2948', '346', '贡觉县', '3', 'GJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2949', '346', '类乌齐县', '3', 'LWQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2950', '346', '丁青县', '3', 'DQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2951', '346', '察雅县', '3', 'CYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2952', '346', '八宿县', '3', 'BSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2953', '346', '左贡县', '3', 'ZGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2954', '346', '芒康县', '3', 'MKX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2955', '346', '洛隆县', '3', 'LLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2956', '346', '边坝县', '3', 'BBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2957', '347', '林芝县', '3', 'LZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2958', '347', '工布江达县', '3', 'GBJDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2959', '347', '米林县', '3', 'MLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2960', '347', '墨脱县', '3', 'MTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2961', '347', '波密县', '3', 'BMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2962', '347', '察隅县', '3', 'CYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2963', '347', '朗县', '3', 'LX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2964', '348', '那曲县', '3', 'NQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2965', '348', '嘉黎县', '3', 'JLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2966', '348', '比如县', '3', 'BRX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2967', '348', '聂荣县', '3', 'NRX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2968', '348', '安多县', '3', 'ADX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2969', '348', '申扎县', '3', 'SZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2970', '348', '索县', '3', 'SX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2971', '348', '班戈县', '3', 'BGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2972', '348', '巴青县', '3', 'BQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2973', '348', '尼玛县', '3', 'NMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2974', '349', '日喀则市', '3', 'RKZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2975', '349', '南木林县', '3', 'NMLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2976', '349', '江孜县', '3', 'JZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2977', '349', '定日县', '3', 'DRX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2978', '349', '萨迦县', '3', 'SX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2979', '349', '拉孜县', '3', 'LZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2980', '349', '昂仁县', '3', 'ARX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2981', '349', '谢通门县', '3', 'XTMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2982', '349', '白朗县', '3', 'BLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2983', '349', '仁布县', '3', 'RBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2984', '349', '康马县', '3', 'KMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2985', '349', '定结县', '3', 'DJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2986', '349', '仲巴县', '3', 'ZBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2987', '349', '亚东县', '3', 'YDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2988', '349', '吉隆县', '3', 'JLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2989', '349', '聂拉木县', '3', 'NLMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2990', '349', '萨嘎县', '3', 'SGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2991', '349', '岗巴县', '3', 'GBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2992', '350', '乃东县', '3', 'NDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2993', '350', '扎囊县', '3', 'ZNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2994', '350', '贡嘎县', '3', 'GGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2995', '350', '桑日县', '3', 'SRX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2996', '350', '琼结县', '3', 'QJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2997', '350', '曲松县', '3', 'QSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2998', '350', '措美县', '3', 'CMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('2999', '350', '洛扎县', '3', 'LZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3000', '350', '加查县', '3', 'JCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3001', '350', '隆子县', '3', 'LZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3002', '350', '错那县', '3', 'CNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3003', '350', '浪卡子县', '3', 'LKZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3004', '351', '天山区', '3', 'TSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3005', '351', '沙依巴克区', '3', 'SYBKQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3006', '351', '新市区', '3', 'XSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3007', '351', '水磨沟区', '3', 'SMGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3008', '351', '头屯河区', '3', 'TTHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3009', '351', '达坂城区', '3', 'DCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3010', '351', '米东区', '3', 'MDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3011', '351', '乌鲁木齐县', '3', 'WLMQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3012', '352', '阿克苏市', '3', 'AKSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3013', '352', '温宿县', '3', 'WSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3014', '352', '库车县', '3', 'KCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3015', '352', '沙雅县', '3', 'SYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3016', '352', '新和县', '3', 'XHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3017', '352', '拜城县', '3', 'BCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3018', '352', '乌什县', '3', 'WSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3019', '352', '阿瓦提县', '3', 'AWTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3020', '352', '柯坪县', '3', 'KPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3021', '353', '阿拉尔市', '3', 'ALES',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3022', '354', '库尔勒市', '3', 'KELS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3023', '354', '轮台县', '3', 'LTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3024', '354', '尉犁县', '3', 'WLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3025', '354', '若羌县', '3', 'RQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3026', '354', '且末县', '3', 'QMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3027', '354', '焉耆', '3', 'Y',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3028', '354', '和静县', '3', 'HJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3029', '354', '和硕县', '3', 'HSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3030', '354', '博湖县', '3', 'BHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3031', '355', '博乐市', '3', 'BLS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3032', '355', '精河县', '3', 'JHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3033', '355', '温泉县', '3', 'WQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3034', '356', '呼图壁县', '3', 'HTBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3035', '356', '米泉市', '3', 'MQS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3036', '356', '昌吉市', '3', 'CJS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3037', '356', '阜康市', '3', 'FKS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3038', '356', '玛纳斯县', '3', 'MNSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3039', '356', '奇台县', '3', 'QTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3040', '356', '吉木萨尔县', '3', 'JMSEX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3041', '356', '木垒', '3', 'ML',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3042', '357', '哈密市', '3', 'HMS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3043', '357', '伊吾县', '3', 'YWX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3044', '357', '巴里坤', '3', 'BLK',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3045', '358', '和田市', '3', 'HTS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3046', '358', '和田县', '3', 'HTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3047', '358', '墨玉县', '3', 'MYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3048', '358', '皮山县', '3', 'PSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3049', '358', '洛浦县', '3', 'LPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3050', '358', '策勒县', '3', 'CLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3051', '358', '于田县', '3', 'YTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3052', '358', '民丰县', '3', 'MFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3053', '359', '喀什市', '3', 'KSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3054', '359', '疏附县', '3', 'SFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3055', '359', '疏勒县', '3', 'SLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3056', '359', '英吉沙县', '3', 'YJSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3057', '359', '泽普县', '3', 'ZPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3058', '359', '莎车县', '3', 'SCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3059', '359', '叶城县', '3', 'YCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3060', '359', '麦盖提县', '3', 'MGTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3061', '359', '岳普湖县', '3', 'YPHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3062', '359', '伽师县', '3', 'SX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3063', '359', '巴楚县', '3', 'BCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3064', '359', '塔什库尔干', '3', 'TSKEG',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3065', '360', '克拉玛依市', '3', 'KLMYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3066', '361', '阿图什市', '3', 'ATSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3067', '361', '阿克陶县', '3', 'AKTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3068', '361', '阿合奇县', '3', 'AHQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3069', '361', '乌恰县', '3', 'WQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3070', '362', '石河子市', '3', 'SHZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3071', '363', '图木舒克市', '3', 'TMSKS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3072', '364', '吐鲁番市', '3', 'TLFS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3073', '364', '鄯善县', '3', 'SX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3074', '364', '托克逊县', '3', 'TKXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3075', '365', '五家渠市', '3', 'WJQS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3076', '366', '阿勒泰市', '3', 'ALTS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3077', '366', '布克赛尔', '3', 'BKSE',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3078', '366', '伊宁市', '3', 'YNS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3079', '366', '布尔津县', '3', 'BEJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3080', '366', '奎屯市', '3', 'KTS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3081', '366', '乌苏市', '3', 'WSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3082', '366', '额敏县', '3', 'EMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3083', '366', '富蕴县', '3', 'FYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3084', '366', '伊宁县', '3', 'YNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3085', '366', '福海县', '3', 'FHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3086', '366', '霍城县', '3', 'HCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3087', '366', '沙湾县', '3', 'SWX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3088', '366', '巩留县', '3', 'GLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3089', '366', '哈巴河县', '3', 'HBHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3090', '366', '托里县', '3', 'TLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3091', '366', '青河县', '3', 'QHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3092', '366', '新源县', '3', 'XYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3093', '366', '裕民县', '3', 'YMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3094', '366', '和布克赛尔', '3', 'HBKSE',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3095', '366', '吉木乃县', '3', 'JMNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3096', '366', '昭苏县', '3', 'ZSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3097', '366', '特克斯县', '3', 'TKSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3098', '366', '尼勒克县', '3', 'NLKX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3099', '366', '察布查尔', '3', 'CBCE',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3100', '367', '盘龙区', '3', 'PLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3101', '367', '五华区', '3', 'WHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3102', '367', '官渡区', '3', 'GDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3103', '367', '西山区', '3', 'XSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3104', '367', '东川区', '3', 'DCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3105', '367', '安宁市', '3', 'ANS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3106', '367', '呈贡县', '3', 'CGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3107', '367', '晋宁县', '3', 'JNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3108', '367', '富民县', '3', 'FMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3109', '367', '宜良县', '3', 'YLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3110', '367', '嵩明县', '3', 'MX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3111', '367', '石林县', '3', 'SLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3112', '367', '禄劝', '3', 'LQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3113', '367', '寻甸', '3', 'XD',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3114', '368', '兰坪', '3', 'LP',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3115', '368', '泸水县', '3', 'SX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3116', '368', '福贡县', '3', 'FGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3117', '368', '贡山', '3', 'GS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3118', '369', '宁洱', '3', 'NE',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3119', '369', '思茅区', '3', 'SMQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3120', '369', '墨江', '3', 'MJ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3121', '369', '景东', '3', 'JD',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3122', '369', '景谷', '3', 'JG',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3123', '369', '镇沅', '3', 'Z',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3124', '369', '江城', '3', 'JC',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3125', '369', '孟连', '3', 'ML',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3126', '369', '澜沧', '3', 'LC',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3127', '369', '西盟', '3', 'XM',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3128', '370', '古城区', '3', 'GCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3129', '370', '宁蒗', '3', 'N',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3130', '370', '玉龙', '3', 'YL',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3131', '370', '永胜县', '3', 'YSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3132', '370', '华坪县', '3', 'HPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3133', '371', '隆阳区', '3', 'LYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3134', '371', '施甸县', '3', 'SDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3135', '371', '腾冲县', '3', 'TCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3136', '371', '龙陵县', '3', 'LLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3137', '371', '昌宁县', '3', 'CNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3138', '372', '楚雄市', '3', 'CXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3139', '372', '双柏县', '3', 'SBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3140', '372', '牟定县', '3', 'MDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3141', '372', '南华县', '3', 'NHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3142', '372', '姚安县', '3', 'YAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3143', '372', '大姚县', '3', 'DYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3144', '372', '永仁县', '3', 'YRX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3145', '372', '元谋县', '3', 'YMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3146', '372', '武定县', '3', 'WDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3147', '372', '禄丰县', '3', 'LFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3148', '373', '大理市', '3', 'DLS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3149', '373', '祥云县', '3', 'XYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3150', '373', '宾川县', '3', 'BCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3151', '373', '弥渡县', '3', 'MDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3152', '373', '永平县', '3', 'YPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3153', '373', '云龙县', '3', 'YLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3154', '373', '洱源县', '3', 'EYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3155', '373', '剑川县', '3', 'JCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3156', '373', '鹤庆县', '3', 'HQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3157', '373', '漾濞', '3', 'Y',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3158', '373', '南涧', '3', 'NJ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3159', '373', '巍山', '3', 'WS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3160', '374', '潞西市', '3', 'LXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3161', '374', '瑞丽市', '3', 'RLS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3162', '374', '梁河县', '3', 'LHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3163', '374', '盈江县', '3', 'YJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3164', '374', '陇川县', '3', 'LCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3165', '375', '香格里拉县', '3', 'XGLLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3166', '375', '德钦县', '3', 'DQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3167', '375', '维西', '3', 'WX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3168', '376', '泸西县', '3', 'XX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3169', '376', '蒙自县', '3', 'MZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3170', '376', '个旧市', '3', 'GJS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3171', '376', '开远市', '3', 'KYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3172', '376', '绿春县', '3', 'LCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3173', '376', '建水县', '3', 'JSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3174', '376', '石屏县', '3', 'SPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3175', '376', '弥勒县', '3', 'MLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3176', '376', '元阳县', '3', 'YYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3177', '376', '红河县', '3', 'HHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3178', '376', '金平', '3', 'JP',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3179', '376', '河口', '3', 'HK',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3180', '376', '屏边', '3', 'PB',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3181', '377', '临翔区', '3', 'LXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3182', '377', '凤庆县', '3', 'FQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3183', '377', '云县', '3', 'YX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3184', '377', '永德县', '3', 'YDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3185', '377', '镇康县', '3', 'ZKX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3186', '377', '双江', '3', 'SJ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3187', '377', '耿马', '3', 'GM',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3188', '377', '沧源', '3', 'CY',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3189', '378', '麒麟区', '3', 'Q',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3190', '378', '宣威市', '3', 'XWS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3191', '378', '马龙县', '3', 'MLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3192', '378', '陆良县', '3', 'LLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3193', '378', '师宗县', '3', 'SZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3194', '378', '罗平县', '3', 'LPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3195', '378', '富源县', '3', 'FYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3196', '378', '会泽县', '3', 'HZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3197', '378', '沾益县', '3', 'ZYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3198', '379', '文山县', '3', 'WSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3199', '379', '砚山县', '3', 'YSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3200', '379', '西畴县', '3', 'XCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3201', '379', '麻栗坡县', '3', 'MLPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3202', '379', '马关县', '3', 'MGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3203', '379', '丘北县', '3', 'QBX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3204', '379', '广南县', '3', 'GNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3205', '379', '富宁县', '3', 'FNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3206', '380', '景洪市', '3', 'JHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3207', '380', '勐海县', '3', 'HX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3208', '380', '勐腊县', '3', 'LX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3209', '381', '红塔区', '3', 'HTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3210', '381', '江川县', '3', 'JCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3211', '381', '澄江县', '3', 'CJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3212', '381', '通海县', '3', 'THX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3213', '381', '华宁县', '3', 'HNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3214', '381', '易门县', '3', 'YMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3215', '381', '峨山', '3', 'ES',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3216', '381', '新平', '3', 'XP',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3217', '381', '元江', '3', 'YJ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3218', '382', '昭阳区', '3', 'ZYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3219', '382', '鲁甸县', '3', 'LDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3220', '382', '巧家县', '3', 'QJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3221', '382', '盐津县', '3', 'YJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3222', '382', '大关县', '3', 'DGX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3223', '382', '永善县', '3', 'YSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3224', '382', '绥江县', '3', 'SJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3225', '382', '镇雄县', '3', 'ZXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3226', '382', '彝良县', '3', 'YLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3227', '382', '威信县', '3', 'WXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3228', '382', '水富县', '3', 'SFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3229', '383', '西湖区', '3', 'XHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3230', '383', '上城区', '3', 'SCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3231', '383', '下城区', '3', 'XCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3232', '383', '拱墅区', '3', 'GSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3233', '383', '滨江区', '3', 'BJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3234', '383', '江干区', '3', 'JGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3235', '383', '萧山区', '3', 'XSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3236', '383', '余杭区', '3', 'YHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3237', '383', '市郊', '3', 'SJ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3238', '383', '建德市', '3', 'JDS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3239', '383', '富阳市', '3', 'FYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3240', '383', '临安市', '3', 'LAS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3241', '383', '桐庐县', '3', 'TLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3242', '383', '淳安县', '3', 'CAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3243', '384', '吴兴区', '3', 'WXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3244', '384', '南浔区', '3', 'NQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3245', '384', '德清县', '3', 'DQX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3246', '384', '长兴县', '3', 'CXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3247', '384', '安吉县', '3', 'AJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3248', '385', '南湖区', '3', 'NHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3249', '385', '秀洲区', '3', 'XZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3250', '385', '海宁市', '3', 'HNS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3251', '385', '嘉善县', '3', 'JSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3252', '385', '平湖市', '3', 'PHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3253', '385', '桐乡市', '3', 'TXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3254', '385', '海盐县', '3', 'HYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3255', '386', '婺城区', '3', 'CQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3256', '386', '金东区', '3', 'JDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3257', '386', '兰溪市', '3', 'LXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3258', '386', '市区', '3', 'SQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3259', '386', '佛堂镇', '3', 'FTZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3260', '386', '上溪镇', '3', 'SXZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3261', '386', '义亭镇', '3', 'YTZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3262', '386', '大陈镇', '3', 'DCZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3263', '386', '苏溪镇', '3', 'SXZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3264', '386', '赤岸镇', '3', 'CAZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3265', '386', '东阳市', '3', 'DYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3266', '386', '永康市', '3', 'YKS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3267', '386', '武义县', '3', 'WYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3268', '386', '浦江县', '3', 'PJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3269', '386', '磐安县', '3', 'PAX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3270', '387', '莲都区', '3', 'LDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3271', '387', '龙泉市', '3', 'LQS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3272', '387', '青田县', '3', 'QTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3273', '387', '缙云县', '3', 'YX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3274', '387', '遂昌县', '3', 'SCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3275', '387', '松阳县', '3', 'SYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3276', '387', '云和县', '3', 'YHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3277', '387', '庆元县', '3', 'QYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3278', '387', '景宁', '3', 'JN',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3279', '388', '海曙区', '3', 'HSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3280', '388', '江东区', '3', 'JDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3281', '388', '江北区', '3', 'JBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3282', '388', '镇海区', '3', 'ZHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3283', '388', '北仑区', '3', 'BLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3284', '388', '鄞州区', '3', 'ZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3285', '388', '余姚市', '3', 'YYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3286', '388', '慈溪市', '3', 'CXS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3287', '388', '奉化市', '3', 'FHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3288', '388', '象山县', '3', 'XSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3289', '388', '宁海县', '3', 'NHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3290', '389', '越城区', '3', 'YCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3291', '389', '上虞市', '3', 'SYS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3292', '389', '嵊州市', '3', 'ZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3293', '389', '绍兴县', '3', 'SXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3294', '389', '新昌县', '3', 'XCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3295', '389', '诸暨市', '3', 'ZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3296', '390', '椒江区', '3', 'JJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3297', '390', '黄岩区', '3', 'HYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3298', '390', '路桥区', '3', 'LQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3299', '390', '温岭市', '3', 'WLS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3300', '390', '临海市', '3', 'LHS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3301', '390', '玉环县', '3', 'YHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3302', '390', '三门县', '3', 'SMX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3303', '390', '天台县', '3', 'TTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3304', '390', '仙居县', '3', 'XJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3305', '391', '鹿城区', '3', 'LCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3306', '391', '龙湾区', '3', 'LWQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3307', '391', '瓯海区', '3', 'HQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3308', '391', '瑞安市', '3', 'RAS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3309', '391', '乐清市', '3', 'LQS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3310', '391', '洞头县', '3', 'DTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3311', '391', '永嘉县', '3', 'YJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3312', '391', '平阳县', '3', 'PYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3313', '391', '苍南县', '3', 'CNX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3314', '391', '文成县', '3', 'WCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3315', '391', '泰顺县', '3', 'TSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3316', '392', '定海区', '3', 'DHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3317', '392', '普陀区', '3', 'PTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3318', '392', '岱山县', '3', 'SX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3319', '392', '嵊泗县', '3', 'X',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3320', '393', '衢州市', '3', 'ZS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3321', '393', '江山市', '3', 'JSS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3322', '393', '常山县', '3', 'CSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3323', '393', '开化县', '3', 'KHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3324', '393', '龙游县', '3', 'LYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3325', '394', '合川区', '3', 'HCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3326', '394', '江津区', '3', 'JJQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3327', '394', '南川区', '3', 'NCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3328', '394', '永川区', '3', 'YCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3329', '394', '南岸区', '3', 'NAQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3330', '394', '渝北区', '3', 'YBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3331', '394', '万盛区', '3', 'WSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3332', '394', '大渡口区', '3', 'DDKQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3333', '394', '万州区', '3', 'WZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3334', '394', '北碚区', '3', 'BQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3335', '394', '沙坪坝区', '3', 'SPBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3336', '394', '巴南区', '3', 'BNQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3337', '394', '涪陵区', '3', 'FLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3338', '394', '江北区', '3', 'JBQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3339', '394', '九龙坡区', '3', 'JLPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3340', '394', '渝中区', '3', 'YZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3341', '394', '黔江开发区', '3', 'QJKFQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3342', '394', '长寿区', '3', 'CSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3343', '394', '双桥区', '3', 'SQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3344', '394', '綦江县', '3', 'JX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3345', '394', '潼南县', '3', 'NX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3346', '394', '铜梁县', '3', 'TLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3347', '394', '大足县', '3', 'DZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3348', '394', '荣昌县', '3', 'RCX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3349', '394', '璧山县', '3', 'SX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3350', '394', '垫江县', '3', 'DJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3351', '394', '武隆县', '3', 'WLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3352', '394', '丰都县', '3', 'FDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3353', '394', '城口县', '3', 'CKX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3354', '394', '梁平县', '3', 'LPX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3355', '394', '开县', '3', 'KX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3356', '394', '巫溪县', '3', 'WXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3357', '394', '巫山县', '3', 'WSX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3358', '394', '奉节县', '3', 'FJX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3359', '394', '云阳县', '3', 'YYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3360', '394', '忠县', '3', 'ZX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3361', '394', '石柱', '3', 'SZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3362', '394', '彭水', '3', 'PS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3363', '394', '酉阳', '3', 'YY',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3364', '394', '秀山', '3', 'XS',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3365', '395', '沙田区', '3', 'STQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3366', '395', '东区', '3', 'DQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3367', '395', '观塘区', '3', 'GTQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3368', '395', '黄大仙区', '3', 'HDXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3369', '395', '九龙城区', '3', 'JLCQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3370', '395', '屯门区', '3', 'TMQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3371', '395', '葵青区', '3', 'KQQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3372', '395', '元朗区', '3', 'YLQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3373', '395', '深水埗区', '3', 'SSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3374', '395', '西贡区', '3', 'XGQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3375', '395', '大埔区', '3', 'DPQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3376', '395', '湾仔区', '3', 'WZQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3377', '395', '油尖旺区', '3', 'YJWQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3378', '395', '北区', '3', 'BQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3379', '395', '南区', '3', 'NQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3380', '395', '荃湾区', '3', 'WQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3381', '395', '中西区', '3', 'ZXQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3382', '395', '离岛区', '3', 'LDQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3383', '396', '澳门', '3', 'AM',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3384', '397', '台北', '3', 'TB',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3385', '397', '高雄', '3', 'GX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3386', '397', '基隆', '3', 'JL',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3387', '397', '台中', '3', 'TZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3388', '397', '台南', '3', 'TN',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3389', '397', '新竹', '3', 'XZ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3390', '397', '嘉义', '3', 'JY',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3391', '397', '宜兰县', '3', 'YLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3392', '397', '桃园县', '3', 'TYX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3393', '397', '苗栗县', '3', 'MLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3394', '397', '彰化县', '3', 'ZHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3395', '397', '南投县', '3', 'NTX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3396', '397', '云林县', '3', 'YLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3397', '397', '屏东县', '3', 'PDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3398', '397', '台东县', '3', 'TDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3399', '397', '花莲县', '3', 'HLX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3400', '397', '澎湖县', '3', 'PHX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3401', '3', '合肥', '2', 'HF', '31.821448', '117.227271');
INSERT INTO `yii2_region` VALUES ('3402', '3401', '庐阳区', '3', 'LYQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3403', '3401', '瑶海区', '3', 'YHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3404', '3401', '蜀山区', '3', 'SSQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3405', '3401', '包河区', '3', 'BHQ',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3406', '3401', '长丰县', '3', 'CFX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3407', '3401', '肥东县', '3', 'FDX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3408', '3401', '肥西县', '3', 'FXX',  NULL,  NULL);
INSERT INTO `yii2_region` VALUES ('3409', '3401', '高新区', '3', 'GXQ',  NULL,  NULL);

-- -----------------------------
-- Table structure for `yii2_shop`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_shop`;
CREATE TABLE `yii2_shop` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) NOT NULL COMMENT '房间类型',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `cover` varchar(255) NOT NULL DEFAULT '' COMMENT '封面图',
  `images` varchar(255) NOT NULL COMMENT '图组',
  `imagess` varchar(255) DEFAULT NULL,
  `num` int(3) NOT NULL COMMENT '房间总数量',
  `price` decimal(8,2) NOT NULL COMMENT '通常价格，格式231.02',
  `extend` text COMMENT '扩展数据',
  `sort` int(4) NOT NULL DEFAULT '0' COMMENT '排序值',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='酒店表';

-- -----------------------------
-- Records of `yii2_shop`
-- -----------------------------
INSERT INTO `yii2_shop` VALUES ('1', '1', '大床双人房特价', '111111', '1', '2,1', '', '111', '520.12', 'a:3:{i:111;s:3:\"111\";i:222;s:3:\"222\";i:333;s:3:\"333\";}', '1', '1472638475', '1477967729', '1');
INSERT INTO `yii2_shop` VALUES ('2', '4', '海钓管理测试测试测试', '测试测试测试', '', '1,2', '', '133', '421.00', 'a:3:{i:11;s:2:\"11\";i:22;s:2:\"22\";i:33;s:2:\"33\";}', '3', '1472639234',  NULL, '1');
INSERT INTO `yii2_shop` VALUES ('3', '1', '测试酒店1222', '测试酒店1222', '1', '1,2,12', '1,2,6,8,11', '4', '420.23', 'a:1:{s:3:\"sss\";s:5:\"sadfa\";}', '0', '1473835350', '1479233442', '1');
INSERT INTO `yii2_shop` VALUES ('4', '2', '测试帆船标题', '测试商品描述测试商品描述测试商品描述测试商品描述测试商品描述', '5', '1,2', '', '111', '333.00', 'a:1:{i:0;s:0:\"\";}', '0', '1474176248', '1477984726', '1');
INSERT INTO `yii2_shop` VALUES ('5', '3', '测试潜水标题', '商品描述商品描述商品描述商品描述商品描述商品描述商品描述商品描述商品描述商品描述', '7', '1,2,4', '', '200', '900.00', 'a:1:{i:0;s:0:\"\";}', '0', '1474176308', '1477984761', '1');
INSERT INTO `yii2_shop` VALUES ('6', '1', '666666', '666666666666', '1', '1', '', '6', '2288.00', 'a:1:{i:0;s:15:\"dssdfsfsdfdsfsa\";}', '1', '1474213219', '1477967739', '1');

-- -----------------------------
-- Table structure for `yii2_shop_group`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_shop_group`;
CREATE TABLE `yii2_shop_group` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '套餐标题',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `groups` text NOT NULL COMMENT '商品组合，数字逗号分隔',
  `cover` varchar(255) NOT NULL COMMENT '封面图',
  `images` text NOT NULL COMMENT '图组',
  `total` decimal(8,2) NOT NULL COMMENT '总价',
  `price` decimal(8,2) NOT NULL COMMENT '套餐价格',
  `sort` int(4) NOT NULL DEFAULT '0' COMMENT '排序值',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='套餐设置';

-- -----------------------------
-- Records of `yii2_shop_group`
-- -----------------------------
INSERT INTO `yii2_shop_group` VALUES ('2', '阿斯顿发顺丰', '沙发沙发啊 沙发阿斯顿发是放大师傅', 'a:1:{i:1;a:1:{i:3;a:3:{s:4:\"days\";s:1:\"6\";s:3:\"num\";s:1:\"6\";s:2:\"id\";s:1:\"3\";}}}', '1', '1,2', '15128.28', '600.00', '0', '1');
INSERT INTO `yii2_shop_group` VALUES ('4', '房1天2人潜水1天2人11', '房1天2人潜水1天2人11', 'a:2:{i:1;a:1:{i:1;a:3:{s:4:\"days\";s:1:\"1\";s:3:\"num\";s:1:\"2\";s:2:\"id\";s:1:\"1\";}}i:3;a:1:{i:5;a:3:{s:4:\"days\";s:1:\"1\";s:3:\"num\";s:1:\"2\";s:2:\"id\";s:1:\"5\";}}}', '1', '1,2', '2840.24', '998.00', '0', '1');

-- -----------------------------
-- Table structure for `yii2_shop_price`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_shop_price`;
CREATE TABLE `yii2_shop_price` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `shop_id` int(8) NOT NULL,
  `day` int(10) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`shop_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='每日价格列表';


-- -----------------------------
-- Table structure for `yii2_shop_type`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_shop_type`;
CREATE TABLE `yii2_shop_type` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='房间类型表';

-- -----------------------------
-- Records of `yii2_shop_type`
-- -----------------------------
INSERT INTO `yii2_shop_type` VALUES ('1', '房间');
INSERT INTO `yii2_shop_type` VALUES ('2', '帆船');
INSERT INTO `yii2_shop_type` VALUES ('3', '潜水');
INSERT INTO `yii2_shop_type` VALUES ('4', '海钓');

-- -----------------------------
-- Table structure for `yii2_train`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_train`;
CREATE TABLE `yii2_train` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '培训类型',
  `title` varchar(100) NOT NULL COMMENT '排序标题',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `price` decimal(8,2) NOT NULL COMMENT '价格',
  `num` tinyint(3) NOT NULL DEFAULT '1' COMMENT '最少人数',
  `cover` varchar(255) NOT NULL COMMENT '封面',
  `sort` int(4) NOT NULL DEFAULT '0' COMMENT '排序值',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='培训表';

-- -----------------------------
-- Records of `yii2_train`
-- -----------------------------
INSERT INTO `yii2_train` VALUES ('1', '1', '测试培训标题111', '测试培训标题1：

帆海汇码头里停泊着单体竞赛帆船TEN，龙骨帆船DC22，丁级帆船DC15，
双体帆船JE28，三体帆船JE27。无论您是出海游玩钓鱼，海上派对，

还是商务洽谈等都可以满足您的需要。
帆海汇培训中心室内拥有设施齐全的超大会议室，可以满足不同公司组织的业内会议
或不同领域的年度盛会。帆海汇培训中心为美国ASA权威帆船培训体系授权分校，
将为帆船运动爱好者提供专业的帆船培训，并颁发美国ASA帆船驾驶证书。 ', '523.23', '127', '1', '0', '1472643081', '1479233501', '1');
INSERT INTO `yii2_train` VALUES ('2', '2', '测试培训标题', '帆海汇码头里停泊着单体竞赛帆船TEN，龙骨帆船DC22，丁级帆船DC15，
双体帆船JE28，三体帆船JE27。无论您是出海游玩钓鱼，海上派对，

还是商务洽谈等都可以满足您的需要。
帆海汇培训中心室内拥有设施齐全的超大会议室，可以满足不同公司组织的业内会议
或不同领域的年度盛会。帆海汇培训中心为美国ASA权威帆船培训体系授权分校，
将为帆船运动爱好者提供专业的帆船培训，并颁发美国ASA帆船驾驶证书。 ', '231.12', '100', '2', '1', '1472643186', '1474529429', '1');
INSERT INTO `yii2_train` VALUES ('3', '1', '帆船培训2', '帆海汇码头里停泊着单体竞赛帆船TEN，龙骨帆船DC22，丁级帆船DC15，
双体帆船JE28，三体帆船JE27。无论您是出海游玩钓鱼，海上派对，

还是商务洽谈等都可以满足您的需要。
帆海汇培训中心室内拥有设施齐全的超大会议室，可以满足不同公司组织的业内会议
或不同领域的年度盛会。帆海汇培训中心为美国ASA权威帆船培训体系授权分校，
将为帆船运动爱好者提供专业的帆船培训，并颁发美国ASA帆船驾驶证书。 ', '322.20', '1', '4', '0', '1473611927', '1474529318', '1');
INSERT INTO `yii2_train` VALUES ('4', '1', '帆船培训3', '帆海汇码头里停泊着单体竞赛帆船TEN，龙骨帆船DC22，丁级帆船DC15，
双体帆船JE28，三体帆船JE27。无论您是出海游玩钓鱼，海上派对，

还是商务洽谈等都可以满足您的需要。
帆海汇培训中心室内拥有设施齐全的超大会议室，可以满足不同公司组织的业内会议
或不同领域的年度盛会。帆海汇培训中心为美国ASA权威帆船培训体系授权分校，
将为帆船运动爱好者提供专业的帆船培训，并颁发美国ASA帆船驾驶证书。 ', '222.22', '122', '4', '0', '1473611964', '1474529341', '1');
INSERT INTO `yii2_train` VALUES ('5', '2', '潜水培训2', '帆海汇码头里停泊着单体竞赛帆船TEN，龙骨帆船DC22，丁级帆船DC15，
双体帆船JE28，三体帆船JE27。无论您是出海游玩钓鱼，海上派对，

还是商务洽谈等都可以满足您的需要。
帆海汇培训中心室内拥有设施齐全的超大会议室，可以满足不同公司组织的业内会议
或不同领域的年度盛会。帆海汇培训中心为美国ASA权威帆船培训体系授权分校，
将为帆船运动爱好者提供专业的帆船培训，并颁发美国ASA帆船驾驶证书。 ', '100.02', '100', '5', '0', '1473612010', '1474529378', '1');
INSERT INTO `yii2_train` VALUES ('6', '2', '潜水培训3', '帆海汇码头里停泊着单体竞赛帆船TEN，龙骨帆船DC22，丁级帆船DC15，
双体帆船JE28，三体帆船JE27。无论您是出海游玩钓鱼，海上派对，

还是商务洽谈等都可以满足您的需要。
帆海汇培训中心室内拥有设施齐全的超大会议室，可以满足不同公司组织的业内会议
或不同领域的年度盛会。帆海汇培训中心为美国ASA权威帆船培训体系授权分校，
将为帆船运动爱好者提供专业的帆船培训，并颁发美国ASA帆船驾驶证书。 ', '123.23', '100', '6', '0', '1473612026', '1474529403', '1');

-- -----------------------------
-- Table structure for `yii2_train_certificate`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_train_certificate`;
CREATE TABLE `yii2_train_certificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '证书名',
  `cover` varchar(255) NOT NULL DEFAULT '' COMMENT '证书图片',
  `description` varchar(1000) NOT NULL DEFAULT '' COMMENT '证书简介',
  `ctime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='培训证书表';

-- -----------------------------
-- Records of `yii2_train_certificate`
-- -----------------------------
INSERT INTO `yii2_train_certificate` VALUES ('1', 'AAA认证证书11', '1', '证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明', '0');
INSERT INTO `yii2_train_certificate` VALUES ('2', 'BBB认证证书', '4', '证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明', '0');
INSERT INTO `yii2_train_certificate` VALUES ('3', 'CCC认证证书', '5', '证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明证书说明 ', '0');

-- -----------------------------
-- Table structure for `yii2_train_price`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_train_price`;
CREATE TABLE `yii2_train_price` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `train_id` int(8) NOT NULL,
  `day` int(10) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`train_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='每日价格列表';


-- -----------------------------
-- Table structure for `yii2_train_type`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_train_type`;
CREATE TABLE `yii2_train_type` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '类型名称',
  `cover` varchar(255) NOT NULL DEFAULT '' COMMENT '封面',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `certif_ids` varchar(100) NOT NULL DEFAULT '' COMMENT '证书id',
  `description` varchar(255) NOT NULL COMMENT '内容描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='房间类型表';

-- -----------------------------
-- Records of `yii2_train_type`
-- -----------------------------
INSERT INTO `yii2_train_type` VALUES ('1', '帆船11', '1', '0', '1,2,3', '阿迪法师打发多少阿斯顿发生的发生的发达asd');
INSERT INTO `yii2_train_type` VALUES ('2', '海钓', '4', '0', '1,2,3', '阿斯顿法师打发规划法国恢复电话打工行');

-- -----------------------------
-- Table structure for `yii2_user`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_user`;
CREATE TABLE `yii2_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(60) NOT NULL COMMENT '密码',
  `salt` char(32) NOT NULL COMMENT '密码干扰字符',
  `email` char(32) DEFAULT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `tuid` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '推荐人uid',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '头像路径',
  `score` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '当前积分',
  `score_all` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '总积分',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态 1正常 0禁用',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `mobile` (`mobile`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- -----------------------------
-- Records of `yii2_user`
-- -----------------------------
INSERT INTO `yii2_user` VALUES ('6', 'e282486518', '$2y$13$oO.xRlrKjMMF/bykb7476.zBIH2RkR6rtv8j5jrYgSxi71AvV3lFG', 'kXGkWeNSeoK7vakqRfUAviocq-5uy0cN', 'phphome@qq.com', '13656568989', '1456568652', '13654444444', '1456568652', '13556464888', '1479233640', '7', '1', '10', '0', '1');
INSERT INTO `yii2_user` VALUES ('7', '282486518', '$2y$13$KIAenVWuR2Tgi1VCKiPegeVsQAHXyDcp9rUmzhqK6TNjL4Cqc3YPa', 'n9uguceYCqn_jQNd8F6-JRHOj21yltUo', 'phphome@qq.coms', '13645685421', '1472626509', '2130706433', '0', '2130706433', '1472626719', '0', '3', '1', '1', '0');
INSERT INTO `yii2_user` VALUES ('8', '135232323232', '$2y$13$UVA5264Qic4g8BDl940x1e0ZefVI3QqpH8tH6bttL/cF8GcU1C7Rm', 'Dg36PS0QshZ-Y2zhQJa559RSKJULGO_8',  NULL, '', '1474112224', '2130706433', '0', '2130706433', '0', '0', '', '0', '0', '0');
INSERT INTO `yii2_user` VALUES ('13', 'aabbcc', '$2y$13$46n16kagedYUXx6WXZ2QkuSGJKm3FDr6iI.KPNzAkHYRHmplqgAiC', 'OblZ1QuXGGGiXZWTPqfDrCoF_qXVIN3b', '', '13421839870', '1474114459', '2130706433', '0', '2130706433', '1477904302', '0', '1', '0', '0', '1');
INSERT INTO `yii2_user` VALUES ('14', 'bvbvbv', '$2y$13$Jm2bfhSnqcSMTaPxRRWiReqrclkApB1Dc20kLTxVNHAzl7J8DH60K', 'jrYKEga9jbp2H6bsdLjvnEd5mqsRgMMD',  NULL, '13013013330', '1474115843', '2130706433', '0', '2130706433', '0', '0', '', '0', '0', '1');
INSERT INTO `yii2_user` VALUES ('15', 'hahaha', '$2y$13$NsuZra9Z/DBaRk3R7tzvnuYrbmV5mIAKTKoksFcYHu3wUyJDaLPz.', 'BsDuGjz20Uexw6Kq_iw-s8AiqNmtec2u',  NULL, '13636363636', '1474192435', '2130706433', '0', '2130706433', '0', '13', '', '0', '0', '1');
INSERT INTO `yii2_user` VALUES ('16', 'huanglala', '$2y$13$FJGFsH1fls8m3DWuxUrN9eJcDQZScQLyYaQIXVeSPK0WMlpT1C.Ze', '7EpKjeEwVqYQS7oV0QW7-JNy-UFchvY1',  NULL, '13631639420', '1474197294', '2130706433', '0', '2130706433', '0', '13', '', '0', '0', '1');
INSERT INTO `yii2_user` VALUES ('17', 'binbin', '$2y$13$fbFtBRQgoH2PZ3wfCG1KIu8qdXeah.4KFZWI7kAE.4fDxM4lMuJ4q', 'tjCK1O9VaCtnvlNzRobRlnNHmbADlXPM',  NULL, '18665354960', '1474334566', '1946572948', '0', '1946572948', '0', '6', '', '0', '0', '1');
INSERT INTO `yii2_user` VALUES ('18', 'lasek001', '$2y$13$qMb7n1rslyltgaCDNvy/mOcBuTfOmidi8.zXvnURHMqKkVydCj3h2', 'Fx-LBkD34aXdGkYt8a2S_6Vq991TrW6S',  NULL, '13316922246', '1474380169', '1902700390', '0', '1902700390', '0', '0', '', '0', '0', '1');
INSERT INTO `yii2_user` VALUES ('19', 'feifeifei', '$2y$13$MRvZElUImZ.8gMsNV5ZEKuIkdkEamyc1tw/FHoPgQdp5x.WIPOroi', 'KWzNd8A57uVSMeLpDUB_ol1egfLPJ58C',  NULL, '13631539420', '1474444147', '3070991720', '0', '3070991720', '0', '0', '', '0', '0', '1');

-- -----------------------------
-- Table structure for `yii2_user_data`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_user_data`;
CREATE TABLE `yii2_user_data` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `yii2_user_rank`
-- -----------------------------
DROP TABLE IF EXISTS `yii2_user_rank`;
CREATE TABLE `yii2_user_rank` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL COMMENT '等级名称',
  `score` int(8) NOT NULL COMMENT '积分界限',
  `discount` decimal(6,2) NOT NULL DEFAULT '0.00' COMMENT '折扣百分比',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='会员等级配置';

-- -----------------------------
-- Records of `yii2_user_rank`
-- -----------------------------
INSERT INTO `yii2_user_rank` VALUES ('1', '普通会员', '0', '0.00', '1');
INSERT INTO `yii2_user_rank` VALUES ('2', '一级会员', '2000', '3.00', '1');
INSERT INTO `yii2_user_rank` VALUES ('3', '二级会员', '5000', '6.00', '1');
INSERT INTO `yii2_user_rank` VALUES ('4', 'VIP会员', '10000', '10.00', '1');
INSERT INTO `yii2_user_rank` VALUES ('5', '钻石会员', '100000', '20.00', '1');
