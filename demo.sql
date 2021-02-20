/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : demo

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 20/02/2021 22:25:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hero
-- ----------------------------
DROP TABLE IF EXISTS `hero`;
CREATE TABLE `hero`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英雄名称',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英雄头像',
  `type` tinyint(1) NOT NULL COMMENT '英雄职业\r\n1. 坦克    2. 战士    3. 刺客\r\n4. 法师    5. 射手    6. 辅助',
  `skill1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英雄技能1',
  `skill1_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英雄技能1描述',
  `skill2` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英雄技能2',
  `skill2_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英雄技能2描述',
  `skill3` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英雄技能3',
  `skill3_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英雄技能3描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hero
-- ----------------------------
INSERT INTO `hero` VALUES (1, '月光之女 —— 露娜', 'https://game.gtimg.cn/images/yxzj/img201606/heroimg/146/146-smallskin-1.jpg', 2, '弦月斩', '露娜向指定方向挥出一道月光冲击波，对命中的敌人造成350/430/510/590/670/750（+51%法术加成）点法术伤害并标记敌人', '炙热剑芒', '露娜将剑插入大地，以炙热剑芒牵引附近的敌人靠近自己造成120/135/150/165/180/195（+31%法术加成）点法术伤害并眩晕0.5秒，同时获得可抵免400/470/540/610/680/750（+80%法术加成）点伤害的护盾并减少其50%移动速度，持续2秒；同时会标记被牵引的敌人', '新月突击', '露娜向指定方向发起突击，对路径上敌人造成500/625/750（+60%法术加成）点法术伤害；如果露娜命中了被标记的敌人，将会刷新新月突击的冷却时间');

SET FOREIGN_KEY_CHECKS = 1;
