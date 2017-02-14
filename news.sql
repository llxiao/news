/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : news

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-02-14 10:34:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for news_category
-- ----------------------------
DROP TABLE IF EXISTS `news_category`;
CREATE TABLE `news_category` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='新闻分类表';

-- ----------------------------
-- Records of news_category
-- ----------------------------
INSERT INTO `news_category` VALUES ('1', '国内', '2014-09-16 14:41:24');
INSERT INTO `news_category` VALUES ('2', '国际', '2014-09-16 14:42:58');
INSERT INTO `news_category` VALUES ('3', '娱乐', '2014-09-16 14:42:58');
INSERT INTO `news_category` VALUES ('4', '军事', '2014-09-16 14:42:58');
INSERT INTO `news_category` VALUES ('5', '财经', '2014-09-16 14:42:58');
INSERT INTO `news_category` VALUES ('6', '天气', '2014-09-16 14:42:58');

-- ----------------------------
-- Table structure for news_comment
-- ----------------------------
DROP TABLE IF EXISTS `news_comment`;
CREATE TABLE `news_comment` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `newsId` bigint(10) DEFAULT NULL COMMENT '评论新闻id',
  `content` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '评论内容',
  `author` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '评论者',
  `ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '评论ip',
  `createDate` datetime DEFAULT NULL COMMENT '发表时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='新闻评论表';

-- ----------------------------
-- Records of news_comment
-- ----------------------------

-- ----------------------------
-- Table structure for news_detail
-- ----------------------------
DROP TABLE IF EXISTS `news_detail`;
CREATE TABLE `news_detail` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `categoryId` bigint(10) DEFAULT NULL COMMENT '新闻类别id',
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '新闻标题',
  `summary` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '新闻摘要',
  `content` text COLLATE utf8_unicode_ci COMMENT '新闻内容',
  `picPath` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '新闻图片路径',
  `author` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发表者',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyDate` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='新闻明细表';

-- ----------------------------
-- Records of news_detail
-- ----------------------------
INSERT INTO `news_detail` VALUES ('9', '1', '影魔进一步削弱', '更新日志', '更新', null, 'lxiao', '2017-02-06 14:00:02', null);
INSERT INTO `news_detail` VALUES ('10', '1', '浙江温州皮革厂倒闭了', '倒闭', '浙江温州皮革厂倒闭了，王八蛋老板黄鹤不是人，带着小姨子跑了', null, 'test', '2017-02-06 20:03:52', null);
INSERT INTO `news_detail` VALUES ('11', '6', '明天全国大降雪', '降温 降雪', '<p>\r\n	<span style=\"color:#ff0000;\"><span style=\"font-size:22px;\">全国范围降雪，大范围</span></span></p>\r\n', null, '李晓', '2017-02-06 20:13:48', '2017-02-14 09:19:50');
INSERT INTO `news_detail` VALUES ('8', '6', '集五福', '支付宝集五福', '集五福', null, 'admin', '2017-01-22 11:29:52', null);
INSERT INTO `news_detail` VALUES ('7', '6', '集五福', '支付宝集五福', '集五福', null, 'admin', '2017-01-22 10:02:26', null);

-- ----------------------------
-- Table structure for news_user
-- ----------------------------
DROP TABLE IF EXISTS `news_user`;
CREATE TABLE `news_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `userName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'email',
  `userType` int(5) DEFAULT NULL COMMENT '用户类型  0：管理员 1：普通用户',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of news_user
-- ----------------------------
INSERT INTO `news_user` VALUES ('1', 'admin', 'admin', 'admin@bdqn.cn', '0');
INSERT INTO `news_user` VALUES ('2', 'user', 'user', 'user@bdqn.cn', '1');
INSERT INTO `news_user` VALUES ('3', 'test', 'test', 'test@bdqn.cn', '1');
SET FOREIGN_KEY_CHECKS=1;
