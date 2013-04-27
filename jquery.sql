/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : jquery

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2013-04-27 17:32:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sno` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sprice` double NOT NULL,
  `isupsale` bit(1) NOT NULL,
  `isessence` bit(1) NOT NULL,
  `isnew` bit(1) NOT NULL,
  `ishotsale` bit(1) NOT NULL,
  `sort` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `state` bit(1) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '诺基亚N85', 'ECS323', '3030', '', '', '', '', '100', '4', '');
INSERT INTO `goods` VALUES ('2', '摩托罗拉E8', 'ECS31', '1337', '', '', '', '', '100', '1', '');
INSERT INTO `goods` VALUES ('3', 'P806', 'ECS24', '2000', '', '', '', '', '100', '100', '');
INSERT INTO `goods` VALUES ('4', '诺基亚N96', 'ECS23', '3700', '', '', '', '', '100', '8', '');
INSERT INTO `goods` VALUES ('5', '多普达Touch HD', 'ECS22', '5999', '', '', '', '', '100', '1', '');
INSERT INTO `goods` VALUES ('6', '金立A30', 'ECS21', '2000', '', '', '', '', '100', '40', '');
INSERT INTO `goods` VALUES ('7', '三星BC01', 'ECS20', '280', '', '', '', '', '100', '12', '');
INSERT INTO `goods` VALUES ('8', '三星SGH-F258', 'ECS19', '858', '', '', '', '', '100', '12', '');
INSERT INTO `goods` VALUES ('9', '夏新N7', 'ECS17', '2300', '', '', '', '', '100', '1', '');
INSERT INTO `goods` VALUES ('10', '恒基伟业G101', 'ECS16', '823.33', '', '', '', '', '100', '0', '');
INSERT INTO `goods` VALUES ('11', '诺基亚5800XM', 'ECS14', '2625', '', '', '', '', '100', '1', '');
INSERT INTO `goods` VALUES ('12', '摩托罗拉A810', 'ECS12', '983', '', '', '', '', '100', '8', '');
INSERT INTO `goods` VALUES ('13', '索爱C702c', 'ECS10', '1328', '', '', '', '', '100', '7', '');
INSERT INTO `goods` VALUES ('14', '诺基亚E66', 'ECS9', '2298', '', '', '', '', '100', '4', '');
INSERT INTO `goods` VALUES ('15', '飞利浦9@9v', 'ECS8', '399', '', '', '', '', '100', '1', '');
INSERT INTO `goods` VALUES ('16', '诺基亚N85原装立体声耳机HS-82', 'ECS7', '100', '', '', '', '', '100', '20', '');
INSERT INTO `goods` VALUES ('17', '胜创KINGMAX内存卡', 'ECS6', '42', '', '', '', '', '100', '15', '');
INSERT INTO `goods` VALUES ('18', '索爱原装M2卡读卡器', 'ECS5', '20', '', '', '', '', '100', '8', '');
INSERT INTO `goods` VALUES ('19', '诺基亚N85原装充电器', 'ECS4', '58', '', '', '', '', '100', '17', '');
INSERT INTO `goods` VALUES ('20', '诺基亚原装5800耳机', 'ECS2', '68', '', '', '', '', '100', '24', '');
INSERT INTO `goods` VALUES ('21', 'KD876', 'ECS0', '1388', '', '', '', '', '100', '1', '');
