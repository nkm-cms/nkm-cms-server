/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : nkm_cms_test

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 24/04/2022 13:02:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for nkm_article
-- ----------------------------
DROP TABLE IF EXISTS `nkm_article`;
CREATE TABLE `nkm_article` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tags` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `summary` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `user_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `status` int unsigned NOT NULL DEFAULT '1' COMMENT '0: 草稿；1：已发布',
  `views` int NOT NULL DEFAULT '0' COMMENT '浏览量',
  `top` int NOT NULL DEFAULT '0' COMMENT '0：不置顶；1：置顶',
  `create_time` datetime NOT NULL,
  `is_deleted` int unsigned NOT NULL DEFAULT '0' COMMENT '0：未删除；1：已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of nkm_article
-- ----------------------------
BEGIN;
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
INSERT INTO `nkm_category` (`id`, `name`, `code`, `path`, `parent_id`, `user_id`, `type`, `sort`, `create_time`, `is_deleted`, `visible`) VALUES (1, '测试栏目1', 'test1', '', 0, 1, 'list', 0, '2019-08-14 12:54:50', 0, 1);
INSERT INTO `nkm_category` (`id`, `name`, `code`, `path`, `parent_id`, `user_id`, `type`, `sort`, `create_time`, `is_deleted`, `visible`) VALUES (2, '意见收集', 'feedback', '', 0, 1, 'list', 0, '2019-08-14 12:54:50', 0, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of nkm_dictionary
-- ----------------------------
BEGIN;
INSERT INTO `nkm_dictionary` (`id`, `name`, `code`, `value`, `parent_id`, `sort`, `create_time`, `is_deleted`) VALUES (1, '系统管理', 'system', '', 0, 0, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_dictionary` (`id`, `name`, `code`, `value`, `parent_id`, `sort`, `create_time`, `is_deleted`) VALUES (2, '资源类型', 'system:resource:type', '', 1, 0, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_dictionary` (`id`, `name`, `code`, `value`, `parent_id`, `sort`, `create_time`, `is_deleted`) VALUES (3, '菜单', 'system:resource:menu', '', 2, 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_dictionary` (`id`, `name`, `code`, `value`, `parent_id`, `sort`, `create_time`, `is_deleted`) VALUES (4, '页面', 'system:resource:page', '', 2, 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_dictionary` (`id`, `name`, `code`, `value`, `parent_id`, `sort`, `create_time`, `is_deleted`) VALUES (5, '按钮', 'system:resource:btn', '', 2, 2, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_dictionary` (`id`, `name`, `code`, `value`, `parent_id`, `sort`, `create_time`, `is_deleted`) VALUES (6, '接口', 'system:resource:api', '', 2, 3, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_dictionary` (`id`, `name`, `code`, `value`, `parent_id`, `sort`, `create_time`, `is_deleted`) VALUES (7, '占位', 'placeholder', '', 2, 0, '2019-08-14 12:54:50', 0);
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of nkm_resource
-- ----------------------------
BEGIN;
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (1, 'system', '系统管理', 'system:resource:menu', 0, '', 'el-icon-setting', 10, '/system', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (2, 'system:user', '用户管理', 'system:resource:menu', 1, '', 'x-icon-users', 1, '/system/user', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (3, 'system:resource', '资源管理', 'system:resource:menu', 1, '', 'el-icon-collection', 2, '/system/resource', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (4, 'system:role', '角色管理', 'system:resource:menu', 1, '', 'x-icon-roles', 3, '/system/role', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (5, 'dashboard', '仪表盘', 'system:resource:menu', 0, '', 'el-icon-odometer', 0, '/dashboard', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (6, 'personal:center', '个人中心', 'system:resource:menu', 0, '', 'el-icon-user', 1, '/personal-center', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (7, 'system:dictionary', '数据字典', 'system:resource:menu', 1, '', 'el-icon-notebook-1', 3, '/system/dictionary', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (8, 'system:user:api:list', '列表', 'system:resource:api', 2, '', '', 0, '/api/nkm-cms/system/user/list', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (9, 'system:user:api:registered', '用户注册', 'system:resource:api', 2, '', '', 0, '/api/nkm-cms/system/user/registered', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (10, 'system:user:api:del', '用户删除', 'system:resource:api', 2, '', '', 0, '/api/nkm-cms/system/user/del', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (11, 'system:user:api:modify-role', '修改角色', 'system:resource:api', 2, '', '', 0, '/api/nkm-cms/system/user/modify-role', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (12, 'system:user:api:reset-pwd', '重置密码', 'system:resource:api', 2, '', '', 0, '/api/nkm-cms/system/user/reset-password', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (13, 'system:resource:api:save', '资源保存', 'system:resource:api', 3, '', '', 0, '/api/nkm-cms/system/resource/save', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (14, 'system:resource:api:del', '资源删除', 'system:resource:api', 3, '', '', 0, '/api/nkm-cms/system/resource/del', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (15, 'system:role:api:save', '角色保存', 'system:resource:api', 4, '', '', 0, '/api/nkm-cms/system/role/save', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (16, 'system:role:api:del', '角色删除', 'system:resource:api', 4, '', '', 0, '/api/nkm-cms/system/role/del', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (17, 'system:dict:api:save', '接口-字典保存', 'system:resource:api', 7, '', '', 0, '/api/nkm-cms/system/dictionary/save', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (18, 'system:dict:api:del', '接口-字典删除', 'system:resource:api', 7, '', '', 0, '/api/nkm-cms/system/dictionary/del', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (19, 'category', '栏目列表', 'system:resource:menu', 30, '', 'el-icon-menu', 2, '/article/category', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (20, 'article', '文章', 'system:resource:menu', 30, '', 'el-icon-menu', 3, '', 1, '2019-08-14 12:54:50', 1);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (21, 'article:edit', '文章编辑', 'system:resource:menu', 30, '', 'el-icon-edit', 1, '/article/edit', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (22, 'category:api:list', '列表接口', 'system:resource:api', 19, '', '', 0, '/api/nkm-cms/category/list', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (23, 'category:api/save', '保存接口', 'system:resource:api', 19, '', '', 0, '/api/nkm-cms/category/save', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (24, 'category:api:del', '删除接口', 'system:resource:api', 19, '', '', 0, '/api/nkm-cms/category/del', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (25, 'article:api:list', '列表接口', 'system:resource:api', 34, '', '', 10, '/api/nkm-cms/article/list', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (26, 'article:api:detail', '详情接口', 'system:resource:api', 21, '', '', 10, '/api/nkm-cms/article/detail/:id', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (27, 'article:api:save', '保存接口', 'system:resource:api', 21, '', '', 10, '/api/nkm-cms/article/save', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (28, 'article:api:del', '删除接口', 'system:resource:api', 34, '', '', 10, '/api/nkm-cms/article/del', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (29, 'resource:api:list', '列表', 'system:resource:api', 3, '', '', 0, '/api/nkm-cms/system/resource/list', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (30, 'article-manager', '文章管理', 'system:resource:menu', 0, '', 'el-icon-notebook-2', 3, '/article', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (31, 'tags', '标签列表', 'system:resource:menu', 30, '', 'el-icon-collection-tag', 3, '/article/tags', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (32, 'placeholder1', '占位', 'placeholder', 7, '', '', 0, '', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (33, 'placeholder2', '占位', 'placeholder', 4, '', '', 0, '', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (34, 'article:list', '文章列表', 'system:resource:menu', 30, '', 'el-icon-menu', 0, '/article/list', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (35, 'modify-password', '修改密码', 'system:resource:btn', 6, '', '', 0, '', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (36, 'placeholder3', '占位', 'placeholder', 6, '', '', 0, '', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (37, 'media', '媒体库', 'system:resource:menu', 0, '', 'el-icon-video-camera', 3, '/media', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (38, 'media-read-dir', '读取目录-接口', 'system:resource:api', 37, '', '', 0, '/api/nkm-cms/media/read-directory', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (39, 'media-del-file', '删除文件-接口', 'system:resource:api', 37, '', '', 0, '/api/nkm-cms/media/del', 1, '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_resource` (`id`, `code`, `name`, `type`, `parent_id`, `parent_code`, `icon`, `sort`, `path`, `enabled`, `create_time`, `is_deleted`) VALUES (40, 'media-create-dir', '新建目录-接口', 'system:resource:api', 37, '', '', 0, '/api/nkm-cms/media/create-directory', 1, '2019-08-14 12:54:50', 0);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of nkm_role
-- ----------------------------
BEGIN;
INSERT INTO `nkm_role` (`id`, `name`, `code`, `permission`, `create_time`, `is_deleted`) VALUES (1, '系统管理员', 'systemAdministrator', '5,35,30,34,25,28,21,26,27,19,22,23,24,31,37,2,8,9,10,11,12,3,13,14,29,15,16,17,18,6,1,4,7', '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_role` (`id`, `name`, `code`, `permission`, `create_time`, `is_deleted`) VALUES (2, '测试', 'test', '5,6,21,20', '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_role` (`id`, `name`, `code`, `permission`, `create_time`, `is_deleted`) VALUES (3, '测试管理员', 'testAdmin', '5,36,30,34,25,28,21,26,27,19,22,23,24,31,38,40,8,9,29,33,32,6,37,1,2,3,4,7', '2019-08-14 12:54:50', 0);
INSERT INTO `nkm_role` (`id`, `name`, `code`, `permission`, `create_time`, `is_deleted`) VALUES (4, '文章发布管理员', 'articleManager', '5,36,22,23,20,34,21,25,26,27,28,6,30,19', '2019-08-14 12:54:50', 0);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of nkm_users
-- ----------------------------
BEGIN;
INSERT INTO `nkm_users` (`id`, `login_name`, `password`, `display_name`, `email`, `role`, `registered_time`, `last_login_time`, `status`, `is_system_admin`, `avatar`, `agent`, `is_deleted`) VALUES (1, 'admin', 'U2FsdGVkX1/nkZ53+gUWe+lG/z4SFcLr+d5Dik8W7hczuIDTb4tWJb6jaWDHYaBnwrsqCrS7YJ4ThNc89xI8Hg==', '系统管理员', 'me@example.com', 'systemAdministrator', '2019-08-14 12:54:50', '2022-04-24 12:29:59', 1, 1, '/api/nkm-cms/readFile?path=/upload/2020/12/account/20201229120252134549.JPG', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', 0);
INSERT INTO `nkm_users` (`id`, `login_name`, `password`, `display_name`, `email`, `role`, `registered_time`, `last_login_time`, `status`, `is_system_admin`, `avatar`, `agent`, `is_deleted`) VALUES (2, 'test', 'U2FsdGVkX1+NzoURm3qDnMy0BgkZ+XXtVjKHEu9zJpAful/0/WzVrI6xO3YH8cqpeNKxygrXbSTA9mP7kdlgQw==', '测试人员1', 'm@example.com', 'articleManager', '2019-08-14 12:54:50', '2019-08-14 12:54:50', 1, 0, '/api/nkm-admin/readFile?path=/upload/2020/06/account/20200616171102099796.png', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', 0);
INSERT INTO `nkm_users` (`id`, `login_name`, `password`, `display_name`, `email`, `role`, `registered_time`, `last_login_time`, `status`, `is_system_admin`, `avatar`, `agent`, `is_deleted`) VALUES (3, 'testAdmin', 'U2FsdGVkX18iUgcZ9YcUHelobswR5NLMqRt/mOEYl6in6mjRGcXVRKNskixBQ68hx5hXTPOHkxKgfEnYmzPDOQ==', '测试管理员', 'me@example.com', 'testAdmin,articleManager', '2019-08-14 12:54:50', '2019-08-14 12:54:50', 1, 0, '/img/Fruit-1.ec29dc10.png', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
