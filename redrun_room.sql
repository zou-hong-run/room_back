-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2024-01-04 21:04:59
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `redrun_room`
--

-- --------------------------------------------------------

--
-- 表的结构 `dept`
--

CREATE TABLE `dept` (
  `id` int(11) NOT NULL COMMENT '部门id',
  `dept_name` varchar(20) NOT NULL COMMENT '部门名称',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `parent_id` int(11) DEFAULT NULL COMMENT '上级部门id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `dept`
--

INSERT INTO `dept` (`id`, `dept_name`, `create_time`, `update_time`, `remark`, `parent_id`) VALUES
(1, '总部门', '2023-12-26 15:28:41.497143', '2023-12-26 15:28:41.497143', NULL, NULL),
(2, '山东分公司', '2023-12-26 15:28:41.500666', '2023-12-26 15:28:41.500666', NULL, 1),
(3, '四川分公司', '2023-12-26 15:28:41.502741', '2023-12-26 15:28:41.502741', NULL, 1),
(4, '重庆分公司', '2023-12-26 15:48:12.039510', '2023-12-26 15:49:01.705443', NULL, 1),
(5, '部门名称', '2023-12-26 16:46:25.407934', '2023-12-26 16:49:58.255788', NULL, 4),
(6, '非', '2023-12-26 00:00:00.000000', '2023-12-26 16:51:23.725241', NULL, 5),
(7, '发发发', '2024-01-02 20:17:10.977189', '2024-01-02 20:17:10.977189', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL COMMENT '菜单id',
  `menu_name` varchar(20) NOT NULL COMMENT '菜单名',
  `path` varchar(20) NOT NULL DEFAULT '' COMMENT '路径',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级id',
  `menu_type` varchar(10) NOT NULL COMMENT '菜单类型',
  `component` varchar(40) DEFAULT NULL COMMENT '组件路径',
  `perms` varchar(40) DEFAULT NULL COMMENT '权限标识'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `menu`
--

INSERT INTO `menu` (`id`, `menu_name`, `path`, `create_time`, `update_time`, `remark`, `parent_id`, `menu_type`, `component`, `perms`) VALUES
(1, '系统管理', 'system', '2023-12-26 15:28:41.339790', '2023-12-29 11:13:57.294288', NULL, NULL, 'C', NULL, NULL),
(2, '用户管理', 'user', '2023-12-26 15:28:41.354887', '2024-01-03 18:04:14.626463', NULL, 1, 'M', 'system/user/index', 'system:user:list'),
(3, '角色管理', 'role', '2023-12-26 15:28:41.358910', '2024-01-03 18:04:20.434610', NULL, 1, 'M', 'system/role/index', 'system:role:list'),
(4, '菜单管理', 'menu', '2023-12-26 15:28:41.448148', '2024-01-03 18:04:24.770169', NULL, 1, 'M', 'system/menu/index', 'system:menu:list'),
(5, '部门管理', 'dept', '2023-12-26 15:28:41.449905', '2024-01-03 18:04:29.620616', NULL, 1, 'M', 'system/dept/index', 'system:dept:list'),
(6, '岗位管理', 'post', '2023-12-26 15:28:41.452487', '2024-01-03 18:04:33.166478', NULL, 1, 'M', 'system/post/index', 'system:post:list'),
(7, '推荐地址', 'http://xxx.com', '2023-12-26 15:28:41.452487', '2023-12-31 09:50:40.077442', NULL, NULL, 'C', NULL, NULL),
(8, '测试管理', 'test', '2023-12-29 00:00:00.000000', '2023-12-29 17:49:56.562866', NULL, 1, 'M', NULL, NULL),
(9, '测试数据', 'data', '2023-12-29 00:00:00.000000', '2024-01-03 18:04:42.431163', NULL, 8, 'M', 'system/test/data/index', 'system:test:data:list'),
(10, '空分类', 'empty', '2023-12-31 00:00:00.000000', '2023-12-31 00:00:00.000000', NULL, NULL, 'C', NULL, NULL),
(11, '111111111111', '11111111111', '2024-01-01 22:58:55.387921', '2024-01-01 22:58:55.387921', '', 1, 'C', '', NULL),
(12, '会议管理', 'room', '2024-01-02 22:41:42.534492', '2024-01-02 22:41:42.534492', '', NULL, 'C', '', NULL),
(13, '会议室管理', 'meeting', '2024-01-02 22:43:47.297670', '2024-01-03 18:16:32.035087', '', 12, 'M', 'room/meeting/index', 'room:meeting:list'),
(14, '预定管理', 'booking', '2024-01-02 22:45:37.595073', '2024-01-03 18:16:36.456495', '', 12, 'M', 'room/booking/index', 'room:booking:list'),
(15, '线下会议室', 'offline_room', '2024-01-03 17:52:20.796306', '2024-01-03 17:52:20.796306', '', NULL, 'C', '', NULL),
(16, '会议室列表', 'offline_room_meeting', '2024-01-03 18:05:20.557688', '2024-01-03 18:18:06.320412', '', 15, 'M', 'offline_room/meeting/index', 'offline_room:meeting:list'),
(17, '会议室预定列表', 'offline_room_booking', '2024-01-03 18:06:45.525318', '2024-01-03 18:18:12.502104', '', 15, 'M', 'offline_room/booking/index', 'offline_room:booking:list');

-- --------------------------------------------------------

--
-- 表的结构 `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL COMMENT '岗位id',
  `post_name` varchar(20) NOT NULL COMMENT '岗位名称',
  `post_code` varchar(20) NOT NULL COMMENT '岗位编码',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `remark` varchar(50) DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `post`
--

INSERT INTO `post` (`id`, `post_name`, `post_code`, `create_time`, `update_time`, `remark`) VALUES
(1, '董事长', 'ceo', '2023-12-26 15:28:41.547130', '2023-12-26 15:28:41.547130', NULL),
(2, '普通员工', 'user', '2023-12-26 15:28:41.551034', '2023-12-26 15:28:41.551034', NULL),
(3, '外星人', 'ceo', '2024-01-02 20:30:08.094908', '2024-01-02 20:30:08.094908', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL COMMENT '角色id',
  `role_name` varchar(20) NOT NULL COMMENT '角色名',
  `role_key` varchar(20) NOT NULL COMMENT '角色权限字符串',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `remark` varchar(50) DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `role`
--

INSERT INTO `role` (`id`, `role_name`, `role_key`, `create_time`, `update_time`, `remark`) VALUES
(1, '超级管理员', 'admin', '2023-12-26 15:28:41.621109', '2023-12-26 15:28:41.621109', NULL),
(2, '普通角色', 'common', '2023-12-26 15:28:41.667756', '2023-12-26 15:28:41.667756', NULL),
(3, '测试', 'test', '2024-01-01 22:01:02.296507', '2024-01-01 22:01:02.296507', ''),
(4, '啛啛喳喳', '啛啛喳喳', '2024-01-02 20:00:29.103811', '2024-01-02 20:00:29.103811', '');

-- --------------------------------------------------------

--
-- 表的结构 `role_dept`
--

CREATE TABLE `role_dept` (
  `roleId` int(11) NOT NULL,
  `deptId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `role_dept`
--

INSERT INTO `role_dept` (`roleId`, `deptId`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(2, 4);

-- --------------------------------------------------------

--
-- 表的结构 `role_menu`
--

CREATE TABLE `role_menu` (
  `roleId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `role_menu`
--

INSERT INTO `role_menu` (`roleId`, `menuId`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 8),
(3, 9),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11);

-- --------------------------------------------------------

--
-- 表的结构 `room_booking`
--

CREATE TABLE `room_booking` (
  `id` int(11) NOT NULL,
  `start_time` datetime NOT NULL COMMENT '会议开始时间',
  `end_time` datetime NOT NULL COMMENT '会议结束时间',
  `status` varchar(20) NOT NULL DEFAULT '申请中' COMMENT '状态（申请中，审批通过，审批驳回，已解除）',
  `note` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `userId` int(11) DEFAULT NULL COMMENT '用户id',
  `meetingId` int(11) DEFAULT NULL COMMENT '会议室ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `room_booking`
--

INSERT INTO `room_booking` (`id`, `start_time`, `end_time`, `status`, `note`, `create_time`, `update_time`, `userId`, `meetingId`) VALUES
(1, '1970-01-21 01:24:31', '1970-01-21 01:24:31', '审批通过', '', '2024-01-03 16:30:42.774638', '2024-01-03 20:53:34.000000', 1, 1),
(2, '1970-01-21 01:24:31', '1970-01-21 01:24:31', '审批驳回', '按时参加', '2024-01-03 16:32:45.632608', '2024-01-03 20:53:38.000000', 1, 1),
(3, '1970-01-21 01:24:31', '1970-01-21 01:24:31', '已解除', '按时参加', '2024-01-03 16:41:11.110184', '2024-01-03 21:05:26.000000', 1, 1),
(4, '1970-01-21 01:24:31', '1970-01-21 01:24:31', '已解除', '按时参加', '2024-01-03 16:41:43.512408', '2024-01-04 20:55:59.000000', 1, 1),
(5, '2024-01-03 16:43:33', '2024-01-03 16:44:18', '审批通过', '按时参加', '2024-01-03 16:44:09.679283', '2024-01-03 20:53:43.000000', 1, 1),
(6, '1970-01-21 01:24:48', '1970-01-21 01:24:48', '已解除', '按时参加', '2024-01-03 21:19:46.173247', '2024-01-04 20:55:58.000000', 1, 1),
(7, '2024-01-03 21:52:00', '2024-01-04 21:52:00', '审批通过', 'www', '2024-01-03 21:52:25.601633', '2024-01-03 21:55:19.000000', 1, 5),
(8, '2024-01-05 08:00:00', '2024-01-06 08:00:00', '已解除', 'ff', '2024-01-03 21:53:27.264861', '2024-01-04 20:55:54.000000', 1, 5),
(9, '2024-01-03 21:54:00', '2024-01-05 21:56:00', '审批通过', 'fffffafa', '2024-01-03 21:55:47.722023', '2024-01-04 20:56:23.000000', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `room_meeting`
--

CREATE TABLE `room_meeting` (
  `id` int(11) NOT NULL COMMENT '会议室ID',
  `name` varchar(50) NOT NULL COMMENT '会议室名字',
  `capacity` int(11) NOT NULL COMMENT '会议室容量',
  `location` varchar(50) NOT NULL COMMENT '会议室位置',
  `equipment` varchar(50) NOT NULL DEFAULT '' COMMENT '设备',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '描述',
  `is_booked` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否被预订',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `room_meeting`
--

INSERT INTO `room_meeting` (`id`, `name`, `capacity`, `location`, `equipment`, `description`, `is_booked`, `create_time`, `update_time`) VALUES
(1, '会议室1', 100, '二楼会议室101', '白板', '白板', 0, '2024-01-03 15:48:52.718000', '2024-01-03 15:48:52.718000'),
(2, '会议室2', 10, '二楼会议室102', '白板', '白板', 0, '2024-01-03 15:51:45.558000', '2024-01-03 15:51:45.558000'),
(5, '会议室3', 10, '二楼', '黑板', '好好好', 0, '2024-01-03 17:41:58.912206', '2024-01-03 17:41:58.912206');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `nick_name` varchar(50) NOT NULL COMMENT '昵称',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `phone_number` varchar(50) DEFAULT NULL COMMENT '电话号码',
  `user_type` int(11) DEFAULT '0' COMMENT '用户类别',
  `gender` int(11) DEFAULT '0' COMMENT '用户性别',
  `avatar` varchar(50) DEFAULT NULL COMMENT '用户头像',
  `status` int(11) DEFAULT '0' COMMENT '用户状态',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `remark` varchar(50) DEFAULT NULL COMMENT '用户备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `user_name`, `password`, `nick_name`, `email`, `phone_number`, `user_type`, `gender`, `avatar`, `status`, `create_time`, `update_time`, `remark`) VALUES
(1, 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '张三', 'zhr19853149156@163.com', '123456789', 0, 0, NULL, 0, '2023-12-26 15:28:41.902569', '2023-12-26 15:28:41.902569', NULL),
(2, 'lisi', 'e10adc3949ba59abbe56e057f20f883e', '李四', 'zhr19853149156@163.com', '123456789', 0, 0, NULL, 0, '2023-12-26 15:28:41.910980', '2023-12-26 15:28:41.910980', NULL),
(3, 'tetete123456789', 'tetete', 'tetete', 'zhr19853149156@163.com', '12345678901', 0, 0, NULL, 0, '2023-12-30 17:43:37.539050', '2023-12-30 17:44:52.837696', ''),
(13, 'forof', 'tetete', 'tetete', 'zhr19853149156@163.com', '12345678901', 0, 0, NULL, 0, '2023-12-30 17:45:12.634538', '2023-12-30 17:45:12.634538', ''),
(14, 'redtest', '123456', 'redtest', 'zhr19853149156@163.com', '19853149156', 0, 0, NULL, 0, '2023-12-31 15:47:48.035207', '2023-12-31 15:47:48.035207', '');

-- --------------------------------------------------------

--
-- 表的结构 `user_post`
--

CREATE TABLE `user_post` (
  `userId` int(11) NOT NULL,
  `postId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `user_post`
--

INSERT INTO `user_post` (`userId`, `postId`) VALUES
(1, 1),
(2, 2),
(3, 2),
(13, 2),
(14, 1);

-- --------------------------------------------------------

--
-- 表的结构 `user_role`
--

CREATE TABLE `user_role` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `user_role`
--

INSERT INTO `user_role` (`userId`, `roleId`) VALUES
(1, 1),
(2, 2),
(3, 2),
(13, 2),
(14, 1);

--
-- 转储表的索引
--

--
-- 表的索引 `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `role_dept`
--
ALTER TABLE `role_dept`
  ADD PRIMARY KEY (`roleId`,`deptId`),
  ADD KEY `IDX_8e460a7caed6de78e821b31b74` (`roleId`),
  ADD KEY `IDX_c5acb9b83b3f78ccc5e236e43f` (`deptId`);

--
-- 表的索引 `role_menu`
--
ALTER TABLE `role_menu`
  ADD PRIMARY KEY (`roleId`,`menuId`),
  ADD KEY `IDX_4a57845f090fb832eeac3e3486` (`roleId`),
  ADD KEY `IDX_ed7dbf72cc845b0c9150a67851` (`menuId`);

--
-- 表的索引 `room_booking`
--
ALTER TABLE `room_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_f496648e69674b1937e5d269127` (`userId`),
  ADD KEY `FK_33ddece4ddecc9eb38ebee22cca` (`meetingId`);

--
-- 表的索引 `room_meeting`
--
ALTER TABLE `room_meeting`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `user_post`
--
ALTER TABLE `user_post`
  ADD PRIMARY KEY (`userId`,`postId`),
  ADD KEY `IDX_61c64496bf096b321869175021` (`userId`),
  ADD KEY `IDX_3eb8e2db42e1474c4e900b9668` (`postId`);

--
-- 表的索引 `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`userId`,`roleId`),
  ADD KEY `IDX_ab40a6f0cd7d3ebfcce082131f` (`userId`),
  ADD KEY `IDX_dba55ed826ef26b5b22bd39409` (`roleId`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `dept`
--
ALTER TABLE `dept`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id', AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id', AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位id', AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `room_booking`
--
ALTER TABLE `room_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `room_meeting`
--
ALTER TABLE `room_meeting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会议室ID', AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id', AUTO_INCREMENT=15;

--
-- 限制导出的表
--

--
-- 限制表 `role_dept`
--
ALTER TABLE `role_dept`
  ADD CONSTRAINT `FK_8e460a7caed6de78e821b31b74a` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_c5acb9b83b3f78ccc5e236e43fe` FOREIGN KEY (`deptId`) REFERENCES `dept` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `role_menu`
--
ALTER TABLE `role_menu`
  ADD CONSTRAINT `FK_4a57845f090fb832eeac3e34860` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ed7dbf72cc845b0c9150a678512` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `room_booking`
--
ALTER TABLE `room_booking`
  ADD CONSTRAINT `FK_33ddece4ddecc9eb38ebee22cca` FOREIGN KEY (`meetingId`) REFERENCES `room_meeting` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_f496648e69674b1937e5d269127` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `user_post`
--
ALTER TABLE `user_post`
  ADD CONSTRAINT `FK_3eb8e2db42e1474c4e900b96688` FOREIGN KEY (`postId`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_61c64496bf096b321869175021a` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK_ab40a6f0cd7d3ebfcce082131fd` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_dba55ed826ef26b5b22bd39409b` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
