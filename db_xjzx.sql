/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : db_xjzx

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2018-03-11 22:56:08
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `userId` int(11) NOT NULL,
  `userName` varchar(66) DEFAULT NULL,
  `userPw` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO t_admin VALUES ('1', '001', '123');
INSERT INTO t_admin VALUES ('2', '002', '123');
INSERT INTO t_admin VALUES ('3', '003', '123');

-- ----------------------------
-- Table structure for `t_doc`
-- ----------------------------
DROP TABLE IF EXISTS `t_doc`;
CREATE TABLE `t_doc` (
  `id` int(11) NOT NULL,
  `mingcheng` varchar(66) DEFAULT NULL,
  `fujian` varchar(50) DEFAULT NULL,
  `fujianYuanshiming` varchar(55) DEFAULT NULL,
  `shijian` varchar(50) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_doc
-- ----------------------------
INSERT INTO t_doc VALUES ('1', 'Servlet-技术', '/upload/1463664057689.txt', 'Servlet.txt', '2016-05-19', 'no');
INSERT INTO t_doc VALUES ('2', 'GUI-技术', '/upload/1463664251344.doc', 'GUI.doc', '2016-05-19', 'no');
INSERT INTO t_doc VALUES ('3', 'Ajax-技术', '/upload/1463664282453.docx', 'SSH.docx', '2016-05-19', 'no');
INSERT INTO t_doc VALUES ('4', 'Spring-笔记', '/upload/1463664310222.java', 'Spring笔记.java', '2016-05-19', 'no');
INSERT INTO t_doc VALUES ('5', 'Velocity-技术', '/upload/1463664347977.doc', 'velocity.doc', '2016-05-19', 'no');

-- ----------------------------
-- Table structure for `t_liuyan`
-- ----------------------------
DROP TABLE IF EXISTS `t_liuyan`;
CREATE TABLE `t_liuyan` (
  `id` int(11) NOT NULL,
  `neirong` varchar(2000) DEFAULT NULL,
  `liuyanshi` varchar(55) DEFAULT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `huifu` varchar(2000) DEFAULT NULL,
  `huifushi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_liuyan
-- ----------------------------
INSERT INTO t_liuyan VALUES ('2', '使用onclick跳转到其他页面/跳转到指定url的方式？', '2016-04-27 10:29', '5', '如果是本页显示可以直接用location,方法如下：\r\n\r\n　　①onclick=\"javascript:window.location.href=\'URL\'\"\r\n　　②onclick=\"location=\'URL\'\"\r\n　　③onclick=\"window.location.href=\'URL?id=11\'\"\r\n☆如果页面中有frame可以将在location前面添加top.mainframe.frames[\'right_frame\'].location', '2016-04-27 16：40');
INSERT INTO t_liuyan VALUES ('4', ' 问题：Exception in thread \"main\" java.lang.NoSuchMethodError: main', '2016-03-22 12：20', '5', '解决：Java虚拟机（JVM）要求你所运行的类文件必须提供入口函数main，这个错误表明你所要启动的类文件缺失main方法，造成的原因可能是语法         错误或者直接是缺少了main方法；解决：Java虚拟机（JVM）要求你所运行的类文件必须提供入口函数main，这个错误表明你所要启动的类文件缺失main方法，造成的原因可能是语法         错误或者直接是缺少了main方法；', '2016-03-23 15：33');
INSERT INTO t_liuyan VALUES ('6', '怎么学java GUI的有技巧吗', '2016-05-21 09:37', '5', '', '');

-- ----------------------------
-- Table structure for `t_shipin`
-- ----------------------------
DROP TABLE IF EXISTS `t_shipin`;
CREATE TABLE `t_shipin` (
  `shipin_id` int(11) NOT NULL,
  `shipin_name` varchar(66) DEFAULT NULL,
  `shipin_jianjie` varchar(2000) DEFAULT NULL,
  `fujian` varchar(55) DEFAULT NULL,
  `fujianYuanshiming` varchar(2000) DEFAULT NULL,
  `shijian` varchar(50) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`shipin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shipin
-- ----------------------------
INSERT INTO t_shipin VALUES ('1', '正则表达式01', '', '/upload/1463664109382.avi', '黑马程序员_毕向东_Java基础视频教程第25天-01-正则表达式(特点).avi', '2016-05-19', 'no');
INSERT INTO t_shipin VALUES ('3', '正则表达式03', '<p><span style=\"white-space: normal; text-transform: none; word-spacing: 0px; float: none; color: rgb(51,51,51); font: 14px/24px arial, 宋体, sans-serif; widows: 1; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 28px; -webkit-text-stroke-width: 0px\"><span style=\"white-space: normal; text-transform: none; word-spacing: 0px; float: none; color: rgb(51,51,51); font: 14px/24px arial, 宋体, sans-serif; widows: 1; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 28px; -webkit-text-stroke-width: 0px\">正则表达式的&ldquo;鼻祖&rdquo;或许可一直追溯到科学家对人类神经系统工作原理的早期研究。美国新泽西州的Warren McCulloch和出生在美国底特律的Walter Pitts这两位神经生理方面的科学家，研究出了一种用数学方式来描述神经网络的新方法，他们创造性地将神经系统中的神经元描述成了小而简单的自动控制元，从而作出了一项伟大的工作革新</span></span></p>', '/upload/1463664370109.avi', '黑马程序员_毕向东_Java基础视频教程第25天-02-正则表达式(匹配).avi', '2016-05-19', 'no');
INSERT INTO t_shipin VALUES ('5', '正则表达式08', '<span style=\"white-space: normal; text-transform: none; word-spacing: 0px; float: none; color: rgb(51,51,51); font: 14px/24px arial, 宋体, sans-serif; widows: 1; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 28px; -webkit-text-stroke-width: 0px\">在最简单的情况下，一个正则表达式看上去就是一个普通的查找串。例如，正则表达式&quot;testing&quot;中没有包含任何元字符，它可以匹配&quot;testing&quot;和&quot;testing123&quot;等字符串，但是不能匹配&quot;Testing&quot;。</span>', '/upload/1463664707010.mp4', '黑马程序员_毕向东_Java基础视频教程第25天-08-正则表达式(网页爬虫).mp4', '2016-05-19', 'no');
INSERT INTO t_shipin VALUES ('6', 'Linux系统', 'Linux系统视频教学---尚学堂 --马世兵', '/upload/1463667318497.avi', 'linux_02_Disk_Partition.avi', '2016-05-19', 'no');
INSERT INTO t_shipin VALUES ('7', 'Linux命令', 'Linux教学，Linux命令教学', '/upload/1463667437456.avi', 'linux_04_dev_partition.avi', '2016-05-19', 'no');
INSERT INTO t_shipin VALUES ('8', 'GUI技术', '&nbsp;&nbsp;&nbsp;&nbsp; 图形用户界面是一种人与计算机通信的界面显示格式，允许用户使用鼠标等输入设备操纵屏幕上的图标或菜单选项，以选择命令、调用文件、启动程序或执行其它一些日常任务。与通过键盘输入文本或字符命令来完成例行任务的字符界面相比，图形用户界面有许多优点。', '/upload/1463794061959.avi', '黑马程序员_毕向东_Java基础视频教程第22天-01-GUI(概述).avi', '2016-05-21', 'no');
INSERT INTO t_shipin VALUES ('9', '1233', '<br />', '/upload/1463796701370.avi', 'linux_10_basic_commands_4.avi', '2016-05-21', 'no');

-- ----------------------------
-- Table structure for `t_shiti`
-- ----------------------------
DROP TABLE IF EXISTS `t_shiti`;
CREATE TABLE `t_shiti` (
  `id` int(11) NOT NULL,
  `mingcheng` varchar(66) DEFAULT NULL,
  `fujian` varchar(55) DEFAULT NULL,
  `fujianYuanshiming` varchar(50) DEFAULT NULL,
  `shijian` varchar(50) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shiti
-- ----------------------------
INSERT INTO t_shiti VALUES ('1', 'java基础测试', '/upload/1463667046660.doc', 'java基础测试题.doc', '2016-05-19', 'no');
INSERT INTO t_shiti VALUES ('2', '达内第一次月考', '/upload/1463667078113.docx', '达内第一次月考.docx', '2016-05-19', 'no');
INSERT INTO t_shiti VALUES ('3', '达内第二次月考', '/upload/1463667099735.docx', '达内第二次月考.docx', '2016-05-19', 'no');
INSERT INTO t_shiti VALUES ('4', '达内第三次月考', '/upload/1463667118316.docx', '达内第三次月考.docx', '2016-05-19', 'no');
INSERT INTO t_shiti VALUES ('5', '月考题库', '/upload/1463667140625.txt', '月考题库.txt', '2016-05-19', 'no');
INSERT INTO t_shiti VALUES ('6', 'GUI技术测试', '/upload/1463794244012.docx', 'GUI技术.docx', '2016-05-21', 'no');

-- ----------------------------
-- Table structure for `t_stu`
-- ----------------------------
DROP TABLE IF EXISTS `t_stu`;
CREATE TABLE `t_stu` (
  `stu_id` int(11) NOT NULL,
  `stu_xuehao` varchar(66) DEFAULT NULL,
  `stu_realname` varchar(50) DEFAULT NULL,
  `stu_sex` varchar(50) DEFAULT NULL,
  `stu_age` varchar(55) DEFAULT NULL,
  `login_pw` varchar(50) DEFAULT NULL,
  `zhuangtai` varchar(50) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stu
-- ----------------------------
INSERT INTO t_stu VALUES ('1', '2014001', '刘三三', '男', '21', '000000', 'b', 'no');
INSERT INTO t_stu VALUES ('2', '2014002', '马散散', '男', '21', '000000', 'b', 'no');
INSERT INTO t_stu VALUES ('3', '2014003', '刘光亮', '男', '21', '000000', 'b', 'no');
INSERT INTO t_stu VALUES ('4', '2014004', '刘德华', '男', '21', '000000', 'b', 'no');
INSERT INTO t_stu VALUES ('5', '044', '最代码', '男', '5', 'zuidaima', 'a', 'no');

-- ----------------------------
-- Table structure for `t_tea`
-- ----------------------------
DROP TABLE IF EXISTS `t_tea`;
CREATE TABLE `t_tea` (
  `tea_id` int(11) NOT NULL,
  `tea_bianhao` varchar(66) DEFAULT NULL,
  `tea_realname` varchar(55) DEFAULT NULL,
  `tea_sex` varchar(50) DEFAULT NULL,
  `tea_age` varchar(50) DEFAULT NULL,
  `login_name` varchar(50) DEFAULT NULL,
  `login_pw` varchar(50) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tea
-- ----------------------------
INSERT INTO t_tea VALUES ('1', '1', '刘老师', '男', '28', '0001', '000000', 'no');
INSERT INTO t_tea VALUES ('2', '001', '张老师', '男', '30', '001', '123', 'no');
INSERT INTO t_tea VALUES ('3', '002', '王老师', '女', '23', '002', '123', 'no');
INSERT INTO t_tea VALUES ('4', '002', '李老师', '男', '24', '002', '123', 'no');
