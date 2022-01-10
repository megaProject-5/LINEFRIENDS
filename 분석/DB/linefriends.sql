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
  `m_value` int(11) NOT NULL,
  `p_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='장바구니 테이블';

-- 테이블 데이터 linefriends.cart:~0 rows (대략적) 내보내기
DELETE FROM `cart`;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- 테이블 linefriends.deliveryinfo 구조 내보내기
DROP TABLE IF EXISTS `deliveryinfo`;
CREATE TABLE IF NOT EXISTS `deliveryinfo` (
  `m_value` int(11) NOT NULL COMMENT '아이디 고유값',
  `di_name` varchar(50) NOT NULL COMMENT '수령인',
  `di_kinds` varchar(50) DEFAULT NULL COMMENT '배송지 명',
  `di_num1` int(11) NOT NULL COMMENT '연락처 1',
  `di_num2` int(11) DEFAULT NULL COMMENT '연락처 2',
  `di_address` varchar(150) NOT NULL COMMENT '주소',
  `di_meno` varchar(255) DEFAULT NULL COMMENT '메모'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='배송지정보 테이블';

-- 테이블 데이터 linefriends.deliveryinfo:~0 rows (대략적) 내보내기
DELETE FROM `deliveryinfo`;
/*!40000 ALTER TABLE `deliveryinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliveryinfo` ENABLE KEYS */;

-- 테이블 linefriends.memberinfo 구조 내보내기
DROP TABLE IF EXISTS `memberinfo`;
CREATE TABLE IF NOT EXISTS `memberinfo` (
  `m_value` int(11) NOT NULL AUTO_INCREMENT COMMENT '아이디 고유 값',
  `m_id` varchar(20) NOT NULL COMMENT '아이디',
  `m_pw` varchar(255) NOT NULL COMMENT '비밀번호',
  `m_grade` int(11) DEFAULT 0 COMMENT '등급\r\n1 -> silver\r\n2 -> gold\r\n3 -> vip\r\n4 -> vvip',
  `m_signupDate` datetime DEFAULT NULL COMMENT '회원가입일',
  `m_loginDate` datetime DEFAULT NULL COMMENT '마지막접속일',
  `m_status` int(11) DEFAULT 0 COMMENT '회원상태\r\n0 -> 가입\r\n1 -> 탈퇴',
  `m_point` int(11) DEFAULT NULL COMMENT '포인트',
  PRIMARY KEY (`m_value`),
  UNIQUE KEY `m_id` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='회원정보 테이블';

-- 테이블 데이터 linefriends.memberinfo:~0 rows (대략적) 내보내기
DELETE FROM `memberinfo`;
/*!40000 ALTER TABLE `memberinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `memberinfo` ENABLE KEYS */;

-- 테이블 linefriends.product 구조 내보내기
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `p_value` int(11) NOT NULL,
  `ct_value` int(11) NOT NULL,
  `r_review` int(11) NOT NULL,
  `QnA_value` int(11) NOT NULL,
  `p_name` varchar(200) NOT NULL DEFAULT '',
  `p_sale` int(11) NOT NULL,
  `p_price` int(11) NOT NULL,
  `p_discount` int(11) NOT NULL,
  `p_delivery` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='상품 테이블';

-- 테이블 데이터 linefriends.product:~0 rows (대략적) 내보내기
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- 테이블 linefriends.review 구조 내보내기
DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `m_value` int(11) DEFAULT NULL,
  `r_review` int(11) DEFAULT NULL,
  `r_date` int(11) DEFAULT NULL,
  `r_contents` int(11) DEFAULT NULL,
  `r_comment` text NOT NULL,
  `r_grade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='리뷰 테이블';

-- 테이블 데이터 linefriends.review:~0 rows (대략적) 내보내기
DELETE FROM `review`;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;

-- 테이블 linefriends.wishlist 구조 내보내기
DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE IF NOT EXISTS `wishlist` (
  `m_value` int(11) NOT NULL,
  `p_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='찜목록 테이블';

-- 테이블 데이터 linefriends.wishlist:~0 rows (대략적) 내보내기
DELETE FROM `wishlist`;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
