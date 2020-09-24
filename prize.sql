/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-09-24 17:15:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for prize
-- ----------------------------
DROP TABLE IF EXISTS `prize`;
CREATE TABLE `prize` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prize` varchar(20) CHARACTER SET utf8 COLLATE utf8_sinhala_ci DEFAULT NULL,
  `inventory` int(10) unsigned DEFAULT NULL,
  `rate` int(5) unsigned DEFAULT '0' COMMENT '中奖概率。万分之',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='奖品表';

-- ----------------------------
-- Records of prize
-- ----------------------------
INSERT INTO `prize` VALUES ('1', '一等奖', '8', '1', '2020-09-02 14:42:05', '2020-09-23 08:33:13', null);
INSERT INTO `prize` VALUES ('2', '二等奖', '50', '5', '2020-09-02 14:42:57', '2020-09-23 15:07:22', null);
INSERT INTO `prize` VALUES ('3', '三等奖', '200', '10', '2020-09-02 14:43:11', '2020-09-23 15:07:25', null);
INSERT INTO `prize` VALUES ('4', '四等奖', '996', '100', '2020-09-02 14:43:23', '2020-09-23 07:21:00', null);
INSERT INTO `prize` VALUES ('5', '五等奖', '999964', '10000', '2020-09-02 14:43:37', '2020-09-24 02:41:54', null);

-- ----------------------------
-- Table structure for prize_record
-- ----------------------------
DROP TABLE IF EXISTS `prize_record`;
CREATE TABLE `prize_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '用户id',
  `prize_id` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '奖品id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COMMENT='中奖纪录表';

-- ----------------------------
-- Records of prize_record
-- ----------------------------
INSERT INTO `prize_record` VALUES ('1', '1', '5', '2020-09-23 06:02:10', '2020-09-23 06:02:10', null);
INSERT INTO `prize_record` VALUES ('2', '1', '4', '2020-09-23 06:53:12', '2020-09-23 06:53:12', null);
INSERT INTO `prize_record` VALUES ('3', '1', '4', '2020-09-23 06:53:15', '2020-09-23 06:53:15', null);
INSERT INTO `prize_record` VALUES ('4', '1', '4', '2020-09-23 06:54:16', '2020-09-23 06:54:16', null);
INSERT INTO `prize_record` VALUES ('5', '1', '3', '2020-09-23 06:54:20', '2020-09-23 06:54:20', null);
INSERT INTO `prize_record` VALUES ('6', '1', '3', '2020-09-23 06:54:31', '2020-09-23 06:54:31', null);
INSERT INTO `prize_record` VALUES ('7', '1', '4', '2020-09-23 06:55:18', '2020-09-23 06:55:18', null);
INSERT INTO `prize_record` VALUES ('8', '1', '4', '2020-09-23 06:55:19', '2020-09-23 06:55:19', null);
INSERT INTO `prize_record` VALUES ('9', '1', '3', '2020-09-23 06:55:20', '2020-09-23 06:55:20', null);
INSERT INTO `prize_record` VALUES ('10', '1', '3', '2020-09-23 06:55:20', '2020-09-23 06:55:20', null);
INSERT INTO `prize_record` VALUES ('11', '1', '2', '2020-09-23 06:55:21', '2020-09-23 06:55:21', null);
INSERT INTO `prize_record` VALUES ('12', '1', '4', '2020-09-23 07:19:32', '2020-09-23 07:19:32', null);
INSERT INTO `prize_record` VALUES ('13', '1', '4', '2020-09-23 07:20:24', '2020-09-23 07:20:24', null);
INSERT INTO `prize_record` VALUES ('14', '1', '4', '2020-09-23 07:20:46', '2020-09-23 07:20:46', null);
INSERT INTO `prize_record` VALUES ('15', '1', '4', '2020-09-23 07:21:00', '2020-09-23 07:21:00', null);
INSERT INTO `prize_record` VALUES ('16', '1', '0', '2020-09-23 08:27:20', '2020-09-23 08:27:20', null);
INSERT INTO `prize_record` VALUES ('17', '1', '0', '2020-09-23 08:27:23', '2020-09-23 08:27:23', null);
INSERT INTO `prize_record` VALUES ('18', '1', '0', '2020-09-23 08:27:24', '2020-09-23 08:27:24', null);
INSERT INTO `prize_record` VALUES ('19', '1', '0', '2020-09-23 08:27:24', '2020-09-23 08:27:24', null);
INSERT INTO `prize_record` VALUES ('20', '1', '0', '2020-09-23 08:27:25', '2020-09-23 08:27:25', null);
INSERT INTO `prize_record` VALUES ('21', '1', '0', '2020-09-23 08:27:25', '2020-09-23 08:27:25', null);
INSERT INTO `prize_record` VALUES ('22', '1', '0', '2020-09-23 08:27:26', '2020-09-23 08:27:26', null);
INSERT INTO `prize_record` VALUES ('23', '1', '0', '2020-09-23 08:27:26', '2020-09-23 08:27:26', null);
INSERT INTO `prize_record` VALUES ('24', '1', '0', '2020-09-23 08:27:27', '2020-09-23 08:27:27', null);
INSERT INTO `prize_record` VALUES ('25', '1', '0', '2020-09-23 08:27:27', '2020-09-23 08:27:27', null);
INSERT INTO `prize_record` VALUES ('26', '1', '0', '2020-09-23 08:29:35', '2020-09-23 08:29:35', null);
INSERT INTO `prize_record` VALUES ('27', '1', '0', '2020-09-23 08:29:36', '2020-09-23 08:29:36', null);
INSERT INTO `prize_record` VALUES ('28', '1', '1', '2020-09-23 08:29:37', '2020-09-23 08:29:37', null);
INSERT INTO `prize_record` VALUES ('29', '1', '0', '2020-09-23 08:29:37', '2020-09-23 08:29:37', null);
INSERT INTO `prize_record` VALUES ('30', '1', '0', '2020-09-23 08:29:38', '2020-09-23 08:29:38', null);
INSERT INTO `prize_record` VALUES ('31', '1', '0', '2020-09-23 08:29:39', '2020-09-23 08:29:39', null);
INSERT INTO `prize_record` VALUES ('32', '1', '0', '2020-09-23 08:29:39', '2020-09-23 08:29:39', null);
INSERT INTO `prize_record` VALUES ('33', '1', '0', '2020-09-23 08:29:40', '2020-09-23 08:29:40', null);
INSERT INTO `prize_record` VALUES ('34', '1', '0', '2020-09-23 08:29:41', '2020-09-23 08:29:41', null);
INSERT INTO `prize_record` VALUES ('35', '1', '1', '2020-09-23 08:33:13', '2020-09-23 08:33:13', null);
INSERT INTO `prize_record` VALUES ('36', '1', '5', '2020-09-23 08:33:15', '2020-09-23 08:33:15', null);
INSERT INTO `prize_record` VALUES ('37', '1', '5', '2020-09-23 08:33:16', '2020-09-23 08:33:16', null);
INSERT INTO `prize_record` VALUES ('38', '1', '5', '2020-09-23 08:33:16', '2020-09-23 08:33:16', null);
INSERT INTO `prize_record` VALUES ('39', '1', '5', '2020-09-23 08:33:17', '2020-09-23 08:33:17', null);
INSERT INTO `prize_record` VALUES ('40', '1', '5', '2020-09-23 08:33:18', '2020-09-23 08:33:18', null);
INSERT INTO `prize_record` VALUES ('41', '1', '5', '2020-09-23 08:33:18', '2020-09-23 08:33:18', null);
INSERT INTO `prize_record` VALUES ('42', '1', '5', '2020-09-23 08:33:19', '2020-09-23 08:33:19', null);
INSERT INTO `prize_record` VALUES ('43', '1', '5', '2020-09-23 08:33:19', '2020-09-23 08:33:19', null);
INSERT INTO `prize_record` VALUES ('44', '1', '5', '2020-09-23 08:33:19', '2020-09-23 08:33:19', null);
INSERT INTO `prize_record` VALUES ('45', '1', '5', '2020-09-23 08:33:20', '2020-09-23 08:33:20', null);
INSERT INTO `prize_record` VALUES ('46', '1', '5', '2020-09-23 08:33:20', '2020-09-23 08:33:20', null);
INSERT INTO `prize_record` VALUES ('47', '1', '5', '2020-09-23 08:33:21', '2020-09-23 08:33:21', null);
INSERT INTO `prize_record` VALUES ('48', '1', '5', '2020-09-23 08:49:24', '2020-09-23 08:49:24', null);
INSERT INTO `prize_record` VALUES ('49', '1', '5', '2020-09-23 08:49:26', '2020-09-23 08:49:26', null);
INSERT INTO `prize_record` VALUES ('50', '1', '5', '2020-09-23 08:49:26', '2020-09-23 08:49:26', null);
INSERT INTO `prize_record` VALUES ('51', '1', '5', '2020-09-23 08:49:26', '2020-09-23 08:49:26', null);
INSERT INTO `prize_record` VALUES ('52', '1', '5', '2020-09-23 08:49:27', '2020-09-23 08:49:27', null);
INSERT INTO `prize_record` VALUES ('53', '1', '5', '2020-09-23 08:49:27', '2020-09-23 08:49:27', null);
INSERT INTO `prize_record` VALUES ('54', '1', '5', '2020-09-23 08:49:27', '2020-09-23 08:49:27', null);
INSERT INTO `prize_record` VALUES ('55', '1', '5', '2020-09-23 08:49:27', '2020-09-23 08:49:27', null);
INSERT INTO `prize_record` VALUES ('56', '1', '5', '2020-09-24 02:30:24', '2020-09-24 02:30:24', null);
INSERT INTO `prize_record` VALUES ('57', '1', '5', '2020-09-24 02:33:03', '2020-09-24 02:33:03', null);
INSERT INTO `prize_record` VALUES ('58', '1', '5', '2020-09-24 02:33:05', '2020-09-24 02:33:05', null);
INSERT INTO `prize_record` VALUES ('59', '1', '5', '2020-09-24 02:33:06', '2020-09-24 02:33:06', null);
INSERT INTO `prize_record` VALUES ('60', '1', '5', '2020-09-24 02:33:06', '2020-09-24 02:33:06', null);
INSERT INTO `prize_record` VALUES ('61', '1', '5', '2020-09-24 02:33:07', '2020-09-24 02:33:07', null);
INSERT INTO `prize_record` VALUES ('62', '1', '5', '2020-09-24 02:33:07', '2020-09-24 02:33:07', null);
INSERT INTO `prize_record` VALUES ('63', '1', '5', '2020-09-24 02:33:08', '2020-09-24 02:33:08', null);
INSERT INTO `prize_record` VALUES ('64', '1', '5', '2020-09-24 02:33:08', '2020-09-24 02:33:08', null);
INSERT INTO `prize_record` VALUES ('65', '1', '5', '2020-09-24 02:33:09', '2020-09-24 02:33:09', null);
INSERT INTO `prize_record` VALUES ('66', '1', '5', '2020-09-24 02:33:09', '2020-09-24 02:33:09', null);
INSERT INTO `prize_record` VALUES ('67', '1', '5', '2020-09-24 02:33:09', '2020-09-24 02:33:09', null);
INSERT INTO `prize_record` VALUES ('68', '1', '5', '2020-09-24 02:33:10', '2020-09-24 02:33:10', null);
INSERT INTO `prize_record` VALUES ('69', '1', '5', '2020-09-24 02:40:27', '2020-09-24 02:40:27', null);
INSERT INTO `prize_record` VALUES ('70', '1', '5', '2020-09-24 02:41:34', '2020-09-24 02:41:34', null);
INSERT INTO `prize_record` VALUES ('71', '1', '5', '2020-09-24 02:41:54', '2020-09-24 02:41:54', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名称',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'test1', '2020-09-23 10:10:22', '2020-09-23 10:10:25', null);
INSERT INTO `user` VALUES ('2', 'test2', '2020-09-23 10:10:22', '2020-09-23 10:10:25', null);
