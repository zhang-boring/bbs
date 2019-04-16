-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- Server version:               10.3.8-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL 版本:                  10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table bbs.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `aname` varchar(16) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员信息表';

-- Dumping data for table bbs.admin: ~0 rows (approximately)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- Dumping structure for table bbs.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `commentid` bigint(20) NOT NULL AUTO_INCREMENT,
  `postid` bigint(20) NOT NULL COMMENT '帖子id',
  `firstuid` bigint(20) NOT NULL COMMENT '评论者uid',
  `seconduid` bigint(20) DEFAULT NULL COMMENT '被回复者uid',
  `comment` text NOT NULL COMMENT '评论内容',
  `committime` datetime DEFAULT current_timestamp() COMMENT '评论时间',
  PRIMARY KEY (`commentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- Dumping data for table bbs.comment: ~0 rows (approximately)
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- Dumping structure for table bbs.commentlick
CREATE TABLE IF NOT EXISTS `commentlick` (
  `uid` bigint(20) NOT NULL,
  `postid` bigint(20) NOT NULL,
  `commentid` bigint(20) NOT NULL,
  PRIMARY KEY (`uid`,`postid`,`commentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论点赞表';

-- Dumping data for table bbs.commentlick: ~0 rows (approximately)
/*!40000 ALTER TABLE `commentlick` DISABLE KEYS */;
/*!40000 ALTER TABLE `commentlick` ENABLE KEYS */;

-- Dumping structure for table bbs.forum
CREATE TABLE IF NOT EXISTS `forum` (
  `forumid` bigint(20) NOT NULL AUTO_INCREMENT,
  `partid` bigint(20) NOT NULL,
  `forumname` varchar(16) NOT NULL COMMENT '版块名',
  `icon` varchar(64) DEFAULT NULL COMMENT '版块icon',
  `moderator` varchar(32) DEFAULT NULL COMMENT '版主uid',
  `description` varchar(64) DEFAULT NULL COMMENT '板块描述，默认为版块名',
  `createtime` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`forumid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='版块表';

-- Dumping data for table bbs.forum: ~36 rows (approximately)
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
INSERT INTO `forum` (`forumid`, `partid`, `forumname`, `icon`, `moderator`, `description`, `createtime`) VALUES
	(1, 1, '英雄联盟', '/img/icon/1/lol.gif', NULL, '拳头游戏开发的英雄对战MOBA竞技网游，大陆地区腾讯代理。', '2019-01-23 13:09:18'),
	(2, 1, '守望先锋', '/img/icon/1/swxf.gif', NULL, '暴雪娱乐公司开发的第一人称射击游戏，国区由网易代理。', '2019-01-23 13:10:44'),
	(3, 1, 'DOTA2', '/img/icon/1/dota.gif', NULL, 'Steam热门作品之一,Valve心血力作。', '2019-01-23 13:13:27'),
	(4, 1, '最终幻想14', '/img/icon/1/zzhx.gif', NULL, '3D 大型多人在线角色扮演游戏。', '2019-01-23 13:15:15'),
	(5, 1, '魔兽世界', '/img/icon/1/mssj.gif', NULL, '《魔兽争霸》的剧情为历史背景的大型多人在线角色扮演游戏。', '2019-01-23 13:16:30'),
	(6, 1, '天涯明月刀', '/img/icon/1/ttmyd.gif', NULL, '腾讯出品3D武侠题材大型多人在线MMORPG网络游戏。', '2019-01-23 13:17:14'),
	(7, 1, '网游其他', NULL, NULL, '其他网络游戏交流专区。', '2019-01-23 13:17:34'),
	(8, 2, '太吴绘卷', '/img/icon/2/twhj.gif', NULL, '以神话和武侠为题材的国产独立游戏。', '2019-01-23 13:21:17'),
	(9, 2, 'GTAⅤ', '/img/icon/2/GTAV.gif', NULL, '围绕犯罪为主题的开放式动作冒险游戏。', '2019-01-23 13:22:31'),
	(10, 2, '上古卷轴5：天际', '/img/icon/2/sgjz.gif', NULL, '角色扮演类单机游戏，是开放世界游戏的代表作。', '2019-01-23 13:23:22'),
	(11, 2, '质量效应：仙女座', '/img/icon/2/zlxy.gif', NULL, '玩家扮演被称为“探路者”的探险家，为了寻找人类的新家而进行远征。', '2019-01-23 13:25:02'),
	(12, 2, '刺客信条：奥德赛', '/img/icon/2/ckxt.gif', NULL, '《刺客信条》的第十一部主系列作品，《刺客信条：起源》的续作。', '2019-01-23 13:26:02'),
	(13, 2, '使命召唤4：现代战争', '/img/icon/2/smzh.gif', NULL, '使命召唤系列的第四部作品，“使命召唤：现代战争”系列的开山之作。', '2019-01-23 13:27:30'),
	(14, 2, '巫师3：狂猎', '/img/icon/2/wushi3.gif', NULL, '《巫师》系列游戏作品的第三部，也是杰洛特冒险的终曲。', '2019-01-23 13:28:10'),
	(15, 2, 'PC其他', NULL, NULL, '其他PC单机游戏交流区。', '2019-01-23 13:28:31'),
	(16, 3, '神秘海域4：盗贼末路', '/img/icon/3/smhy.gif', NULL, '顽皮狗开发的一款动作冒险类游戏，游戏设定在前作的三年之后。', '2019-01-23 13:29:28'),
	(17, 3, '古墓丽影：崛起', '/img/icon/3/gmly.gif', NULL, '女主角劳拉·克劳馥去探索超自然现象和未知的世界，寻找永生的秘密。', '2019-01-23 13:30:48'),
	(18, 3, '尼尔：机械纪元', '/img/icon/3/nier.gif', NULL, '故事发生在和前作相同的世界，重新设立一个全新的故事剧情。', '2019-01-23 13:31:12'),
	(19, 3, '超级马里奥：奥德赛', '/img/icon/3/marioodyssey.gif', NULL, '任天堂公司发行的开放世界动作冒险游戏，全球销量达1041万份。', '2019-01-23 13:32:47'),
	(20, 3, '塞尔达传说：荒野之息', '/img/icon/3/hyzx.gif', NULL, '任天堂公司出版发行的开放世界动作冒险游戏，多家媒体评分满分。', '2019-01-23 13:34:40'),
	(21, 3, '荒野大镖客：救赎2', '/img/icon/3/hydbk.gif', NULL, '以美国西部拓荒史为题材的动作冒险类开放世界游戏。', '2019-01-23 13:35:22'),
	(22, 3, '主机其他', NULL, NULL, '其他主机游戏交流区。', '2019-01-23 13:35:47'),
	(23, 4, '失落的龙约', '/img/icon/4/sldly.gif', NULL, 'Cygames设计和任天堂联合开发运营，两周获1600万美元营收。', '2019-01-23 13:39:21'),
	(24, 4, '阴阳师', '/img/icon/4/yys.gif', NULL, '网易移动游戏公司自主研发的3D日式和风回合制RPG手游。', '2019-01-23 13:54:04'),
	(25, 4, '王者荣耀', '/img/icon/4/wzry.gif', NULL, '腾讯游戏天美工作室群开发并运行的一款多平台上的MOBA类手机游戏。', '2019-01-23 13:55:00'),
	(26, 4, '部落冲突：皇室战争', '/img/icon/4/hszz.gif', NULL, '《部落冲突》的角色和世界观为原型，加入即时策略、MOBA以及卡牌等元素的手机游戏。', '2019-01-27 13:11:34'),
	(27, 4, '第五人格', '/img/icon/4/dwrg.gif', NULL, '网易开发的非对称性对抗竞技类手机游戏。', '2019-01-27 13:13:10'),
	(28, 4, 'Fate/Grand Order', '/img/icon/4/fgo.gif', NULL, 'TYPE-MOON发行的角色扮演类手机游戏，为Fate系列的续作。', '2019-01-27 13:14:12'),
	(29, 4, '崩坏3rd', '/img/icon/4/bh3.gif', NULL, '角色扮演类手机游戏，拥有圣痕系统、女武神等战斗培养元素，乱斗竞速、舰团战等PVP玩法。', '2019-01-27 13:15:18'),
	(30, 4, '手游其他', NULL, NULL, '其他手机游戏交流专区。', '2019-01-27 13:15:47'),
	(31, 5, '日常家居', NULL, NULL, '网友日常交流杂谈区。', '2019-01-29 17:21:50'),
	(32, 5, '时尚消费', NULL, NULL, '购物、消费交流区。', '2019-01-29 17:22:06'),
	(33, 5, '音乐发烧', NULL, NULL, '音乐、设备交流区。', '2019-01-29 17:22:18'),
	(34, 5, '运动旅游', NULL, NULL, '运动、旅游、风景交流区。', '2019-01-29 17:22:31'),
	(35, 5, '宠物养成', NULL, NULL, '宠物养成经验咨询等交流区。', '2019-01-29 17:22:46'),
	(36, 5, '其他杂谈', NULL, NULL, '其他话题杂谈交流专区。', '2019-01-29 17:23:01');
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;

-- Dumping structure for table bbs.message
CREATE TABLE IF NOT EXISTS `message` (
  `uid` bigint(20) NOT NULL COMMENT '用户uid',
  `postid` bigint(20) NOT NULL COMMENT '帖子id',
  `num` int(11) NOT NULL DEFAULT 1 COMMENT '新消息数量',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新消息通知表\r\n    用户接收其他用户回复时，会添加新条目。';

-- Dumping data for table bbs.message: ~0 rows (approximately)
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;

-- Dumping structure for table bbs.part
CREATE TABLE IF NOT EXISTS `part` (
  `partid` bigint(20) NOT NULL AUTO_INCREMENT,
  `partname` varchar(16) DEFAULT '0' COMMENT '区名称',
  `createtime` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`partid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='区表';

-- Dumping data for table bbs.part: ~5 rows (approximately)
/*!40000 ALTER TABLE `part` DISABLE KEYS */;
INSERT INTO `part` (`partid`, `partname`, `createtime`) VALUES
	(1, '网络游戏', '2018-11-03 13:05:35'),
	(2, 'PC单机', '2018-11-19 13:05:52'),
	(3, '主机游戏', '2018-11-26 13:06:05'),
	(4, '手机游戏', '2018-12-18 13:06:18'),
	(5, '玩家杂谈', '2019-01-05 13:06:36');
/*!40000 ALTER TABLE `part` ENABLE KEYS */;

-- Dumping structure for table bbs.post
CREATE TABLE IF NOT EXISTS `post` (
  `postid` bigint(20) NOT NULL AUTO_INCREMENT,
  `forumid` bigint(20) NOT NULL,
  `uid` bigint(20) NOT NULL COMMENT '发帖用户uid',
  `title` varchar(32) NOT NULL COMMENT '帖子标题',
  `content` text NOT NULL COMMENT '帖子内容',
  `committime` datetime DEFAULT current_timestamp() COMMENT '发帖时间',
  `lastchagetime` datetime DEFAULT current_timestamp() COMMENT '最后回复时间',
  `announce` smallint(1) NOT NULL DEFAULT 0 COMMENT '是否为公告贴，l为公告贴，0为普通贴',
  PRIMARY KEY (`postid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='帖子/文章表';

-- Dumping data for table bbs.post: ~11 rows (approximately)
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` (`postid`, `forumid`, `uid`, `title`, `content`, `committime`, `lastchagetime`, `announce`) VALUES
	(1, 1, 1, 'test', 'test', '2019-01-24 11:46:02', '2019-01-24 11:46:05', 0),
	(2, 0, 2, '公告', '公告测试内容', '2019-01-24 16:30:33', '2019-01-24 16:30:33', 1),
	(3, 0, 1, '第二个测试公告标题', '不同用户的公告内容测试2', '2019-02-19 20:37:31', '2019-02-19 20:37:31', 1),
	(4, 1, 5, '222222', '22222', '2019-02-21 17:34:24', '2019-02-21 17:34:24', 0),
	(5, 1, 2, '3333333', '3333333', '2019-02-21 17:35:04', '2019-02-21 17:35:04', 0),
	(6, 1, 1, '4444444', '234223234', '2019-02-21 17:35:18', '2019-02-21 17:35:18', 0),
	(7, 1, 5, '7777', '7777777777', '2019-02-21 17:35:35', '2019-02-21 17:35:35', 0),
	(8, 1, 2, '8888888', '8888888888', '2019-02-21 17:36:02', '2019-02-21 17:36:02', 0),
	(9, 1, 2, '99999', '999999999', '2019-02-21 17:36:12', '2019-02-21 17:36:12', 0),
	(10, 1, 2, '000000', '000000000', '2019-02-21 17:36:31', '2019-02-21 17:36:31', 0),
	(11, 1, 1, '111111', '1111111', '2019-02-21 17:36:58', '2019-02-21 17:36:58', 0),
	(12, 1, 5, 'next', 'nextpage', '2019-02-21 17:38:28', '2019-02-21 17:38:28', 0),
	(13, 1, 1, 'fenye', 'fenyeceshi ', '2019-02-21 17:39:13', '2019-02-21 17:39:13', 0);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;

-- Dumping structure for table bbs.postlike
CREATE TABLE IF NOT EXISTS `postlike` (
  `uid` bigint(20) NOT NULL,
  `postid` bigint(20) NOT NULL,
  PRIMARY KEY (`uid`,`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帖子点赞列表';

-- Dumping data for table bbs.postlike: ~0 rows (approximately)
/*!40000 ALTER TABLE `postlike` DISABLE KEYS */;
/*!40000 ALTER TABLE `postlike` ENABLE KEYS */;

-- Dumping structure for table bbs.user
CREATE TABLE IF NOT EXISTS `user` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `uname` varchar(16) NOT NULL COMMENT '用户登录名',
  `password` varchar(16) NOT NULL COMMENT '密码',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(16) DEFAULT NULL COMMENT '手机号',
  `icon` varchar(64) NOT NULL COMMENT '头像链接地址',
  `signature` varchar(64) DEFAULT NULL COMMENT '签名',
  `sign_up_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '注册时间',
  `check_in_date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '最后签到',
  `level` int(11) DEFAULT 0 COMMENT '0表示普通会员，当值相应版块id是代表相应版块版主',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- Dumping data for table bbs.user: ~3 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`uid`, `uname`, `password`, `email`, `phone`, `icon`, `signature`, `sign_up_time`, `check_in_date`, `level`) VALUES
	(1, '12355', '12345', '123@123.com', NULL, '/img/head/3.gif', '678', '2019-02-07 12:08:27', '2019-03-24 17:09:42', 0),
	(2, 'abcdd', 'abcde', 'abc@abc.com', NULL, '/img/head/2.gif', '', '2019-02-07 12:08:51', '2019-03-03 09:44:04', 0),
	(5, 'erg', '123456', '123@te.com', '', '/img/head/3.gif', '', '2019-02-07 16:25:36', '2019-03-03 09:44:06', 0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
