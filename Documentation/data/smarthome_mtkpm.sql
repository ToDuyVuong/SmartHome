/*
 Navicat Premium Data Transfer

 Source Server         : local_mysql_myadmin
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : smarthome_mtkpm

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 04/05/2023 22:02:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NULL DEFAULT NULL,
  `totalprice` int NOT NULL,
  `customer_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`cart_id`) USING BTREE,
  INDEX `FKdebwvad6pp1ekiqy5jtixqbaj`(`customer_id`) USING BTREE,
  CONSTRAINT `FKdebwvad6pp1ekiqy5jtixqbaj` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, 0, 4556000, 1);

-- ----------------------------
-- Table structure for cartitem
-- ----------------------------
DROP TABLE IF EXISTS `cartitem`;
CREATE TABLE `cartitem`  (
  `cartitemid` int NOT NULL AUTO_INCREMENT,
  `quantity` int NULL DEFAULT NULL,
  `cartid` int NULL DEFAULT NULL,
  `productid` int NULL DEFAULT NULL,
  PRIMARY KEY (`cartitemid`) USING BTREE,
  INDEX `FKtc9npvycs1rruynyqdhyrybqw`(`cartid`) USING BTREE,
  INDEX `FKbsrlaxw9ldecp9xs18354yjn6`(`productid`) USING BTREE,
  CONSTRAINT `FKbsrlaxw9ldecp9xs18354yjn6` FOREIGN KEY (`productid`) REFERENCES `products` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKtc9npvycs1rruynyqdhyrybqw` FOREIGN KEY (`cartid`) REFERENCES `cart` (`cart_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cartitem
-- ----------------------------
INSERT INTO `cartitem` VALUES (6, 0, NULL, NULL);
INSERT INTO `cartitem` VALUES (7, 0, NULL, NULL);
INSERT INTO `cartitem` VALUES (8, 0, NULL, NULL);
INSERT INTO `cartitem` VALUES (10, 0, NULL, NULL);
INSERT INTO `cartitem` VALUES (11, 0, NULL, NULL);
INSERT INTO `cartitem` VALUES (12, 0, NULL, NULL);
INSERT INTO `cartitem` VALUES (13, 0, NULL, NULL);
INSERT INTO `cartitem` VALUES (14, 0, NULL, NULL);
INSERT INTO `cartitem` VALUES (15, 0, NULL, NULL);
INSERT INTO `cartitem` VALUES (16, 0, NULL, NULL);
INSERT INTO `cartitem` VALUES (17, 0, NULL, NULL);
INSERT INTO `cartitem` VALUES (18, 0, NULL, NULL);
INSERT INTO `cartitem` VALUES (19, 0, NULL, NULL);
INSERT INTO `cartitem` VALUES (20, 0, NULL, NULL);
INSERT INTO `cartitem` VALUES (21, 0, NULL, NULL);
INSERT INTO `cartitem` VALUES (22, 0, NULL, NULL);
INSERT INTO `cartitem` VALUES (23, 0, NULL, NULL);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Điều khiển từ xa thông qua internet/ mạng LAN trong nhà (Qua app Lumi Life)', 'Smart Home');
INSERT INTO `categories` VALUES (2, 'Có thể điều khiển tắt mở từ xa qua điện thoại/ giọng nói/ ngữ cảnh', 'Smart Lightning');
INSERT INTO `categories` VALUES (3, 'Cho phép mở cổng từ xa bằng App Lumi Life. Mở bằng Remote, Công tắc hoặc mở  trên màn hình chuông cửa thông minh', 'Cổng tự động');
INSERT INTO `categories` VALUES (4, 'Hàng rào an ninh ảo, cảnh báo tức thì. Chống đột nhập trái phép. Đuổi trộm ngay khi phát hiện xâm nhập', 'Camera An Ninh Thông Minh');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gender` bit(1) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`) USING BTREE,
  UNIQUE INDEX `UQ_Customer_username`(`username`) USING BTREE,
  UNIQUE INDEX `UQ_Customer_email`(`email`) USING BTREE,
  UNIQUE INDEX `UQ_Customer_phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 'Linh Trung', '2002-05-12', 'venh.ha@gmail.com', 'Hà Nhật Vềnh', b'1', 'ven', '0346951507', 'ven');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `price` bigint NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`order_item_id`) USING BTREE,
  INDEX `FK_order_orderItem`(`order_id`) USING BTREE,
  INDEX `FK_product_orderItem`(`product_id`) USING BTREE,
  CONSTRAINT `FK_order_orderItem` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_product_orderItem` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (1, 2242000, 1, 1, 3);
INSERT INTO `orderitem` VALUES (2, 1750000, 2, 2, 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `order_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ship_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `totalprice` bigint NULL DEFAULT NULL,
  `totalquantity` int NULL DEFAULT NULL,
  `customer_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `FK_customer_order`(`customer_id`) USING BTREE,
  CONSTRAINT `FK_customer_order` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 'Linh Trung', '02/05/2023', 'nothing', '0346951507', NULL, 'PENDING', 2242000, 1, 1);
INSERT INTO `orders` VALUES (2, 'Thủ Đức', '04/05/2023', '', '0346951507', 'Giao Hang Nhanh', 'PENDING', 3530000, 2, 1);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` bigint NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  `category_id` int NOT NULL,
  `weight` float NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `FK_category_product`(`category_id`) USING BTREE,
  CONSTRAINT `FK_category_product` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Mặt kính cường lực chống xước. Viền nhôm, mặt kính phẳng. Điều khiển từ xa thông qua internet/ mạng LAN trong nhà (Qua app Lumi Life)', 'https://lumihcm.vn/thumbs/540x540x1/upload/product/01-1-9911.png', 'Công Tắc Thông Minh 1 Nút Viền Nhôm, Kính Phẳng', 1750000, 18, 1, 1.1);
INSERT INTO `products` VALUES (2, 'Điều khiển từ xa thông qua internet/ mạng LAN trong nhà (Qua app Lumi Life). Điều khiển theo nhóm Rule, Cảnh, Lịch (Tùy biến theo nhu cầu người sử dụng). Có thể điều khiển thiết bị bằng giọng nói thông qua việc tích hợp Google Assistant, Alexa, Apple Siri', 'https://lumihcm.vn/thumbs/540x540x1/upload/product/chu-nhat-den-6734.png', 'Công Tắc Thông Minh 2 Nút Viền Nhôm, Kính Phẳng', 1760000, 20, 1, 1);
INSERT INTO `products` VALUES (3, 'Mặt kính cường lực chống xước, viền champagne, mài lõm sang trọng. Điều khiển từ xa thông qua internet/ mạng LAN trong nhà (Qua app Lumi Life). Điều khiển theo nhóm Rule, Cảnh, Lịch (Tùy biến theo nhu cầu người sử dụng).', 'https://lumihcm.vn/thumbs/540x540x1/upload/product/cong-tac-cam-ung-kinh-lom-vien-champagne-3231.jpg', 'Công Tắc Cảm Ứng Kính Lõm, Viền Champagne', 2242000, 19, 1, 1.5);
INSERT INTO `products` VALUES (4, '• Công suất: 10W • Góc chiếu: 36D • Lỗ khoét: 75mm • Màu sắc chóa đèn: Bạc • Chất liệu: Nhôm đúc • Chip LED: Luminus • Nhiệt độ màu (CCT): 3000K/ 4000K', 'https://lumihcm.vn/thumbs/540x540x1/upload/product/den-spotlight-am-tran-01-10w-36-do-chinh-huong-8235.png', 'Đèn Spotlight Âm Trần 10W 36 Độ, Chỉnh Hướng (Driver: Smart Dimmable)', 1375000, 20, 2, 1);
INSERT INTO `products` VALUES (5, 'Đèn mini spotlight âm trần 7W 40 độ cao cấp với thiết kế kiểu dáng đơn giản nhưng mang tới nguồn sáng ấn tượng, giúp không gian trở nên sang trọng. Đèn chiếu ánh sáng với góc 40° nên được sử dụng trong chiếu chức năng ở nhiều khu vực', 'https://lumihcm.vn/thumbs/540x540x1/upload/product/den-mini-spotlight-am-tran-7w-40-do-6916.png', 'Đèn Mini Spotlight Âm Trần 7W 40 Độ, Chỉnh Hướng (Driver: Smart Dimmable)', 1056000, 20, 2, 1.6);
INSERT INTO `products` VALUES (6, 'Với đặc tính dùng để chiếu trang trí, chiếu chức năng trong không gian và sở hữu nhiều ưu điểm vượt trội nên đèn spotlight âm trần xoay góc 10W là giải pháp tối ưu cho các không gian tại cửa hàng thời gian, siêu thị, trung tâm thương mại, khách sạn,…', 'https://lumihcm.vn/thumbs/540x540x1/upload/product/den-spotlight-am-tran-10w-xoay-goc-9837.png', 'Đèn Spotlight Âm Trần 10W Xoay Góc (Driver: On – Off)', 1353000, 20, 2, 1);
INSERT INTO `products` VALUES (7, 'Motor cổng tự động cánh tay đòn Vulcan 24V là dòng thiết bị cổng cánh tay đòn cao cấp được nhập khẩu và phân phối bởi Bisco. Motor có thể chịu tải 600kg/1 cánh được tích hợp chức năng điều khiển từ xa bằng remote và các thiết bị thông minh', 'https://lumihcm.vn/thumbs/540x540x1/upload/product/cong-tu-dong-canh-tay-don-vulcan-v2-24v-2428.jpg', 'Cổng Tự Động Cánh Tay Đòn VULCAN V2 – 600KG - 24V', 15000000, 15, 3, 2);
INSERT INTO `products` VALUES (8, 'Cổng tự động âm sàn V2-Vulcan (Italia) thiết bị được nhập khẩu chính hãng đồng bộ 100% từ Italia. Thiết bị sử dụng động cơ điện với công suất lớn, được lắp đặt dành cho cổng mở xoay.', 'https://lumihcm.vn/thumbs/540x540x1/upload/product/cong-am-san-tu-dong-vulcan-v2-24v-600kgcanh-2361.jpg', 'Cổng Âm Sàn Tự Động VULCAN V2 – 24V – 600kg', 20000000, 17, 3, 1);
INSERT INTO `products` VALUES (9, 'Tính năng thông minh: Phát hiện vượt hàng rào ảo, phát hiện xâm nhập. Dễ dàng giám sát qua điện thoại di động, iPad, iPhone… Phần mềm giám sát và tên miền miễn phí…', 'https://lumihcm.vn/thumbs/540x540x1/upload/product/hikvision-ds-2cd2021g1-i-5171.jpg', 'Camera IP Hồng Ngoại 2.0 Mpx HIKVISION DS-2CD2021G1-I', 1340000, 30, 4, 2);
INSERT INTO `products` VALUES (10, 'Chức năng bù ngược sáng BLC. Hỗ trợ chống báo động giả bằng cách phân biệt được người, xe với các yếu tố gây báo động giả khác (như vật nuôi, lá cây,…). Built-in speaker. Hỗ trợ đèn và còi báo động.', 'https://lumihcm.vn/thumbs/540x540x1/upload/product/hikvision-lm-ac270412-bu4-sl-4628.jpg', 'Camera IP 5.0MP HIKVISION LM-AC270412-BU5/SL', 7623000, 12, 4, 3);

SET FOREIGN_KEY_CHECKS = 1;
