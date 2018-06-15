/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 100130
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 100130
 File Encoding         : 65001

 Date: 15/06/2018 15:30:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for about
-- ----------------------------
DROP TABLE IF EXISTS `about`;
CREATE TABLE `about`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `birthday` datetime(0) NOT NULL,
  `sex` bit(1) NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `job` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of about
-- ----------------------------
INSERT INTO `about` VALUES (1, 'Dương Đắc Khanh', '1997-05-28 13:45:00', b'1', '0975460697', 'khanhjk@gmail.com', '/static/theme/img/avatar.jpg', 'Software Developer', 'Senior');

-- ----------------------------
-- Table structure for educations
-- ----------------------------
DROP TABLE IF EXISTS `educations`;
CREATE TABLE `educations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `certificate` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `degree` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `specialize` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `school` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `time` date NOT NULL,
  `hide` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of educations
-- ----------------------------
INSERT INTO `educations` VALUES (1, 'Mr. Duong Dac Khanh', '0000-00-00', 'THE DEGREE OF ENGINEER INFORMATION TECHNOLOGY', 'Good', 'Infomation Technology', 'Hanoi Open University', '2019-06-01', '0');

-- ----------------------------
-- Table structure for goals
-- ----------------------------
DROP TABLE IF EXISTS `goals`;
CREATE TABLE `goals`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `number` int(11) NOT NULL,
  `hide` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hobbies
-- ----------------------------
DROP TABLE IF EXISTS `hobbies`;
CREATE TABLE `hobbies`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `number` int(11) NOT NULL,
  `hide` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hobbies
-- ----------------------------
INSERT INTO `hobbies` VALUES (1, 'Làm việc độc lập và tìm hiểu công nghệ mới.', 1, b'0');
INSERT INTO `hobbies` VALUES (2, 'Chơi thể thao, đặc biệt là cầu lông', 2, b'0');
INSERT INTO `hobbies` VALUES (3, 'Xem phim hoạt hình', 3, b'0');
INSERT INTO `hobbies` VALUES (4, 'Đọc sách về cuộc sống, công nghệ và truyện ngược', 4, b'0');

-- ----------------------------
-- Table structure for language
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of language
-- ----------------------------
INSERT INTO `language` VALUES (1, 'English');

-- ----------------------------
-- Table structure for language_level
-- ----------------------------
DROP TABLE IF EXISTS `language_level`;
CREATE TABLE `language_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `language_skill_id` int(11) NOT NULL,
  `percent` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_language_language_level`(`language_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of language_level
-- ----------------------------
INSERT INTO `language_level` VALUES (1, 1, 1, 75);
INSERT INTO `language_level` VALUES (2, 1, 2, 75);
INSERT INTO `language_level` VALUES (3, 1, 3, 75);
INSERT INTO `language_level` VALUES (4, 1, 4, 75);
INSERT INTO `language_level` VALUES (5, 0, 0, 0);

-- ----------------------------
-- Table structure for language_skill
-- ----------------------------
DROP TABLE IF EXISTS `language_skill`;
CREATE TABLE `language_skill`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hide` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of language_skill
-- ----------------------------
INSERT INTO `language_skill` VALUES (1, 'Listening', '0');
INSERT INTO `language_skill` VALUES (2, 'Speaking', '0');
INSERT INTO `language_skill` VALUES (3, 'Reading', '0');
INSERT INTO `language_skill` VALUES (4, 'Writing', '0');

-- ----------------------------
-- Table structure for languages
-- ----------------------------
DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hide` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of languages
-- ----------------------------
INSERT INTO `languages` VALUES (1, 'English', 'Tiếng Anh', b'0');
INSERT INTO `languages` VALUES (2, 'Chinese', 'Tiếng Trung Quốc', b'1');
INSERT INTO `languages` VALUES (3, 'Korean', 'Tiếng Hàn Quốc', b'1');
INSERT INTO `languages` VALUES (4, 'Japanese', 'Tiếng Nhật Bản', b'1');
INSERT INTO `languages` VALUES (5, '', '', b'0');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `hide` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES (1, 'Post 1 23 2', 'thông báo 1', '<!DOCTYPE html>\n<html>\n<head>\n</head>\n<body>\n<p>hashdhasd 1</p>\n</body>\n</html>', 'khanhjm', '2018-03-26 00:00:00', '2018-04-10 08:47:44', b'0');
INSERT INTO `posts` VALUES (3, ' Thông báo Lịch kiểm tra điều kiện chuyên môn đối với Sinh viên làm CHUYÊN ĐỀ TỐT NGHIỆP bị chậm tiến độ (Thông báo số 2)', 'thông báo 1', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<div class=\"articleContent\">\r\n<p>Th&ocirc;ng b&aacute;o triển khai ki&ecirc;̉m tra chuy&ecirc;n m&ocirc;n đối với SV l&agrave;m chuy&ecirc;n đ&ecirc;̀ t&ocirc;́t nghi&ecirc;̣p bị ch&acirc;̣m ti&ecirc;́n đ&ocirc;̣ học kỳ 2 năm học 2017-2018</p>\r\n<ol>\r\n<li><strong>Chuy&ecirc;n đề: Lập tr&igrave;nh ứng dụng:</strong></li>\r\n<li>Thời gian: 13h00 ng&agrave;y 28/3/2018</li>\r\n<li>Địa điểm: Ph&ograve;ng 23</li>\r\n<li><strong>Chuy&ecirc;n đề: C&ocirc;ng nghệ phần mềm:</strong></li>\r\n<li>Thời gian: 15h00 ng&agrave;y 28/3/2018</li>\r\n<li>Địa điểm: Ph&ograve;ng 24</li>\r\n</ol>\r\n<p><em>Ch&uacute; &yacute;: Sinh vi&ecirc;n đem theo m&aacute;y t&iacute;nh đ&atilde; c&agrave;i sẵn c&aacute;c chương tr&igrave;nh cần thiết</em></p>\r\n<p><em>Trả kết quả: 10h00 ng&agrave;y 29/3/2018 tại P31</em></p>\r\n</div>\r\n</body>\r\n</html>', 'khanhjm', '2018-03-27 13:36:20', '2018-03-27 13:36:20', b'0');
INSERT INTO `posts` VALUES (4, '213', 'thông báo 1', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>123</p>\r\n</body>\r\n</html>', '123', '2018-04-10 15:11:08', '2018-04-10 15:11:08', b'0');
INSERT INTO `posts` VALUES (5, '1323', 'thông báo 1', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>1231</p>\r\n</body>\r\n</html>', '123', '2018-04-10 15:11:14', '2018-04-10 15:11:14', b'0');
INSERT INTO `posts` VALUES (6, '123', 'thông báo 1', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>123</p>\r\n</body>\r\n</html>', '123', '2018-04-10 15:11:20', '2018-04-10 15:11:20', b'0');
INSERT INTO `posts` VALUES (7, '123', 'thông báo 1', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>123</p>\r\n</body>\r\n</html>', '123', '2018-04-10 15:11:25', '2018-04-10 15:11:25', b'0');
INSERT INTO `posts` VALUES (8, '123', 'thông báo 1', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>123</p>\r\n</body>\r\n</html>', '123', '2018-04-10 15:11:34', '2018-04-10 15:11:34', b'0');
INSERT INTO `posts` VALUES (9, '123', 'thông báo 1', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>123</p>\r\n</body>\r\n</html>', '123', '2018-04-10 15:11:40', '2018-04-10 15:11:40', b'0');
INSERT INTO `posts` VALUES (10, '123', 'thông báo 1', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>123</p>\r\n</body>\r\n</html>', '123', '2018-04-10 15:11:44', '2018-04-10 15:11:44', b'0');
INSERT INTO `posts` VALUES (11, '123', 'thông báo 1', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>123</p>\r\n</body>\r\n</html>', '123', '2018-04-10 15:11:50', '2018-04-10 15:11:50', b'0');
INSERT INTO `posts` VALUES (12, '123', 'thông báo 1', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>123</p>\r\n</body>\r\n</html>', '123', '2018-04-10 15:12:06', '2018-04-10 15:12:06', b'0');
INSERT INTO `posts` VALUES (13, '123', 'thông báo 1', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>123</p>\r\n</body>\r\n</html>', '123', '2018-04-10 15:12:09', '2018-04-10 15:12:09', b'0');

-- ----------------------------
-- Table structure for skill
-- ----------------------------
DROP TABLE IF EXISTS `skill`;
CREATE TABLE `skill`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `percent` int(11) NOT NULL,
  `hide` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for targets
-- ----------------------------
DROP TABLE IF EXISTS `targets`;
CREATE TABLE `targets`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `number` int(11) NOT NULL,
  `hide` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `isactived` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'khanhjk@gmail.com', '$2a$20$xDvAEZ6wYj85kAGzhAjuj.o/xIb0caVT2O81OfZWxyy58znARsko2', 'Dương Đắc', 'Khanh', '2018-03-23 01:54:06', '2018-03-23 01:54:06', b'1');

SET FOREIGN_KEY_CHECKS = 1;
