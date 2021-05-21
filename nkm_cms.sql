/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : nkm_cms

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 21/05/2021 18:00:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for nkm_article
-- ----------------------------
DROP TABLE IF EXISTS `nkm_article`;
CREATE TABLE `nkm_article` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tags` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `summary` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `user_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `status` int unsigned NOT NULL DEFAULT '1' COMMENT '0: 草稿；1：已发布',
  `create_time` datetime NOT NULL,
  `is_deleted` int unsigned NOT NULL DEFAULT '0' COMMENT '0：未删除；1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nkm_article
-- ----------------------------
BEGIN;
INSERT INTO `nkm_article` VALUES (1, '关于nkm-cms内容管理系统的介绍', '/api/nkm-cms/readfile?path=/upload/2021/01/editor/20210102111424749502.png', '<p style=\"text-align:center\"><strong style=\"font-size:18px\">nkm-cms内容管理系统基础框架</strong></p><p style=\"text-align:center;font-size:14px\">作者：轩陌</p><p style=\"text-align:left;text-indent:2em;font-size:14px\">在学了Node.js一直想用Node.js写一版博客，一直没有实现，因为没有时间，又不想在用现在的WordPress那套主题风格，苦于设计页面真的太难了，也就一直搁下了，所以目前也就只有做一套前后端的基础开发框架，之前使用koa2实现的那一版后台管理系统基础框架，由于是第一次使用nodejs做后端，有很多不完善的地方，也是属于一个学习的过程，后边了解到Egg这个框架，感觉还不错，学了起来，将之前的koa2版后端进行了重构，使用了ts，数据库查询不在使用sql语句查询，改用了ORM框架，后端算是有了一个稳定的1.0版本，但是前端在富文本编辑器这块一直没有找到一个比较好用的，CKEditor比较重，UEditor官方不维护，各种原因不爽，其他的也有做尝试，但是感觉并不是自己想要的，后边有了解到textbus这个编辑器，也就是现在的这个，尝试了一下还不错，暂时先用着，目前暂时没有发现什么特别大的问题。</p><p style=\"text-align:left;text-indent:2em;font-size:14px\">关于这套内容管理系统的后续还需要开发的功能有：站点设置、文章内容里上传的图片做未使用的删除功能、文章增加版本历史记录、文章关联到用户权限、前端展示页面如果有好的设计会做一版对应的博客，嗯，目前就这个打算。<br></p><p style=\"text-align:left;text-indent:2em;font-size:14px\">nkm的命名由来：n取的是nodejs的首字母，k是取的koa2的首字母，m取的是mysql的首字母，所以就有了<u><strong>nkm-admin</strong></u>、<u><strong>nkm-cms</strong></u>的命名，目前几个仓库的介绍如下：</p><table><tbody><tr><td>仓库名<br></td><td>介绍<br></td><td>仓库地址<br></td></tr><tr><td><span style=\"font-family:&quot;PingFang SC&quot;;color:rgb(0, 0, 0);font-size:medium\">🔨nkm-server-ts</span><br></td><td><span style=\"font-family:&quot;PingFang SC&quot;;color:rgb(0, 0, 0);font-size:medium\">后台管理系统</span>基础框架（服务端），使用Eggjs重构的后端，技术栈：Eggjs+mysql+redis<br></td><td>https://github.com/nkm-admin/nkm-server-ts<br></td></tr><tr><td>🔨nkm-web<br></td><td><span style=\"font-family:&quot;PingFang SC&quot;;color:rgb(0, 0, 0);font-size:medium\">后台管理系统基础</span>框架（前端），技术栈：Vuejs+Element-UI<br></td><td>https://github.com/nkm-admin/nkm-web<br></td></tr><tr><td><span style=\"font-family:&quot;PingFang SC&quot;;color:rgb(0, 0, 0);font-size:medium\">nkm-cms-server</span><br></td><td><span style=\"font-family:&quot;PingFang SC&quot;;color:rgb(0, 0, 0);font-size:medium\">基于nkm-server-ts实现的内容管理系统（服务端），目前只开发了栏目管理、文章管理，后续的功能还在开发中</span><br></td><td>https://github.com/nkm-admin/nkm-cms-server<br></td></tr><tr><td>nkm-cms-web<br></td><td>基于nkm-web实现的内容管理系统（前端）<br></td><td>https://github.com/nkm-admin/nkm-cms<br></td></tr><tr><td>nkm-web-template<br></td><td>前端的基础模版，不带任何权限<br></td><td>https://github.com/nkm-admin/nkm-web-template<br></td></tr></tbody></table><p><br></p><p><br></p>', '[]', 'nkm-cms内容管理系统基础框架\n\n作者：轩陌\n\n在学了Node.js一直想用Node.js写一版博客，一直没有实现，因为没有时间，又不想在用现在的WordPress那套主题风格，苦于设计页面真的太难了，也就一直搁下了，所以目前也就只有做一套前后端的基础开发框架，之前使用koa2实现的那一版后台管理系统基础框架，由于是第一次使用nodejs做后端，有很多不完善的地方，也是属于一个学习的过程，后边了解到Egg这个框架，感觉还不错，学了起来，将之前的koa2版后端进行了重构，使用了ts，数据库查询不在使用sql语句查询，改用了ORM框架，后端算是有了一个稳定的1.0版本，但是前端在富文本编辑器这', 1, 1, 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_article` VALUES (2, '视频测试', '', '<p><video src=\"http://cms-test.xuanmo.xin/api/nkm-cms/readfile?path=/upload/2021/01/editor/20210114170725264999.mp4\" controls style=\"width:293px;height:520px\"></video><br></p>', '[]', '', 1, 2, 1, '2019-08-14 12:54:50', 0);
COMMIT;

-- ----------------------------
-- Table structure for nkm_category
-- ----------------------------
DROP TABLE IF EXISTS `nkm_category`;
CREATE TABLE `nkm_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `parent_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sort` int NOT NULL,
  `create_time` datetime NOT NULL,
  `is_deleted` int NOT NULL COMMENT '0：不可见；1：可见',
  `visible` int NOT NULL COMMENT '0：未删除；1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of nkm_category
-- ----------------------------
BEGIN;
INSERT INTO `nkm_category` VALUES (1, '测试栏目1', 'test1', '', 0, 1, 'list', 0, '2019-08-14 12:54:50', 0, 1);
INSERT INTO `nkm_category` VALUES (2, '意见收集', 'feedback', '', 0, 1, 'list', 0, '2019-08-14 12:54:50', 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for nkm_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `nkm_dictionary`;
CREATE TABLE `nkm_dictionary` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL,
  `sort` int unsigned NOT NULL,
  `create_time` datetime NOT NULL,
  `is_deleted` int unsigned NOT NULL DEFAULT '0' COMMENT '0:未删除   1:已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nkm_dictionary
-- ----------------------------
BEGIN;
INSERT INTO `nkm_dictionary` VALUES (1, '系统管理', 'system', '', 0, 0, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_dictionary` VALUES (2, '资源类型', 'system:resource:type', '', 1, 0, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_dictionary` VALUES (3, '菜单', 'system:resource:menu', '', 2, 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_dictionary` VALUES (4, '页面', 'system:resource:page', '', 2, 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_dictionary` VALUES (5, '按钮', 'system:resource:btn', '', 2, 2, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_dictionary` VALUES (6, '接口', 'system:resource:api', '', 2, 3, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_dictionary` VALUES (7, '占位', 'placeholder', '', 2, 0, '2019-08-14 12:54:50', 0);
COMMIT;

-- ----------------------------
-- Table structure for nkm_resource
-- ----------------------------
DROP TABLE IF EXISTS `nkm_resource`;
CREATE TABLE `nkm_resource` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(200) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `parent_id` bigint unsigned NOT NULL,
  `parent_code` varchar(200) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `sort` int unsigned NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enabled` int unsigned NOT NULL COMMENT '0：禁用  1：启用',
  `create_time` datetime NOT NULL,
  `is_deleted` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nkm_resource
-- ----------------------------
BEGIN;
INSERT INTO `nkm_resource` VALUES (1, 'system', '系统管理', 'system:resource:menu', 0, '', 'el-icon-setting', 10, '/system', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (2, 'system:user', '用户管理', 'system:resource:menu', 1, '', 'x-icon-users', 1, '/system/user', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (3, 'system:resource', '资源管理', 'system:resource:menu', 1, '', 'el-icon-collection', 2, '/system/resource', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (4, 'system:role', '角色管理', 'system:resource:menu', 1, '', 'x-icon-roles', 3, '/system/role', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (5, 'dashboard', '仪表盘', 'system:resource:menu', 0, '', 'el-icon-odometer', 0, '/dashboard', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (6, 'personal:center', '个人中心', 'system:resource:menu', 0, '', 'el-icon-user', 1, '/personal-center', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (7, 'system:dictionary', '数据字典', 'system:resource:menu', 1, '', 'el-icon-notebook-1', 3, '/system/dictionary', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (8, 'system:user:api:list', '列表', 'system:resource:api', 2, '', '', 0, '/api/nkm-cms/system/user/list', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (9, 'system:user:api:registered', '用户注册', 'system:resource:api', 2, '', '', 0, '/api/nkm-cms/system/user/registered', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (10, 'system:user:api:del', '用户删除', 'system:resource:api', 2, '', '', 0, '/api/nkm-cms/system/user/del', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (11, 'system:user:api:modify-role', '修改角色', 'system:resource:api', 2, '', '', 0, '/api/nkm-cms/system/user/modify-role', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (12, 'system:user:api:reset-pwd', '重置密码', 'system:resource:api', 2, '', '', 0, '/api/nkm-cms/system/user/reset-password', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (13, 'system:resource:api:save', '资源保存', 'system:resource:api', 3, '', '', 0, '/api/nkm-cms/system/resource/save', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (14, 'system:resource:api:del', '资源删除', 'system:resource:api', 3, '', '', 0, '/api/nkm-cms/system/resource/del', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (15, 'system:role:api:save', '角色保存', 'system:resource:api', 4, '', '', 0, '/api/nkm-cms/system/role/save', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (16, 'system:role:api:del', '角色删除', 'system:resource:api', 4, '', '', 0, '/api/nkm-cms/system/role/del', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (17, 'system:dict:api:save', '接口-字典保存', 'system:resource:api', 7, '', '', 0, '/api/nkm-cms/system/dictionary/save', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (18, 'system:dict:api:del', '接口-字典删除', 'system:resource:api', 7, '', '', 0, '/api/nkm-cms/system/dictionary/del', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (19, 'category', '栏目列表', 'system:resource:menu', 30, '', 'el-icon-menu', 2, '/article/category', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (20, 'article', '文章', 'system:resource:menu', 30, '', 'el-icon-menu', 3, '', 1, '2019-08-14 12:54:50', 1);
INSERT INTO `nkm_resource` VALUES (21, 'article:edit', '文章编辑', 'system:resource:menu', 30, '', 'el-icon-edit', 1, '/article/edit', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (22, 'category:api:list', '列表接口', 'system:resource:api', 19, '', '', 0, '/api/nkm-cms/category/list', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (23, 'category:api/save', '保存接口', 'system:resource:api', 19, '', '', 0, '/api/nkm-cms/category/save', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (24, 'category:api:del', '删除接口', 'system:resource:api', 19, '', '', 0, '/api/nkm-cms/category/del', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (25, 'article:api:list', '列表接口', 'system:resource:api', 34, '', '', 10, '/api/nkm-cms/article/list', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (26, 'article:api:detail', '详情接口', 'system:resource:api', 21, '', '', 10, '/api/nkm-cms/article/detail/:id', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (27, 'article:api:save', '保存接口', 'system:resource:api', 21, '', '', 10, '/api/nkm-cms/article/save', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (28, 'article:api:del', '删除接口', 'system:resource:api', 34, '', '', 10, '/api/nkm-cms/article/del', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (29, 'resource:api:list', '列表', 'system:resource:api', 3, '', '', 0, '/api/nkm-cms/system/resource/list', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (30, 'article-manager', '文章管理', 'system:resource:menu', 0, '', 'el-icon-notebook-2', 3, '/article', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (31, 'tags', '标签列表', 'system:resource:menu', 30, '', 'el-icon-collection-tag', 3, '/article/tags', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (32, 'placeholder1', '占位', 'placeholder', 7, '', '', 0, '', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (33, 'placeholder2', '占位', 'placeholder', 4, '', '', 0, '', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (34, 'article:list', '文章列表', 'system:resource:menu', 30, '', 'el-icon-menu', 0, '/article/list', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (35, 'modify-password', '修改密码', 'system:resource:btn', 6, '', '', 0, '', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (36, 'placeholder3', '占位', 'placeholder', 6, '', '', 0, '', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (37, 'media', '媒体库', 'system:resource:menu', 0, '', 'el-icon-video-camera', 3, '/media', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (38, 'media-read-dir', '读取目录-接口', 'system:resource:api', 37, '', '', 0, '/api/nkm-cms/media/read-directory', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (39, 'media-del-file', '删除文件-接口', 'system:resource:api', 37, '', '', 0, '/api/nkm-cms/media/del', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` VALUES (40, 'media-create-dir', '新建目录-接口', 'system:resource:api', 37, '', '', 0, '/api/nkm-cms/media/create-directory', 1, '2019-08-14 12:54:50', 0);
COMMIT;

-- ----------------------------
-- Table structure for nkm_role
-- ----------------------------
DROP TABLE IF EXISTS `nkm_role`;
CREATE TABLE `nkm_role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `is_deleted` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nkm_role
-- ----------------------------
BEGIN;
INSERT INTO `nkm_role` VALUES (1, '系统管理员', 'systemAdministrator', '5,35,30,34,25,28,21,26,27,19,22,23,24,31,37,2,8,9,10,11,12,3,13,14,29,15,16,17,18,6,1,4,7', '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_role` VALUES (2, '测试', 'test', '5,6,21,20', '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_role` VALUES (3, '测试管理员', 'testAdmin', '5,36,30,34,25,28,21,26,27,19,22,23,24,31,38,40,8,9,29,33,32,6,37,1,2,3,4,7', '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_role` VALUES (4, '文章发布管理员', 'articleManager', '5,36,22,23,20,34,21,25,26,27,28,6,30,19', '2019-08-14 12:54:50', 0);
COMMIT;

-- ----------------------------
-- Table structure for nkm_tags
-- ----------------------------
DROP TABLE IF EXISTS `nkm_tags`;
CREATE TABLE `nkm_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `is_deleted` int unsigned NOT NULL DEFAULT '0' COMMENT '0：未删除；1：已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of nkm_tags
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for nkm_users
-- ----------------------------
DROP TABLE IF EXISTS `nkm_users`;
CREATE TABLE `nkm_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `login_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `display_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `registered_time` datetime NOT NULL,
  `last_login_time` datetime NOT NULL,
  `status` int unsigned NOT NULL DEFAULT '1' COMMENT '0：禁用；1：启用',
  `is_system_admin` int unsigned NOT NULL DEFAULT '0',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nkm_users
-- ----------------------------
BEGIN;
INSERT INTO `nkm_users` VALUES (1, 'admin', 'eea325bb46d15a237ef89e2282afe077', '系统管理员', 'me@example.com', 'systemAdministrator', '2019-08-14 12:54:50', '2021-05-21 17:59:43', 1, 1, '/api/nkm-cms/readfile?path=/upload/2020/12/account/20201229120252134549.JPG', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 0);
INSERT INTO `nkm_users` VALUES (2, 'test', 'ceb8baef5116ea00dced818d38af6cfb', '测试人员1', 'm@example.com', 'articleManager', '2019-08-14 12:54:50', '2019-08-14 12:54:50', 1, 0, '/api/nkm-admin/readfile?path=/upload/2020/06/account/20200616171102099796.png', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', 0);
INSERT INTO `nkm_users` VALUES (3, 'testAdmin', 'ceb8baef5116ea00dced818d38af6cfb', '测试管理员', 'me@example.com', 'testAdmin,articleManager', '2019-08-14 12:54:50', '2019-08-14 12:54:50', 1, 0, '/img/Fruit-1.ec29dc10.png', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
