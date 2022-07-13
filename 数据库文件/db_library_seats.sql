/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_library_seats

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-11-29 16:14:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bbs`
-- ----------------------------
DROP TABLE IF EXISTS `bbs`;
CREATE TABLE `bbs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '交流主键',
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `author` varchar(64) DEFAULT NULL COMMENT '学号或者工号',
  `time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `reply` int(11) DEFAULT NULL COMMENT '回复数量',
  `lastreply` varchar(64) DEFAULT NULL COMMENT '最后回复人',
  `lastreplytime` varchar(32) DEFAULT NULL COMMENT '最后访问时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs
-- ----------------------------
INSERT INTO `bbs` VALUES ('1', '有没有一起去上自习的？', 'xs001', '2016-04-19 15:31:10', '4', 'xs001', '2016-04-19 15:32:50');
INSERT INTO `bbs` VALUES ('2', '在7号自习室有没有看到一把伞', 'xs002', '2016-04-19 15:34:30', '6', 'xs001', '2018-11-26 16:33:31');
INSERT INTO `bbs` VALUES ('3', '明天早上有人愿意去自习吗？', 'xs004', '2018-11-26 16:40:49', '3', 'xs004', '2018-11-29 14:03:07');
INSERT INTO `bbs` VALUES ('4', '交朋友喽', 'xs004', '2018-11-29 14:02:57', '1', 'xs004', '2018-11-29 14:02:57');

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '书籍自增主键',
  `name` varchar(128) DEFAULT NULL COMMENT '书名',
  `author` varchar(128) DEFAULT NULL COMMENT '作者',
  `publish` varchar(128) DEFAULT NULL COMMENT '出版社',
  `cover` varchar(128) DEFAULT NULL COMMENT '封面图片',
  `remarks` varchar(500) DEFAULT NULL COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('2', '数据结构', '严蔚敏', '人民邮电出版社', '/LibrarySeats/upload/book/1543472468200.jpg', '这本书是C语言版本的数据结构基础。讲解清晰');
INSERT INTO `book` VALUES ('3', 'java从入门到精通', '其他', '清华大学出版社', '/LibrarySeats/upload/book/1543472446755.jpg', '很好的讲解了java的基础知识，巩固面向对象等核心内容。');

-- ----------------------------
-- Table structure for `choice`
-- ----------------------------
DROP TABLE IF EXISTS `choice`;
CREATE TABLE `choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '座位选择表',
  `studentno` varchar(32) DEFAULT NULL COMMENT '学号',
  `seatkeyword` varchar(64) DEFAULT NULL COMMENT '座位号key',
  `time` varchar(32) DEFAULT NULL COMMENT '选择时间',
  `status` char(1) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of choice
-- ----------------------------
INSERT INTO `choice` VALUES ('1', 'xs001', '2016-04-19-08点-12点-1-1-1', '2016-04-19 16:13:23', '1');
INSERT INTO `choice` VALUES ('6', 'xs003', '2016-04-21-18点-22点-1-2-3', '2016-04-21 10:10:47', '1');
INSERT INTO `choice` VALUES ('7', 'xs003', '2016-04-21-08点-12点-1-2-3', '2016-04-21 12:06:38', '1');
INSERT INTO `choice` VALUES ('15', 'xs001', '2018-11-26-08点-12点-1-3-7', '2018-11-26 16:32:23', '1');
INSERT INTO `choice` VALUES ('16', 'xs004', '2018-11-28-08点-12点-1-1-2', '2018-11-28 15:21:39', '1');
INSERT INTO `choice` VALUES ('17', 'xs004', '2018-11-28-14点-18点-2-2-8', '2018-11-28 15:23:41', '1');
INSERT INTO `choice` VALUES ('18', 'xs004', '2018-11-28-18点-22点-2-2-7', '2018-11-28 15:25:11', '1');
INSERT INTO `choice` VALUES ('19', 'xs003', '2018-11-28-08点-12点-1-1-4', '2018-11-28 15:31:57', '1');
INSERT INTO `choice` VALUES ('21', 'xs003', '2018-11-28-18点-22点-1-3-4', '2018-11-28 15:33:47', '1');
INSERT INTO `choice` VALUES ('22', 'xs003', '2018-11-28-14点-18点-2-3-8', '2018-11-28 16:44:12', '1');
INSERT INTO `choice` VALUES ('23', 'xs004', '2018-11-29-08点-12点-1-3-6', '2018-11-29 15:59:54', '0');
INSERT INTO `choice` VALUES ('24', 'xs004', '2018-11-29-14点-18点-2-3-6', '2018-11-29 16:00:15', '0');
INSERT INTO `choice` VALUES ('25', 'xs004', '2018-11-29-18点-22点-5-5-7', '2018-11-29 16:00:40', '0');
INSERT INTO `choice` VALUES ('26', 'xs002', '2018-11-29-08点-12点-1-4-3', '2018-11-29 16:02:57', '0');
INSERT INTO `choice` VALUES ('27', 'xs003', '2018-11-29-08点-12点-1-2-5', '2018-11-29 16:03:47', '0');
INSERT INTO `choice` VALUES ('28', 'xs005', '2018-11-29-08点-12点-1-4-6', '2018-11-29 16:06:25', '0');
INSERT INTO `choice` VALUES ('29', 'xs005', '2018-11-29-14点-18点-2-5-4', '2018-11-29 16:06:38', '0');
INSERT INTO `choice` VALUES ('30', 'xs005', '2018-11-29-18点-22点-3-4-9', '2018-11-29 16:06:48', '0');

-- ----------------------------
-- Table structure for `clazz`
-- ----------------------------
DROP TABLE IF EXISTS `clazz`;
CREATE TABLE `clazz` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级主键',
  `xueyuan` varchar(128) DEFAULT NULL COMMENT '所属学院',
  `zhuanye` varchar(128) DEFAULT NULL COMMENT '所属专业',
  `teacherno` varchar(32) DEFAULT NULL COMMENT '辅导员，编号',
  `name` varchar(128) DEFAULT NULL COMMENT '班级名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clazz
-- ----------------------------
INSERT INTO `clazz` VALUES ('1', '计算机学院', '软件系', 'JS001', '软件一班');
INSERT INTO `clazz` VALUES ('2', '计算机学院', '软件系', 'JS002', '软件二班');
INSERT INTO `clazz` VALUES ('5', '计算机学院', '计算机', 'js003', '计算机一班');

-- ----------------------------
-- Table structure for `illegal`
-- ----------------------------
DROP TABLE IF EXISTS `illegal`;
CREATE TABLE `illegal` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '违章信息ID',
  `studentno` varchar(32) DEFAULT NULL COMMENT '学号',
  `time` varchar(32) DEFAULT NULL COMMENT '违章时间',
  `score` int(11) DEFAULT NULL COMMENT '所扣分数',
  `remarks` varchar(256) DEFAULT NULL COMMENT '违章简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of illegal
-- ----------------------------
INSERT INTO `illegal` VALUES ('4', 'xs001', '2016-04-06 02:27:39', '10', '吃东西');
INSERT INTO `illegal` VALUES ('5', 'xs001', '2016-04-05 02:30:44', '10', '吵闹');
INSERT INTO `illegal` VALUES ('6', 'xs002', '2016-04-13 18:44:59', '5', '睡觉');
INSERT INTO `illegal` VALUES ('7', 'xs001', '2018-11-29 14:50:15', '5', '睡觉');
INSERT INTO `illegal` VALUES ('8', 'xs002', '2018-11-15 14:50:36', '5', '吃东西');
INSERT INTO `illegal` VALUES ('9', 'xs003', '2018-11-29 14:50:54', '10', '站着矛肯不拉屎，没来。');
INSERT INTO `illegal` VALUES ('10', 'xs004', '2018-11-22 14:51:32', '10', '吃东西');
INSERT INTO `illegal` VALUES ('11', 'xs004', '2018-11-29 14:51:45', '5', '大声喧哗');
INSERT INTO `illegal` VALUES ('12', 'xs004', '2018-11-28 14:52:17', '-5', '看书认真');
INSERT INTO `illegal` VALUES ('13', 'xs002', '2018-06-13 14:53:01', '5', '迟到');
INSERT INTO `illegal` VALUES ('14', 'xs002', '2018-06-14 14:53:22', '2', '不好好学习');
INSERT INTO `illegal` VALUES ('15', 'xs003', '2018-03-20 14:53:47', '2', '睡觉');
INSERT INTO `illegal` VALUES ('16', 'xs001', '2018-01-04 15:56:47', '5', '吃饭');
INSERT INTO `illegal` VALUES ('17', 'xs001', '2018-03-08 15:57:06', '5', '喝奶茶');
INSERT INTO `illegal` VALUES ('18', 'xs001', '2018-05-17 15:57:30', '15', '大声喧哗');
INSERT INTO `illegal` VALUES ('19', 'xs002', '2018-05-08 15:57:51', '3', '睡觉');
INSERT INTO `illegal` VALUES ('20', 'xs003', '2018-05-15 15:58:29', '5', '打瞌睡');
INSERT INTO `illegal` VALUES ('21', 'xs003', '2018-05-09 15:58:49', '5', '影响别人');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `logId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志',
  `userName` varchar(30) DEFAULT NULL COMMENT '操作人',
  `createTime` varchar(30) DEFAULT NULL COMMENT '时间',
  `content` text COMMENT '详细',
  `operation` varchar(300) DEFAULT NULL COMMENT '操作类型（增删改）',
  `ip` varchar(60) DEFAULT NULL COMMENT 'IP地址',
  `module` varchar(40) DEFAULT NULL COMMENT '所属模块',
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB AUTO_INCREMENT=2546 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('2316', 'admin', '2016-04-17 10:37:44', '修改Menu 属性名和值： Seq-->6   MenuId-->37   MenuName-->选座管理   IconCls-->icon-item   MenuUrl-->   MenuDescription-->  ', '修改', '127.0.0.1', 'menu');
INSERT INTO `log` VALUES ('2317', 'admin', '2016-04-17 10:38:04', '添加Menu 属性名和值： Seq-->1   MenuName-->选座   IconCls-->icon-item   MenuUrl-->seat/seatIndex.htm   MenuDescription-->   ParentId-->37  ', '添加', '127.0.0.1', 'menu');
INSERT INTO `log` VALUES ('2318', 'admin', '2016-04-17 10:38:04', '修改Menu 属性名和值： State-->closed   MenuId-->37  ', '修改', '127.0.0.1', 'menu');
INSERT INTO `log` VALUES ('2319', 'admin', '2016-04-17 10:38:14', '修改Role 属性名和值： RoleId-->1   OperationIds-->10003,10004,10005,10006,10007,10008,10009,10000,10001,10002,10014,10011,10012,10013,100018,100019,100020,100015,100016,100017,100021,100022,100023,100024,100025,100026,100027,100028,100029,100030,100031,100032   MenuIds-->1,2,6,7,5,26,28,30,29,31,32,33,34,35,36,37,38,15,16  ', '修改', '127.0.0.1', 'role');
INSERT INTO `log` VALUES ('2320', 'admin', '2016-04-18 14:03:18', '修改Role 属性名和值： RoleId-->3   OperationIds-->100034   MenuIds-->1,32,33,34,35,36,37,38,15,16  ', '修改', '127.0.0.1', 'role');
INSERT INTO `log` VALUES ('2321', 'xs001', '2016-04-18 15:30:20', '添加Choice 属性名和值： Time-->2016-04-18   Studentno-->xs001   Seatkeyword-->2016-04-18-8点-12点-1-1-1  ', '添加', '127.0.0.1', 'choice');
INSERT INTO `log` VALUES ('2322', 'xs001', '2016-04-18 16:24:51', '添加Choice 属性名和值： Time-->2016-04-18 16:24:51   Studentno-->xs001   Seatkeyword-->2016-04-18-8点-12点-1-1-1  ', '添加', '127.0.0.1', 'choice');
INSERT INTO `log` VALUES ('2323', 'xs001', '2016-04-18 16:24:56', '添加Choice 属性名和值： Time-->2016-04-18 16:24:56   Studentno-->xs001   Seatkeyword-->2016-04-18-8点-12点-1-1-2  ', '添加', '127.0.0.1', 'choice');
INSERT INTO `log` VALUES ('2324', 'xs001', '2016-04-18 16:28:50', '添加Choice 属性名和值： Time-->2016-04-18 16:28:50   Studentno-->xs001   Seatkeyword-->2016-04-18-8点-12点-1-1-1  ', '添加', '127.0.0.1', 'choice');
INSERT INTO `log` VALUES ('2325', 'xs001', '2016-04-18 16:29:07', '添加Choice 属性名和值： Time-->2016-04-18 16:29:07   Studentno-->xs001   Seatkeyword-->2016-04-18-8点-12点-1-1-2  ', '添加', '127.0.0.1', 'choice');
INSERT INTO `log` VALUES ('2326', 'xs001', '2016-04-18 16:31:29', '添加Choice 属性名和值： Time-->2016-04-18 16:31:29   Studentno-->xs001   Seatkeyword-->2016-04-18-8点-12点-1-1-1  ', '添加', '127.0.0.1', 'choice');
INSERT INTO `log` VALUES ('2327', 'xs001', '2016-04-18 16:31:48', '添加Choice 属性名和值： Time-->2016-04-18 16:31:48   Studentno-->xs001   Seatkeyword-->2016-04-18-8点-12点-1-1-2  ', '添加', '127.0.0.1', 'choice');
INSERT INTO `log` VALUES ('2328', 'xs001', '2016-04-18 16:34:17', '添加Choice 属性名和值： Time-->2016-04-18 16:34:17   Studentno-->xs001   Seatkeyword-->2016-04-18-8点-12点-1-1-1  ', '添加', '127.0.0.1', 'choice');
INSERT INTO `log` VALUES ('2329', 'xs001', '2016-04-18 16:34:53', '添加Choice 属性名和值： Time-->2016-04-18 16:34:53   Studentno-->xs001   Seatkeyword-->2016-04-18-14点-18点-2-1-5  ', '添加', '127.0.0.1', 'choice');
INSERT INTO `log` VALUES ('2330', 'xs001', '2016-04-18 16:35:05', '添加Choice 属性名和值： Time-->2016-04-18 16:35:05   Studentno-->xs001   Seatkeyword-->2016-04-18-18点-22点-2-1-6  ', '添加', '127.0.0.1', 'choice');
INSERT INTO `log` VALUES ('2331', 'xs001', '2016-04-18 16:51:42', '添加Choice 属性名和值： Time-->2016-04-18 16:51:42   Studentno-->xs001   Seatkeyword-->2016-04-18-8点-12点-1-1-1  ', '添加', '127.0.0.1', 'choice');
INSERT INTO `log` VALUES ('2332', 'xs001', '2016-04-18 17:07:25', '添加Choice 属性名和值： Time-->2016-04-18 17:07:25   Studentno-->xs001   Seatkeyword-->2016-04-18-8点-12点-1-1-1  ', '添加', '127.0.0.1', 'choice');
INSERT INTO `log` VALUES ('2333', 'admin', '2016-04-18 18:36:37', '添加Menu 属性名和值： Seq-->7   MenuName-->通知交流   IconCls-->icon-item   MenuUrl-->   MenuDescription-->   ParentId-->1  ', '添加', '127.0.0.1', 'menu');
INSERT INTO `log` VALUES ('2334', 'admin', '2016-04-18 18:37:00', '添加Menu 属性名和值： Seq-->1   MenuName-->通知信息   IconCls-->icon-item   MenuUrl-->notice/noticeIndex.htm   MenuDescription-->   ParentId-->39  ', '添加', '127.0.0.1', 'menu');
INSERT INTO `log` VALUES ('2335', 'admin', '2016-04-18 18:37:00', '修改Menu 属性名和值： State-->closed   MenuId-->39  ', '修改', '127.0.0.1', 'menu');
INSERT INTO `log` VALUES ('2336', 'admin', '2016-04-18 18:37:13', '添加Operation 属性名和值： MenuId-->40   MenuName-->通知信息   OperationName-->添加  ', '添加', '127.0.0.1', 'operation');
INSERT INTO `log` VALUES ('2337', 'admin', '2016-04-18 18:37:18', '添加Operation 属性名和值： MenuId-->40   MenuName-->通知信息   OperationName-->修改  ', '添加', '127.0.0.1', 'operation');
INSERT INTO `log` VALUES ('2338', 'admin', '2016-04-18 18:37:23', '添加Operation 属性名和值： MenuId-->40   MenuName-->通知信息   OperationName-->删除  ', '添加', '127.0.0.1', 'operation');
INSERT INTO `log` VALUES ('2339', 'admin', '2016-04-18 18:37:38', '修改Role 属性名和值： RoleId-->1   OperationIds-->10003,10004,10005,10006,10007,10008,10009,10000,10001,10002,10014,10011,10012,10013,100018,100019,100020,100015,100016,100017,100021,100022,100023,100024,100025,100026,100027,100028,100029,100030,100031,100032,100035,100036,100037   MenuIds-->1,2,6,7,5,26,28,30,29,31,32,33,34,35,36,37,38,39,40,15,16  ', '修改', '127.0.0.1', 'role');
INSERT INTO `log` VALUES ('2340', 'admin', '2016-04-18 18:50:05', '添加Notice 属性名和值： Time-->2016-04-18 18:50:05   Title-->图书馆服务创新团队走进学院机关的系列报道之三  ', '添加', '127.0.0.1', 'notice');
INSERT INTO `log` VALUES ('2341', 'admin', '2016-04-18 19:02:42', '修改Notice 属性名和值： Id-->1   Time-->2016-04-18 19:02:42   Title-->图书馆服务创新团队走进学院机关的系列报道之三  ', '修改', '127.0.0.1', 'notice');
INSERT INTO `log` VALUES ('2342', 'admin', '2016-04-18 19:03:00', '修改Notice 属性名和值： Id-->1   Time-->2016-04-18 19:03:00   Title-->图书馆服务创新团队走进学院机关的系列报道之三  ', '修改', '127.0.0.1', 'notice');
INSERT INTO `log` VALUES ('2343', 'admin', '2016-04-18 19:05:33', '修改Notice 属性名和值： Id-->1   Time-->2016-04-18 19:05:33   Title-->图书馆服务创新团队走进学院机关的系列报道之三  ', '修改', '127.0.0.1', 'notice');
INSERT INTO `log` VALUES ('2344', 'admin', '2016-04-18 19:32:26', '修改Notice 属性名和值： Id-->1   Time-->2016-04-18 19:32:26   Title-->图书馆服务创新团队走进学院机关的系列报道之三  ', '修改', '127.0.0.1', 'notice');
INSERT INTO `log` VALUES ('2345', 'admin', '2016-04-18 19:33:05', '修改Notice 属性名和值： Id-->1   Content--><p>sadf</p>   Time-->2016-04-18 19:33:05   Title-->图书馆服务创新团队走进学院机关的系列报道之三  ', '修改', '127.0.0.1', 'notice');
INSERT INTO `log` VALUES ('2346', 'admin', '2016-04-18 19:51:49', '修改Notice 属性名和值： Id-->1   Content--><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">原标题：巴西众议院总统弹劾案投票达到通过票数罗塞夫将被停职</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">国际在线专稿 据巴西《圣保罗页报》报道，17日晚，巴西众议院513名议员中已有至少342名议员对弹劾总统罗塞夫投了赞成票，这意味着弹劾总统程序将继续，弹劾报告将递交给参议院做出最终表决。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">据此前媒体报道，在参议院审理弹劾案的180天内，罗塞夫将暂停总统职务，由副总统特梅尔代理。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">据悉，从巴西当地时间4月15日早上开始一直到17日清晨，有120名议员参加了关于是否弹劾罗塞夫的辩论，辩论时间超过43个小时。</p><p class=\"ifengMore\" style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; height: 21px; position: relative; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background: url(&quot;http://y2.ifengimg.com/a/2015/0708/icon_more.gif&quot;) 0% 0% no-repeat rgb(255, 255, 255);\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">4月12日，巴西国会众议院劾委员会通过了支持弹劾罗塞夫总统的报告。这意味着弹劾总统的程序已然启动，随后巴西的众议院参议院将先后投票表决。罗塞夫最快或在月内就将被暂停职务。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">罗塞夫自去年起就危机重重，反对党指责她在2014年竞选连任时政府账务作假，并在2015年隐瞒巴西的衰退程度（2015年巴西经济缩水了3.8%）。更令罗塞夫头疼的是号称“巴西史上最大贪腐丑闻”的巴西石油腐败案。2014年该公司前任高管被查，他供出超过30名巴西国会议员涉案，随后罗塞夫也被指涉案。巴西石油公司仅去年第四季度一个季度就亏损了100亿美元</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">罗塞夫身陷危机之中却并不“收手”。今年3月，她不顾朝野反对任命自己的恩师、前总统卢拉担任总统办公室主任。卢拉同样被指涉巴西石油弊，此前已经遭当地检方起诉。而他担任总统办公室主任则可以获得内阁豁免权，在短期内无法被传唤和拘捕。</p><p><br/></p>   Time-->2016-04-18 19:51:48   Title-->图书馆服务创新团队走进学院机关的系列报道之三  ', '修改', '127.0.0.1', 'notice');
INSERT INTO `log` VALUES ('2347', 'admin', '2016-04-18 19:53:47', '添加Notice 属性名和值： Content--><p style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: 宋体; font-size: 12pt; line-height: 30px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">4月15日，中共中央政治局常委、国务院总理李克强在北京召开高等教育改革创新座谈会，并作重要讲话。53所在京的部属、市属、民办高校和有关部门负责人参加会议。</p><p style=\"text-align:center;margin-top: 15px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: 宋体; font-size: 12pt; line-height: 30px; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://www.gov.cn/premier/2016-04/17/5065095/images/092c2c156fe2459785481ca8926db36b.jpg\" border=\"0\" align=\"center\" style=\"border: none; margin: 0px; padding: 0px;\"/><br/></p><p style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: 宋体; font-size: 12pt; line-height: 30px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">会上，北京大学、清华大学、北京科技大学主要负责人和中国人民大学、北京第二外国语学院教师代表就教育改革、创新人才培养、建设一流大学和一流学科等发了言。李克强说，<strong>教育是国家发展的基础，关系民族的未来，高水平教育是国家综合竞争力的重要体现。</strong>世界经济强国，无一不是教育强国。中华文明几千年生生不息，根本在于重视教育。改革开放以来，我们始终坚持教育优先发展，举办了世界最大规模的高等教育，成为推动经济发展和社会进步的重要力量。面对当前国际政治经济形势变化和新一轮科技革命的兴起，教育要全面贯彻党的教育方针，培养中国特色社会主义事业建设者和接班人，在促进经济保持中高速增长、迈向中高端水平，跨越中等收入陷阱，实现全面建成小康社会的征程中担负更大责任、发挥支撑作用。</p><p style=\"text-align:center;margin-top: 15px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: 宋体; font-size: 12pt; line-height: 30px; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://www.gov.cn/premier/2016-04/17/5065095/images/5d7c14b42adb4c3fbab5a5578a5e81c8.jpg\" border=\"0\" align=\"center\" style=\"border: none; margin: 0px; padding: 0px;\"/><br/></p><p style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: 宋体; font-size: 12pt; line-height: 30px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">李克强说，<strong>创新是推动国家发展和社会进步的不竭动力。当今世界各国的竞争，实际上是创新的竞争。党的十八大以来，以习近平同志为总书记的党中央坚持实施创新驱动发展战略，就是要把蕴藏在亿万民众中的创造力发挥出来。高等教育要着力围绕服务国家创新发展，促进大众创业、万众创新，培育更多创新型人才。</strong>注重培养学生创新特别是原始创新意识，开展启发式、讨论式、探究式教学，激发他们丰富的想象力，打牢知识根基，拓宽学术视野，推动科技创新。注重增强学生实践能力，培育工匠精神，践行知行合一，多为学生提供动手机会，提高解决实际问题的能力，助力提升中国产品的质量。注重推动教育公平，继续对农村和贫困地区学生上重点大学实行倾斜，让更多困难家庭孩子能够受到良好教育，在平等竞争中拥有上升通道、释放创造潜能。</p><p style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: 宋体; font-size: 12pt; line-height: 30px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">李克强指出，<strong>要加快建设一批高水平大学。</strong>国家确定了推进世界一流大学和一流学科建设的重大举措，鼓励公办民办各类学校办出特色、分类发展。当前要抓紧出台促进一流学科建设的具体措施，在政策和资金上给予精准支持。通过一流学科率先突破，示范和带动提升我国高等教育综合实力和国际竞争力，促进壮大新经济、培育新动能，推动文化繁荣和社会进步。</p><p style=\"text-align:center;margin-top: 15px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: 宋体; font-size: 12pt; line-height: 30px; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://www.gov.cn/premier/2016-04/17/5065095/images/e6c5961315a045e0b0fbe13a0f7114fd.jpg\" border=\"0\" align=\"center\" style=\"border: none; margin: 0px; padding: 0px;\"/><br/></p><p style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: 宋体; font-size: 12pt; line-height: 30px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">李克强说，<strong>要加快推进高等教育领域“放、管、服”改革。结合高校特点，简除烦苛，给学校更大办学自主权。</strong>凡高校能够依法自主管理的，相关行政审批权该下放的下放，要抓紧修改或废止不合时宜的行政法规和政策文件，破除制约学校发展的不合理束缚。同时，有关部门要完善督导监管，积极探索为学校、教师、学生服务的新途径、新方式。各级党委、政府要健全制度，完善政策，为教育发展创造更好环境。</p><p style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: 宋体; font-size: 12pt; line-height: 30px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">李克强强调，<strong>建设高水平大学要充分调动广大教学和科研人员的积极性。</strong>健全教师评价制度，对教学、科研人员包括兼任行政职务的专家教授，实行符合智力劳动特点和规律的政策，不能简单套用针对行政人员的规定和经费管理办法，充分体现尊重知识、尊重人才的要求，给教学和科研人员更多经费使用权，更多创新成果使用、处置和收益权，更好调动广大知识分子的积极性和创造性。要积极提携后进，为青年教师施展才华提供舞台，帮助他们解决实际困难，形成青蓝相继、人才辈出的局面，推动教育强国建设。</p><p style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: 宋体; font-size: 12pt; line-height: 30px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">刘延东主持座谈会，郭金龙、杨晶参加。</p><p><br/></p>   Time-->2016-04-18 19:53:47   Title-->李克强：深化教育改革激发更大活力 贯彻创新战略赢得发展未来  ', '添加', '127.0.0.1', 'notice');
INSERT INTO `log` VALUES ('2348', 'admin', '2016-04-18 19:54:39', '修改Role 属性名和值： RoleId-->3   OperationIds-->100034   MenuIds-->1,32,33,34,35,36,37,38,39,40,15,16  ', '修改', '127.0.0.1', 'role');
INSERT INTO `log` VALUES ('2349', 'admin', '2016-04-19 10:07:18', '修改Menu 属性名和值： Seq-->7   MenuId-->39   MenuName-->通知公告   IconCls-->icon-item   MenuUrl-->   MenuDescription-->  ', '修改', '127.0.0.1', 'menu');
INSERT INTO `log` VALUES ('2350', 'admin', '2016-04-19 10:07:31', '添加Menu 属性名和值： Seq-->8   MenuName-->交流管理   IconCls-->icon-item   MenuUrl-->   MenuDescription-->   ParentId-->1  ', '添加', '127.0.0.1', 'menu');
INSERT INTO `log` VALUES ('2351', 'admin', '2016-04-19 10:08:13', '添加Menu 属性名和值： Seq-->1   MenuName-->信息交流   IconCls-->icon-item   MenuUrl-->bbs/bbsIndex.htm   MenuDescription-->   ParentId-->41  ', '添加', '127.0.0.1', 'menu');
INSERT INTO `log` VALUES ('2352', 'admin', '2016-04-19 10:08:13', '修改Menu 属性名和值： State-->closed   MenuId-->41  ', '修改', '127.0.0.1', 'menu');
INSERT INTO `log` VALUES ('2353', 'admin', '2016-04-19 10:08:26', '添加Operation 属性名和值： MenuId-->42   MenuName-->信息交流   OperationName-->修改  ', '添加', '127.0.0.1', 'operation');
INSERT INTO `log` VALUES ('2354', 'admin', '2016-04-19 10:08:31', '添加Operation 属性名和值： MenuId-->42   MenuName-->信息交流   OperationName-->删除  ', '添加', '127.0.0.1', 'operation');
INSERT INTO `log` VALUES ('2355', 'admin', '2016-04-19 10:09:01', '修改Role 属性名和值： RoleId-->1   OperationIds-->10003,10004,10005,10006,10007,10008,10009,10000,10001,10002,10014,10011,10012,10013,100018,100019,100020,100015,100016,100017,100021,100022,100023,100024,100025,100026,100027,100028,100029,100030,100031,100032,100035,100036,100037,100038,100039   MenuIds-->1,2,6,7,5,26,28,30,29,31,32,33,34,35,36,37,38,39,40,41,42,15,16  ', '修改', '127.0.0.1', 'role');
INSERT INTO `log` VALUES ('2356', 'admin', '2016-04-19 10:12:37', '修改Bbs 属性名和值： Id-->1   Title-->呵呵  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2357', 'admin', '2016-04-19 11:19:25', '添加Menu 属性名和值： Seq-->2   MenuName-->帖子管理   IconCls-->icon-item   MenuUrl-->   MenuDescription-->   ParentId-->41  ', '添加', '127.0.0.1', 'menu');
INSERT INTO `log` VALUES ('2358', 'admin', '2016-04-19 11:19:34', '添加Operation 属性名和值： MenuId-->43   MenuName-->帖子管理   OperationName-->修改  ', '添加', '127.0.0.1', 'operation');
INSERT INTO `log` VALUES ('2359', 'admin', '2016-04-19 11:19:39', '添加Operation 属性名和值： MenuId-->43   MenuName-->帖子管理   OperationName-->删除  ', '添加', '127.0.0.1', 'operation');
INSERT INTO `log` VALUES ('2360', 'admin', '2016-04-19 11:19:50', '修改Role 属性名和值： RoleId-->1   OperationIds-->10003,10004,10005,10006,10007,10008,10009,10000,10001,10002,10014,10011,10012,10013,100018,100019,100020,100015,100016,100017,100021,100022,100023,100024,100025,100026,100027,100028,100029,100030,100031,100032,100035,100036,100037,100038,100039,100040,100041   MenuIds-->1,2,6,7,5,26,28,30,29,31,32,33,34,35,36,37,38,39,40,41,42,43,15,16  ', '修改', '127.0.0.1', 'role');
INSERT INTO `log` VALUES ('2361', 'admin', '2016-04-19 11:38:19', '修改Bbs 属性名和值： Id-->1   Title-->这个是测试2  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2362', 'admin', '2016-04-19 11:39:37', '修改Topic 属性名和值： Id-->2   Content-->这个是第二篇内容2   Bbsid-->1  ', '修改', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2363', 'admin', '2016-04-19 11:40:54', '修改Topic 属性名和值： Id-->2   Content-->这个是第二篇内容2234   Bbsid-->1  ', '修改', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2364', 'admin', '2016-04-19 14:01:23', '修改Role 属性名和值： RoleId-->3   OperationIds-->100034   MenuIds-->1,32,33,34,35,36,37,38,39,40,41,42,15,16  ', '修改', '127.0.0.1', 'role');
INSERT INTO `log` VALUES ('2365', 'xs001', '2016-04-19 14:26:14', '添加Bbs 属性名和值： Id-->2   Content-->  123			\r\n  				   Time-->2016-04-19 14:26:14   Title-->新主题   Author-->xs001  ', '添加', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2366', 'xs001', '2016-04-19 14:26:14', '添加Topic 属性名和值： Content-->  123			\r\n  				   Time-->2016-04-19 14:26:14   Author-->xs001   Bbsid-->1  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2367', 'xs001', '2016-04-19 14:33:02', '添加Bbs 属性名和值： Id-->3   Content-->  			\r\n  	的			   Time-->2016-04-19 14:33:02   Title-->呵呵   Author-->xs001  ', '添加', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2368', 'xs001', '2016-04-19 14:33:02', '添加Topic 属性名和值： Content-->  			\r\n  	的			   Time-->2016-04-19 14:33:02   Author-->xs001   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2369', 'xs002', '2016-04-19 15:29:11', '添加Topic 属性名和值： Content-->这个比较不错哦   Time-->2016-04-19 15:29:11   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2370', 'xs002', '2016-04-19 15:29:11', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:11  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2371', 'xs002', '2016-04-19 15:29:11', '添加Topic 属性名和值： Time-->2016-04-19 15:29:11   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2372', 'xs002', '2016-04-19 15:29:12', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:11  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2373', 'xs002', '2016-04-19 15:29:12', '添加Topic 属性名和值： Time-->2016-04-19 15:29:12   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2374', 'xs002', '2016-04-19 15:29:12', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:12  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2375', 'xs002', '2016-04-19 15:29:12', '添加Topic 属性名和值： Time-->2016-04-19 15:29:12   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2376', 'xs002', '2016-04-19 15:29:12', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:12  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2377', 'xs002', '2016-04-19 15:29:12', '添加Topic 属性名和值： Time-->2016-04-19 15:29:12   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2378', 'xs002', '2016-04-19 15:29:12', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:12  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2379', 'xs002', '2016-04-19 15:29:12', '添加Topic 属性名和值： Time-->2016-04-19 15:29:12   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2380', 'xs002', '2016-04-19 15:29:12', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:12  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2381', 'xs002', '2016-04-19 15:29:12', '添加Topic 属性名和值： Time-->2016-04-19 15:29:12   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2382', 'xs002', '2016-04-19 15:29:12', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:12  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2383', 'xs002', '2016-04-19 15:29:12', '添加Topic 属性名和值： Time-->2016-04-19 15:29:12   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2384', 'xs002', '2016-04-19 15:29:12', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:12  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2385', 'xs002', '2016-04-19 15:29:12', '添加Topic 属性名和值： Time-->2016-04-19 15:29:12   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2386', 'xs002', '2016-04-19 15:29:12', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:12  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2387', 'xs002', '2016-04-19 15:29:12', '添加Topic 属性名和值： Time-->2016-04-19 15:29:12   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2388', 'xs002', '2016-04-19 15:29:12', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:12  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2389', 'xs002', '2016-04-19 15:29:12', '添加Topic 属性名和值： Time-->2016-04-19 15:29:12   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2390', 'xs002', '2016-04-19 15:29:13', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:12  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2391', 'xs002', '2016-04-19 15:29:13', '添加Topic 属性名和值： Time-->2016-04-19 15:29:13   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2392', 'xs002', '2016-04-19 15:29:13', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:13  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2393', 'xs002', '2016-04-19 15:29:13', '添加Topic 属性名和值： Time-->2016-04-19 15:29:13   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2394', 'xs002', '2016-04-19 15:29:13', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:13  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2395', 'xs002', '2016-04-19 15:29:13', '添加Topic 属性名和值： Time-->2016-04-19 15:29:13   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2396', 'xs002', '2016-04-19 15:29:13', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:13  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2397', 'xs002', '2016-04-19 15:29:13', '添加Topic 属性名和值： Time-->2016-04-19 15:29:13   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2398', 'xs002', '2016-04-19 15:29:13', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:13  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2399', 'xs002', '2016-04-19 15:29:13', '添加Topic 属性名和值： Time-->2016-04-19 15:29:13   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2400', 'xs002', '2016-04-19 15:29:13', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:13  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2401', 'xs002', '2016-04-19 15:29:13', '添加Topic 属性名和值： Time-->2016-04-19 15:29:13   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2402', 'xs002', '2016-04-19 15:29:13', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:13  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2403', 'xs002', '2016-04-19 15:29:13', '添加Topic 属性名和值： Time-->2016-04-19 15:29:13   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2404', 'xs002', '2016-04-19 15:29:13', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:13  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2405', 'xs002', '2016-04-19 15:29:13', '添加Topic 属性名和值： Time-->2016-04-19 15:29:13   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2406', 'xs002', '2016-04-19 15:29:13', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:13  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2407', 'xs002', '2016-04-19 15:29:13', '添加Topic 属性名和值： Time-->2016-04-19 15:29:13   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2408', 'xs002', '2016-04-19 15:29:13', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:13  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2409', 'xs002', '2016-04-19 15:29:13', '添加Topic 属性名和值： Time-->2016-04-19 15:29:13   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2410', 'xs002', '2016-04-19 15:29:13', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:13  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2411', 'xs002', '2016-04-19 15:29:14', '添加Topic 属性名和值： Time-->2016-04-19 15:29:14   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2412', 'xs002', '2016-04-19 15:29:14', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:14  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2413', 'xs002', '2016-04-19 15:29:14', '添加Topic 属性名和值： Time-->2016-04-19 15:29:14   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2414', 'xs002', '2016-04-19 15:29:14', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:14  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2415', 'xs002', '2016-04-19 15:29:14', '添加Topic 属性名和值： Time-->2016-04-19 15:29:14   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2416', 'xs002', '2016-04-19 15:29:14', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:14  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2417', 'xs002', '2016-04-19 15:29:14', '添加Topic 属性名和值： Time-->2016-04-19 15:29:14   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2418', 'xs002', '2016-04-19 15:29:14', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:14  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2419', 'xs002', '2016-04-19 15:29:14', '添加Topic 属性名和值： Time-->2016-04-19 15:29:14   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2420', 'xs002', '2016-04-19 15:29:14', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:14  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2421', 'xs002', '2016-04-19 15:29:14', '添加Topic 属性名和值： Time-->2016-04-19 15:29:14   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2422', 'xs002', '2016-04-19 15:29:14', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:14  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2423', 'xs002', '2016-04-19 15:29:14', '添加Topic 属性名和值： Time-->2016-04-19 15:29:14   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2424', 'xs002', '2016-04-19 15:29:14', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:14  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2425', 'xs002', '2016-04-19 15:29:14', '添加Topic 属性名和值： Time-->2016-04-19 15:29:14   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2426', 'xs002', '2016-04-19 15:29:14', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:14  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2427', 'xs002', '2016-04-19 15:29:14', '添加Topic 属性名和值： Time-->2016-04-19 15:29:14   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2428', 'xs002', '2016-04-19 15:29:14', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:14  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2429', 'xs002', '2016-04-19 15:29:14', '添加Topic 属性名和值： Time-->2016-04-19 15:29:14   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2430', 'xs002', '2016-04-19 15:29:14', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:14  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2431', 'xs002', '2016-04-19 15:29:14', '添加Topic 属性名和值： Time-->2016-04-19 15:29:14   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2432', 'xs002', '2016-04-19 15:29:14', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:14  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2433', 'xs002', '2016-04-19 15:29:14', '添加Topic 属性名和值： Time-->2016-04-19 15:29:14   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2434', 'xs002', '2016-04-19 15:29:14', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:14  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2435', 'xs002', '2016-04-19 15:29:14', '添加Topic 属性名和值： Time-->2016-04-19 15:29:14   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2436', 'xs002', '2016-04-19 15:29:14', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:14  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2437', 'xs002', '2016-04-19 15:29:14', '添加Topic 属性名和值： Time-->2016-04-19 15:29:14   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2438', 'xs002', '2016-04-19 15:29:14', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:14  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2439', 'xs002', '2016-04-19 15:29:14', '添加Topic 属性名和值： Time-->2016-04-19 15:29:14   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2440', 'xs002', '2016-04-19 15:29:14', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:14  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2441', 'xs002', '2016-04-19 15:29:14', '添加Topic 属性名和值： Time-->2016-04-19 15:29:14   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2442', 'xs002', '2016-04-19 15:29:14', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:14  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2443', 'xs002', '2016-04-19 15:29:15', '添加Topic 属性名和值： Time-->2016-04-19 15:29:15   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2444', 'xs002', '2016-04-19 15:29:15', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:15  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2445', 'xs002', '2016-04-19 15:29:15', '添加Topic 属性名和值： Time-->2016-04-19 15:29:15   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2446', 'xs002', '2016-04-19 15:29:15', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:15  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2447', 'xs002', '2016-04-19 15:29:15', '添加Topic 属性名和值： Time-->2016-04-19 15:29:15   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2448', 'xs002', '2016-04-19 15:29:15', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:15  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2449', 'xs002', '2016-04-19 15:29:15', '添加Topic 属性名和值： Time-->2016-04-19 15:29:15   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2450', 'xs002', '2016-04-19 15:29:15', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:15  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2451', 'xs002', '2016-04-19 15:29:15', '添加Topic 属性名和值： Time-->2016-04-19 15:29:15   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2452', 'xs002', '2016-04-19 15:29:15', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:15  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2453', 'xs002', '2016-04-19 15:29:20', '添加Topic 属性名和值： Time-->2016-04-19 15:29:20   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2454', 'xs002', '2016-04-19 15:29:20', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:20  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2455', 'xs002', '2016-04-19 15:29:20', '添加Topic 属性名和值： Time-->2016-04-19 15:29:20   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2456', 'xs002', '2016-04-19 15:29:20', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:20  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2457', 'xs002', '2016-04-19 15:29:20', '添加Topic 属性名和值： Time-->2016-04-19 15:29:20   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2458', 'xs002', '2016-04-19 15:29:20', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:20  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2459', 'xs002', '2016-04-19 15:29:20', '添加Topic 属性名和值： Time-->2016-04-19 15:29:20   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2460', 'xs002', '2016-04-19 15:29:20', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:20  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2461', 'xs002', '2016-04-19 15:29:20', '添加Topic 属性名和值： Time-->2016-04-19 15:29:20   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2462', 'xs002', '2016-04-19 15:29:20', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:20  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2463', 'xs002', '2016-04-19 15:29:20', '添加Topic 属性名和值： Time-->2016-04-19 15:29:20   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2464', 'xs002', '2016-04-19 15:29:20', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:20  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2465', 'xs002', '2016-04-19 15:29:20', '添加Topic 属性名和值： Time-->2016-04-19 15:29:20   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2466', 'xs002', '2016-04-19 15:29:20', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:20  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2467', 'xs002', '2016-04-19 15:29:20', '添加Topic 属性名和值： Time-->2016-04-19 15:29:20   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2468', 'xs002', '2016-04-19 15:29:20', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:20  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2469', 'xs002', '2016-04-19 15:29:20', '添加Topic 属性名和值： Time-->2016-04-19 15:29:20   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2470', 'xs002', '2016-04-19 15:29:21', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:20  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2471', 'xs002', '2016-04-19 15:29:21', '添加Topic 属性名和值： Time-->2016-04-19 15:29:21   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2472', 'xs002', '2016-04-19 15:29:21', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:21  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2473', 'xs002', '2016-04-19 15:29:21', '添加Topic 属性名和值： Time-->2016-04-19 15:29:21   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2474', 'xs002', '2016-04-19 15:29:21', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:21  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2475', 'xs002', '2016-04-19 15:29:21', '添加Topic 属性名和值： Time-->2016-04-19 15:29:21   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2476', 'xs002', '2016-04-19 15:29:21', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:21  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2477', 'xs002', '2016-04-19 15:29:21', '添加Topic 属性名和值： Time-->2016-04-19 15:29:21   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2478', 'xs002', '2016-04-19 15:29:21', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:21  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2479', 'xs002', '2016-04-19 15:29:21', '添加Topic 属性名和值： Time-->2016-04-19 15:29:21   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2480', 'xs002', '2016-04-19 15:29:21', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:21  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2481', 'xs002', '2016-04-19 15:29:21', '添加Topic 属性名和值： Time-->2016-04-19 15:29:21   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2482', 'xs002', '2016-04-19 15:29:21', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:21  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2483', 'xs002', '2016-04-19 15:29:21', '添加Topic 属性名和值： Time-->2016-04-19 15:29:21   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2484', 'xs002', '2016-04-19 15:29:21', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:21  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2485', 'xs002', '2016-04-19 15:29:21', '添加Topic 属性名和值： Time-->2016-04-19 15:29:21   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2486', 'xs002', '2016-04-19 15:29:21', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:21  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2487', 'xs002', '2016-04-19 15:29:21', '添加Topic 属性名和值： Time-->2016-04-19 15:29:21   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2488', 'xs002', '2016-04-19 15:29:21', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:21  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2489', 'xs002', '2016-04-19 15:29:21', '添加Topic 属性名和值： Time-->2016-04-19 15:29:21   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2490', 'xs002', '2016-04-19 15:29:21', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:21  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2491', 'xs002', '2016-04-19 15:29:21', '添加Topic 属性名和值： Time-->2016-04-19 15:29:21   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2492', 'xs002', '2016-04-19 15:29:21', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:21  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2493', 'xs002', '2016-04-19 15:29:21', '添加Topic 属性名和值： Time-->2016-04-19 15:29:21   Author-->xs002   Bbsid-->3  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2494', 'xs002', '2016-04-19 15:29:21', '修改Bbs 属性名和值： Id-->3   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:29:21  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2495', 'xs001', '2016-04-19 15:31:10', '添加Bbs 属性名和值： Id-->1   Content-->有没有一起上自习的啊  			\r\n  				   Time-->2016-04-19 15:31:10   Title-->有没有一起去上自习的   Author-->xs001  ', '添加', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2496', 'xs001', '2016-04-19 15:31:10', '添加Topic 属性名和值： Content-->有没有一起上自习的啊  			\r\n  				   Time-->2016-04-19 15:31:10   Author-->xs001   Bbsid-->1  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2497', 'xs001', '2016-04-19 15:32:01', '添加Topic 属性名和值： Content-->在下午7点钟9号教师   Time-->2016-04-19 15:32:01   Author-->xs001   Bbsid-->1  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2498', 'xs001', '2016-04-19 15:32:01', '修改Bbs 属性名和值： Id-->1   Lastreply-->xs001   Lastreplytime-->2016-04-19 15:32:01  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2499', 'xs002', '2016-04-19 15:32:35', '添加Topic 属性名和值： Content-->在寝室打游戏多好啊   Time-->2016-04-19 15:32:35   Author-->xs002   Bbsid-->1  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2500', 'xs002', '2016-04-19 15:32:35', '修改Bbs 属性名和值： Id-->1   Lastreply-->xs002   Lastreplytime-->2016-04-19 15:32:35  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2501', 'xs001', '2016-04-19 15:32:50', '添加Topic 属性名和值： Content-->只知道打游戏   Time-->2016-04-19 15:32:50   Author-->xs001   Bbsid-->1  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2502', 'xs001', '2016-04-19 15:32:50', '修改Bbs 属性名和值： Id-->1   Lastreply-->xs001   Lastreplytime-->2016-04-19 15:32:50  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2503', 'xs002', '2016-04-19 15:34:30', '添加Bbs 属性名和值： Id-->2   Content-->哪位同学在7号自习室看到伞啊。我的伞丢了  			\r\n  				   Time-->2016-04-19 15:34:30   Title-->在7号自习室有没有看到一把伞   Author-->xs002  ', '添加', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2504', 'xs002', '2016-04-19 15:34:31', '添加Topic 属性名和值： Content-->哪位同学在7号自习室看到伞啊。我的伞丢了  			\r\n  				   Time-->2016-04-19 15:34:30   Author-->xs002   Bbsid-->2  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2505', 'xs001', '2016-04-19 15:36:04', '添加Topic 属性名和值： Content-->没看到。帮顶   Time-->2016-04-19 15:36:04   Author-->xs001   Bbsid-->2  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2506', 'xs001', '2016-04-19 15:36:04', '修改Bbs 属性名和值： Id-->2   Lastreply-->xs001   Lastreplytime-->2016-04-19 15:36:04  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2507', 'xs003', '2016-04-19 15:38:18', '添加Topic 属性名和值： Content-->我好像看到清洁阿姨捡到一把伞！   Time-->2016-04-19 15:38:18   Author-->xs003   Bbsid-->2  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2508', 'xs003', '2016-04-19 15:38:18', '修改Bbs 属性名和值： Id-->2   Lastreply-->xs003   Lastreplytime-->2016-04-19 15:38:18  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2509', 'xs001', '2016-04-19 15:46:50', '添加Choice 属性名和值： Time-->2016-04-19 15:46:50   Studentno-->xs001   Seatkeyword-->2016-04-19-8点-12点-1-1-1  ', '添加', '127.0.0.1', 'choice');
INSERT INTO `log` VALUES ('2510', 'xs001', '2016-04-19 15:47:30', '添加Choice 属性名和值： Time-->2016-04-19 15:47:30   Studentno-->xs001   Seatkeyword-->2016-04-19-8点-12点-1-1-2  ', '添加', '127.0.0.1', 'choice');
INSERT INTO `log` VALUES ('2511', 'xs001', '2016-04-19 16:13:23', '添加Choice 属性名和值： Time-->2016-04-19 16:13:23   Studentno-->xs001   Seatkeyword-->2016-04-19-08点-12点-1-1-1  ', '添加', '127.0.0.1', 'choice');
INSERT INTO `log` VALUES ('2512', 'admin', '2016-04-19 17:18:30', '添加Menu 属性名和值： Seq-->10   MenuName-->数据统计   IconCls-->icon-item   MenuUrl-->   MenuDescription-->   ParentId-->1  ', '添加', '127.0.0.1', 'menu');
INSERT INTO `log` VALUES ('2513', 'admin', '2016-04-19 17:18:58', '添加Menu 属性名和值： Seq-->1   MenuName-->违规统计   IconCls-->icon-item   MenuUrl-->chart/illegalChart.htm   MenuDescription-->   ParentId-->44  ', '添加', '127.0.0.1', 'menu');
INSERT INTO `log` VALUES ('2514', 'admin', '2016-04-19 17:18:58', '修改Menu 属性名和值： State-->closed   MenuId-->44  ', '修改', '127.0.0.1', 'menu');
INSERT INTO `log` VALUES ('2515', 'admin', '2016-04-19 17:19:05', '修改Role 属性名和值： RoleId-->1   OperationIds-->10003,10004,10005,10006,10007,10008,10009,10000,10001,10002,10014,10011,10012,10013,100018,100019,100020,100015,100016,100017,100021,100022,100023,100024,100025,100026,100027,100028,100029,100030,100031,100032,100035,100036,100037,100038,100039,100040,100041   MenuIds-->1,2,6,7,5,26,28,30,29,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,15,16  ', '修改', '127.0.0.1', 'role');
INSERT INTO `log` VALUES ('2516', 'admin', '2016-04-19 18:41:14', '添加Menu 属性名和值： Seq-->2   MenuName-->占座统计   IconCls-->icon-item   MenuUrl-->chart/seatChart.htm   MenuDescription-->   ParentId-->44  ', '添加', '127.0.0.1', 'menu');
INSERT INTO `log` VALUES ('2517', 'admin', '2016-04-19 18:41:24', '修改Role 属性名和值： RoleId-->1   OperationIds-->10003,10004,10005,10006,10007,10008,10009,10000,10001,10002,10014,10011,10012,10013,100018,100019,100020,100015,100016,100017,100021,100022,100023,100024,100025,100026,100027,100028,100029,100030,100031,100032,100035,100036,100037,100038,100039,100040,100041   MenuIds-->1,2,6,7,5,26,28,30,29,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,15,16  ', '修改', '127.0.0.1', 'role');
INSERT INTO `log` VALUES ('2518', 'admin', '2016-04-19 18:45:07', '添加Illegal 属性名和值： Time-->2016-04-13 18:44:59   Studentno-->xs002   Score-->5   Remarks-->睡觉  ', '添加', '127.0.0.1', 'illegal');
INSERT INTO `log` VALUES ('2519', 'admin', '2016-04-19 18:45:08', '修改Score$$EnhancerByCGLIB$$97185806 属性名和值： Id-->9   Total-->95   Studentno-->xs002   Callbacks-->[Lnet.sf.cglib.proxy.Callback;@3ed326bb   Studentname-->王群  ', '修改', '127.0.0.1', 'score$$enhancerbycglib$$97185806');
INSERT INTO `log` VALUES ('2520', 'xs001', '2016-04-19 18:50:00', '添加Choice 属性名和值： Time-->2016-04-19 18:50:00   Studentno-->xs001   Seatkeyword-->2016-04-20-08点-12点-1-1-2  ', '添加', '127.0.0.1', 'choice');
INSERT INTO `log` VALUES ('2521', 'xs001', '2016-04-19 18:50:57', '添加Topic 属性名和值： Content-->呵呵哒   Time-->2016-04-19 18:50:57   Author-->xs001   Bbsid-->2  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2522', 'xs001', '2016-04-19 18:50:57', '修改Bbs 属性名和值： Id-->2   Lastreply-->xs001   Lastreplytime-->2016-04-19 18:50:57  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2523', 'admin', '2016-04-19 19:41:27', '添加Menu 属性名和值： Seq-->11   MenuName-->我的推荐   IconCls-->icon-item   MenuUrl-->   MenuDescription-->   ParentId-->1  ', '添加', '127.0.0.1', 'menu');
INSERT INTO `log` VALUES ('2524', 'admin', '2016-04-19 19:41:49', '添加Menu 属性名和值： Seq-->1   MenuName-->书籍推荐   IconCls-->icon-item   MenuUrl-->book/bookIndex.htm   MenuDescription-->   ParentId-->47  ', '添加', '127.0.0.1', 'menu');
INSERT INTO `log` VALUES ('2525', 'admin', '2016-04-19 19:41:49', '修改Menu 属性名和值： State-->closed   MenuId-->47  ', '修改', '127.0.0.1', 'menu');
INSERT INTO `log` VALUES ('2526', 'admin', '2016-04-19 19:42:02', '添加Operation 属性名和值： MenuId-->48   MenuName-->书籍推荐   OperationName-->添加  ', '添加', '127.0.0.1', 'operation');
INSERT INTO `log` VALUES ('2527', 'admin', '2016-04-19 19:42:07', '添加Operation 属性名和值： MenuId-->48   MenuName-->书籍推荐   OperationName-->修改  ', '添加', '127.0.0.1', 'operation');
INSERT INTO `log` VALUES ('2528', 'admin', '2016-04-19 19:42:11', '添加Operation 属性名和值： MenuId-->48   MenuName-->书籍推荐   OperationName-->删除  ', '添加', '127.0.0.1', 'operation');
INSERT INTO `log` VALUES ('2529', 'admin', '2016-04-19 19:42:39', '修改Role 属性名和值： RoleId-->1   OperationIds-->10003,10004,10005,10006,10007,10008,10009,10000,10001,10002,10014,10011,10012,10013,100018,100019,100020,100015,100016,100017,100021,100022,100023,100024,100025,100026,100027,100028,100029,100030,100031,100032,100035,100036,100037,100038,100039,100040,100041,100042,100043,100044   MenuIds-->1,2,6,7,5,26,28,30,29,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,15,16  ', '修改', '127.0.0.1', 'role');
INSERT INTO `log` VALUES ('2530', 'admin', '2016-04-19 19:42:50', '修改Role 属性名和值： RoleId-->3   OperationIds-->100034   MenuIds-->1,32,33,34,35,36,37,38,39,40,41,42,47,48,15,16  ', '修改', '127.0.0.1', 'role');
INSERT INTO `log` VALUES ('2531', 'admin', '2016-04-19 19:51:28', '添加Book 属性名和值： Name-->软件工程导轮   Author-->邹海   Remarks-->丹东   Publish-->中国人民出版社   Cover-->/lsms/upload/book/1461066685542.jpg  ', '添加', '127.0.0.1', 'book');
INSERT INTO `log` VALUES ('2532', 'admin', '2016-04-19 19:53:53', '修改Book 属性名和值： Name-->软件工程导轮1   Id-->1   Author-->邹海   Remarks-->丹东   Publish-->中国人民出版社1   Cover-->/lsms/upload/book/1461066685542.jpg  ', '修改', '127.0.0.1', 'book');
INSERT INTO `log` VALUES ('2533', 'admin', '2016-04-19 19:54:00', '修改Book 属性名和值： Name-->软件工程导轮   Id-->1   Author-->邹海   Remarks-->丹东   Publish-->中国人民出版社   Cover-->/lsms/upload/book/1461066685542.jpg  ', '修改', '127.0.0.1', 'book');
INSERT INTO `log` VALUES ('2534', 'admin', '2016-04-19 19:56:07', '添加Book 属性名和值： Name-->数据结构   Author-->严蔚敏   Remarks-->这本书是C语言版本的数据结构基础。讲解清晰   Publish-->人民邮电出版社   Cover-->/lsms/upload/book/1461066939130.jpg  ', '添加', '127.0.0.1', 'book');
INSERT INTO `log` VALUES ('2535', 'admin', '2016-04-19 19:58:51', '添加Book 属性名和值： Name-->java从入门到精通   Author-->其他   Remarks-->很好的讲解了java的基础知识，巩固面向对象等核心内容。   Publish-->清华大学出版社   Cover-->/lsms/upload/book/1461067094948.jpg  ', '添加', '127.0.0.1', 'book');
INSERT INTO `log` VALUES ('2536', 'xs001', '2016-04-19 20:37:00', '添加Topic 属性名和值： Content-->gg   Time-->2016-04-19 20:37:00   Author-->xs001   Bbsid-->2  ', '添加', '127.0.0.1', 'topic');
INSERT INTO `log` VALUES ('2537', 'xs001', '2016-04-19 20:37:00', '修改Bbs 属性名和值： Id-->2   Lastreply-->xs001   Lastreplytime-->2016-04-19 20:37:00  ', '修改', '127.0.0.1', 'bbs');
INSERT INTO `log` VALUES ('2538', 'admin', '2016-04-20 11:01:36', '添加Menu 属性名和值： Seq-->2   MenuName-->朋友推荐   IconCls-->icon-item   MenuUrl-->friend/friendIndex.htm   MenuDescription-->   ParentId-->47  ', '添加', '127.0.0.1', 'menu');
INSERT INTO `log` VALUES ('2539', 'admin', '2016-04-20 11:01:44', '修改Role 属性名和值： RoleId-->1   OperationIds-->10003,10004,10005,10006,10007,10008,10009,10000,10001,10002,10014,10011,10012,10013,100018,100019,100020,100015,100016,100017,100021,100022,100023,100024,100025,100026,100027,100028,100029,100030,100031,100032,100035,100036,100037,100038,100039,100040,100041,100042,100043,100044   MenuIds-->1,2,6,7,5,26,28,30,29,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,15,16  ', '修改', '127.0.0.1', 'role');
INSERT INTO `log` VALUES ('2540', 'admin', '2016-04-20 11:01:55', '修改Role 属性名和值： RoleId-->1   OperationIds-->10003,10004,10005,10006,10007,10008,10009,10000,10001,10002,10014,10011,10012,10013,100018,100019,100020,100015,100016,100017,100021,100022,100023,100024,100025,100026,100027,100028,100029,100030,100031,100032,100035,100036,100037,100038,100039,100040,100041,100042,100043,100044   MenuIds-->1,2,6,7,5,26,28,30,29,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,15,16  ', '修改', '127.0.0.1', 'role');
INSERT INTO `log` VALUES ('2541', 'admin', '2016-04-20 11:02:01', '修改Role 属性名和值： RoleId-->3   OperationIds-->100034   MenuIds-->1,32,33,34,35,36,37,38,39,40,41,42,47,48,49,15,16  ', '修改', '127.0.0.1', 'role');
INSERT INTO `log` VALUES ('2542', 'admin', '2016-04-20 11:23:12', '修改Role 属性名和值： RoleId-->2   OperationIds-->100034   MenuIds-->1,28,30,35,36,15,16  ', '修改', '127.0.0.1', 'role');
INSERT INTO `log` VALUES ('2543', 'admin', '2016-04-20 11:47:13', '添加Menu 属性名和值： Seq-->2   MenuName-->空余座位   IconCls-->icon-item   MenuUrl-->block/blockIndex.htm   MenuDescription-->   ParentId-->37  ', '添加', '127.0.0.1', 'menu');
INSERT INTO `log` VALUES ('2544', 'admin', '2016-04-20 11:47:35', '修改Role 属性名和值： RoleId-->1   OperationIds-->10003,10004,10005,10006,10007,10008,10009,10000,10001,10002,10014,10011,10012,10013,100018,100019,100020,100015,100016,100017,100021,100022,100023,100024,100025,100026,100027,100028,100029,100030,100031,100032,100035,100036,100037,100038,100039,100040,100041,100042,100043,100044   MenuIds-->1,2,6,7,5,26,28,30,29,31,32,33,34,35,36,37,38,50,39,40,41,42,43,44,45,46,47,48,15,16  ', '修改', '127.0.0.1', 'role');
INSERT INTO `log` VALUES ('2545', 'admin', '2016-04-20 11:47:41', '修改Role 属性名和值： RoleId-->3   OperationIds-->100034   MenuIds-->1,32,33,34,35,36,37,38,50,39,40,41,42,47,48,49,15,16  ', '修改', '127.0.0.1', 'role');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menuId` int(10) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menuName` varchar(50) DEFAULT NULL COMMENT '名称',
  `menuUrl` varchar(100) DEFAULT NULL COMMENT '方法',
  `parentId` int(11) DEFAULT NULL COMMENT '父ID',
  `menuDescription` varchar(200) DEFAULT NULL COMMENT '描述',
  `state` varchar(20) DEFAULT NULL COMMENT '状态/OPEN/CLOSED',
  `iconCls` varchar(50) DEFAULT NULL COMMENT '图标',
  `seq` int(11) DEFAULT NULL COMMENT '顺序排序',
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '阅览室占座系统', '', '-1', '主菜单', 'closed', 'icon-home', '1');
INSERT INTO `menu` VALUES ('2', '系统管理', '', '1', '', 'closed', 'icon-permission', '1');
INSERT INTO `menu` VALUES ('5', '菜单管理', 'menu/menuIndex.htm', '2', '', 'open', 'icon-menuManage', '4');
INSERT INTO `menu` VALUES ('6', '用户管理', 'user/userIndex.htm', '2', '', 'open', 'icon-userManage', '2');
INSERT INTO `menu` VALUES ('7', '角色管理', 'role/roleIndex.htm', '2', '', 'open', 'icon-roleManage', '3');
INSERT INTO `menu` VALUES ('15', '修改密码', '', '1', '', 'open', 'icon-modifyPassword', '999');
INSERT INTO `menu` VALUES ('16', '安全退出', '', '1', '', 'open', 'icon-exit', '1000');
INSERT INTO `menu` VALUES ('26', '日志管理', 'log/logIndex.htm', '2', '', 'open', 'icon-item', '4');
INSERT INTO `menu` VALUES ('28', '师生信息', '', '1', '', 'closed', 'icon-item', '1');
INSERT INTO `menu` VALUES ('29', '班级信息', 'clazz/clazzIndex.htm', '28', '', 'open', 'icon-item', '2');
INSERT INTO `menu` VALUES ('30', '教师信息', 'teacher/teacherIndex.htm', '28', '', 'open', 'icon-item', '1');
INSERT INTO `menu` VALUES ('31', '学生信息', 'student/studentIndex.htm', '28', '', 'open', 'icon-item', '3');
INSERT INTO `menu` VALUES ('32', '阅览室管理', '', '1', '', 'closed', 'icon-item', '3');
INSERT INTO `menu` VALUES ('33', '阅览室类型', 'type/typeIndex.htm', '32', '', 'open', 'icon-item', '1');
INSERT INTO `menu` VALUES ('34', '阅览室信息', 'room/roomIndex.htm', '32', '', 'open', 'icon-item', '2');
INSERT INTO `menu` VALUES ('35', '信用积分管理', '', '1', '', 'closed', 'icon-item', '5');
INSERT INTO `menu` VALUES ('36', '信用积分', 'score/scoreIndex.htm', '35', '', 'open', 'icon-item', '1');
INSERT INTO `menu` VALUES ('37', '选座管理', '', '1', '', 'closed', 'icon-item', '6');
INSERT INTO `menu` VALUES ('38', '选座', 'seat/seatIndex.htm', '37', '', 'open', 'icon-item', '1');
INSERT INTO `menu` VALUES ('39', '通知公告', '', '1', '', 'closed', 'icon-item', '7');
INSERT INTO `menu` VALUES ('40', '通知信息', 'notice/noticeIndex.htm', '39', '', 'open', 'icon-item', '1');
INSERT INTO `menu` VALUES ('41', '交流管理', '', '1', '', 'closed', 'icon-item', '8');
INSERT INTO `menu` VALUES ('43', '帖子管理', 'bbs/bbsIndex.htm', '41', '', 'open', 'icon-item', '2');
INSERT INTO `menu` VALUES ('44', '数据统计', '', '1', '', 'closed', 'icon-item', '10');
INSERT INTO `menu` VALUES ('45', '违规统计', 'chart/illegalChart.htm', '44', '', 'open', 'icon-item', '1');
INSERT INTO `menu` VALUES ('46', '占座统计', 'chart/seatChart.htm', '44', '', 'open', 'icon-item', '2');
INSERT INTO `menu` VALUES ('47', '我的推荐', '', '1', '', 'closed', 'icon-item', '11');
INSERT INTO `menu` VALUES ('48', '书籍推荐', 'book/bookIndex.htm', '47', '', 'open', 'icon-item', '1');
INSERT INTO `menu` VALUES ('50', '空余座位', 'block/blockIndex.htm', '37', '', 'open', 'icon-item', '2');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `time` varchar(32) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '图书馆服务创新团队走进学院机关的系列报道之三', '<p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">原标题：巴西众议院总统弹劾案投票达到通过票数罗塞夫将被停职</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">国际在线专稿 据巴西《圣保罗页报》报道，17日晚，巴西众议院513名议员中已有至少342名议员对弹劾总统罗塞夫投了赞成票，这意味着弹劾总统程序将继续，弹劾报告将递交给参议院做出最终表决。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">据此前媒体报道，在参议院审理弹劾案的180天内，罗塞夫将暂停总统职务，由副总统特梅尔代理。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">据悉，从巴西当地时间4月15日早上开始一直到17日清晨，有120名议员参加了关于是否弹劾罗塞夫的辩论，辩论时间超过43个小时。</p><p class=\"ifengMore\" style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; height: 21px; position: relative; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background: url(&quot;http://y2.ifengimg.com/a/2015/0708/icon_more.gif&quot;) 0% 0% no-repeat rgb(255, 255, 255);\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">4月12日，巴西国会众议院劾委员会通过了支持弹劾罗塞夫总统的报告。这意味着弹劾总统的程序已然启动，随后巴西的众议院参议院将先后投票表决。罗塞夫最快或在月内就将被暂停职务。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">罗塞夫自去年起就危机重重，反对党指责她在2014年竞选连任时政府账务作假，并在2015年隐瞒巴西的衰退程度（2015年巴西经济缩水了3.8%）。更令罗塞夫头疼的是号称“巴西史上最大贪腐丑闻”的巴西石油腐败案。2014年该公司前任高管被查，他供出超过30名巴西国会议员涉案，随后罗塞夫也被指涉案。巴西石油公司仅去年第四季度一个季度就亏损了100亿美元</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">罗塞夫身陷危机之中却并不“收手”。今年3月，她不顾朝野反对任命自己的恩师、前总统卢拉担任总统办公室主任。卢拉同样被指涉巴西石油弊，此前已经遭当地检方起诉。而他担任总统办公室主任则可以获得内阁豁免权，在短期内无法被传唤和拘捕。</p><p><br/></p>', '2016-04-18 19:51:48');
INSERT INTO `notice` VALUES ('2', '李克强：深化教育改革激发更大活力 贯彻创新战略赢得发展未来', '<p style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: 宋体; font-size: 12pt; line-height: 30px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">4月15日，中共中央政治局常委、国务院总理李克强在北京召开高等教育改革创新座谈会，并作重要讲话。53所在京的部属、市属、民办高校和有关部门负责人参加会议。</p><p style=\"text-align:center;margin-top: 15px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: 宋体; font-size: 12pt; line-height: 30px; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://www.gov.cn/premier/2016-04/17/5065095/images/092c2c156fe2459785481ca8926db36b.jpg\" border=\"0\" align=\"center\" style=\"border: none; margin: 0px; padding: 0px;\"/><br/></p><p style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: 宋体; font-size: 12pt; line-height: 30px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">会上，北京大学、清华大学、北京科技大学主要负责人和中国人民大学、北京第二外国语学院教师代表就教育改革、创新人才培养、建设一流大学和一流学科等发了言。李克强说，<strong>教育是国家发展的基础，关系民族的未来，高水平教育是国家综合竞争力的重要体现。</strong>世界经济强国，无一不是教育强国。中华文明几千年生生不息，根本在于重视教育。改革开放以来，我们始终坚持教育优先发展，举办了世界最大规模的高等教育，成为推动经济发展和社会进步的重要力量。面对当前国际政治经济形势变化和新一轮科技革命的兴起，教育要全面贯彻党的教育方针，培养中国特色社会主义事业建设者和接班人，在促进经济保持中高速增长、迈向中高端水平，跨越中等收入陷阱，实现全面建成小康社会的征程中担负更大责任、发挥支撑作用。</p><p style=\"text-align:center;margin-top: 15px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: 宋体; font-size: 12pt; line-height: 30px; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://www.gov.cn/premier/2016-04/17/5065095/images/5d7c14b42adb4c3fbab5a5578a5e81c8.jpg\" border=\"0\" align=\"center\" style=\"border: none; margin: 0px; padding: 0px;\"/><br/></p><p style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: 宋体; font-size: 12pt; line-height: 30px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">李克强说，<strong>创新是推动国家发展和社会进步的不竭动力。当今世界各国的竞争，实际上是创新的竞争。党的十八大以来，以习近平同志为总书记的党中央坚持实施创新驱动发展战略，就是要把蕴藏在亿万民众中的创造力发挥出来。高等教育要着力围绕服务国家创新发展，促进大众创业、万众创新，培育更多创新型人才。</strong>注重培养学生创新特别是原始创新意识，开展启发式、讨论式、探究式教学，激发他们丰富的想象力，打牢知识根基，拓宽学术视野，推动科技创新。注重增强学生实践能力，培育工匠精神，践行知行合一，多为学生提供动手机会，提高解决实际问题的能力，助力提升中国产品的质量。注重推动教育公平，继续对农村和贫困地区学生上重点大学实行倾斜，让更多困难家庭孩子能够受到良好教育，在平等竞争中拥有上升通道、释放创造潜能。</p><p style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: 宋体; font-size: 12pt; line-height: 30px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">李克强指出，<strong>要加快建设一批高水平大学。</strong>国家确定了推进世界一流大学和一流学科建设的重大举措，鼓励公办民办各类学校办出特色、分类发展。当前要抓紧出台促进一流学科建设的具体措施，在政策和资金上给予精准支持。通过一流学科率先突破，示范和带动提升我国高等教育综合实力和国际竞争力，促进壮大新经济、培育新动能，推动文化繁荣和社会进步。</p><p style=\"text-align:center;margin-top: 15px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: 宋体; font-size: 12pt; line-height: 30px; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://www.gov.cn/premier/2016-04/17/5065095/images/e6c5961315a045e0b0fbe13a0f7114fd.jpg\" border=\"0\" align=\"center\" style=\"border: none; margin: 0px; padding: 0px;\"/><br/></p><p style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: 宋体; font-size: 12pt; line-height: 30px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">李克强说，<strong>要加快推进高等教育领域“放、管、服”改革。结合高校特点，简除烦苛，给学校更大办学自主权。</strong>凡高校能够依法自主管理的，相关行政审批权该下放的下放，要抓紧修改或废止不合时宜的行政法规和政策文件，破除制约学校发展的不合理束缚。同时，有关部门要完善督导监管，积极探索为学校、教师、学生服务的新途径、新方式。各级党委、政府要健全制度，完善政策，为教育发展创造更好环境。</p><p style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: 宋体; font-size: 12pt; line-height: 30px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">李克强强调，<strong>建设高水平大学要充分调动广大教学和科研人员的积极性。</strong>健全教师评价制度，对教学、科研人员包括兼任行政职务的专家教授，实行符合智力劳动特点和规律的政策，不能简单套用针对行政人员的规定和经费管理办法，充分体现尊重知识、尊重人才的要求，给教学和科研人员更多经费使用权，更多创新成果使用、处置和收益权，更好调动广大知识分子的积极性和创造性。要积极提携后进，为青年教师施展才华提供舞台，帮助他们解决实际困难，形成青蓝相继、人才辈出的局面，推动教育强国建设。</p><p style=\"margin-top: 15px; margin-bottom: 0px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: 宋体; font-size: 12pt; line-height: 30px; white-space: normal; text-indent: 2em; background-color: rgb(255, 255, 255);\">刘延东主持座谈会，郭金龙、杨晶参加。</p><p><br/></p>', '2016-04-18 19:53:47');
INSERT INTO `notice` VALUES ('4', '明天全校放假', '<blockquote><p><img src=\"http://img.baidu.com/hi/jx2/j_0058.gif\"/>多个地方<img src=\"http://img.baidu.com/hi/jx2/j_0025.gif\"/>广泛的</p></blockquote>', '2018-11-29 13:59:56');

-- ----------------------------
-- Table structure for `operation`
-- ----------------------------
DROP TABLE IF EXISTS `operation`;
CREATE TABLE `operation` (
  `operationId` int(11) NOT NULL AUTO_INCREMENT COMMENT '具体的方法',
  `operationName` varchar(100) DEFAULT NULL COMMENT '方法名',
  `menuId` int(11) DEFAULT NULL COMMENT '所属菜单',
  `menuName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`operationId`),
  KEY `menuId` (`menuId`),
  CONSTRAINT `operation_ibfk_1` FOREIGN KEY (`menuId`) REFERENCES `menu` (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=100045 DEFAULT CHARSET=utf8 COMMENT='具体的页面按钮上的方法\r\n（此自增ID至少从10000开始）';

-- ----------------------------
-- Records of operation
-- ----------------------------
INSERT INTO `operation` VALUES ('10000', '添加', '5', '菜单管理');
INSERT INTO `operation` VALUES ('10001', '修改', '5', '菜单管理');
INSERT INTO `operation` VALUES ('10002', '删除', '5', '菜单管理');
INSERT INTO `operation` VALUES ('10003', '添加', '6', '用户管理');
INSERT INTO `operation` VALUES ('10004', '修改', '6', '用户管理');
INSERT INTO `operation` VALUES ('10005', '删除', '6', '用户管理');
INSERT INTO `operation` VALUES ('10006', '添加', '7', '角色管理');
INSERT INTO `operation` VALUES ('10007', '修改', '7', '角色管理');
INSERT INTO `operation` VALUES ('10008', '删除', '7', '角色管理');
INSERT INTO `operation` VALUES ('10009', '授权', '7', '角色管理');
INSERT INTO `operation` VALUES ('10011', '导出日志（log4j）', '26', '日志管理');
INSERT INTO `operation` VALUES ('10012', '手动备份（业务操作）', '26', '日志管理');
INSERT INTO `operation` VALUES ('10013', '删除', '26', '日志管理');
INSERT INTO `operation` VALUES ('10014', '按钮管理', '5', '菜单管理');
INSERT INTO `operation` VALUES ('100015', '添加', '29', '班级信息');
INSERT INTO `operation` VALUES ('100016', '修改', '29', '班级信息');
INSERT INTO `operation` VALUES ('100017', '删除', '29', '班级信息');
INSERT INTO `operation` VALUES ('100018', '添加', '30', '教师信息');
INSERT INTO `operation` VALUES ('100019', '修改', '30', '教师信息');
INSERT INTO `operation` VALUES ('100020', '删除', '30', '教师信息');
INSERT INTO `operation` VALUES ('100021', '添加', '31', '学生信息');
INSERT INTO `operation` VALUES ('100022', '修改', '31', '学生信息');
INSERT INTO `operation` VALUES ('100023', '删除', '31', '学生信息');
INSERT INTO `operation` VALUES ('100024', '添加', '33', '阅览室类型');
INSERT INTO `operation` VALUES ('100025', '修改', '33', '阅览室类型');
INSERT INTO `operation` VALUES ('100026', '删除', '33', '阅览室类型');
INSERT INTO `operation` VALUES ('100027', '添加', '34', '阅览室信息');
INSERT INTO `operation` VALUES ('100028', '修改', '34', '阅览室信息');
INSERT INTO `operation` VALUES ('100029', '删除', '34', '阅览室信息');
INSERT INTO `operation` VALUES ('100030', '添加', '36', '信用积分');
INSERT INTO `operation` VALUES ('100031', '修改', '36', '信用积分');
INSERT INTO `operation` VALUES ('100032', '删除', '36', '信用积分');
INSERT INTO `operation` VALUES ('100034', '必选', '36', '信用积分');
INSERT INTO `operation` VALUES ('100035', '添加', '40', '通知信息');
INSERT INTO `operation` VALUES ('100036', '修改', '40', '通知信息');
INSERT INTO `operation` VALUES ('100037', '删除', '40', '通知信息');
INSERT INTO `operation` VALUES ('100040', '修改', '43', '帖子管理');
INSERT INTO `operation` VALUES ('100041', '删除', '43', '帖子管理');
INSERT INTO `operation` VALUES ('100042', '添加', '48', '书籍推荐');
INSERT INTO `operation` VALUES ('100043', '修改', '48', '书籍推荐');
INSERT INTO `operation` VALUES ('100044', '删除', '48', '书籍推荐');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `roleName` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `menuIds` varchar(1000) DEFAULT NULL COMMENT '菜单IDs',
  `operationIds` varchar(2000) DEFAULT NULL COMMENT '按钮IDS',
  `roleDescription` varchar(200) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '1,2,6,7,5,26,28,30,29,31,32,33,34,35,36,37,38,50,39,40,41,42,43,44,45,46,47,48,15,16', '10003,10004,10005,10006,10007,10008,10009,10000,10001,10002,10014,10011,10012,10013,100018,100019,100020,100015,100016,100017,100021,100022,100023,100024,100025,100026,100027,100028,100029,100030,100031,100032,100035,100036,100037,100038,100039,100040,100041,100042,100043,100044', '拥有全部权限的超级管理员角色');
INSERT INTO `role` VALUES ('2', '教师', '1,28,30,35,36,15,16', '100034', '教师权限');
INSERT INTO `role` VALUES ('3', '学生', '1,32,33,34,35,36,37,38,50,39,40,41,43,47,48,49,15,16', '100034', '学生权限');

-- ----------------------------
-- Table structure for `room`
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '阅览室主键',
  `typeid` int(11) DEFAULT NULL COMMENT '阅览室类型',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `row` int(11) DEFAULT NULL COMMENT '行数',
  `col` int(11) DEFAULT NULL COMMENT '列数',
  `total` int(11) DEFAULT NULL COMMENT '总数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1', '3', '1号阅览室', '20', '10', '200');
INSERT INTO `room` VALUES ('2', '2', '2号阅览室', '15', '15', '225');
INSERT INTO `room` VALUES ('3', '1', '3号阅览室', '15', '20', '300');
INSERT INTO `room` VALUES ('5', '2', '4号借阅室', '25', '17', '425');

-- ----------------------------
-- Table structure for `score`
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentno` varchar(32) DEFAULT NULL,
  `studentname` varchar(32) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('8', 'xs001', '张子龙', '50');
INSERT INTO `score` VALUES ('9', 'xs002', '王群', '80');
INSERT INTO `score` VALUES ('10', 'xs003', '刘婷', '78');
INSERT INTO `score` VALUES ('12', 'xs004', '赵军', '90');
INSERT INTO `score` VALUES ('13', 'xs005', '刘佳婷', '100');

-- ----------------------------
-- Table structure for `seat`
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '座位信息主键',
  `roomid` int(11) DEFAULT NULL COMMENT '所属阅览室',
  `row` int(11) DEFAULT NULL COMMENT '所属行',
  `col` int(11) DEFAULT NULL COMMENT '所属列',
  `studentno` varchar(20) DEFAULT '1' COMMENT '被占用学号，1表示未被占座，有学号表示被某个学生占座',
  `time` varchar(32) DEFAULT NULL COMMENT '时间段',
  `date` varchar(32) DEFAULT NULL COMMENT '日期',
  `keyword` varchar(64) DEFAULT NULL COMMENT '关键字，由row,col,date,time,roomid组成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24676 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seat
-- ----------------------------

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生信息主键',
  `no` varchar(32) DEFAULT NULL COMMENT '学号',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(32) DEFAULT NULL COMMENT '性别',
  `clazzid` int(11) DEFAULT NULL COMMENT '班级',
  `birth` varchar(32) DEFAULT NULL COMMENT '生日',
  `phone` varchar(32) DEFAULT NULL COMMENT '电话',
  `mail` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `photo` varchar(128) DEFAULT NULL COMMENT '图片（存放的是图片在服务器的地址）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('8', 'xs001', '张子龙', '男', '1', '1994-03-09', '13866778899', '13866778899@139.com', '/lsms/upload/student/1460830477870.jpg');
INSERT INTO `student` VALUES ('9', 'xs002', '王群', '男', '2', '1994-06-21', '13888889999', '13866778899@139.com', '/lsms/upload/student/1460830506733.jpg');
INSERT INTO `student` VALUES ('10', 'xs003', '刘婷', '女', '1', '1994-06-18', '13866778899', '13866778899@139.com', '/lsms/upload/student/1460830541013.jpg');
INSERT INTO `student` VALUES ('12', 'xs004', '赵军', '男', '5', '2018-11-01', '13565656888', 'llq656@qq.com', '/LibrarySeats/upload/student/1543385905784.jpg');
INSERT INTO `student` VALUES ('13', 'xs005', '刘佳婷', '女', '2', '1994-06-18', '13866778899', '13866778899@139.com', '/LibrarySeats/upload/student/1543478749201.jpg');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `no` varchar(32) DEFAULT NULL COMMENT '工号',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(8) DEFAULT NULL COMMENT '性别',
  `phone` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `mail` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `position` varchar(32) DEFAULT NULL COMMENT '职位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('5', 'js001', '唐伟', '男', '13812345678', '13812345678@139.com', '辅导员');
INSERT INTO `teacher` VALUES ('6', 'js002', '李媛媛', '女', '13866778899', '13812345678@139.com', '辅导员');
INSERT INTO `teacher` VALUES ('7', 'js003', '刘龙初', '男', '13866778899', '13812345678@139.com', '辅导员');
INSERT INTO `teacher` VALUES ('8', 'js004', '张达出', '男', '13656562626', 'llq656@qq.com', '数学老师');

-- ----------------------------
-- Table structure for `topic`
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bbsid` int(11) DEFAULT NULL COMMENT '对应的论坛主题ID',
  `content` text COMMENT '内容',
  `author` varchar(64) DEFAULT NULL COMMENT '发表人',
  `time` varchar(32) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('1', '1', '有没有一起上自习的啊  			\r\n  				', 'xs001', '2016-04-19 15:31:10');
INSERT INTO `topic` VALUES ('2', '1', '在下午7点钟9号教师', 'xs001', '2016-04-19 15:32:01');
INSERT INTO `topic` VALUES ('3', '1', '在寝室打游戏多好啊', 'xs002', '2016-04-19 15:32:35');
INSERT INTO `topic` VALUES ('4', '1', '只知道打游戏', 'xs001', '2016-04-19 15:32:50');
INSERT INTO `topic` VALUES ('5', '2', '哪位同学在7号自习室看到伞啊。我的伞丢了  			\r\n  				', 'xs002', '2016-04-19 15:34:30');
INSERT INTO `topic` VALUES ('6', '2', '没看到。帮顶', 'xs001', '2016-04-19 15:36:04');
INSERT INTO `topic` VALUES ('7', '2', '我好像看到清洁阿姨捡到一把伞！', 'xs003', '2016-04-19 15:38:18');
INSERT INTO `topic` VALUES ('8', '2', '呵呵哒', 'xs001', '2016-04-19 18:50:57');
INSERT INTO `topic` VALUES ('9', '2', 'gg', 'xs001', '2016-04-19 20:37:00');
INSERT INTO `topic` VALUES ('10', '2', '您的内容ty', 'xs001', '2018-11-26 16:33:31');
INSERT INTO `topic` VALUES ('11', '3', '  			\r\n  			 水电费发多少	', 'xs004', '2018-11-26 16:40:49');
INSERT INTO `topic` VALUES ('12', '3', '哈哈哈', 'xs004', '2018-11-26 16:40:56');
INSERT INTO `topic` VALUES ('13', '4', '  			\r\n  	哈哈哈哈			', 'xs004', '2018-11-29 14:02:57');
INSERT INTO `topic` VALUES ('14', '3', '干啥呢', 'xs004', '2018-11-29 14:03:07');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型',
  `name` varchar(32) DEFAULT NULL COMMENT 'ID',
  `score` int(11) DEFAULT NULL COMMENT '最低分数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', 'Ⅲ类', '90');
INSERT INTO `type` VALUES ('2', 'Ⅱ类', '80');
INSERT INTO `type` VALUES ('3', 'Ⅰ类', '60');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `userName` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) DEFAULT NULL COMMENT '密码',
  `userType` tinyint(4) DEFAULT NULL COMMENT '用户类型',
  `roleId` int(11) DEFAULT NULL COMMENT '角色ID',
  `userDescription` varchar(200) DEFAULT NULL COMMENT '描述信息',
  PRIMARY KEY (`userId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '1', '1', '1');
INSERT INTO `user` VALUES ('47', 'js001', '123456', '2', '2', null);
INSERT INTO `user` VALUES ('48', 'js002', '123456', '2', '2', null);
INSERT INTO `user` VALUES ('49', 'js003', '123456', '2', '2', null);
INSERT INTO `user` VALUES ('50', 'xs001', '123456', '2', '3', null);
INSERT INTO `user` VALUES ('51', 'xs002', '123456', '2', '3', null);
INSERT INTO `user` VALUES ('52', 'xs003', '123456', '2', '3', null);
INSERT INTO `user` VALUES ('54', 'js004', '123456', '2', '2', '');
INSERT INTO `user` VALUES ('56', 'xs004', '123', '2', '3', null);
INSERT INTO `user` VALUES ('57', 'xs005', '123456', '2', '3', null);
