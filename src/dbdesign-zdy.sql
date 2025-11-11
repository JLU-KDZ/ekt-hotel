/*
 Navicat Premium Dump db

 Source Server         : web
 Source Server Type    : MySQL
 Source Server Version : 80400 (8.4.0)
 Source Host           : localhost:3306
 Source Schema         : dbdesign

 Target Server Type    : MySQL
 Target Server Version : 80400 (8.4.0)
 File Encoding         : 65001

 Date: 13/04/2025 22:23:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for booking_client
-- ----------------------------
DROP TABLE IF EXISTS `booking_client`;
CREATE TABLE `booking_client`  (
  `cid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `rid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_time` date NULL DEFAULT NULL,
  `end_time` date NULL DEFAULT NULL,
  `booking_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`, `rid` DESC) USING BTREE,
  INDEX `rid`(`rid` ASC) USING BTREE,
  CONSTRAINT `booking_client_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `client` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `booking_client_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for booking_team
-- ----------------------------
DROP TABLE IF EXISTS `booking_team`;
CREATE TABLE `booking_team`  (
  `tid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `rid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_time` date NULL DEFAULT NULL,
  `end_time` date NULL DEFAULT NULL,
  `booking_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tid`, `rid`) USING BTREE,
  INDEX `rid`(`rid` ASC) USING BTREE,
  CONSTRAINT `booking_team_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `team` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `booking_team_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for checkin_client
-- ----------------------------
DROP TABLE IF EXISTS `checkin_client`;
CREATE TABLE `checkin_client`  (
  `rid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_time` date NULL DEFAULT NULL,
  `end_time` date NULL DEFAULT NULL,
  `total_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `check_in_sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`rid`, `cid`) USING BTREE,
  INDEX `cid`(`cid` ASC) USING BTREE,
  INDEX `check_in_sid`(`check_in_sid` ASC) USING BTREE,
  CONSTRAINT `checkin_client_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `checkin_client_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `client` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `checkin_client_ibfk_3` FOREIGN KEY (`check_in_sid`) REFERENCES `staff` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for checkin_team
-- ----------------------------
DROP TABLE IF EXISTS `checkin_team`;
CREATE TABLE `checkin_team`  (
  `rid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_time` date NULL DEFAULT NULL,
  `end_time` date NULL DEFAULT NULL,
  `total_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `check_in_sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`rid`, `tid`) USING BTREE,
  INDEX `teamsid`(`check_in_sid` ASC) USING BTREE,
  INDEX `teamtid`(`tid` ASC) USING BTREE,
  CONSTRAINT `teamrid` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `teamsid` FOREIGN KEY (`check_in_sid`) REFERENCES `staff` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `teamtid` FOREIGN KEY (`tid`) REFERENCES `team` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client`  (
  `cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `csex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `register_sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `accomodation_times` int NULL DEFAULT NULL,
  `register_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `sid`(`register_sid` ASC) USING BTREE,
  INDEX `cid`(`cid` ASC, `register_sid` ASC) USING BTREE,
  CONSTRAINT `sid` FOREIGN KEY (`register_sid`) REFERENCES `staff` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hotelorder
-- ----------------------------
DROP TABLE IF EXISTS `hotelorder`;
CREATE TABLE `hotelorder`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ordertype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_time` date NOT NULL,
  `end_time` date NOT NULL,
  `rid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pay_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `order_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `register_sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `start_time`, `end_time`, `rid`, `ordertype`) USING BTREE,
  INDEX `rid`(`rid` ASC) USING BTREE,
  INDEX `register_sid`(`register_sid` ASC) USING BTREE,
  CONSTRAINT `hotelorder_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hotelorder_ibfk_2` FOREIGN KEY (`register_sid`) REFERENCES `staff` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hotelorder_v1
-- ----------------------------
DROP TABLE IF EXISTS `hotelorder_v1`;
CREATE TABLE `hotelorder_v1`  (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ordertype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_time` date NOT NULL,
  `end_time` date NOT NULL,
  `rid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pay_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pay_status` enum('pending','paid','failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pending',
  `money` decimal(10, 2) NOT NULL,
  `order_status` enum('pending','paid','cancelled','completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pending',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `order_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `register_sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `idx_hotelorder_id`(`id` ASC) USING BTREE,
  INDEX `idx_hotelorder_start_time`(`start_time` ASC) USING BTREE,
  INDEX `hotelorder_v1_ibfk_1`(`rid` ASC) USING BTREE,
  INDEX `hotelorder_v1_ibfk_2`(`register_sid` ASC) USING BTREE,
  CONSTRAINT `hotelorder_v1_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hotelorder_v1_ibfk_2` FOREIGN KEY (`register_sid`) REFERENCES `staff` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice`  (
  `invoice_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `invoice_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `invoice_type` enum('Electronic','Paper') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Electronic',
  `invoice_amount` decimal(10, 2) NOT NULL,
  `tax_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `invoice_status` enum('pending','issued','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pending',
  `issue_time` timestamp NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`invoice_id`) USING BTREE,
  INDEX `idx_invoice_order`(`order_id` ASC) USING BTREE,
  INDEX `idx_invoice_status`(`invoice_status` ASC) USING BTREE,
  CONSTRAINT `fk_invoice_order` FOREIGN KEY (`order_id`) REFERENCES `hotelorder_v1` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_history
-- ----------------------------
DROP TABLE IF EXISTS `order_history`;
CREATE TABLE `order_history`  (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `previous_status` enum('pending','paid','cancelled','completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `new_status` enum('pending','paid','cancelled','completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `change_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`history_id`) USING BTREE,
  INDEX `idx_order_history_order`(`order_id` ASC) USING BTREE,
  CONSTRAINT `fk_order_history_order` FOREIGN KEY (`order_id`) REFERENCES `hotelorder_v1` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `pay_amount` decimal(10, 2) NOT NULL,
  `pay_method` enum('WeChat','Alipay','Credit Card','Cash','Bank Transfer') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `payment_status` enum('pending','paid','failed','refunded') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pending',
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pay_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`payment_id`) USING BTREE,
  INDEX `idx_payment_order`(`order_id` ASC) USING BTREE,
  INDEX `idx_payment_status`(`payment_status` ASC) USING BTREE,
  CONSTRAINT `fk_payment_order` FOREIGN KEY (`order_id`) REFERENCES `hotelorder_v1` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `rid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `rtype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `rstorey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `rprice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `rdesc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `rpic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`rid`) USING BTREE,
  INDEX `rid`(`rid` ASC, `rprice` ASC) USING BTREE,
  INDEX `rid_2`(`rid` ASC, `rprice` ASC, `rtype` ASC) USING BTREE,
  INDEX `rid_3`(`rid` ASC, `rtype` ASC, `rprice` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ssex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stime` date NULL DEFAULT NULL,
  `susername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `spassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `srole` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sidcard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image` blob NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  UNIQUE INDEX `susername`(`susername` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team`  (
  `tname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `check_in_sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `accomodation_times` int NULL DEFAULT NULL,
  `register_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tid`) USING BTREE,
  INDEX `team_sid`(`check_in_sid` ASC) USING BTREE,
  CONSTRAINT `team_sid` FOREIGN KEY (`check_in_sid`) REFERENCES `staff` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for administrators
-- ----------------------------
DROP VIEW IF EXISTS `administrators`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `administrators` AS select `staff`.`sid` AS `Sid`,`staff`.`sname` AS `Sname`,`staff`.`susername` AS `Susername` from `staff` where (`staff`.`srole` > 1);

-- ----------------------------
-- View structure for customers
-- ----------------------------
DROP VIEW IF EXISTS `customers`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `customers` AS select `client`.`cid` AS `Cid`,`client`.`cname` AS `Cname`,`client`.`csex` AS `Csex`,`client`.`cphone` AS `Cphone` from `client`;

-- ----------------------------
-- View structure for living
-- ----------------------------
DROP VIEW IF EXISTS `living`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `living` AS select `checkin_client`.`cid` AS `Cid`,`checkin_client`.`rid` AS `Rid`,`checkin_client`.`start_time` AS `start_time`,`checkin_client`.`end_time` AS `end_time`,`checkin_client`.`total_price` AS `total_price` from `checkin_client`;

-- ----------------------------
-- View structure for rooms
-- ----------------------------
DROP VIEW IF EXISTS `rooms`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `rooms` AS select `room`.`rid` AS `Rid`,`room`.`rtype` AS `Rtype`,`room`.`rprice` AS `Rprice`,`room`.`rstorey` AS `Rstorey` from `room`;

-- ----------------------------
-- View structure for v_client_team_order
-- ----------------------------
DROP VIEW IF EXISTS `v_client_team_order`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_client_team_order` AS select `ho`.`order_id` AS `order_id`,`c`.`cname` AS `client_name`,`t`.`tname` AS `team_name`,`ho`.`ordertype` AS `ordertype`,`ho`.`start_time` AS `start_time`,`ho`.`end_time` AS `end_time`,`ho`.`money` AS `total_amount`,`ho`.`order_status` AS `order_status`,`p`.`total_paid` AS `total_paid`,(case when (`p`.`total_paid` >= `ho`.`money`) then 'Fully Paid' when ((`p`.`total_paid` is null) or (`p`.`total_paid` = 0)) then 'Unpaid' else 'Partially Paid' end) AS `payment_status` from (((`hotelorder_v1` `ho` left join `client` `c` on(((`ho`.`ordertype` = '个人') and (`ho`.`id` = `c`.`cid`)))) left join `team` `t` on(((`ho`.`ordertype` = '团队') and (`ho`.`id` = `t`.`tid`)))) left join (select `payment`.`order_id` AS `order_id`,sum(`payment`.`pay_amount`) AS `total_paid` from `payment` where (`payment`.`payment_status` = 'paid') group by `payment`.`order_id`) `p` on((`ho`.`order_id` = `p`.`order_id`)));

-- ----------------------------
-- View structure for v_invoice_summary
-- ----------------------------
DROP VIEW IF EXISTS `v_invoice_summary`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_invoice_summary` AS select `i`.`invoice_id` AS `invoice_id`,`i`.`order_id` AS `order_id`,`ho`.`id` AS `client_or_team_id`,`ho`.`ordertype` AS `ordertype`,`i`.`invoice_title` AS `invoice_title`,`i`.`invoice_type` AS `invoice_type`,`i`.`invoice_amount` AS `invoice_amount`,`i`.`tax_number` AS `tax_number`,`i`.`invoice_status` AS `invoice_status`,`i`.`issue_time` AS `issue_time` from (`invoice` `i` join `hotelorder_v1` `ho` on((`i`.`order_id` = `ho`.`order_id`)));

-- ----------------------------
-- View structure for v_order_summary
-- ----------------------------
DROP VIEW IF EXISTS `v_order_summary`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_order_summary` AS select `ho`.`order_id` AS `order_id`,`ho`.`id` AS `client_or_team_id`,`ho`.`ordertype` AS `ordertype`,`ho`.`start_time` AS `start_time`,`ho`.`end_time` AS `end_time`,`ho`.`rid` AS `rid`,`ho`.`money` AS `total_amount`,`ho`.`order_status` AS `order_status`,`ho`.`pay_type` AS `pay_type`,`ho`.`pay_status` AS `pay_status`,`ho`.`register_sid` AS `register_sid`,`p`.`total_paid` AS `total_paid`,(case when (`p`.`total_paid` >= `ho`.`money`) then 'Fully Paid' when ((`p`.`total_paid` is null) or (`p`.`total_paid` = 0)) then 'Unpaid' else 'Partially Paid' end) AS `payment_status`,`i`.`invoice_status` AS `invoice_status`,`oh`.`last_status_change` AS `last_status_change`,`oh`.`last_changed_by` AS `last_changed_by` from (((`hotelorder_v1` `ho` left join (select `payment`.`order_id` AS `order_id`,sum(`payment`.`pay_amount`) AS `total_paid` from `payment` where (`payment`.`payment_status` = 'paid') group by `payment`.`order_id`) `p` on((`ho`.`order_id` = `p`.`order_id`))) left join (select `invoice`.`order_id` AS `order_id`,max(`invoice`.`issue_time`) AS `last_invoice_time`,max(`invoice`.`invoice_status`) AS `invoice_status` from `invoice` group by `invoice`.`order_id`) `i` on((`ho`.`order_id` = `i`.`order_id`))) left join (select `order_history`.`order_id` AS `order_id`,max(`order_history`.`change_time`) AS `last_status_change`,max(`order_history`.`new_status`) AS `last_status`,max(`order_history`.`changed_by`) AS `last_changed_by` from `order_history` group by `order_history`.`order_id`) `oh` on((`ho`.`order_id` = `oh`.`order_id`)));

-- ----------------------------
-- View structure for v_payment_details
-- ----------------------------
DROP VIEW IF EXISTS `v_payment_details`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_payment_details` AS select `p`.`payment_id` AS `payment_id`,`p`.`order_id` AS `order_id`,`ho`.`id` AS `client_or_team_id`,`ho`.`ordertype` AS `ordertype`,`p`.`pay_amount` AS `pay_amount`,`p`.`pay_method` AS `pay_method`,`p`.`payment_status` AS `payment_status`,`p`.`transaction_id` AS `transaction_id`,`p`.`pay_time` AS `pay_time` from (`payment` `p` join `hotelorder_v1` `ho` on((`p`.`order_id` = `ho`.`order_id`)));

-- ----------------------------
-- Triggers structure for table checkin_client
-- ----------------------------
DROP TRIGGER IF EXISTS `update_individual_times`;
delimiter ;;
CREATE TRIGGER `update_individual_times` AFTER INSERT ON `checkin_client` FOR EACH ROW update client set accomodation_times=accomodation_times+1 where cid=new.cid ;
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table checkin_team
-- ----------------------------
DROP TRIGGER IF EXISTS `update_team_times`;
delimiter ;;
CREATE TRIGGER `update_team_times` AFTER INSERT ON `checkin_team` FOR EACH ROW update team set accomodation_times=accomodation_times+1 where tid=new.tid ;
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
