/*
MySQL Backup
Database: movie
Backup Time: 2017-10-08 23:26:58
*/

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `movie`.`admin`;
DROP TABLE IF EXISTS `movie`.`adminlog`;
DROP TABLE IF EXISTS `movie`.`auth`;
DROP TABLE IF EXISTS `movie`.`comment`;
DROP TABLE IF EXISTS `movie`.`movie`;
DROP TABLE IF EXISTS `movie`.`moviecol`;
DROP TABLE IF EXISTS `movie`.`oplog`;
DROP TABLE IF EXISTS `movie`.`preview`;
DROP TABLE IF EXISTS `movie`.`role`;
DROP TABLE IF EXISTS `movie`.`tag`;
DROP TABLE IF EXISTS `movie`.`user`;
DROP TABLE IF EXISTS `movie`.`userlog`;
CREATE TABLE `admin`
(
    `id`       int(11) NOT NULL AUTO_INCREMENT,
    `name`     varchar(100) DEFAULT NULL,
    `pwd`      varchar(100) DEFAULT NULL,
    `is_super` smallint(6)  DEFAULT NULL,
    `role_id`  int(11)      DEFAULT NULL,
    `addtime`  datetime     DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`),
    KEY `role_id` (`role_id`),
    KEY `ix_admin_addtime` (`addtime`),
    CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8;
CREATE TABLE `adminlog`
(
    `id`       int(11) NOT NULL AUTO_INCREMENT,
    `admin_id` int(11)      DEFAULT NULL,
    `ip`       varchar(100) DEFAULT NULL,
    `addtime`  datetime     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `admin_id` (`admin_id`),
    KEY `ix_adminlog_addtime` (`addtime`),
    CONSTRAINT `adminlog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 113
  DEFAULT CHARSET = utf8;
CREATE TABLE `auth`
(
    `id`      int(11) NOT NULL AUTO_INCREMENT,
    `name`    varchar(100) DEFAULT NULL,
    `url`     varchar(255) DEFAULT NULL,
    `addtime` datetime     DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`),
    UNIQUE KEY `url` (`url`),
    KEY `ix_auth_addtime` (`addtime`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8;
CREATE TABLE `comment`
(
    `id`       int(11) NOT NULL AUTO_INCREMENT,
    `content`  text,
    `movie_id` int(11)  DEFAULT NULL,
    `user_id`  int(11)  DEFAULT NULL,
    `addtime`  datetime DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `movie_id` (`movie_id`),
    KEY `user_id` (`user_id`),
    KEY `ix_comment_addtime` (`addtime`),
    CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
    CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 51
  DEFAULT CHARSET = utf8;
CREATE TABLE `movie`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT,
    `title`        varchar(255) DEFAULT NULL,
    `url`          varchar(255) DEFAULT NULL,
    `info`         text,
    `logo`         varchar(255) DEFAULT NULL,
    `star`         smallint(6)  DEFAULT NULL,
    `playnum`      bigint(20)   DEFAULT NULL,
    `commentnum`   bigint(20)   DEFAULT NULL,
    `tag_id`       int(11)      DEFAULT NULL,
    `area`         varchar(255) DEFAULT NULL,
    `release_time` date         DEFAULT NULL,
    `length`       varchar(100) DEFAULT NULL,
    `addtime`      datetime     DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `title` (`title`),
    UNIQUE KEY `url` (`url`),
    UNIQUE KEY `logo` (`logo`),
    KEY `tag_id` (`tag_id`),
    KEY `ix_movie_addtime` (`addtime`),
    CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8;
CREATE TABLE `moviecol`
(
    `id`       int(11) NOT NULL AUTO_INCREMENT,
    `movie_id` int(11)  DEFAULT NULL,
    `user_id`  int(11)  DEFAULT NULL,
    `addtime`  datetime DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `movie_id` (`movie_id`),
    KEY `user_id` (`user_id`),
    KEY `ix_moviecol_addtime` (`addtime`),
    CONSTRAINT `moviecol_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
    CONSTRAINT `moviecol_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 316
  DEFAULT CHARSET = utf8;
CREATE TABLE `oplog`
(
    `id`       int(11) NOT NULL AUTO_INCREMENT,
    `admin_id` int(11)      DEFAULT NULL,
    `ip`       varchar(100) DEFAULT NULL,
    `reason`   varchar(600) DEFAULT NULL,
    `addtime`  datetime     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `admin_id` (`admin_id`),
    KEY `ix_oplog_addtime` (`addtime`),
    CONSTRAINT `oplog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 65
  DEFAULT CHARSET = utf8;
CREATE TABLE `preview`
(
    `id`      int(11) NOT NULL AUTO_INCREMENT,
    `title`   varchar(255) DEFAULT NULL,
    `logo`    varchar(255) DEFAULT NULL,
    `addtime` datetime     DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `title` (`title`),
    UNIQUE KEY `logo` (`logo`),
    KEY `ix_preview_addtime` (`addtime`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  DEFAULT CHARSET = utf8;
CREATE TABLE `role`
(
    `id`      int(11) NOT NULL AUTO_INCREMENT,
    `name`    varchar(100) DEFAULT NULL,
    `auths`   varchar(600) DEFAULT NULL,
    `addtime` datetime     DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`),
    KEY `ix_role_addtime` (`addtime`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8;
CREATE TABLE `tag`
(
    `id`      int(11) NOT NULL AUTO_INCREMENT,
    `name`    varchar(100) DEFAULT NULL,
    `addtime` datetime     DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`),
    KEY `ix_tag_addtime` (`addtime`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 71
  DEFAULT CHARSET = utf8;
CREATE TABLE `user`
(
    `id`      int(11) NOT NULL AUTO_INCREMENT,
    `name`    varchar(100) DEFAULT NULL,
    `pwd`     varchar(100) DEFAULT NULL,
    `email`   varchar(100) DEFAULT NULL,
    `phone`   varchar(11)  DEFAULT NULL,
    `info`    text,
    `face`    varchar(255) DEFAULT NULL,
    `addtime` datetime     DEFAULT NULL,
    `uuid`    varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`),
    UNIQUE KEY `email` (`email`),
    UNIQUE KEY `phone` (`phone`),
    UNIQUE KEY `face` (`face`),
    UNIQUE KEY `uuid` (`uuid`),
    KEY `ix_user_addtime` (`addtime`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 17
  DEFAULT CHARSET = utf8;
CREATE TABLE `userlog`
(
    `id`      int(11) NOT NULL AUTO_INCREMENT,
    `user_id` int(11)      DEFAULT NULL,
    `ip`      varchar(100) DEFAULT NULL,
    `addtime` datetime     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    KEY `ix_userlog_addtime` (`addtime`),
    CONSTRAINT `userlog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 66
  DEFAULT CHARSET = utf8;
BEGIN;
LOCK TABLES `movie`.`admin` WRITE;
DELETE
FROM `movie`.`admin`;
INSERT INTO `movie`.`admin` (`id`, `name`, `pwd`, `is_super`, `role_id`, `addtime`)
VALUES (1, 'imoocmovie',
        'pbkdf2:sha256:50000$Lxv6JZ3o$bd85235be0ca5d89e386a84b5c09bddfd77d32e64ded8e618298fcea6aa0184c', 0, 1,
        '2017-09-27 08:21:22'),
       (2, 'imoocmovie1',
        'pbkdf2:sha256:50000$Qv7oHY7r$731573923e91957301b19e5af9ffb4e9aedeffa88c8cefe51f99b3f748aa1dbe', 0, 1,
        '2017-09-27 16:27:45'),
       (3, 'imoocmovie2',
        'pbkdf2:sha256:50000$GAZMCwaL$72354149e89112350323ed58f016c9fe47d545dad11906998dad13cedf3c488a', NULL, 2,
        '2017-10-04 22:26:58');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `movie`.`adminlog` WRITE;
DELETE
FROM `movie`.`adminlog`;
INSERT INTO `movie`.`adminlog` (`id`, `admin_id`, `ip`, `addtime`)
VALUES (108, 1, '127.0.0.1', '2017-10-07 18:10:26'),
       (109, 1, '127.0.0.1', '2017-10-08 17:21:51'),
       (110, 1, '127.0.0.1', '2017-10-08 17:34:52'),
       (111, 1, '127.0.0.1', '2017-10-08 17:36:21'),
       (112, 1, '127.0.0.1', '2017-10-08 17:38:46');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `movie`.`auth` WRITE;
DELETE
FROM `movie`.`auth`;
INSERT INTO `movie`.`auth` (`id`, `name`, `url`, `addtime`)
VALUES (1, '添加标签', '/admin/tag/add/', '2017-10-04 11:41:55'),
       (2, '添加电影', '/admin/movie/add/', '2017-10-04 11:45:09'),
       (3, '标签列表', '/admin/tag/list/<int:page>/', '2017-10-04 15:44:10'),
       (4, '电影列表', '/admin/movie/list/<int:page>/', '2017-10-04 15:44:35'),
       (5, '编辑标签', '/admin/tag/edit/<int:id>/', '2017-10-04 15:45:36'),
       (6, '删除标签', '/admin/tag/del/<int:id>/', '2017-10-04 15:46:17');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `movie`.`comment` WRITE;
DELETE
FROM `movie`.`comment`;
INSERT INTO `movie`.`comment` (`id`, `content`, `movie_id`, `user_id`, `addtime`)
VALUES (13, '好看', 7, 1, '2017-10-02 22:55:05'),
       (14, '不错', 7, 2, '2017-10-02 22:55:05'),
       (15, '经典', 7, 3, '2017-10-02 22:55:05'),
       (17, '难看', 7, 5, '2017-10-02 22:55:05'),
       (18, '无聊', 7, 6, '2017-10-02 22:55:05'),
       (19, '乏味', 9, 7, '2017-10-02 22:55:05'),
       (20, '无感', 10, 8, '2017-10-02 22:55:05'),
       (22, '不错', 7, 6, '2017-10-02 22:55:24'),
       (25, '难看', 9, 5, '2017-10-02 22:55:24'),
       (26, '无聊', 9, 6, '2017-10-02 22:55:24'),
       (27, '乏味', 9, 7, '2017-10-02 22:55:24'),
       (34, '好看', 10, 1, '2017-10-02 23:10:36');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `movie`.`movie` WRITE;
DELETE
FROM `movie`.`movie`;
INSERT INTO `movie`.`movie` (`id`, `title`, `url`, `info`, `logo`, `star`, `playnum`, `commentnum`, `tag_id`, `area`,
                             `release_time`, `length`, `addtime`)
VALUES (7, '环太平洋1', '20171002162623_401828614b0e40ceb50c2f1df08fabf2.mp4', 'ddddddddddddddddddddddd',
        '20171002162623_46a2c73545e646c19381fbabf0c12cf9.jpg', 2, 52, 9, 48, '三体文明', '2017-10-26', '34',
        '2017-10-01 18:13:31'),
       (9, '天空之城1', '20171003212858_0af85997270e4269ab366d26bfbb38f3.mp4', '天空之城11111111',
        '20171003212858_0aa2a9b696164cbabd69ede6023ec212.jpg', 3, 21, 3, 66, '日本', '2017-10-12', '12',
        '2017-10-03 21:28:58'),
       (10, '空战1', '20171006165656_4922e154fdc14f938758fec40620ff6a.mp4',
        '空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战',
        '20171006165656_5035c86e0ff94f3aa13e3f8ddecfadc7.jpg', 5, 36, 8, 56, '中国', '2017-10-19', '21',
        '2017-10-06 16:56:56');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `movie`.`moviecol` WRITE;
DELETE
FROM `movie`.`moviecol`;
INSERT INTO `movie`.`moviecol` (`id`, `movie_id`, `user_id`, `addtime`)
VALUES (5, 7, 5, '2017-10-03 09:33:09'),
       (6, 9, 6, '2017-10-03 09:33:09'),
       (7, 7, 7, '2017-10-03 09:33:09'),
       (8, 9, 8, '2017-10-03 09:33:09'),
       (13, 7, 5, '2017-10-03 10:10:48'),
       (14, 9, 6, '2017-10-03 10:10:48'),
       (15, 7, 7, '2017-10-03 10:10:48'),
       (16, 9, 8, '2017-10-03 10:10:48'),
       (17, 7, 1, '2017-10-03 10:11:01'),
       (18, 7, 2, '2017-10-03 10:11:01'),
       (19, 7, 3, '2017-10-03 10:11:01'),
       (20, 7, 4, '2017-10-03 10:11:02'),
       (21, 9, 5, '2017-10-03 10:11:02'),
       (22, 10, 6, '2017-10-03 10:11:02'),
       (23, 10, 7, '2017-10-03 10:11:02'),
       (24, 10, 8, '2017-10-03 10:11:02'),
       (25, 7, 1, '2017-10-03 10:11:02'),
       (26, 7, 2, '2017-10-03 10:11:02'),
       (27, 7, 3, '2017-10-03 10:11:02'),
       (28, 7, 4, '2017-10-03 10:11:02'),
       (29, 10, 5, '2017-10-03 10:11:02'),
       (32, 10, 8, '2017-10-03 10:11:02'),
       (33, 7, 1, '2017-10-03 13:39:05'),
       (34, 7, 2, '2017-10-03 13:39:06'),
       (35, 7, 3, '2017-10-03 13:39:06'),
       (36, 7, 4, '2017-10-03 13:39:06'),
       (37, 10, 5, '2017-10-03 13:39:06'),
       (38, 10, 6, '2017-10-03 13:39:06'),
       (39, 10, 7, '2017-10-03 13:39:06'),
       (40, 10, 8, '2017-10-03 13:39:06'),
       (41, 7, 1, '2017-10-03 13:39:06'),
       (42, 7, 2, '2017-10-03 13:39:06'),
       (43, 7, 3, '2017-10-03 13:39:06'),
       (44, 7, 4, '2017-10-03 13:39:06'),
       (45, 7, 5, '2017-10-03 13:39:06'),
       (46, 7, 6, '2017-10-03 13:39:06'),
       (47, 7, 7, '2017-10-03 13:39:06'),
       (48, 9, 8, '2017-10-03 13:39:07'),
       (49, 7, 1, '2017-10-03 13:39:07'),
       (50, 7, 2, '2017-10-03 13:39:07'),
       (51, 7, 3, '2017-10-03 13:39:07'),
       (52, 7, 4, '2017-10-03 13:39:07'),
       (53, 9, 5, '2017-10-03 13:39:07'),
       (54, 9, 6, '2017-10-03 13:39:07');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `movie`.`oplog` WRITE;
DELETE
FROM `movie`.`oplog`;
INSERT INTO `movie`.`oplog` (`id`, `admin_id`, `ip`, `reason`, `addtime`)
VALUES (1, 1, '127.0.0.1', '添加一个标签：异界', '2017-10-03 19:45:50'),
       (2, 1, '127.0.0.1', '添加一个标签：治愈', '2017-10-03 19:58:58'),
       (3, 1, '127.0.0.1', '修改标签“异界”为“神界”', '2017-10-03 21:18:57'),
       (4, 1, '127.0.0.1', '修改了密码', '2017-10-03 21:19:58'),
       (5, 1, '127.0.0.1', '删除标签：神界', '2017-10-03 21:23:51'),
       (6, 1, '127.0.0.1', '添加一部电影：天空之城1', '2017-10-03 21:28:58'),
       (7, 1, '127.0.0.1', '修改电影：天空之城1（原 天空之城）', '2017-10-03 21:35:53'),
       (8, 1, '127.0.0.1', '修改电影：天空之城（原名：天空之城）', '2017-10-03 21:36:37'),
       (9, 1, '127.0.0.1', '删除电影：环太平洋1', '2017-10-03 21:38:10'),
       (10, 1, '127.0.0.1', '删除用户 鼠 在 环太平洋 的评论：好看', '2017-10-03 22:06:26'),
       (11, 1, '127.0.0.1', '删除用户「虎」在「环太平洋」的评论：经典', '2017-10-03 22:09:35'),
       (12, 1, '127.0.0.1', '删除用户「兔(4)」在「环太平洋」的评论：给力', '2017-10-03 22:11:13'),
       (13, 1, '127.0.0.1', '删除会员「虎(3)」对电影《环太平洋》的收藏', '2017-10-03 22:18:25'),
       (14, 1, '127.0.0.1', '删除会员「兔(4)」在《环太平洋》的评论：给力', '2017-10-03 22:18:45'),
       (15, 1, '127.0.0.1', '修改电影预告：赛车预告（原名：赛车预告）', '2017-10-03 22:20:47'),
       (16, 1, '127.0.0.1', '删除会员「虎(3)」对电影《环太平洋》的收藏', '2017-10-03 22:21:40'),
       (17, 1, '127.0.0.1', '添加新权限：添加标签', '2017-10-04 11:41:55'),
       (18, 1, '127.0.0.1', '添加新权限：添加电影', '2017-10-04 11:45:09'),
       (19, 1, '127.0.0.1', '修改权限：添加电影1（原名：添加电影）', '2017-10-04 12:23:34'),
       (20, 1, '127.0.0.1', '修改权限：添加电影（原名：添加电影1）', '2017-10-04 12:24:22'),
       (21, 1, '127.0.0.1', '修改权限：添加电影1（原名：添加电影）', '2017-10-04 12:27:47'),
       (22, 1, '127.0.0.1', '修改权限：添加电影（原名：添加电影1）', '2017-10-04 12:28:01'),
       (23, 1, '127.0.0.1', '添加新权限：标签列表', '2017-10-04 15:44:10'),
       (24, 1, '127.0.0.1', '添加新权限：电影列表', '2017-10-04 15:44:35'),
       (25, 1, '127.0.0.1', '添加新权限：编辑标签', '2017-10-04 15:45:36'),
       (26, 1, '127.0.0.1', '添加新权限：删除标签', '2017-10-04 15:46:17'),
       (27, 1, '127.0.0.1', '删除标签：二次元', '2017-10-04 15:59:12'),
       (28, 1, '127.0.0.1', '添加新标签：自然', '2017-10-04 16:01:39'),
       (29, 1, '127.0.0.1', '添加新标签：小清新', '2017-10-04 16:04:50'),
       (30, 1, '127.0.0.1', '添加新角色：test角色', '2017-10-04 16:39:48'),
       (31, 1, '127.0.0.1', '修改权限：编辑标签1（原名：编辑标签）', '2017-10-04 17:16:10'),
       (32, 1, '127.0.0.1', '修改权限：编辑标签（原名：编辑标签1）', '2017-10-04 17:16:47'),
       (33, 1, '127.0.0.1', '修改电影：天空之城（原名：天空之城）', '2017-10-04 17:44:35'),
       (34, 1, '127.0.0.1', '添加新角色：test角色1', '2017-10-04 18:21:44'),
       (35, 1, '127.0.0.1', '修改角色：test角色1（原名：test角色1）', '2017-10-04 18:21:55'),
       (36, 1, '127.0.0.1', '修改角色：test角色1（原名：test角色1）', '2017-10-04 18:23:24'),
       (37, 1, '127.0.0.1', '修改角色：test角色2（原名：test角色1）', '2017-10-04 18:39:08'),
       (38, 1, '127.0.0.1', '添加新角色：test角色1', '2017-10-04 18:39:18'),
       (39, 1, '127.0.0.1', '删除角色：test角色1', '2017-10-04 18:43:43'),
       (40, 1, '127.0.0.1', '删除角色：test角色2', '2017-10-04 18:43:45'),
       (41, 1, '127.0.0.1', '修改角色：test角色（原名：test角色）', '2017-10-04 18:44:54'),
       (42, 1, '127.0.0.1', '修改角色：超级管理员（原名：超级管理员）', '2017-10-04 18:58:59'),
       (43, 1, '127.0.0.1', '添加新权限：qqq', '2017-10-04 18:59:24'),
       (44, 1, '127.0.0.1', '修改角色：超级管理员（原名：超级管理员）', '2017-10-04 19:00:12'),
       (45, 1, '127.0.0.1', '删除权限：qqq', '2017-10-04 19:03:10'),
       (46, 1, '127.0.0.1', '修改角色：超级管理员（原名：超级管理员）', '2017-10-04 19:03:43'),
       (47, 1, '127.0.0.1', '修改角色：test角色（原名：test角色）', '2017-10-04 19:06:32'),
       (48, 1, '127.0.0.1', '添加新管理员：imoocmovie2', '2017-10-04 22:26:58'),
       (49, 2, '127.0.0.1', '删除标签：历史', '2017-10-04 22:54:17'),
       (50, 2, '127.0.0.1', '删除标签：恐怖', '2017-10-04 22:54:21'),
       (51, 1, '127.0.0.1', '添加新电影预告：标题有了', '2017-10-06 12:36:32'),
       (52, 1, '127.0.0.1', '添加新电影预告：标题有了1', '2017-10-06 12:36:42'),
       (53, 1, '127.0.0.1', '添加新电影预告：标题有了2', '2017-10-06 12:36:50'),
       (54, 1, '127.0.0.1', '添加新电影预告：标题有了3', '2017-10-06 12:36:58'),
       (55, 1, '127.0.0.1', '添加新电影预告：标题有了4', '2017-10-06 12:37:04'),
       (56, 1, '127.0.0.1', '删除电影预告：环太平洋', '2017-10-06 16:16:29'),
       (57, 1, '127.0.0.1', '删除电影预告：赛车预告', '2017-10-06 16:16:31'),
       (58, 1, '127.0.0.1', '修改电影预告：标题有了5（原名：标题有了）', '2017-10-06 16:16:47'),
       (59, 1, '127.0.0.1', '添加新电影：空战', '2017-10-06 16:56:56'),
       (60, 1, '127.0.0.1', '修改电影：空战1（原名：空战1）', '2017-10-07 19:38:04'),
       (61, 1, '127.0.0.1', '添加新标签：搞笑', '2017-10-08 17:22:21'),
       (62, 1, '127.0.0.1', '添加新标签：新鲜', '2017-10-08 17:22:58'),
       (63, 1, '127.0.0.1', '修改了密码', '2017-10-08 17:35:01'),
       (64, 1, '127.0.0.1', '修改了密码', '2017-10-08 17:36:41');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `movie`.`preview` WRITE;
DELETE
FROM `movie`.`preview`;
INSERT INTO `movie`.`preview` (`id`, `title`, `logo`, `addtime`)
VALUES (4, '标题有了1', '20171006123631_b62f6ac8049548cab95c1d38c57485a5.jpg', '2017-10-06 12:36:32'),
       (5, '标题有了2', '20171006123641_298982e7b38b48b499ee47f4c3d49893.jpg', '2017-10-06 12:36:42'),
       (6, '标题有了3', '20171006123650_30afed6919da45c295301535443be878.jpg', '2017-10-06 12:36:50'),
       (7, '标题有了4', '20171006123657_e2d1356a9d624b3a92269b4fec94816f.jpg', '2017-10-06 12:36:58'),
       (8, '标题有了5', '20171006123704_ed2008aef66640619bc2e90f047290e8.jpg', '2017-10-06 12:37:04');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `movie`.`role` WRITE;
DELETE
FROM `movie`.`role`;
INSERT INTO `movie`.`role` (`id`, `name`, `auths`, `addtime`)
VALUES (1, '超级管理员', '3', '2017-09-27 08:13:05'),
       (2, 'test角色', '2,4,6', '2017-10-04 16:39:48');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `movie`.`tag` WRITE;
DELETE
FROM `movie`.`tag`;
INSERT INTO `movie`.`tag` (`id`, `name`, `addtime`)
VALUES (45, '喜剧', '2017-09-30 01:27:34'),
       (46, '爱情', '2017-09-30 01:27:37'),
       (48, '侦探', '2017-09-30 01:27:46'),
       (50, '悬疑', '2017-09-30 01:27:52'),
       (53, '科幻', '2017-09-30 02:09:52'),
       (54, '离奇', '2017-10-01 16:41:04'),
       (55, '测试', '2017-10-02 23:17:07'),
       (56, '武打', '2017-10-02 23:17:14'),
       (57, '经典', '2017-10-02 23:17:22'),
       (58, '冷门', '2017-10-02 23:17:36'),
       (60, '文艺', '2017-10-02 23:17:59'),
       (61, '热门', '2017-10-02 23:18:21'),
       (62, '网络', '2017-10-02 23:18:38'),
       (63, '游戏', '2017-10-02 23:18:42'),
       (64, '言情', '2017-10-02 23:18:45'),
       (66, '治愈', '2017-10-03 19:58:58'),
       (67, '自然', '2017-10-04 16:01:39'),
       (68, '小清新', '2017-10-04 16:04:50'),
       (69, '搞笑', '2017-10-08 17:22:21'),
       (70, '新鲜', '2017-10-08 17:22:58');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `movie`.`user` WRITE;
DELETE
FROM `movie`.`user`;
INSERT INTO `movie`.`user` (`id`, `name`, `pwd`, `email`, `phone`, `info`, `face`, `addtime`, `uuid`)
VALUES (1, '鼠', '1231', '1231@123.com', '13888888881', '鼠', '1f401.png', '2017-10-02 21:52:08',
        'd32a72bdac524478b7e4f6dfc8394fc0'),
       (2, '牛', '1232', '1232@123.com', '13888888882', '牛', '1f402.png', '2017-10-02 21:52:11',
        'd32a72bdac524478b7e4f6dfc8394fc1'),
       (3, '虎', '1233', '1233@123.com', '13888888883', '虎', '1f405.png', '2017-10-02 21:52:15',
        'd32a72bdac524478b7e4f6dfc8394fc2'),
       (4, '兔', '1234', '1234@123.com', '13888888884', '兔', '1f407.png', '2017-10-02 21:52:19',
        'd32a72bdac524478b7e4f6dfc8394fc3'),
       (5, '龙', '1235', '1235@123.com', '13888888885', '龙', '1f409.png', '2017-10-02 21:52:23',
        'd32a72bdac524478b7e4f6dfc8394fc4'),
       (6, '蛇', '1236', '1236@123.com', '13888888886', '蛇', '1f40d.png', '2017-10-02 21:52:27',
        'd32a72bdac524478b7e4f6dfc8394fc5'),
       (7, '马', '1237', '1237@123.com', '13888888887', '马', '1f434.png', '2017-10-02 21:52:30',
        'd32a72bdac524478b7e4f6dfc8394fc6'),
       (8, '羊', '1238', '1238@123.com', '13888888888', '羊', '1f411.png', '2017-10-02 21:52:33',
        'd32a72bdac524478b7e4f6dfc8394fc7'),
       (9, '猴', '1239', '1239@123.com', '13888888889', '猴', '1f412.png', '2017-10-02 21:52:37',
        'd32a72bdac524478b7e4f6dfc8394fc8'),
       (10, '鸡', '1240', '1240@123.com', '13888888891', '鸡', '1f413.png', '2017-10-02 21:52:41',
        'd32a72bdac524478b7e4f6dfc8394fc9'),
       (11, '狗', '1241', '1241@123.com', '13888888892', '狗', '1f415.png', '2017-10-02 21:52:44',
        'd32a72bdac524478b7e4f6dfc8394fd0'),
       (12, '猪', '1242', '1242@123.com', '13888888893', '猪', '1f416.png', '2017-10-02 21:52:48',
        'd32a72bdac524478b7e4f6dfc8394fd1');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `movie`.`userlog` WRITE;
DELETE
FROM `movie`.`userlog`;
INSERT INTO `movie`.`userlog` (`id`, `user_id`, `ip`, `addtime`)
VALUES (1, 1, '192.168.4.1', '2017-10-03 20:26:06'),
       (2, 2, '192.168.4.2', '2017-10-03 20:26:06'),
       (3, 3, '192.168.4.3', '2017-10-03 20:26:06'),
       (4, 4, '192.168.4.4', '2017-10-03 20:26:06'),
       (5, 5, '192.168.4.5', '2017-10-03 20:26:06'),
       (6, 6, '192.168.4.6', '2017-10-03 20:26:06'),
       (7, 7, '192.168.4.7', '2017-10-03 20:26:06'),
       (8, 8, '192.168.4.8', '2017-10-03 20:26:06'),
       (9, 9, '192.168.4.9', '2017-10-03 20:26:06'),
       (10, 1, '192.168.4.1', '2017-10-03 20:26:10'),
       (11, 2, '192.168.4.2', '2017-10-03 20:26:10'),
       (12, 3, '192.168.4.3', '2017-10-03 20:26:10'),
       (13, 4, '192.168.4.4', '2017-10-03 20:26:10'),
       (14, 5, '192.168.4.5', '2017-10-03 20:26:10'),
       (15, 6, '192.168.4.6', '2017-10-03 20:26:10'),
       (16, 7, '192.168.4.7', '2017-10-03 20:26:10'),
       (17, 8, '192.168.4.8', '2017-10-03 20:26:10'),
       (18, 9, '192.168.4.9', '2017-10-03 20:26:10'),
       (19, 1, '192.168.4.1', '2017-10-03 20:26:11'),
       (20, 2, '192.168.4.2', '2017-10-03 20:26:11'),
       (21, 3, '192.168.4.3', '2017-10-03 20:26:11'),
       (22, 4, '192.168.4.4', '2017-10-03 20:26:11'),
       (23, 5, '192.168.4.5', '2017-10-03 20:26:11'),
       (24, 6, '192.168.4.6', '2017-10-03 20:26:11'),
       (25, 7, '192.168.4.7', '2017-10-03 20:26:11'),
       (26, 8, '192.168.4.8', '2017-10-03 20:26:11'),
       (27, 9, '192.168.4.9', '2017-10-03 20:26:11'),
       (28, 1, '192.168.4.1', '2017-10-03 20:26:12'),
       (29, 2, '192.168.4.2', '2017-10-03 20:26:12'),
       (30, 3, '192.168.4.3', '2017-10-03 20:26:12'),
       (31, 4, '192.168.4.4', '2017-10-03 20:26:12'),
       (32, 5, '192.168.4.5', '2017-10-03 20:26:12'),
       (33, 6, '192.168.4.6', '2017-10-03 20:26:12'),
       (34, 7, '192.168.4.7', '2017-10-03 20:26:12'),
       (35, 8, '192.168.4.8', '2017-10-03 20:26:12'),
       (36, 9, '192.168.4.9', '2017-10-03 20:26:12'),
       (37, 13, '127.0.0.1', '2017-10-05 20:51:50'),
       (38, 10, '127.0.0.1', '2017-10-05 21:30:23'),
       (39, 10, '127.0.0.1', '2017-10-05 23:18:58'),
       (40, 10, '127.0.0.1', '2017-10-06 11:07:57'),
       (41, 10, '127.0.0.1', '2017-10-06 11:10:29'),
       (42, 10, '127.0.0.1', '2017-10-06 11:41:33'),
       (43, 10, '127.0.0.1', '2017-10-06 11:41:35'),
       (44, 10, '127.0.0.1', '2017-10-06 11:41:36'),
       (45, 10, '127.0.0.1', '2017-10-06 11:41:38'),
       (46, 10, '127.0.0.1', '2017-10-06 11:41:40'),
       (47, 10, '127.0.0.1', '2017-10-06 11:41:41'),
       (48, 10, '127.0.0.1', '2017-10-06 11:41:43'),
       (49, 10, '127.0.0.1', '2017-10-06 11:41:58'),
       (50, 10, '127.0.0.1', '2017-10-06 11:42:01'),
       (51, 10, '127.0.0.1', '2017-10-06 21:52:44'),
       (52, 16, '127.0.0.1', '2017-10-07 11:17:16'),
       (53, 10, '127.0.0.1', '2017-10-07 11:33:39'),
       (54, 10, '127.0.0.1', '2017-10-07 13:27:17'),
       (55, 10, '127.0.0.1', '2017-10-07 13:27:34'),
       (56, 10, '127.0.0.1', '2017-10-07 14:43:04'),
       (57, 13, '127.0.0.1', '2017-10-07 14:43:50'),
       (58, 14, '127.0.0.1', '2017-10-07 14:44:23'),
       (59, 10, '127.0.0.1', '2017-10-07 14:47:21'),
       (60, 10, '127.0.0.1', '2017-10-07 17:13:33'),
       (61, 10, '127.0.0.1', '2017-10-07 17:22:17'),
       (62, 10, '127.0.0.1', '2017-10-07 17:23:15'),
       (63, 10, '127.0.0.1', '2017-10-07 17:23:21'),
       (64, 10, '127.0.0.1', '2017-10-07 18:44:11'),
       (65, 10, '127.0.0.1', '2017-10-07 19:33:20');
UNLOCK TABLES;
COMMIT;

# SELECT *
# from user;
# INSERT INTO `movie`.`user` (`id`, `name`, `pwd`, `email`, `phone`, `info`, `face`, `addtime`, `uuid`)
# VALUES (1, '鼠', '1231', '1231@123.com', '13888888881', '鼠', '1f401.png', '2017-10-02 21:52:08',
#         'd32a72bdac524478b7e4f6dfc8394fc0'),
#        (3, '虎', '1233', '1233@123.com', '13888888883', '虎', '1f405.png', '2017-10-02 21:52:15',
#         'd32a72bdac524478b7e4f6dfc8394fc2');

select *
from oplog;


