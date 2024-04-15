-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2023 at 07:13 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loan_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

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
(25, 'Can add login', 7, 'add_login'),
(26, 'Can change login', 7, 'change_login'),
(27, 'Can delete login', 7, 'delete_login'),
(28, 'Can view login', 7, 'view_login'),
(29, 'Can add user_register', 8, 'add_user_register'),
(30, 'Can change user_register', 8, 'change_user_register'),
(31, 'Can delete user_register', 8, 'delete_user_register'),
(32, 'Can view user_register', 8, 'view_user_register'),
(33, 'Can add home_loan', 9, 'add_home_loan'),
(34, 'Can change home_loan', 9, 'change_home_loan'),
(35, 'Can delete home_loan', 9, 'delete_home_loan'),
(36, 'Can view home_loan', 9, 'view_home_loan'),
(37, 'Can add education_loan', 10, 'add_education_loan'),
(38, 'Can change education_loan', 10, 'change_education_loan'),
(39, 'Can delete education_loan', 10, 'delete_education_loan'),
(40, 'Can view education_loan', 10, 'view_education_loan'),
(41, 'Can add vehicle_loan', 11, 'add_vehicle_loan'),
(42, 'Can change vehicle_loan', 11, 'change_vehicle_loan'),
(43, 'Can delete vehicle_loan', 11, 'delete_vehicle_loan'),
(44, 'Can view vehicle_loan', 11, 'view_vehicle_loan'),
(45, 'Can add personal_loan', 12, 'add_personal_loan'),
(46, 'Can change personal_loan', 12, 'change_personal_loan'),
(47, 'Can delete personal_loan', 12, 'delete_personal_loan'),
(48, 'Can view personal_loan', 12, 'view_personal_loan'),
(49, 'Can add application_education_loan', 13, 'add_application_education_loan'),
(50, 'Can change application_education_loan', 13, 'change_application_education_loan'),
(51, 'Can delete application_education_loan', 13, 'delete_application_education_loan'),
(52, 'Can view application_education_loan', 13, 'view_application_education_loan'),
(53, 'Can add application_home_loan', 14, 'add_application_home_loan'),
(54, 'Can change application_home_loan', 14, 'change_application_home_loan'),
(55, 'Can delete application_home_loan', 14, 'delete_application_home_loan'),
(56, 'Can view application_home_loan', 14, 'view_application_home_loan'),
(57, 'Can add application_personal_loan', 15, 'add_application_personal_loan'),
(58, 'Can change application_personal_loan', 15, 'change_application_personal_loan'),
(59, 'Can delete application_personal_loan', 15, 'delete_application_personal_loan'),
(60, 'Can view application_personal_loan', 15, 'view_application_personal_loan'),
(61, 'Can add application_vehicle_loan', 16, 'add_application_vehicle_loan'),
(62, 'Can change application_vehicle_loan', 16, 'change_application_vehicle_loan'),
(63, 'Can delete application_vehicle_loan', 16, 'delete_application_vehicle_loan'),
(64, 'Can view application_vehicle_loan', 16, 'view_application_vehicle_loan'),
(65, 'Can add complaint', 17, 'add_complaint'),
(66, 'Can change complaint', 17, 'change_complaint'),
(67, 'Can delete complaint', 17, 'delete_complaint'),
(68, 'Can view complaint', 17, 'view_complaint'),
(69, 'Can add complaints', 17, 'add_complaints'),
(70, 'Can change complaints', 17, 'change_complaints'),
(71, 'Can delete complaints', 17, 'delete_complaints'),
(72, 'Can view complaints', 17, 'view_complaints'),
(73, 'Can add home_loan_payment', 18, 'add_home_loan_payment'),
(74, 'Can change home_loan_payment', 18, 'change_home_loan_payment'),
(75, 'Can delete home_loan_payment', 18, 'delete_home_loan_payment'),
(76, 'Can view home_loan_payment', 18, 'view_home_loan_payment'),
(77, 'Can add loan_payment', 19, 'add_loan_payment'),
(78, 'Can change loan_payment', 19, 'change_loan_payment'),
(79, 'Can delete loan_payment', 19, 'delete_loan_payment'),
(80, 'Can view loan_payment', 19, 'view_loan_payment');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$SLcD0BqqATyfYzJColtxMG$nZg1008WAy2AvKjdnTQZsxGbc4WHwGRzMaAcoXtNcZs=', NULL, 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2023-03-08 06:47:52.584419');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(13, 'LoanApp', 'application_education_loan'),
(14, 'LoanApp', 'application_home_loan'),
(15, 'LoanApp', 'application_personal_loan'),
(16, 'LoanApp', 'application_vehicle_loan'),
(17, 'LoanApp', 'complaints'),
(10, 'LoanApp', 'education_loan'),
(9, 'LoanApp', 'home_loan'),
(18, 'LoanApp', 'home_loan_payment'),
(19, 'LoanApp', 'loan_payment'),
(7, 'LoanApp', 'login'),
(12, 'LoanApp', 'personal_loan'),
(8, 'LoanApp', 'user_register'),
(11, 'LoanApp', 'vehicle_loan'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-03-08 06:45:51.193684'),
(2, 'auth', '0001_initial', '2023-03-08 06:45:51.572595'),
(3, 'admin', '0001_initial', '2023-03-08 06:45:51.657216'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-03-08 06:45:51.672838'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-03-08 06:45:51.672838'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-03-08 06:45:51.741834'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-03-08 06:45:51.773076'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-03-08 06:45:51.795241'),
(9, 'auth', '0004_alter_user_username_opts', '2023-03-08 06:45:51.810869'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-03-08 06:45:51.857732'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-03-08 06:45:51.857732'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-03-08 06:45:51.873354'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-03-08 06:45:51.888975'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-03-08 06:45:51.911112'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-03-08 06:45:51.958018'),
(16, 'auth', '0011_update_proxy_permissions', '2023-03-08 06:45:51.958018'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-03-08 06:45:51.973599'),
(18, 'sessions', '0001_initial', '2023-03-08 06:45:52.011361'),
(19, 'LoanApp', '0001_initial', '2023-03-08 07:19:07.181142'),
(20, 'LoanApp', '0002_home_loan', '2023-03-09 09:28:44.902545'),
(21, 'LoanApp', '0003_alter_home_loan_cibil_score', '2023-03-09 09:32:17.858252'),
(22, 'LoanApp', '0004_education_loan', '2023-03-09 15:10:00.390375'),
(23, 'LoanApp', '0005_vehicle_loan', '2023-03-10 04:40:55.938507'),
(24, 'LoanApp', '0006_personal_loan', '2023-03-10 05:50:26.044451'),
(25, 'LoanApp', '0007_user_register_identity_proof_user_register_photo', '2023-03-11 09:03:33.883055'),
(26, 'LoanApp', '0007_user_register', '2023-03-13 05:33:14.277675'),
(27, 'LoanApp', '0008_alter_user_register_dob', '2023-03-13 05:52:24.926750'),
(28, 'LoanApp', '0009_alter_user_register_dob', '2023-03-13 05:55:10.410757'),
(29, 'LoanApp', '0010_application_education_loan_application_home_loan_and_more', '2023-03-14 10:17:04.923781'),
(30, 'LoanApp', '0011_application_education_loan_total_fee_and_more', '2023-03-14 15:04:41.825124'),
(31, 'LoanApp', '0012_application_education_loan_first_name_and_more', '2023-03-14 15:43:22.715235'),
(32, 'LoanApp', '0013_complaint', '2023-03-14 17:07:02.494658'),
(33, 'LoanApp', '0014_rename_complaint_complaints', '2023-03-14 17:14:51.437171'),
(34, 'LoanApp', '0015_application_home_loan_allowed_loan_amount_and_more', '2023-03-15 08:30:43.220250'),
(35, 'LoanApp', '0016_application_home_loan_tenure', '2023-03-15 08:52:19.619210'),
(36, 'LoanApp', '0017_application_education_loan_tenure_and_more', '2023-03-15 12:11:18.192384'),
(37, 'LoanApp', '0018_application_vehicle_loan_allowed_loan_amount_and_more', '2023-03-15 13:31:01.191166'),
(38, 'LoanApp', '0019_application_personal_loan_allowed_loan_amount_and_more', '2023-03-15 17:14:13.459334'),
(39, 'LoanApp', '0020_home_loan_payment', '2023-03-16 06:14:17.206367'),
(40, 'LoanApp', '0021_home_loan_payment_appl_home_loan_id', '2023-03-16 06:22:03.907664'),
(41, 'LoanApp', '0022_loan_payment_delete_home_loan_payment', '2023-03-16 06:32:18.376578'),
(42, 'LoanApp', '0023_loan_payment_current_principal_payment', '2023-03-20 17:57:42.973418');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1jsem6hnhrke1d2a0vd6atav7n3rsc2u', 'eyJzdW5hbWUiOiJhbnVqYTEyMyIsInNsb2dpZCI6MX0:1pbMJb:JLCwHzjCHT7RxothJLzAVDiu2Mp7oBVqKYfxGKCSUjE', '2023-03-26 14:04:47.282150'),
('1tudfoker3n48gc1o5u0t3ax7znq98g4', 'eyJzdW5hbWUiOiJhbnVqYTEyMyIsInNsb2dpZCI6MX0:1pbNc7:rgaRFILsa_oF4K7ET4xzmTofCi7I67LCcIZwJJ-_cpU', '2023-03-26 15:27:59.659138'),
('1umuvzwa9jzogpmn01lztl5ih2vazj6f', 'eyJzdW5hbWUiOiJhbmFkMTIzIiwic2xvZ2lkIjoxfQ:1penwM:ipii6sjaj8X7ZEPk1do2m_pwQ4Cik2T8QKJLHFmsywY', '2023-04-05 02:11:02.366456'),
('2mijl29bieal746sta365fvbgplgw1hj', 'eyJzdW5hbWUiOiJhbnVqYTEyMyIsInNsb2dpZCI6MX0:1par4h:HMV4m9ZV9aBvcOPI1_gzjMip97baUJQyomTtsUAO2Yo', '2023-03-25 04:43:19.447718'),
('40cnhphsd6qnlam1axuccrayhzr942eu', 'eyJzdW5hbWUiOiJhbnVqYTEyMyIsInNsb2dpZCI6MX0:1pbL62:CCtk7WR4LQqJU3PUw9TmoGLnCYNNfi8bya-FEYiudp4', '2023-03-26 12:46:42.740594'),
('82obms0tqadn0p1womvixb3zafihho5q', 'eyJzdW5hbWUiOiJhbnVqYTEyMyIsInNsb2dpZCI6MX0:1paYFY:XS1uVk20omhfl2khLnoJUHlbLECUz-d-d9Nlhi8m8Qo', '2023-03-24 08:37:16.705821'),
('a8nuyfux4cil4suen4vj8z6vv11pyr97', 'eyJzdW5hbWUiOiJhZG1pbiIsInNsb2dpZCI6MX0:1pZp5p:KQDGiwof_8Fih6qzIrhJM4Zb5EJCS9CHUIdAVG3qL90', '2023-03-22 08:24:13.568595'),
('bptynaz3ydx3y5pdbiufgv7d74kzzl9t', 'eyJzdW5hbWUiOiJhbmFkMTIzIiwic2xvZ2lkIjoxfQ:1pc0qc:uuLQpsWRTukYVToY6c6juYxYQdw3S20haN-aDGLjOW0', '2023-03-28 09:21:34.539407'),
('d01h6k448rzvfcknyhhque449l1p5i2n', 'eyJzdW5hbWUiOiJhbmFkMTIzIiwic2xvZ2lkIjoxfQ:1pc6Kn:xZpowxRXTF6_KQZbAXvn2g651lQCMFrnbmpG2BGoqxA', '2023-03-28 15:13:05.547876'),
('iejcb6odzyh2lt8ab66jc8j3v5pz9bbe', 'eyJzdW5hbWUiOiJhbmFkMTIzIiwic2xvZ2lkIjoxfQ:1pc5xZ:t-sHsLgDwqxPCa4f4BHU5UFYQfSprb8lmkpVp4GUmyY', '2023-03-28 14:49:05.765782'),
('iwpvsdyzsmb4b7otb5wvn9dst8rsbl8j', 'eyJzdW5hbWUiOiJhbnVqYTEyMyIsInNsb2dpZCI6MX0:1pavve:KLOIIDOLIMimZ5DwkKj4WhDPcMUWJWg99k-9qYmIwkc', '2023-03-25 09:54:18.716370'),
('nq3byv7cl6dyrhltt167ebrrthpfji8q', 'eyJzdW5hbWUiOiJhbmFkMTIzIiwic2xvZ2lkIjoxfQ:1pbbDl:W95hou6Il6spfpcMDCvMBYRw8gtDTB8B2x50DfxO1rE', '2023-03-27 05:59:45.940037');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_application_edu_loan`
--

CREATE TABLE `tbl_application_edu_loan` (
  `appl_edu_loan_id` int(11) NOT NULL,
  `relation` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `phone_number` bigint(20) NOT NULL,
  `highest_qualification` varchar(50) NOT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `university` varchar(50) NOT NULL,
  `Institution` varchar(50) NOT NULL,
  `expected_income` decimal(12,2) DEFAULT NULL,
  `user_login_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `total_fee` decimal(8,2) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `Tenure` int(11) NOT NULL,
  `allowed_loan_amount` decimal(12,2) DEFAULT NULL,
  `interest_rate` decimal(5,2) DEFAULT NULL,
  `repayment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_application_edu_loan`
--

INSERT INTO `tbl_application_edu_loan` (`appl_edu_loan_id`, `relation`, `dob`, `phone_number`, `highest_qualification`, `percentage`, `address`, `course_name`, `university`, `Institution`, `expected_income`, `user_login_id`, `status`, `total_fee`, `first_name`, `last_name`, `Tenure`, `allowed_loan_amount`, `interest_rate`, `repayment_date`) VALUES
(1, 'father', '2008-03-13', 98653212452, 'plus two', '78.00', 'Anad Bhavan', 'BSc Nursing', 'MG University', 'Stas', '25000.00', 1, 'Activated', '400000.00', 'Ananthu', 'Anand', 5, '350000.00', '9.25', '2023-03-15');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_application_home_loan`
--

CREATE TABLE `tbl_application_home_loan` (
  `appl_home_loan_id` int(11) NOT NULL,
  `total_cost` decimal(12,2) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `loan_amount` decimal(12,2) DEFAULT NULL,
  `loan_purpose` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `user_login_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `allowed_loan_amount` decimal(12,2) DEFAULT NULL,
  `credited_date` date NOT NULL,
  `interest_rate` decimal(5,2) DEFAULT NULL,
  `Tenure` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_application_home_loan`
--

INSERT INTO `tbl_application_home_loan` (`appl_home_loan_id`, `total_cost`, `address`, `loan_amount`, `loan_purpose`, `place`, `district`, `state`, `user_login_id`, `status`, `allowed_loan_amount`, `credited_date`, `interest_rate`, `Tenure`) VALUES
(1, '2500000.00', 'Adoor', '2300000.00', 'Purchase New House', 'adoor', 'pathanamthitta', 'kerala', 1, 'Activated', '2200000.00', '2023-03-22', '9.15', 15);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_application_personal_loan`
--

CREATE TABLE `tbl_application_personal_loan` (
  `appl_personal_loan_id` int(11) NOT NULL,
  `purpose` varchar(50) NOT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `tenure` decimal(8,2) DEFAULT NULL,
  `bank_statement` varchar(50) NOT NULL,
  `salary_slip` varchar(50) NOT NULL,
  `user_login_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `allowed_loan_amount` decimal(12,2) DEFAULT NULL,
  `allowed_tenure` int(11) NOT NULL,
  `dispersal_date` date NOT NULL,
  `interest_rate` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_application_personal_loan`
--

INSERT INTO `tbl_application_personal_loan` (`appl_personal_loan_id`, `purpose`, `amount`, `tenure`, `bank_statement`, `salary_slip`, `user_login_id`, `status`, `allowed_loan_amount`, `allowed_tenure`, `dispersal_date`, `interest_rate`) VALUES
(1, 'Building Wall', '200000.00', '5.00', '/media/16..jpg', '/media/17..jpg', 1, 'Activated', '190000.00', 60, '2023-03-15', '11.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_application_vehicle_loan`
--

CREATE TABLE `tbl_application_vehicle_loan` (
  `appl_vehicle_loan_id` int(11) NOT NULL,
  `vehicle_type` varchar(50) NOT NULL,
  `manufacture` varchar(50) NOT NULL,
  `vmodel` varchar(50) NOT NULL,
  `Supplier` varchar(50) NOT NULL,
  `cost` decimal(12,2) DEFAULT NULL,
  `dpayment` decimal(12,2) DEFAULT NULL,
  `tenure` decimal(5,2) DEFAULT NULL,
  `user_login_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `allowed_loan_amount` decimal(12,2) DEFAULT NULL,
  `dispersal_date` date NOT NULL,
  `interest_rate` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_application_vehicle_loan`
--

INSERT INTO `tbl_application_vehicle_loan` (`appl_vehicle_loan_id`, `vehicle_type`, `manufacture`, `vmodel`, `Supplier`, `cost`, `dpayment`, `tenure`, `user_login_id`, `status`, `allowed_loan_amount`, `dispersal_date`, `interest_rate`) VALUES
(1, 'Two-Wheeler Loan', 'Susuki', '52sd', 'Muthoot', '100000.00', '20000.00', '5.00', 1, 'Activated', '80000.00', '2023-03-29', '8.75');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complaint`
--

CREATE TABLE `tbl_complaint` (
  `complaint_id` int(11) NOT NULL,
  `complaint` varchar(50) NOT NULL,
  `reply` varchar(50) NOT NULL,
  `user_login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_complaint`
--

INSERT INTO `tbl_complaint` (`complaint_id`, `complaint`, `reply`, `user_login_id`) VALUES
(1, 'Processing time is too long', 'yes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `user_id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `phone_number` bigint(20) NOT NULL,
  `address` longtext NOT NULL,
  `mail_id` varchar(50) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `identity_proof` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `marital_status` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `spouse` varchar(50) NOT NULL,
  `no_dependents` int(11) NOT NULL,
  `no_childen` varchar(50) NOT NULL,
  `caste_category` varchar(50) NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `residential_status` varchar(50) NOT NULL,
  `place_of_birth` varchar(50) NOT NULL,
  `pan_no` varchar(50) NOT NULL,
  `highest_qualification` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `occupation` varchar(50) NOT NULL,
  `income` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `itr` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`user_id`, `login_id`, `firstname`, `lastname`, `phone_number`, `address`, `mail_id`, `photo`, `identity_proof`, `gender`, `marital_status`, `dob`, `spouse`, `no_dependents`, `no_childen`, `caste_category`, `nationality`, `residential_status`, `place_of_birth`, `pan_no`, `highest_qualification`, `city`, `district`, `occupation`, `income`, `status`, `itr`) VALUES
(1, 1, 'Anad', 'Mathews', 9847563225, 'Anad Villa', 'anad@gmail.com', '/media/11..jpg', '/media/12..jpg', 'Male', 'Married', '2003-03-14', 'Jeena', 2, '2', 'SC', 'Indian', 'Owned', 'Adoor', 'AAA458dDFS', 'MSc', 'Adoor', 'pathanamthitta', 'Software Developer', 50000, 'Updated', '/media/15..jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_edu_loan_scheme`
--

CREATE TABLE `tbl_edu_loan_scheme` (
  `education_loan_id` int(11) NOT NULL,
  `loan_limit` varchar(50) NOT NULL,
  `rate` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_edu_loan_scheme`
--

INSERT INTO `tbl_edu_loan_scheme` (`education_loan_id`, `loan_limit`, `rate`) VALUES
(1, 'Upto Rs 7.5 Lakhs', '9.15'),
(2, 'Above Rs 7.5 Lacs', '9.25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_home_loan_scheme`
--

CREATE TABLE `tbl_home_loan_scheme` (
  `home_loan_id` int(11) NOT NULL,
  `cibil_score` varchar(50) NOT NULL,
  `rate` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_home_loan_scheme`
--

INSERT INTO `tbl_home_loan_scheme` (`home_loan_id`, `cibil_score`, `rate`) VALUES
(1, '800 Above', '9.15'),
(2, '800 - 750', '9.25'),
(3, '700 - 749', '9.35'),
(4, '650 - 699', '9.45'),
(8, '550 - 649', '9.55');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_loan_payment`
--

CREATE TABLE `tbl_loan_payment` (
  `loan_payment_loan_id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `duedate` date NOT NULL,
  `principle_payment` decimal(12,2) DEFAULT NULL,
  `interest_payment` decimal(12,2) DEFAULT NULL,
  `emi` decimal(12,2) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `current_principal_payment` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_loan_payment`
--

INSERT INTO `tbl_loan_payment` (`loan_payment_loan_id`, `loan_id`, `type`, `duedate`, `principle_payment`, `interest_payment`, `emi`, `status`, `current_principal_payment`) VALUES
(1, 1, 'Home Loan', '2023-04-19', '2194264.40', '16775.00', '22510.60', 'Not Paid', '5735.60'),
(2, 1, 'Home Loan', '2023-05-19', '2188485.06', '16731.27', '22510.61', 'Not Paid', '5779.34'),
(3, 1, 'Home Loan', '2023-06-18', '2182661.66', '16687.20', '22510.60', 'Not Paid', '5823.40'),
(4, 1, 'Home Loan', '2023-07-18', '2176793.85', '16642.80', '22510.61', 'Not Paid', '5867.81'),
(5, 1, 'Home Loan', '2023-08-17', '2170881.30', '16598.05', '22510.60', 'Not Paid', '5912.55'),
(6, 1, 'Home Loan', '2023-09-16', '2164923.67', '16552.97', '22510.60', 'Not Paid', '5957.63'),
(7, 1, 'Home Loan', '2023-10-16', '2158920.61', '16507.54', '22510.60', 'Not Paid', '6003.06'),
(8, 1, 'Home Loan', '2023-11-15', '2152871.78', '16461.77', '22510.60', 'Not Paid', '6048.83'),
(9, 1, 'Home Loan', '2023-12-15', '2146776.83', '16415.65', '22510.60', 'Not Paid', '6094.95'),
(10, 1, 'Home Loan', '2024-01-14', '2140635.40', '16369.17', '22510.60', 'Not Paid', '6141.43'),
(11, 1, 'Home Loan', '2024-02-13', '2134447.14', '16322.34', '22510.60', 'Not Paid', '6188.26'),
(12, 1, 'Home Loan', '2024-03-14', '2128211.70', '16275.16', '22510.60', 'Not Paid', '6235.44'),
(13, 1, 'Home Loan', '2024-04-13', '2121928.71', '16227.61', '22510.60', 'Not Paid', '6282.99'),
(14, 1, 'Home Loan', '2024-05-13', '2115597.82', '16179.71', '22510.60', 'Not Paid', '6330.89'),
(15, 1, 'Home Loan', '2024-06-12', '2109218.65', '16131.43', '22510.60', 'Not Paid', '6379.17'),
(16, 1, 'Home Loan', '2024-07-12', '2102790.84', '16082.79', '22510.60', 'Not Paid', '6427.81'),
(17, 1, 'Home Loan', '2024-08-11', '2096314.02', '16033.78', '22510.60', 'Not Paid', '6476.82'),
(18, 1, 'Home Loan', '2024-09-10', '2089787.81', '15984.39', '22510.60', 'Not Paid', '6526.21'),
(19, 1, 'Home Loan', '2024-10-10', '2083211.84', '15934.63', '22510.60', 'Not Paid', '6575.97'),
(20, 1, 'Home Loan', '2024-11-09', '2076585.73', '15884.49', '22510.60', 'Not Paid', '6626.11'),
(21, 1, 'Home Loan', '2024-12-09', '2069909.10', '15833.97', '22510.60', 'Not Paid', '6676.63'),
(22, 1, 'Home Loan', '2025-01-08', '2063181.56', '15783.06', '22510.60', 'Not Paid', '6727.54'),
(23, 1, 'Home Loan', '2025-02-07', '2056402.72', '15731.76', '22510.60', 'Not Paid', '6778.84'),
(24, 1, 'Home Loan', '2025-03-09', '2049572.19', '15680.07', '22510.60', 'Not Paid', '6830.53'),
(25, 1, 'Home Loan', '2025-04-08', '2042689.58', '15627.99', '22510.60', 'Not Paid', '6882.61'),
(26, 1, 'Home Loan', '2025-05-08', '2035754.49', '15575.51', '22510.60', 'Not Paid', '6935.09'),
(27, 1, 'Home Loan', '2025-06-07', '2028766.52', '15522.63', '22510.60', 'Not Paid', '6987.97'),
(28, 1, 'Home Loan', '2025-07-07', '2021725.26', '15469.34', '22510.60', 'Not Paid', '7041.26'),
(29, 1, 'Home Loan', '2025-08-06', '2014630.31', '15415.66', '22510.61', 'Not Paid', '7094.95'),
(30, 1, 'Home Loan', '2025-09-05', '2007481.26', '15361.56', '22510.61', 'Not Paid', '7149.05'),
(31, 1, 'Home Loan', '2025-10-05', '2000277.70', '15307.04', '22510.60', 'Not Paid', '7203.56'),
(32, 1, 'Home Loan', '2025-11-04', '1993019.22', '15252.12', '22510.60', 'Not Paid', '7258.48'),
(33, 1, 'Home Loan', '2025-12-04', '1985705.39', '15196.77', '22510.60', 'Not Paid', '7313.83'),
(34, 1, 'Home Loan', '2026-01-03', '1978335.79', '15141.00', '22510.60', 'Not Paid', '7369.60'),
(35, 1, 'Home Loan', '2026-02-02', '1970910.00', '15084.81', '22510.60', 'Not Paid', '7425.79'),
(36, 1, 'Home Loan', '2026-03-04', '1963427.59', '15028.19', '22510.60', 'Not Paid', '7482.41'),
(37, 1, 'Home Loan', '2026-04-03', '1955888.12', '14971.14', '22510.61', 'Not Paid', '7539.47'),
(38, 1, 'Home Loan', '2026-05-03', '1948291.17', '14913.65', '22510.60', 'Not Paid', '7596.95'),
(39, 1, 'Home Loan', '2026-06-02', '1940636.29', '14855.72', '22510.60', 'Not Paid', '7654.88'),
(40, 1, 'Home Loan', '2026-07-02', '1932923.04', '14797.35', '22510.60', 'Not Paid', '7713.25'),
(41, 1, 'Home Loan', '2026-08-01', '1925150.98', '14738.54', '22510.60', 'Not Paid', '7772.06'),
(42, 1, 'Home Loan', '2026-08-31', '1917319.66', '14679.28', '22510.60', 'Not Paid', '7831.32'),
(43, 1, 'Home Loan', '2026-09-30', '1909428.62', '14619.56', '22510.60', 'Not Paid', '7891.04'),
(44, 1, 'Home Loan', '2026-10-30', '1901477.41', '14559.39', '22510.60', 'Not Paid', '7951.21'),
(45, 1, 'Home Loan', '2026-11-29', '1893465.57', '14498.77', '22510.61', 'Not Paid', '8011.84'),
(46, 1, 'Home Loan', '2026-12-29', '1885392.64', '14437.67', '22510.60', 'Not Paid', '8072.93'),
(47, 1, 'Home Loan', '2027-01-28', '1877258.16', '14376.12', '22510.60', 'Not Paid', '8134.48'),
(48, 1, 'Home Loan', '2027-02-27', '1869061.65', '14314.09', '22510.60', 'Not Paid', '8196.51'),
(49, 1, 'Home Loan', '2027-03-29', '1860802.64', '14251.60', '22510.61', 'Not Paid', '8259.01'),
(50, 1, 'Home Loan', '2027-04-28', '1852480.66', '14188.62', '22510.60', 'Not Paid', '8321.98'),
(51, 1, 'Home Loan', '2027-05-28', '1844095.22', '14125.17', '22510.61', 'Not Paid', '8385.44'),
(52, 1, 'Home Loan', '2027-06-27', '1835645.84', '14061.23', '22510.61', 'Not Paid', '8449.38'),
(53, 1, 'Home Loan', '2027-07-27', '1827132.04', '13996.80', '22510.60', 'Not Paid', '8513.80'),
(54, 1, 'Home Loan', '2027-08-26', '1818553.32', '13931.88', '22510.60', 'Not Paid', '8578.72'),
(55, 1, 'Home Loan', '2027-09-25', '1809909.19', '13866.47', '22510.60', 'Not Paid', '8644.13'),
(56, 1, 'Home Loan', '2027-10-25', '1801199.15', '13800.56', '22510.60', 'Not Paid', '8710.04'),
(57, 1, 'Home Loan', '2027-11-24', '1792422.69', '13734.14', '22510.60', 'Not Paid', '8776.46'),
(58, 1, 'Home Loan', '2027-12-24', '1783579.31', '13667.22', '22510.60', 'Not Paid', '8843.38'),
(59, 1, 'Home Loan', '2028-01-23', '1774668.50', '13599.79', '22510.60', 'Not Paid', '8910.81'),
(60, 1, 'Home Loan', '2028-02-22', '1765689.75', '13531.85', '22510.60', 'Not Paid', '8978.75'),
(61, 1, 'Home Loan', '2028-03-23', '1756642.53', '13463.38', '22510.60', 'Not Paid', '9047.22'),
(62, 1, 'Home Loan', '2028-04-22', '1747526.33', '13394.40', '22510.60', 'Not Paid', '9116.20'),
(63, 1, 'Home Loan', '2028-05-22', '1738340.62', '13324.89', '22510.60', 'Not Paid', '9185.71'),
(64, 1, 'Home Loan', '2028-06-21', '1729084.87', '13254.85', '22510.60', 'Not Paid', '9255.75'),
(65, 1, 'Home Loan', '2028-07-21', '1719758.54', '13184.27', '22510.60', 'Not Paid', '9326.33'),
(66, 1, 'Home Loan', '2028-08-20', '1710361.10', '13113.16', '22510.60', 'Not Paid', '9397.44'),
(67, 1, 'Home Loan', '2028-09-19', '1700892.00', '13041.50', '22510.60', 'Not Paid', '9469.10'),
(68, 1, 'Home Loan', '2028-10-19', '1691350.70', '12969.30', '22510.60', 'Not Paid', '9541.30'),
(69, 1, 'Home Loan', '2028-11-18', '1681736.65', '12896.55', '22510.60', 'Not Paid', '9614.05'),
(70, 1, 'Home Loan', '2028-12-18', '1672049.29', '12823.24', '22510.60', 'Not Paid', '9687.36'),
(71, 1, 'Home Loan', '2029-01-17', '1662288.06', '12749.38', '22510.61', 'Not Paid', '9761.23'),
(72, 1, 'Home Loan', '2029-02-16', '1652452.41', '12674.95', '22510.60', 'Not Paid', '9835.65'),
(73, 1, 'Home Loan', '2029-03-18', '1642541.76', '12599.95', '22510.60', 'Not Paid', '9910.65'),
(74, 1, 'Home Loan', '2029-04-17', '1632555.54', '12524.38', '22510.60', 'Not Paid', '9986.22'),
(75, 1, 'Home Loan', '2029-05-17', '1622493.17', '12448.24', '22510.61', 'Not Paid', '10062.37'),
(76, 1, 'Home Loan', '2029-06-16', '1612354.08', '12371.51', '22510.60', 'Not Paid', '10139.09'),
(77, 1, 'Home Loan', '2029-07-16', '1602137.68', '12294.20', '22510.60', 'Not Paid', '10216.40'),
(78, 1, 'Home Loan', '2029-08-15', '1591843.38', '12216.30', '22510.60', 'Not Paid', '10294.30'),
(79, 1, 'Home Loan', '2029-09-14', '1581470.58', '12137.81', '22510.61', 'Not Paid', '10372.80'),
(80, 1, 'Home Loan', '2029-10-14', '1571018.69', '12058.71', '22510.60', 'Not Paid', '10451.89'),
(81, 1, 'Home Loan', '2029-11-13', '1560487.11', '11979.02', '22510.60', 'Not Paid', '10531.58'),
(82, 1, 'Home Loan', '2029-12-13', '1549875.22', '11898.71', '22510.60', 'Not Paid', '10611.89'),
(83, 1, 'Home Loan', '2030-01-12', '1539182.42', '11817.80', '22510.60', 'Not Paid', '10692.80'),
(84, 1, 'Home Loan', '2030-02-11', '1528408.08', '11736.27', '22510.61', 'Not Paid', '10774.34'),
(85, 1, 'Home Loan', '2030-03-13', '1517551.59', '11654.11', '22510.60', 'Not Paid', '10856.49'),
(86, 1, 'Home Loan', '2030-04-12', '1506612.32', '11571.33', '22510.60', 'Not Paid', '10939.27'),
(87, 1, 'Home Loan', '2030-05-12', '1495589.64', '11487.92', '22510.60', 'Not Paid', '11022.68'),
(88, 1, 'Home Loan', '2030-06-11', '1484482.91', '11403.87', '22510.60', 'Not Paid', '11106.73'),
(89, 1, 'Home Loan', '2030-07-11', '1473291.49', '11319.18', '22510.60', 'Not Paid', '11191.42'),
(90, 1, 'Home Loan', '2030-08-10', '1462014.74', '11233.85', '22510.60', 'Not Paid', '11276.75'),
(91, 1, 'Home Loan', '2030-09-09', '1450652.00', '11147.86', '22510.60', 'Not Paid', '11362.74'),
(92, 1, 'Home Loan', '2030-10-09', '1439202.62', '11061.22', '22510.60', 'Not Paid', '11449.38'),
(93, 1, 'Home Loan', '2030-11-08', '1427665.94', '10973.92', '22510.60', 'Not Paid', '11536.68'),
(94, 1, 'Home Loan', '2030-12-08', '1416041.29', '10885.95', '22510.60', 'Not Paid', '11624.65'),
(95, 1, 'Home Loan', '2031-01-07', '1404328.00', '10797.31', '22510.60', 'Not Paid', '11713.29'),
(96, 1, 'Home Loan', '2031-02-06', '1392525.40', '10708.00', '22510.60', 'Not Paid', '11802.60'),
(97, 1, 'Home Loan', '2031-03-08', '1380632.81', '10618.01', '22510.60', 'Not Paid', '11892.59'),
(98, 1, 'Home Loan', '2031-04-07', '1368649.53', '10527.33', '22510.61', 'Not Paid', '11983.28'),
(99, 1, 'Home Loan', '2031-05-07', '1356574.88', '10435.95', '22510.60', 'Not Paid', '12074.65'),
(100, 1, 'Home Loan', '2031-06-06', '1344408.16', '10343.88', '22510.60', 'Not Paid', '12166.72'),
(101, 1, 'Home Loan', '2031-07-06', '1332148.67', '10251.11', '22510.60', 'Not Paid', '12259.49'),
(102, 1, 'Home Loan', '2031-08-05', '1319795.70', '10157.63', '22510.60', 'Not Paid', '12352.97'),
(103, 1, 'Home Loan', '2031-09-04', '1307348.54', '10063.44', '22510.60', 'Not Paid', '12447.16'),
(104, 1, 'Home Loan', '2031-10-04', '1294806.47', '9968.53', '22510.60', 'Not Paid', '12542.07'),
(105, 1, 'Home Loan', '2031-11-03', '1282168.77', '9872.90', '22510.60', 'Not Paid', '12637.70'),
(106, 1, 'Home Loan', '2031-12-03', '1269434.71', '9776.54', '22510.60', 'Not Paid', '12734.06'),
(107, 1, 'Home Loan', '2032-01-02', '1256603.55', '9679.44', '22510.60', 'Not Paid', '12831.16'),
(108, 1, 'Home Loan', '2032-02-01', '1243674.55', '9581.60', '22510.60', 'Not Paid', '12929.00'),
(109, 1, 'Home Loan', '2032-03-02', '1230646.97', '9483.02', '22510.60', 'Not Paid', '13027.58'),
(110, 1, 'Home Loan', '2032-04-01', '1217520.05', '9383.68', '22510.60', 'Not Paid', '13126.92'),
(111, 1, 'Home Loan', '2032-05-01', '1204293.04', '9283.59', '22510.60', 'Not Paid', '13227.01'),
(112, 1, 'Home Loan', '2032-05-31', '1190965.17', '9182.73', '22510.60', 'Not Paid', '13327.87'),
(113, 1, 'Home Loan', '2032-06-30', '1177535.68', '9081.11', '22510.60', 'Not Paid', '13429.49'),
(114, 1, 'Home Loan', '2032-07-30', '1164003.79', '8978.71', '22510.60', 'Not Paid', '13531.89'),
(115, 1, 'Home Loan', '2032-08-29', '1150368.72', '8875.53', '22510.60', 'Not Paid', '13635.07'),
(116, 1, 'Home Loan', '2032-09-28', '1136629.68', '8771.56', '22510.60', 'Not Paid', '13739.04'),
(117, 1, 'Home Loan', '2032-10-28', '1122785.88', '8666.80', '22510.60', 'Not Paid', '13843.80'),
(118, 1, 'Home Loan', '2032-11-27', '1108836.52', '8561.24', '22510.60', 'Not Paid', '13949.36'),
(119, 1, 'Home Loan', '2032-12-27', '1094780.80', '8454.88', '22510.60', 'Not Paid', '14055.72'),
(120, 1, 'Home Loan', '2033-01-26', '1080617.90', '8347.70', '22510.60', 'Not Paid', '14162.90'),
(121, 1, 'Home Loan', '2033-02-25', '1066347.01', '8239.71', '22510.60', 'Not Paid', '14270.89'),
(122, 1, 'Home Loan', '2033-03-27', '1051967.30', '8130.90', '22510.61', 'Not Paid', '14379.71'),
(123, 1, 'Home Loan', '2033-04-26', '1037477.95', '8021.25', '22510.60', 'Not Paid', '14489.35'),
(124, 1, 'Home Loan', '2033-05-26', '1022878.12', '7910.77', '22510.60', 'Not Paid', '14599.83'),
(125, 1, 'Home Loan', '2033-06-25', '1008166.96', '7799.45', '22510.61', 'Not Paid', '14711.16'),
(126, 1, 'Home Loan', '2033-07-25', '993343.63', '7687.27', '22510.60', 'Not Paid', '14823.33'),
(127, 1, 'Home Loan', '2033-08-24', '978407.27', '7574.25', '22510.61', 'Not Paid', '14936.36'),
(128, 1, 'Home Loan', '2033-09-23', '963357.02', '7460.36', '22510.61', 'Not Paid', '15050.25'),
(129, 1, 'Home Loan', '2033-10-23', '948192.02', '7345.60', '22510.60', 'Not Paid', '15165.00'),
(130, 1, 'Home Loan', '2033-11-22', '932911.38', '7229.96', '22510.60', 'Not Paid', '15280.64'),
(131, 1, 'Home Loan', '2033-12-22', '917514.23', '7113.45', '22510.60', 'Not Paid', '15397.15'),
(132, 1, 'Home Loan', '2034-01-21', '901999.67', '6996.05', '22510.61', 'Not Paid', '15514.56'),
(133, 1, 'Home Loan', '2034-02-20', '886366.82', '6877.75', '22510.60', 'Not Paid', '15632.85'),
(134, 1, 'Home Loan', '2034-03-22', '870614.77', '6758.55', '22510.60', 'Not Paid', '15752.05'),
(135, 1, 'Home Loan', '2034-04-21', '854742.61', '6638.44', '22510.60', 'Not Paid', '15872.16'),
(136, 1, 'Home Loan', '2034-05-21', '838749.42', '6517.41', '22510.60', 'Not Paid', '15993.19'),
(137, 1, 'Home Loan', '2034-06-20', '822634.28', '6395.46', '22510.60', 'Not Paid', '16115.14'),
(138, 1, 'Home Loan', '2034-07-20', '806396.27', '6272.59', '22510.60', 'Not Paid', '16238.01'),
(139, 1, 'Home Loan', '2034-08-19', '790034.44', '6148.77', '22510.60', 'Not Paid', '16361.83'),
(140, 1, 'Home Loan', '2034-09-18', '773547.85', '6024.01', '22510.60', 'Not Paid', '16486.59'),
(141, 1, 'Home Loan', '2034-10-18', '756935.55', '5898.30', '22510.60', 'Not Paid', '16612.30'),
(142, 1, 'Home Loan', '2034-11-17', '740196.58', '5771.63', '22510.60', 'Not Paid', '16738.97'),
(143, 1, 'Home Loan', '2034-12-17', '723329.98', '5644.00', '22510.60', 'Not Paid', '16866.60'),
(144, 1, 'Home Loan', '2035-01-16', '706334.77', '5515.39', '22510.60', 'Not Paid', '16995.21'),
(145, 1, 'Home Loan', '2035-02-15', '689209.97', '5385.80', '22510.60', 'Not Paid', '17124.80'),
(146, 1, 'Home Loan', '2035-03-17', '671954.59', '5255.23', '22510.61', 'Not Paid', '17255.38'),
(147, 1, 'Home Loan', '2035-04-16', '654567.64', '5123.65', '22510.60', 'Not Paid', '17386.95'),
(148, 1, 'Home Loan', '2035-05-16', '637048.12', '4991.08', '22510.60', 'Not Paid', '17519.52'),
(149, 1, 'Home Loan', '2035-06-15', '619395.01', '4857.49', '22510.60', 'Not Paid', '17653.11'),
(150, 1, 'Home Loan', '2035-07-15', '601607.30', '4722.89', '22510.60', 'Not Paid', '17787.71'),
(151, 1, 'Home Loan', '2035-08-14', '583683.95', '4587.26', '22510.61', 'Not Paid', '17923.35'),
(152, 1, 'Home Loan', '2035-09-13', '565623.94', '4450.59', '22510.60', 'Not Paid', '18060.01'),
(153, 1, 'Home Loan', '2035-10-13', '547426.22', '4312.88', '22510.60', 'Not Paid', '18197.72'),
(154, 1, 'Home Loan', '2035-11-12', '529089.74', '4174.12', '22510.60', 'Not Paid', '18336.48'),
(155, 1, 'Home Loan', '2035-12-12', '510613.45', '4034.31', '22510.60', 'Not Paid', '18476.29'),
(156, 1, 'Home Loan', '2036-01-11', '491996.28', '3893.43', '22510.60', 'Not Paid', '18617.17'),
(157, 1, 'Home Loan', '2036-02-10', '473237.15', '3751.47', '22510.60', 'Not Paid', '18759.13'),
(158, 1, 'Home Loan', '2036-03-11', '454334.98', '3608.43', '22510.60', 'Not Paid', '18902.17'),
(159, 1, 'Home Loan', '2036-04-10', '435288.68', '3464.30', '22510.60', 'Not Paid', '19046.30'),
(160, 1, 'Home Loan', '2036-05-10', '416097.16', '3319.08', '22510.60', 'Not Paid', '19191.52'),
(161, 1, 'Home Loan', '2036-06-09', '396759.30', '3172.74', '22510.60', 'Not Paid', '19337.86'),
(162, 1, 'Home Loan', '2036-07-09', '377273.99', '3025.29', '22510.60', 'Not Paid', '19485.31'),
(163, 1, 'Home Loan', '2036-08-08', '357640.10', '2876.71', '22510.60', 'Not Paid', '19633.89'),
(164, 1, 'Home Loan', '2036-09-07', '337856.50', '2727.01', '22510.61', 'Not Paid', '19783.60'),
(165, 1, 'Home Loan', '2036-10-07', '317922.05', '2576.16', '22510.61', 'Not Paid', '19934.45'),
(166, 1, 'Home Loan', '2036-11-06', '297835.60', '2424.16', '22510.61', 'Not Paid', '20086.45'),
(167, 1, 'Home Loan', '2036-12-06', '277596.00', '2271.00', '22510.60', 'Not Paid', '20239.60'),
(168, 1, 'Home Loan', '2037-01-05', '257202.07', '2116.67', '22510.60', 'Not Paid', '20393.93'),
(169, 1, 'Home Loan', '2037-02-04', '236652.63', '1961.17', '22510.61', 'Not Paid', '20549.44'),
(170, 1, 'Home Loan', '2037-03-06', '215946.51', '1804.48', '22510.60', 'Not Paid', '20706.12'),
(171, 1, 'Home Loan', '2037-04-05', '195082.50', '1646.59', '22510.60', 'Not Paid', '20864.01'),
(172, 1, 'Home Loan', '2037-05-05', '174059.40', '1487.50', '22510.60', 'Not Paid', '21023.10'),
(173, 1, 'Home Loan', '2037-06-04', '152876.00', '1327.20', '22510.60', 'Not Paid', '21183.40'),
(174, 1, 'Home Loan', '2037-07-04', '131531.08', '1165.68', '22510.60', 'Not Paid', '21344.92'),
(175, 1, 'Home Loan', '2037-08-03', '110023.40', '1002.92', '22510.60', 'Not Paid', '21507.68'),
(176, 1, 'Home Loan', '2037-09-02', '88351.73', '838.93', '22510.60', 'Not Paid', '21671.67'),
(177, 1, 'Home Loan', '2037-10-02', '66514.81', '673.68', '22510.60', 'Not Paid', '21836.92'),
(178, 1, 'Home Loan', '2037-11-01', '44511.38', '507.18', '22510.61', 'Not Paid', '22003.43'),
(179, 1, 'Home Loan', '2037-12-01', '22340.18', '339.40', '22510.60', 'Not Paid', '22171.20'),
(180, 1, 'Home Loan', '2037-12-31', '-0.08', '170.34', '22510.60', 'Not Paid', '22340.26'),
(181, 1, 'Eduaction Loan', '2023-04-19', '345389.95', '2697.92', '7307.97', 'Not Paid', '4610.05'),
(182, 1, 'Eduaction Loan', '2023-05-19', '340744.37', '2662.38', '7307.96', 'Not Paid', '4645.58'),
(183, 1, 'Eduaction Loan', '2023-06-18', '336062.98', '2626.57', '7307.96', 'Not Paid', '4681.39'),
(184, 1, 'Eduaction Loan', '2023-07-18', '331345.50', '2590.49', '7307.97', 'Not Paid', '4717.48'),
(185, 1, 'Eduaction Loan', '2023-08-17', '326591.66', '2554.12', '7307.96', 'Not Paid', '4753.84'),
(186, 1, 'Eduaction Loan', '2023-09-16', '321801.17', '2517.48', '7307.97', 'Not Paid', '4790.49'),
(187, 1, 'Eduaction Loan', '2023-10-16', '316973.76', '2480.55', '7307.96', 'Not Paid', '4827.41'),
(188, 1, 'Eduaction Loan', '2023-11-15', '312109.13', '2443.34', '7307.97', 'Not Paid', '4864.63'),
(189, 1, 'Eduaction Loan', '2023-12-15', '307207.01', '2405.84', '7307.96', 'Not Paid', '4902.12'),
(190, 1, 'Eduaction Loan', '2024-01-14', '302267.10', '2368.05', '7307.96', 'Not Paid', '4939.91'),
(191, 1, 'Eduaction Loan', '2024-02-13', '297289.11', '2329.98', '7307.97', 'Not Paid', '4977.99'),
(192, 1, 'Eduaction Loan', '2024-03-14', '292272.75', '2291.60', '7307.96', 'Not Paid', '5016.36'),
(193, 1, 'Eduaction Loan', '2024-04-13', '287217.72', '2252.94', '7307.97', 'Not Paid', '5055.03'),
(194, 1, 'Eduaction Loan', '2024-05-13', '282123.73', '2213.97', '7307.96', 'Not Paid', '5093.99'),
(195, 1, 'Eduaction Loan', '2024-06-12', '276990.47', '2174.70', '7307.96', 'Not Paid', '5133.26'),
(196, 1, 'Eduaction Loan', '2024-07-12', '271817.64', '2135.13', '7307.96', 'Not Paid', '5172.83'),
(197, 1, 'Eduaction Loan', '2024-08-11', '266604.94', '2095.26', '7307.96', 'Not Paid', '5212.70'),
(198, 1, 'Eduaction Loan', '2024-09-10', '261352.06', '2055.08', '7307.96', 'Not Paid', '5252.88'),
(199, 1, 'Eduaction Loan', '2024-10-10', '256058.68', '2014.59', '7307.97', 'Not Paid', '5293.38'),
(200, 1, 'Eduaction Loan', '2024-11-09', '250724.50', '1973.79', '7307.97', 'Not Paid', '5334.18'),
(201, 1, 'Eduaction Loan', '2024-12-09', '245349.20', '1932.67', '7307.97', 'Not Paid', '5375.30'),
(202, 1, 'Eduaction Loan', '2025-01-08', '239932.47', '1891.23', '7307.96', 'Not Paid', '5416.73'),
(203, 1, 'Eduaction Loan', '2025-02-07', '234473.99', '1849.48', '7307.96', 'Not Paid', '5458.48'),
(204, 1, 'Eduaction Loan', '2025-03-09', '228973.43', '1807.40', '7307.96', 'Not Paid', '5500.56'),
(205, 1, 'Eduaction Loan', '2025-04-08', '223430.47', '1765.00', '7307.96', 'Not Paid', '5542.96'),
(206, 1, 'Eduaction Loan', '2025-05-08', '217844.78', '1722.28', '7307.97', 'Not Paid', '5585.69'),
(207, 1, 'Eduaction Loan', '2025-06-07', '212216.04', '1679.22', '7307.96', 'Not Paid', '5628.74'),
(208, 1, 'Eduaction Loan', '2025-07-07', '206543.91', '1635.83', '7307.96', 'Not Paid', '5672.13'),
(209, 1, 'Eduaction Loan', '2025-08-06', '200828.05', '1592.11', '7307.97', 'Not Paid', '5715.86'),
(210, 1, 'Eduaction Loan', '2025-09-05', '195068.14', '1548.05', '7307.96', 'Not Paid', '5759.91'),
(211, 1, 'Eduaction Loan', '2025-10-05', '189263.83', '1503.65', '7307.96', 'Not Paid', '5804.31'),
(212, 1, 'Eduaction Loan', '2025-11-04', '183414.77', '1458.91', '7307.97', 'Not Paid', '5849.06'),
(213, 1, 'Eduaction Loan', '2025-12-04', '177520.63', '1413.82', '7307.96', 'Not Paid', '5894.14'),
(214, 1, 'Eduaction Loan', '2026-01-03', '171581.05', '1368.39', '7307.97', 'Not Paid', '5939.58'),
(215, 1, 'Eduaction Loan', '2026-02-02', '165595.69', '1322.60', '7307.96', 'Not Paid', '5985.36'),
(216, 1, 'Eduaction Loan', '2026-03-04', '159564.19', '1276.47', '7307.97', 'Not Paid', '6031.50'),
(217, 1, 'Eduaction Loan', '2026-04-03', '153486.20', '1229.97', '7307.96', 'Not Paid', '6077.99'),
(218, 1, 'Eduaction Loan', '2026-05-03', '147361.36', '1183.12', '7307.96', 'Not Paid', '6124.84'),
(219, 1, 'Eduaction Loan', '2026-06-02', '141189.31', '1135.91', '7307.96', 'Not Paid', '6172.05'),
(220, 1, 'Eduaction Loan', '2026-07-02', '134969.68', '1088.33', '7307.96', 'Not Paid', '6219.63'),
(221, 1, 'Eduaction Loan', '2026-08-01', '128702.11', '1040.39', '7307.96', 'Not Paid', '6267.57'),
(222, 1, 'Eduaction Loan', '2026-08-31', '122386.22', '992.08', '7307.97', 'Not Paid', '6315.89'),
(223, 1, 'Eduaction Loan', '2026-09-30', '116021.65', '943.39', '7307.96', 'Not Paid', '6364.57'),
(224, 1, 'Eduaction Loan', '2026-10-30', '109608.02', '894.33', '7307.96', 'Not Paid', '6413.63'),
(225, 1, 'Eduaction Loan', '2026-11-29', '103144.95', '844.90', '7307.97', 'Not Paid', '6463.07'),
(226, 1, 'Eduaction Loan', '2026-12-29', '96632.06', '795.08', '7307.97', 'Not Paid', '6512.89'),
(227, 1, 'Eduaction Loan', '2027-01-28', '90068.97', '744.87', '7307.96', 'Not Paid', '6563.09'),
(228, 1, 'Eduaction Loan', '2027-02-27', '83455.29', '694.28', '7307.96', 'Not Paid', '6613.68'),
(229, 1, 'Eduaction Loan', '2027-03-29', '76790.63', '643.30', '7307.96', 'Not Paid', '6664.66'),
(230, 1, 'Eduaction Loan', '2027-04-28', '70074.59', '591.93', '7307.97', 'Not Paid', '6716.04'),
(231, 1, 'Eduaction Loan', '2027-05-28', '63306.78', '540.16', '7307.97', 'Not Paid', '6767.81'),
(232, 1, 'Eduaction Loan', '2027-06-27', '56486.81', '487.99', '7307.96', 'Not Paid', '6819.97'),
(233, 1, 'Eduaction Loan', '2027-07-27', '49614.26', '435.42', '7307.97', 'Not Paid', '6872.55'),
(234, 1, 'Eduaction Loan', '2027-08-26', '42688.74', '382.44', '7307.96', 'Not Paid', '6925.52'),
(235, 1, 'Eduaction Loan', '2027-09-25', '35709.83', '329.06', '7307.97', 'Not Paid', '6978.91'),
(236, 1, 'Eduaction Loan', '2027-10-25', '28677.13', '275.26', '7307.96', 'Not Paid', '7032.70'),
(237, 1, 'Eduaction Loan', '2027-11-24', '21590.22', '221.05', '7307.96', 'Not Paid', '7086.91'),
(238, 1, 'Eduaction Loan', '2027-12-24', '14448.68', '166.42', '7307.96', 'Not Paid', '7141.54'),
(239, 1, 'Eduaction Loan', '2028-01-23', '7252.09', '111.38', '7307.97', 'Not Paid', '7196.59'),
(240, 1, 'Eduaction Loan', '2028-02-22', '0.03', '55.90', '7307.96', 'Not Paid', '7252.06'),
(241, 1, 'Vehicle Loan', '2023-04-19', '78932.35', '583.33', '1650.98', 'Not Paid', '1067.65'),
(242, 1, 'Vehicle Loan', '2023-05-19', '77856.92', '575.55', '1650.98', 'Not Paid', '1075.43'),
(243, 1, 'Vehicle Loan', '2023-06-18', '76773.65', '567.71', '1650.98', 'Not Paid', '1083.27'),
(244, 1, 'Vehicle Loan', '2023-07-18', '75682.48', '559.81', '1650.98', 'Not Paid', '1091.17'),
(245, 1, 'Vehicle Loan', '2023-08-17', '74583.35', '551.85', '1650.98', 'Not Paid', '1099.13'),
(246, 1, 'Vehicle Loan', '2023-09-16', '73476.21', '543.84', '1650.98', 'Not Paid', '1107.14'),
(247, 1, 'Vehicle Loan', '2023-10-16', '72361.00', '535.76', '1650.97', 'Not Paid', '1115.21'),
(248, 1, 'Vehicle Loan', '2023-11-15', '71237.65', '527.63', '1650.98', 'Not Paid', '1123.35'),
(249, 1, 'Vehicle Loan', '2023-12-15', '70106.11', '519.44', '1650.98', 'Not Paid', '1131.54'),
(250, 1, 'Vehicle Loan', '2024-01-14', '68966.32', '511.19', '1650.98', 'Not Paid', '1139.79'),
(251, 1, 'Vehicle Loan', '2024-02-13', '67818.22', '502.88', '1650.98', 'Not Paid', '1148.10'),
(252, 1, 'Vehicle Loan', '2024-03-14', '66661.75', '494.51', '1650.98', 'Not Paid', '1156.47'),
(253, 1, 'Vehicle Loan', '2024-04-13', '65496.85', '486.08', '1650.98', 'Not Paid', '1164.90'),
(254, 1, 'Vehicle Loan', '2024-05-13', '64323.45', '477.58', '1650.98', 'Not Paid', '1173.40'),
(255, 1, 'Vehicle Loan', '2024-06-12', '63141.50', '469.03', '1650.98', 'Not Paid', '1181.95'),
(256, 1, 'Vehicle Loan', '2024-07-12', '61950.93', '460.41', '1650.98', 'Not Paid', '1190.57'),
(257, 1, 'Vehicle Loan', '2024-08-11', '60751.68', '451.73', '1650.98', 'Not Paid', '1199.25'),
(258, 1, 'Vehicle Loan', '2024-09-10', '59543.68', '442.98', '1650.98', 'Not Paid', '1208.00'),
(259, 1, 'Vehicle Loan', '2024-10-10', '58326.87', '434.17', '1650.98', 'Not Paid', '1216.81'),
(260, 1, 'Vehicle Loan', '2024-11-09', '57101.19', '425.30', '1650.98', 'Not Paid', '1225.68'),
(261, 1, 'Vehicle Loan', '2024-12-09', '55866.57', '416.36', '1650.98', 'Not Paid', '1234.62'),
(262, 1, 'Vehicle Loan', '2025-01-08', '54622.95', '407.36', '1650.98', 'Not Paid', '1243.62'),
(263, 1, 'Vehicle Loan', '2025-02-07', '53370.26', '398.29', '1650.98', 'Not Paid', '1252.69'),
(264, 1, 'Vehicle Loan', '2025-03-09', '52108.44', '389.16', '1650.98', 'Not Paid', '1261.82'),
(265, 1, 'Vehicle Loan', '2025-04-08', '50837.42', '379.96', '1650.98', 'Not Paid', '1271.02'),
(266, 1, 'Vehicle Loan', '2025-05-08', '49557.13', '370.69', '1650.98', 'Not Paid', '1280.29'),
(267, 1, 'Vehicle Loan', '2025-06-07', '48267.51', '361.35', '1650.97', 'Not Paid', '1289.62'),
(268, 1, 'Vehicle Loan', '2025-07-07', '46968.48', '351.95', '1650.98', 'Not Paid', '1299.03'),
(269, 1, 'Vehicle Loan', '2025-08-06', '45659.98', '342.48', '1650.98', 'Not Paid', '1308.50'),
(270, 1, 'Vehicle Loan', '2025-09-05', '44341.94', '332.94', '1650.98', 'Not Paid', '1318.04'),
(271, 1, 'Vehicle Loan', '2025-10-05', '43014.29', '323.33', '1650.98', 'Not Paid', '1327.65'),
(272, 1, 'Vehicle Loan', '2025-11-04', '41676.96', '313.65', '1650.98', 'Not Paid', '1337.33'),
(273, 1, 'Vehicle Loan', '2025-12-04', '40329.88', '303.89', '1650.97', 'Not Paid', '1347.08'),
(274, 1, 'Vehicle Loan', '2026-01-03', '38972.97', '294.07', '1650.98', 'Not Paid', '1356.91'),
(275, 1, 'Vehicle Loan', '2026-02-02', '37606.17', '284.18', '1650.98', 'Not Paid', '1366.80'),
(276, 1, 'Vehicle Loan', '2026-03-04', '36229.40', '274.21', '1650.98', 'Not Paid', '1376.77'),
(277, 1, 'Vehicle Loan', '2026-04-03', '34842.59', '264.17', '1650.98', 'Not Paid', '1386.81'),
(278, 1, 'Vehicle Loan', '2026-05-03', '33445.67', '254.06', '1650.98', 'Not Paid', '1396.92'),
(279, 1, 'Vehicle Loan', '2026-06-02', '32038.57', '243.87', '1650.97', 'Not Paid', '1407.10'),
(280, 1, 'Vehicle Loan', '2026-07-02', '30621.21', '233.61', '1650.97', 'Not Paid', '1417.36'),
(281, 1, 'Vehicle Loan', '2026-08-01', '29193.51', '223.28', '1650.98', 'Not Paid', '1427.70'),
(282, 1, 'Vehicle Loan', '2026-08-31', '27755.40', '212.87', '1650.98', 'Not Paid', '1438.11'),
(283, 1, 'Vehicle Loan', '2026-09-30', '26306.80', '202.38', '1650.98', 'Not Paid', '1448.60'),
(284, 1, 'Vehicle Loan', '2026-10-30', '24847.64', '191.82', '1650.98', 'Not Paid', '1459.16'),
(285, 1, 'Vehicle Loan', '2026-11-29', '23377.84', '181.18', '1650.98', 'Not Paid', '1469.80'),
(286, 1, 'Vehicle Loan', '2026-12-29', '21897.32', '170.46', '1650.98', 'Not Paid', '1480.52'),
(287, 1, 'Vehicle Loan', '2027-01-28', '20406.01', '159.67', '1650.98', 'Not Paid', '1491.31'),
(288, 1, 'Vehicle Loan', '2027-02-27', '18903.83', '148.79', '1650.97', 'Not Paid', '1502.18'),
(289, 1, 'Vehicle Loan', '2027-03-29', '17390.69', '137.84', '1650.98', 'Not Paid', '1513.14'),
(290, 1, 'Vehicle Loan', '2027-04-28', '15866.52', '126.81', '1650.98', 'Not Paid', '1524.17'),
(291, 1, 'Vehicle Loan', '2027-05-28', '14331.23', '115.69', '1650.98', 'Not Paid', '1535.29'),
(292, 1, 'Vehicle Loan', '2027-06-27', '12784.75', '104.50', '1650.98', 'Not Paid', '1546.48'),
(293, 1, 'Vehicle Loan', '2027-07-27', '11226.99', '93.22', '1650.98', 'Not Paid', '1557.76'),
(294, 1, 'Vehicle Loan', '2027-08-26', '9657.87', '81.86', '1650.98', 'Not Paid', '1569.12'),
(295, 1, 'Vehicle Loan', '2027-09-25', '8077.31', '70.42', '1650.98', 'Not Paid', '1580.56'),
(296, 1, 'Vehicle Loan', '2027-10-25', '6485.23', '58.90', '1650.98', 'Not Paid', '1592.08'),
(297, 1, 'Vehicle Loan', '2027-11-24', '4881.54', '47.29', '1650.98', 'Not Paid', '1603.69'),
(298, 1, 'Vehicle Loan', '2027-12-24', '3266.16', '35.59', '1650.97', 'Not Paid', '1615.38'),
(299, 1, 'Vehicle Loan', '2028-01-23', '1639.00', '23.82', '1650.98', 'Not Paid', '1627.16'),
(300, 1, 'Vehicle Loan', '2028-02-22', '-0.03', '11.95', '1650.98', 'Not Paid', '1639.03'),
(301, 1, 'Personal Loan', '2023-04-19', '187610.61', '1741.67', '4131.06', 'Not Paid', '2389.39'),
(302, 1, 'Personal Loan', '2023-05-19', '185199.31', '1719.76', '4131.06', 'Not Paid', '2411.30'),
(303, 1, 'Personal Loan', '2023-06-18', '182765.91', '1697.66', '4131.06', 'Not Paid', '2433.40'),
(304, 1, 'Personal Loan', '2023-07-18', '180310.20', '1675.35', '4131.06', 'Not Paid', '2455.71'),
(305, 1, 'Personal Loan', '2023-08-17', '177831.98', '1652.84', '4131.06', 'Not Paid', '2478.22'),
(306, 1, 'Personal Loan', '2023-09-16', '175331.05', '1630.13', '4131.06', 'Not Paid', '2500.93'),
(307, 1, 'Personal Loan', '2023-10-16', '172807.19', '1607.20', '4131.06', 'Not Paid', '2523.86'),
(308, 1, 'Personal Loan', '2023-11-15', '170260.20', '1584.07', '4131.06', 'Not Paid', '2546.99'),
(309, 1, 'Personal Loan', '2023-12-15', '167689.86', '1560.72', '4131.06', 'Not Paid', '2570.34'),
(310, 1, 'Personal Loan', '2024-01-14', '165095.96', '1537.16', '4131.06', 'Not Paid', '2593.90'),
(311, 1, 'Personal Loan', '2024-02-13', '162478.28', '1513.38', '4131.06', 'Not Paid', '2617.68'),
(312, 1, 'Personal Loan', '2024-03-14', '159836.60', '1489.38', '4131.06', 'Not Paid', '2641.68'),
(313, 1, 'Personal Loan', '2024-04-13', '157170.71', '1465.17', '4131.06', 'Not Paid', '2665.89'),
(314, 1, 'Personal Loan', '2024-05-13', '154480.38', '1440.73', '4131.06', 'Not Paid', '2690.33'),
(315, 1, 'Personal Loan', '2024-06-12', '151765.39', '1416.07', '4131.06', 'Not Paid', '2714.99'),
(316, 1, 'Personal Loan', '2024-07-12', '149025.51', '1391.18', '4131.06', 'Not Paid', '2739.88'),
(317, 1, 'Personal Loan', '2024-08-11', '146260.52', '1366.07', '4131.06', 'Not Paid', '2764.99'),
(318, 1, 'Personal Loan', '2024-09-10', '143470.18', '1340.72', '4131.06', 'Not Paid', '2790.34'),
(319, 1, 'Personal Loan', '2024-10-10', '140654.26', '1315.14', '4131.06', 'Not Paid', '2815.92'),
(320, 1, 'Personal Loan', '2024-11-09', '137812.53', '1289.33', '4131.06', 'Not Paid', '2841.73'),
(321, 1, 'Personal Loan', '2024-12-09', '134944.75', '1263.28', '4131.06', 'Not Paid', '2867.78'),
(322, 1, 'Personal Loan', '2025-01-08', '132050.68', '1236.99', '4131.06', 'Not Paid', '2894.07'),
(323, 1, 'Personal Loan', '2025-02-07', '129130.08', '1210.46', '4131.06', 'Not Paid', '2920.60'),
(324, 1, 'Personal Loan', '2025-03-09', '126182.71', '1183.69', '4131.06', 'Not Paid', '2947.37'),
(325, 1, 'Personal Loan', '2025-04-08', '123208.32', '1156.67', '4131.06', 'Not Paid', '2974.39'),
(326, 1, 'Personal Loan', '2025-05-08', '120206.67', '1129.41', '4131.06', 'Not Paid', '3001.65'),
(327, 1, 'Personal Loan', '2025-06-07', '117177.50', '1101.89', '4131.06', 'Not Paid', '3029.17'),
(328, 1, 'Personal Loan', '2025-07-07', '114120.57', '1074.13', '4131.06', 'Not Paid', '3056.93'),
(329, 1, 'Personal Loan', '2025-08-06', '111035.61', '1046.11', '4131.07', 'Not Paid', '3084.96'),
(330, 1, 'Personal Loan', '2025-09-05', '107922.38', '1017.83', '4131.06', 'Not Paid', '3113.23'),
(331, 1, 'Personal Loan', '2025-10-05', '104780.61', '989.29', '4131.06', 'Not Paid', '3141.77'),
(332, 1, 'Personal Loan', '2025-11-04', '101610.04', '960.49', '4131.06', 'Not Paid', '3170.57'),
(333, 1, 'Personal Loan', '2025-12-04', '98410.40', '931.43', '4131.07', 'Not Paid', '3199.64'),
(334, 1, 'Personal Loan', '2026-01-03', '95181.43', '902.10', '4131.07', 'Not Paid', '3228.97'),
(335, 1, 'Personal Loan', '2026-02-02', '91922.87', '872.50', '4131.06', 'Not Paid', '3258.56'),
(336, 1, 'Personal Loan', '2026-03-04', '88634.44', '842.63', '4131.06', 'Not Paid', '3288.43'),
(337, 1, 'Personal Loan', '2026-04-03', '85315.86', '812.48', '4131.06', 'Not Paid', '3318.58'),
(338, 1, 'Personal Loan', '2026-05-03', '81966.86', '782.06', '4131.06', 'Not Paid', '3349.00'),
(339, 1, 'Personal Loan', '2026-06-02', '78587.16', '751.36', '4131.06', 'Not Paid', '3379.70'),
(340, 1, 'Personal Loan', '2026-07-02', '75176.48', '720.38', '4131.06', 'Not Paid', '3410.68'),
(341, 1, 'Personal Loan', '2026-08-01', '71734.54', '689.12', '4131.06', 'Not Paid', '3441.94'),
(342, 1, 'Personal Loan', '2026-08-31', '68261.05', '657.57', '4131.06', 'Not Paid', '3473.49'),
(343, 1, 'Personal Loan', '2026-09-30', '64755.72', '625.73', '4131.06', 'Not Paid', '3505.33'),
(344, 1, 'Personal Loan', '2026-10-30', '61218.25', '593.59', '4131.06', 'Not Paid', '3537.47'),
(345, 1, 'Personal Loan', '2026-11-29', '57648.36', '561.17', '4131.06', 'Not Paid', '3569.89'),
(346, 1, 'Personal Loan', '2026-12-29', '54045.74', '528.44', '4131.06', 'Not Paid', '3602.62'),
(347, 1, 'Personal Loan', '2027-01-28', '50410.10', '495.42', '4131.06', 'Not Paid', '3635.64'),
(348, 1, 'Personal Loan', '2027-02-27', '46741.13', '462.09', '4131.06', 'Not Paid', '3668.97'),
(349, 1, 'Personal Loan', '2027-03-29', '43038.53', '428.46', '4131.06', 'Not Paid', '3702.60'),
(350, 1, 'Personal Loan', '2027-04-28', '39301.99', '394.52', '4131.06', 'Not Paid', '3736.54'),
(351, 1, 'Personal Loan', '2027-05-28', '35531.20', '360.27', '4131.06', 'Not Paid', '3770.79'),
(352, 1, 'Personal Loan', '2027-06-27', '31725.84', '325.70', '4131.06', 'Not Paid', '3805.36'),
(353, 1, 'Personal Loan', '2027-07-27', '27885.60', '290.82', '4131.06', 'Not Paid', '3840.24'),
(354, 1, 'Personal Loan', '2027-08-26', '24010.16', '255.62', '4131.06', 'Not Paid', '3875.44'),
(355, 1, 'Personal Loan', '2027-09-25', '20099.19', '220.09', '4131.06', 'Not Paid', '3910.97'),
(356, 1, 'Personal Loan', '2027-10-25', '16152.37', '184.24', '4131.06', 'Not Paid', '3946.82'),
(357, 1, 'Personal Loan', '2027-11-24', '12169.37', '148.06', '4131.06', 'Not Paid', '3983.00'),
(358, 1, 'Personal Loan', '2027-12-24', '8149.86', '111.55', '4131.06', 'Not Paid', '4019.51'),
(359, 1, 'Personal Loan', '2028-01-23', '4093.51', '74.71', '4131.06', 'Not Paid', '4056.35'),
(360, 1, 'Personal Loan', '2028-02-22', '-0.03', '37.52', '4131.06', 'Not Paid', '4093.54');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `login_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` longtext DEFAULT NULL,
  `Usertype` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`login_id`, `username`, `password`, `Usertype`, `status`) VALUES
(1, 'anad123', 'pbkdf2_sha256$390000$mySalt$Eu/8i394RRHP7jsZWVP2rm0B7n5GWXcFrFbkW7+iJbY=', 'User', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_personal_loan_scheme`
--

CREATE TABLE `tbl_personal_loan_scheme` (
  `personal_loan_id` int(11) NOT NULL,
  `cibil_score` varchar(50) NOT NULL,
  `loan_limit` int(11) NOT NULL,
  `Tenure` int(11) NOT NULL,
  `rate` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_personal_loan_scheme`
--

INSERT INTO `tbl_personal_loan_scheme` (`personal_loan_id`, `cibil_score`, `loan_limit`, `Tenure`, `rate`) VALUES
(1, '800 Above', 5000000, 72, '10.35'),
(2, '750 - 799', 5000000, 72, '10.45'),
(3, '700 - 749', 5000000, 72, '10.55'),
(4, '650 - 699', 4500000, 60, '11.00'),
(5, '550 - 649', 4500000, 60, '11.15');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vehicle_loan_scheme`
--

CREATE TABLE `tbl_vehicle_loan_scheme` (
  `vehicle_loan_id` int(11) NOT NULL,
  `cibil_score` varchar(50) NOT NULL,
  `vehicle_type` varchar(50) NOT NULL,
  `rate` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_vehicle_loan_scheme`
--

INSERT INTO `tbl_vehicle_loan_scheme` (`vehicle_loan_id`, `cibil_score`, `vehicle_type`, `rate`) VALUES
(1, '800 Above', 'Two-Wheeler Loan', '8.65'),
(2, '750 - 799', 'Two-Wheeler Loan', '8.75'),
(3, '700 - 749', 'Two-Wheeler Loan', '8.85'),
(4, '650 - 699', 'Two-Wheeler Loan', '8.95'),
(5, '550 - 649', 'Two-Wheeler Loan', '9.05'),
(6, '800 Above', 'Four-Wheeler Loan', '8.25'),
(7, '750 - 799', 'Four-Wheeler Loan', '8.35'),
(8, '700 - 749', 'Four-Wheeler Loan', '8.45'),
(9, '650 - 699', 'Four-Wheeler Loan', '8.55'),
(10, '550 - 649', 'Four-Wheeler Loan', '8.65');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `tbl_application_edu_loan`
--
ALTER TABLE `tbl_application_edu_loan`
  ADD PRIMARY KEY (`appl_edu_loan_id`);

--
-- Indexes for table `tbl_application_home_loan`
--
ALTER TABLE `tbl_application_home_loan`
  ADD PRIMARY KEY (`appl_home_loan_id`);

--
-- Indexes for table `tbl_application_personal_loan`
--
ALTER TABLE `tbl_application_personal_loan`
  ADD PRIMARY KEY (`appl_personal_loan_id`);

--
-- Indexes for table `tbl_application_vehicle_loan`
--
ALTER TABLE `tbl_application_vehicle_loan`
  ADD PRIMARY KEY (`appl_vehicle_loan_id`);

--
-- Indexes for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_edu_loan_scheme`
--
ALTER TABLE `tbl_edu_loan_scheme`
  ADD PRIMARY KEY (`education_loan_id`);

--
-- Indexes for table `tbl_home_loan_scheme`
--
ALTER TABLE `tbl_home_loan_scheme`
  ADD PRIMARY KEY (`home_loan_id`);

--
-- Indexes for table `tbl_loan_payment`
--
ALTER TABLE `tbl_loan_payment`
  ADD PRIMARY KEY (`loan_payment_loan_id`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `tbl_personal_loan_scheme`
--
ALTER TABLE `tbl_personal_loan_scheme`
  ADD PRIMARY KEY (`personal_loan_id`);

--
-- Indexes for table `tbl_vehicle_loan_scheme`
--
ALTER TABLE `tbl_vehicle_loan_scheme`
  ADD PRIMARY KEY (`vehicle_loan_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tbl_application_edu_loan`
--
ALTER TABLE `tbl_application_edu_loan`
  MODIFY `appl_edu_loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_application_home_loan`
--
ALTER TABLE `tbl_application_home_loan`
  MODIFY `appl_home_loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_application_personal_loan`
--
ALTER TABLE `tbl_application_personal_loan`
  MODIFY `appl_personal_loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_application_vehicle_loan`
--
ALTER TABLE `tbl_application_vehicle_loan`
  MODIFY `appl_vehicle_loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_edu_loan_scheme`
--
ALTER TABLE `tbl_edu_loan_scheme`
  MODIFY `education_loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_home_loan_scheme`
--
ALTER TABLE `tbl_home_loan_scheme`
  MODIFY `home_loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_loan_payment`
--
ALTER TABLE `tbl_loan_payment`
  MODIFY `loan_payment_loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=361;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_personal_loan_scheme`
--
ALTER TABLE `tbl_personal_loan_scheme`
  MODIFY `personal_loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_vehicle_loan_scheme`
--
ALTER TABLE `tbl_vehicle_loan_scheme`
  MODIFY `vehicle_loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
