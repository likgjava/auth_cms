/*
Navicat MySQL Data Transfer

Source Server         : LocalDatabase
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : auth

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2012-11-16 16:26:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_menu`
-- ----------------------------
DROP TABLE IF EXISTS `auth_menu`;
CREATE TABLE `auth_menu` (
  `MENU_ID` varchar(50) NOT NULL default '' COMMENT '记录号',
  `MENU_PARENT_ID` varchar(50) default NULL COMMENT '父菜单',
  `RES_ID` varchar(50) default NULL COMMENT '关联资源',
  `MENU_NAME` varchar(20) NOT NULL COMMENT '菜单名称',
  `MENU_DESC` varchar(100) default NULL COMMENT '菜单描述',
  `TREE_LEVEL` int(11) default NULL COMMENT '菜单级别',
  `IS_LEAF` tinyint(4) default NULL COMMENT '是否叶子节点',
  `MENU_CSS` varchar(20) default NULL COMMENT '菜单样式',
  `CREATE_USER_ID` varchar(50) default NULL COMMENT '创建人',
  `CREATE_TIME` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of auth_menu
-- ----------------------------
INSERT INTO `auth_menu` VALUES ('M01', null, 'R01', '权限管理', '', '1', '0', 'qxgl', null, null);
INSERT INTO `auth_menu` VALUES ('M0101', 'M01', 'R0102', '菜单管理', '', '2', '1', null, null, null);
INSERT INTO `auth_menu` VALUES ('M0102', 'M01', 'R0101', '资源管理', '', '2', '1', null, null, null);
INSERT INTO `auth_menu` VALUES ('M0103', 'M01', 'R0103', '用户管理', '', '2', '1', null, null, null);
INSERT INTO `auth_menu` VALUES ('M0104', 'M01', 'R0104', '角色管理', '', '2', '1', null, null, null);
INSERT INTO `auth_menu` VALUES ('M02', null, 'R02', '个人资料', '', '1', '0', 'grzl', null, null);
INSERT INTO `auth_menu` VALUES ('M0201', 'M02', 'R0201', '用户信息', '', '2', '1', null, null, null);
INSERT INTO `auth_menu` VALUES ('M0202', 'M02', 'R0202', '修改密码', '', '2', '1', null, null, null);
INSERT INTO `auth_menu` VALUES ('M03', null, 'R03', '商品管理', '', '1', '0', 'spgl', null, null);
INSERT INTO `auth_menu` VALUES ('M0301', 'M03', 'R0301', '商品管理', '', '2', '1', '', null, null);
INSERT INTO `auth_menu` VALUES ('M0302', 'M03', 'R0302', '商品分类管理', '', '2', '1', '', null, null);
INSERT INTO `auth_menu` VALUES ('M0303', 'M03', 'R0303', '我的商品', '', '2', '1', '', null, null);
INSERT INTO `auth_menu` VALUES ('M04', null, 'R04', 'CMS', '', '1', '0', '', null, null);
INSERT INTO `auth_menu` VALUES ('M0401', 'M04', 'R0401', '栏目管理', '', '2', '1', '', null, null);
INSERT INTO `auth_menu` VALUES ('M0402', 'M04', 'R0402', '模板管理', '', '2', '1', '', null, null);
INSERT INTO `auth_menu` VALUES ('M0403', 'M04', 'R0403', '稿件管理', '', '2', '1', '', null, null);

-- ----------------------------
-- Table structure for `auth_resource`
-- ----------------------------
DROP TABLE IF EXISTS `auth_resource`;
CREATE TABLE `auth_resource` (
  `RES_ID` varchar(50) NOT NULL default '' COMMENT '记录号',
  `RES_PARENT_ID` varchar(50) default NULL COMMENT '父资源',
  `RES_NAME` varchar(50) NOT NULL COMMENT '资源名称',
  `RES_URL` varchar(100) NOT NULL COMMENT '资源路径',
  `RES_DESC` varchar(100) default NULL COMMENT '资源描述',
  `TREE_LEVEL` int(2) default NULL COMMENT '资源级别',
  `IS_LEAF` int(11) default NULL COMMENT '是否叶子节点',
  `CREATE_USER_ID` varchar(50) default NULL COMMENT '创建人',
  `CREATE_TIME` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of auth_resource
-- ----------------------------
INSERT INTO `auth_resource` VALUES ('R01', null, '权限管理', '1', '', '1', '0', null, null);
INSERT INTO `auth_resource` VALUES ('R0101', 'R01', '资源管理', 'view/auth/sys/auth/resource_list.jsp', '', '2', '1', null, null);
INSERT INTO `auth_resource` VALUES ('R0102', 'R01', '菜单管理', 'view/auth/sys/auth/menu_list.jsp', '', '2', '1', null, null);
INSERT INTO `auth_resource` VALUES ('R0103', 'R01', '用户管理', 'view/auth/sys/auth/user_list.jsp', '', '2', '1', null, null);
INSERT INTO `auth_resource` VALUES ('R0104', 'R01', '角色管理', 'view/auth/sys/auth/role_list.jsp', '', '2', '1', null, null);
INSERT INTO `auth_resource` VALUES ('R02', null, '个人资料', '1', '', '1', '0', null, null);
INSERT INTO `auth_resource` VALUES ('R0201', 'R02', '用户信息', 'MemberController.do?method=toMemberCenterView', '', '2', '1', null, null);
INSERT INTO `auth_resource` VALUES ('R0202', 'R02', '修改密码', 'view/auth/member/member_update_password.jsp', '', '2', '1', null, null);
INSERT INTO `auth_resource` VALUES ('R03', null, '商品管理', '1', '', '1', '0', null, null);
INSERT INTO `auth_resource` VALUES ('R0301', 'R03', '商品管理', 'view/goods/goods/goods_list.jsp', '', '2', '1', null, null);
INSERT INTO `auth_resource` VALUES ('R0302', 'R03', '商品分类管理', 'view/goods/goodsclass/goods_class_list.jsp', '', '2', '1', null, null);
INSERT INTO `auth_resource` VALUES ('R0303', 'R03', '我的商品', 'view/goods/goods/my_goods_list.jsp', '', '2', '1', null, null);
INSERT INTO `auth_resource` VALUES ('R04', null, 'CMS', '1', '', '1', '0', null, null);
INSERT INTO `auth_resource` VALUES ('R0401', 'R04', '栏目管理', 'view/cms/channel_list.jsp', '', '2', '1', null, null);
INSERT INTO `auth_resource` VALUES ('R0402', 'R04', '模板管理', 'view/cms/template_list.jsp', '', '2', '1', null, null);
INSERT INTO `auth_resource` VALUES ('R0403', 'R04', '稿件管理', 'view/cms/article_channel_tree.jsp', '', '2', '1', null, null);
INSERT INTO `auth_resource` VALUES ('R05', null, '非菜单资源', '1', '', '1', '0', null, null);
INSERT INTO `auth_resource` VALUES ('R0501', 'R05', '管理中心页面', 'view/auth/sys/desktop/index.jsp', '', '2', '1', null, null);
INSERT INTO `auth_resource` VALUES ('R0502', 'R05', '管理中心', 'MemberController.do?method=toManageCenterView', '', '2', '1', null, null);

-- ----------------------------
-- Table structure for `auth_role`
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role` (
  `ROLE_ID` varchar(50) NOT NULL COMMENT '记录号',
  `ROLE_NAME` varchar(50) NOT NULL COMMENT '角色名称',
  `ROLE_CH_NAME` varchar(50) default NULL COMMENT '角色中文名称',
  `ROLE_DESC` varchar(100) default NULL COMMENT '角色描述',
  `CREATE_USER_ID` varchar(50) default NULL COMMENT '创建人',
  `CREATE_TIME` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of auth_role
-- ----------------------------
INSERT INTO `auth_role` VALUES ('2c93a0c238b2ad660138b2cf5fc90001', 'member', '普通会员', '', null, '2012-07-23 15:48:51');
INSERT INTO `auth_role` VALUES ('role01', 'admin', '超级管理员', '', null, null);
INSERT INTO `auth_role` VALUES ('role02', 'default', '默认角色', null, null, null);

-- ----------------------------
-- Table structure for `auth_role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_resource`;
CREATE TABLE `auth_role_resource` (
  `ROLE_ID` varchar(50) NOT NULL default '' COMMENT '角色id',
  `RES_ID` varchar(50) NOT NULL default '' COMMENT '资源id',
  PRIMARY KEY  (`ROLE_ID`,`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk ROW_FORMAT=COMPACT COMMENT='角色资源中间表';

-- ----------------------------
-- Records of auth_role_resource
-- ----------------------------
INSERT INTO `auth_role_resource` VALUES ('2c93a0c238b2ad660138b2cf5fc90001', 'R02');
INSERT INTO `auth_role_resource` VALUES ('2c93a0c238b2ad660138b2cf5fc90001', 'R0201');
INSERT INTO `auth_role_resource` VALUES ('2c93a0c238b2ad660138b2cf5fc90001', 'R0202');
INSERT INTO `auth_role_resource` VALUES ('2c93a0c238b2ad660138b2cf5fc90001', 'R03');
INSERT INTO `auth_role_resource` VALUES ('2c93a0c238b2ad660138b2cf5fc90001', 'R0301');
INSERT INTO `auth_role_resource` VALUES ('2c93a0c238b2ad660138b2cf5fc90001', 'R0303');
INSERT INTO `auth_role_resource` VALUES ('role01', 'R01');
INSERT INTO `auth_role_resource` VALUES ('role01', 'R0101');
INSERT INTO `auth_role_resource` VALUES ('role01', 'R0102');
INSERT INTO `auth_role_resource` VALUES ('role01', 'R0103');
INSERT INTO `auth_role_resource` VALUES ('role01', 'R0104');
INSERT INTO `auth_role_resource` VALUES ('role01', 'R03');
INSERT INTO `auth_role_resource` VALUES ('role01', 'R0301');
INSERT INTO `auth_role_resource` VALUES ('role01', 'R0302');
INSERT INTO `auth_role_resource` VALUES ('role01', 'R04');
INSERT INTO `auth_role_resource` VALUES ('role01', 'R0401');
INSERT INTO `auth_role_resource` VALUES ('role01', 'R0402');
INSERT INTO `auth_role_resource` VALUES ('role01', 'R0403');
INSERT INTO `auth_role_resource` VALUES ('role01', 'R0502');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `USER_ID` varchar(50) NOT NULL COMMENT '记录号',
  `USER_NAME` varchar(20) NOT NULL COMMENT '用户名',
  `USER_PASSWORD` varchar(50) default NULL COMMENT '密码',
  `USER_REAL_NAME` varchar(20) default NULL COMMENT '真实姓名',
  `user_email` varchar(20) default NULL,
  `USER_SEX` char(1) default NULL COMMENT '性别',
  `USER_AGE` int(3) default NULL COMMENT '年龄',
  `USER_PHOTO` varchar(50) default NULL COMMENT '照片',
  `USER_IS_ADMIN` char(1) default NULL,
  `USE_STATUS` char(2) default NULL COMMENT '使用状态',
  `CREATE_TIME` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('2c93a0a93aba8ea5013aba8f11c30000', 'test02', '1', null, 'fdsaf@11.com', null, null, null, null, null, '2012-11-01 14:01:09');
INSERT INTO `auth_user` VALUES ('2c93a0c238b2ad660138b2ae0be40000', 'likg', '1', null, 'likg.java@163.com', null, null, null, null, null, '2012-07-23 15:12:27');
INSERT INTO `auth_user` VALUES ('user01', 'admin', '1', null, '1171602588@qq.com', null, null, null, '1', null, '2012-06-28 06:05:37');

-- ----------------------------
-- Table structure for `auth_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_role`;
CREATE TABLE `auth_user_role` (
  `USER_ID` varchar(50) NOT NULL COMMENT '用户id',
  `ROLE_ID` varchar(50) NOT NULL COMMENT '角色id',
  PRIMARY KEY  (`USER_ID`,`ROLE_ID`),
  KEY `fk_auth_user_role_roleid` (`ROLE_ID`),
  CONSTRAINT `fk_auth_user_role_roleid` FOREIGN KEY (`ROLE_ID`) REFERENCES `auth_role` (`ROLE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=gbk ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of auth_user_role
-- ----------------------------
INSERT INTO `auth_user_role` VALUES ('2c93a0a93aba8ea5013aba8f11c30000', '2c93a0c238b2ad660138b2cf5fc90001');
INSERT INTO `auth_user_role` VALUES ('2c93a0c238b2ad660138b2ae0be40000', '2c93a0c238b2ad660138b2cf5fc90001');
INSERT INTO `auth_user_role` VALUES ('user01', 'role01');

-- ----------------------------
-- Table structure for `base_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `base_attachment`;
CREATE TABLE `base_attachment` (
  `ATT_ID` varchar(50) NOT NULL default '' COMMENT '主键',
  `FILE_NAME` varchar(200) default NULL COMMENT '文件名',
  `FILE_SIZE` int(11) default NULL COMMENT '文件大小',
  `FILE_TYPE` varchar(10) default NULL COMMENT '文件类型',
  `FILE_DESC` varchar(500) default NULL COMMENT '文件描述',
  `PATH` varchar(200) default NULL COMMENT '路径',
  `UPLOAD_IP` varchar(50) default NULL COMMENT '上传IP',
  `CREATE_USER_ID` varchar(50) default NULL COMMENT '创建人',
  `CREATE_TIME` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`ATT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of base_attachment
-- ----------------------------
INSERT INTO `base_attachment` VALUES ('2c93a0a93b06b77e013b06b91e0d0000', '22222.jpg', '8449', 'pic', null, 'view/resource/upload/img/3e82372f-6f8a-47f2-a2df-34ac29c46f44.jpg', '0:0:0:0:0:0:0:1', 'user01', '2012-11-16 08:58:13');
INSERT INTO `base_attachment` VALUES ('2c93a0a93b06b77e013b06bb45f60001', '250元.jpg', '38406', 'pic', null, 'view/resource/upload/img/5c9c0b74-1108-4637-aa0a-e32ad64c45b6.jpg', '0:0:0:0:0:0:0:1', 'user01', '2012-11-16 09:00:34');
INSERT INTO `base_attachment` VALUES ('2c93a0a93b06b77e013b06bcb6750002', '22222.jpg', '8449', 'pic', null, 'view/resource/upload/img/b6572d3d-c917-4651-9249-567ed66c8d17.jpg', '0:0:0:0:0:0:0:1', 'user01', '2012-11-16 09:02:09');
INSERT INTO `base_attachment` VALUES ('2c93a0a93b06b77e013b06be69800003', '静.jpg', '81398', 'pic', null, 'view/resource/upload/img/afa0d327-39af-4475-bfe1-b67eb9a2a373.jpg', '0:0:0:0:0:0:0:1', 'user01', '2012-11-16 09:04:00');
INSERT INTO `base_attachment` VALUES ('2c93a0a93b06b77e013b06c00ef20004', '3333.txt', '1125', 'pic', null, 'view/resource/upload/img/ab0aae81-6d4c-4119-b22e-1c44064a23e0.txt', '0:0:0:0:0:0:0:1', 'user01', '2012-11-16 09:05:48');
INSERT INTO `base_attachment` VALUES ('2c93a0a93b06b77e013b06c266c10005', '723ed04795a41805510ffed2.jpg', '56114', 'pic', null, 'view/resource/upload/img/f28e90a1-19f7-4a36-88b8-04f25e0d8ca7.jpg', '0:0:0:0:0:0:0:1', 'user01', '2012-11-16 09:08:21');
INSERT INTO `base_attachment` VALUES ('2c93a0a93b06b77e013b06cb4d470006', 'g.gif', '15724', 'pic', null, 'view/resource/upload/img/1b63835f-947d-418b-9936-632ea424287e.gif', '0:0:0:0:0:0:0:1', 'user01', '2012-11-16 09:18:05');
INSERT INTO `base_attachment` VALUES ('2c93a0a93b072da1013b073294b60000', '11.gif', '1959929', 'picture', null, 'view/resource/upload/img/b7e47069-f17d-4e66-9d45-332681f360a6.gif', '0:0:0:0:0:0:0:1', 'user01', '2012-11-16 11:10:53');
INSERT INTO `base_attachment` VALUES ('2c93a0a93b07801d013b0784078a0000', '甘苦人生2.jpg', '28280', 'picture', null, 'view/resource/upload/img/588d2c1c-f35d-483a-b01e-7653b503599b.jpg', '0:0:0:0:0:0:0:1', 'user01', '2012-11-16 12:39:51');
INSERT INTO `base_attachment` VALUES ('2c93a0c23946e717013947248c7a0000', 'java.jpg', '1872', 'pic', null, 'lucene/fa5eab7f-36fe-4779-8347-b5df23266f3a.jpg', '0:0:0:0:0:0:0:1', '2c93a0c238b2ad660138b2ae0be40000', '2012-08-21 11:05:41');
INSERT INTO `base_attachment` VALUES ('2c93a0c239479d470139479ecb9e0000', '250元.jpg', '38406', 'pic', null, 'view/resource/upload/img/31b75dee-3670-4ea2-a9a1-d21fc2a06629.jpg', '0:0:0:0:0:0:0:1', '2c93a0c238b2ad660138b2ae0be40000', '2012-08-21 13:19:12');
INSERT INTO `base_attachment` VALUES ('2c93a0c239479d47013947a017880002', 'java.jpg', '1872', 'pic', null, 'view/resource/upload/img/03bbb282-8de2-4316-bd75-bbb5cdd62e2f.jpg', '0:0:0:0:0:0:0:1', '2c93a0c238b2ad660138b2ae0be40000', '2012-08-21 13:20:37');
INSERT INTO `base_attachment` VALUES ('2c93a0c2394822b501394823ecc00000', '250元.jpg', '38406', 'pic', null, 'view/resource/upload/img/aa8150fa-a45c-45b7-ae8c-66bb7dc35599.jpg', '0:0:0:0:0:0:0:1', '2c93a0c238b2ad660138b2ae0be40000', '2012-08-21 15:44:37');
INSERT INTO `base_attachment` VALUES ('2c93a0c23951186f0139511eab640000', '22222.jpg', '8449', 'pic', null, 'view/resource/upload/img/1acb4870-6b2c-4c9f-9625-697f39276656.jpg', '0:0:0:0:0:0:0:1', '2c93a0c238b2ad660138b2ae0be40000', '2012-08-23 09:35:28');
INSERT INTO `base_attachment` VALUES ('2c93a0c23951186f0139512ce6d90001', 'java.jpg', '1872', 'pic', null, 'view/resource/upload/img/bbc82c82-a2c4-432f-baae-152b05b9c5dd.jpg', '0:0:0:0:0:0:0:1', '2c93a0c238b2ad660138b2ae0be40000', '2012-08-23 09:51:00');
INSERT INTO `base_attachment` VALUES ('2c93a0c23951186f013951308b6a0002', '250元.jpg', '38406', 'pic', null, 'view/resource/upload/img/95fa1855-c431-406d-ab83-5921bf02306a.jpg', '0:0:0:0:0:0:0:1', '2c93a0c238b2ad660138b2ae0be40000', '2012-08-23 09:54:59');
INSERT INTO `base_attachment` VALUES ('2c93a0c23951186f013951310db90003', '22222.jpg', '8449', 'pic', null, 'view/resource/upload/img/fd33bc28-f8a4-4020-aac0-43ea71a3b964.jpg', '0:0:0:0:0:0:0:1', '2c93a0c238b2ad660138b2ae0be40000', '2012-08-23 09:55:32');
INSERT INTO `base_attachment` VALUES ('2c93a0c23951186f01395132cef90004', '1_renpinghao.jpg', '4849', 'pic', null, 'view/resource/upload/img/ce407467-e76f-4426-a5c4-8432ee06414a.jpg', '0:0:0:0:0:0:0:1', '2c93a0c238b2ad660138b2ae0be40000', '2012-08-23 09:57:27');
INSERT INTO `base_attachment` VALUES ('2c93a0c23951186f0139513342b90005', '250元.jpg', '38406', 'pic', null, 'view/resource/upload/img/7ae16cd3-ba9a-4e09-8951-ee296c064343.jpg', '0:0:0:0:0:0:0:1', '2c93a0c238b2ad660138b2ae0be40000', '2012-08-23 09:57:57');
INSERT INTO `base_attachment` VALUES ('2c93a0c239514e8d0139514fdeeb0000', '22222.jpg', '8449', 'pic', null, 'view/resource/upload/img/e9e2d197-a3d2-48ff-8a91-d70f38ba36ef.jpg', '0:0:0:0:0:0:0:1', '2c93a0c238b2ad660138b2ae0be40000', '2012-08-23 10:29:12');
INSERT INTO `base_attachment` VALUES ('2c93a0c239514e8d01395152c1a30001', '250元.jpg', '38406', 'pic', null, 'view/resource/upload/img/bee55e00-b042-4e64-90b1-92bc1f710b89.jpg', '0:0:0:0:0:0:0:1', '2c93a0c238b2ad660138b2ae0be40000', '2012-08-23 10:32:21');
INSERT INTO `base_attachment` VALUES ('2c93a0c239514e8d01395154a38f0002', '22222.jpg', '8449', 'pic', null, 'view/resource/upload/img/2155d266-83bf-4702-8afb-c4da196ab447.jpg', '0:0:0:0:0:0:0:1', '2c93a0c238b2ad660138b2ae0be40000', '2012-08-23 10:34:25');
INSERT INTO `base_attachment` VALUES ('2c93a0c239514e8d013951554d8f0004', 'm_12186094145021412.gif', '12617', 'pic', null, 'view/resource/upload/img/1e2da496-41b9-4773-857c-3bedd5d3a15a.gif', '0:0:0:0:0:0:0:1', '2c93a0c238b2ad660138b2ae0be40000', '2012-08-23 10:35:08');
INSERT INTO `base_attachment` VALUES ('ff80808139ec1fd20139ec2516ce0000', 'Hydrangeas.jpg', '595284', 'pic', null, 'view/resource/upload/img/dfe4fabb-3cc5-436b-a6b9-882dcd161d1c.jpg', '0:0:0:0:0:0:0:1', '2c93a0c238b2ad660138b2ae0be40000', '2012-09-22 12:03:37');
INSERT INTO `base_attachment` VALUES ('ff80808139ec27560139ec297be20000', 'Penguins.jpg', '777835', 'pic', null, 'view/resource/upload/img/703f552a-ff86-445d-a02d-4bfe5c0e4c74.jpg', '0:0:0:0:0:0:0:1', '2c93a0c238b2ad660138b2ae0be40000', '2012-09-22 12:08:25');

-- ----------------------------
-- Table structure for `cms_channel`
-- ----------------------------
DROP TABLE IF EXISTS `cms_channel`;
CREATE TABLE `cms_channel` (
  `CHANNEL_ID` varchar(50) NOT NULL default '' COMMENT '记录号',
  `CHANNEL_PARENT_ID` varchar(50) default NULL COMMENT '父栏目',
  `CHANNEL_NAME` varchar(100) NOT NULL COMMENT '栏目名称',
  `CHANNEL_template_ID` varchar(50) default NULL COMMENT '栏目模板',
  `article_template_ID` varchar(50) default NULL COMMENT '文章模板',
  `CHANNEL_DESC` varchar(500) default NULL COMMENT '栏目描述',
  `TREE_LEVEL` int(11) NOT NULL COMMENT '栏目级别',
  `IS_LEAF` int(11) NOT NULL COMMENT '是否叶子节点',
  `CREATE_USER_ID` varchar(50) default NULL COMMENT '创建人',
  `CREATE_TIME` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`CHANNEL_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of cms_channel
-- ----------------------------
INSERT INTO `cms_channel` VALUES ('C01', null, '新闻', null, '2c93a0c239fb0a040139fb12e18d0002', 'fdasfasf', '1', '0', null, null);
INSERT INTO `cms_channel` VALUES ('C0101', 'C01', '国内新闻', null, '2c93a0c239fb0a040139fb12e18d0002', '', '2', '1', null, null);
INSERT INTO `cms_channel` VALUES ('C0102', 'C01', '国际新闻', null, '2c93a0c239fb0a040139fb12e18d0002', '', '2', '1', null, null);
INSERT INTO `cms_channel` VALUES ('C02', null, '新闻1', null, '2c93a0c239fb0a040139fb12e18d0002', '', '1', '0', null, null);
INSERT INTO `cms_channel` VALUES ('C0201', 'C02', '娱乐新闻', null, '2c93a0c239fb0a040139fb12e18d0002', '', '2', '1', null, null);

-- ----------------------------
-- Table structure for `cms_comment`
-- ----------------------------
DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE `cms_comment` (
  `COMMENT_ID` varchar(50) NOT NULL default '' COMMENT '记录号',
  `ARTICLE_ID` varchar(50) default NULL COMMENT '所属稿件',
  `CONTENT` varchar(500) NOT NULL COMMENT '评论内容',
  `COMMENT_USER_NAME` varchar(20) default NULL COMMENT '评论人的用户名',
  `CREATE_USER_ID` varchar(50) default NULL COMMENT '创建人',
  `CREATE_TIME` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`COMMENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of cms_comment
-- ----------------------------
INSERT INTO `cms_comment` VALUES ('2c93a0a93a63c5dd013a63e1b6520010', '2c93a0a93a3e2e00013a3ee21b2f0009', '15', null, null, '2012-10-15 18:04:27');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a63c5dd013a63e1a185000f', '2c93a0a93a3e2e00013a3ee21b2f0009', '14', null, null, '2012-10-15 18:04:22');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a63c5dd013a63e18fbc000e', '2c93a0a93a3e2e00013a3ee21b2f0009', '13', null, null, '2012-10-15 18:04:17');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a63c5dd013a63d477ab000d', '2c93a0a93a3e2e00013a3ee21b2f0009', '12', null, null, '2012-10-15 17:49:59');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a63c5dd013a63d44240000c', '2c93a0a93a3e2e00013a3ee21b2f0009', '11', null, null, '2012-10-15 17:49:45');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a63c5dd013a63d4157a000b', '2c93a0a93a3e2e00013a3ee21b2f0009', '10', null, null, '2012-10-15 17:49:34');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a63c5dd013a63d3faec000a', '2c93a0a93a3e2e00013a3ee21b2f0009', '999', null, null, '2012-10-15 17:49:27');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a63c5dd013a63d1d78b0009', '2c93a0a93a3e2e00013a3ee21b2f0009', '88', null, null, '2012-10-15 17:47:07');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a63c5dd013a63d1ba7d0008', '2c93a0a93a3e2e00013a3ee21b2f0009', '77', null, null, '2012-10-15 17:47:00');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a63c5dd013a63d198320007', '2c93a0a93a3e2e00013a3ee21b2f0009', '666', null, null, '2012-10-15 17:46:51');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a63c5dd013a63d1581d0005', '2c93a0a93a3e2e00013a3ee21b2f0009', '4444', null, null, '2012-10-15 17:46:34');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a63c5dd013a63d1776d0006', '2c93a0a93a3e2e00013a3ee21b2f0009', '555', null, null, '2012-10-15 17:46:42');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a63c5dd013a63d045490004', '2c93a0a93a3e2e00013a3ee21b2f0009', '333', null, null, '2012-10-15 17:45:24');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a63c5dd013a63d02dcc0003', '2c93a0a93a3e2e00013a3ee21b2f0009', '22', null, null, '2012-10-15 17:45:18');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a63c5dd013a63cfa98c0002', '2c93a0a93a3e2e00013a3ee21b2f0009', '111', null, null, '2012-10-15 17:44:44');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a63c5dd013a63e1c92e0011', '2c93a0a93a3e2e00013a3ee21b2f0009', '16', null, null, '2012-10-15 18:04:32');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a6729ed013a672b32f80000', '2c93a0a93a3e2e00013a3ee21b2f0009', '17', null, null, '2012-10-16 09:23:35');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a6729ed013a672b49d30001', '2c93a0a93a3e2e00013a3ee21b2f0009', '18', null, null, '2012-10-16 09:23:41');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a6729ed013a672b5e530002', '2c93a0a93a3e2e00013a3ee21b2f0009', '19', null, null, '2012-10-16 09:23:46');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a6729ed013a672b8ade0003', '2c93a0a93a3e2e00013a3ee21b2f0009', '20`', null, null, '2012-10-16 09:23:57');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a6729ed013a672cb3b20004', '2c93a0a93a3e2e00013a3ee21b2f0009', '21', null, null, '2012-10-16 09:25:13');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a6729ed013a672cc6340005', '2c93a0a93a3e2e00013a3ee21b2f0009', '22', null, null, '2012-10-16 09:25:18');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a68bc37013a68d8484f0000', '2c93a0a93a3e2e00013a3ee21b2f0009', '真是太精彩了！实在是受不了了啊！', null, null, '2012-10-16 17:12:15');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a6c9a0a013a6ca0ef230000', '2c93a0a93a3e2e00013a3ee21b2f0009', 'fasdfdasf', null, null, '2012-10-17 10:50:17');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a6c9a0a013a6ca28e580001', '2c93a0a93a3e2e00013a3ee149200008', 'fdasfas', null, null, '2012-10-17 10:52:03');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a6c9a0a013a6ca305c80002', '2c93a0a93a3e2e00013a3ee149200008', '1111111', null, null, '2012-10-17 10:52:34');
INSERT INTO `cms_comment` VALUES ('2c93a0a93a6c9a0a013a6ca331b10003', '2c93a0a93a3e2e00013a3ee149200008', '\n\n    谷歌浏览器谷歌浏览器\n    马拉多纳起诉“九城”侵权案一审在京开庭马拉多纳起诉“九城”\n    台风“启德”登陆湛江 最大风力13级台风“启德”登陆湛江\n    台风“海葵”致江西婺源洪水围村台风“海葵”致江西婺\n\n', null, null, '2012-10-17 10:52:45');
INSERT INTO `cms_comment` VALUES ('2c93a0a93ac047d5013ac04ec8840000', '2632bf56-34c2-4f00-b002-9e009b0fa8d8', '发斯蒂芬打算', null, null, '2012-11-02 16:48:39');
INSERT INTO `cms_comment` VALUES ('2c93a0a93ac047d5013ac04ee0960001', '2632bf56-34c2-4f00-b002-9e009b0fa8d8', 'fadsfas', null, null, '2012-11-02 16:48:45');
INSERT INTO `cms_comment` VALUES ('2c93a0a93ac047d5013ac04eee8c0002', '2632bf56-34c2-4f00-b002-9e009b0fa8d8', 'fsdafasf', null, null, '2012-11-02 16:48:49');
INSERT INTO `cms_comment` VALUES ('2c93a0a93af76773013af76cf4870000', 'e358f8dc-f137-40c5-9c17-120a962da3a2', 'fasdfas', null, null, '2012-11-13 09:40:43');

-- ----------------------------
-- Table structure for `cms_template`
-- ----------------------------
DROP TABLE IF EXISTS `cms_template`;
CREATE TABLE `cms_template` (
  `TEMPLATE_ID` varchar(50) NOT NULL default '' COMMENT '记录号',
  `TEMPLATE_NAME` varchar(200) NOT NULL COMMENT '模板名称',
  `TEMPLATE_TYPE` char(1) default NULL COMMENT '模板类型(0:栏目模板；1:文章模板)',
  `TEMPLATE_PATH` varchar(200) default NULL COMMENT '模板路径',
  `CREATE_USER_ID` varchar(50) default NULL COMMENT '创建人',
  `CREATE_TIME` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`TEMPLATE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of cms_template
-- ----------------------------
INSERT INTO `cms_template` VALUES ('2c93a0c239fb0a040139fb12e18d0002', '新闻文章模板', '1', 'data/template\\2c93a0c239fb0a040139fb12e18d0002.ftl', 'user01', '2012-09-25 09:38:02');

-- ----------------------------
-- Table structure for `cms_up_down`
-- ----------------------------
DROP TABLE IF EXISTS `cms_up_down`;
CREATE TABLE `cms_up_down` (
  `UP_DOWN_ID` varchar(50) NOT NULL default '' COMMENT '记录号，使用稿件id',
  `UP` int(11) default NULL COMMENT '顶',
  `DOWN` int(11) default NULL COMMENT '踩',
  `CREATE_USER_ID` varchar(50) default NULL COMMENT '创建人',
  `CREATE_TIME` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`UP_DOWN_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of cms_up_down
-- ----------------------------
INSERT INTO `cms_up_down` VALUES ('2c93a0a93a3e2e00013a3ee21b2f0009', '20', '5', null, null);
INSERT INTO `cms_up_down` VALUES ('43ce50bb-58bc-4039-ad99-9425442dadbd', '1', '0', null, null);
INSERT INTO `cms_up_down` VALUES ('2632bf56-34c2-4f00-b002-9e009b0fa8d8', '0', '1', null, null);
INSERT INTO `cms_up_down` VALUES ('e358f8dc-f137-40c5-9c17-120a962da3a2', '1', '0', null, null);

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `GOODS_ID` varchar(50) NOT NULL default '' COMMENT '记录号',
  `GOODS_CLASS_ID` varchar(50) default NULL COMMENT '所属商品分类',
  `GOODS_NAME` varchar(200) default NULL COMMENT '商品名称',
  `GOODS_CODE` varchar(200) default NULL COMMENT '商品型号',
  `REF_PRICE` double default NULL COMMENT '参考价',
  `MAIN_PICTURE` varchar(200) default NULL COMMENT '主图',
  `GOODS_DESC` varchar(2000) default NULL COMMENT '商品描述',
  `USE_STATUS` varchar(2) default NULL COMMENT '使用状态',
  `CREATE_USER_ID` varchar(50) default NULL COMMENT '创建人',
  `CREATE_TIME` date default NULL COMMENT '创建时间',
  PRIMARY KEY  (`GOODS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('2c93a0c23957e257013957e35b5f0000', 'G01', '联系', 'b', '1', '', '<h3 style=\"color:blue;\">\r\n	对单身女性我始终追求，对有夫之妇我从未放弃，对16岁以上的女生我注意发掘，对16岁以下的女生我细心培养，宁可错爱三千，不可放过一个，因为我的座右铭是：大家都是狼，活命要靠羊！<br />\r\n	<br />\r\n	我的择偶标准是：对单身女性我始终追求，对有夫之妇我从未放弃；对16岁以上的女生我注意发掘，对16岁以下的女生我注意悉心培养，宁可错爱三千，不可放过一个。因为我的座右铭是：<strong>大家都是狼，何必要装羊</strong>！</h3>\r\n', null, '2c93a0c238b2ad660138b2ae0be40000', '2012-08-24');
INSERT INTO `goods` VALUES ('2c93a0c23957e257013957e4221a0001', 'G01', '戴尔', 'b', '344234', 'view/resource/upload/img/703f552a-ff86-445d-a02d-4bfe5c0e4c74.jpg', '<p>\r\n	423423423fdasfsaaaaaaaaaaaaaaaaaaa</p>\r\n', null, '2c93a0c238b2ad660138b2ae0be40000', '2012-08-24');
INSERT INTO `goods` VALUES ('2c93a0c23957e257013957e501200002', 'G01', '东芝', 'b', '3424', '', '4234234423', null, '2c93a0c238b2ad660138b2ae0be40000', '2012-08-24');
INSERT INTO `goods` VALUES ('2c93a0c23957e257013957e5c14a0003', 'G01', 'b放大时发生', 'b', '3123', '', 'bbbbbbbbbbbbbbbbbbbbb', null, '2c93a0c238b2ad660138b2ae0be40000', '2012-08-24');
INSERT INTO `goods` VALUES ('ff80808139ec12840139ec1e523a0000', 'G0201', '劲霸男装', 'ML', '500', '', '<p>\r\n	放大法倒萨</p>\r\n', null, '2c93a0c238b2ad660138b2ae0be40000', '2012-09-22');
INSERT INTO `goods` VALUES ('ff80808139ec1fd20139ec25d26d0001', 'G0201', '七匹狼', 'Xp', '399', 'view/resource/upload/img/dfe4fabb-3cc5-436b-a6b9-882dcd161d1c.jpg', '<p>\r\n	范德萨</p>\r\n', null, '2c93a0c238b2ad660138b2ae0be40000', '2012-09-22');

-- ----------------------------
-- Table structure for `goods_class`
-- ----------------------------
DROP TABLE IF EXISTS `goods_class`;
CREATE TABLE `goods_class` (
  `GOODS_CLASS_ID` varchar(50) NOT NULL default '',
  `GOODS_CLASS_PARENT_ID` varchar(50) default NULL COMMENT '父分类',
  `GOODS_CLASS_NAME` varchar(100) default NULL COMMENT '商品分类名称',
  `GOODS_CLASS_DESC` varchar(2000) default NULL COMMENT '商品分类描述',
  `TREE_LEVEL` int(11) default NULL COMMENT '级别',
  `IS_LEAF` int(11) default NULL COMMENT '是否叶子节点',
  `CREATE_USER_ID` varchar(50) default NULL COMMENT '创建人',
  `CREATE_TIME` date default NULL COMMENT '创建时间',
  PRIMARY KEY  (`GOODS_CLASS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of goods_class
-- ----------------------------
INSERT INTO `goods_class` VALUES ('G01', null, '数码', '', '1', '0', 'user01', '2012-08-10');
INSERT INTO `goods_class` VALUES ('G0101', 'G01', '手机', '', '2', '1', 'user01', '2012-08-10');
INSERT INTO `goods_class` VALUES ('G0102', 'G01', '笔记本', '', '2', '1', 'user01', '2012-08-10');
INSERT INTO `goods_class` VALUES ('G0103', 'G01', '台式机', '', '2', '1', 'user01', '2012-08-10');
INSERT INTO `goods_class` VALUES ('G02', null, '男人', '', '1', '0', 'user01', '2012-08-10');
INSERT INTO `goods_class` VALUES ('G0201', 'G02', '男装', '', '2', '1', 'user01', '2012-08-11');
