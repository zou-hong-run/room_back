/*
 Navicat Premium Data Transfer

 Source Server         : livecode
 Source Server Type    : MySQL
 Source Server Version : 50726 (5.7.26)
 Source Host           : localhost:3306
 Source Schema         : redrun_room

 Target Server Type    : MySQL
 Target Server Version : 50726 (5.7.26)
 File Encoding         : 65001

 Date: 16/04/2025 21:58:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门名称',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '上级部门id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (1, '总部门', '2023-12-26 15:28:41.497143', '2023-12-26 15:28:41.497143', NULL, NULL);
INSERT INTO `dept` VALUES (2, '山东分公司', '2023-12-26 15:28:41.500666', '2023-12-26 15:28:41.500666', NULL, 1);
INSERT INTO `dept` VALUES (3, '四川分公司', '2023-12-26 15:28:41.502741', '2023-12-26 15:28:41.502741', NULL, 1);
INSERT INTO `dept` VALUES (4, '重庆分公司', '2023-12-26 15:48:12.039510', '2023-12-26 15:49:01.705443', NULL, 1);
INSERT INTO `dept` VALUES (5, '部门名称', '2023-12-26 16:46:25.407934', '2023-12-26 16:49:58.255788', NULL, 4);
INSERT INTO `dept` VALUES (6, '非', '2023-12-26 00:00:00.000000', '2023-12-26 16:51:23.725241', NULL, 5);
INSERT INTO `dept` VALUES (7, '发发发', '2024-01-02 20:17:10.977189', '2024-01-02 20:17:10.977189', NULL, NULL);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `menu_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名',
  `path` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路径',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父级id',
  `menu_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单类型',
  `component` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `perms` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '系统管理', 'system', '2023-12-26 15:28:41.339790', '2023-12-29 11:13:57.294288', NULL, NULL, 'C', NULL, NULL);
INSERT INTO `menu` VALUES (2, '用户管理', 'user', '2023-12-26 15:28:41.354887', '2024-01-03 18:04:14.626463', NULL, 1, 'M', 'system/user/index', 'system:user:list');
INSERT INTO `menu` VALUES (3, '角色管理', 'role', '2023-12-26 15:28:41.358910', '2024-01-03 18:04:20.434610', NULL, 1, 'M', 'system/role/index', 'system:role:list');
INSERT INTO `menu` VALUES (4, '菜单管理', 'menu', '2023-12-26 15:28:41.448148', '2024-01-03 18:04:24.770169', NULL, 1, 'M', 'system/menu/index', 'system:menu:list');
INSERT INTO `menu` VALUES (5, '部门管理', 'dept', '2023-12-26 15:28:41.449905', '2024-01-03 18:04:29.620616', NULL, 1, 'M', 'system/dept/index', 'system:dept:list');
INSERT INTO `menu` VALUES (6, '岗位管理', 'post', '2023-12-26 15:28:41.452487', '2024-01-03 18:04:33.166478', NULL, 1, 'M', 'system/post/index', 'system:post:list');
INSERT INTO `menu` VALUES (7, '推荐地址', 'http://xxx.com', '2023-12-26 15:28:41.452487', '2023-12-31 09:50:40.077442', NULL, NULL, 'C', NULL, NULL);
INSERT INTO `menu` VALUES (8, '测试管理', 'test', '2023-12-29 00:00:00.000000', '2023-12-29 17:49:56.562866', NULL, 1, 'M', NULL, NULL);
INSERT INTO `menu` VALUES (9, '测试数据', 'data', '2023-12-29 00:00:00.000000', '2024-01-03 18:04:42.431163', NULL, 8, 'M', 'system/test/data/index', 'system:test:data:list');
INSERT INTO `menu` VALUES (10, '空分类', 'empty', '2023-12-31 00:00:00.000000', '2023-12-31 00:00:00.000000', NULL, NULL, 'C', NULL, NULL);
INSERT INTO `menu` VALUES (11, '111111111111', '11111111111', '2024-01-01 22:58:55.387921', '2024-01-01 22:58:55.387921', '', 1, 'C', '', NULL);
INSERT INTO `menu` VALUES (12, '会议管理', 'room', '2024-01-02 22:41:42.534492', '2024-01-02 22:41:42.534492', '', NULL, 'C', '', NULL);
INSERT INTO `menu` VALUES (13, '会议室管理', 'meeting', '2024-01-02 22:43:47.297670', '2024-01-03 18:16:32.035087', '', 12, 'M', 'room/meeting/index', 'room:meeting:list');
INSERT INTO `menu` VALUES (14, '预定管理', 'booking', '2024-01-02 22:45:37.595073', '2024-01-03 18:16:36.456495', '', 12, 'M', 'room/booking/index', 'room:booking:list');
INSERT INTO `menu` VALUES (15, '线下会议室', 'offline_room', '2024-01-03 17:52:20.796306', '2024-01-03 17:52:20.796306', '', NULL, 'C', '', NULL);
INSERT INTO `menu` VALUES (16, '会议室列表', 'offline_room_meeting', '2024-01-03 18:05:20.557688', '2024-01-03 18:18:06.320412', '', 15, 'M', 'offline_room/meeting/index', 'offline_room:meeting:list');
INSERT INTO `menu` VALUES (17, '会议室预定列表', 'offline_room_booking', '2024-01-03 18:06:45.525318', '2024-01-03 18:18:12.502104', '', 15, 'M', 'offline_room/booking/index', 'offline_room:booking:list');
INSERT INTO `menu` VALUES (18, '线上会议室', 'online_room', '2024-04-11 22:15:49.230145', '2024-04-11 22:15:49.230145', '', NULL, 'C', '', '');
INSERT INTO `menu` VALUES (19, '一对一音视频通话', 'online_room_one', '2024-04-12 22:12:03.194726', '2024-04-12 22:12:03.194726', '一对一音视频通话', 18, 'M', 'online_room/one/index', 'online_room:one:list');
INSERT INTO `menu` VALUES (20, '多对多音视频通话', 'online_room_many', '2024-04-12 22:13:21.304660', '2024-04-12 22:13:21.304660', '多对多音视频通话', 18, 'M', 'online_room/many/index', 'online_room:many:list');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位id',
  `post_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, '董事长', 'ceo', '2023-12-26 15:28:41.547130', '2023-12-26 15:28:41.547130', NULL);
INSERT INTO `post` VALUES (2, '普通员工', 'user', '2023-12-26 15:28:41.551034', '2023-12-26 15:28:41.551034', NULL);
INSERT INTO `post` VALUES (3, '外星人', 'ceo', '2024-01-02 20:30:08.094908', '2024-01-02 20:30:08.094908', NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名',
  `role_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', 'admin', '2023-12-26 15:28:41.621109', '2023-12-26 15:28:41.621109', NULL);
INSERT INTO `role` VALUES (2, '普通角色', 'common', '2023-12-26 15:28:41.667756', '2023-12-26 15:28:41.667756', NULL);
INSERT INTO `role` VALUES (3, '测试', 'test', '2024-01-01 22:01:02.296507', '2024-01-01 22:01:02.296507', '');
INSERT INTO `role` VALUES (4, '啛啛喳喳', '啛啛喳喳', '2024-01-02 20:00:29.103811', '2024-01-02 20:00:29.103811', '');

-- ----------------------------
-- Table structure for role_dept
-- ----------------------------
DROP TABLE IF EXISTS `role_dept`;
CREATE TABLE `role_dept`  (
  `roleId` int(11) NOT NULL,
  `deptId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`, `deptId`) USING BTREE,
  INDEX `IDX_8e460a7caed6de78e821b31b74`(`roleId`) USING BTREE,
  INDEX `IDX_c5acb9b83b3f78ccc5e236e43f`(`deptId`) USING BTREE,
  CONSTRAINT `FK_8e460a7caed6de78e821b31b74a` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_c5acb9b83b3f78ccc5e236e43fe` FOREIGN KEY (`deptId`) REFERENCES `dept` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_dept
-- ----------------------------
INSERT INTO `role_dept` VALUES (1, 1);
INSERT INTO `role_dept` VALUES (1, 2);
INSERT INTO `role_dept` VALUES (1, 3);
INSERT INTO `role_dept` VALUES (1, 4);
INSERT INTO `role_dept` VALUES (1, 5);
INSERT INTO `role_dept` VALUES (1, 6);
INSERT INTO `role_dept` VALUES (2, 1);
INSERT INTO `role_dept` VALUES (2, 3);
INSERT INTO `role_dept` VALUES (2, 4);

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `roleId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`, `menuId`) USING BTREE,
  INDEX `IDX_4a57845f090fb832eeac3e3486`(`roleId`) USING BTREE,
  INDEX `IDX_ed7dbf72cc845b0c9150a67851`(`menuId`) USING BTREE,
  CONSTRAINT `FK_4a57845f090fb832eeac3e34860` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ed7dbf72cc845b0c9150a678512` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (1, 1);
INSERT INTO `role_menu` VALUES (1, 2);
INSERT INTO `role_menu` VALUES (1, 3);
INSERT INTO `role_menu` VALUES (1, 4);
INSERT INTO `role_menu` VALUES (1, 5);
INSERT INTO `role_menu` VALUES (1, 6);
INSERT INTO `role_menu` VALUES (1, 7);
INSERT INTO `role_menu` VALUES (1, 8);
INSERT INTO `role_menu` VALUES (1, 9);
INSERT INTO `role_menu` VALUES (1, 10);
INSERT INTO `role_menu` VALUES (1, 12);
INSERT INTO `role_menu` VALUES (1, 13);
INSERT INTO `role_menu` VALUES (1, 14);
INSERT INTO `role_menu` VALUES (1, 15);
INSERT INTO `role_menu` VALUES (1, 16);
INSERT INTO `role_menu` VALUES (1, 17);
INSERT INTO `role_menu` VALUES (1, 18);
INSERT INTO `role_menu` VALUES (1, 19);
INSERT INTO `role_menu` VALUES (1, 20);
INSERT INTO `role_menu` VALUES (2, 1);
INSERT INTO `role_menu` VALUES (2, 2);
INSERT INTO `role_menu` VALUES (3, 1);
INSERT INTO `role_menu` VALUES (3, 2);
INSERT INTO `role_menu` VALUES (3, 3);
INSERT INTO `role_menu` VALUES (3, 4);
INSERT INTO `role_menu` VALUES (3, 5);
INSERT INTO `role_menu` VALUES (3, 6);
INSERT INTO `role_menu` VALUES (3, 8);
INSERT INTO `role_menu` VALUES (3, 9);
INSERT INTO `role_menu` VALUES (4, 1);
INSERT INTO `role_menu` VALUES (4, 2);
INSERT INTO `role_menu` VALUES (4, 3);
INSERT INTO `role_menu` VALUES (4, 4);
INSERT INTO `role_menu` VALUES (4, 5);
INSERT INTO `role_menu` VALUES (4, 6);
INSERT INTO `role_menu` VALUES (4, 7);
INSERT INTO `role_menu` VALUES (4, 8);
INSERT INTO `role_menu` VALUES (4, 9);
INSERT INTO `role_menu` VALUES (4, 10);
INSERT INTO `role_menu` VALUES (4, 11);

-- ----------------------------
-- Table structure for room_booking
-- ----------------------------
DROP TABLE IF EXISTS `room_booking`;
CREATE TABLE `room_booking`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL COMMENT '会议开始时间',
  `end_time` datetime NOT NULL COMMENT '会议结束时间',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '申请中' COMMENT '审批状态',
  `note` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `meetingId` int(11) NULL DEFAULT NULL COMMENT '会议室ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_f496648e69674b1937e5d269127`(`userId`) USING BTREE,
  INDEX `FK_33ddece4ddecc9eb38ebee22cca`(`meetingId`) USING BTREE,
  CONSTRAINT `FK_33ddece4ddecc9eb38ebee22cca` FOREIGN KEY (`meetingId`) REFERENCES `room_meeting` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_f496648e69674b1937e5d269127` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_booking
-- ----------------------------
INSERT INTO `room_booking` VALUES (1, '1970-01-21 01:24:31', '1970-01-21 01:24:31', '已解除', '', '2024-01-03 16:30:42.774638', '2024-05-22 17:37:57.000000', 1, 1);
INSERT INTO `room_booking` VALUES (2, '1970-01-21 01:24:31', '1970-01-21 01:24:31', '审批驳回', '按时参加', '2024-01-03 16:32:45.632608', '2024-01-03 20:53:38.000000', 1, 1);
INSERT INTO `room_booking` VALUES (3, '1970-01-21 01:24:31', '1970-01-21 01:24:31', '已解除', '按时参加', '2024-01-03 16:41:11.110184', '2024-01-03 21:05:26.000000', 1, 1);
INSERT INTO `room_booking` VALUES (4, '1970-01-21 01:24:31', '1970-01-21 01:24:31', '已解除', '按时参加', '2024-01-03 16:41:43.512408', '2024-01-04 20:55:59.000000', 1, 1);
INSERT INTO `room_booking` VALUES (5, '2024-01-03 16:43:33', '2024-01-03 16:44:18', '审批通过', '按时参加', '2024-01-03 16:44:09.679283', '2024-01-03 20:53:43.000000', 1, 1);
INSERT INTO `room_booking` VALUES (6, '1970-01-21 01:24:48', '1970-01-21 01:24:48', '已解除', '按时参加', '2024-01-03 21:19:46.173247', '2024-01-04 20:55:58.000000', 1, 1);
INSERT INTO `room_booking` VALUES (7, '2024-01-03 21:52:00', '2024-01-04 21:52:00', '审批通过', 'www', '2024-01-03 21:52:25.601633', '2024-01-03 21:55:19.000000', 1, 5);
INSERT INTO `room_booking` VALUES (8, '2024-01-05 08:00:00', '2024-01-06 08:00:00', '已解除', 'ff', '2024-01-03 21:53:27.264861', '2024-01-04 20:55:54.000000', 1, 5);
INSERT INTO `room_booking` VALUES (9, '2024-01-03 21:54:00', '2024-01-05 21:56:00', '审批通过', 'fffffafa', '2024-01-03 21:55:47.722023', '2024-01-04 20:56:23.000000', 1, 1);
INSERT INTO `room_booking` VALUES (10, '2024-05-22 17:39:00', '2024-05-17 17:38:00', '审批通过', '公式开会', '2024-05-22 17:38:40.889086', '2024-05-22 17:38:53.000000', 1, 6);

-- ----------------------------
-- Table structure for room_meeting
-- ----------------------------
DROP TABLE IF EXISTS `room_meeting`;
CREATE TABLE `room_meeting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会议室ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会议室名字',
  `capacity` int(11) NOT NULL COMMENT '会议室容量',
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会议室位置',
  `equipment` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备',
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `is_booked` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否被预订',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_meeting
-- ----------------------------
INSERT INTO `room_meeting` VALUES (1, '会议室1', 100, '二楼会议室101', '白板', '白板', 0, '2024-01-03 15:48:52.718000', '2024-01-03 15:48:52.718000');
INSERT INTO `room_meeting` VALUES (2, '会议室2', 10, '二楼会议室102', '白板', '白板', 0, '2024-01-03 15:51:45.558000', '2024-01-03 15:51:45.558000');
INSERT INTO `room_meeting` VALUES (5, '会议室3', 10, '二楼', '黑板', '好好好', 0, '2024-01-03 17:41:58.912206', '2024-01-03 17:41:58.912206');
INSERT INTO `room_meeting` VALUES (6, '会议室6555', 10, 'a栋二楼101', '黑板，电脑等等', '黑板，电脑等等', 0, '2024-05-22 17:37:12.974000', '2024-05-22 17:37:12.974000');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `nick_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱',
  `phone_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `user_type` int(11) NULL DEFAULT 0 COMMENT '用户类别',
  `gender` int(11) NULL DEFAULT 0 COMMENT '用户性别',
  `avatar` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `status` int(11) NULL DEFAULT 0 COMMENT '用户状态',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '张三', 'zhr19853149156@163.com', '123456789', 0, 0, NULL, 0, '2023-12-26 15:28:41.902569', '2023-12-26 15:28:41.902569', NULL);
INSERT INTO `user` VALUES (2, 'lisi', 'e10adc3949ba59abbe56e057f20f883e', '李四', 'zhr19853149156@163.com', '123456789', 0, 0, NULL, 0, '2023-12-26 15:28:41.910980', '2023-12-26 15:28:41.910980', NULL);
INSERT INTO `user` VALUES (3, 'tetete123456789', 'tetete', 'tetete', 'zhr19853149156@163.com', '12345678901', 0, 0, NULL, 0, '2023-12-30 17:43:37.539050', '2023-12-30 17:44:52.837696', '');
INSERT INTO `user` VALUES (13, 'forof', 'tetete', 'tetete', 'zhr19853149156@163.com', '12345678901', 0, 0, NULL, 0, '2023-12-30 17:45:12.634538', '2023-12-30 17:45:12.634538', '');
INSERT INTO `user` VALUES (14, 'redtest', '123456', 'redtest', 'zhr19853149156@163.com', '19853149156', 0, 0, NULL, 0, '2023-12-31 15:47:48.035207', '2023-12-31 15:47:48.035207', '');
INSERT INTO `user` VALUES (15, 'admin123', 'e10adc3949ba59abbe56e057f20f883e', 'admin123', 'zhr19853149156@163.com', '19853149156', 0, 0, NULL, 0, '2024-04-11 22:11:32.958789', '2024-04-12 22:09:16.578441', '管理员账号');
INSERT INTO `user` VALUES (16, '普通用户', '123456', 'user', 'zhr19853149156@163.com', '19853149156', 0, 0, NULL, 0, '2024-04-11 22:13:20.304920', '2024-04-11 22:13:20.304920', '');

-- ----------------------------
-- Table structure for user_post
-- ----------------------------
DROP TABLE IF EXISTS `user_post`;
CREATE TABLE `user_post`  (
  `userId` int(11) NOT NULL,
  `postId` int(11) NOT NULL,
  PRIMARY KEY (`userId`, `postId`) USING BTREE,
  INDEX `IDX_61c64496bf096b321869175021`(`userId`) USING BTREE,
  INDEX `IDX_3eb8e2db42e1474c4e900b9668`(`postId`) USING BTREE,
  CONSTRAINT `FK_3eb8e2db42e1474c4e900b96688` FOREIGN KEY (`postId`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_61c64496bf096b321869175021a` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_post
-- ----------------------------
INSERT INTO `user_post` VALUES (1, 1);
INSERT INTO `user_post` VALUES (2, 2);
INSERT INTO `user_post` VALUES (3, 2);
INSERT INTO `user_post` VALUES (13, 2);
INSERT INTO `user_post` VALUES (14, 1);
INSERT INTO `user_post` VALUES (15, 1);
INSERT INTO `user_post` VALUES (16, 2);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`, `roleId`) USING BTREE,
  INDEX `IDX_ab40a6f0cd7d3ebfcce082131f`(`userId`) USING BTREE,
  INDEX `IDX_dba55ed826ef26b5b22bd39409`(`roleId`) USING BTREE,
  CONSTRAINT `FK_ab40a6f0cd7d3ebfcce082131fd` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_dba55ed826ef26b5b22bd39409b` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1);
INSERT INTO `user_role` VALUES (2, 2);
INSERT INTO `user_role` VALUES (3, 2);
INSERT INTO `user_role` VALUES (13, 2);
INSERT INTO `user_role` VALUES (14, 1);
INSERT INTO `user_role` VALUES (15, 1);
INSERT INTO `user_role` VALUES (16, 2);

SET FOREIGN_KEY_CHECKS = 1;
