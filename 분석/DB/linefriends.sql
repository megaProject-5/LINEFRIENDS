-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.5-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- linefriends 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `linefriends`;
CREATE DATABASE IF NOT EXISTS `linefriends` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `linefriends`;

-- 테이블 linefriends.cart 구조 내보내기
DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `c_value` int(11) NOT NULL AUTO_INCREMENT COMMENT '장바구니 고유값',
  `m_value` int(11) NOT NULL COMMENT '아이디 고유값',
  `p_value` int(11) NOT NULL COMMENT '상품 고유값',
  PRIMARY KEY (`c_value`),
  KEY `FK_cart_memberinfo` (`m_value`),
  KEY `FK_cart_product` (`p_value`),
  CONSTRAINT `FK_cart_memberinfo` FOREIGN KEY (`m_value`) REFERENCES `memberinfo` (`m_value`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cart_product` FOREIGN KEY (`p_value`) REFERENCES `product` (`p_value`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='장바구니 테이블';

-- 테이블 데이터 linefriends.cart:~1 rows (대략적) 내보내기
DELETE FROM `cart`;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`c_value`, `m_value`, `p_value`) VALUES
	(1, 1, 1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- 테이블 linefriends.category 구조 내보내기
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `ct_value` int(11) NOT NULL AUTO_INCREMENT COMMENT '카테고리 고유값',
  `ct_large` varchar(30) NOT NULL COMMENT '카테고리 대분류',
  `ct_medium` varchar(30) DEFAULT NULL COMMENT '카테고리 중분류',
  `ct_small` varchar(30) DEFAULT NULL COMMENT '카테고리 소분류',
  PRIMARY KEY (`ct_value`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COMMENT='카테고리 테이블';

-- 테이블 데이터 linefriends.category:~34 rows (대략적) 내보내기
DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`ct_value`, `ct_large`, `ct_medium`, `ct_small`) VALUES
	(1, '캐릭터', '브라운앤프렌즈', '브라운'),
	(2, '캐릭터', '브라운앤프렌즈', '코니'),
	(3, '캐릭터', '브라운앤프렌즈', '샐리'),
	(4, '캐릭터', '브라운앤프렌즈', '초코'),
	(5, '캐릭터', '브라운앤프렌즈', '레너드'),
	(6, '캐릭터', '브라운앤프렌즈', '보스'),
	(7, '캐릭터', '브라운앤프렌즈', '제임스'),
	(8, '캐릭터', '브라운앤프렌즈', '에드워드'),
	(9, '캐릭터', '브라운앤프렌즈', '미니 브라운앤프렌즈'),
	(10, '캐릭터', '브라운앤프렌즈', 'minini'),
	(11, '캐릭터', 'BT21', 'KOYA'),
	(12, '캐릭터', 'BT21', 'RJ'),
	(13, '캐릭터', 'BT21', 'SHOOKY'),
	(14, '캐릭터', 'BT21', 'MANG'),
	(15, '캐릭터', 'BT21', 'CHIMMY'),
	(16, '캐릭터', 'BT21', 'TATA'),
	(17, '캐릭터', 'BT21', 'COOKY'),
	(18, '캐릭터', 'BT21', 'VAN'),
	(19, '캐릭터', 'BT21', 'BT21 BABY'),
	(20, '캐릭터', 'BT21', 'BT21'),
	(21, '캐릭터', 'BT21', 'minini'),
	(22, '캐릭터', '브롤스타즈', NULL),
	(23, '캐릭터', 'TRUZ', 'CHILLI'),
	(24, '캐릭터', 'TRUZ', 'ROMY'),
	(25, '캐릭터', 'TRUZ', 'YOCHI'),
	(26, '캐릭터', 'TRUZ', 'BONBON'),
	(27, '캐릭터', 'TRUZ', 'MATETSU'),
	(28, '캐릭터', 'TRUZ', 'LAWOO'),
	(29, '캐릭터', 'TRUZ', 'HIKUN'),
	(30, '캐릭터', 'TRUZ', 'YE-DEE'),
	(31, '캐릭터', 'TRUZ', 'SOM'),
	(32, '캐릭터', 'TRUZ', 'RURU'),
	(33, '캐릭터', 'TRUZ', 'WOOPY'),
	(34, '캐릭터', 'TRUZ', 'PODONG');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- 테이블 linefriends.delivery 구조 내보내기
DROP TABLE IF EXISTS `delivery`;
CREATE TABLE IF NOT EXISTS `delivery` (
  `p_value` int(11) NOT NULL,
  `d_term` int(11) DEFAULT NULL COMMENT '배송기간\r\n1 -> 1일 이내\r\n2 -> 2일 이내\r\n3 -> 3일 이내\r\n4 -> 4일 이상',
  KEY `FK_delivery_product` (`p_value`),
  CONSTRAINT `FK_delivery_product` FOREIGN KEY (`p_value`) REFERENCES `product` (`p_value`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='배송 테이블';

-- 테이블 데이터 linefriends.delivery:~0 rows (대략적) 내보내기
DELETE FROM `delivery`;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;

-- 테이블 linefriends.deliveryinfo 구조 내보내기
DROP TABLE IF EXISTS `deliveryinfo`;
CREATE TABLE IF NOT EXISTS `deliveryinfo` (
  `di_value` int(11) NOT NULL AUTO_INCREMENT COMMENT '배송지정보 고유값',
  `m_value` int(11) NOT NULL COMMENT '아이디 고유값',
  `di_name` varchar(50) NOT NULL COMMENT '수령인',
  `di_kinds` varchar(20) DEFAULT NULL COMMENT '배송지 명',
  `di_num1` varchar(11) NOT NULL COMMENT '연락처 1',
  `di_num2` varchar(11) DEFAULT NULL COMMENT '연락처 2',
  `di_address` varchar(150) NOT NULL COMMENT '주소',
  `di_memo` varchar(255) DEFAULT NULL COMMENT '메모',
  PRIMARY KEY (`di_value`),
  KEY `FK_deliveryinfo_memberinfo` (`m_value`),
  CONSTRAINT `FK_deliveryinfo_memberinfo` FOREIGN KEY (`m_value`) REFERENCES `memberinfo` (`m_value`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='배송지정보 테이블';

-- 테이블 데이터 linefriends.deliveryinfo:~1 rows (대략적) 내보내기
DELETE FROM `deliveryinfo`;
/*!40000 ALTER TABLE `deliveryinfo` DISABLE KEYS */;
INSERT INTO `deliveryinfo` (`di_value`, `m_value`, `di_name`, `di_kinds`, `di_num1`, `di_num2`, `di_address`, `di_memo`) VALUES
	(1, 1, '나', '집', '0100100100', NULL, 'aa', NULL);
/*!40000 ALTER TABLE `deliveryinfo` ENABLE KEYS */;

-- 테이블 linefriends.infomation 구조 내보내기
DROP TABLE IF EXISTS `infomation`;
CREATE TABLE IF NOT EXISTS `infomation` (
  `p_value` int(11) NOT NULL COMMENT '상품 고유값',
  `i_number` int(11) NOT NULL COMMENT '상품 번호',
  `i_manufacturer` varchar(50) NOT NULL COMMENT '제조사',
  `i_model` varchar(50) NOT NULL DEFAULT '' COMMENT '모델명',
  `i_date` datetime NOT NULL COMMENT '제조일자',
  `i_status` varchar(20) NOT NULL COMMENT '상품상태',
  `i_brand` varchar(20) NOT NULL COMMENT '브랜드',
  `i_origin` varchar(20) NOT NULL COMMENT '원산지',
  `i_receipt` varchar(100) DEFAULT NULL COMMENT '영수증발급',
  `i_as` varchar(100) DEFAULT NULL COMMENT 'A/S 안내 번호',
  UNIQUE KEY `i_number` (`i_number`),
  KEY `FK_infomation_product` (`p_value`),
  CONSTRAINT `FK_infomation_product` FOREIGN KEY (`p_value`) REFERENCES `product` (`p_value`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='상품 상세정보 테이블';

-- 테이블 데이터 linefriends.infomation:~1 rows (대략적) 내보내기
DELETE FROM `infomation`;
/*!40000 ALTER TABLE `infomation` DISABLE KEYS */;
INSERT INTO `infomation` (`p_value`, `i_number`, `i_manufacturer`, `i_model`, `i_date`, `i_status`, `i_brand`, `i_origin`, `i_receipt`, `i_as`) VALUES
	(1, 1, '삼성', 'a01', '2022-01-20 01:15:06', '상', '삼성', '중국', NULL, NULL);
/*!40000 ALTER TABLE `infomation` ENABLE KEYS */;

-- 테이블 linefriends.memberinfo 구조 내보내기
DROP TABLE IF EXISTS `memberinfo`;
CREATE TABLE IF NOT EXISTS `memberinfo` (
  `m_value` int(11) NOT NULL AUTO_INCREMENT COMMENT '아이디 고유 값',
  `m_id` varchar(20) NOT NULL COMMENT '아이디',
  `m_pw` varchar(255) NOT NULL COMMENT '비밀번호',
  `m_grade` int(11) DEFAULT 0 COMMENT '등급\r\n1 -> silver\r\n2 -> gold\r\n3 -> vip\r\n4 -> vvip',
  `m_signupDate` datetime NOT NULL COMMENT '회원가입일',
  `m_loginDate` datetime NOT NULL COMMENT '마지막접속일',
  `m_status` int(11) DEFAULT 0 COMMENT '회원상태\r\n0 -> 가입\r\n1 -> 탈퇴',
  `m_point` int(11) DEFAULT 0 COMMENT '포인트',
  PRIMARY KEY (`m_value`),
  UNIQUE KEY `m_id` (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='회원정보 테이블';

-- 테이블 데이터 linefriends.memberinfo:~1 rows (대략적) 내보내기
DELETE FROM `memberinfo`;
/*!40000 ALTER TABLE `memberinfo` DISABLE KEYS */;
INSERT INTO `memberinfo` (`m_value`, `m_id`, `m_pw`, `m_grade`, `m_signupDate`, `m_loginDate`, `m_status`, `m_point`) VALUES
	(1, 'id0001', 'qwe123', 1, '2022-01-20 00:30:47', '2022-01-20 00:30:48', 0, 0);
/*!40000 ALTER TABLE `memberinfo` ENABLE KEYS */;

-- 테이블 linefriends.myqna 구조 내보내기
DROP TABLE IF EXISTS `myqna`;
CREATE TABLE IF NOT EXISTS `myqna` (
  `mq_value` int(11) NOT NULL AUTO_INCREMENT COMMENT 'myQ&A 고유값',
  `m_value` int(11) NOT NULL COMMENT '아이디 고유값',
  `q_value` int(11) NOT NULL COMMENT 'Q&A 고유값',
  PRIMARY KEY (`mq_value`),
  KEY `FK_myqna_memberinfo` (`m_value`),
  KEY `FK_myqna_qna` (`q_value`),
  CONSTRAINT `FK_myqna_memberinfo` FOREIGN KEY (`m_value`) REFERENCES `memberinfo` (`m_value`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_myqna_qna` FOREIGN KEY (`q_value`) REFERENCES `qna` (`q_value`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='내 Q&A 테이블';

-- 테이블 데이터 linefriends.myqna:~0 rows (대략적) 내보내기
DELETE FROM `myqna`;
/*!40000 ALTER TABLE `myqna` DISABLE KEYS */;
INSERT INTO `myqna` (`mq_value`, `m_value`, `q_value`) VALUES
	(1, 1, 2);
/*!40000 ALTER TABLE `myqna` ENABLE KEYS */;

-- 테이블 linefriends.myreview 구조 내보내기
DROP TABLE IF EXISTS `myreview`;
CREATE TABLE IF NOT EXISTS `myreview` (
  `mr_value` int(11) NOT NULL AUTO_INCREMENT COMMENT 'myreview 고유값',
  `m_value` int(11) NOT NULL COMMENT '아이디고유값',
  `r_value` int(11) NOT NULL COMMENT '리뷰 고유값',
  PRIMARY KEY (`mr_value`),
  KEY `FK_myreview_memberinfo` (`m_value`),
  KEY `FK_myreview_review` (`r_value`),
  CONSTRAINT `FK_myreview_memberinfo` FOREIGN KEY (`m_value`) REFERENCES `memberinfo` (`m_value`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_myreview_review` FOREIGN KEY (`r_value`) REFERENCES `review` (`r_value`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='내 리뷰 테이블';

-- 테이블 데이터 linefriends.myreview:~0 rows (대략적) 내보내기
DELETE FROM `myreview`;
/*!40000 ALTER TABLE `myreview` DISABLE KEYS */;
/*!40000 ALTER TABLE `myreview` ENABLE KEYS */;

-- 테이블 linefriends.option 구조 내보내기
DROP TABLE IF EXISTS `option`;
CREATE TABLE IF NOT EXISTS `option` (
  `o_value` int(11) NOT NULL AUTO_INCREMENT COMMENT '옵션 고유값',
  `p_value` int(11) NOT NULL COMMENT '상품 고유값',
  `o_option` varchar(200) NOT NULL COMMENT '상품 옵션',
  `o_stock` int(11) NOT NULL COMMENT '상품 재고 수량',
  `o_status` int(11) NOT NULL COMMENT '재고상태\r\n0 -> 재고있음\r\n1 -> 품절',
  PRIMARY KEY (`o_value`),
  KEY `FK_option_product` (`p_value`),
  CONSTRAINT `FK_option_product` FOREIGN KEY (`p_value`) REFERENCES `product` (`p_value`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='상품 옵션 테이블';

-- 테이블 데이터 linefriends.option:~0 rows (대략적) 내보내기
DELETE FROM `option`;
/*!40000 ALTER TABLE `option` DISABLE KEYS */;
/*!40000 ALTER TABLE `option` ENABLE KEYS */;

-- 테이블 linefriends.photo 구조 내보내기
DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `p_value` int(11) NOT NULL COMMENT '상품 고유값',
  `photo_URL` varchar(255) DEFAULT NULL COMMENT '상품 사진 URL',
  KEY `FK_photo_product` (`p_value`),
  CONSTRAINT `FK_photo_product` FOREIGN KEY (`p_value`) REFERENCES `product` (`p_value`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='상품사진 테이블';

-- 테이블 데이터 linefriends.photo:~0 rows (대략적) 내보내기
DELETE FROM `photo`;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;

-- 테이블 linefriends.product 구조 내보내기
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `p_value` int(11) NOT NULL AUTO_INCREMENT COMMENT '상품 고유값',
  `ct_value` int(11) NOT NULL COMMENT '카테고리 고유값',
  `p_name` varchar(200) NOT NULL DEFAULT '' COMMENT '상품 명',
  `p_sale` int(11) NOT NULL COMMENT '상품 할인율',
  `p_price` int(11) NOT NULL COMMENT '상품 정가',
  `p_discount` int(11) NOT NULL COMMENT '상품 판매가(할인율적용)',
  `p_delivery` int(11) DEFAULT 0 COMMENT '배송비',
  PRIMARY KEY (`p_value`),
  KEY `FK_product_category` (`ct_value`),
  CONSTRAINT `FK_product_category` FOREIGN KEY (`ct_value`) REFERENCES `category` (`ct_value`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='상품 테이블';

-- 테이블 데이터 linefriends.product:~1 rows (대략적) 내보내기
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`p_value`, `ct_value`, `p_name`, `p_sale`, `p_price`, `p_discount`, `p_delivery`) VALUES
	(1, 8, 'a', 10, 100, 90, 10);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- 테이블 linefriends.qna 구조 내보내기
DROP TABLE IF EXISTS `qna`;
CREATE TABLE IF NOT EXISTS `qna` (
  `q_value` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Q&A 고유값',
  `m_value` int(11) NOT NULL COMMENT '아이디 고유값',
  `p_value` int(11) NOT NULL COMMENT '상품 고유값',
  `q_contents` text NOT NULL COMMENT 'Q&A 내용',
  `q_status` int(11) DEFAULT 0 COMMENT '답변상태\r\n0 -> 미답변\r\n1 -> 답변완료',
  `q_date` datetime NOT NULL COMMENT '작성일',
  `q_comment` text DEFAULT NULL COMMENT 'Q&A 답변',
  PRIMARY KEY (`q_value`),
  KEY `FK_qna_product` (`p_value`),
  KEY `FK_qna_memberinfo` (`m_value`),
  CONSTRAINT `FK_qna_memberinfo` FOREIGN KEY (`m_value`) REFERENCES `memberinfo` (`m_value`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_qna_product` FOREIGN KEY (`p_value`) REFERENCES `product` (`p_value`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='상품 QnA 테이블';

-- 테이블 데이터 linefriends.qna:~0 rows (대략적) 내보내기
DELETE FROM `qna`;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` (`q_value`, `m_value`, `p_value`, `q_contents`, `q_status`, `q_date`, `q_comment`) VALUES
	(2, 1, 1, '질문', 0, '2022-01-20 01:48:21', NULL);
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;

-- 테이블 linefriends.review 구조 내보내기
DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `r_value` int(11) NOT NULL AUTO_INCREMENT COMMENT '리뷰 고유값',
  `m_value` int(11) NOT NULL COMMENT '아이디 고유값',
  `p_value` int(11) NOT NULL COMMENT '상품 고유값',
  `r_contents` text NOT NULL COMMENT '리뷰 내용',
  `r_comment` text DEFAULT NULL COMMENT '리뷰 댓글',
  `r_date` datetime NOT NULL COMMENT '리뷰 등록일',
  `r_grade` int(11) NOT NULL COMMENT '리뷰 평점',
  PRIMARY KEY (`r_value`) USING BTREE,
  KEY `FK_review_product` (`p_value`),
  CONSTRAINT `FK_review_product` FOREIGN KEY (`p_value`) REFERENCES `product` (`p_value`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='리뷰 테이블';

-- 테이블 데이터 linefriends.review:~0 rows (대략적) 내보내기
DELETE FROM `review`;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;

-- 테이블 linefriends.wishlist 구조 내보내기
DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE IF NOT EXISTS `wishlist` (
  `w_value` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `m_value` int(11) NOT NULL COMMENT '아이디 고유값',
  `p_value` int(11) NOT NULL COMMENT '상품 고유값',
  PRIMARY KEY (`w_value`),
  KEY `FK_wishlist_memberinfo` (`m_value`),
  KEY `FK_wishlist_product` (`p_value`),
  CONSTRAINT `FK_wishlist_memberinfo` FOREIGN KEY (`m_value`) REFERENCES `memberinfo` (`m_value`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_wishlist_product` FOREIGN KEY (`p_value`) REFERENCES `product` (`p_value`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='찜목록 테이블';

-- 테이블 데이터 linefriends.wishlist:~0 rows (대략적) 내보내기
DELETE FROM `wishlist`;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
