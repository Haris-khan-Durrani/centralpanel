-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 29, 2024 at 09:23 PM
-- Server version: 5.7.42-log
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `checklist`
--

-- --------------------------------------------------------

--
-- Table structure for table `3cx_setting`
--

CREATE TABLE `3cx_setting` (
  `companyname` varchar(500) DEFAULT NULL,
  `ackey` varchar(500) DEFAULT NULL,
  `fqdn` varchar(500) DEFAULT NULL,
  `dhiturl` varchar(5000) DEFAULT NULL,
  `extension` varchar(5000) DEFAULT NULL,
  `cid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `3cx_setting`
--

INSERT INTO `3cx_setting` (`companyname`, `ackey`, `fqdn`, `dhiturl`, `extension`, `cid`) VALUES
('EBMS Business Services', 'JNJP5UqGDhX89ue2POsb1Kto', 'ebmsdxb.3cx.ae:3081', 'https://services.leadconnectorhq.com/hooks/gaLwORwdEGHxCHjEqZ1C/webhook-trigger/c03a4e89-739b-4cfa-b06f-993d210804c0', '702,705,724,706,704', 1);

-- --------------------------------------------------------

--
-- Table structure for table `clusers`
--

CREATE TABLE `clusers` (
  `id` int(11) NOT NULL,
  `Username` varchar(250) NOT NULL,
  `useremail` varchar(250) NOT NULL,
  `role` varchar(250) NOT NULL,
  `status` varchar(250) NOT NULL,
  `userphone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clusers`
--

INSERT INTO `clusers` (`id`, `Username`, `useremail`, `role`, `status`, `userphone`) VALUES
(1, 'Haris Khan', 'it@ebmsbusiness.com', 'admin', 'Active', '971551651588'),
(2, 'Kainath Petiwala', 'operation@ebmsbusiness.com', 'Freezone', 'Active', '+971524185587'),
(4, 'Mindi', 'mindi@ebmsbusiness.com', 'Freezone', 'Active', '971503884105'),
(5, 'Melissa Gloria', 'melissa@ebmsbusiness.com', 'Central', 'Active', '+971521980449'),
(6, 'Sam', 'license@ebmsbusiness.com', 'Freezone', 'Active', '+971564228582'),
(7, 'Ghayoor', 'visa@ebmsbusiness.com', 'Freezone', 'Active', '+971508384299'),
(8, 'Chamod Navindu Disnaka', 'chamod@ebmsbusiness.com', 'Central', 'Active', '+971521369792'),
(9, 'Zareen', 'bankingsupport@ebmsbusiness.com', 'Central', 'Active', '971534236596'),
(10, 'Abdul Salam', 'afzafreezone@gmail.com', 'Central', 'Active', '+971551745764'),
(11, 'Muneeb Ali', 'Muneebali.ebms@gmail.com', 'Central', 'Active', '+971585747791'),
(12, 'Nagaraj', 'accounts@ebmsbusiness.com', 'Accounts', 'Active', '+971586644386'),
(13, 'Fawaz', 'accounts@accountdubai.com', 'User', 'Active', '+971527216082'),
(14, 'ShujaCP', 'shujakhan344@gmail.com', 'CP', 'Active', '+971506498601');

-- --------------------------------------------------------

--
-- Table structure for table `domain_config`
--

CREATE TABLE `domain_config` (
  `id` int(11) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `location_id` varchar(255) DEFAULT NULL,
  `v_location_id` varchar(255) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `background` varchar(255) DEFAULT NULL,
  `dark_back` varchar(255) DEFAULT NULL,
  `side_dark_back` varchar(255) DEFAULT NULL,
  `side_back` varchar(255) DEFAULT NULL,
  `grid_back` varchar(255) DEFAULT NULL,
  `dark_grid_back` varchar(255) DEFAULT NULL,
  `text_light` varchar(255) DEFAULT NULL,
  `text_dark` varchar(255) DEFAULT NULL,
  `icon_button_back` varchar(255) DEFAULT NULL,
  `button_bottom_border` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `heading_color` varchar(255) DEFAULT NULL,
  `emcode` longtext NOT NULL,
  `cfv` longtext,
  `cvv` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `domain_config`
--

INSERT INTO `domain_config` (`id`, `domain`, `location_id`, `v_location_id`, `logo_url`, `background`, `dark_back`, `side_dark_back`, `side_back`, `grid_back`, `dark_grid_back`, `text_light`, `text_dark`, `icon_button_back`, `button_bottom_border`, `company_name`, `company_address`, `heading_color`, `emcode`, `cfv`, `cvv`) VALUES
(1, 'checklist.crmsoftware.ae', 'we76ZNkRTRiRHCVaGXjw', 'we76ZNkRTRiRHCVaGXjw', 'https://ebmsbusiness.com/wp-content/uploads/2021/02/ebms-logo.png', 'bg-white', 'bg-zinc-950', 'bg-zinc-900', 'bg-slate-50', 'bg-gray-100', 'bg-zinc-900', 'text-gray-900', 'text-white', 'bg-sky-900', 'rounded-full', 'All Checklist Form', 'Park1 Place Tower - Office No 401 Sheikh Zayed Rd - Trade Centre - Trade Centre 1 - Dubai', 'text-sky-600', '                                                                                                                                                                                                                                                                                                                                                                                                                                    <style>\r\n.border-red-700{\r\ncursor:pointer\r\n}\r\n.Addon{\r\npadding:0px !important;\r\nmargin:0px !important\r\n}\r\n\r\n.menlink{\r\nbackground-color:rgba(40, 54, 255, 0.04);\r\n\r\n}\r\na .left-1/2{\r\ncolor:white !important\r\n}\r\n</style>\r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    ', '                                                                                                                                                                                                                                                                                                                                { key: \'contact.upload_screening\', title: \'Screening\' },\r\n{ key: \'contact.upload_kyc\', title: \'KYC\' },\r\n{ key: \'contact.upload_freezone_proposal\', title: \'Freezone Proposal\' },\r\n{ key: \'contact.upload_application_form\', title: \'Application Form\' },\r\n{ key: \'contact.upload_license\', title: \'License\' },\r\n{ key: \'contact.upload_certificate_of_formation\', title: \'Certificate Of Formation\' },\r\n{ key: \'contact.upload_lease_agreement\', title: \'Lease Agreement\' },\r\n\r\n{ key: \'contact.uplod_memorandum\', title: \'Memorandum\' },\r\n{ key: \'contact.upload_occupancy_agreement\', title: \'Occupancy Agreement\' },\r\n{ key: \'contact.upload_business_activity\', title: \'Business Activity Certificate\' },\r\n{ key: \'contact.upload_immigration_card\', title: \'Immigiration Card\' },\r\n{ key: \'contact.virtual_address\', title: \'Virtual Address\' },\r\n{ key: \'contact.article_of_association\', title: \'Artical Of Association\' },\r\n{ key: \'contact.declaration_from_the_manger\', title: \'Declaration from The Manager\' },\r\n{ key: \'contact.resolution_for_the_incorporation\', title: \'Resolution From The Incorporation\' },\r\n{ key: \'contact.specimen_signature\', title: \'Speciman Signature\' },\r\n{ key: \'contact.certificate_of_incorporation\', title: \'Certificate of Formation\' },\r\n{ key: \'contact.upload_investment_service_agreement\', title: \'Investment Service Agreement\' },\r\n{ key: \'contact.commercial_registry_certificate\', title: \'Commercial Registry Certificate\' },\r\n{ key: \'contact.shareholder_1_passport__1\', title: \'1 Shareholder Passport 1\' },\r\n{ key: \'contact.shareholder_1_passport__2\', title: \'1 Shareholder Passport 2\' },\r\n{ key: \'contact.shareholder_2_passport__1\', title: \'2 Shareholder Passport 1\' },\r\n{ key: \'contact.shareholder_2_passport__2\', title: \'2 Shareholder Passport 2\' },\r\n{ key: \'contact.shareholder_3_passport__1\', title: \'3 Shareholder Passport 1\' },\r\n{ key: \'contact.shareholder_3_passport__2\', title: \'3 Shareholder Passport 2\' },\r\n{ key: \'contact.shareholder_4_passport__1\', title: \'4 Shareholder Passport 1\' },\r\n{ key: \'contact.shareholder_4_passport__2\', title: \'4 Shareholder Passport 2\' },\r\n{ key: \'contact.shareholder_5_passport__1\', title: \'5 Shareholder Passport 1\' },\r\n{ key: \'contact.shareholder_5_passport__2\', title: \'5 Shareholder Passport 2\' },\r\n{ key: \'contact.shareholder_6_passport__1\', title: \'6 Shareholder Passport 1\' },\r\n{ key: \'contact.shareholder_6_passport__2\', title: \'6 Shareholder Passport 2\' },\r\n{ key: \'contact.shareholder_1_emirates_id__front\', title: \'1 Shareholder Emirates ID Front\' },\r\n{ key: \'contact.shareholder_1_emirates_id__back\', title: \'1 Shareholder Emirates ID Back\' },\r\n{ key: \'contact.shareholder_2_emirates_id__front\', title: \'2 Shareholder Emirates ID Front\' },\r\n{ key: \'contact.shareholder_2_emirates_id__back\', title: \'2 Shareholder Emirates ID Back\' },\r\n{ key: \'contact.shareholder_3_emirates_id__front\', title: \'3 Shareholder Emirates ID Front\' },\r\n{ key: \'contact.shareholder_3_emirates_id__back\', title: \'3 Shareholder Emirates ID Back\' },\r\n{ key: \'contact.shareholder_4_emirates_id__front\', title: \'4 Shareholder Emirates ID Front\' },\r\n{ key: \'contact.shareholder_4_emirates_id__back\', title: \'4 Shareholder Emirates ID Back\' },\r\n{ key: \'contact.shareholder_5_emirates_id__front\', title: \'5 Shareholder Emirates ID Front\' },\r\n{ key: \'contact.shareholder_5_emirates_id__back\', title: \'5 Shareholder Emirates ID Back\' },\r\n{ key: \'contact.shareholder_6_emirates_id__front\', title: \'6 Shareholder Emirates ID Front\' },\r\n{ key: \'contact.shareholder_6_emirates_id__back\', title: \'6 Shareholder Emirates ID Back\' },\r\n{ key: \'contact.shareholder_1_cancellation_papers\', title: \'1 Shareholder Cancellation Paper\' },\r\n{ key: \'contact.shareholder_2_cancellation_papers\', title: \'2 Shareholder Cancellation Paper\' },\r\n{ key: \'contact.shareholder_3_cancellation_papers\', title: \'3 Shareholder Cancellation Paper\' },\r\n{ key: \'contact.shareholder_4_cancellation_papers\', title: \'4 Shareholder Cancellation Paper\' },\r\n{ key: \'contact.shareholder_5_cancellation_papers\', title: \'5 Shareholder Cancellation Paper\' },\r\n{ key: \'contact.shareholder_6_cancellation_papers\', title: \'6 Shareholder Cancellation Paper\' },\r\n{ key: \'contact.shareholder_1_visa_copy\', title: \'1 Shareholder Visa Copy\' },\r\n{ key: \'contact.shareholder_2_visa_copy\', title: \'2 Shareholder Visa Copy\' },\r\n{ key: \'contact.shareholder_3_visa_copy\', title: \'3 Shareholder Visa Copy\' },\r\n{ key: \'contact.shareholder_4_visa_copy\', title: \'4 Shareholder Visa Copy\' },\r\n{ key: \'contact.shareholder_5_visa_copy\', title: \'5 Shareholder Visa Copy\' },\r\n{ key: \'contact.shareholder_6_visa_copy\', title: \'6 Shareholder Visa Copy\' },\r\n{ key: \'contact.proposal\', title: \'Proposal\' },\r\n{ key: \'contact.application_form\', title: \'Application Form\' },\r\n{ key: \'contact.passport__emirates_id\', title: \'Passport & Emirates ID\' },\r\n{ key: \'contact.trade_name\', title: \'Trade Name\' },\r\n{ key: \'contact.initial_trade_name_certificate\', title: \'Initial Trade Name Certificate\' },\r\n{ key: \'contact.initial_approval\', title: \'Initial Approval\' },\r\n{ key: \'contact.initial_approval_certificate\', title: \'Initial Approval Certificate\' },\r\n{ key: \'contact.external_approval\', title: \'External Approval\' },\r\n{ key: \'contact.instant_lsamoa\', title: \'Instant-LSA/MOA\' },\r\n{ key: \'contact.moa__lsa\', title: \'MOA/LSA\' },\r\n{ key: \'contact.ejari\', title: \'Ejari\' },\r\n{ key: \'contact.payment_voucher\', title: \'Payment Voucher\' },\r\n{ key: \'contact.license\', title: \'License\' }\r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    ', '                                                            { key: \'contact.e_visa_proof_of_payment\', title: \'E-Visa Proof OF Payment\' },\r\n{ key: \'contact.upload_e_visa\', title: \'E-Visa\' },\r\n{ key: \'contact.upload_change_status\', title: \'Change Status\' },\r\n{ key: \'contact.upload_medical__emirates_id_payment_proof\', title: \'Medical & Emirates Id Payment Proof\' },\r\n{ key: \'contact.upload_medical_fitness_report\', title: \'Medical Fitness Report\' },\r\n{ key: \'contact.upload_stamped_bio_metric\', title: \'Stamped Bio Metric\' },\r\n{ key: \'contact.upload_residence_visa_stamping\', title: \'Residence Visa Stamping\' },\r\n{ key: \'contact.upload_emirates_id\', title: \'Emirates ID\' }\r\n                    \r\n                    \r\n                    '),
(2, 'cp-portal.ebmsbusiness.com', 'N2WFjzprq6BuyzRjJzNl', 'we76ZNkRTRiRHCVaGXjw', 'https://ebmsbusiness.com/wp-content/uploads/2021/02/ebms-logo.png', 'bg-white', 'bg-zinc-950', 'bg-zinc-900', 'bg-slate-50', 'bg-gray-100', 'bg-zinc-900', 'text-gray-900', 'text-white', 'bg-sky-900', 'rounded-full', 'Channel Partner', 'Park1 Place Tower - Office No 401 Sheikh Zayed Rd - Trade Centre - Trade Centre 1 - Dubai', 'text-sky-600', '                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <style>\r\n.border-red-700{\r\ncursor:pointer\r\n}\r\n.Addon{\r\npadding:0px !important;\r\nmargin:0px !important\r\n}\r\n\r\n.menlink{\r\nbackground-color:rgba(40, 54, 255, 0.04);\r\n\r\n}\r\na .left-1/2{\r\ncolor:white !important\r\n}\r\n</style>\r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    ', '                                                                                                                                                                                                                                                                                                                                                                                                                                    { key: \'contact.upload_screening\', title: \'Screening\' },\r\n{ key: \'contact.upload_kyc\', title: \'KYC\' },\r\n{ key: \'contact.upload_freezone_proposal\', title: \'Freezone Proposal\' },\r\n{ key: \'contact.upload_application_form\', title: \'Application Form\' },\r\n{ key: \'contact.upload_license\', title: \'License\' },\r\n{ key: \'contact.upload_certificate_of_formation\', title: \'Certificate Of Formation\' },\r\n{ key: \'contact.upload_lease_agreement\', title: \'Lease Agreement\' },\r\n\r\n{ key: \'contact.uplod_memorandum\', title: \'Memorandum\' },\r\n{ key: \'contact.upload_occupancy_agreement\', title: \'Occupancy Agreement\' },\r\n{ key: \'contact.upload_business_activity\', title: \'Business Activity Certificate\' },\r\n{ key: \'contact.upload_immigration_card\', title: \'Immigiration Card\' },\r\n{ key: \'contact.virtual_address\', title: \'Virtual Address\' },\r\n{ key: \'contact.article_of_association\', title: \'Artical Of Association\' },\r\n{ key: \'contact.declaration_from_the_manger\', title: \'Declaration from The Manager\' },\r\n{ key: \'contact.resolution_for_the_incorporation\', title: \'Resolution From The Incorporation\' },\r\n{ key: \'contact.specimen_signature\', title: \'Speciman Signature\' },\r\n{ key: \'contact.certificate_of_incorporation\', title: \'Certificate of Formation\' },\r\n{ key: \'contact.upload_investment_service_agreement\', title: \'Investment Service Agreement\' },\r\n{ key: \'contact.commercial_registry_certificate\', title: \'Commercial Registry Certificate\' },\r\n{ key: \'contact.shareholder_1_passport__1\', title: \'1 Shareholder Passport 1\' },\r\n{ key: \'contact.shareholder_1_passport__2\', title: \'1 Shareholder Passport 2\' },\r\n{ key: \'contact.shareholder_2_passport__1\', title: \'2 Shareholder Passport 1\' },\r\n{ key: \'contact.shareholder_2_passport__2\', title: \'2 Shareholder Passport 2\' },\r\n{ key: \'contact.shareholder_3_passport__1\', title: \'3 Shareholder Passport 1\' },\r\n{ key: \'contact.shareholder_3_passport__2\', title: \'3 Shareholder Passport 2\' },\r\n{ key: \'contact.shareholder_4_passport__1\', title: \'4 Shareholder Passport 1\' },\r\n{ key: \'contact.shareholder_4_passport__2\', title: \'4 Shareholder Passport 2\' },\r\n{ key: \'contact.shareholder_5_passport__1\', title: \'5 Shareholder Passport 1\' },\r\n{ key: \'contact.shareholder_5_passport__2\', title: \'5 Shareholder Passport 2\' },\r\n{ key: \'contact.shareholder_6_passport__1\', title: \'6 Shareholder Passport 1\' },\r\n{ key: \'contact.shareholder_6_passport__2\', title: \'6 Shareholder Passport 2\' },\r\n{ key: \'contact.shareholder_1_emirates_id__front\', title: \'1 Shareholder Emirates ID Front\' },\r\n{ key: \'contact.shareholder_1_emirates_id__back\', title: \'1 Shareholder Emirates ID Back\' },\r\n{ key: \'contact.shareholder_2_emirates_id__front\', title: \'2 Shareholder Emirates ID Front\' },\r\n{ key: \'contact.shareholder_2_emirates_id__back\', title: \'2 Shareholder Emirates ID Back\' },\r\n{ key: \'contact.shareholder_3_emirates_id__front\', title: \'3 Shareholder Emirates ID Front\' },\r\n{ key: \'contact.shareholder_3_emirates_id__back\', title: \'3 Shareholder Emirates ID Back\' },\r\n{ key: \'contact.shareholder_4_emirates_id__front\', title: \'4 Shareholder Emirates ID Front\' },\r\n{ key: \'contact.shareholder_4_emirates_id__back\', title: \'4 Shareholder Emirates ID Back\' },\r\n{ key: \'contact.shareholder_5_emirates_id__front\', title: \'5 Shareholder Emirates ID Front\' },\r\n{ key: \'contact.shareholder_5_emirates_id__back\', title: \'5 Shareholder Emirates ID Back\' },\r\n{ key: \'contact.shareholder_6_emirates_id__front\', title: \'6 Shareholder Emirates ID Front\' },\r\n{ key: \'contact.shareholder_6_emirates_id__back\', title: \'6 Shareholder Emirates ID Back\' },\r\n{ key: \'contact.shareholder_1_cancellation_papers\', title: \'1 Shareholder Cancellation Paper\' },\r\n{ key: \'contact.shareholder_2_cancellation_papers\', title: \'2 Shareholder Cancellation Paper\' },\r\n{ key: \'contact.shareholder_3_cancellation_papers\', title: \'3 Shareholder Cancellation Paper\' },\r\n{ key: \'contact.shareholder_4_cancellation_papers\', title: \'4 Shareholder Cancellation Paper\' },\r\n{ key: \'contact.shareholder_5_cancellation_papers\', title: \'5 Shareholder Cancellation Paper\' },\r\n{ key: \'contact.shareholder_6_cancellation_papers\', title: \'6 Shareholder Cancellation Paper\' },\r\n{ key: \'contact.shareholder_1_visa_copy\', title: \'1 Shareholder Visa Copy\' },\r\n{ key: \'contact.shareholder_2_visa_copy\', title: \'2 Shareholder Visa Copy\' },\r\n{ key: \'contact.shareholder_3_visa_copy\', title: \'3 Shareholder Visa Copy\' },\r\n{ key: \'contact.shareholder_4_visa_copy\', title: \'4 Shareholder Visa Copy\' },\r\n{ key: \'contact.shareholder_5_visa_copy\', title: \'5 Shareholder Visa Copy\' },\r\n{ key: \'contact.shareholder_6_visa_copy\', title: \'6 Shareholder Visa Copy\' },\r\n{ key: \'contact.proposal\', title: \'Proposal\' },\r\n{ key: \'contact.application_form\', title: \'Application Form\' },\r\n{ key: \'contact.passport__emirates_id\', title: \'Passport & Emirates ID\' },\r\n{ key: \'contact.trade_name\', title: \'Trade Name\' },\r\n{ key: \'contact.initial_trade_name_certificate\', title: \'Initial Trade Name Certificate\' },\r\n{ key: \'contact.initial_approval\', title: \'Initial Approval\' },\r\n{ key: \'contact.initial_approval_certificate\', title: \'Initial Approval Certificate\' },\r\n{ key: \'contact.external_approval\', title: \'External Approval\' },\r\n{ key: \'contact.instant_lsamoa\', title: \'Instant-LSA/MOA\' },\r\n{ key: \'contact.moa__lsa\', title: \'MOA/LSA\' },\r\n{ key: \'contact.ejari\', title: \'Ejari\' },\r\n{ key: \'contact.payment_voucher\', title: \'Payment Voucher\' },\r\n{ key: \'contact.license\', title: \'License\' }\r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    ', '                                                                                                                                                                { key: \'contact.e_visa_proof_of_payment\', title: \'E-Visa Proof OF Payment\' },\r\n{ key: \'contact.upload_e_visa\', title: \'E-Visa\' },\r\n{ key: \'contact.upload_change_status\', title: \'Change Status\' },\r\n{ key: \'contact.upload_medical__emirates_id_payment_proof\', title: \'Medical & Emirates Id Payment Proof\' },\r\n{ key: \'contact.upload_medical_fitness_report\', title: \'Medical Fitness Report\' },\r\n{ key: \'contact.upload_stamped_bio_metric\', title: \'Stamped Bio Metric\' },\r\n{ key: \'contact.upload_residence_visa_stamping\', title: \'Residence Visa Stamping\' },\r\n{ key: \'contact.upload_emirates_id\', title: \'Emirates ID\' }\r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    ');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `feature_image_url` varchar(255) NOT NULL,
  `landing_page_url` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `domain`, `icon`, `title`, `feature_image_url`, `landing_page_url`, `created_at`, `updated_at`) VALUES
(50, 'checklist.crmsoftware.ae', '<i class=\"fa-solid fa-magnifying-glass\"></i>', 'Expert Plus Freezone', 'https://ebmsbusiness.com/wp-content/uploads/2021/02/ebms-logo.png', 'https://checklist.crmsoftware.ae/Expert Plus Freezone/RaMX8aRPgsxsz1iIvJTn/KlCDVqGjmyJyWrHMJP10/dashboard', '2024-07-03 07:28:53', '2024-07-17 10:01:34'),
(56, 'checklist.crmsoftware.ae', '<i class=\"fa-solid fa-magnifying-glass\"></i>', 'EBMS Freezone', 'https://ebmsbusiness.com/wp-content/uploads/2021/02/ebms-logo.png', 'https://checklist.crmsoftware.ae/EBMS Business Services/N2WFjzprq6BuyzRjJzNl/U1rqLdAWOqXSU1X1nFXB/dashboard', '2024-07-03 07:28:53', '2024-07-17 09:51:38'),
(57, 'checklist.crmsoftware.ae', '<i class=\"fa-solid fa-magnifying-glass\"></i>', 'POSITIVE ZONE', 'https://ebmsbusiness.com/wp-content/uploads/2021/02/ebms-logo.png', 'https://checklist.crmsoftware.ae/POSITIVE ZONE/5gGLQlyjPr1Tq4ndokP1/PrXdHgTixh6kLJaEzLkF/dashboard', '2024-07-03 07:28:53', '2024-07-17 10:05:58'),
(58, 'checklist.crmsoftware.ae', '<i class=\"fa-solid fa-magnifying-glass\"></i>', 'Easyway Freezone', 'https://ebmsbusiness.com/wp-content/uploads/2021/02/ebms-logo.png', 'https://checklist.crmsoftware.ae/Easyway Freezone/SljjOCSKys3hP4eTRkMg/Z41IU9EOo70c8YWop2vj/dashboard', '2024-07-03 07:28:53', '2024-07-17 10:28:29'),
(59, 'checklist.crmsoftware.ae', '<i class=\"fa-solid fa-magnifying-glass\"></i>', 'Excellence Freezone', 'https://ebmsbusiness.com/wp-content/uploads/2021/02/ebms-logo.png', 'https://checklist.crmsoftware.ae/Excellence Freezone/iBg8DQNxQsR8Riaehhag/tqJ1AHkLzv8hC6SzXBc4/dashboard', '2024-07-03 07:28:53', '2024-07-17 10:32:59'),
(60, 'checklist.crmsoftware.ae', '<i class=\"fa-solid fa-magnifying-glass\"></i>', 'Mainland Operation', 'https://ebmsbusiness.com/wp-content/uploads/2021/02/ebms-logo.png', 'https://checklist.crmsoftware.ae/Mainland/Uvo6RSAIlkSCHuHQbgyJ/Uvo6RSAIlkSCHuHQbgyJ/dashboard', '2024-07-03 07:28:53', '2024-07-22 11:19:16'),
(61, 'cp-portal.ebmsbusiness.com', '<i class=\"fa-solid fa-magnifying-glass\"></i>', 'All Freezone Companies', 'https://ebmsbusiness.com/wp-content/uploads/2021/02/ebms-logo.png', 'https://cp-portal.ebmsbusiness.com/EBMS Business Services/N2WFjzprq6BuyzRjJzNl/U1rqLdAWOqXSU1X1nFXB/dashboard', '2024-08-21 12:45:53', '2024-08-21 12:48:17');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('-BiCJeYu0E63ueLiiutO3RUKp_MD0-4o', 1725022332, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('-IYKycrZX_ZLFyBRTB-QgctjJWTOY0iW', 1725007723, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('-KuKb2Nft5ZyZZlw_wDp2KfIXYijbyca', 1725021239, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('-M4FPmFthvDLLVgoZkhiY9EcRJOg0l65', 1725008869, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('-Xv4MJ8FdJCLiIFMR9Ad1I1JVIuTwaYj', 1724939218, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('-aZxLZl0OB3zdXWvvEz_Aus1bnPe1AS8', 1725007790, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('-iAztMLmMu-YJf04Bd7BgCGc8TNWhM9K', 1725003178, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('-jbSPq4miODjpMuJ9dlR9TXVk-Q2kQPL', 1725008826, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('-qPXBuCVu1SzGDYrYeK-p0wq6CBcwAVu', 1725008863, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('0YO0vG2Keu2yAlu_80J692ACsV5xx_9Y', 1725007800, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('0hxwy2mThYewnb-GTg4XAZSKOwgzVJBY', 1725003186, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('0mSWGk4De-aS1G1qxJbV0f5SpiH4e6bz', 1725021445, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('14D1OU_BXK450asdhp2ANf9KCQM3m5jo', 1725023188, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('1La6M6qukxlnJ8LRTbe2aTXBORl0fLpT', 1725003004, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('1qYIt7i1kOBmjfy7hxsXhy5wqznoSCPO', 1725020521, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('1tJSVuNDkDoy2XIsAL3maBmolxl83kuT', 1725006690, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('20ljmG6KavyOs9k5hmekPap-yPBERegH', 1725015317, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('24Sz9RLTxoAZEFAxkQ_TKnOuIGcWt2m9', 1725006765, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('2Q4bExhgwkU-jTE-mfGhViaNiLZj1i-b', 1725003057, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('2Rj2GlCUQXawasdTbHHosRyAZPfwY5-T', 1725008818, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('2TyeaHyeBc4ZK3LBpat53Dxb4Jw1YG1w', 1725003059, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('2YcBRqCPpO8h8u6kPMlNuM-Z1_gTwqGk', 1725008888, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('2qtZp_UJqaj22_IYDF7kAK2vFvPg7UeY', 1725021505, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('30rSl42wi5FM0m1XTLmcJg9e53p9M_B5', 1725021245, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('37eeiVIaksRkNaVplGvBdoS2MG1Mn78v', 1725003033, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('3Hyj3cW8arRC7nR6WxG_KR4deO-FxpHN', 1725015246, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('3LXx3bUyT6nWYUouYA346GgTMJKzef-k', 1725006725, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('3PmCSm7zx5tIvMfJwG20MnMuc84Uwnj2', 1725003053, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('3S6wo0k5-yTjkLYb2EVmkmO7TqhCJoO5', 1725015249, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('3X0vMLc0FKYxLoszCOYfq2WhOSx4TG3Y', 1725008854, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('3fEz7xbKO_DXWIsys8x2AN0W9WDMfiXP', 1725003091, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('3n7ZMF5oku08nLz35XioEGGCaftY8B5U', 1725003006, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('3uo2qp3KpMIAfDwNbfpW9HBEC9R7PYWu', 1725002968, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('43gddbGBfE28dUuKUf31y7DP1ALvceKH', 1725008818, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('49LcFiBGtQcJtsnMia9heDIe3xQElnC1', 1724942632, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('4C_rEzEtHGDhe2ZfIpK0bxbhOEPFv4u2', 1725003057, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('4EJvB6q_5FIMkYb4rwW8SEfp6ESJ2PcO', 1724938162, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('4K9PYgsjMANStb-VGnOPAREwIW1o4owJ', 1725006639, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('4Krw_xQHiW_9oL4ExYd_fw0jkSaPQXag', 1725005859, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('4ZdDbGxT6oQ5mOFTSVREgqF5Ou4MiqlA', 1725020514, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('4ZePqs2ggKWiUEbMRvvWjVvZ67d5vxko', 1725007785, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('4psQq0mw8bZ6xA3nPw5WRCKp_ipNyAji', 1725005859, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('4rWXd333fcnDq8eZ6LrS1LUNpcqMfIB3', 1725003015, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('4wg8bHlsieLcIlt4IfW0HLKhQMOJuk0F', 1725023055, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('51Yo-3j4WbZHa8oYzDxxO9G8XBx807Wq', 1725006698, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('52jHDo0us5hi7LVl-fGwWSEqvATFORK-', 1725008879, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('5UMdYBOLDEInawxevh4xnhe0S-QDWRtF', 1725003130, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('5WxSKOy0dmwqxAPDIGZulnWkXjhT0a6N', 1725003091, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('5hz8KZi2B0pLYJBvY4vgTxTjAZqin9cs', 1725006680, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('5lHZDz4kyGn-yvrdjOCjpLUCSkXvs8ZU', 1725006765, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('5smEyHgxq7H9KfNY9RwnaMnjt0p5nvUW', 1725003137, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('61Dx4AejNPvVX5p8qnq6o-2dZnLRiJLx', 1725015223, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('67GEqqTbMsSSK-W82vioTSbBZHSPAzNZ', 1725003174, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('6KLrVIx3q78SOQdhh_0YDZEOijwM_sGX', 1725003054, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('6PSKbqhPM9MKVW0PY6IKHuGbHkJZU35B', 1725021829, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('6SGnsugMyB69DdIW9ckS8T9WnC-bcsDh', 1725003004, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('6TB058KDeN3Gqpkw4KG4m9xw33JxLSi2', 1725021505, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('6UfOfehNsBTMSTY_viAPLf7jUKJjtBxb', 1725002972, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('6Zn0t4g8Z-KERwoUU2H7RaRW-2wptlTg', 1725008863, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('6e9Xzu4mddXpL1teB9ml68jDRuqKkITY', 1725006107, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"user\":\"it@ebmsbusiness.com\",\"namo\":\"Haris Khan\",\"role\":\"admin\",\"status\":\"Active\"}'),
('6h7F38xow9jAAPrwP00MiIOFH5X2BgUf', 1725003025, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('6mbGLV51Fw_LN3ulxqRTKCNlNZeM7cIS', 1725015140, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('6nXR18LHMsiquXXuKWxWRmgf2vjJQpDj', 1725007729, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('6pLAEwlzI1TFmZ-jq0CJgdrhPpC4Sy9b', 1725006105, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('6us4sz3oiKQd6Wbn40o6ulAfG1vutNRp', 1725003142, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('6uzjAgacaLWMU3MH2lSK7oECBCj9nunX', 1725015156, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('772k_1bpizAUnqJ45W8EbrvhiCWScQm-', 1725002975, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('7830iKJ-xaKeBeWj8p4Dhu7rPyrMVfnX', 1725003059, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('7BRVlkZ2oeEXaEbhYOHoom1VlRMm21Dn', 1725008850, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('7CGBj6M8yQX-vk2sC-1eEbJ_gcg7pXn8', 1725008888, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('7DHvUXfLjtLeI9ZEwJVetTIqo9pFTZlr', 1725023669, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('7PE5DjU0K0tkGwoughTr4bi9kIWogvLg', 1725008883, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('7sQ1NVApqj0tjHyjAkTxd7AVEuCRH_Bs', 1725003053, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('7xyfsMBnhkOgNcpBIGNkU_RffMpxKib2', 1725006759, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('88cLVXV2UreacWJQFW93EJA_gYXYCsas', 1724939226, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('8PcyPOLu_I31UdGmA55Unjk_O2FkKeMf', 1725006713, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('8_KxyRi33OAhp6kJN3SlgRFEmpAPQxBp', 1725023055, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('8fDXr5q8k9CZGlSUWoKX28pxTQGAOL7S', 1725020521, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('8h_XFrEJ6SHY2OhMZHL3cppghPkOXE_0', 1725008832, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('8pk2bvi6vottkGrTDJ0W-2PIypHFZit3', 1725003178, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('99kZO0Gc1f11llqi6ZM7DaKZPfIt-06l', 1725003091, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('9JK0EtkQr7ATmlzVBG_A6wnnt2Qv-qsL', 1725006650, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('9L0v83Go5YZQC25MZwnjTiQUbBBSX45E', 1725015255, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('9owGOxCKHl2wFGccGsjbJeqY_kGWoxLk', 1725022624, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('9tDsFbV4cM8gtE6vrSZhXm-c_CL2drlH', 1725003033, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('9xbCQwTH4s3rmTWoGsgdO8AnVY60BE96', 1725020813, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('A_k7VgLcT-o11ZUsX_hgoyUAyCPLK-qy', 1725020813, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('AhMBJ2I6XK481Wc5p3d93FLAyS4AZeBU', 1725019643, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Ai9cjzWVfuQjl47yEsYNRaGYxOueYHZ0', 1725008910, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Am5_ZqwgjskBsraxdKjEd2AIs05EWfcS', 1725003202, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('AuNurZQEb7bj7sH07tqw2sgi6OpDdI8Y', 1725021037, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Avbz0CulZaFRRcD3m0kc6fdzIYUNkqBE', 1725008905, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('AytlTwVyL4eOylwGMnf1a4x5YsRv1uh_', 1725003018, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('AzzLZ7ZUNZX7ThBGZqSsBWzuBMWj-H-U', 1725008821, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('B0N6MHueGJPO0PzvlK6PazUV6Gnf_FsR', 1725015255, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('B3OgsZC9BItK3-NQ9FKzPVIaqEhQbsz8', 1725003130, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('B7kO8JFbXHeqaCg5fLpANbjRyYSo5QJS', 1725023047, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('B8q_CUUw935ihQPGjbRyvKZalGANLnG7', 1725015249, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('BBzFRDjgk3Bpx5ojtn2LcVJGlM_tcgQs', 1725007800, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('BGd2AcOWdD33QSx3oDZ10OzRFQyzbOkE', 1724998120, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('BNLg6yd6TpjTlu49M9zAf0NBXydULwwQ', 1725006650, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('BOcDYj2Z1FD3cwW-0Z_U14Xu2iRXEkk8', 1724939262, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('BeRNoKjuFC3j-7LTHbcTC6Biicyhnt_9', 1725003084, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('BhbiBWFzqu4QgbsMmz1X_z1609ucgcuQ', 1725021513, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Bj7fYHOncQFplcDwvk-m7GWFq5sUDzZo', 1725015263, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('BsfszlLYgFmA5MU1LJJu4Z1PSydClSOZ', 1724939250, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('C8Cqa--C4aO10HraYdkXY5xQjMKWJBpr', 1725003043, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('C8skupYVoXwIbA3zWzwRrxo89JGyybMq', 1725007729, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('CK6n15iZKxxVgtvjM2g7ZJw1YQtN8xkn', 1725003050, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('CX3PtRK9hA4Gz5kf21hHH1wjMG1X-Bfd', 1725023188, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('CZqI0dGXxDridoiCqzbkhZcTc6wHxUsM', 1724939444, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"user\":\"accounts@accountdubai.com\",\"namo\":\"Fawaz\",\"role\":\"User\",\"status\":\"Active\"}'),
('CbvfE3wLZWo5ZSHe4lwfJ75CzqtO7_bh', 1725015238, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Cn8B1EiD27xWdv2JMoCU_8o9TdNA41ei', 1724938152, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('CsmufyMb3HWBbMdLDZ4b4zpuhWpa68yX', 1725003057, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('DEVUyXzSZcPAjzftlyD_Z2yYAW3-q6vR', 1725008897, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('DOgoKWGctmjJ6-O6xr1s9ZHi4_3hj64e', 1725021829, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('DeUlVCXNopmOpG5AdZ4eV7u866ccLFA6', 1725002999, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Dq8OYjvVzBwZqaHjTjB1npKjX_YWskSS', 1725007785, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('DtTXls47Rgv8avmIwwsC3-qEIXIDATpX', 1725006698, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('DvRJDRayYw6DpH-vcSRlePmnQL5AnExU', 1725002950, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('DwBLZan7kBnc0RwuxO9H_UNtQYcQjXas', 1725007790, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('DxNYWnLP1BF_QaZUifPddtApra9c7USU', 1725006713, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('EDJQBK-mTmSEY6heegnghRFB-57IOk2v', 1725003028, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('EKD9dzkUGo6iqucFJQHA3Pjr64__JgmV', 1725003094, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('EjWlfdflwS4WlSiC7dKE2t1c1gtAsGgf', 1725008740, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('El37jF5AmQvVrbKm98YF1YWZXTbEnufw', 1724939226, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('EqcxI8D4-ji5aRcv9gwko-9peJdJrfmq', 1725003140, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('EwKIovDDBCQ0D7edj6eoPGqwaG5DrnGZ', 1725008905, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('F3mBEpZ3eFUfir8ja0sy9VtXxe-X1yZJ', 1725003146, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('FIgys6eySpn2sIqAuBwmdEa81nFS6i2G', 1724939262, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('FNA_qdBP5XzfXKolnwyLzm8lNwtuzajS', 1725021835, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('FcNI3peuwA83OX6mPKb53kchQkCaOCnc', 1724942631, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Fr4WDpJu880vT5wsjfFhSiRmFixXSG5s', 1725002979, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('FsVuXFGMTmOZUhgXTU4x0GCvT_gHcLiY', 1725007148, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('GASRoGwTT6pRWOY-8jfVPj31BUCDvt9y', 1724939369, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('GKyheS6dUa39GbzeAv7gbI2KpfYqzLLJ', 1725002968, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('GQ2nrIn4k5c7FWdPRdKYgu57gw52_GXI', 1725015250, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('GWvfhNQKk3UWPmDYy2ERuv9_GbK8sj3B', 1725022332, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('G_9YzRA3miGMCXrOBorCO-suNeNH5Okf', 1725003059, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('GdyfII5hqqAiTr6xgKE7Yb6UApromKWH', 1725021389, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('GfsAnJXIXcHfqBzhzb2nGN3f8u5za3Ty', 1725021831, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('GiKmCMAklK58RexSEpSoYbTLVHEQrtRZ', 1724939218, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('GqbzI3Qh6CWltU3vduXe-SGeeXVVOfFK', 1725006732, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('H4IUGon2ZPjNdcVh5Q4r60l3ag8PLoQK', 1725015317, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('HKZfMKZYTGMvvb7pAnNPxYajR6FiTMah', 1725006698, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('HOq-MlP-XvQ0KwAHM4MudgoIgXsyBznp', 1725003004, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('HiB8RPCvb5mP1sD4x33YfJ3bOpb8Ad59', 1724938156, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('I1nfyAKBrVmWRqUEl7vpWYEXwAetGIF8', 1725006743, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('I3cEURYG0cYG14AqCkEkJHhuSmzM8dVb', 1725006713, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('IFPr4oU18ogWt7EEe2mf-9arwJXleOqG', 1725006725, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('IHqVFWT3QcfPNxi5VQsMksGzCSO08VRG', 1725023196, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('ISp-_lJglUxYg2kYuswXOOQaCIu48wLk', 1725006641, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('IVDPx-FCpyNSZBdCLYLCLH5sgLrSUUtV', 1724939258, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('I_fR0T8WhT-V6bM9vMsi8ypiOAkHqKew', 1725002999, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('IjCjQhSD9l5c5EBEJy4dbjFszvNS3SjA', 1724939262, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Im6DXNlkYIg75SCvOUgxuMp2eQglaz6E', 1725006680, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('J5De1XyRJuIjak4UE_lgXNurKj1kZVcM', 1725008748, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('JVRtgi1ZFNdJZTdGL89BSMFT4t0pFKr2', 1725015317, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('JYUmhG4NjzIyATQ4oIRc--c7DLmiUPu3', 1725006759, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('JeXQQ4QAMYVH3KZFc66eTFrfdotwmIbW', 1725003182, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('JqQVmU5O2fSWjPM37NBr9soaT0YVHDOL', 1725006639, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Ju0uYUg7r2ok88uOrznmbQFB0CfNLO6R', 1725003065, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('K3mPYx9clqWTkXWvMmpZdsM804rQ4bdZ', 1724938152, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('KaSGY96fLCJ-VDozVqwGPKjrR9H1BmFG', 1725015263, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"user\":\"accounts@accountdubai.com\",\"namo\":\"Fawaz\",\"role\":\"User\",\"status\":\"Active\"}'),
('Kb6_M3qKetxLlOQrpgN7RhdG34BwMzEp', 1725003021, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('KfAKZzYvAjZqjGGHQ0E6XS8XT8HAZQQx', 1725003174, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('KoH-GB3fVqjjNLdGMq83ZVqnzg4Teekw', 1725021389, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Kobpw1D-FtKI08DZGqsRWFs8Q_Nz55js', 1725008749, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('LA4V4_rZoZexisoeVPis2wbCZqunI5qh', 1725003202, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('LAcYiipcG4mlxKrriujYg2WAJc-QgBFN', 1725015250, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('LNSY9cQbybH7l9SnkGXdCLTAlX36f2O9', 1725007796, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('LOP7wuG3wOZTZ487pkmKIJNAogaOWrZ7', 1725003033, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('LSsU9EUYVLjvoYoUEV_W52LfW41oA8oD', 1725015263, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Lf_x35AVytp54GFPCfdF8E9InMOHYPnz', 1725008921, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Lg36qWuQdCOe86cyNnBsyInAf7BM7jgT', 1725023196, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"user\":\"accounts@accountdubai.com\",\"namo\":\"Fawaz\",\"role\":\"User\",\"status\":\"Active\"}'),
('MDtJ0Pa6DFTM53mFrSmNXKTKW1gAsJZY', 1725003006, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('ME6e70zG26Q1Ufyn99Us93mYTEotQXor', 1725003047, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('MGtkaQrieZ8H-rOq4xRDdgGQ8IerVp5q', 1725008869, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('MHJSdN8D_rncnbBtNeUqXDY0S6lcvR9L', 1725008847, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('MJRepaSuVPIHITuNdGSdm4mfhArnUgWb', 1725008821, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('MesM0N6yemiW92RIN--szzD0a2ToOxd8', 1725006752, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('MoTzLdhjy8hB1jtJBMKvrxBVSYLyTtHK', 1725003050, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('MtYkcA9kchbx63Co0PzzCn_oh_cm-Vro', 1725019643, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Mv98f36mxiQDBhVEA4bflruKV9nSAJvD', 1725008869, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('NHSLI-bWO9kMCOMZd91sp14UDD23iXp7', 1725006048, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('NI7DYTGwkdms-nKBgl1RoKkP-3clhb9N', 1725003053, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('NMMYkBG1QhGodFmsxy9Fjpziatv2UqRI', 1725006105, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('NSpEarq5fLEhSJc9pPTmSaaRF4_nQwmw', 1725006737, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('NVWD34dOpWrZT30BYgt_zjMfsdZyfb0m', 1725015304, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('NaaYf37sI9esau2jWLO4X75I7Ji5ssUz', 1725005856, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('O8IawiYZF2SiOJeeA-AIsMrji7GQy27x', 1725007785, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('OKkTGgJq-zKuy4QbiGrlzRq_B7vAC-rG', 1725015259, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('OWVLuGgnXeq62DfZ77bYr4alVoBVcAu5', 1725003068, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('OhvL1Skd1gbwaIofNR4ZwULIsiSZ7qLl', 1725003012, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Otw6MXXm5UzkX7SpSgvU7eIqe5nTbYaG', 1724999564, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Ov5qM_ROwnUX_pPi3xgVH1c__5u1THj_', 1725015304, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('P5dLhX6FRG7PbDZnZzz_sCDx5Z_kuBw1', 1725007713, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('PByP58lzZPswRRjY8pgPetgQ13lNYV8n', 1725003043, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('PDXx2KlxCSfIJWi7n1v26eJKv-AM0CbD', 1725007723, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('PNpbmtHWACKbrua5SFFYve_z7uc9IJ4b', 1725008856, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('QIN4wSkHloCKNMlIGQPZZvIf4ye1y7BM', 1725008855, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Qdj5NNHodUUSPejgX_NAevv0oS5Lo4KE', 1725006743, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('QrCDXZo6HKEtPsg0yoD48ZdIafxNXHxA', 1725002975, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('R0DrTY8dhNIqKgd2squy54YQitEbarX1', 1725002971, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('R954lrxX9yqaapviuKy0TqQcRghpy6dA', 1725003021, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('RF7qFmM6Txlq7xQ4k7qwZn43IYPaqt-r', 1725003120, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('RG-2nc7YgrVWtHjI0HYoWzbZvrHxneBD', 1725015148, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('RT82ITt9pOdQQhVf7C0igVs44saBxBB-', 1725015144, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('RVz-mgYxJmpBWdAnMfuBuArQuzIAHesT', 1725003025, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('RWSJJmNGsdAEfeRLg2ZGwXdtqS72cXtV', 1725008847, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Rhn6r8MfyjVXnY6ZPadBq0sHGQfK-FuM', 1725021031, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('RkXEqERF-iK_R9A24gksLE7Bs6LHtKT4', 1725007800, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('RmFwuBi7CLOUlmikt8Gw87SSlYDF4Lts', 1725020527, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('RqpFOm2kiw6AvH3DzR0TVApy4rm8wgHI', 1725018218, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"user\":\"it@ebmsbusiness.com\",\"namo\":\"Haris Khan\",\"role\":\"admin\",\"status\":\"Active\"}'),
('RwB47C1iGO3WS2XW21eb4kT6TwJPqERo', 1724939258, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('SBe_Bv122LKxPc9rgodB9mIaJ49G-jq6', 1725008818, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('SYtJQUwzrd5D1rbBvbOrALnD7pst2Vbn', 1725015249, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('SeizGdw4zwOWEvKSEJ2ABjOYLfqdEd17', 1724938157, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('SfQgPHH4JLejcFJTTZftCFA-LqJaSDZI', 1725019643, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('SiQrGeisSZXcxl_DgOATBMmKBUf7oWJH', 1725003053, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('T-Rw2BEW7WTcwfsEeXJnaLywxb3xS912', 1725008854, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('T2SYVyQj6tYMVupHFxueom2aHndKt0VF', 1725003018, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('TC5rVb5tB5FWXC0NLIFTBys9-TdJalsu', 1725015144, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('TDQegWhR3wMLSq6V-eO_13H-6V1RGPSh', 1725003145, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('TDzphjNEB-8fCG0oWaZ5Q38sbwqn_bO_', 1725023055, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('TFNO-mVWRgYayklKijizBBAhwGJX5KKF', 1725021037, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('TIMdO_MX4pf5YdSUMTK8pcVEtf-WiaWu', 1725003062, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Tbxfljgmfg0f-By4DwmT5BfnLP3tDvOj', 1725003012, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('TkFk77VGOW4KU5KTlxlgbU8YcL3gzbWL', 1725020527, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('TknLXR_fcStaJfCk4_RCvOEFh3ItI2Qi', 1725021445, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('TvDXcZMBtph2LVZbwyPl5aficmgD3E0u', 1725021245, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('U-pm5Q1U-QqrjY3D3QDV_d-zkXC0BKvz', 1725003186, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('UZriMyyrJNKg3WCkTbaEG7gGQETV-o1E', 1725003047, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Uc9D5K0mHP1hYB_fryIlNHCjRrUC_sqb', 1725017766, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"user\":\"it@ebmsbusiness.com\",\"namo\":\"Haris Khan\",\"role\":\"admin\",\"status\":\"Active\"}'),
('UeaR75SWvorQ1sJ50Qta-DVBIB3Wp3AM', 1725021239, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('UoHKuClfrxPnzfcmG26Mh1H0mkrjDMkY', 1725015304, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('UwdMUS9O0fzR0MGAZsmmF1rn9u92ctCA', 1725003021, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Uy_iYS21OwkauXqfm1Kc7WHgSMGsdVVq', 1725003132, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('V054jtyQV2cUtNlY4RL5wKvxIO56LIPL', 1725003010, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('V3VeTMIkA49g0da2Kfp9NLSYZvN-a1N9', 1725003135, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('V3rQRPJUTN1XqnQdroFbDjQtmOjNt1x9', 1725021514, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('VKSyHEEKFryl8zGD2MtlH8cYkxNle5Kq', 1725021831, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('VWLUUC3duKjw4MGVWCLASbv8odBqvS3y', 1725003025, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('VX5iF25KtN6ggoJzOC5Bw1HBzbmGgqt7', 1725007713, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Vf2v6Ohu-9tWxmyyS8PNv7K1PE0EYjb8', 1725023047, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('VistsmWTAvxafwZn5o-9It9WP0sWksbk', 1725017382, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Vk2K2HowXbE6KMgzFUnoirtY2sO8p4IA', 1725003062, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('VktLYDAj6uHfc15wuU8LLLubdlWnzfL8', 1725003015, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('VlZ6V9W_Ec6pErLpQdTgisOhV7WmICXw', 1724962789, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Vyy7ljuTnJKbwe_VacuzwvP56C8OwiM0', 1725003194, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('VzQgYHZ5RE4RnH8Hj1LFMY38ReZ8lJpF', 1725020521, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('W9iXwNRvAuNzE52KfUU6B-uYxcajvQg9', 1725007723, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('WTL27kK2mEUnY8f0wZQdHLMsxSkJ2S5L', 1724945998, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('WpMCdHRhs7zvI-zSXfP7jAtfNgEjb8u1', 1725015246, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('XLHuR8405bfWc2mWrMc6rEv4KDhnBzr2', 1725008821, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('XP8cnyoSnY8FfNVwZ0l-8TTzWCqCm1lJ', 1725006752, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('XaI9BBVaSDwYHmqVhTK7KRuhGgEDvUSh', 1725002955, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Xcwjab_VJsMZ0P-hZDs2z8D73mX48wUR', 1725006659, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Xr9AgQUrA5mLbbZF3mpaBslDxntGpKf-', 1725008905, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('XwbZydM4R1OPAgs_2fransEA6b6_GDMh', 1725003194, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('XzsMM6_ZdAz4I8h0nWS7eFZj1m-GnHs0', 1724939226, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('YAi1B7V1LwPPwwr4O7UPyiLBnfY-I-ST', 1725006690, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('YXxlAOHItel2lJ2H0mzrETZh95AuaYU7', 1725020571, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('YZ04EzDuByeSWCPh87DsCXQdx8HG6CA-', 1725008832, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('YgFO5omIHxtdj3k9KMeu1kRC-7Bm7eu8', 1725021245, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('YuM0SR2NY65eIsYVXuF1T27Gcy1tN8wr', 1725020807, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Yvd1eat-FYau-h-en72tY0Hyz9vCh9oM', 1725008826, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Yyk5JSuYv7MSv-RGuTMWOIZwScv3X6Kc', 1725021445, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Z2TLLR-VD7TUa2PuKIpeFsVLGptenO5s', 1725003178, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Z5DP3zS4T95G2h-3k03oXFb73EvT-wK2', 1725006641, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('ZH9rq6JtQ3za0CLVZwLa9jKzbU2ZiY7i', 1725002837, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('ZJhOaCG8yUyd8qme8aq-ALWVRu3Duo-9', 1725023669, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('ZNeaorpiZ-cM5DbqfXzxjPsORWge6pBx', 1725008850, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('ZcQR90Nycr3UHKg7jg3dLUKL02xqhgk8', 1724939269, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('ZjI1znWFN_u1uKD1eIL0gMckSsIgrc1N', 1725003010, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('ZpNi6AoC8ke5K6sPTL10ae6IRAgW8HgW', 1725021239, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('_0_wuZCCCCwfxXYcrOvn1JyZEY_1qhBK', 1725003050, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('_JlRAjman1oVF8rU7CxrpjXE4i7LQmmA', 1725008883, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('_Wa0canF3OhPEPdmD00VZNjSbQKohYOj', 1724939269, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('_cSBcD0aAo8U9aozRD7BTLjnC14-bdT3', 1725023196, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('_hoQ7XbhnJIKzmY8NIWgfl6bWBhOwabk', 1725008863, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('_zF3gc1whLg-7aw_pds-udtPQA2-I7kC', 1725022332, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('_zsmOYb6lNgu4IuCkCwjDIcIjo9YNx0N', 1724939250, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('a6crXhOTOGwjB7X-9db5hwHuGiipf_LS', 1725006659, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('aCjK2MGF55TJ1Qqq0uQiQQlm9lcz-BZq', 1725002968, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('aIRm5ElBRn6DO_QoHiFbgcpo4AE8zaEm', 1725008740, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('aPHg334A4fnxnxp0JEXr0AkUPaohkxBB', 1724945324, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('actp0ZUU8-anXtXSFZiSzq8CEzxmyxkG', 1725003130, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('adIrHrRVu_Zz4y0F2mNjOTnafVzUA7qC', 1725003006, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('aoPv7dtxrydpkyRMLrl3rSG-L5KrGAEL', 1725002975, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('aqBi7IuO71rNOnQ16RnZVIvCJuiAwns2', 1725015144, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('arLf9U7_UoU9jMa7xumA2KTvSYW-YgP_', 1725002978, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('av0rzkXU86FJeC-AVZkx2WAL4YUPAfxD', 1725023669, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('b0Ohzs46P83GilY7033aZ6S0R3eEHU76', 1725008740, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('bFsoy_Yw9xLm_LMXH-iG3ADVaZFoRWzS', 1725020813, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('bKo7LnOVqCzrib-y9RXEcwbY5V5YHu7c', 1725007796, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('bsbkrFUqe5Fy69p3XHgh95UwR0BXCd-S', 1725020514, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('c4OqGULNXQO8EVIXneeiS4MQvOI897yN', 1725015223, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('c4V39aJj7lFsZKGdXl2AJrtSJeXR3aC-', 1725015255, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('cTCT1yYjM6suuJ5cwTSyXv3jsa0cnkwt', 1725003028, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('cdnx-s2JzipoVpjaPJRlm2eOIhovlNoo', 1724942632, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('cfCog1LVDEQltG_EODbr42ZSfkSUPcLy', 1725015148, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('chfjQlZiTmu5_o623pnxOaxNRsevtG3o', 1725023196, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('cppIeaNwcHDr7aqNVUHSCTw_-S2aDdjo', 1725015238, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('cxz6PfMLBVopxJs3d8yDlurEdxW90fAN', 1725015259, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('dBhiG44vHM5hWZXrZprokoftb1uL9zLy', 1725007738, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('dTxwPjX2e5EhMir0VqKDvpH_wZixnhJQ', 1725003120, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('dhetVuHO-A8FYLT3yJFB8-b1YeU7dSwx', 1725015148, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('dj7UWpHVaYijBrtICf2WM1icBg8HtjW1', 1725003150, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('dx7Jpf8Z5XqlSZAwRI9iy0Fgwsei8pGR', 1725021392, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"user\":\"it@ebmsbusiness.com\",\"namo\":\"Haris Khan\",\"role\":\"admin\",\"status\":\"Active\"}'),
('e77YRAXZHoj3V1GuBzclJGKIZ8AA4pUm', 1725021513, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('eFOEkX61uwwi86OV1jcMsrETJpLXmJv6', 1725006765, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('eJHUmWtIrA4R0dPXeV1xt2V7K08a6YFG', 1725023669, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"user\":\"it@ebmsbusiness.com\",\"namo\":\"Haris Khan\",\"role\":\"admin\",\"status\":\"Active\"}');
INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('eUwsCktK_pRFNHxat2FAK3xPOjDdKIQz', 1725003030, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('ettRki2CNZ6AIlqIRPiX4q0PR2gtVJ01', 1724942633, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('ewL-Lku03Rggaym3e64hulhfEBJlDc7U', 1725022326, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('fCIo1S9f59c2m_qkzVCZXZ8PqhYI_VYR', 1725015140, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('fVACnn8oFTBPmBcUMPhKdeRVxhuE-B2d', 1725002955, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('fsO6_e11sOtVlvPdBPKcr8UnGR3dtzMp', 1725006105, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('geWrXnH0kbY0g_6w0JS3FYDitpVmflzx', 1725020807, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('gkIt7vYiSL8jjUfztIV4mM0s9Q45AJ3O', 1725003018, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('h4xwgJ2F5FZg7qG62oPDgi3DOGJPCWud', 1725008897, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('hG8IdjQYh8IqfSQlFA5gDfuCckCh46El', 1725021835, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('hOmnDj1LAHNRi5cg1xZGw0YL4vW-ObDA', 1725022326, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('hSYXNT9kxCnR7DgfR2fqqjvuOK26T9cG', 1725007738, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('haG7N6gXnKFbvs-aW_GGHudgOQC1PkQ2', 1725003182, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('hftkRjm7inRPPiOZO83BppzuZZkH5Vga', 1725015312, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('hl0T8DuO4WFnNnvGqCvuVCspzoCdqR3N', 1725003135, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('hv7xM7woCrtxGPrQQnBdfGO6GGJeuXsh', 1725008897, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('i2b7gKfZ85sqy_OJdQFOvWBEumk8TgyW', 1725015156, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('iAZOJPObJdqrKZ-yy4kChJDqmasYNpTS', 1725003043, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('iAslmYLNFofYqra4GPxQEw0JKouEMXST', 1725015140, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('iCBcgesQhkrJ4IQNj51NKMBV5ojn8JRq', 1725007729, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('iFJMTo2weOmkSDrnia6vmGDvoXWmvaWz', 1725015312, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('ivzQCYZ3JsMrRM9toZbX-4OSwN3V6leg', 1724939444, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('jF2_bXornH7GSD_9o3NBtmyu9mOQHXZr', 1725003028, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('jWbNtwcBwoDj1FEfjfiVbF6_OH8rHGsn', 1725003037, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('jxFpD77DluUCC-lelwKxz379z1cCUpoV', 1725008826, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('jxJTzToTCPAcpveeKqN7cF8YvGt04pTr', 1725021513, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('kERELJzQUENfDFo9bfQ_VzXv2CnX_FGZ', 1725006737, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('kKAMNrmu-i2QfC-xJuSAYu44sNPHfGQ4', 1725008883, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('kNq_9pTuWPJcETM4hNLM0jLjkpSL53hR', 1725008910, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('kRKXZqMxXcQUra0DCiAtKegYhdTtA_eJ', 1725002950, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('kbVbD5W1De0jBNOOmPELW6XeY7MGaR7s', 1725003120, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('kcwyx76-xyOMAWhth7AYMcsF4nDmNI48', 1725003015, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('lEyB7vupRajA_QnPccKOv1iyXoydrclx', 1725007796, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('lHWgkGgV10mqzm-tXy27sv51eQJp1V6Z', 1724939218, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('lL8wwefTUOE_mH-QE4EtxCeV1yLVQV2W', 1725008847, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('lnO5kXXAZ9cDgsDkxoy0Q5BLXxy2ODzi', 1725006639, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('lr-oY9kifHmv_MmRVu6kx6ZOWD-Hys09', 1725003145, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('lujb-k2FwnPPrax48gI1lG7ZyE7iJ7cA', 1725005856, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('m06Ttg4ujj1Z2YIotOCZEt3hagPEXOBi', 1725003065, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('m1fofqugcAEX2iQaxh04xxrZ_rRUnG1y', 1725007738, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('mNWZCoMK5oKkrGbu4r0LgDJG4srpaB8t', 1725008832, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('mONq7pBDuXDG9aTvu_8VHQ4EGwbza9Vi', 1724939369, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('mPmAPX9fX1zE6oU9ku0meuyoQzPZEQ9O', 1725021831, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('mPytzQc3PdYT3VD5Dme-VlOF8QTJbFKm', 1725021835, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('mQ9XwqfywUh-T6Y8aI8q8XzLOFUJb3QX', 1725003174, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('m_K4jRhLJQ3LP2zg1yUBm_GOUsyRo2Pd', 1725006743, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('meXsNSK0R1iCKNMHdyHSC72EhrnR4bNj', 1725003142, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('mem1PgH1M89GXXzq8pypq_mSuHIkTkp5', 1725006759, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('mhaSV7gCMT9bWqjImDLfftkPUWFhjt4P', 1725003137, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('mlrB13IBBByTdsoQBiupK54s8FhEsJTk', 1725015238, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('mltCsn5fPyl-mnk4rLDXQTpIHzdmaSBG', 1725021389, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('moMH330rTOxvK-RxFEROA3aeXf74MLrK', 1725003142, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('mpVKVNWJzU-F4_cAGUNPGDLOkyuQqaBw', 1725023188, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('mzzi3EKeVlgBc2jgXE8HmVA1gIpu_FrM', 1725006746, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('nDKguALHHeXVpu8bNUJIxI9PSxR7y1yH', 1725003135, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('nF2Ab_BAQKK9zAo-6qTmcZypOlJcw71m', 1724939444, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('nMoumNHZPpmjWOYgq-sOZQH-O24f8nAm', 1725021031, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('njLSD3OK1ProKlhR-yBwojQsGPSQwG2i', 1725003084, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('nug1A-PGgcDUUOzQ9Yoik96OtgSGIBCw', 1725015156, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('nwVKcsLKek3LZU7TsK7G-AUuAgCUHsQv', 1725015133, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('o5YdCFEfA9t4rLhFxr3yuI6izrzBrJQz', 1725021506, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('o6v-zCdSRCDPwUesJE4QVbhF_CKKe-3z', 1725008748, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('oDo-qDJQ6biRys4jgK-Rdphq0i5Z5bpw', 1725002999, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('oNnI5bQF-azNZEsCrrqcuEPIeuvQcr9j', 1725008910, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('oQ6XwCnatYcVYvrG6V1b1YLifaH--B98', 1725006746, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('oVnU3MGpUq8s_yujAo_NVFZYNsAg6Rve', 1724939250, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('oZ_T50F_Hngurv46bNtTO8xF_J-mbJhY', 1725008916, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('ofVNUzKCBHMl2XTf4q2DlRD1gvcTCMad', 1725003140, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('omVkDMEycEMeRDODjg0yvb7LY8KPZeTT', 1725008856, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('ooGA5-rr_0XPMlJpteJZTOzl-SNI7xVc', 1725015133, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('p8NIajNInPIZWQKExZT2Q9g9ty52EzUA', 1725008879, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('pIa21hmnQC81qKJgr2F1z1Gdh_uga-vZ', 1725003030, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('q5trzKzHvjEfFdAMCGiW1v6N1geR7S29', 1725006650, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('qFD2MgUjKmriAypGPATWN_V-uhspcd5_', 1725021037, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('qFNA_iozg2EqxHGsLKs-PYSOENr0avPh', 1725003186, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('qkCNVwCDjvQePSRtcWJUq-mPSQ8LyUyL', 1725006737, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('quzqQLM_btAwhnjoxEFptXA1E7Mffc_p', 1725003132, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('r5snUNfM3iUseTfIRydkacXReCzRuQNP', 1725002955, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('rrDGJOjsEr_v3n6mx71REiSSZv7lX74R', 1725002971, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('ruUGPDntu7KgO73wfc_m7TNq_WkWKM8F', 1725006732, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('rvdZQpIC-75ktazzJcRbWlRTa3rj9Gu1', 1725008856, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('s5aghjWlwdFretW7HcYgmr5_ND1GQR4L', 1724939444, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('s7wyL6XmxoAiwWrXhFxRGSeME9uq3cVQ', 1725005859, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('sAz0_Z1vApsg7qBRA13mOLWqMqJDQySk', 1725019436, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"user\":\"accounts@accountdubai.com\",\"namo\":\"Fawaz\",\"role\":\"User\",\"status\":\"Active\"}'),
('sIJJ3xDAKUlJtainAzFzHJgHfnDVzKLK', 1725015263, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('s_GjegCArHtY70fvTsAfdJhEojoumG9U', 1725003182, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('siwQKvXL7RTqB4QfvYpXfhSRRq_k9ADM', 1725008850, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('sllVohVFFrYXTVQ5ahyiOoauSOHGNOVD', 1725003140, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('sofR97iOos9RPnBPssibqmWagfvyQRCi', 1725006680, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('stwYrqapVbUskIt_Rzb06IodoSDy-xvc', 1725003132, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('swHH_Xx7S2cpgV3TObFnGOquGQb6P4r_', 1725006725, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('tJS8XFJXQg_6ldYGHcQEFeFAMt35eOP9', 1725015259, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('tlE7eOtXBammgH-fdmCWwQ0mMWJc9abw', 1725003037, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('u3fU7bvI1uKjJ38y811xlzP5d7pxvX1y', 1725005856, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('u8vXD_oAv9ddmzp0SwYF_lz_Ab_40Flf', 1725007790, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('uEPUc4Ey6_je7TIRf7umb4ubiTLLTqmL', 1724938156, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('uR5RO8qePpRmZvqXF6ZBT-U9k-q357BX', 1725015223, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('uWo03F_C1cMPhTDMXLzMEBI9s4oyVJ3W', 1725015312, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('upzxg-sM7Y_eVeIOFKofhsSaIOvhWaEd', 1724938152, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('uugywoJb6fU52GKUcqB-nVioNBGJ5Pkd', 1725003030, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('uyq3TO5Thb2HeltnYPZPQlBgmmMqC62N', 1725003068, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('v4LMJBk_tr7A1a7T9XEPAtipyq4C-cp-', 1725007713, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('vg9Bi3k1IHBVqfSh_sS8OuE6FfJgu7qU', 1725008916, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('vgN7dDyNdEF0lhW9epYWcSyHLT_viHAA', 1725006659, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('vhF3zSZKJ1s2ZMWu83TXaJXWrtJZ_nrV', 1725023047, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('wL9PFdkx6wyAF5cpyOQ9JkrdaUdOG9ME', 1725003037, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('wQo6r_17pgXM3JSXSqy-VDRFGNGu8DU8', 1725003084, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('wnK1jrt5UHIGXwWwOD95DbaUo6Or0uaR', 1725006690, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('x7EzUV858atviEZkooPt4vhpJ_PWv1Bb', 1725003053, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('x9BeE7LYaWyGPJ9FtX5ap6TD3aw-8nAC', 1725003010, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('xETlnByKRSP-I5uRZ_EG69Yh_MiIyJPT', 1725003194, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('xPdO1iVGkv_hChbbUlLMcAZFsx-jo-sj', 1725015250, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('xlpf_o5hwfgsfH8dXK5KxWSobC0bPjwz', 1725021031, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('xoBqNa8I0cGA3iwP992Cb4BRpeUandY_', 1724939269, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('xr3yfAkVsbeHpg0vhZ8GogFPOcBYE2wO', 1725008879, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('xunEeHBxV7BeAW7do3cALv6KgdURL0Ys', 1725003062, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('xwTLVe_HYo7S4-sf2_LUhHq2irkRb2ld', 1725008888, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('xxoC7F7KhQ8SrzETzGMr7enHKOuGY-AI', 1725003065, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('xyZUggbd3swa5Nf9levI0kjeI6y_9TeC', 1725006732, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('xzOLCpUO8c7WszJ0RTWOqdaHnhJJuEdV', 1725020807, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('y0p3qIzWhKqztbmSlOyH-1fCLhSaQQ8I', 1725008916, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('y8jPVOJg2NmlBPeg-WE3pkqgHVaewmGv', 1725003068, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('yE9_iWJSpTmDxEbfMe-AfBB-SUrg6bs1', 1725006752, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('yWHy-A1Qm8NJxfgrcA_BFrg04XcS1Otl', 1725020514, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('yZeVB2TmrooCb6-cZR7cJmgY4dcqPZGo', 1725003203, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('y_I3A-uCR2FMC5orRFXz4ljUN9TRYAGP', 1725006641, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('yg27l5ackfErUegokNcTJuu0Q1A3GUfC', 1725022326, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('ymHL0Svj1qGskpDxpWWMGhnx21uUR2n9', 1725003137, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('zNRg1xKraACYp9LVgW-KI7qAocu5Qrqk', 1725020527, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('zSZUp1QbhjESzmlkQIrVk66ktIe8OBWn', 1725003012, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('zWRINodPXWnCfwLZZmcGWXZmY6htlh7X', 1725021829, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('zZwtSeSfNcM9C3M8GYQxSRNEqIgLwICd', 1725003047, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('zcXcu0xzYo1W7xbuP98xQKdvH0d1EJmR', 1725015133, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('zd5y9IYGPeK36cnm-x9pRdaz2VRmxo3Q', 1725015246, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('zeiyQxcpUTebmNpUoR0x0_Uz6ENUWztU', 1724939258, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('ztSiJ16QXvNsjfTBw62JH78d0KbMBnWH', 1725002950, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('zv1v40dYzc5t-GvMaBlDEAYuufjfUwFN', 1724939369, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('zzlb_Hwk4jQNKhLC7-KixfZcoMyRRIn5', 1725006746, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `3cx_setting`
--
ALTER TABLE `3cx_setting`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `clusers`
--
ALTER TABLE `clusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `domain_config`
--
ALTER TABLE `domain_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `domain` (`domain`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `3cx_setting`
--
ALTER TABLE `3cx_setting`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `clusers`
--
ALTER TABLE `clusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `domain_config`
--
ALTER TABLE `domain_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
