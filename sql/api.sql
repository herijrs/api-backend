create
database IF NOT EXISTS re_api;
-- 接口信息

DROP TABLE IF EXISTS re_api.`interface_info`;
CREATE TABLE re_api.`interface_info`
(
    `id`                   bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name`                 varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
    `description`          varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
    `path`                 varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接口地址',
    `url`                  varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主机名',
    `requestParams`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数',
    `requestParamsRemark`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数说明',
    `responseParamsRemark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '响应参数说明',
    `requestHeader`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求头',
    `responseHeader`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '响应头',
    `status`               int                                                           NOT NULL DEFAULT 0 COMMENT '接口状态（0-关闭，1-开启）',
    `method`               varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求类型',
    `userId`               bigint                                                        NOT NULL COMMENT '创建人',
    `createTime`           datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updateTime`           datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `isDelete`             tinyint                                                       NOT NULL DEFAULT 0 COMMENT '是否删除(0-未删, 1-已删)',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '接口信息' ROW_FORMAT = Dynamic;

-- 用户调用接口关系表
create table if not exists re_api.`user_interface_info`
(
    `id`
    bigint
    not
    null
    auto_increment
    comment
    '主键'
    primary
    key,
    `userId`
    bigint
    not
    null
    comment
    '调用用户 id',
    `interfaceInfoId`
    bigint
    not
    null
    comment
    '接口 id',
    `totalNum`
    int
    default
    0
    not
    null
    comment
    '总调用次数',
    `leftNum`
    int
    default
    0
    not
    null
    comment
    '剩余调用次数',
    `status`
    int
    default
    0
    not
    null
    comment
    '0-正常，1-禁用',
    `createTime`
    datetime
    default
    CURRENT_TIMESTAMP
    not
    null
    comment
    '创建时间',
    `updateTime`
    datetime
    default
    CURRENT_TIMESTAMP
    not
    null
    on
    update
    CURRENT_TIMESTAMP
    comment
    '更新时间',
    `isDelete`
    tinyint
    default
    0
    not
    null
    comment
    '是否删除(0-未删, 1-已删)'
) comment '用户调用接口关系';

-- ----------------------------
-- Records of interface_info
-- ----------------------------
INSERT INTO re_api.`interface_info`
VALUES (1, '获取当前用户名称', '获取用户名称', '/api/name/user', 'http://localhost:8090',
        '{\n    \"username\": \"reflux\"\n}', NULL, NULL, '{\"Content-Type\": \"application/json\"}',
        '{\"Content-Type\": \"application/json\"}', 1, 'POST', 1667508636207661058, '2023-06-14 21:18:10',
        '2023-07-10 11:24:01', 0);
INSERT INTO re_api.`interface_info`
VALUES (24, '随机头像', '随机获取一个头像地址', '/api/rand.avatar', 'https://api.uomg.com', 'sort=男&format=json',
        '[{\"id\":1688957070977,\"name\":\"sort\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"选择输出分类[男|女|动漫男|动漫女]，为空随机输出\"},{\"id\":1688957075391,\"name\":\"format\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"选择输出格式[json|images]\"}]',
        '[{\"id\":1688957088125,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1688957090261,\"name\":\"imgurl\",\"type\":\"string\",\"remark\":\"返回图片地址\"},{\"id\":1688957090855,\"name\":\"msg\",\"type\":\"string\",\"remark\":\"返回错误提示信息！\"}]',
        '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'GET',
        1667508636207661058, '2023-07-08 12:07:23', '2023-07-10 10:45:10', 0);
INSERT INTO re_api.`interface_info`
VALUES (26, '网易云音乐随机歌曲', '网易云音乐，随机歌曲输出。', '/api/rand.music', 'https://api.uomg.com',
        'sort=热歌榜&format=json',
        '[{\"id\":1,\"name\":\"sort\",\"isRequired\":\"否\",\"type\":\"string\",\"remark\":\"选择输出分类[热歌榜|新歌榜|飙升榜|抖音榜|电音榜]，为空输出热歌榜\"},{\"id\":2,\"name\":\"mid\",\"isRequired\":\"否\",\"type\":\"int\",\"remark\":\"网易云歌单ID\"},{\"id\":1688815371547,\"name\":\"format\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"选择输出格式[json|mp3]\"}]',
        '[{\"id\":1688815422793,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1688815424624,\"name\":\"data\",\"type\":\"string\",\"remark\":\"返回歌曲数据\"},{\"id\":1688815425060,\"name\":\"msg\",\"type\":\"string\",\"remark\":\"返回错误提示信息\"}]',
        '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'GET',
        1667508636207661058, '2023-07-08 16:30:06', '2023-07-08 19:43:01', 0);
INSERT INTO re_api.`interface_info`
VALUES (27, '网易云音乐热门评论', '网易云音乐热门评论随机API接口', '/api/comments.163', 'https://api.uomg.com',
        'format=json',
        '[{\"id\":1688816624700,\"name\":\"mid\",\"isRequired\":\"no\",\"type\":\"int\",\"remark\":\"网易云歌单ID\"},{\"id\":1688816632619,\"name\":\"format\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"选择输出格式[json|mp3]\"}]',
        '[{\"id\":1688816648171,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1688816649732,\"name\":\"data\",\"type\":\"string\",\"remark\":\"返回评论数据\"},{\"id\":1688816650394,\"name\":\"msg\",\"type\":\"string\",\"remark\":\"返回错误提示信息\"}]',
        NULL, NULL, 1, 'GET', 1667508636207661058, '2023-07-08 17:05:42', '2023-07-10 11:24:32', 0);
INSERT INTO re_api.`interface_info`
VALUES (29, '随机壁纸', '随机获取一个壁纸地址', '/api/sjbz', 'http://api.btstu.cn', 'lx=dongman&format=json',
        '[{\"id\":1689002138135,\"name\":\"method\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"输出壁纸端[mobile|pc|zsy]默认为pc\"},{\"id\":1689002153560,\"name\":\"lx\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"选择输出分类[meizi|dongman|fengjing|suiji]，为空随机输出\"},{\"id\":1689002153860,\"name\":\"format\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"输出壁纸格式[json|images]默认为images\"}]',
        '[{\"id\":1689002171759,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1689002173057,\"name\":\"imgurl\\t\",\"type\":\"string\",\"remark\":\"返回图片地址\"},{\"id\":1689002173621,\"name\":\"width\",\"type\":\"string\",\"remark\":\"返回图片宽度\"},{\"id\":1689002184505,\"name\":\"height\\t\",\"type\":\"string\",\"remark\":\"返回图片高度\"}]',
        NULL, NULL, 1, 'GET', 1667508636207661058, '2023-07-09 20:28:31', '2023-07-10 23:45:37', 0);
INSERT INTO re_api.`interface_info`
VALUES (30, '毒鸡汤', '随机生成一句毒鸡汤语录', '/api/poison', 'http://localhost:8090', 'charset=utf-8&encode=json',
        '[{\"id\":1689002041985,\"name\":\"charset\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"返回编码类型[gbk|utf-8]默认utf-8\"},{\"id\":1689002080311,\"name\":\"encode\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"返回格式类型[text|js|json]默认text\"}]',
        '[{\"id\":1689002092752,\"name\":\"code\",\"type\":\"string\",\"remark\":\"code\"}]', NULL, NULL, 1, 'GET',
        1667508636207661058, '2023-07-09 21:17:10', '2023-07-10 23:17:52', 0);
INSERT INTO re_api.`interface_info`
VALUES (31, '抖音解析', '解析抖音链接，获取无水印链接', '/dyjx/api.php', 'http://api.btstu.cn',
        'url=https://v.douyin.com/J8TVGVn/',
        '[{\"id\":1689003649028,\"name\":\"url\",\"isRequired\":\"yes\",\"type\":\"string\",\"remark\":\"需要解析的抖音地址\"}]',
        '[{\"id\":1689003654626,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1689003659703,\"name\":\"msg\",\"type\":\"string\",\"remark\":\"状态码说明\"},{\"id\":1689003660215,\"name\":\"data\",\"type\":\"string\",\"remark\":\"链接解析信息\"}]',
        NULL, NULL, 1, 'GET/POST', 1667508636207661058, '2023-07-10 23:29:28', '2023-07-11 00:07:13', 1);
INSERT INTO re_api.`interface_info`
VALUES (32, 'Qrcode二维码', '生成在线二维码', '/qrcode/api.php', 'http://api.btstu.cn',
        'text=https://api.btstu.cn&size=300',
        '[{\"id\":1689003685138,\"name\":\"text\",\"isRequired\":\"yes\",\"type\":\"string\",\"remark\":\"二维码内容\"},{\"id\":1689003723361,\"name\":\"size\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"二维码大小，单位为px\"}]',
        '[{\"id\":1689003739093,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1689003740418,\"name\":\"msg\",\"type\":\"string\",\"remark\":\"返回错误提示！\"}]',
        NULL, NULL, 1, 'GET', 1667508636207661058, '2023-07-10 23:36:22', '2023-07-11 00:05:28', 1);
INSERT INTO re_api.`interface_info`
VALUES (33, '获取QQ昵称和头像', '获取QQ昵称和头像', '/api/QQname', 'http://api.btstu.cn', 'qq=10001',
        '[{\"id\":1689004243483,\"name\":\"qq\",\"isRequired\":\"yes\",\"type\":\"string\",\"remark\":\"查询的QQ号码\"}]',
        '[{\"id\":1689004308636,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1689004319045,\"name\":\"msg\",\"type\":\"string\",\"remark\":\"返回错误提示！\"},{\"id\":1689004319618,\"name\":\"imgurl\",\"type\":\"string\",\"remark\":\"QQ头像图片地址\"},{\"id\":1689004320086,\"name\":\"name\",\"type\":\"string\",\"remark\":\"QQ昵称\"}]',
        NULL, NULL, 1, 'GET', 1667508636207661058, '2023-07-10 23:52:19', '2023-07-10 23:54:32', 1);
INSERT INTO re_api.`interface_info`
VALUES (34, '短网址生成', '将长网址进行缩短，支持百度、新浪、腾讯短网址等等。', '/api/long2dwz', 'https://api.uomg.com',
        'dwzapi=urlcn&url=http://qrpay.uomg.com',
        '[{\"id\":1689004480035,\"name\":\"url\",\"isRequired\":\"yes\",\"type\":\"string\",\"remark\":\"需要进行缩短的长网址\"},{\"id\":1689004514429,\"name\":\"dwzapi\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"选择缩短接口[tcn|dwzcn|urlcn|suoim|mrwso|]\"}]',
        '[{\"id\":1689004538420,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1689004564886,\"name\":\"ae_url\",\"type\":\"string\",\"remark\":\"返回缩短后的短网址\"},{\"id\":1689004565428,\"name\":\"msg\",\"type\":\"string\",\"remark\":\"返回错误提示信息！\"}]',
        NULL, NULL, 1, 'GET/POST', 1667508636207661058, '2023-07-10 23:56:35', '2023-07-10 23:57:13', 0);

-- ----------------------------
-- Records of user_interface_info
-- ----------------------------
INSERT INTO re_api.`user_interface_info`
VALUES (2, 1683475117221625858, 27, 33, 100, 0, '2023-07-09 13:11:12', '2023-07-10 11:24:32', 0);
INSERT INTO re_api.`user_interface_info`
VALUES (3, 1683475117221625858, 26, 4, 200, 0, '2023-07-09 13:56:07', '2023-07-10 11:46:49', 0);
INSERT INTO re_api.`user_interface_info`
VALUES (7, 1683475117221625858, 24, 7, 200, 0, '2023-07-09 17:00:15', '2023-07-10 10:43:53', 0);
INSERT INTO re_api.`user_interface_info`
VALUES (8, 1683475117221625858, 29, 1, 200, 0, '2023-07-09 20:46:03', '2023-07-10 23:45:37', 0);
INSERT INTO re_api.`user_interface_info`
VALUES (9, 1683475117221625858, 30, 25, 200, 0, '2023-07-09 21:17:15', '2023-07-10 23:27:42', 0);
INSERT INTO re_api.`user_interface_info`
VALUES (13, 1683475117221625858, 1, 2, 200, 0, '2023-07-10 10:49:12', '2023-07-10 11:24:01', 0);

INSERT INTO re_api.`user_interface_info`
VALUES (20, 1683474838476570625, 27, 33, 100, 0, '2023-07-09 13:11:12', '2023-07-10 11:24:32', 0);
INSERT INTO re_api.`user_interface_info`
VALUES (21, 1683474838476570625, 26, 4, 200, 0, '2023-07-09 13:56:07', '2023-07-10 11:46:49', 0);
INSERT INTO re_api.`user_interface_info`
VALUES (22, 1683474838476570625, 24, 7, 200, 0, '2023-07-09 17:00:15', '2023-07-10 10:43:53', 0);
INSERT INTO re_api.`user_interface_info`
VALUES (23, 1683474838476570625, 29, 1, 200, 0, '2023-07-09 20:46:03', '2023-07-10 23:45:37', 0);
INSERT INTO re_api.`user_interface_info`
VALUES (24, 1683474838476570625, 30, 25, 200, 0, '2023-07-09 21:17:15', '2023-07-10 23:27:42', 0);
INSERT INTO re_api.`user_interface_info`
VALUES (25, 1683474838476570625, 1, 2, 200, 0, '2023-07-10 10:49:12', '2023-07-10 11:24:01', 0);
INSERT INTO re_api.`user_interface_info`
VALUES (26, 1683474838476570625, 31, 3, 200, 0, '2023-07-10 23:29:44', '2023-07-11 00:06:54', 0);
INSERT INTO re_api.`user_interface_info`
VALUES (15, 1683474838476570625, 32, 3, 200, 0, '2023-07-10 23:45:41', '2023-07-11 00:00:01', 0);
INSERT INTO re_api.`user_interface_info`
VALUES (16, 1683474838476570625, 33, 2, 200, 0, '2023-07-10 23:52:42', '2023-07-10 23:53:44', 0);
INSERT INTO re_api.`user_interface_info`
VALUES (17, 1683474838476570625, 34, 3, 200, 0, '2023-07-10 23:57:23', '2023-07-11 00:06:14', 0);

select *
from interface_info
/*delete == 0 代表未删除，status == 0 代表已关闭，并且更新时间要*/
where (isDelete = 0 AND status = 0)
  AND updateTime <= DATE_SUB(NOW(), INTERVAL 10 DAY);