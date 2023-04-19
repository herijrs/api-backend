-- 创建库
create database if not exists api;

-- 切换库
use api;


-- 用户表
create table if not exists user
(
    id           bigint auto_increment comment 'id' primary key,
    userName     varchar(256)                           null comment '用户昵称',
    userAccount  varchar(256)                           not null comment '账号',
    userAvatar   varchar(1024)                          null comment '用户头像',
    gender       tinyint                                null comment '性别',
    userRole     varchar(256) default 'user'            not null comment '用户角色：user / admin',
    userPassword varchar(512)                           not null comment '密码',
    accessKey varchar(512)                           not null comment 'accessKey',
    secretKey varchar(512)                           not null comment 'secretKey',
    createTime   datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime   datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete     tinyint      default 0                 not null comment '是否删除',
    constraint uni_userAccount
        unique (userAccount)
) comment '用户';


INSERT INTO `user` VALUES (1, 'heri', 'heri', NULL, NULL, 'admin', 'e0261b5a968029d9d6d078dfcc334c4d', 'heri', 'abcdefg', '2023-04-13 15:54:16', '2023-04-17 10:55:45', 0);
INSERT INTO `user` VALUES (4, 'yupi', 'yupi', NULL, NULL, 'user', 'e0261b5a968029d9d6d078dfcc334c4d', '08563cd74460b0fd80efc8c097a9d024', '30f4844a4e08fb7e5d1dfeaa126e29c9', '2023-04-17 10:25:15', '2023-04-17 10:25:15', 0);
INSERT INTO `user` VALUES (5, 'user', 'user', NULL, NULL, 'user', 'e0261b5a968029d9d6d078dfcc334c4d', '503d470d167acd07f2579b8ccf29d459', 'c0be181480758356b1caa459975ff67e', '2023-04-17 10:30:21', '2023-04-17 10:30:21', 0);
INSERT INTO `user` VALUES (6, 'admin', 'admin', NULL, NULL, 'admin', 'e0261b5a968029d9d6d078dfcc334c4d', 'b52ce649b2134235eee387b9b55bfd0f', 'b458dcee4f0e25b61fa9ccf0c88c14eb', '2023-04-17 10:47:18', '2023-04-17 10:49:03', 0);




-- 接口信息
create table if not exists `interface_info`
(
    `id` bigint not null auto_increment comment '主键' primary key,
    `name` varchar(256) not null comment '名称',
    `description` varchar(256) null comment '描述',
    `url` varchar(512) not null comment '接口地址',
    `requestParams` text not null comment '请求参数',
    `requestHeader` text null comment '请求头',
    `responseHeader` text null comment '响应头',
    `status` int default 0 not null comment '接口状态（0-关闭，1-开启）',
    `method` varchar(256) not null comment '请求类型',
    `userId` bigint not null comment '创建人',
    `createTime` datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    `updateTime` datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    `isDelete` tinyint default 0 not null comment '是否删除(0-未删, 1-已删)'
    ) comment '接口信息';


INSERT INTO `interface_info` VALUES (1, 'getNameByGet', '获取用户名', 'http://localhost:8123/api/name/user', '[]', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'GET', 1, '2023-04-16 15:14:07', '2023-04-16 15:14:07', 0);
INSERT INTO `interface_info` VALUES (2, 'getUserNameByPost', '获取用户名', 'http://localhost:8123/api/name/user', '[{\"name\":\"userName\",\"type\":\"string\"}]', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'POST', 1, '2023-04-16 15:14:07', '2023-04-16 15:14:07', 0 );


-- 用户调用接口关系表
create table if not exists `user_interface_info`
(
    `id` bigint not null auto_increment comment '主键' primary key,
    `userId` bigint not null comment '调用用户 id',
    `interfaceInfoId` bigint not null comment '接口 id',
    `totalNum` int default 0 not null comment '总调用次数',
    `leftNum` int default 0 not null comment '剩余调用次数',
    `status` int default 0 not null comment '0-正常，1-禁用',
    `createTime` datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    `updateTime` datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    `isDelete` tinyint default 0 not null comment '是否删除(0-未删, 1-已删)'
) comment '用户调用接口关系';


INSERT INTO `user_interface_info` VALUES (1, 1, 1, 2, 3, 0, '2023-04-13 20:24:30', '2023-04-13 20:24:30', 0);
INSERT INTO `user_interface_info` VALUES (2, 1, 2, 12, 1000, 0, '2023-04-16 14:36:01', '2023-04-17 10:31:48', 0);
INSERT INTO `user_interface_info` VALUES (3, 5, 2, 0, 1000, 0, '2023-04-17 10:31:48', '2023-04-17 10:31:48', 0);
INSERT INTO `user_interface_info` VALUES (4, 6, 2, 0, 1000, 0, '2023-04-17 10:48:10', '2023-04-17 10:48:10', 0);




