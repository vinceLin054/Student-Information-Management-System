/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : system

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-06-20 09:31:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` varchar(50) NOT NULL,
  `adminName` varchar(20) NOT NULL,
  `adminPassword` varchar(20) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('0', 'admin', 'admin');

-- ----------------------------
-- Table structure for clazz
-- ----------------------------
DROP TABLE IF EXISTS `clazz`;
CREATE TABLE `clazz` (
  `classId` varchar(50) NOT NULL,
  `className` varchar(20) NOT NULL,
  PRIMARY KEY (`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clazz
-- ----------------------------
INSERT INTO `clazz` VALUES ('1', '六年1班');
INSERT INTO `clazz` VALUES ('2', '六年2班');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `studentId` varchar(50) NOT NULL,
  `studentNo` varchar(20) NOT NULL,
  `studentName` varchar(10) NOT NULL,
  `studentSex` varchar(2) NOT NULL,
  `studentPhone` varchar(20) NOT NULL,
  `classId` varchar(50) NOT NULL,
  PRIMARY KEY (`studentId`),
  KEY `FK3n7j27l6qstu9uri4ve7waj02` (`classId`),
  CONSTRAINT `FK3n7j27l6qstu9uri4ve7waj02` FOREIGN KEY (`classId`) REFERENCES `clazz` (`classId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '1', '张三', '男', '1312312313', '1');
INSERT INTO `student` VALUES ('2', '2', '李四', '男', '1232231231', '1');
INSERT INTO `student` VALUES ('4', '4', '王俊凯', '男', '1312312312', '2');
INSERT INTO `student` VALUES ('5', '5', '王源', '男', '1312312312', '2');
