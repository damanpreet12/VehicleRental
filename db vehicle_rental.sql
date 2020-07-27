-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.20 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table vehicle_rental_db.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.auth_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.auth_group_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.auth_permission: ~116 rows (approximately)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add document', 7, 'add_document'),
	(26, 'Can change document', 7, 'change_document'),
	(27, 'Can delete document', 7, 'delete_document'),
	(28, 'Can view document', 7, 'view_document'),
	(29, 'Can add user document', 8, 'add_userdocument'),
	(30, 'Can change user document', 8, 'change_userdocument'),
	(31, 'Can delete user document', 8, 'delete_userdocument'),
	(32, 'Can view user document', 8, 'view_userdocument'),
	(33, 'Can add user info', 9, 'add_userinfo'),
	(34, 'Can change user info', 9, 'change_userinfo'),
	(35, 'Can delete user info', 9, 'delete_userinfo'),
	(36, 'Can view user info', 9, 'view_userinfo'),
	(37, 'Can add user role', 10, 'add_userrole'),
	(38, 'Can change user role', 10, 'change_userrole'),
	(39, 'Can delete user role', 10, 'delete_userrole'),
	(40, 'Can view user role', 10, 'view_userrole'),
	(41, 'Can add upload document', 11, 'add_uploaddocument'),
	(42, 'Can change upload document', 11, 'change_uploaddocument'),
	(43, 'Can delete upload document', 11, 'delete_uploaddocument'),
	(44, 'Can view upload document', 11, 'view_uploaddocument'),
	(45, 'Can add upload user document', 12, 'add_uploaduserdocument'),
	(46, 'Can change upload user document', 12, 'change_uploaduserdocument'),
	(47, 'Can delete upload user document', 12, 'delete_uploaduserdocument'),
	(48, 'Can view upload user document', 12, 'view_uploaduserdocument'),
	(49, 'Can add add category', 13, 'add_addcategory'),
	(50, 'Can change add category', 13, 'change_addcategory'),
	(51, 'Can delete add category', 13, 'delete_addcategory'),
	(52, 'Can view add category', 13, 'view_addcategory'),
	(53, 'Can add availablecities', 14, 'add_availablecities'),
	(54, 'Can change availablecities', 14, 'change_availablecities'),
	(55, 'Can delete availablecities', 14, 'delete_availablecities'),
	(56, 'Can view availablecities', 14, 'view_availablecities'),
	(57, 'Can add booking details', 15, 'add_bookingdetails'),
	(58, 'Can change booking details', 15, 'change_bookingdetails'),
	(59, 'Can delete booking details', 15, 'delete_bookingdetails'),
	(60, 'Can view booking details', 15, 'view_bookingdetails'),
	(61, 'Can add booking details2', 16, 'add_bookingdetails2'),
	(62, 'Can change booking details2', 16, 'change_bookingdetails2'),
	(63, 'Can delete booking details2', 16, 'delete_bookingdetails2'),
	(64, 'Can view booking details2', 16, 'view_bookingdetails2'),
	(65, 'Can add city', 17, 'add_city'),
	(66, 'Can change city', 17, 'change_city'),
	(67, 'Can delete city', 17, 'delete_city'),
	(68, 'Can view city', 17, 'view_city'),
	(69, 'Can add feedbackform', 18, 'add_feedbackform'),
	(70, 'Can change feedbackform', 18, 'change_feedbackform'),
	(71, 'Can delete feedbackform', 18, 'delete_feedbackform'),
	(72, 'Can view feedbackform', 18, 'view_feedbackform'),
	(73, 'Can add login_details', 19, 'add_login_details'),
	(74, 'Can change login_details', 19, 'change_login_details'),
	(75, 'Can delete login_details', 19, 'delete_login_details'),
	(76, 'Can view login_details', 19, 'view_login_details'),
	(77, 'Can add payment_token', 20, 'add_payment_token'),
	(78, 'Can change payment_token', 20, 'change_payment_token'),
	(79, 'Can delete payment_token', 20, 'delete_payment_token'),
	(80, 'Can view payment_token', 20, 'view_payment_token'),
	(81, 'Can add sub category', 21, 'add_subcategory'),
	(82, 'Can change sub category', 21, 'change_subcategory'),
	(83, 'Can delete sub category', 21, 'delete_subcategory'),
	(84, 'Can view sub category', 21, 'view_subcategory'),
	(85, 'Can add vehicle info', 22, 'add_vehicleinfo'),
	(86, 'Can change vehicle info', 22, 'change_vehicleinfo'),
	(87, 'Can delete vehicle info', 22, 'delete_vehicleinfo'),
	(88, 'Can view vehicle info', 22, 'view_vehicleinfo'),
	(89, 'Can add vehicle company', 23, 'add_vehiclecompany'),
	(90, 'Can change vehicle company', 23, 'change_vehiclecompany'),
	(91, 'Can delete vehicle company', 23, 'delete_vehiclecompany'),
	(92, 'Can view vehicle company', 23, 'view_vehiclecompany'),
	(93, 'Can add PayPal IPN', 24, 'add_paypalipn'),
	(94, 'Can change PayPal IPN', 24, 'change_paypalipn'),
	(95, 'Can delete PayPal IPN', 24, 'delete_paypalipn'),
	(96, 'Can view PayPal IPN', 24, 'view_paypalipn'),
	(97, 'Can add association', 25, 'add_association'),
	(98, 'Can change association', 25, 'change_association'),
	(99, 'Can delete association', 25, 'delete_association'),
	(100, 'Can view association', 25, 'view_association'),
	(101, 'Can add code', 26, 'add_code'),
	(102, 'Can change code', 26, 'change_code'),
	(103, 'Can delete code', 26, 'delete_code'),
	(104, 'Can view code', 26, 'view_code'),
	(105, 'Can add nonce', 27, 'add_nonce'),
	(106, 'Can change nonce', 27, 'change_nonce'),
	(107, 'Can delete nonce', 27, 'delete_nonce'),
	(108, 'Can view nonce', 27, 'view_nonce'),
	(109, 'Can add user social auth', 28, 'add_usersocialauth'),
	(110, 'Can change user social auth', 28, 'change_usersocialauth'),
	(111, 'Can delete user social auth', 28, 'delete_usersocialauth'),
	(112, 'Can view user social auth', 28, 'view_usersocialauth'),
	(113, 'Can add partial', 29, 'add_partial'),
	(114, 'Can change partial', 29, 'change_partial'),
	(115, 'Can delete partial', 29, 'delete_partial'),
	(116, 'Can view partial', 29, 'view_partial');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.auth_user: ~1 rows (approximately)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$180000$DOvw4AJmdjVq$/Eq5rzHmpt93M2Co9HF7DmPDOdkj+0z9l/xCZgYJIZM=', '2020-06-27 09:35:18.533614', 1, 'daman', '', '', 'dkaur4381@gmail.com', 1, 1, '2020-06-27 09:34:53.243755');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.auth_user_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.auth_user_user_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.businessapp_vehiclecompany
CREATE TABLE IF NOT EXISTS `businessapp_vehiclecompany` (
  `company_name` varchar(200) NOT NULL,
  `company_id` int NOT NULL AUTO_INCREMENT,
  `company_isactive` tinyint(1) NOT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `businessapp_vehiclecompany_company_name_e39d4b52_uniq` (`company_name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.businessapp_vehiclecompany: ~19 rows (approximately)
/*!40000 ALTER TABLE `businessapp_vehiclecompany` DISABLE KEYS */;
INSERT INTO `businessapp_vehiclecompany` (`company_name`, `company_id`, `company_isactive`) VALUES
	('Honda', 1, 0),
	('TVS', 2, 0),
	('Hero', 3, 0),
	('Suzuki', 4, 0),
	('Yamaha', 5, 0),
	('Bajaj', 7, 0),
	('Mercedes', 8, 0),
	('Toyota ', 9, 0),
	('KTM', 10, 0),
	('Land Rover', 11, 0),
	('Indian Chieftain', 12, 0),
	('Maruti', 13, 0),
	('Harley Davidson', 14, 0),
	('Ducati', 15, 0),
	('BMW', 16, 0),
	('Ford', 17, 0),
	('Hyundai', 18, 0),
	('Jaguar', 19, 0),
	('Tata', 20, 0);
/*!40000 ALTER TABLE `businessapp_vehiclecompany` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.django_admin_log: ~3 rows (approximately)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2020-06-27 09:35:49.063369', '1', 'UserRole object (1)', 1, '[{"added": {}}]', 10, 1),
	(2, '2020-06-27 09:35:55.883792', '2', 'UserRole object (2)', 1, '[{"added": {}}]', 10, 1),
	(3, '2020-06-27 09:36:02.833490', '3', 'UserRole object (3)', 1, '[{"added": {}}]', 10, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.django_content_type: ~29 rows (approximately)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(23, 'businessapp', 'vehiclecompany'),
	(5, 'contenttypes', 'contenttype'),
	(24, 'ipn', 'paypalipn'),
	(13, 'managerapp', 'addcategory'),
	(14, 'managerapp', 'availablecities'),
	(15, 'managerapp', 'bookingdetails'),
	(16, 'managerapp', 'bookingdetails2'),
	(17, 'managerapp', 'city'),
	(18, 'managerapp', 'feedbackform'),
	(19, 'managerapp', 'login_details'),
	(20, 'managerapp', 'payment_token'),
	(21, 'managerapp', 'subcategory'),
	(22, 'managerapp', 'vehicleinfo'),
	(6, 'sessions', 'session'),
	(25, 'social_django', 'association'),
	(26, 'social_django', 'code'),
	(27, 'social_django', 'nonce'),
	(29, 'social_django', 'partial'),
	(28, 'social_django', 'usersocialauth'),
	(7, 'userapp', 'document'),
	(11, 'userapp', 'uploaddocument'),
	(12, 'userapp', 'uploaduserdocument'),
	(8, 'userapp', 'userdocument'),
	(9, 'userapp', 'userinfo'),
	(10, 'userapp', 'userrole');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.django_migrations: ~48 rows (approximately)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2020-06-27 09:22:33.074990'),
	(2, 'auth', '0001_initial', '2020-06-27 09:22:36.994943'),
	(3, 'admin', '0001_initial', '2020-06-27 09:23:01.805149'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2020-06-27 09:23:12.524844'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-06-27 09:23:12.894813'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2020-06-27 09:23:17.141220'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2020-06-27 09:23:19.772708'),
	(8, 'auth', '0003_alter_user_email_max_length', '2020-06-27 09:23:20.326762'),
	(9, 'auth', '0004_alter_user_username_opts', '2020-06-27 09:23:20.457905'),
	(10, 'auth', '0005_alter_user_last_login_null', '2020-06-27 09:23:22.829043'),
	(11, 'auth', '0006_require_contenttypes_0002', '2020-06-27 09:23:22.997775'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2020-06-27 09:23:23.144551'),
	(13, 'auth', '0008_alter_user_username_max_length', '2020-06-27 09:23:29.953054'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2020-06-27 09:23:35.706580'),
	(15, 'auth', '0010_alter_group_name_max_length', '2020-06-27 09:23:36.439549'),
	(16, 'auth', '0011_update_proxy_permissions', '2020-06-27 09:23:36.586479'),
	(17, 'businessapp', '0001_initial', '2020-06-27 09:23:37.508565'),
	(18, 'businessapp', '0002_auto_20190802_1242', '2020-06-27 09:23:38.340517'),
	(19, 'ipn', '0001_initial', '2020-06-27 09:23:39.572499'),
	(20, 'ipn', '0002_paypalipn_mp_id', '2020-06-27 09:23:41.904757'),
	(21, 'ipn', '0003_auto_20141117_1647', '2020-06-27 09:23:48.116517'),
	(22, 'ipn', '0004_auto_20150612_1826', '2020-06-27 09:25:21.636045'),
	(23, 'ipn', '0005_auto_20151217_0948', '2020-06-27 09:25:22.736611'),
	(24, 'ipn', '0006_auto_20160108_1112', '2020-06-27 09:25:26.516309'),
	(25, 'ipn', '0007_auto_20160219_1135', '2020-06-27 09:25:27.054059'),
	(26, 'ipn', '0008_auto_20181128_1032', '2020-06-27 09:25:27.316810'),
	(27, 'userapp', '0001_initial', '2020-06-27 09:25:47.576178'),
	(28, 'managerapp', '0001_initial', '2020-06-27 09:26:10.287252'),
	(29, 'sessions', '0001_initial', '2020-06-27 09:26:44.561080'),
	(30, 'default', '0001_initial', '2020-06-27 09:26:53.687501'),
	(31, 'social_auth', '0001_initial', '2020-06-27 09:26:53.871672'),
	(32, 'default', '0002_add_related_name', '2020-06-27 09:27:05.925651'),
	(33, 'social_auth', '0002_add_related_name', '2020-06-27 09:27:06.426027'),
	(34, 'default', '0003_alter_email_max_length', '2020-06-27 09:27:08.126994'),
	(35, 'social_auth', '0003_alter_email_max_length', '2020-06-27 09:27:08.311669'),
	(36, 'default', '0004_auto_20160423_0400', '2020-06-27 09:27:08.559115'),
	(37, 'social_auth', '0004_auto_20160423_0400', '2020-06-27 09:27:08.812779'),
	(38, 'social_auth', '0005_auto_20160727_2333', '2020-06-27 09:27:11.260859'),
	(39, 'social_django', '0006_partial', '2020-06-27 09:27:12.915702'),
	(40, 'social_django', '0007_code_timestamp', '2020-06-27 09:27:16.686742'),
	(41, 'social_django', '0008_partial_timestamp', '2020-06-27 09:27:18.666036'),
	(42, 'userapp', '0002_uploaddocument', '2020-06-27 09:27:20.620299'),
	(43, 'userapp', '0003_uploaduserdocument', '2020-06-27 09:27:25.738618'),
	(44, 'social_django', '0002_add_related_name', '2020-06-27 09:27:31.428492'),
	(45, 'social_django', '0003_alter_email_max_length', '2020-06-27 09:27:31.728771'),
	(46, 'social_django', '0005_auto_20160727_2333', '2020-06-27 09:27:32.044604'),
	(47, 'social_django', '0004_auto_20160423_0400', '2020-06-27 09:27:32.291440'),
	(48, 'social_django', '0001_initial', '2020-06-27 09:27:32.445189');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.django_session: ~1 rows (approximately)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('vkmtxk7out086067y7i18cr5fcwu3g25', 'MWNkYzJiNWIzYThiYjdkYTJiZTA3NzY3ZWE4YjdlOTRiN2E4ZWI2ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOTQwYWVmMGI0OGUyNmFmNzgwYjBkOGFlZjQ5MzFiMmNhODMwZWUyIiwiZW1haWwiOiJndXB0YWRpdnlhNDM4MUBnbWFpbC5jb20iLCJBdXRoZW50aWNhdGlvbiI6dHJ1ZSwicm9sZSI6MiwidmVoaWNsZV9pZCI6IjEyIn0=', '2020-07-13 08:01:38.860815');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.managerapp_addcategory
CREATE TABLE IF NOT EXISTS `managerapp_addcategory` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_type` varchar(200) NOT NULL,
  `isactive` tinyint(1) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.managerapp_addcategory: ~3 rows (approximately)
/*!40000 ALTER TABLE `managerapp_addcategory` DISABLE KEYS */;
INSERT INTO `managerapp_addcategory` (`category_id`, `category_type`, `isactive`) VALUES
	(1, 'Cars', 0),
	(2, 'Scooters', 0),
	(3, 'Bikes', 0);
/*!40000 ALTER TABLE `managerapp_addcategory` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.managerapp_availablecities
CREATE TABLE IF NOT EXISTS `managerapp_availablecities` (
  `cityid` int NOT NULL AUTO_INCREMENT,
  `availablecity` varchar(200) NOT NULL,
  PRIMARY KEY (`cityid`),
  UNIQUE KEY `availablecity` (`availablecity`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.managerapp_availablecities: ~5 rows (approximately)
/*!40000 ALTER TABLE `managerapp_availablecities` DISABLE KEYS */;
INSERT INTO `managerapp_availablecities` (`cityid`, `availablecity`) VALUES
	(7, 'Ahmedabad'),
	(6, 'Chandigarh'),
	(8, 'Hyderabad'),
	(9, 'Mumbai'),
	(5, 'Pune');
/*!40000 ALTER TABLE `managerapp_availablecities` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.managerapp_bookingdetails
CREATE TABLE IF NOT EXISTS `managerapp_bookingdetails` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `refunded` tinyint(1) NOT NULL,
  `invoice` varchar(200) NOT NULL,
  `booking_date` varchar(200) NOT NULL,
  `seller_detail` varchar(200) NOT NULL,
  `vehicle_detail` varchar(200) NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `end_date` varchar(200) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_returned` tinyint(1) NOT NULL,
  `security_amount` varchar(200) NOT NULL,
  `is_fine` tinyint(1) NOT NULL,
  `fine_amount` varchar(200) NOT NULL,
  `extension` varchar(200) NOT NULL,
  `ext_amount` varchar(200) NOT NULL,
  `damage_amount` varchar(200) NOT NULL,
  `total_fine` varchar(200) NOT NULL,
  `amount_exp` varchar(200) NOT NULL,
  `total` varchar(200) NOT NULL,
  `balance_amount` varchar(200) NOT NULL,
  `earnings` varchar(200) NOT NULL,
  `cancel_token` varchar(200) NOT NULL,
  `cancellation_time` varchar(200) NOT NULL,
  `return_date` varchar(200) NOT NULL,
  `city` varchar(200) DEFAULT NULL,
  `email_id` varchar(200) NOT NULL,
  `vehicle_id_id` int NOT NULL,
  PRIMARY KEY (`booking_id`),
  UNIQUE KEY `invoice` (`invoice`),
  KEY `managerapp_bookingde_vehicle_id_id_65ad8ce7_fk_managerap` (`vehicle_id_id`),
  KEY `managerapp_bookingde_email_id_f6e43bfc_fk_userapp_u` (`email_id`),
  CONSTRAINT `managerapp_bookingde_email_id_f6e43bfc_fk_userapp_u` FOREIGN KEY (`email_id`) REFERENCES `userapp_userinfo` (`email`),
  CONSTRAINT `managerapp_bookingde_vehicle_id_id_65ad8ce7_fk_managerap` FOREIGN KEY (`vehicle_id_id`) REFERENCES `managerapp_vehicleinfo` (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.managerapp_bookingdetails: ~0 rows (approximately)
/*!40000 ALTER TABLE `managerapp_bookingdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `managerapp_bookingdetails` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.managerapp_bookingdetails2
CREATE TABLE IF NOT EXISTS `managerapp_bookingdetails2` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `refunded` tinyint(1) NOT NULL,
  `invoice` varchar(200) NOT NULL,
  `booking_date` varchar(200) NOT NULL,
  `seller_detail` varchar(200) NOT NULL,
  `vehicle_detail` varchar(200) NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `end_date` varchar(200) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_returned` tinyint(1) NOT NULL,
  `security_amount` varchar(200) NOT NULL,
  `is_fine` tinyint(1) NOT NULL,
  `fine_amount` varchar(200) NOT NULL,
  `extension` varchar(200) NOT NULL,
  `ext_amount` varchar(200) NOT NULL,
  `damage_amount` varchar(200) NOT NULL,
  `total_fine` varchar(200) NOT NULL,
  `amount_exp` varchar(200) NOT NULL,
  `total` varchar(200) NOT NULL,
  `balance_amount` varchar(200) NOT NULL,
  `earnings` varchar(200) NOT NULL,
  `cancel_token` varchar(200) NOT NULL,
  `cancellation_time` varchar(200) NOT NULL,
  `return_date` varchar(200) NOT NULL,
  `city` varchar(200) DEFAULT NULL,
  `email_id` varchar(200) NOT NULL,
  `vehicle_id_id` int NOT NULL,
  PRIMARY KEY (`booking_id`),
  UNIQUE KEY `invoice` (`invoice`),
  KEY `managerapp_bookingde_vehicle_id_id_8166a467_fk_managerap` (`vehicle_id_id`),
  KEY `managerapp_bookingde_email_id_39e7b51a_fk_userapp_u` (`email_id`),
  CONSTRAINT `managerapp_bookingde_email_id_39e7b51a_fk_userapp_u` FOREIGN KEY (`email_id`) REFERENCES `userapp_userinfo` (`email`),
  CONSTRAINT `managerapp_bookingde_vehicle_id_id_8166a467_fk_managerap` FOREIGN KEY (`vehicle_id_id`) REFERENCES `managerapp_vehicleinfo` (`vehicle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.managerapp_bookingdetails2: ~18 rows (approximately)
/*!40000 ALTER TABLE `managerapp_bookingdetails2` DISABLE KEYS */;
INSERT INTO `managerapp_bookingdetails2` (`booking_id`, `refunded`, `invoice`, `booking_date`, `seller_detail`, `vehicle_detail`, `start_date`, `end_date`, `is_active`, `is_returned`, `security_amount`, `is_fine`, `fine_amount`, `extension`, `ext_amount`, `damage_amount`, `total_fine`, `amount_exp`, `total`, `balance_amount`, `earnings`, `cancel_token`, `cancellation_time`, `return_date`, `city`, `email_id`, `vehicle_id_id`) VALUES
	(1, 0, '4393Burgma', '2020-06-28', 'vermashanaya1234@gmail.com', '', '06/28/2020 11:30 AM', '06/30/2020 11:30 AM', 0, 1, '10000', 0, '', '-2 days, 3:22:00', '0', '2000', '0', '4800', '14800', '8000', '6800', '', '', '06/28/2020 14:52 PM', '7', 'vermashanaya1234@gmail.com', 3),
	(2, 0, '2412Merced', '2020-06-28', 'vermashanaya1234@gmail.com', '', '06/28/2020 12:33 PM', '06/29/2020 12:33 PM', 0, 1, '', 0, '0', '0', '0', '0', '0', '96000', '0', '10000', '0', '74722', '06/28/2020 12:42 PM', '', '6', 'guptadivya4381@gmail.com', 8),
	(3, 0, '2856Scooty', '2020-06-28', 'vermashanaya1234@gmail.com', '', '06/28/2020 1:13 PM', '06/29/2020 1:13 PM', 0, 1, '', 0, '0', '0', '0', '0', '0', '1440', '0', '10000', '0', '73243', '06/28/2020 14:29 PM', '', '7', 'guptadivya4381@gmail.com', 2),
	(4, 0, '3998Scooty', '2020-06-28', 'vermashanaya1234@gmail.com', '', '06/28/2020 1:24 PM', '06/28/2020 2:24 PM', 0, 1, '10000', 0, '', '12:32:00', '3000', '1000', '4000', '60', '10060', '6000', '4060', '', '', '06/28/2020 14:56 PM', '6', 'vermashanaya1234@gmail.com', 2),
	(5, 0, '6730Land R', '2020-06-28', 'vermashanaya1234@gmail.com', '', '06/28/2020 2:29 PM', '06/29/2020 2:29 PM', 0, 1, '10000', 0, '', '-1 day, 12:15:00', '0', '500', '0', '192000', '202000', '9500', '192500', '', '', '06/28/2020 14:44 PM', '9', 'guptadivya4381@gmail.com', 11),
	(6, 0, '1783BMW S ', '2020-06-28', 'vermashanaya1234@gmail.com', '', '06/28/2020 3:07 PM', '06/29/2020 3:07 PM', 0, 1, '', 0, '0', '0', '0', '0', '0', '48000', '0', '10000', '0', '24696', '06/28/2020 15:07 PM', '', '7', 'guptadivya4381@gmail.com', 18),
	(7, 0, '1825Scooty', '2020-06-28', 'vermashanaya1234@gmail.com', '', '06/28/2020 9:54 PM', '06/29/2020 9:54 PM', 1, 1, '', 0, '0', '0', '0', '0', '0', '1440', '0', '10000', '0', '79127', '06/28/2020 22:31 PM', '', '6', 'guptadivya4381@gmail.com', 2),
	(8, 0, '7521Scooty', '2020-06-28', 'vermashanaya1234@gmail.com', '', '06/28/2020 10:00 PM', '06/29/2020 10:00 PM', 1, 1, '', 0, '0', '0', '0', '0', '0', '1440', '0', '10000', '0', '14308', '06/28/2020 22:34 PM', '', '7', 'vermashanaya1234@gmail.com', 2),
	(9, 0, '1582Scooty', '2020-06-28', 'vermashanaya1234@gmail.com', '', '06/28/2020 10:32 PM', '06/29/2020 10:32 PM', 0, 0, '10000', 0, '', '', '', '', '', '1440', '11440', '', '', '', '', '', '7', 'vermashanaya1234@gmail.com', 2),
	(13, 0, '7101Burgma', '2020-06-29', 'vermashanaya1234@gmail.com', '', '06/29/2020 12:52 PM', '06/30/2020 12:52 PM', 1, 0, '10000', 0, '', '', '', '', '', '2400', '12400', '', '', '', '', '', '6', 'guptadivya4381@gmail.com', 3),
	(14, 0, '5059Bajaj ', '2020-06-29', 'vermashanaya1234@gmail.com', '', '06/29/2020 12:56 PM', '06/30/2020 12:56 PM', 0, 1, '', 0, '0', '0', '0', '0', '0', '1800', '0', '10000', '0', '252614', '06/29/2020 13:00 PM', '', '7', 'guptadivya4381@gmail.com', 7),
	(15, 0, '7409Bajaj ', '2020-06-29', 'vermashanaya1234@gmail.com', '', '06/29/2020 1:00 PM', '06/30/2020 1:01 PM', 0, 1, '10000', 0, '', '-1 day, 12:07:00', '0', '2000', '0', '1800', '11800', '8000', '3800', '', '', '06/29/2020 13:08 PM', '8', 'guptadivya4381@gmail.com', 7),
	(16, 0, '5952Hero P', '2020-06-29', 'vermashanaya1234@gmail.com', '', '06/29/2020 1:03 PM', '06/23/2020 1:03 PM', 0, 1, '10000', 0, '', '6 days, 12:05:00', '39000', '2000', '41000', '-10800', '-800', '-31000', '30200', '', '', '06/29/2020 13:08 PM', '6', 'guptadivya4381@gmail.com', 14),
	(17, 0, '2006Maruti', '2020-06-29', 'vermashanaya1234@gmail.com', '', '06/29/2020 1:08 PM', '06/30/2020 1:08 PM', 0, 1, '10000', 0, '', '-1 day, 12:17:00', '0', '500', '0', '3600', '13600', '9500', '4100', '', '', '06/29/2020 13:25 PM', '7', 'guptadivya4381@gmail.com', 25),
	(18, 0, '1657Maruti', '2020-06-29', 'vermashanaya1234@gmail.com', '', '06/29/2020 1:15 PM', '06/30/2020 1:15 PM', 0, 1, '', 0, '0', '0', '0', '0', '0', '3600', '0', '10000', '0', '346918', '06/29/2020 13:25 PM', '', '6', 'guptadivya4381@gmail.com', 25),
	(19, 0, '8164Toyota', '2020-06-29', 'vermashanaya1234@gmail.com', '', '06/29/2020 1:18 PM', '06/30/2020 1:18 PM', 1, 0, '10000', 0, '', '', '', '', '', '84000', '94000', '', '', '', '', '', '6', 'vermashanaya1234@gmail.com', 9),
	(20, 0, '6620Honda ', '2020-06-29', 'vermashanaya1234@gmail.com', '', '06/29/2020 1:22 PM', '06/30/2020 1:22 PM', 1, 0, '10000', 0, '', '', '', '', '', '2400', '12400', '', '', '', '', '', '6', 'vermashanaya1234@gmail.com', 1),
	(21, 0, '4751Indian', '2020-06-29', 'vermashanaya1234@gmail.com', '', '06/29/2020 1:31 PM', '06/30/2020 1:31 PM', 0, 1, '10000', 0, '', '-1 day, 12:07:00', '0', '1000', '0', '72000', '82000', '9000', '73000', '', '', '06/29/2020 13:38 PM', '7', 'guptadivya4381@gmail.com', 12);
/*!40000 ALTER TABLE `managerapp_bookingdetails2` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.managerapp_city
CREATE TABLE IF NOT EXISTS `managerapp_city` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(200) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.managerapp_city: ~0 rows (approximately)
/*!40000 ALTER TABLE `managerapp_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `managerapp_city` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.managerapp_feedbackform
CREATE TABLE IF NOT EXISTS `managerapp_feedbackform` (
  `feedname` varchar(200) NOT NULL,
  `feedemail` varchar(200) NOT NULL,
  `feedmessage` varchar(200) NOT NULL,
  PRIMARY KEY (`feedemail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.managerapp_feedbackform: ~0 rows (approximately)
/*!40000 ALTER TABLE `managerapp_feedbackform` DISABLE KEYS */;
/*!40000 ALTER TABLE `managerapp_feedbackform` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.managerapp_login_details
CREATE TABLE IF NOT EXISTS `managerapp_login_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login_id` varchar(200) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `login_time` varchar(200) NOT NULL,
  `logout_time` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.managerapp_login_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `managerapp_login_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `managerapp_login_details` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.managerapp_payment_token
CREATE TABLE IF NOT EXISTS `managerapp_payment_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token_id` varchar(200) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `token` varchar(200) NOT NULL,
  `invoice` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice` (`invoice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.managerapp_payment_token: ~0 rows (approximately)
/*!40000 ALTER TABLE `managerapp_payment_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `managerapp_payment_token` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.managerapp_subcategory
CREATE TABLE IF NOT EXISTS `managerapp_subcategory` (
  `subcat_type` varchar(200) NOT NULL,
  `subcat_id` int NOT NULL AUTO_INCREMENT,
  `category_id_id` int NOT NULL,
  PRIMARY KEY (`subcat_id`),
  KEY `managerapp_subcatego_category_id_id_db4e96df_fk_managerap` (`category_id_id`),
  CONSTRAINT `managerapp_subcatego_category_id_id_db4e96df_fk_managerap` FOREIGN KEY (`category_id_id`) REFERENCES `managerapp_addcategory` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.managerapp_subcategory: ~10 rows (approximately)
/*!40000 ALTER TABLE `managerapp_subcategory` DISABLE KEYS */;
INSERT INTO `managerapp_subcategory` (`subcat_type`, `subcat_id`, `category_id_id`) VALUES
	('Luxary', 2, 1),
	('Sedan', 3, 1),
	('Sports', 4, 1),
	('SUV', 5, 1),
	('Hatchback', 6, 1),
	('Heavy-weight', 8, 2),
	('Cruiser', 9, 3),
	('Standard', 10, 3),
	('Sports ', 11, 3),
	('Light-weight', 12, 2);
/*!40000 ALTER TABLE `managerapp_subcategory` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.managerapp_vehicleinfo
CREATE TABLE IF NOT EXISTS `managerapp_vehicleinfo` (
  `vehicle_id` int NOT NULL AUTO_INCREMENT,
  `vehicle_name` varchar(200) NOT NULL,
  `vehicle_image1` varchar(200) NOT NULL,
  `vehicle_image2` varchar(200) DEFAULT NULL,
  `vehicle_image3` varchar(200) DEFAULT NULL,
  `price` varchar(200) NOT NULL,
  `isactive` tinyint(1) NOT NULL,
  `vehicle_description` varchar(300) NOT NULL,
  `vehicle_model` varchar(200) NOT NULL,
  `abs` varchar(200) NOT NULL,
  `airbags` varchar(200) NOT NULL,
  `seats` varchar(200) NOT NULL,
  `transmission` varchar(200) NOT NULL,
  `city` varchar(200) DEFAULT NULL,
  `company_id_id` int NOT NULL,
  `roleid_id` varchar(200) NOT NULL,
  `subcat_id_id` int NOT NULL,
  PRIMARY KEY (`vehicle_id`),
  KEY `managerapp_vehiclein_company_id_id_7ea20543_fk_businessa` (`company_id_id`),
  KEY `managerapp_vehiclein_roleid_id_7271a4d3_fk_userapp_u` (`roleid_id`),
  KEY `managerapp_vehiclein_subcat_id_id_7d7c1da9_fk_managerap` (`subcat_id_id`),
  CONSTRAINT `managerapp_vehiclein_company_id_id_7ea20543_fk_businessa` FOREIGN KEY (`company_id_id`) REFERENCES `businessapp_vehiclecompany` (`company_id`),
  CONSTRAINT `managerapp_vehiclein_roleid_id_7271a4d3_fk_userapp_u` FOREIGN KEY (`roleid_id`) REFERENCES `userapp_userinfo` (`email`),
  CONSTRAINT `managerapp_vehiclein_subcat_id_id_7d7c1da9_fk_managerap` FOREIGN KEY (`subcat_id_id`) REFERENCES `managerapp_subcategory` (`subcat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.managerapp_vehicleinfo: ~28 rows (approximately)
/*!40000 ALTER TABLE `managerapp_vehicleinfo` DISABLE KEYS */;
INSERT INTO `managerapp_vehicleinfo` (`vehicle_id`, `vehicle_name`, `vehicle_image1`, `vehicle_image2`, `vehicle_image3`, `price`, `isactive`, `vehicle_description`, `vehicle_model`, `abs`, `airbags`, `seats`, `transmission`, `city`, `company_id_id`, `roleid_id`, `subcat_id_id`) VALUES
	(1, 'Honda Activa ', '41074_Honda_Activa_2018_5G_02.JPG', '2014-511008-volkswagen-polo-gti-live-in-paris1new_9zpkpCd.jpg', '41076_Honda_Activa_2018_5G_03_YPxoTvW.JPG', '100', 1, 'Activa', 'Honda Activa 5G STD', '0', '0', '2', '3', '0', 1, 'vermashanaya1234@gmail.com', 8),
	(2, 'Scooty Zest ', '20094_01.JPG', '20092_03_ecIPWay.JPG', '20096_02.JPG', '60', 1, 'Scooty Zest', 'Scooty Zest 110 Himalayan Highs - SBT', '0', '0', '2', '3', '0', 2, 'vermashanaya1234@gmail.com', 12),
	(3, 'Burgman Street ', 'lest-side-view-1609029832_930x620.jpg', 'right-side-view-64742356_930x620.jpg', 'lest-side-view-1609029832_930x620.jpg', '100', 1, 'Burgman Street', 'Suzuki Burgman Street 125', '0', '0', '2', '3', '0', 4, 'vermashanaya1234@gmail.com', 8),
	(4, 'Hero Pleasure', 'lest-side-view-1741181671_930x620.jpg', 'rear-left-view-1103332590_930x620.jpg', '20096_02.JPG', '50', 1, 'Pleasure', 'Hero Pleasure Self Start Drum Brake', '0', '0', '2', '1', '0', 3, 'vermashanaya1234@gmail.com', 12),
	(5, 'Yamaha Fascino', 'yamah_fascino-front.jpg', 'yamah_fascino-fronto-side-image.jpg', 'yamah_fascino-rear-profile.jpg', '100', 1, 'Yamaha Fascino', ' Yamaha Fascino Dark night Edition', '0', '0', '2', '1', '0', 5, 'vermashanaya1234@gmail.com', 8),
	(6, 'TVS Victor ', '28205_victormain.jpg', '28285__MG_6909.JPG', '28265__MG_6900.JPG', '75', 1, 'Victor', 'Victor Disc - SBT', '0', '0', '2', '2', '0', 2, 'vermashanaya1234@gmail.com', 10),
	(7, 'Bajaj V15', '29017_BajajV15_010.JPG', '29011_BajajV15_006.JPG', '29007_BajajV15_005.JPG', '75', 1, 'Bajaj V15', 'Bajaj V15 Standard', '0', '0', '2', '2', '0', 7, 'vermashanaya1234@gmail.com', 10),
	(8, 'Mercedes-Benz CLA ', '1920px-Mercedes-Benz_CLA_200_(C_117)_–_Frontansicht,_13._April_2013,_Düsseldorf.jpg', '1920px-Mercedes-Benz_GtLqNKM.jpg', 'Mercedes-Benz_CLA_200_(C_117)_–_Heckansicht,_13._April_2013,_Düsseldorf_WPOxKFc_411IFc8.jpg', '4000', 1, 'Mercedes-Benz C-Class', 'Mercedes-Benz CLA 200D', '1', '1', '4', '1', '0', 8, 'vermashanaya1234@gmail.com', 2),
	(9, 'Toyota Fortuner ', '32009_Toyota-Fortuner-2016_032.JPG', '32013_Toyota-Fortuner-2016_009.JPG', '32017_Toyota-Fortuner-2016_011_z84M1ST.JPG', '3500', 1, 'Toyota Fortuner', 'Toyota Fortuner 2.8 4x4 AT', '1', '1', '7', '1', '0', 9, 'vermashanaya1234@gmail.com', 5),
	(10, 'KTM 200 Duke ', '33411_Ktm_duke_2002017_007_S1mkJl3.JPG', '33409_Ktm_duke_2002017_006.JPG', '33413_Ktm_duke_2002017_008.JPG', '300', 1, 'KTM 200 Duke', 'KTM 200 Duke BS6', '2', '0', '2', '2', '0', 10, 'vermashanaya1234@gmail.com', 11),
	(11, 'Land Rover Discovery', '40058_Land_Rover_Discovery_2017--026.JPG', '40061_Land_Rover_Discovery_2017--062.JPG', '40059_Land_Rover_Discovery_2017--059.JPG', '8000', 1, 'Land Rover Discovery SE 2.0 SD4', 'Land Rover Discovery SE 2.0 SD4', '1', '1', '7', '1', '0', 11, 'vermashanaya1234@gmail.com', 5),
	(12, 'Indian Chieftain Dark Horse', '35149_Indian_Chieftain_Dark_Horse-008.JPG', '35153_Indian_Chieftain_Dark_Horse-006.JPG', '35151_Indian_Chieftain_Dark_Horse-007.JPG', '3000', 1, 'Indian Chieftain Dark Horse', 'Indian Chieftain Dark Horse STD', '2', '0', '1', '2', '0', 12, 'vermashanaya1234@gmail.com', 9),
	(13, 'Maruti S-Cross', '38813_Maruti_Scross-001.jpg', '38811_Maruti_Scross-018.jpg', '38815_Maruti_Scross-002.jpg', '800', 1, 'Delta', 'Maruti S-Cross Delta', '1', '1', '5', '2', '0', 13, 'vermashanaya1234@gmail.com', 6),
	(14, 'Hero Passion ', '40020_Hero-Passion-Xpro-i3s--009.JPG', '40024_Hero-Passion-Xpro-i3s--013.JPG', '40022_Hero-Passion-Xpro-i3s--011.JPG', '75', 1, 'Hero Passion Pro i3S Self Start Drum Brake Alloy Wheel BS VI', 'Hero Passion Pro i3S Self Start Drum Brake Alloy Wheel BS VI', '0', '0', '2', '2', '0', 3, 'vermashanaya1234@gmail.com', 10),
	(15, 'Harley Davidson Deluze ', '41004_Harley-Davidson_Deluxe_8.jpg', '45224_Harley-Davidson_Deluxe2018_009.JPG', '41003_Harley-Davidson_Deluxe_7.jpg', '2000', 1, 'Harley Davidson Deluze ', 'Harley Davidson Deluze Standard', '2', '0', '2', '2', '0', 14, 'vermashanaya1234@gmail.com', 9),
	(16, 'Yamaha R15', '43177__ANI8066.JPG', '43180__ANI8076.JPG', '43207__ANI8023_YVaJoJ1.JPG', '1000', 1, 'Yamaha YZF R15 V3 ', 'Yamaha YZF R15 V3 ', '1', '0', '2', '2', '0', 5, 'vermashanaya1234@gmail.com', 11),
	(17, 'Ducati Multistrada ', '47603_2019_Ducati_Multistrada_1260_Enduro_3.jpg', '47597_2019_Ducati_Multistrada_1260_Enduro_1_Uez1EuI.jpg', '47603_2019_Ducati_Multistrada_1260_Enduro_3.jpg', '1800', 1, 'Ducati Multistrada 1260 Enduro', 'Ducati Multistrada 1260 Enduro', '1', '0', '2', '2', '0', 15, 'vermashanaya1234@gmail.com', 11),
	(18, 'BMW S 1000 ', '52784_BMWS1000RR_014_jk.jpg', '52787_BMWS1000RR_006_jk_smXB117_3XzWUq2.jpg', '52790_P90327373_highRes_bmw-s-1000-rr-instru_oz7kUgf.jpg', '2000', 1, 'BMW S 1000 RR STD', 'BMW S 1000 RR STD', '0', '0', '2', '2', '0', 16, 'vermashanaya1234@gmail.com', 11),
	(19, 'Ford Endeavour', '50450_Ford-Endeavour_001.jpg', '50453_Ford-Endeavour_002.jpg', '50459_Ford-Endeavour_004.jpg', '3000', 1, 'Ford Endeavour', 'Ford Endeavour Titanium 4X2 AT', '1', '1', '7', '1', '0', 17, 'vermashanaya1234@gmail.com', 5),
	(20, 'Maruti Swift', '40211__Maruti_Suzuki_Swift--022.JPG', '40212_Maruti_Suzuki_Swift--019.JPG', '40213__Maruti_Suzuki_Swift--016.JPG', '500', 1, 'Maruti Swift', 'Maruti Swift LXI', '1', '1', '5', '1', '0', 13, 'vermashanaya1234@gmail.com', 6),
	(21, 'Hyundai Verna', 'verna.jpg', 'verna3_4yOmfG2.jpg', 'verna2.jpg', '900', 1, 'Verna S 1.5 VTVT ', 'Hyundai Verna  S 1.5 VTVT ', '1', '1', '5', '1', '0', 18, 'vermashanaya1234@gmail.com', 3),
	(22, 'Hyundai Grand i10', 'i10.jpg', 'i10_2_VKGZPJP.jpg', 'i10_1_weurwwv.jpg', '250', 1, 'Hyundai Grand i10', 'Hyundai Grand i10 Magna 1.2 Kappa VTVT', '0', '0', '5', '2', '0', 18, 'vermashanaya1234@gmail.com', 6),
	(23, 'Honda City', 'honda-city-e34af6de-1024x768_S2HvE5k.JPG', 'honda-city-f78dfeaa-1024x768_ztrQnZ9.JPG', 'honda-city-98be7cfe-1024x768.JPG', '800', 1, 'Honda City', 'Honda City', '1', '1', '5', '1', '0', 1, 'vermashanaya1234@gmail.com', 3),
	(24, 'Hyundai Venue', '52202_Hyundai_Venue_2019_025.JPG', '52205_Hyundai_Venue_2019_027.JPG', '52199_Hyundai_Venue_2019_026.JPG', '700', 1, 'Hyundai Venu', 'Hyundai Venu', '1', '1', '5', '1', '0', 18, 'vermashanaya1234@gmail.com', 5),
	(25, 'Maruti Suzuki Alto K10', 'Maruti-Suzuki-Alto-K10-Left-Front-Three-Quarter-31870.jpg', 'Maruti-Suzuki-Alto-K10-Right-Front-Three-Quarter-31869_ol.jpg', 'Maruti-Suzuki-Alto-K10-Right-Rear-Three-Quarter-31871.jpg', '150', 1, 'Maruti Suzuki Alto K10', 'Maruti Suzuki Alto K10 AMT', '0', '0', '5', '2', '0', 13, 'vermashanaya1234@gmail.com', 6),
	(26, 'Ford Aspire', 'ford-aspire-4f23ef09-1024x768.jpg', 'ford-aspire-1326620e-1024x768.jpg', 'ford-aspire-c2af5ee6-1024x768_W21Tdfx.jpg', '500', 1, 'Ford Aspire', 'Ford Aspire', '1', '1', '5', '2', '0', 17, 'vermashanaya1234@gmail.com', 3),
	(27, 'Jaguar F-TYPE', 'jaguar3_02cxKIU.jpg', 'jaguar1.jpg', 'jaguar2.jpg', '10000', 1, 'Jaguar F-TYPE', 'Jaguar F-TYPE 2.0 l Coupe', '1', '1', '2', '1', '0', 19, 'vermashanaya1234@gmail.com', 4),
	(29, 'Tata Nano', 'tata-nano-front-profile-1530772026.jpg', 'tata-nano_827x510_41515572453.jpg', 'e8e06844a93076641edd5ecc3e3d28eb.jpg', '100', 0, 'Tata Nano', 'Tata Nano XE', '0', '0', '4', '1', '0', 20, 'rsameera4381@gmail.com', 6);
/*!40000 ALTER TABLE `managerapp_vehicleinfo` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.paypal_ipn
CREATE TABLE IF NOT EXISTS `paypal_ipn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `business` varchar(127) NOT NULL,
  `charset` varchar(255) NOT NULL,
  `custom` varchar(256) NOT NULL,
  `notify_version` decimal(64,2) DEFAULT NULL,
  `parent_txn_id` varchar(19) NOT NULL,
  `receiver_email` varchar(254) NOT NULL,
  `receiver_id` varchar(255) NOT NULL,
  `residence_country` varchar(2) NOT NULL,
  `test_ipn` tinyint(1) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `txn_type` varchar(255) NOT NULL,
  `verify_sign` varchar(255) NOT NULL,
  `address_country` varchar(64) NOT NULL,
  `address_city` varchar(40) NOT NULL,
  `address_country_code` varchar(64) NOT NULL,
  `address_name` varchar(128) NOT NULL,
  `address_state` varchar(40) NOT NULL,
  `address_status` varchar(255) NOT NULL,
  `address_street` varchar(200) NOT NULL,
  `address_zip` varchar(20) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `payer_business_name` varchar(127) NOT NULL,
  `payer_email` varchar(127) NOT NULL,
  `payer_id` varchar(13) NOT NULL,
  `auth_amount` decimal(64,2) DEFAULT NULL,
  `auth_exp` varchar(28) NOT NULL,
  `auth_id` varchar(19) NOT NULL,
  `auth_status` varchar(255) NOT NULL,
  `exchange_rate` decimal(64,16) DEFAULT NULL,
  `invoice` varchar(127) NOT NULL,
  `item_name` varchar(127) NOT NULL,
  `item_number` varchar(127) NOT NULL,
  `mc_currency` varchar(32) NOT NULL,
  `mc_fee` decimal(64,2) DEFAULT NULL,
  `mc_gross` decimal(64,2) DEFAULT NULL,
  `mc_handling` decimal(64,2) DEFAULT NULL,
  `mc_shipping` decimal(64,2) DEFAULT NULL,
  `memo` varchar(255) NOT NULL,
  `num_cart_items` int DEFAULT NULL,
  `option_name1` varchar(64) NOT NULL,
  `option_name2` varchar(64) NOT NULL,
  `payer_status` varchar(255) NOT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_gross` decimal(64,2) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `pending_reason` varchar(255) NOT NULL,
  `protection_eligibility` varchar(255) NOT NULL,
  `quantity` int DEFAULT NULL,
  `reason_code` varchar(255) NOT NULL,
  `remaining_settle` decimal(64,2) DEFAULT NULL,
  `settle_amount` decimal(64,2) DEFAULT NULL,
  `settle_currency` varchar(32) NOT NULL,
  `shipping` decimal(64,2) DEFAULT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `tax` decimal(64,2) DEFAULT NULL,
  `transaction_entity` varchar(255) NOT NULL,
  `auction_buyer_id` varchar(64) NOT NULL,
  `auction_closing_date` datetime(6) DEFAULT NULL,
  `auction_multi_item` int DEFAULT NULL,
  `for_auction` decimal(64,2) DEFAULT NULL,
  `amount` decimal(64,2) DEFAULT NULL,
  `amount_per_cycle` decimal(64,2) DEFAULT NULL,
  `initial_payment_amount` decimal(64,2) DEFAULT NULL,
  `next_payment_date` datetime(6) DEFAULT NULL,
  `outstanding_balance` decimal(64,2) DEFAULT NULL,
  `payment_cycle` varchar(255) NOT NULL,
  `period_type` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `profile_status` varchar(255) NOT NULL,
  `recurring_payment_id` varchar(255) NOT NULL,
  `rp_invoice_id` varchar(127) NOT NULL,
  `time_created` datetime(6) DEFAULT NULL,
  `amount1` decimal(64,2) DEFAULT NULL,
  `amount2` decimal(64,2) DEFAULT NULL,
  `amount3` decimal(64,2) DEFAULT NULL,
  `mc_amount1` decimal(64,2) DEFAULT NULL,
  `mc_amount2` decimal(64,2) DEFAULT NULL,
  `mc_amount3` decimal(64,2) DEFAULT NULL,
  `password` varchar(24) NOT NULL,
  `period1` varchar(255) NOT NULL,
  `period2` varchar(255) NOT NULL,
  `period3` varchar(255) NOT NULL,
  `reattempt` varchar(1) NOT NULL,
  `recur_times` int DEFAULT NULL,
  `recurring` varchar(1) NOT NULL,
  `retry_at` datetime(6) DEFAULT NULL,
  `subscr_date` datetime(6) DEFAULT NULL,
  `subscr_effective` datetime(6) DEFAULT NULL,
  `subscr_id` varchar(19) NOT NULL,
  `username` varchar(64) NOT NULL,
  `case_creation_date` datetime(6) DEFAULT NULL,
  `case_id` varchar(255) NOT NULL,
  `case_type` varchar(255) NOT NULL,
  `receipt_id` varchar(255) NOT NULL,
  `currency_code` varchar(32) NOT NULL,
  `handling_amount` decimal(64,2) DEFAULT NULL,
  `transaction_subject` varchar(256) NOT NULL,
  `ipaddress` char(39) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL,
  `flag_code` varchar(16) NOT NULL,
  `flag_info` longtext NOT NULL,
  `query` longtext NOT NULL,
  `response` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `from_view` varchar(6) DEFAULT NULL,
  `mp_id` varchar(128) DEFAULT NULL,
  `option_selection1` varchar(200) NOT NULL,
  `option_selection2` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paypal_ipn_txn_id_8fa22c44` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.paypal_ipn: ~0 rows (approximately)
/*!40000 ALTER TABLE `paypal_ipn` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_ipn` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.social_auth_association
CREATE TABLE IF NOT EXISTS `social_auth_association` (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int NOT NULL,
  `lifetime` int NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.social_auth_association: ~0 rows (approximately)
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.social_auth_code
CREATE TABLE IF NOT EXISTS `social_auth_code` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.social_auth_code: ~0 rows (approximately)
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.social_auth_nonce
CREATE TABLE IF NOT EXISTS `social_auth_nonce` (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.social_auth_nonce: ~0 rows (approximately)
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.social_auth_partial
CREATE TABLE IF NOT EXISTS `social_auth_partial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `next_step` smallint unsigned NOT NULL,
  `backend` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`),
  CONSTRAINT `social_auth_partial_chk_1` CHECK ((`next_step` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.social_auth_partial: ~0 rows (approximately)
/*!40000 ALTER TABLE `social_auth_partial` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_partial` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.social_auth_usersocialauth
CREATE TABLE IF NOT EXISTS `social_auth_usersocialauth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` (`user_id`),
  CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.social_auth_usersocialauth: ~0 rows (approximately)
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.userapp_document
CREATE TABLE IF NOT EXISTS `userapp_document` (
  `id` int NOT NULL AUTO_INCREMENT,
  `license` varchar(200) NOT NULL,
  `livephoto` varchar(200) NOT NULL,
  `secdocument` varchar(200) NOT NULL,
  `email_id` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userapp_document_email_id_a834dd38_fk_userapp_userinfo_email` (`email_id`),
  CONSTRAINT `userapp_document_email_id_a834dd38_fk_userapp_userinfo_email` FOREIGN KEY (`email_id`) REFERENCES `userapp_userinfo` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.userapp_document: ~0 rows (approximately)
/*!40000 ALTER TABLE `userapp_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `userapp_document` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.userapp_uploaddocument
CREATE TABLE IF NOT EXISTS `userapp_uploaddocument` (
  `id` int NOT NULL AUTO_INCREMENT,
  `license` varchar(200) NOT NULL,
  `livephoto` varchar(200) NOT NULL,
  `secdocument` varchar(200) NOT NULL,
  `license_no` varchar(200) NOT NULL,
  `secondary_name` varchar(200) NOT NULL,
  `secondary_id_no` varchar(200) NOT NULL,
  `email_id` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userapp_uploaddocume_email_id_9fe2ed8b_fk_userapp_u` (`email_id`),
  CONSTRAINT `userapp_uploaddocume_email_id_9fe2ed8b_fk_userapp_u` FOREIGN KEY (`email_id`) REFERENCES `userapp_userinfo` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.userapp_uploaddocument: ~0 rows (approximately)
/*!40000 ALTER TABLE `userapp_uploaddocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `userapp_uploaddocument` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.userapp_uploaduserdocument
CREATE TABLE IF NOT EXISTS `userapp_uploaduserdocument` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ulicense` varchar(200) NOT NULL,
  `ulivephoto` varchar(200) NOT NULL,
  `usecdocument` varchar(200) NOT NULL,
  `ulicense_no` varchar(200) NOT NULL,
  `usecondary_name` varchar(200) NOT NULL,
  `usecondary_id_no` varchar(200) NOT NULL,
  `uemail_id` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userapp_uploaduserdo_uemail_id_8f0173a0_fk_userapp_u` (`uemail_id`),
  CONSTRAINT `userapp_uploaduserdo_uemail_id_8f0173a0_fk_userapp_u` FOREIGN KEY (`uemail_id`) REFERENCES `userapp_userinfo` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.userapp_uploaduserdocument: ~51 rows (approximately)
/*!40000 ALTER TABLE `userapp_uploaduserdocument` DISABLE KEYS */;
INSERT INTO `userapp_uploaduserdocument` (`id`, `ulicense`, `ulivephoto`, `usecdocument`, `ulicense_no`, `usecondary_name`, `usecondary_id_no`, `uemail_id`) VALUES
	(1, '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_V4DGRxr.jpg', '0', '0', '12335545', '0', '0', 'vermashanaya1234@gmail.com'),
	(2, '', '0', '1113664.jpg', '', 'Pan Card', '454646', 'vermashanaya1234@gmail.com'),
	(3, '', 'index_WpkrTTZ.jfif', '', '', '', '', 'vermashanaya1234@gmail.com'),
	(4, '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_V4DGRxr_3wkiESc.jpg', '0', '0', '12131313', '0', '0', 'guptadivya4381@gmail.com'),
	(5, '', '0', '1113664_a0C9wH2.jpg', '', 'Pan Card', '464646', 'guptadivya4381@gmail.com'),
	(6, '', 'index_WpkrTTZ.jfif', '', '', '', '', 'guptadivya4381@gmail.com'),
	(7, '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_V4DGRxr_3wkiESc_Yp972L6.jpg', '0', '0', '5454654', '0', '0', 'vermashanaya1234@gmail.com'),
	(8, '', '0', 'Licence.png', '', 'Pan Card', '5468', 'vermashanaya1234@gmail.com'),
	(9, '', 'index_WpkrTTZ_ZpkQdZf.jfif', '', '', '', '', 'vermashanaya1234@gmail.com'),
	(10, '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_V4DGRxr_3wkiESc_Yp972L6.jpg', '0', '0', '1654156415', '0', '0', 'guptadivya4381@gmail.com'),
	(11, '', '0', '1113664_a0C9wH2.jpg', '', 'Pan Card', '6516514653', 'guptadivya4381@gmail.com'),
	(12, '', 'index_WpkrTTZ.jfif', '', '', '', '', 'guptadivya4381@gmail.com'),
	(13, '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk.jpg', '0', '0', '5468546546', '0', '0', 'guptadivya4381@gmail.com'),
	(14, '', '0', '1113664_a0C9wH2_7OiYA06.jpg', '', 'Pan Card', '546848', 'guptadivya4381@gmail.com'),
	(15, '', '20151113_144942_Roxy Rd.jpg', '', '', '', '', 'guptadivya4381@gmail.com'),
	(16, '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_2WyxnrX.jpg', '0', '0', '684684869', '0', '0', 'vermashanaya1234@gmail.com'),
	(17, '', '0', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj.jpg', '', 'vgv848', '5656', 'vermashanaya1234@gmail.com'),
	(18, '', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj.jpg', '', '', '', '', 'vermashanaya1234@gmail.com'),
	(19, '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_2WyxnrX_lFIUCDO.jpg', '0', '0', '6564', '0', '0', 'vermashanaya1234@gmail.com'),
	(20, '', '0', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_2WyxnrX_lFIUCDO_qggJLu8.jpg', '', '557', '4574', 'vermashanaya1234@gmail.com'),
	(21, '', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_EIop5bB.jpg', '', '', '', '', 'vermashanaya1234@gmail.com'),
	(22, '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_EIop5bB.jpg', '0', '0', '626546', '0', '0', 'guptadivya4381@gmail.com'),
	(23, '', '0', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_mU9R4Sk.jpg', '', 'bjh', '68695', 'guptadivya4381@gmail.com'),
	(24, '', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_mU9R4Sk_Nw58J4g.jpg', '', '', '', '', 'guptadivya4381@gmail.com'),
	(25, '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_mU9R4Sk.jpg', '0', '0', '54658486', '0', '0', 'guptadivya4381@gmail.com'),
	(26, '', '0', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_2WyxnrX_lFIUCDO.jpg', '', 'nkjn', '6554684', 'guptadivya4381@gmail.com'),
	(27, '', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9.jpg', '', '', '', '', 'guptadivya4381@gmail.com'),
	(28, '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9_hYCdbfm.jpg', '0', '0', '54685468', '0', '0', 'guptadivya4381@gmail.com'),
	(29, '', '0', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9_hYCdbfm.jpg', '', 'nbjb', '6546584', 'guptadivya4381@gmail.com'),
	(30, '', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9_hYCdbfm.jpg', '', '', '', '', 'guptadivya4381@gmail.com'),
	(31, '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9_hYCdbfm_33mzn4g.jpg', '0', '0', '', '0', '0', 'guptadivya4381@gmail.com'),
	(32, '', '0', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9.jpg', '', ' mn', '566', 'guptadivya4381@gmail.com'),
	(33, '', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9_hYCdbfm.jpg', '', '', '', '', 'guptadivya4381@gmail.com'),
	(34, '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9.jpg', '0', '0', '5465', '0', '0', 'guptadivya4381@gmail.com'),
	(35, '', '0', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9_Gi0JO5d.jpg', '', 'dfdf55454', '464', 'guptadivya4381@gmail.com'),
	(36, '', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9_Gi0JO5d.jpg', '', '', '', '', 'guptadivya4381@gmail.com'),
	(37, '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9_Gi0JO5d.jpg', '0', '0', '46546', '0', '0', 'guptadivya4381@gmail.com'),
	(38, '', '0', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9_Gi0JO5d.jpg', '', 'mknmk', '54884', 'guptadivya4381@gmail.com'),
	(39, '', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9_Gi0JO5d.jpg', '', '', '', '', 'guptadivya4381@gmail.com'),
	(40, '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9_Gi0JO5d.jpg', '0', '0', '454', '0', '0', 'guptadivya4381@gmail.com'),
	(41, '', '0', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9.jpg', '', 'knkk', '8787', 'guptadivya4381@gmail.com'),
	(42, '', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9.jpg', '', '', '', '', 'guptadivya4381@gmail.com'),
	(43, '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9_Gi0JO5d.jpg', '0', '0', '65464', '0', '0', 'vermashanaya1234@gmail.com'),
	(44, '', '0', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9_Gi0JO5d_5Z9fYEE.jpg', '', 'mn', '46654', 'vermashanaya1234@gmail.com'),
	(45, '', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9_Gi0JO5d_5Z9fYEE.jpg', '', '', '', '', 'vermashanaya1234@gmail.com'),
	(46, '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9_Gi0JO5d_5Z9fYEE.jpg', '0', '0', '8468', '0', '0', 'vermashanaya1234@gmail.com'),
	(47, '', '0', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9_Gi0JO5d_5Z9fYEE.jpg', '', 'mkm', '5353', 'vermashanaya1234@gmail.com'),
	(48, '', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9_Gi0JO5d_5Z9fYEE.jpg', '', '', '', '', 'vermashanaya1234@gmail.com'),
	(49, '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9_Gi0JO5d.jpg', '0', '0', '6565', '0', '0', 'guptadivya4381@gmail.com'),
	(50, '', '0', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9_Gi0JO5d.jpg', '', 'njnk', '656', 'guptadivya4381@gmail.com'),
	(51, '', '500_F_237701926_P4fkbpuUEBD2gFoT5xv2EaMVeBNkUXqk_beorZWj_lC5d6v9_Gi0JO5d.jpg', '', '', '', '', 'guptadivya4381@gmail.com');
/*!40000 ALTER TABLE `userapp_uploaduserdocument` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.userapp_userdocument
CREATE TABLE IF NOT EXISTS `userapp_userdocument` (
  `id` int NOT NULL AUTO_INCREMENT,
  `license` varchar(200) NOT NULL,
  `livephoto` varchar(200) NOT NULL,
  `secdocument` varchar(200) NOT NULL,
  `license_no` varchar(200) NOT NULL,
  `secondary_name` varchar(200) NOT NULL,
  `secondary_id_no` varchar(200) NOT NULL,
  `email_id` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userapp_userdocument_email_id_e4521af0_fk_userapp_userinfo_email` (`email_id`),
  CONSTRAINT `userapp_userdocument_email_id_e4521af0_fk_userapp_userinfo_email` FOREIGN KEY (`email_id`) REFERENCES `userapp_userinfo` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.userapp_userdocument: ~0 rows (approximately)
/*!40000 ALTER TABLE `userapp_userdocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `userapp_userdocument` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.userapp_userinfo
CREATE TABLE IF NOT EXISTS `userapp_userinfo` (
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mobile` bigint DEFAULT NULL,
  `city` varchar(200) NOT NULL,
  `address` varchar(400) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `otp` varchar(200) DEFAULT NULL,
  `token` varchar(200) DEFAULT NULL,
  `time` varchar(200) DEFAULT NULL,
  `password` varchar(200) NOT NULL,
  `vehicle_image1` varchar(200) DEFAULT NULL,
  `codriver` varchar(200) DEFAULT NULL,
  `dob` varchar(200) DEFAULT NULL,
  `gender` varchar(200) DEFAULT NULL,
  `roleid_id` int NOT NULL,
  PRIMARY KEY (`email`),
  KEY `userapp_userinfo_roleid_id_d4a17e5e_fk_userapp_userrole_roleid` (`roleid_id`),
  CONSTRAINT `userapp_userinfo_roleid_id_d4a17e5e_fk_userapp_userrole_roleid` FOREIGN KEY (`roleid_id`) REFERENCES `userapp_userrole` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.userapp_userinfo: ~4 rows (approximately)
/*!40000 ALTER TABLE `userapp_userinfo` DISABLE KEYS */;
INSERT INTO `userapp_userinfo` (`username`, `email`, `mobile`, `city`, `address`, `isActive`, `otp`, `token`, `time`, `password`, `vehicle_image1`, `codriver`, `dob`, `gender`, `roleid_id`) VALUES
	('daman', 'dkaur4381@gmail.com', NULL, '', '', 1, '760', 'dkaur858dam', '18:10:21.859356', 'pbkdf2_sha256$180000$VWyrWVCAwaeK$zYzMRPKn/6FxVmoizXk7raspWwqm07Vf1fxdqiI74vw=', NULL, NULL, NULL, NULL, 2),
	('divya', 'guptadivya4381@gmail.com', 9217613728, 'Sangrur', 'sangrur', 1, '248', 'gupta200div', '17:03:36.011781', 'pbkdf2_sha256$180000$ItbKUGf9HuYj$LXoll5lRHoXewNhGBmwbXF5hfOUa1l/E4hbD8RVfRbM=', 'image.jpg', 'daman@gamil.com', NULL, NULL, 2),
	('Sameera', 'rsameera4381@gmail.com', NULL, '', '', 1, '459', 'rsame991Sam', '17:41:31.945828', 'pbkdf2_sha256$180000$XngRQVT8aOih$tg9reDSnbtHN6vS6n+oGRuj2xOxUuF17CDJbRhwmFlg=', NULL, NULL, NULL, NULL, 3),
	('Daman', 'vermashanaya1234@gmail.com', NULL, '', '', 1, '', 'verma141Dam', '', 'pbkdf2_sha256$180000$uZpx77Hj9dUo$nl23L+FmXmogUx6uIEuAaFxjPKR0ojk06zZg+CatIAE=', NULL, NULL, NULL, NULL, 1);
/*!40000 ALTER TABLE `userapp_userinfo` ENABLE KEYS */;

-- Dumping structure for table vehicle_rental_db.userapp_userrole
CREATE TABLE IF NOT EXISTS `userapp_userrole` (
  `roleid` int NOT NULL AUTO_INCREMENT,
  `rolename` varchar(200) NOT NULL,
  PRIMARY KEY (`roleid`),
  UNIQUE KEY `rolename` (`rolename`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table vehicle_rental_db.userapp_userrole: ~3 rows (approximately)
/*!40000 ALTER TABLE `userapp_userrole` DISABLE KEYS */;
INSERT INTO `userapp_userrole` (`roleid`, `rolename`) VALUES
	(3, 'business'),
	(1, 'manager'),
	(2, 'user');
/*!40000 ALTER TABLE `userapp_userrole` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
ca_rentaldb2ca_rentaldb2car_rentaldb2ca_rentaldb2