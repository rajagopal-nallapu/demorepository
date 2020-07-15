-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: prod-db.crzvxhlsqnmy.us-east-1.rds.amazonaws.com:3306
-- Generation Time: Feb 01, 2019 at 09:02 AM
-- Server version: 10.2.12-MariaDB-log
-- PHP Version: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crcloud_skeleton_nz_crd`
--

-- --------------------------------------------------------

--
-- Table structure for table `cometchat`
--

CREATE TABLE `cometchat` (
  `id` int(10) UNSIGNED NOT NULL,
  `from` int(10) UNSIGNED NOT NULL,
  `to` int(10) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `sent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `read` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `direction` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cometchat_announcements`
--

CREATE TABLE `cometchat_announcements` (
  `id` int(10) UNSIGNED NOT NULL,
  `announcement` text NOT NULL,
  `time` int(10) UNSIGNED NOT NULL,
  `to` int(10) NOT NULL,
  `recd` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cometchat_block`
--

CREATE TABLE `cometchat_block` (
  `id` int(10) UNSIGNED NOT NULL,
  `fromid` int(10) UNSIGNED NOT NULL,
  `toid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cometchat_chatroommessages`
--

CREATE TABLE `cometchat_chatroommessages` (
  `id` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `chatroomid` int(10) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `sent` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cometchat_chatrooms`
--

CREATE TABLE `cometchat_chatrooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastactivity` int(10) UNSIGNED NOT NULL,
  `createdby` int(10) UNSIGNED NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL,
  `vidsession` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cometchat_chatrooms_users`
--

CREATE TABLE `cometchat_chatrooms_users` (
  `userid` int(10) UNSIGNED NOT NULL,
  `chatroomid` int(10) UNSIGNED NOT NULL,
  `lastactivity` int(10) UNSIGNED NOT NULL,
  `isbanned` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cometchat_guests`
--

CREATE TABLE `cometchat_guests` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastactivity` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cometchat_session`
--

CREATE TABLE `cometchat_session` (
  `session_id` char(32) NOT NULL,
  `session_data` text NOT NULL,
  `session_lastaccesstime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cometchat_status`
--

CREATE TABLE `cometchat_status` (
  `userid` int(10) UNSIGNED NOT NULL,
  `message` text DEFAULT NULL,
  `status` enum('available','away','busy','invisible','offline') DEFAULT NULL,
  `typingto` int(10) UNSIGNED DEFAULT NULL,
  `typingtime` int(10) UNSIGNED DEFAULT NULL,
  `isdevice` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `lastactivity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lastseen` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lastseensetting` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `readreceiptsetting` int(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cometchat_users`
--

CREATE TABLE `cometchat_users` (
  `userid` int(11) NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 NOT NULL,
  `displayname` varchar(100) CHARACTER SET utf8 NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 NOT NULL,
  `avatar` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL,
  `grp` varchar(25) NOT NULL,
  `friends` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cometchat_videochatsessions`
--

CREATE TABLE `cometchat_videochatsessions` (
  `username` varchar(255) NOT NULL,
  `identity` varchar(255) NOT NULL,
  `timestamp` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_abbreviation`
--

CREATE TABLE `crd_abbreviation` (
  `iId` int(11) NOT NULL,
  `vName` varchar(255) NOT NULL,
  `dCreatedOn` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_abbreviation`
--

INSERT INTO `crd_abbreviation` (`iId`, `vName`, `dCreatedOn`) VALUES
(1, 'VOD', '2013-02-19'),
(2, 'MOD', '2013-02-19'),
(3, 'GENERAL', '2013-02-19'),
(4, 'PAY FOR DELETE', '2013-02-19'),
(5, 'DISPUTE COLLECTIONS', '2013-02-19'),
(6, 'SETTLEMENT OFFER', '2013-02-19'),
(7, 'FDPCA VIOLATION', '2013-02-19');

-- --------------------------------------------------------

--
-- Table structure for table `crd_affiliate`
--

CREATE TABLE `crd_affiliate` (
  `iAffilate_id` int(11) NOT NULL,
  `iUser_id` int(11) DEFAULT NULL COMMENT 'cro_user_access {iuser_id}',
  `vFirst_Name` varchar(50) NOT NULL,
  `vLast_Name` varchar(50) NOT NULL,
  `vCompany` varchar(100) DEFAULT NULL,
  `vEmail` varchar(255) NOT NULL,
  `vMobile` varchar(20) NOT NULL,
  `vPhoneExt` varchar(10) DEFAULT NULL COMMENT 'this is phone number extension',
  `vAlternate_Phone` varchar(20) DEFAULT NULL,
  `vFax` varchar(20) DEFAULT NULL,
  `gender` varchar(10) NOT NULL COMMENT '0 = Male, 1 = Female',
  `photo` varchar(255) NOT NULL,
  `vCompany_URL` varchar(255) DEFAULT NULL,
  `estatus` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '0 = InActive, 1= Active, 2= Pending',
  `ePortalAccess` enum('on','off') NOT NULL DEFAULT 'on',
  `dreg_date` datetime NOT NULL,
  `dlast_login` datetime DEFAULT NULL COMMENT 'last login entry of affiliate',
  `vinternal_note` varchar(250) NOT NULL COMMENT 'internal note for the affiliate',
  `commission_rate_flg` varchar(20) NOT NULL DEFAULT 'global' COMMENT 'commission rate flag custom OR global',
  `source_url` varchar(255) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `mailing_address` text DEFAULT NULL,
  `mailing_city` text DEFAULT NULL,
  `mailing_zip` text DEFAULT NULL,
  `mailing_state` text DEFAULT NULL,
  `mailing_country` text DEFAULT NULL,
  `portal_language_aff` enum('en','es') NOT NULL DEFAULT 'en',
  `show_affiliate_earning` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `crd_affiliate`
--

INSERT INTO `crd_affiliate` (`iAffilate_id`, `iUser_id`, `vFirst_Name`, `vLast_Name`, `vCompany`, `vEmail`, `vMobile`, `vPhoneExt`, `vAlternate_Phone`, `vFax`, `gender`, `photo`, `vCompany_URL`, `estatus`, `ePortalAccess`, `dreg_date`, `dlast_login`, `vinternal_note`, `commission_rate_flg`, `source_url`, `ip_address`, `mailing_address`, `mailing_city`, `mailing_zip`, `mailing_state`, `mailing_country`, `portal_language_aff`, `show_affiliate_earning`) VALUES
(1, 0, 'Sample', 'Affiliate', 'ABC Mortgage', 'sample@affiliate.com', '(310) 111-1111', NULL, '(310) 222-2222', '(310) 333-3333', 'Male', '', 'www.google.com', '1', 'off', '2013-01-10 05:34:46', NULL, '', 'global', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `crd_affiliates_assignedto`
--

CREATE TABLE `crd_affiliates_assignedto` (
  `iAssignedTo_id` int(11) NOT NULL,
  `iaffiliate_id` int(11) NOT NULL COMMENT 'crd_affiliate',
  `iTeam_id` int(11) NOT NULL COMMENT 'crd_team {iTeam_id}',
  `dassginedon` datetime NOT NULL COMMENT 'Added date time'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_affiliate_commission`
--

CREATE TABLE `crd_affiliate_commission` (
  `iid` int(11) NOT NULL,
  `dadded_date` datetime NOT NULL COMMENT 'added date time',
  `dmodified_date` datetime NOT NULL COMMENT 'date time for modified info',
  `deffective_date` datetime NOT NULL,
  `deffective_end_date` datetime DEFAULT NULL,
  `iaffiliate_id` int(11) NOT NULL,
  `vpay_for` varchar(50) NOT NULL COMMENT 'pay for whom ? client/lead',
  `vcommission` varchar(50) NOT NULL COMMENT 'commission amount for affiliate'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='affiliate commission module';

-- --------------------------------------------------------

--
-- Table structure for table `crd_affiliate_commission_log`
--

CREATE TABLE `crd_affiliate_commission_log` (
  `Id` int(11) NOT NULL,
  `affiliate_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `pay_for` varchar(10) DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `rate_type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_affiliate_login_sent`
--

CREATE TABLE `crd_affiliate_login_sent` (
  `iLoginSent_id` int(11) NOT NULL,
  `iAffilate_id` int(11) NOT NULL COMMENT 'crd_affiliate {  iAffilate_id}',
  `sent_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_affiliate_payment_hist`
--

CREATE TABLE `crd_affiliate_payment_hist` (
  `ipay_id` int(11) NOT NULL,
  `dpayment_date` datetime NOT NULL,
  `iaffiliate_id` int(11) NOT NULL,
  `vamount` varchar(50) NOT NULL,
  `vpayment_mode` varchar(50) DEFAULT NULL,
  `vcomments` varchar(250) DEFAULT NULL,
  `dadded_date` datetime NOT NULL,
  `vreverse_amount` varchar(50) DEFAULT NULL,
  `vnet_amount_paid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='affiliate payment';

-- --------------------------------------------------------

--
-- Table structure for table `crd_agreements`
--

CREATE TABLE `crd_agreements` (
  `iagreement_id` int(10) NOT NULL,
  `tagreement_title` varchar(100) NOT NULL,
  `tagreement` longtext NOT NULL,
  `estatus` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1 means default set, that will appear to client'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_agreements`
--

INSERT INTO `crd_agreements` (`iagreement_id`, `tagreement_title`, `tagreement`, `estatus`) VALUES
(1, 'default agreement', '<p style=\\\"text-align: center;\\\"><strong>{COMPANY NAME}<br /> </strong>{COMPANY ADDRESS} <br /> {COMPANY CITY}, {COMPANY STATE} {COMPANY POSTCODE}<strong> <br /></strong></p>\n<p>Prepared for:</p>\n<p>{CLIENT NAME}<br />{CLIENT ADDRESS}<br />{CLIENT CITY}, {CLIENT STATE} {CLIENT POSTCODE}<br />{CLIENT DATE OF BIRTH}</p>\n<p>{TODAYS DATE}</p>\n<p>The following pages contain:</p>\n<div>1. Credit Repair Service Agreement<br />2. Authorization for Credit Repair Action<br />3. Consumer Credit File Rights (CROA Disclosure)<br />4. Right Of Cancellation Notice<br />5. State Specific Disclosures (add if applicable)</div>\n<div>&nbsp;</div>\n<div><strong>&nbsp;</strong></div>\n<div><strong>Credit Repair Service Agreement for {CLIENT NAME}<br /></strong></div>\n<div><strong>&nbsp;</strong></div>\n<div>I, {CLIENT NAME}, hereby enter into the following agreement with {COMPANY NAME}.<br /><br />{COMPANY NAME} hereby agrees to perform the following:<br /><ol style=\\\"list-style-type: lower-alpha;\\\">\n<li>To evaluate Customer\\\'s current credit reports as listed with applicable credit reporting agencies and to identify inaccurate, erroneous, false, or obsolete information. To advise Customer as to the necessary steps to be taken on the part of Customer in conjunction with Our Company, , to dispute any inaccurate, erroneous, false or obsolete information contained in the customer\\\'s credit reports.</li>\n<li>To prepare all necessary correspondence in dispute of inaccurate, erroneous, false, or obsolete information in customer\\\'s credit reports.</li>\n<li>To review credit profile status from the credit reporting agencies such as: Experian, Equifax and Transunion.&nbsp; Consulting, coaching, and monitoring services are conducted by personal meetings, webinars, video conferencing, telephone, email, or by any other form of communication during normal business hours.</li>\n</ol>In exchange, I, {CLIENT NAME}, agree to pay the following fees as outlined in the following fee schedule:<br /><ol>\n<li>$_____ At signup for document processing</li>\n<li>$_____ At the start of each new month of service.</li>\n</ol></div>\n<div>&nbsp;</div>\n<div><strong>Authorization for Credit Repair Action</strong></div>\n<div>&nbsp;</div>\n<div>1<strong>. &nbsp;</strong>I, {CLIENT NAME}, hereafter known as \\\"client\\\" hereby authorize, {COMPANY NAME}, {COMPANY ADDRESS}, {COMPANY CITY}, {COMPANY STATE} {COMPANY POSTCODE}, to make, receive, sign, endorse, execute, acknowledge, deliver, and possess such applications, correspondence, contracts, or agreements, as necessary to improve my credit. Such instruments in writing of whatever and nature shall only be effective for any or all of the three credit reporting agencies which are TransUnion, Experian, Equifax, and any other reporting agencies or creditor&rsquo;s listed, as may be necessary or proper in the exercise of the rights and powers herein granted.&nbsp;</div>\n<div>&nbsp;</div>\n<div>2. This authorization may be revoked by the undersigned at any time by giving written notice to the party authorized herein. Any activity made prior to revocation in reliance upon this authorization shall not constitute a breach of rights of the client. If not earlier revoked, this authorization will automatically expire twelve months from the date of signature.</div>\n<div>&nbsp;</div>\n<div>3. The party named above to receive the information is not authorized to make any further release or disclosure of the information received. This authorization does not authorize the release or disclosure of any information except as provided herein.</div>\n<div>&nbsp;</div>\n<div>4. I grant to {COMPANY NAME}, {COMPANY ADDRESS}, {COMPANY CITY}, {COMPANY STATE} {COMPANY POSTCODE}, authority to do, take, and perform, all acts and things whatsoever requisite, proper, or necessary to be done, in the exercise of repairing my credit with the three credit reporting agencies, which are TransUnion, Experian, Equifax and any other reporting agencies or creditor&rsquo;s listed, as fully for all intents and purposes as I might or could do if personally present.</div>\n<div>&nbsp;</div>\n<div>5. I hereby release&nbsp;{COMPANY NAME}, {COMPANY ADDRESS}, {COMPANY CITY}, {COMPANY STATE} {COMPANY POSTCODE}, from all and all matters of actions, causes of action, suits, proceedings, debts, dues, contracts, judgments, damages, claims, and demands whatsoever in law or equity, for or by reason of any matter, cause, or thing whatsoever as based on the circumstances of this contract.</div>\n<div><br /><strong>Consumer Credit File Rights Under State and Federal Law</strong></div>\n<div><strong>&nbsp;</strong></div>\n<div>You have a right to dispute inaccurate information in your credit report by contacting the credit bureau directly. However, neither you nor a credit repair company or credit repair organization has the right to have accurate, current and verifiable information removed from your credit report. The credit bureau must remove accurate, negative information from your report only if it is over 7 years old. Bankruptcy information can be reported up to 10 years.</div>\n<div>&nbsp;</div>\n<div>You have a right to obtain a copy of your credit report from a credit bureau. You may be charged a reasonable fee. There is no fee, however, if you have been turned down for credit, employment, insurance, or a rental dwelling because of information in your credit report within the preceding 60 days. The credit bureau must provide someone to help you interpret the information in your credit file. You are entitled to receive a free copy of your credit report if you are unemployed and intend to apply for employment in the next 60 days, if you are a recipient of public welfare assistance, or if you have reason to believe that there is inaccurate information in your credit report due to fraud.</div>\n<div>&nbsp;</div>\n<div>You have a right to sue a credit repair organization that violated the Credit Repair Organization Act. This law prohibits deceptive practices by credit repair organizations.</div>\n<div>&nbsp;</div>\n<div>You have the right to cancel your contract with any credit repair organization for any reason within 3 business days from the date you signed it.</div>\n<div>&nbsp;</div>\n<div>Credit bureaus are required to follow reasonable procedures to ensure that the information they report is accurate. However, mistakes may occur.</div>\n<div>&nbsp;</div>\n<div>You may, on your own, notify a credit bureau in writing that you dispute that accuracy of information in your credit file. The credit bureau must then reinvestigate and modify or remove inaccurate or incomplete information. The credit bureau may not charge any fee for this service. Any pertinent information and copies of all documents you have concerning an error should be given to the credit bureau.</div>\n<div>&nbsp;</div>\n<div>If the credit bureau\\\'s reinvestigation does not resolve the dispute to your satisfaction, you may send a brief statement to the credit bureau to be kept in your file, explaining why you think the record is inaccurate. The credit bureau must include a summary of your statement about disputed information with any report it issues about you.</div>\n<div>&nbsp;</div>\n<div>The Federal Trade Commission regulates credit bureaus and credit repair organizations. For more information contact: The Public Reference Branch Federal Trade Commission Washington, D.C. 20580.<strong>&nbsp;&nbsp;</strong></div>\n<div>&nbsp;</div>\n<div><strong>Notice of Right to Cancel</strong></div>\n<div><strong>&nbsp;</strong><strong>&nbsp;</strong></div>\n<div><strong>\\\'\\\'You may cancel this contract, without any penalty or obligation, at any time before midnight of the 3rd day which begins after the date the contract is signed by you.</strong></div>\n<div>\\\'\\\'To cancel this contract, mail or deliver a signed, dated copy of this cancellation notice, or any other written notice to&nbsp;{COMPANY NAME}, {COMPANY ADDRESS}, {COMPANY CITY}, {COMPANY STATE} {COMPANY POSTCODE}, before midnight on the 3rd day which begins after the date you have signed this contract stating \\\'\\\'I hereby cancel this transaction, (date) (purchaser&rsquo;s signature).&rsquo;&rsquo;</div>\n<div>&nbsp;</div>\n<div>Please acknowledge your receipt of this notice by electronically signing the form indicated below.</div>\n<div>&nbsp;</div>\n<div><strong>Acknowledgment of Receipt of Notice</strong></div>\n<div><strong>&nbsp;</strong><strong>&nbsp;</strong></div>\n<div>I,&nbsp;{CLIENT NAME},&nbsp; hereby acknowledge with my digital signature, receipt of the Notice of Right to Cancel. I confirm the fact that I agree and understand what I am signing, and acknowledge that I have received a copy of my Consumer Credit File Rights.</div>\n<p>\n<strong>*Digital Signatures:</strong> In 2000, the U.S. Electronic Signatures in Global and National Commerce (ESIGN) Act established electronic records and signatures as legally binding, having the same legal effects as traditional paper documents and handwritten signatures. Read more at the FTC web site: <a target=\"_blank\" href=\"http://www.ftc.gov/os/2001/06/esign7.htm\">http://www.ftc.gov/os/2001/06/esign7.htm</a></p>', '1');

-- --------------------------------------------------------

--
-- Table structure for table `crd_api_logs`
--

CREATE TABLE `crd_api_logs` (
  `iId` int(11) NOT NULL,
  `dLog_Date` date DEFAULT NULL,
  `tActivityLogs` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_audit_template`
--

CREATE TABLE `crd_audit_template` (
  `audit_template_id` int(11) NOT NULL,
  `audit_template_title` varchar(100) NOT NULL,
  `audit_template` longtext NOT NULL,
  `is_default` enum('0','1') NOT NULL DEFAULT '0',
  `page_number` enum('Yes','No') NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_audit_template`
--

INSERT INTO `crd_audit_template` (`audit_template_id`, `audit_template_title`, `audit_template`, `is_default`, `page_number`) VALUES
(1, 'Simple Audit(default)', '<div id=\\\"docs-internal-guid-7a666a87-c531-a70b-6db4-324ddb099617\\\" style=\\\"line-height: 1.8; margin-top: 0pt; margin-bottom: 0pt; text-align: center;\\\" dir=\\\"ltr\\\">&nbsp;</div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: center;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br /><br /><br /><br /><br />{COMPANY LARGE LOGO}</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: center;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: center;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.8; margin-top: 0pt; margin-bottom: 0pt; text-align: center;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; font-weight: bold; background-color: transparent;\\\">Credit Analysis Report</span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: center;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Prepared for </span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: center;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">{CLIENT NAME}</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: center;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">({TODAY\\\'S DATE})</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: center;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: center;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: center;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: center;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: center;\\\" dir=\\\"ltr\\\"><br /><br /><br /><span style=\\\"font-size: medium;\\\">&nbsp;</span><br /><br /><br /></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: center;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: center;\\\" dir=\\\"ltr\\\"><br /><span style=\\\"font-size: medium;\\\">&nbsp;</span><span style=\\\"background-color: transparent; font-family: Arial; font-size: medium;\\\">Prepared by</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: center;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">{TEAM MEMBER NAME}</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br class=\\\"kix-line-break\\\" /></span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">{COMPANY NAME}</span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: center;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">{COMPANY ADDRESS}</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br class=\\\"kix-line-break\\\" /></span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">{COMPANY CITY}, {COMPANY STATE} {COMPANY POSTCODE}</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br class=\\\"kix-line-break\\\" /></span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">{COMPANY WEBSITE}</span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: center;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">{COMPANY EMAIL}</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br class=\\\"kix-line-break\\\" /></span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">{COMPANY PHONE}<br /></span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;{PAGE BREAK}</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br /><br /><br />Dear {CLIENT NAME},<br /><br /></span><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">On behalf of </span><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">{COMPANY NAME}, I\\\'d like to take this opportunity to welcome you as a new client! We are thrilled to have you with us.&nbsp;</span></span>\r\n<p><span style=\\\"font-size: medium;\\\">Credit is our passion. We understand how important your credit is for your future and we will work tirelessly to make sure we are able to help you achieve your financial goals. <br /></span></p>\r\n<p><span style=\\\"font-size: medium;\\\">This credit analysis report provides an overview of your credit as potential lenders see it today. It lists the items that are negatively affecting your score and explains how we use the power of the law to improve your credit. It also includes a simple step-by-step plan for you to speed up the process.</span></p>\r\n<p style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">This credit analysis report is broken down into the following 5 sections:<br /><br /></span></p>\r\n<ol>\r\n<li><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Credit Score Basics</span></li>\r\n<li><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Your Credit Scores and Summary</span></li>\r\n<li><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Analysis of Your Accounts</span></li>\r\n<li><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">An Overview of Our Process</span></li>\r\n<li><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Your Part in the Process</span></li>\r\n</ol></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br />If you have any questions, do not hesitate to reach out. We are always happy to help! You can easily reach us during regular business hours in the following ways:<br /><br />&nbsp;&nbsp;&nbsp; - Email: {COMPANY EMAIL}<br />&nbsp;&nbsp;&nbsp; - Phone: {COMPANY PHONE}<br />&nbsp;&nbsp;&nbsp; - Website: {COMPANY WEBSITE}<br /><br />{CLIENT NAME}, thank you again for entrusting {COMPANY NAME} to restore your credit. We are honored to help you achieve your financial goals.<br /><br />Best,<br />{TEAM MEMBER NAME}<br /><br /><br />{PAGE BREAK}</span>&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">PART 1 - CREDIT SCORE BASICS</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: 12pt; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><span style=\\\"font-size: 12pt; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><span style=\\\"font-size: medium;\\\">What a Low Credit Score Costs you</span><br /><br /><br /></span></span>\r\n<table style=\\\"font-size: 16px; width: 600px; margin: 0 auto;\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td colspan=\\\"3\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\"><img src=\\\"https://app.creditrepaircloud.com/application/images/audit_car.jpg\\\" alt=\\\"\\\" width=\\\"250px\\\" /></span></td>\r\n</tr>\r\n<tr>\r\n<td style=\\\"padding-top: 10px;\\\" colspan=\\\"3\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">Brand New Toyota Camry</span></td>\r\n</tr>\r\n<tr>\r\n<td style=\\\"padding-top: 5px;\\\" colspan=\\\"3\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">$23,000</span></td>\r\n</tr>\r\n<tr>\r\n<td style=\\\"padding-top: 5px;\\\" colspan=\\\"3\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">66 Month Term</span></td>\r\n</tr>\r\n<tr>\r\n<td colspan=\\\"3\\\" align=\\\"center\\\" valign=\\\"middle\\\" height=\\\"40px\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></td>\r\n</tr>\r\n<tr>\r\n<td style=\\\"padding-top: 5px;\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">Person A</span></td>\r\n<td style=\\\"padding-top: 5px;\\\" align=\\\"center\\\" valign=\\\"middle\\\" width=\\\"150\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></td>\r\n<td style=\\\"padding-top: 5px;\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">Person B</span></td>\r\n</tr>\r\n<tr>\r\n<td style=\\\"padding-top: 5px;\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">Credit Score: 730</span></td>\r\n<td style=\\\"padding-top: 5px;\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></td>\r\n<td style=\\\"padding-top: 5px;\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">Credit Score: 599</span></td>\r\n</tr>\r\n<tr>\r\n<td style=\\\"padding-top: 5px;\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">Interest Rate: 1.99%</span></td>\r\n<td style=\\\"padding-top: 5px;\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></td>\r\n<td style=\\\"padding-top: 5px;\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">Interest Rate: 14.99%</span></td>\r\n</tr>\r\n<tr>\r\n<td style=\\\"padding-top: 5px;\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">Payment: $368.22</span></td>\r\n<td style=\\\"padding-top: 5px;\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></td>\r\n<td style=\\\"padding-top: 5px;\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">Payment: $513.97</span></td>\r\n</tr>\r\n<tr>\r\n<td style=\\\"padding-top: 5px;\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">Total Interest Paid $1302.39</span></td>\r\n<td style=\\\"padding-top: 5px;\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></td>\r\n<td style=\\\"padding-top: 5px;\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">Total Interest Paid $10,921.44</span></td>\r\n</tr>\r\n<tr>\r\n<td style=\\\"padding-top: 5px;\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">Total Payments: $24,302.39</span></td>\r\n<td style=\\\"padding-top: 5px;\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></td>\r\n<td style=\\\"padding-top: 5px;\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">Total Payments: $33,921.44</span></td>\r\n</tr>\r\n<tr>\r\n<td colspan=\\\"3\\\" align=\\\"center\\\" valign=\\\"middle\\\" height=\\\"40px\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></td>\r\n</tr>\r\n<tr>\r\n<td style=\\\"padding-top: 15px;\\\" colspan=\\\"3\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">Person B pays</span></td>\r\n</tr>\r\n<tr>\r\n<td style=\\\"padding-top: 5px;\\\" colspan=\\\"3\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: x-large;\\\"><strong>$9,616.05 MORE</strong></span></td>\r\n</tr>\r\n<tr>\r\n<td style=\\\"padding-top: 5px;\\\" colspan=\\\"3\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">than person A for the exact same car and price!</span></td>\r\n</tr>\r\n<tr>\r\n<td colspan=\\\"3\\\" align=\\\"center\\\" valign=\\\"middle\\\" height=\\\"50px\\\"><span style=\\\"font-size: medium;\\\">This same thing happens with your credit cards, mortgage, loans, etc.</span></td>\r\n</tr>\r\n<tr>\r\n<td colspan=\\\"3\\\" align=\\\"center\\\" valign=\\\"middle\\\"><span style=\\\"font-size: medium;\\\">Cleaning up your credit will lower your bills </span><br /><span style=\\\"font-size: medium;\\\">and can save hundreds of thousands of dollars!</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-east-asian: normal; font-variant-position: normal; text-decoration: none; vertical-align: baseline;\\\"><br />{PAGE BREAK}</span> </span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br /><span style=\\\"font-size: medium;\\\"><strong>What Is A Credit Score?</strong></span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br />A credit score is a number generated by a mathematical formula that is meant to predict creditworthiness. Credit scores range from 300-850. The higher your score is, the more likely you are to get a loan. The lower your score is, the less likely you are to get a loan. If you have a low credit score and manage to get approved for credit, your interest rate will be much higher than someone who had a good credit score. So, having a high credit score will save you many thousands of dollars.</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">What Is A Credit Bureau? </span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">A credit bureau is a company that collects and maintains your credit information and sells it to lenders, creditors and consumers in the form of a credit report. There are dozens of credit bureaus, we\\\'re most concerned with the big three: Equifax, Experian, and TransUnion.</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">How Credit Bureaus Determine your Credit Score</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">&nbsp;<img src=\\\"https://app.creditrepaircloud.com/application/images/audit_img1.jpg\\\" alt=\\\"\\\" width=\\\"589\\\" height=\\\"184\\\" /></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">The percentages in this chart show how important each of the categories is in determining your credit score. We will help you to remove negative items from your payment history. We will also show you how to maximize your debt ratio score, even if paying off credit cards is not an option.</span></div>\r\n<div style=\\\"text-align: justify;\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">How Your Behavior Is Evaluated In Your Credit Report:</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Do you pay your bills on time? </span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Payment history is a major factor in credit scoring. If you have paid bills late, have collections or a bankruptcy, these events won\\\'t reflect well in your credit score.</span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Do you have a long credit history? </span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Generally speaking, the longer your history of holding accounts is, the more trusted you will be as a borrower.</span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Have you applied for credit recently? </span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">If you have many recent inquiries this can be construed as being negative by the bureaus. Only apply for credit when you really want it.</span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">What is your outstanding debt? </span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">It is important to not use all of your available credit. If all of your credit cards are maxed out, your scores will reflect that you are not managing your debt wisely.&nbsp;<br /></span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; font-weight: bold; background-color: transparent;\\\"><br />Credit Score Ranges And Their Meaning<br /><br /></span><span style=\\\"font-family: Arial; background-color: transparent;\\\"><img style=\\\"display: block; margin-left: auto; margin-right: auto;\\\" src=\\\"https://app.creditrepaircloud.com/application/images/audit_scale.jpg\\\" alt=\\\"\\\" width=\\\"100%\\\" height=\\\"41\\\" /></span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br />800 and Higher</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"> (Excellent) With a credit score in this range no lender will ever disapprove your loan application. Additionally, the APR (Annual Percentage Rate) on your credit cards will be the lowest possible. You\\\'ll be treated as royalty. Achieving this excellent credit rating not only requires financial knowledge and discipline, but also a good credit history. Generally speaking, to achieve this excellent rating you must also use a substantial amount of credit on an ongoing monthly basis and always repay it ahead of time.</span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">700 - 799</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"> (Very Good) 27% of the United States population belongs to this credit score range. With this credit score range, you will enjoy good rates and approved for nearly any type of credit loan or personal loan, whether unsecured or secured.</span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">680 - 699</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"> (Good) This range is the average credit score. In this range approvals are practically guaranteed but the interest rates might be marginally higher. If you\\\'re thinking about a long term loan such as a mortgage, try working to increase your credit score higher than 720 and you will be rewarded for your efforts; your long term savings will be noticeable.</span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">620 - 679</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"> (OK or Fair) Depending on what kind of loan or credit you are applying for and your credit history, you might find that the rates you are quoted aren\\\'t best. That doesn\\\'t mean that you won\\\'t be approved but, certain restrictions will apply to the loan\\\'s terms.</span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">580 - 619</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"> (Poor) With a poor credit rating you can still get an unsecured personal loan and even a mortgage, but the terms and interest rates won\\\'t be very appealing. You\\\'ll be required to pay more over a longer period of time because of the high interest rates.</span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">500 - 579 </span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">(Bad) With a score in this range you can get a loan but nothing even close to what you expect it to be. Some people with bad credit apply for loans to consolidate debt in search for a fresh start. However, if you decide to do that proceed cautiously. With a 500 credit score you need to make sure that you don\\\'t default on payments or you\\\'ll be making your situation worse and might head towards bankruptcy, which is not what you want.</span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">499 and Lower</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"> (Very Bad) If this is your score range you need serious assistance with how you handle your credit. You\\\'re making too many credit blunders and they will only get worse if you don\\\'t take positive action. If you are thinking of a loan (which won\\\'t be easy), the rates will be very high and the terms will be very strict. We recommend that you fix your credit first before applying for a loan.<br /></span><span style=\\\"font-family: Arial; background-color: transparent;\\\">{PAGE BREAK}</span></span><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br /><br /></span><span style=\\\"font-family: Arial; font-size: medium; font-weight: bold; background-color: transparent;\\\"><br />PART 2 - YOUR CREDIT SCORES AND SUMMARY</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">We have analyzed your credit reports from the three major bureaus. Here are our findings:</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Your Credit Scores:</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: center;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"> &nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: center;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">{3 BUREAU CREDIT SCORE TABLE}</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-east-asian: normal; font-variant-position: normal; text-decoration: none; vertical-align: baseline;\\\"> <br /></span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: center;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-east-asian: normal; font-variant-position: normal; text-decoration: none; vertical-align: baseline;\\\">{REPORT PROVIDER REFERENCE}<br /><br /></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"background-color: transparent; font-family: Arial; font-size: medium; font-weight: bold;\\\"><br />Keep Your Credit Monitoring Account Active Throughout The Credit Repair Process</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Your credit scores may vary depending on where you get your credit reports from, because different sources have different methods for determining your score and scheduling updates. Maintaining one (1) credit monitoring account will give us a baseline score as a point of reference to grow from, to accurately see changes as they happen. <span>For this reason, you must keep your same credit monitoring account active, rather than checking your scores on multiple sites that will differ.</span></span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br class=\\\"kix-line-break\\\" /><br class=\\\"kix-line-break\\\" /></span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Your <span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><strong>Derogatory Summary</strong></span>:</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Next we analyzed all the items on your reports, to determine which accounts are negatively impacting your score. Here are our findings:</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">{DEROGATORY SUMMARY TABLE}</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">{PAGE BREAK}</span><span style=\\\"font-size: medium;\\\"><br /><br /><br /></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"background-color: transparent; font-family: Arial; font-weight: bold; font-size: medium;\\\">PART 3 - ANALYSIS OF YOUR ACCOUNTS</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">&nbsp;</span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Your Derogatory Items:</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">You have </span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">{NUMBER OF DEROGATORY ITEMS}</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"> items marked as delinquent or derogatory. <span>Recent late payments, collections, and other derogatory items within the last six months will hurt your credit score more than older inactive accounts. Accounts within the last 24 months carry the second most weight. This is why it is crucial to pay all bills on time and do not miss any payments.</span>&nbsp;</span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">{DEROGATORY ITEMS LIST}</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div id=\\\"docs-internal-guid-7a666a87-ce0b-0812-8c91-66a25627b0cf\\\" style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Your </span>Public Records</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">:<br class=\\\"kix-line-break\\\" /><br class=\\\"kix-line-break\\\" /></span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">You have <strong>{PUBLIC RECORD COUNT}</strong></span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"> public records.&nbsp;<span>Public records include details of court records, bankruptcy filings, tax liens and monetary judgments. These generally remain on your Credit Report for 7 to 10 years.</span></span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span><br /><span style=\\\"font-size: medium;\\\">{PUBLIC RECORD TABLE}</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Your Inquiries:</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><span>You have&nbsp;<strong>{NUMBER OF INQUIRIES}</strong>&nbsp;inquiries on your reports</span><span>.&nbsp;</span>Each time you apply for credit it lowers your score. For that reason we ask during credit repair that you </span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: underline; vertical-align: baseline;\\\">do not apply for anything</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">.</span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br />{INQUIRIES TABLE}<br /></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br />We Are Experts In Disputing Errors On Your Report That Lower Your Score. </span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">While we cannot promise to remove all of your negative items on your report, we do know how to use the law in your favor and we have an awesome track record.</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">{PAGE BREAK}&nbsp;<br /><br /></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Credit Utilization:</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">{CREDIT UTILIZATION PIE CHART}</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span id=\\\"docs-internal-guid-5f039e27-11db-4589-9584-a680b93b5b93\\\" style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">You have </span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">{TOTAL REVOLVING CREDIT LINES}</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"> in revolving credit lines and your balances average at </span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">{REVOLVING CREDIT BALANCE}</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"> which means that you are utilizing </span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">{CREDIT UTILIZATION PERCENTAGE USED}</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"> of your available credit line.</span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">&nbsp;</span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">How this impacts your score</span></span></span></span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">&nbsp;</span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">The </span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">purpose of a credit score is for lenders to determine the likelihood that you will repay money you borrow. Therefore, the scoring algorithms looks to see that you\\\'re not overextended in credit card debt and living beyond your means. As a rule of thumb, maxing out your cards will <span style=\\\"text-decoration: underline;\\\">lower</span> your score while showing more available credit will <span style=\\\"text-decoration: underline;\\\">increase</span> your score. <br /></span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">&nbsp;</span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Pro tip: If you\\\'re carring high balances, a quick trick to increase to score is to pay your balances down to below 25% of the available credit limit of each card and never spend any more than that, even if you pay the bill off in full each month.<br /></span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">&nbsp;</span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">How quickly will I see the changes?<br /></span></span></span></span></span></span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">&nbsp;</span></span></span></span></span></span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Credit card companies report your balances to the bureaus once per month (each on a different day) and your credit reports and scores at the credit monitoring company will only update once per month, therefore it can take upto two months to see this begin to impact your scores. For this reason, it\\\'s important to understand that improving your credit scores takes time and a commitment to change your daily habits and the way you spent money. The good news is that the sooner you can do it, the sooner your scores will rise.<br /></span></span></span></span></span></span></span></span></span><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">{PAGE BREAK}</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">&nbsp;<br /><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Credit Utilization Summary:</span><br /><br />{CREDIT UTILIZATION SUMMARY TABLE}<br /></span><span style=\\\"font-size: medium;\\\"> <br /><br /></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">PART 4 - AN OVERVIEW OF OUR PROCESS</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br class=\\\"kix-line-break\\\" /></span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br class=\\\"kix-line-break\\\" /><br class=\\\"kix-line-break\\\" /></span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Our Plan of Action</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">The credit system is flawed, and nearly 80% of all reports have errors that can lower your score. But you have rights and we know how to use them to your benefit! The law gives you the right to dispute </span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: underline; vertical-align: baseline;\\\">any</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"> item on your credit reports. And if those items cannot be verified, they must be removed. So we will write many letters to the bureaus. If they can\\\'t prove it, they must remove it! And we are very good at this! </span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">We Provide Document Preparation And Credit Education </span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">We will be drafting many letters on your behalf to credit bureaus and creditors, to challenge the items you wish us to challenge. Along the way, we will also guide you how to better manage your credit -- and how to keep your awesome credit long after our work is done. </span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">{PAGE BREAK}</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">PART 5 - YOUR PART IN THE PROCESS</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Your Next Steps</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"text-align: justify;\\\"><ol style=\\\"margin-top: 0pt; margin-bottom: 0pt;\\\">\r\n<li style=\\\"list-style-type: decimal; font-size: 12pt; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\" dir=\\\"ltr\\\">\r\n<p style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Log Into Your Client Portal. We will email you the login details.</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br class=\\\"kix-line-break\\\" /><br class=\\\"kix-line-break\\\" /></span></span></p>\r\n</li>\r\n<li style=\\\"list-style-type: decimal; font-size: 12pt; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\" dir=\\\"ltr\\\">\r\n<p style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Watch our 2-minute video. </span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br class=\\\"kix-line-break\\\" /><br class=\\\"kix-line-break\\\" /></span></span></p>\r\n</li>\r\n<li style=\\\"list-style-type: decimal; font-size: 12pt; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\" dir=\\\"ltr\\\">\r\n<p style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Provide a copy of your Photo ID and a copy of the top section of a recent utility bill (or an insurance statement or some other bill) as proof of your current address to include with our letters to the credit bureaus. Take a picture of these on your phone and upload them to us in your client portal. </span></p>\r\n</li>\r\n</ol></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">How You Can Speed Up The Process</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"text-align: justify;\\\"><ol style=\\\"margin-top: 0pt; margin-bottom: 0pt;\\\">\r\n<li style=\\\"list-style-type: decimal; font-size: 12pt; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\" dir=\\\"ltr\\\">\r\n<p style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Stop applying for credit (Each time you do it lowers your scores.)</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br class=\\\"kix-line-break\\\" /><br class=\\\"kix-line-break\\\" /></span></span></p>\r\n</li>\r\n<li style=\\\"list-style-type: decimal; font-size: 12pt; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\" dir=\\\"ltr\\\">\r\n<p style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Do not close any accounts (This also lowers your score.)</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br class=\\\"kix-line-break\\\" /><br class=\\\"kix-line-break\\\" /></span></span></p>\r\n</li>\r\n<li style=\\\"list-style-type: decimal; font-size: 12pt; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\" dir=\\\"ltr\\\">\r\n<p style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Pay your credit cards down to below 25% of the available credit line. This will make a huge positive impact on your credit score.</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br class=\\\"kix-line-break\\\" /><br class=\\\"kix-line-break\\\" /></span></span></p>\r\n</li>\r\n<li style=\\\"list-style-type: decimal; font-size: 12pt; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\" dir=\\\"ltr\\\">\r\n<p style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Never spend more than 25% of the available credit line, even if you pay the balance off in full each month.</span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br class=\\\"kix-line-break\\\" /><br class=\\\"kix-line-break\\\" /></span></span></p>\r\n</li>\r\n<li style=\\\"list-style-type: decimal; font-size: 12pt; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\" dir=\\\"ltr\\\">\r\n<p style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Pay your bills on time! One missed payment will lower your score dramatically and undo all the work we are doing. </span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br class=\\\"kix-line-break\\\" /><br class=\\\"kix-line-break\\\" /></span></span></p>\r\n</li>\r\n<li style=\\\"list-style-type: decimal; font-size: 12pt; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\" dir=\\\"ltr\\\">\r\n<p style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Keep your credit monitoring account active throughout the credit repair process, so we can see the changes to your accounts and scores. Your score won\\\'t suffer if you\\\'re ordering your own reports. Be sure to let us know your login details to the credit monitoring account. You can add those in your client portal. </span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\"><br class=\\\"kix-line-break\\\" /><br class=\\\"kix-line-break\\\" /></span></span></p>\r\n</li>\r\n<li style=\\\"list-style-type: decimal; font-size: 12pt; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\" dir=\\\"ltr\\\">\r\n<p style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Most importantly, We\\\'ll be sending many letters to the bureaus. Be sure to open all of your mail and forward the replies here to us. This can be as simple as taking a photo with your phone and uploading it to your portal (or attaching to an email). </span></p>\r\n</li>\r\n</ol></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;{PAGE BREAK}</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">This Process Takes Time</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Remember, it has taken you years to get your credit into its current state, so cleaning it up will not happen overnight. We cannot dispute everything all at once, or the credit bureaus will reject the disputes by marking them as \\\"frivolous,\\\" so we must do this carefully and strategically. It takes 30 to 45 days for bureaus and creditors to respond to each letter, and even more time for changes to reflect on your reports. A difficult item may take multiple letters to multiple parties, so patience is key. Thanks to technology (and by logging into our client portal), you\\\'ll receive real-time updates of the work we\\\'re doing every step of the way. </span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">By following our program and our advice, your credit will improve -- and along the way, we\\\'ll teach you how to maintain your excellent credit long after our work is done.</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\"><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">So Let\\\'s Get Started!<br /><br /></span><span style=\\\"font-family: Arial; color: #000000; background-color: transparent; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-east-asian: normal; font-variant-position: normal; text-decoration: none; vertical-align: baseline;\\\">How do we do that? Just reach out to us, so we can complete your signup process and activate your client portal access (if we haven\\\'t already).</span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium;\\\">&nbsp;</span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Our phone number is <strong>{COMPANY PHONE}&nbsp;</strong></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Our email is&nbsp;<span style=\\\"color: #00a3ff;\\\"><strong>{COMPANY EMAIL}</strong></span></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">Our site is at&nbsp;<span style=\\\"color: #00a3ff;\\\"><strong>{COMPANY WEBSITE}</strong></span><br /><br />Throughout this process, our contact information is always on our website and in our emails. You can also send us by secure messages in your portal.&nbsp;We want to hear from you and we are eager to help. Once the credit repair process has begun we will also be sending you progress reports and updates every step of the way.&nbsp;<br /><br /></span></div>\r\n<div style=\\\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\\\" dir=\\\"ltr\\\"><span id=\\\"docs-internal-guid-5f039e27-11db-4589-9584-a680b93b5b93\\\" style=\\\"font-size: medium; font-family: Arial; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline;\\\">We appreciate that you choose us. We look forward to working with you to improve your credit and your financial future!<br /><br />Credit is our passion. We understand how important your credit is for your future and we we work tirelessly to make sure we are able to help you achieve your financial goals.</span></div>', '1', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `crd_bureaus`
--

CREATE TABLE `crd_bureaus` (
  `iIds` int(10) NOT NULL,
  `vName` varchar(50) DEFAULT NULL,
  `vLogo` varchar(50) DEFAULT NULL,
  `vAddress` varchar(250) NOT NULL DEFAULT '0',
  `dInserted_time` date DEFAULT NULL,
  `bureau_status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_bureaus`
--

INSERT INTO `crd_bureaus` (`iIds`, `vName`, `vLogo`, `vAddress`, `dInserted_time`, `bureau_status`) VALUES
(1, 'equifax', 'equifax.png', 'Equifax Information Services LLC\nP.O. Box 740256\nAtlanta, GA 30374-0256', NULL, '1'),
(2, 'experian', 'experian.png', 'Experian / NCAC\nP.O. Box 9701\nAllen, TX 75013-9701', '2012-11-08', '1'),
(3, 'transunion', 'trans_union.png', 'TransUnion Consumer Relations\nPO Box 2000\nChester, PA 19022-2000', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `crd_chargebee_coupon`
--

CREATE TABLE `crd_chargebee_coupon` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `discount_type` varchar(50) NOT NULL,
  `discount_value` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_chargebee_plan`
--

CREATE TABLE `crd_chargebee_plan` (
  `id` int(11) NOT NULL,
  `plan_code` text NOT NULL COMMENT 'chargebee plan id',
  `name` text NOT NULL,
  `type` varchar(255) NOT NULL COMMENT 'monthly, full payment or per item',
  `billing_cycles` int(11) NOT NULL COMMENT 'number of cycles till plan runs',
  `start_payment_on` varchar(200) NOT NULL COMMENT 'card entered or letter saved',
  `setup_fee` double NOT NULL,
  `fee` double NOT NULL,
  `status` enum('active','archived') NOT NULL DEFAULT 'active',
  `group_number` int(11) NOT NULL,
  `version_number` int(11) NOT NULL,
  `show_plan_weblead` enum('0','1') NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_chat`
--

CREATE TABLE `crd_chat` (
  `id` int(10) UNSIGNED NOT NULL,
  `from` varchar(255) NOT NULL DEFAULT '',
  `to` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `sent` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `recd` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_checklist_track`
--

CREATE TABLE `crd_checklist_track` (
  `check_id` int(10) NOT NULL,
  `checklist_id` int(3) NOT NULL,
  `checked` enum('true','false') NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_clientletters`
--

CREATE TABLE `crd_clientletters` (
  `iletter_id` int(10) NOT NULL,
  `flag` enum('yes','no') DEFAULT 'no',
  `vLetterTitle` varchar(255) NOT NULL,
  `dcreatedon` datetime NOT NULL,
  `iclient_id` int(10) NOT NULL COMMENT 'F_Key crd_clients{ iclient_id}',
  `ibureau_id` int(10) DEFAULT NULL COMMENT 'F_Key crd_bureaus{ibureau_id}     allow null',
  `ifurnisher_id` int(10) DEFAULT NULL COMMENT 'F_Key crd_furnishers{ifurnisher_id}      allow null',
  `tletter_text` text NOT NULL COMMENT 'Long text / text,  save HTML',
  `vAbbreviation` varchar(50) DEFAULT NULL,
  `iRound` int(11) DEFAULT NULL,
  `dmodified_date` datetime DEFAULT NULL,
  `printed_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_clients`
--

CREATE TABLE `crd_clients` (
  `iclient_id` int(10) NOT NULL,
  `iuser_id` int(10) NOT NULL COMMENT 'Reference key  : cro_useraccess{ iuser_id }',
  `dreg_date` datetime NOT NULL,
  `vclient_title` varchar(20) DEFAULT NULL,
  `vclient_fname` varchar(50) DEFAULT NULL,
  `vclient_mname` varchar(50) DEFAULT NULL,
  `vclient_lname` varchar(50) DEFAULT NULL,
  `vclient_email` varchar(100) DEFAULT NULL,
  `vclient_phone` varchar(50) DEFAULT NULL,
  `vclient_mobile` varchar(50) DEFAULT NULL,
  `vclient_work` varchar(50) DEFAULT NULL,
  `vclient_work_ext` varchar(10) DEFAULT NULL COMMENT 'extension of work phone number',
  `vclient_fax` varchar(25) DEFAULT NULL,
  `vclient_address1` varchar(200) DEFAULT NULL,
  `vclient_city` varchar(50) DEFAULT NULL COMMENT 'crd_cities { icity_id} ',
  `vclient_state` varchar(50) DEFAULT NULL COMMENT 'crd_states{ istate_id}',
  `vclient_country` int(10) DEFAULT NULL COMMENT 'crd_countries{ icountry_id}',
  `vpostcode` varchar(15) DEFAULT NULL,
  `eclient_has_previous_address` enum('yes','no') NOT NULL DEFAULT 'no',
  `vclient_address2` varchar(200) DEFAULT NULL,
  `vclient_city2` varchar(50) DEFAULT NULL,
  `vclient_state2` varchar(50) DEFAULT NULL,
  `vclient_country2` int(10) DEFAULT NULL,
  `vpostcode2` varchar(15) DEFAULT NULL,
  `billing_name` varchar(255) DEFAULT NULL,
  `billing_address` text DEFAULT NULL,
  `billing_city` varchar(200) DEFAULT NULL,
  `billing_state` varchar(200) DEFAULT NULL,
  `billing_zip` text DEFAULT NULL,
  `dclient_dob` date NOT NULL,
  `vclient_ss` varchar(50) NOT NULL,
  `dlast_login` datetime DEFAULT NULL COMMENT 'last login entry of client',
  `iclient_status` int(10) NOT NULL COMMENT 'F-Key : crd_clientstatus { iclientstatus_id }',
  `iclient_status_old` int(11) NOT NULL,
  `dagreement_signed_on` datetime DEFAULT NULL,
  `vIP_address` varchar(50) DEFAULT NULL,
  `dstart_date` datetime NOT NULL,
  `vmemo` mediumtext DEFAULT NULL,
  `ehas_email` enum('0','1') DEFAULT '1' COMMENT '1= No Email, 0 = Has email ',
  `ireferredby_id` int(11) NOT NULL DEFAULT 0 COMMENT 'crd_affiliate {  iAffilate_id}',
  `tagreement` longtext DEFAULT NULL COMMENT 'HTML agreement created for client',
  `ePortalAccessClient` enum('on','off') NOT NULL DEFAULT 'off',
  `tDigitalSignature` mediumtext DEFAULT NULL COMMENT 'For the digital signature which is did by client',
  `vsource` varchar(255) DEFAULT NULL COMMENT 'lead from webfom with IP and HOST',
  `eApiFlag` enum('Yes','No') DEFAULT 'No',
  `vcr_report_provider` varchar(250) DEFAULT NULL COMMENT 'field for the credit report access details',
  `vcr_username` varchar(250) DEFAULT NULL COMMENT 'field for the credit report access details',
  `vcr_password` varchar(250) DEFAULT NULL COMMENT 'field for the credit report access details',
  `vcr_phonenumber` varchar(250) DEFAULT NULL COMMENT 'field for the credit report access details',
  `vcr_securityword_question` VARCHAR(200) DEFAULT NULL COMMENT 'field for the credit report security question',
  `vcr_securityword` varchar(250) DEFAULT NULL COMMENT 'field for the credit report access details',
  `vcr_note` varchar(250) DEFAULT NULL COMMENT 'Notes Clients credit report access details',
  `dlast_modified_status_on` datetime DEFAULT NULL COMMENT 'last updated date of status of cliet',
  `lstatus_log` longtext DEFAULT NULL COMMENT 'log of status add ',
  `eclient_choice_complete` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'checking client choice complete or not by the client',
  `plan_id` int(11) NOT NULL DEFAULT 0,
  `chargebee_subscription_id` varchar(255) DEFAULT NULL,
  `chargebee_subscription_state` varchar(50) DEFAULT NULL,
  `chargebee_customer_id` varchar(255) DEFAULT NULL,
  `chargebee_coupon` varchar(200) DEFAULT NULL,
  `chargebee_zero_plan` enum('yes','no') DEFAULT NULL,
  `chargebee_plan_status` enum('Assigned','Verify') NOT NULL DEFAULT 'Assigned',
  `card` mediumtext DEFAULT NULL,
  `cvv` mediumtext DEFAULT NULL,
  `card_exp` mediumtext DEFAULT NULL,
  `card_type` mediumtext DEFAULT NULL,
  `first_work_fee` enum('0','1') NOT NULL DEFAULT '0',
  `fb_notification_flag` enum('0','1') DEFAULT '0',
  `portal_language` enum('en','es') NOT NULL DEFAULT 'en',
  `agreement_selected` varchar(4) DEFAULT NULL COMMENT '''Y'' means selected one from all. ''N'' OR NULL OR Blank means Need to select from list'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `crd_clients`
--

INSERT INTO `crd_clients` (`iclient_id`, `iuser_id`, `dreg_date`, `vclient_title`, `vclient_fname`, `vclient_mname`, `vclient_lname`, `vclient_email`, `vclient_phone`, `vclient_mobile`, `vclient_work`, `vclient_work_ext`, `vclient_fax`, `vclient_address1`, `vclient_city`, `vclient_state`, `vclient_country`, `vpostcode`, `eclient_has_previous_address`, `vclient_address2`, `vclient_city2`, `vclient_state2`, `vclient_country2`, `vpostcode2`, `billing_name`, `billing_address`, `billing_city`, `billing_state`, `billing_zip`, `dclient_dob`, `vclient_ss`, `dlast_login`, `iclient_status`, `iclient_status_old`, `dagreement_signed_on`, `vIP_address`, `dstart_date`, `vmemo`, `ehas_email`, `ireferredby_id`, `tagreement`, `ePortalAccessClient`, `tDigitalSignature`, `vsource`, `eApiFlag`, `vcr_report_provider`, `vcr_username`, `vcr_password`, `vcr_phonenumber`, `vcr_securityword`, `vcr_note`, `dlast_modified_status_on`, `lstatus_log`, `eclient_choice_complete`, `plan_id`, `chargebee_subscription_id`, `chargebee_subscription_state`, `chargebee_customer_id`, `chargebee_coupon`, `chargebee_zero_plan`, `chargebee_plan_status`, `card`, `cvv`, `card_exp`, `card_type`, `first_work_fee`, `fb_notification_flag`, `portal_language`, `agreement_selected`) VALUES
(1, 0, '2013-01-10 05:34:45', '', 'Sample', '', 'Client', 'sample@client.com', '(310) 111-1111', '(310) 333-3333', '(310) 222-2222', NULL, '(310) 444-4444', ' 1234 Main Street', 'Santa Monica', 'California', 224, '90401', 'no', '', '', '', 224, '', NULL, NULL, NULL, NULL, NULL, '1963-02-14', '1111', '0000-00-00 00:00:00', 1, 0, NULL, NULL, NOW(), 'Click to add \'notes to yourself\' not seen by clients.', '', 1, '<p><strong style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">Client Agreement, Authorization and Terms of Service</strong>.</p><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">The following pages contain:</div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">1. Service Agreement<br />2. Authorization for Credit Repair Action<br />3. CONSUMER CREDIT FILE RIGHTS (CROA Disclosure)<br />4. Right Of Cancellation Notice<br />5. State Specific Disclosures (add if applicable)</div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">&nbsp;</div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\"><strong>&nbsp;</strong></div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\"><strong>Credit Repair Service Agreement</strong></div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">&nbsp;</div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">I, You, hereby enter into the following agreement with Your company name<br /><br />Your company name hereby agrees to perform the following:<br />1.<span class=\"Apple-converted-space\">&nbsp;</span><br />2.<span class=\"Apple-converted-space\">&nbsp;</span><br />3.<span class=\"Apple-converted-space\">&nbsp;</span><br />4.</div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">In exchange, you agrees to pay the following fees as outlined in the following fee schedule:<br />1.<span class=\"Apple-converted-space\">&nbsp;</span><br />2.<span class=\"Apple-converted-space\">&nbsp;</span><br />3.<span class=\"Apple-converted-space\">&nbsp;</span><br />4.</div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">&nbsp;</div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\"><strong>Authorization for Credit Repair Action?</strong></div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">&nbsp;</div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">1<strong>. &nbsp;</strong>I, Jane Doe, Hereafter known as \"client\" hereby?authorize, Your company name, Your company address City State Post code, to make, receive, sign, endorse, execute, acknowledge, deliver, and possess such applications, correspondence, contracts, or agreements, as necessary to repair my credit.? Such instruments in writing of whatever and nature shall only be effective for any or all of the three credit reporting agencies which are TransUnion, Experian, Equifax, and any other reporting agencies or creditor&rsquo;s listed, as may be necessary or proper in the exercise of the rights and powers herein granted.&nbsp;</div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">&nbsp;</div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">2. This authorization may be revoked by the undersigned at any time by giving written notice to the party authorized herein.? Any activity made prior to revocation in reliance upon this authorization shall not constitute a breach of rights of the client. If not earlier revoked, this authorization will automatically expire twelve months from the date of signature.</div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">&nbsp;</div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">3. The party named above to receive the information is not authorized to make any further release or disclosure of the information received.? This authorization does not authorize the release or disclosure of any information except as provided herein.</div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">&nbsp;</div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">4. I grant to Your company name, Your company address City State Post code, authority to do, take, and perform, all acts and things whatsoever requisite, proper, or necessary to be done, in the exercise of repairing my credit with the three credit reporting agencies, which are TransUnion, Experian, Equifax and any other reporting agencies or creditor&rsquo;s listed, as fully for all intents and purposes as I might or could do if personally present.</div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">&nbsp;</div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">5. I hereby release Your company name, Your company address City State Post code from all and all matters of actions, causes of action, suits, proceedings, debts, dues, contracts, judgments, damages, claims, and demands whatsoever in law or equity, for or by reason of any matter, cause, or thing whatsoever as based on the and circumstances of this contract.</div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\"><br /><strong>Consumer Credit File Rights Under State and Federal Law</strong></div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\"><strong>&nbsp;</strong></div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">You have a right to dispute inaccurate information in your credit report by contacting the credit bureau directly. However, neither you nor a credit repair company or credit repair organization has the right to have accurate, current and verifiable information removed from your credit report. The credit bureau must remove accurate, negative information from your report only if it is over 7 years old. Bankruptcy information can be reported up to 10 years.</div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">&nbsp;</div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">You have a right to obtain a copy of your credit report from a credit bureau. You may be charged a reasonable fee. There is no fee, however, if you have been turned down for credit, employment, insurance, or a rental dwelling because of information in your credit report within the preceding 60 days. The credit bureau must provide someone to help you interpret the information in your credit file. You are entitled to receive a free copy of your credit report if you are unemployed and intend to apply for employment in the next 60 days, if you are a recipient of public welfare assistance, or if you have reason to believe that there is inaccurate information in your credit report due to fraud.</div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">&nbsp;</div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">You have a right to sue a credit repair organization that violated the Credit Repair Organization Act. This law prohibits deceptive practices by credit repair organizations.</div><div style=\"color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphan', 'off', NULL, NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', 0, NULL, NULL, NULL, NULL, NULL, 'Assigned', NULL, NULL, NULL, NULL, '0', '0', 'en', NULL),
(2, 0, '2013-01-10 05:34:45', '', 'Sample', '', 'Lead', 'sample@lead.com', '(310) 111-1111', '(310) 333-3333', '(310) 222-2222', NULL, '(310) 444-4444', ' 1234 Main Street', 'Santa Monica', 'California', 224, '90401', 'no', '', '', '', 224, '', NULL, NULL, NULL, NULL, NULL, '1975-01-01', '1111', '0000-00-00 00:00:00', 2, 0, NULL, NULL, NOW(), 'Click to add \'notes to yourself\' not seen by clients.', '', 1, NULL, 'off', NULL, NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', 0, NULL, NULL, NULL, NULL, NULL, 'Assigned', NULL, NULL, NULL, NULL, '0', '0', 'en', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `crd_clients_assignedto`
--

CREATE TABLE `crd_clients_assignedto` (
  `iAssignedTo_id` int(11) NOT NULL,
  `iClient_id` int(11) NOT NULL COMMENT 'crd_clients { iclient_id}',
  `iTeam_id` int(11) NOT NULL COMMENT 'crd_team {iTeam_id}',
  `dassginedon` datetime NOT NULL COMMENT 'Added date time',
  `fb_notification_flag` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_clients_assignedto`
--

INSERT INTO `crd_clients_assignedto` (`iAssignedTo_id`, `iClient_id`, `iTeam_id`, `dassginedon`, `fb_notification_flag`) VALUES
(1, 1, 1, '2013-01-03 04:48:18', '0');

-- --------------------------------------------------------

--
-- Table structure for table `crd_clients_deleted`
--

CREATE TABLE `crd_clients_deleted` (
  `iclient_id` int(10) NOT NULL,
  `iuser_id` int(10) NOT NULL COMMENT 'Reference key  : cro_useraccess{ iuser_id }',
  `dreg_date` datetime NOT NULL,
  `vclient_title` varchar(20) DEFAULT NULL,
  `vclient_fname` varchar(50) NOT NULL,
  `vclient_mname` varchar(50) DEFAULT NULL,
  `vclient_lname` varchar(50) NOT NULL,
  `vclient_email` varchar(100) DEFAULT NULL,
  `vclient_phone` varchar(50) DEFAULT NULL,
  `vclient_mobile` varchar(50) DEFAULT NULL,
  `vclient_work` varchar(50) DEFAULT NULL,
  `vclient_work_ext` varchar(10) DEFAULT NULL COMMENT 'extension of work phone number',
  `vclient_fax` varchar(25) DEFAULT NULL,
  `vclient_address1` varchar(200) DEFAULT NULL,
  `vclient_city` varchar(50) DEFAULT NULL COMMENT 'crd_cities { icity_id} ',
  `vclient_state` varchar(50) DEFAULT NULL COMMENT 'crd_states{ istate_id}',
  `vclient_country` int(10) DEFAULT NULL COMMENT 'crd_countries{ icountry_id}',
  `vpostcode` varchar(15) DEFAULT NULL,
  `eclient_has_previous_address` enum('yes','no') NOT NULL DEFAULT 'no',
  `vclient_address2` varchar(200) DEFAULT NULL,
  `vclient_city2` varchar(50) DEFAULT NULL,
  `vclient_state2` varchar(50) DEFAULT NULL,
  `vclient_country2` int(10) DEFAULT NULL,
  `vpostcode2` varchar(15) DEFAULT NULL,
  `billing_name` varchar(255) DEFAULT NULL,
  `billing_address` text DEFAULT NULL,
  `billing_city` varchar(200) DEFAULT NULL,
  `billing_state` varchar(200) DEFAULT NULL,
  `billing_zip` text DEFAULT NULL,
  `dclient_dob` date NOT NULL,
  `vclient_ss` varchar(50) NOT NULL,
  `dlast_login` datetime DEFAULT NULL COMMENT 'last login entry of client',
  `iclient_status` int(10) NOT NULL COMMENT 'F-Key : crd_clientstatus { iclientstatus_id }',
  `iclient_status_old` int(11) NOT NULL,
  `dagreement_signed_on` datetime DEFAULT NULL,
  `vIP_address` varchar(50) DEFAULT NULL,
  `dstart_date` datetime NOT NULL,
  `vmemo` varchar(500) DEFAULT NULL,
  `ehas_email` enum('0','1') DEFAULT '1' COMMENT '1= No Email, 0 = Has email ',
  `ireferredby_id` int(11) NOT NULL DEFAULT 0 COMMENT 'crd_affiliate {  iAffilate_id}',
  `tagreement` text DEFAULT NULL COMMENT 'HTML agreement created for client',
  `ePortalAccessClient` enum('on','off') NOT NULL DEFAULT 'off',
  `tDigitalSignature` text DEFAULT NULL COMMENT 'For the digital signature which is did by client',
  `vsource` varchar(255) DEFAULT NULL COMMENT 'lead from webfom with IP and HOST',
  `eApiFlag` enum('Yes','No') DEFAULT 'No',
  `vcr_report_provider` varchar(250) DEFAULT NULL COMMENT 'field for the credit report access details',
  `vcr_username` varchar(250) DEFAULT NULL COMMENT 'field for the credit report access details',
  `vcr_password` varchar(250) DEFAULT NULL COMMENT 'field for the credit report access details',
  `vcr_phonenumber` varchar(250) DEFAULT NULL COMMENT 'field for the credit report access details',
  `vcr_securityword_question` VARCHAR(200) DEFAULT NULL COMMENT 'field for the credit report security question',
  `vcr_securityword` varchar(250) DEFAULT NULL COMMENT 'field for the credit report access details',
  `vcr_note` varchar(250) DEFAULT NULL COMMENT 'Notes Clients credit report access details',
  `dlast_modified_status_on` datetime DEFAULT NULL COMMENT 'last updated date of status of cliet',
  `lstatus_log` longtext DEFAULT NULL COMMENT 'log of status add ',
  `eclient_choice_complete` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'checking client choice complete or not by the client',
  `plan_id` int(11) NOT NULL DEFAULT 0,
  `chargebee_subscription_id` varchar(255) DEFAULT NULL,
  `chargebee_subscription_state` varchar(50) DEFAULT NULL,
  `chargebee_customer_id` varchar(255) DEFAULT NULL,
  `chargebee_coupon` varchar(200) DEFAULT NULL,
  `chargebee_zero_plan` enum('yes','no') DEFAULT NULL,
  `chargebee_plan_status` enum('Assigned','Verify') NOT NULL DEFAULT 'Assigned',
  `card` text DEFAULT NULL,
  `cvv` text DEFAULT NULL,
  `card_exp` text DEFAULT NULL,
  `card_type` text DEFAULT NULL,
  `first_work_fee` enum('0','1') NOT NULL DEFAULT '0',
  `fb_notification_flag` enum('0','1') DEFAULT '0',
  `portal_language` enum('en','es') NOT NULL DEFAULT 'en',
  `agreement_selected` varchar(4) DEFAULT NULL COMMENT '''Y'' means selected one from all. ''N'' OR NULL OR Blank means Need to select from list'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_clients_onboarding`
--

CREATE TABLE `crd_clients_onboarding` (
  `obid` int(11) NOT NULL,
  `iclient_id` int(10) NOT NULL,
  `report_provider` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_number` varchar(16) NOT NULL,
  `security_word` varchar(100) NOT NULL,
  `signature_name` varchar(100) NOT NULL,
  `signature_style` varchar(100) NOT NULL,
  `client_signature_data` text NOT NULL,
  `tokan` varchar(20) NOT NULL,
  `Updated_date` varchar(100) NOT NULL,
  `ip_msg_initiated` varchar(16) DEFAULT NULL,
  `1_complete_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `1_complete_by` varchar(50) NOT NULL,
  `2_complete_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `2_complete_by` varchar(50) NOT NULL,
  `3_complete_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `3_complete_by` varchar(50) NOT NULL,
  `4_complete_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `4_complete_by` varchar(50) NOT NULL,
  `5_complete_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `5_complete_by` varchar(50) NOT NULL,
  `6_complete_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `6_complete_by` varchar(50) NOT NULL,
  `custom_order_onboarding` varchar(50) NOT NULL,
  `complete_tasks` varchar(50) NOT NULL,
  `old_client` enum('0','1') NOT NULL DEFAULT '0',
  `welcome_show` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_clients_onboarding`
--

INSERT INTO `crd_clients_onboarding` (`obid`, `iclient_id`, `report_provider`, `username`, `password`, `phone_number`, `security_word`, `signature_name`, `signature_style`, `client_signature_data`, `tokan`, `Updated_date`, `ip_msg_initiated`, `1_complete_date`, `1_complete_by`, `2_complete_date`, `2_complete_by`, `3_complete_date`, `3_complete_by`, `4_complete_date`, `4_complete_by`, `5_complete_date`, `5_complete_by`, `6_complete_date`, `6_complete_by`, `custom_order_onboarding`, `complete_tasks`, `old_client`, `welcome_show`) VALUES
(1, 1, '', '', '', '', '', '', '', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAZAAAAA3CAYAAAAi0RwuAAAHcUlEQVR4nO2d0XHqShBEOwcyIAESIIIbgTNwBmTgFBwDITgHp0AMTsHvQ3Sptd6VZCNZ5nFOFXUvIEuLBD07szMjCQAA4I7YSTpL+pR0kXTYdjgwwZOkV0mnrQcCAPCmzni8Sfq4PnabjghKduoMxoe6a+UHRgQANuOoToier8//XZ8/bTYiKDmq8ww/1XkeR/XX7X3DcQHAg3NSJ0TH6/OdmNn+JZ7VhxaPxXv2HAEANqE0ILo+f9lmOBC8qvcyaiFFDAgAbErLgOCBbMuU8ZAwIACwMY6lp8HAgGyLw1ZjxkPq1qnefmVEAAANLteH1KXwsoi+Hbk4TiYcAPx5POM9qjMcn5L2m47oMdmpT6Pm/APAXWDhelMXe7+Mbw4r4XUPvD8AuCssXmRgbcNefTEnAMBdYQEjfLUNNuD/th4IAMBPsAEpC9YehYO68N1vewEu3lwrdLhT36aGhXkAWBy3MHnUMMpBwz5Tv4nP/esK+96py+h69MkBAKyExfNVfVfeRxIaJxFYZH87ieBFw35kS+Jiw1p48qTuev9VzlrnnADAQniGern+33UIj5SJ5fUHpzP/tgdmkV/aaDsl+6x61bpf/4u4Q8IaXhkAzGBOvNseR94DxJ1fH8ELyewnh5JqVfg2rmvcK2UtA3JRX1OylGHcqxvnmokWe/Ue4SN8BwH+JPYkTqobE8/yyroDz8TnhDeO1/2cdJ/ZWw4fHdV7IqWRyPWRjxXGsEbYMI2hPZFbw0Hez9zvxk/x+aBVPcCGZFz/Q0ORtxjUaj5yTaBlFJ7Veyp5jHsyIv6cFqoPfQ3dlesjayyw1xpa3oq9mrzb5C3XxqHNOYkWNl6HeO7vylSNUR7nRff1fQL4X2FhumiYiWNBGYsv57pA4pTQz8bju00Yd+oEphUW2Wu9W+zmzHzKG3tXf06WZmkD4pDVWb0g1671QfPTevM7865xA5Kfx+fYLVry9ZP69OLW9+neJiUA/xuyRYnU/RAdsplanHRTxTJUkYYoG/69Nrav7dfZNc/66iUdY7s0VN9pLvikPjFgrC1Iho7SE0n8eQ+xz6VpGa+fcFBv9HweaiLs6zvH4Gedio3TnMlH/psTj3ICclF3LXw97C2/ia4IAJticfIsvyWUNbwIW+6rJuhzsmbKWguLx7P6mep7bOfUYgvOVAy/5R21qrttXC2ypadj4TyrF9w1BG1s8f472Ns4qz93LcPk9+Yc0+Oz0R87p9JXw29qIcLEBoReYAB/hOzw+t2ZvIVgr2Grk9o+/OMfE/n0Xmr78fsWGs+abZymxC77eeV9w2vhljKmXxOtFHaPbY1wyhJZUrmek5+rZtBzXWdO6xR7rU+aNgIqju/zlWG1sb9bI0kBAG7AhuC7rSwyvdQzz5aITqVd7q/7Sy+mFK+cueZ+/Dc147RT5x1kJX2KVEuYcxwto2fh/JjYbgm8yPzTViM+dx7zmFj7XM0Nx6VhdzhvjJrxSi9mbEx/tS4F4OGwaOeP/zuFWWlAMn5dO45FY4qc+Zdi2Zo1Z6pticNPFuAy3t8KO1kUx8IlOZtfu6DtllbuudYwZ43LxnMsHPeiTuwdxhvz1JL8LqShmUoU8Li5EybAxuw0zMD6p2FPpLli6O1zbaEUndzv2OzxScNssHJ2nEJVznBb9/62cOa6SgpQeXfFnTpRTE+nRQrhlOfhdZpb8Fi/s0i/09B4SNNFiZnWW9sm388sro/G9vl3zs4q1z5yXDWyvqQVUvO4aG0CsCJHDXPuc5Zfiv1YPL+My1sA8gfuzCQLeDl7tCHz+ync5Ux2rIVKTXwyPTTrUfIzOex20nB9JMdRWzh/KbYdw8dYwkOxcM+Zhdsglwau9pops95Kat+duQv8Hnur3sPHTcpzPWbU1qrWB4ArFsmLxn9o+aOtVanv1Rsa76ectVqMnDWVIup04TQcRw29jPKYY2GVNF5HDdM9yy7CXq9Jw+VzkoVpZV3MqRhzCmKNvYYV00u0Sc/F7ZpgH/T1vJYGMK/tu/ouAZd4zf/Pz5LeXH53bKhbBvKooWfbyqRKo7XX8Ppk6C2PXU5AyM4CWJGzvnodLfKHbzHyo+YlnGK7modTKwazoOcxa+GN3H8thJEL3rlv92Uq38vHq+qLvr73R7m9wzZSL6opxC6ks9i22sT8lByX04zznNuotcS0lcr8Hn/zEq+V6zy1z+Jj29C6i69fz/GUEw8z9f2wJ+f7sbwV261VTAoAN3BUJyiuh/B90cvwVs70X/VVIFwg6Eyr2g/eIjEWXmmF1ZxpVVas51pPGhp7J1P8U98vqjy2Z8CleJ+v2691cyYft0zJ9XHncLju41lfr8VeQ/GfahliDyWNgCvzy3PslPESFzW6OLAWOsww43tjOwCAxSgXke2VcOc9AAAYZU46LgAAwIBclKfhHgAAzOYR754IAAALwG1PAQDgR9zS/gMAAB4YqpMBAOBHuKgPAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAYDH+A9k/aMU7qkEKAAAAAElFTkSuQmCC', '', '', NULL, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '', '', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `crd_clients_simple_audit`
--

CREATE TABLE `crd_clients_simple_audit` (
  `said` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `report_id` int(6) NOT NULL,
  `created_audit_title` varchar(500) NOT NULL,
  `created_audit` longtext NOT NULL,
  `created_date` datetime NOT NULL,
  `parent_audit_id` int(3) NOT NULL,
  `iteamid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_client_affiliate_hist`
--

CREATE TABLE `crd_client_affiliate_hist` (
  `iid` int(11) NOT NULL,
  `dhist_date` datetime NOT NULL COMMENT 'record inserted date',
  `iclient_id` int(11) NOT NULL,
  `iaffiliate_id` int(11) NOT NULL,
  `vactive_flag` varchar(10) NOT NULL COMMENT 'use this column while change affiliate',
  `vamount` varchar(50) DEFAULT NULL COMMENT 'amount per client decieded in commission rate',
  `ipay_id` int(11) DEFAULT NULL COMMENT 'payment table ID',
  `vreverse_amount` varchar(50) DEFAULT NULL COMMENT 'use this column while change affiliate after payment done',
  `ireverse_pay_id` int(11) DEFAULT NULL COMMENT 'use this column while change affiliate after payment done'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='affiliate client and commission record history';

-- --------------------------------------------------------

--
-- Table structure for table `crd_client_debt`
--

CREATE TABLE `crd_client_debt` (
  `iDebt_id` int(11) NOT NULL,
  `iClient_id` int(11) NOT NULL,
  `vMonth` varchar(20) NOT NULL,
  `vYear` int(11) NOT NULL,
  `vAccountCard` varchar(255) NOT NULL,
  `vAPR` int(11) NOT NULL,
  `vLimit` int(11) NOT NULL,
  `vBalance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_client_debt`
--

INSERT INTO `crd_client_debt` (`iDebt_id`, `iClient_id`, `vMonth`, `vYear`, `vAccountCard`, `vAPR`, `vLimit`, `vBalance`) VALUES
(1, 1, LOWER(MONTHNAME(NOW())), YEAR(NOW()), 'Visa', 0, 10000, 2000),
(2, 1, LOWER(MONTHNAME(NOW())), YEAR(NOW()), '', 0, 0, 0),
(3, 1, LOWER(MONTHNAME(NOW())), YEAR(NOW()), '', 0, 0, 0),
(4, 1, LOWER(MONTHNAME(NOW())), YEAR(NOW()), '', 0, 0, 0),
(5, 1, LOWER(MONTHNAME(NOW())), YEAR(NOW()), '', 0, 0, 0),
(6, 1, LOWER(MONTHNAME(NOW())), YEAR(NOW()), '', 0, 0, 0),
(7, 1, LOWER(MONTHNAME(NOW())), YEAR(NOW()), '', 0, 0, 0),
(8, 1, LOWER(MONTHNAME(NOW())), YEAR(NOW()), '', 0, 0, 0),
(9, 1, LOWER(MONTHNAME(NOW())), YEAR(NOW()), '', 0, 0, 0),
(10, 1, LOWER(MONTHNAME(NOW())), YEAR(NOW()), '', 0, 0, 0),
(11, 1, LOWER(MONTHNAME(NOW())), YEAR(NOW()), '', 0, 0, 0),
(12, 1, LOWER(MONTHNAME(NOW())), YEAR(NOW()), '', 0, 0, 0),
(13, 1, LOWER(MONTHNAME(NOW())), YEAR(NOW()), '', 0, 0, 0),
(14, 1, LOWER(MONTHNAME(NOW())), YEAR(NOW()), '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `crd_client_imported_pdf`
--

CREATE TABLE `crd_client_imported_pdf` (
  `iPDF_id` int(11) NOT NULL,
  `iClient_id` int(11) NOT NULL,
  `vFile_name` varchar(50) NOT NULL,
  `dAdded_Date` datetime NOT NULL,
  `vOriginal_filename` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_client_invoice`
--

CREATE TABLE `crd_client_invoice` (
  `iInvoiceId` int(11) NOT NULL,
  `iClientId` int(11) NOT NULL,
  `dInvoiceDate` datetime DEFAULT NULL,
  `dDueDate` datetime DEFAULT NULL,
  `eStatus` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '0 = ''Open'', 1 = ''Paid'', 2 = ''Refunded''',
  `ref_id` varchar(50) DEFAULT NULL,
  `iTerm` int(11) NOT NULL DEFAULT 0 COMMENT 'Number of days to due date',
  `dAddedDate` datetime DEFAULT NULL,
  `chargebee_invoce_id` int(10) DEFAULT NULL,
  `eApiFlag` enum('yes','no','zapier') NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_client_invoiceitem`
--

CREATE TABLE `crd_client_invoiceitem` (
  `iInvoiceItemId` int(11) NOT NULL,
  `iInvoiceId` int(11) NOT NULL,
  `vDescription` varchar(255) NOT NULL,
  `vPrice` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_client_login_sent`
--

CREATE TABLE `crd_client_login_sent` (
  `iLoginSent_id` int(11) NOT NULL,
  `iClient_id` int(11) NOT NULL,
  `sent_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_client_notes`
--

CREATE TABLE `crd_client_notes` (
  `inote_id` int(10) NOT NULL,
  `iclient_id` int(10) NOT NULL COMMENT 'F_Key crd_clients{ iclient_id}',
  `tnote_text` text NOT NULL,
  `vattachment` varchar(200) NOT NULL COMMENT 'File path',
  `vsender` enum('client','admin','team') NOT NULL,
  `isender_id` int(11) NOT NULL,
  `vrecipient` enum('client','admin','team') NOT NULL,
  `added_by` int(11) DEFAULT NULL COMMENT 'Team member ID(who wrote note)',
  `dsenton` datetime NOT NULL,
  `ereadunread` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 = unread',
  `iallowclient_view` enum('0','1') NOT NULL DEFAULT '1' COMMENT '1 = allow',
  `dDatetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_client_payment_option`
--

CREATE TABLE `crd_client_payment_option` (
  `iid` int(11) NOT NULL,
  `vtitle` varchar(500) DEFAULT NULL COMMENT 'title for the payment option',
  `vdescription` varchar(500) DEFAULT NULL COMMENT 'description for the payment option',
  `dadded_date` datetime NOT NULL,
  `dupdate_date` datetime NOT NULL,
  `eDefault` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'default selected option will show in invoice'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='table for the client payment option for the invoice use 28-jan-2014';

-- --------------------------------------------------------

--
-- Table structure for table `crd_client_payment_recieved`
--

CREATE TABLE `crd_client_payment_recieved` (
  `iPaymentReceivedId` int(11) NOT NULL,
  `iInvoiceId` int(11) NOT NULL,
  `dDateRecived` datetime NOT NULL,
  `vAmountPaid` varchar(20) NOT NULL DEFAULT '0',
  `vDescription` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_client_statuses`
--

CREATE TABLE `crd_client_statuses` (
  `istatus_id` int(11) NOT NULL COMMENT 'Client Status Id',
  `vstatus_name` varchar(255) NOT NULL COMMENT 'Client Status Name',
  `vadded_by` enum('system','user') NOT NULL DEFAULT 'user' COMMENT 'define from where status is generated by system or by user',
  `eallow_login` enum('Yes','No') NOT NULL DEFAULT 'Yes' COMMENT 'Is client can login with this status',
  `iadded_by_id` int(11) NOT NULL DEFAULT 1111111 COMMENT 'define from where status is generated by team meber/admin or by systemid If system is genereated then id = 111111',
  `dadded_date` datetime NOT NULL COMMENT 'Status Added Date',
  `ilast_updated_by_id` int(11) DEFAULT NULL COMMENT 'define from where status is updated by team meber/admin or systemid If system is updated then id = 111111',
  `dlast_updated_date` datetime DEFAULT NULL COMMENT 'Status Updated Date',
  `idisplay_order` int(11) DEFAULT NULL,
  `vcolor` varchar(10) NOT NULL DEFAULT 'FFFFFF'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_client_statuses`
--

INSERT INTO `crd_client_statuses` (`istatus_id`, `vstatus_name`, `vadded_by`, `eallow_login`, `iadded_by_id`, `dadded_date`, `ilast_updated_by_id`, `dlast_updated_date`, `idisplay_order`, `vcolor`) VALUES
(1, 'Client', 'system', 'Yes', 1111111, '2013-10-04 16:02:36', NULL, NULL, 4, 'FFFFFF'),
(2, 'Lead', 'system', 'No', 1111111, '2013-10-04 16:04:28', NULL, NULL, 1, '99ff99'),
(3, 'Lead/Inactive', 'system', 'No', 1111111, '2013-10-04 16:05:14', NULL, NULL, 3, 'FFFFFF'),
(4, 'Inactive', 'system', 'No', 1111111, '2013-10-04 16:07:31', NULL, NULL, 5, 'FFFFFF'),
(5, 'Suspended', 'system', 'No', 1111111, '2013-10-04 16:07:31', NULL, NULL, 6, 'ffb2c5'),
(100, 'Prospect', 'system', 'No', 1111111, '2013-12-21 00:00:00', NULL, NULL, 2, '80E6FF');

-- --------------------------------------------------------

--
-- Table structure for table `crd_client_status_logs`
--

CREATE TABLE `crd_client_status_logs` (
  `iid` int(11) NOT NULL,
  `iold_status_id` int(11) NOT NULL,
  `inew_status_id` int(11) NOT NULL,
  `iclient_id` int(11) NOT NULL COMMENT 'client id whom status changed',
  `ddate` datetime NOT NULL COMMENT 'status changed date',
  `iteam_id` int(11) DEFAULT 0 COMMENT 'team member who changed status.',
  `esource` enum('team','affiliate','zapier','api','webform','csvimport') NOT NULL DEFAULT 'team' COMMENT 'lead or client added by'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='status logs of client  ';

-- --------------------------------------------------------

--
-- Table structure for table `crd_common_log`
--

CREATE TABLE `crd_common_log` (
  `iid` int(11) NOT NULL,
  `vteam_name` varchar(50) DEFAULT NULL COMMENT 'team member name whom did action',
  `iclient_id` int(11) NOT NULL DEFAULT 0,
  `iteam_id` int(11) NOT NULL DEFAULT 0,
  `ifor_affiliate_id` int(11) NOT NULL DEFAULT 0 COMMENT 'action did for whom affiliate',
  `ifor_team_id` int(11) NOT NULL DEFAULT 0 COMMENT 'action did for whom team',
  `ddate` datetime NOT NULL,
  `tdata` longtext NOT NULL COMMENT 'comma saperated value of comment with timestamp',
  `document_name` varchar(255) DEFAULT NULL,
  `original_name` text DEFAULT NULL,
  `doc_deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='common log table for the team member activity on client. 25-desc-2013 ';

-- --------------------------------------------------------

--
-- Table structure for table `crd_company_contacts`
--

CREATE TABLE `crd_company_contacts` (
  `icontact_id` int(10) NOT NULL,
  `vfirst_name` varchar(30) DEFAULT NULL,
  `vlast_name` varchar(30) DEFAULT NULL,
  `vcompany` varchar(200) DEFAULT NULL,
  `vemail` varchar(100) DEFAULT NULL,
  `vphone` varchar(100) DEFAULT NULL,
  `taddress` text DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_credit_monitoring_details`
--

CREATE TABLE `crd_credit_monitoring_details` (
  `alid` int(5) NOT NULL COMMENT 'id for referral links',
  `report_provider` varchar(100) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `referral_link` varchar(500) NOT NULL COMMENT 'Valid links given by report providers',
  `default_referral_link` varchar(150) NOT NULL,
  `iorder` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `crd_credit_monitoring_details`
--

INSERT INTO `crd_credit_monitoring_details` (`alid`, `report_provider`, `display_name`, `referral_link`, `default_referral_link`, `iorder`) VALUES
(1, 'IdentityIQ', 'IdentityIQ', 'http://www.identityiq.com/help-you-to-save-money.aspx?offercode=431133ED', 'http://www.identityiq.com/help-you-to-save-money.aspx?offercode=431133ED', 1),
(2, 'PrivacyGuard', 'PrivacyGuard', 'https://www.privacyguard.com/thankyou.html', 'https://www.privacyguard.com/thankyou.html', 5),
(3, 'IdentitySecure', 'IdentitySecure', 'https://www.identitysecure.com/secure/EnableWebAccess.aspx', 'https://www.identitysecure.com/secure/EnableWebAccess.aspx', 6),
(4, 'FreeScore360', 'FreeScore360 (not recommended)', 'https://www.freescore360.com/us/6019/378j4p7/t420/000/f/cs_4p_a000.aspx', 'https://www.freescore360.com/us/6019/378j4p7/t420/000/f/cs_4p_a000.aspx', 8),
(5, 'FreeScore', 'FreeScore', 'http://freescore.com/', 'http://freescore.com/', 7),
(6, 'Scoresense', 'Scoresense (not recommended)', 'https://secure.scoresense.com/us/6019/373f031/t420/135/f/cs_4p_a135.aspx', 'https://secure.scoresense.com/us/6019/373f031/t420/135/f/cs_4p_a135.aspx', 9),
(7, 'WellsFargoEnhanced', 'Wells Fargo Enhanced (not recommended)', 'https://enhanced.wellsfargoprotection.com/', 'https://enhanced.wellsfargoprotection.com/', 10),
(8, 'SmartCredit', 'SmartCredit', 'https://www.smartcredit.com/?pid=50615', 'https://www.smartcredit.com/?pid=50615', 2),
(9, 'MyFreeScoreNow', 'MyFreeScoreNow', 'https://member.myfreescorenow.com/join/?PID=20035&AID=CRCSTD&ADID=&SID=&TID=', 'https://member.myfreescorenow.com/join/?PID=20035&AID=CRCSTD&ADID=&SID=&TID=', 3),
(10, 'IdentityClub', 'IdentityClub', 'https://members.identityclub.com/join/?PID=32011', 'https://members.identityclub.com/join/?PID=32011', 4); 
-- --------------------------------------------------------

--
-- Table structure for table `crd_cr_source`
--

CREATE TABLE `crd_cr_source` (
  `iid` int(11) NOT NULL,
  `iteam_id` int(11) NOT NULL,
  `iclient_id` int(11) NOT NULL,
  `vsource` longtext NOT NULL,
  `aws_object_key` VARCHAR(500) NULL DEFAULT NULL COMMENT 'Added for storing s3 bucket file for alternative to vsource',
  `dadded_date` datetime NOT NULL,
  `vcr_provider_name` varchar(250) NOT NULL COMMENT 'name of provider of the credit report sourse',
  `pending_report` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'yes = ''report is saved but dispute item is not created yet'',no = ''report is saved but dispute item created''',
  `tsource_array` longtext DEFAULT NULL COMMENT 'pending source array',
  KEY `iclient_id` (`iclient_id`),
  KEY `iteam_id` (`iteam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='import credit report souec';


--
-- Table structure for table `crd_daily_expense`
--

CREATE TABLE `crd_daily_expense` (
  `iDailyExpense_id` int(11) NOT NULL,
  `iClient_id` int(11) NOT NULL,
  `dDate` date NOT NULL,
  `vExpense_Name` varchar(100) NOT NULL,
  `vAmount` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_disputeitems`
--

CREATE TABLE `crd_disputeitems` (
  `idispute_id` int(10) NOT NULL,
  `iclient_id` int(10) NOT NULL COMMENT 'F_Key crd_clients{ iclient_id}',
  `ifurnisher_id` int(10) NOT NULL COMMENT 'F_Key crd_furnishers{ ifurnisher_id)',
  `idisputereason_id` int(10) NOT NULL COMMENT 'F_Key crd_dispute_reasons{ idisputereason_id}',
  `vnote` text DEFAULT NULL,
  `texplanation` text DEFAULT NULL,
  `iexplanation_for_future` int(1) NOT NULL DEFAULT 0 COMMENT ' Save explanation for future use. ',
  `ibalanceamt` varchar(10) DEFAULT NULL,
  `vinserted_from` enum('user','credit report','PrivacyGuard','CreditCheckTotal','IdentitySecure','FreeScore','TrueCredit','FreeScore360','Wells Fargo Enhanced','Scoresense','MyScore','CreditUpdates','SmartCredit','ProCredit','IdentityIQ','MyFreeScoreNow','IdentityClub') NOT NULL DEFAULT 'user',
  `ecr_section` enum('Other','Personal Profile','Credit Summary','Public Records','Credit Inquiries','Account History') NOT NULL DEFAULT 'Other' COMMENT 'this is the section of credit report import from online credit report.',
  `dadded_date` datetime DEFAULT NULL,
  `dmodified_date` datetime DEFAULT NULL,
  `iclient_choice` int(11) NOT NULL DEFAULT 0 COMMENT '(0 - client choice off, 1 - client answerd pending, 2 - client answerd, 3 - client choice ignored, 4 - client answered not requierd (for Positive items))',
  `dclient_choice_date` datetime DEFAULT NULL,
  `vclient_choice_status` varchar(50) DEFAULT NULL COMMENT 'client choice status ''verify_item'', ''not_mine'',''ignore'',''never_late''',
  `vreported_as` varchar(250) DEFAULT NULL COMMENT 'negative keyword which selected from Quick Mode. client choice is on'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_disputeitems`
--

INSERT INTO `crd_disputeitems` (`idispute_id`, `iclient_id`, `ifurnisher_id`, `idisputereason_id`, `vnote`, `texplanation`, `iexplanation_for_future`, `ibalanceamt`, `vinserted_from`, `ecr_section`, `dadded_date`, `dmodified_date`, `iclient_choice`, `dclient_choice_date`, `vclient_choice_status`, `vreported_as`) VALUES
(1, 1, 3, 9, NULL, '', 0, NULL, 'credit report', 'Other', NULL, NULL, 0, NULL, NULL, NULL),
(2, 1, 7, 2, NULL, '', 0, NULL, 'credit report', 'Other', NULL, NULL, 0, NULL, NULL, NULL),
(3, 1, 2, 9, NULL, '', 0, NULL, 'credit report', 'Other', NULL, NULL, 0, NULL, NULL, NULL),
(4, 1, 8, 3, NULL, '', 0, NULL, 'credit report', 'Other', NULL, NULL, 0, NULL, NULL, NULL),
(5, 1, 6, 7, NULL, '', 0, NULL, 'credit report', 'Other', NULL, NULL, 0, NULL, NULL, NULL),
(6, 1, 7, 5, NULL, '', 0, NULL, 'credit report', 'Other', NULL, NULL, 0, NULL, NULL, NULL),
(7, 1, 4, 8, NULL, '', 0, NULL, 'credit report', 'Other', NULL, NULL, 0, NULL, NULL, NULL),
(8, 1, 2, 8, NULL, '', 0, NULL, 'credit report', 'Other', NULL, NULL, 0, NULL, NULL, NULL),
(9, 1, 5, 9, NULL, '', 0, NULL, 'credit report', 'Other', NULL, NULL, 0, NULL, NULL, NULL),
(10, 1, 3, 9, NULL, '', 0, NULL, 'credit report', 'Other', NULL, NULL, 0, NULL, NULL, NULL),
(11, 1, 2, 7, NULL, '', 0, NULL, 'credit report', 'Other', NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `crd_disputeitems_qm`
--

CREATE TABLE `crd_disputeitems_qm` (
  `idispute_id` int(10) NOT NULL,
  `iclient_id` int(10) NOT NULL COMMENT 'F_Key crd_clients{ iclient_id}',
  `ifurnisher_id` int(10) NOT NULL COMMENT 'F_Key crd_furnishers{ ifurnisher_id)',
  `idisputereason_id` int(10) NOT NULL COMMENT 'F_Key crd_dispute_reasons{ idisputereason_id}',
  `vnote` text DEFAULT NULL,
  `texplanation` text DEFAULT NULL,
  `iexplanation_for_future` int(1) NOT NULL DEFAULT 0 COMMENT ' Save explanation for future use. ',
  `ibalanceamt` varchar(10) DEFAULT NULL,
  `vinserted_from` enum('user','credit report','PrivacyGuard','CreditCheckTotal','IdentitySecure','FreeScore','TrueCredit','FreeScore360','Wells Fargo Enhanced','Scoresense') NOT NULL DEFAULT 'user',
  `ecr_section` enum('Other','Personal Profile','Credit Summary','Public Records','Credit Inquiries','Account History') NOT NULL DEFAULT 'Other' COMMENT 'this is the section of credit report import from online credit report.',
  `dadded_date` datetime DEFAULT NULL,
  `dmodified_date` datetime DEFAULT NULL,
  `iclient_choice` int(11) NOT NULL DEFAULT 0 COMMENT ' 0 - client choice off,  1 - client answerd pending, 2 - client answerd,   3 - client choice ignored,  4 - client answered not requierd (for Positive items)',
  `dclient_choice_date` datetime DEFAULT NULL,
  `vclient_choice_status` varchar(50) DEFAULT NULL COMMENT 'client choice status ''verify_item'', ''not_mine'',''ignore'',''never_late''',
  `vreported_as` varchar(250) DEFAULT NULL COMMENT 'negative keyword which selected from Quick Mode. client choice is on'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_dispute_bureaus_furni`
--

CREATE TABLE `crd_dispute_bureaus_furni` (
  `idispbur_id` int(10) NOT NULL,
  `idispute_id` int(10) NOT NULL COMMENT 'F_Key crd_disputeitems{ idispute_id }',
  `ibureau_id` int(10) NOT NULL COMMENT 'F_Key crd_bureaus{ ibureau_id}',
  `vaccountnumber` varchar(50) DEFAULT NULL,
  `vaccountname` text DEFAULT NULL,
  `vinternalnote` text DEFAULT NULL,
  `dDate_Reported` date DEFAULT NULL,
  `dlastactivity` varchar(10) DEFAULT NULL,
  `idisputestatus_id` int(10) DEFAULT NULL COMMENT 'F_Key crd_dispute_statustypes{idisputestatus_id}',
  `vamount` varchar(250) DEFAULT NULL COMMENT 'effr',
  `vplaintiff` varchar(250) DEFAULT NULL COMMENT 'effr',
  `vdatefiled` datetime DEFAULT NULL COMMENT 'effr',
  `vecoa` varchar(250) DEFAULT NULL COMMENT 'effr',
  `vaccount_type` varchar(250) DEFAULT NULL,
  `vaccount_status` varchar(250) DEFAULT NULL,
  `vmonthly_payment` varchar(250) DEFAULT NULL,
  `vdate_opened` varchar(250) DEFAULT NULL,
  `vbalance` varchar(250) DEFAULT NULL,
  `vterms` varchar(250) DEFAULT NULL,
  `vhigh_balance` varchar(250) DEFAULT NULL,
  `vlimit` varchar(250) DEFAULT NULL,
  `vpastdue` varchar(250) DEFAULT NULL,
  `vpayment_status` text DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `vcomments` text DEFAULT NULL,
  `other_account_status` varchar(30) DEFAULT NULL,
  `other_account_status1` varchar(250) DEFAULT NULL,
  `other_account_status2` varchar(250) DEFAULT NULL,
  `other_account_status3` varchar(250) DEFAULT NULL,
  `vlast_verified` varchar(250) DEFAULT NULL,
  `vdate_closed` varchar(250) DEFAULT NULL,
  `vlast_payment` varchar(250) DEFAULT NULL,
  `vpayment_frequency` varchar(250) DEFAULT NULL,
  `late_payment_history` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_dispute_bureaus_furni`
--

INSERT INTO `crd_dispute_bureaus_furni` (`idispbur_id`, `idispute_id`, `ibureau_id`, `vaccountnumber`, `vaccountname`, `vinternalnote`, `dDate_Reported`, `dlastactivity`, `idisputestatus_id`, `vamount`, `vplaintiff`, `vdatefiled`, `vecoa`, `vaccount_type`, `vaccount_status`, `vmonthly_payment`, `vdate_opened`, `vbalance`, `vterms`, `vhigh_balance`, `vlimit`, `vpastdue`, `vpayment_status`, `address`, `vcomments`, `other_account_status`, `other_account_status1`, `other_account_status2`, `other_account_status3`, `vlast_verified`, `vdate_closed`, `vlast_payment`, `vpayment_frequency`, `late_payment_history`) VALUES
(1, 1, 1, '0000004356', NULL, '', '2012-06-07', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 2, '0000004356', NULL, '', '2012-06-06', '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, 3, '0000004356', NULL, '', '2012-06-06', '', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 2, 1, '0000001345', NULL, '', '1970-01-01', '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 2, 2, '0000001345', NULL, '', '1970-01-01', '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 2, 3, '0000001345', NULL, '', '1970-01-01', '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 3, 1, '000000456', NULL, '', '2012-08-07', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 4, 1, '000000789', NULL, '', '2012-08-15', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 4, 2, '000000789', NULL, '', '2012-08-15', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 4, 3, '000000789', NULL, '', '2012-08-15', '', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 5, 2, '000000456', NULL, '', '2012-08-30', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 5, 3, '000000456', NULL, '', '2012-08-30', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 6, 2, '000000123', NULL, '', '2012-09-05', '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 6, 3, '000000123', NULL, '', '2012-09-05', '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 7, 1, '000000465', NULL, '', '2012-10-01', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 8, 1, '00000046', NULL, '', '2012-10-10', '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 8, 2, '00000046', NULL, '', '2012-10-10', '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 8, 3, '00000046', NULL, '', '2012-10-10', '', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 9, 1, '000000789', NULL, '', '2012-11-08', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 9, 2, '000000789', NULL, '', '2012-11-08', '', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 9, 3, '000000789', NULL, '', '2012-11-08', '', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 10, 2, '000000123', NULL, '', '2012-11-20', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 11, 2, '000000456', NULL, '', '2012-12-13', '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `crd_dispute_bureaus_furni_qm`
--

CREATE TABLE `crd_dispute_bureaus_furni_qm` (
  `idispbur_id` int(10) NOT NULL,
  `idispute_id` int(10) NOT NULL COMMENT 'F_Key crd_disputeitems{ idispute_id }',
  `ibureau_id` int(10) NOT NULL COMMENT 'F_Key crd_bureaus{ ibureau_id}',
  `vaccountnumber` varchar(50) DEFAULT NULL,
  `vinternalnote` text DEFAULT NULL,
  `dDate_Reported` date DEFAULT NULL,
  `dlastactivity` varchar(10) DEFAULT NULL,
  `idisputestatus_id` int(10) DEFAULT NULL COMMENT 'F_Key crd_dispute_statustypes{idisputestatus_id}',
  `vamount` varchar(250) DEFAULT NULL COMMENT 'effr',
  `vplaintiff` varchar(250) DEFAULT NULL COMMENT 'effr',
  `vdatefiled` datetime DEFAULT NULL COMMENT 'effr',
  `vecoa` varchar(250) DEFAULT NULL COMMENT 'effr',
  `vaccount_type` varchar(250) DEFAULT NULL,
  `vaccount_status` varchar(250) DEFAULT NULL,
  `vmonthly_payment` varchar(250) DEFAULT NULL,
  `vdate_opened` varchar(250) DEFAULT NULL,
  `vbalance` varchar(250) DEFAULT NULL,
  `vterms` varchar(250) DEFAULT NULL,
  `vhigh_balance` varchar(250) DEFAULT NULL,
  `vlimit` varchar(250) DEFAULT NULL,
  `vpastdue` varchar(250) DEFAULT NULL,
  `vpayment_status` text DEFAULT NULL,
  `vcomments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_dispute_reasons`
--

CREATE TABLE `crd_dispute_reasons` (
  `idisputereason_id` int(10) NOT NULL,
  `vdispute_reason` varchar(255) NOT NULL COMMENT 'Get values from Hitesh from the software',
  `iflag` int(1) NOT NULL DEFAULT 0 COMMENT 'flag for the delete'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_dispute_reasons`
--

INSERT INTO `crd_dispute_reasons` (`idisputereason_id`, `vdispute_reason`, `iflag`) VALUES
(1, 'Sample Reason', 0),
(2, 'The following personal information is incorrect', 0),
(3, 'The following account is not mine', 0),
(4, 'The status is incorrect for the following account', 0),
(5, 'The following information is outdated. I would like it removed from my credit history report', 0),
(6, 'The following inquiry is more than two years old and I would like it removed', 0),
(7, 'The inquiry was not authorized', 0),
(8, 'The following accounts were closed by me and should state that', 0),
(9, 'The following account was a Bankruptcy/Charge-off. Balance should be $0', 0),
(10, 'Mistaken Identity', 0),
(11, 'Identity Theft', 0),
(12, 'Other information I would like changed', 0),
(13, 'This is a duplicate account', 0),
(14, 'The wrong amount is being reported', 0),
(15, 'This is the wrong creditor for this item', 0),
(16, 'Validate Account', 0),
(17, '-', 0);

-- --------------------------------------------------------

--
-- Table structure for table `crd_dispute_statustypes`
--

CREATE TABLE `crd_dispute_statustypes` (
  `idisputestatus_id` int(10) NOT NULL,
  `vdispute_status` varchar(50) NOT NULL COMMENT 'Values.. Deleted, Pending, Updated, Verified, Disputed',
  `css_class` varchar(5) NOT NULL,
  `iOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_dispute_statustypes`
--

INSERT INTO `crd_dispute_statustypes` (`idisputestatus_id`, `vdispute_status`, `css_class`, `iOrder`) VALUES
(1, 'Positive', '1', 1),
(2, 'Negative', '6', 6),
(3, 'Repaired', '1', 3),
(4, 'Deleted', '1', 2),
(5, 'In Dispute', '4', 4),
(6, 'Verified', '6', 5),
(7, 'Updated', '1', 7),
(8, 'Unspecified', '8', 0);

-- --------------------------------------------------------

--
-- Table structure for table `crd_email_setting`
--

CREATE TABLE `crd_email_setting` (
  `id` int(11) NOT NULL,
  `option_key` varchar(50) DEFAULT NULL,
  `option_value` varchar(50) DEFAULT NULL,
  `option_value_for_non_mandrill` enum('yes','no') NOT NULL DEFAULT 'yes',
  `template_id` int(11) DEFAULT NULL,
  `template_id_for_non_mandrill` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_email_setting`
--

INSERT INTO `crd_email_setting` (`id`, `option_key`, `option_value`, `option_value_for_non_mandrill`, `template_id`, `template_id_for_non_mandrill`) VALUES
(1, 'client_login', 'yes', 'yes', 1, 1),
(2, 'client_message', 'yes', 'yes', 2, 2),
(3, 'dispute_item_created', 'yes', 'no', 3, 3),
(4, 'credit_report_imported', 'yes', 'yes', 4, 4),
(5, 'save_letter', 'yes', 'yes', 5, 5),
(6, 'credit_updated', 'yes', 'no', 6, 6),
(7, 'new_invoice', 'yes', 'no', 7, 7),
(8, 'affiliate_login', 'yes', 'yes', 8, 8),
(9, 'affiliate_message', 'yes', 'yes', 9, 9),
(10, 'client_change_password', 'yes', 'yes', 10, 10),
(11, 'client_forgot_password', 'yes', 'yes', 11, 11),
(12, 'affiliate_change_password', 'yes', 'yes', 12, 12),
(13, 'affiliate_forgot_password', 'yes', 'yes', 13, 13),
(14, 'client_message_from_affiliate', 'yes', 'yes', 14, 14),
(15, 'affiliate_message_from_client', 'yes', 'yes', 15, 15),
(16, 'client_choice_notification_sent', 'yes', 'yes', 16, 16),
(17, 'client_choice_complete', 'yes', 'yes', 17, 17),
(18, 'email_audit_to_client', 'yes', 'yes', 18, 18);

-- --------------------------------------------------------

--
-- Table structure for table `crd_email_template`
--

CREATE TABLE `crd_email_template` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `body` text NOT NULL,
  `added_by` enum('system','user') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_email_template`
--

INSERT INTO `crd_email_template` (`id`, `name`, `subject`, `body`, `added_by`) VALUES
(1, 'Client login info (default)', '{company_name} Welcome Letter', '<table style=\\\"width: 100%;\\\" bgcolor=\\\"#F2F2F2\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\">\n<tbody>\n<tr>\n<td align=\\\"center\\\" valign=\\\"top\\\"><br />\n<table style=\\\"width: 600px;\\\" align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\">\n<tbody>\n<tr>\n<td style=\\\"background: #fff; border: #f2f2f2 solid 1px; border-top: 0px; padding: 20px; font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060; line-height: 22px;\\\" align=\\\"left\\\" valign=\\\"top\\\">\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 18px; color: #606060;\\\"><b>Dear {client_first_name},</b></p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; ; color: #606060;\\\">Welcome to {company_name}. To access your account, please log into our secure portal and enter your membership credentials:</p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">{login_info}</p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">From there, you can access your account, review activity, exchange documents securely and monitor your overall progress.</p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">We&rsquo;re very excited that you&rsquo;ve chosen {company_name} and look forward to working with you.</p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">Sincerely,<br /><br /> Secure Client Access</p>\n</td>\n</tr>\n</tbody>\n</table>\n&nbsp;</td>\n</tr>\n</tbody>\n</table>', 'system'),
(2, 'Message to client (default)', 'You\'ve got a message from {company_name}', '<table style=\\\"width: 100%;\\\" bgcolor=\\\"#F2F2F2\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td align=\\\"center\\\" valign=\\\"top\\\"><br />\r\n<table style=\\\"width: 600px;\\\" align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td style=\\\"background: #fff; border: #f2f2f2 solid 1px; border-top: 0px; padding: 20px; font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060; line-height: 22px;\\\" align=\\\"left\\\" valign=\\\"top\\\">\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 18px; color: #606060;\\\"><b>Dear {client_first_name},</b></p>\r\n<p>{company_name} has sent you a message. Please log into our secure portal to read the message:</p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\"><a href=\\\"http://www.secureclientaccess.com\\\" style=\\\"color: #0099ff;\\\">www.secureclientaccess.com</a></p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">*This is an automated notification from {company_name} at {company_phone}.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'system'),
(3, 'Dispute item created (default)', 'Credit Account Update', '<table style=\\\"width: 100%;\\\" bgcolor=\\\"#F2F2F2\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td align=\\\"center\\\" valign=\\\"top\\\"><br />\r\n<table style=\\\"width: 600px;\\\" align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td style=\\\"background: #fff; border: #f2f2f2 solid 1px; border-top: 0px; padding: 20px; font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060; line-height: 22px;\\\" align=\\\"left\\\" valign=\\\"top\\\">\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 18px; color: #606060;\\\"><b>Dear {client_first_name},</b></p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">Just an update to let you know that we&rsquo;ve added the following items:</p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">{dispute_item}</p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">Please check your <a href=\\\"https://secureclientaccess.com\\\" style=\\\"color: #0099ff;\\\">SecureClientAccess.com</a> account periodically for a complete view of updated information. In the event you receive any correspondence from the Credit Bureaus, or one of your creditors, please provide copies to us right away so we can update our records.</p>\r\n<p>If you have any questions, feel free to contact us at {company_phone}, between the hours of 9 am to 5 pm. For your convenience, you can also email a member of our team at <a href=\\\"mailto:{company_email}\\\" style=\\\"color: #0099ff;\\\">{company_email}</a>. We will respond within 1 business day.</p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">Sincerely,<br /><br /> Your Team at {company_name}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'system'),
(4, 'Credit report imported (default)', 'Credit Account Update', '<table style=\\\"width: 100%;\\\" bgcolor=\\\"#F2F2F2\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td align=\\\"center\\\" valign=\\\"top\\\"><br />\r\n<table style=\\\"width: 600px;\\\" align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td style=\\\"background: #fff; border: #f2f2f2 solid 1px; border-top: 0px; padding: 20px; font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060; line-height: 22px;\\\" align=\\\"left\\\" valign=\\\"top\\\">\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 18px; color: #606060;\\\"><b>Dear {client_first_name},</b></p>\r\n<p>Your credit report has been imported into the system, please login and check your dispute details.</p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\"><a href=\\\"http://www.secureclientaccess.com\\\" style=\\\"color: #0099ff;\\\">www.secureclientaccess.com</a></p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">Check your SecureClientAccess.com account periodically for a complete view of updated information. In the event you receive any correspondence from the credit bureaus or one of your creditors, please forward copies to us right away so we can update our records.</p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">If you have any questions, feel free to contact us at {company_phone}, between the hours of 9 am to 5 pm. For your convenience, you can also email a member of our team at <a href=\\\"mailto:{company_email}\\\" style=\\\"color: #0099ff;\\\">{company_email}</a>. We will respond within 1 business day.</p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">Sincerely,<br /><br /> Your Team at {company_name}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'system'),
(5, 'Challenges sent (default)', 'Challenges sent on your Behalf', '<table style=\\\"width: 100%;\\\" bgcolor=\\\"#F2F2F2\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td align=\\\"center\\\" valign=\\\"top\\\"><br />\r\n<table style=\\\"width: 600px;\\\" align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td style=\\\"background: #fff; border: #f2f2f2 solid 1px; border-top: 0px; padding: 20px; font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060; line-height: 22px;\\\" align=\\\"left\\\" valign=\\\"top\\\">\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 18px; color: #606060;\\\"><b>Dear {client_first_name},</b></p>\r\n<p>With the help of The Federal Trade Commission enforcing The Fair Credit Reporting Act (FCRA), which promotes the accuracy of information in the files of the nation&rsquo;s credit reporting agencies, we have the power to challenge every questionable negative item on your behalf.</p>\r\n<p>At your direction, here are the items we challenged on {todays_date}:</p>\r\n<p>{dispute_item}</p>\r\n<p>Responses typically take up to 60 days. Check your <a href=\\\"https://secureclientaccess.com\\\" style=\\\"color: #0099ff;\\\">SecureClientAccess.com</a> account periodically for a complete view of updated information. In the event you receive any correspondence from the credit bureaus or one of your creditors, please forward copies to us right away so we can update our records.</p>\r\n<p>If you have any questions, feel free to contact us at {company_phone}, between the hours of 9 am to 5 pm. For your convenience, you can also email a member of our team at <a href=\\\"mailto:{company_email}\\\" style=\\\"color: #0099ff;\\\">{company_email}</a>. We will respond within 1 business day.</p>\r\n<p>Sincerely,<br /> <br />Your Team at {company_name}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'system'),
(6, 'Updated credit report received (default)', 'Updated Credit Report Received', '<table style=\\\"width: 100%;\\\" bgcolor=\\\"#F2F2F2\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td align=\\\"center\\\" valign=\\\"top\\\"><br />\r\n<table style=\\\"width: 600px;\\\" align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td style=\\\"background: #fff; border: #f2f2f2 solid 1px; border-top: 0px; padding: 20px; font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060; line-height: 22px;\\\" align=\\\"left\\\" valign=\\\"top\\\">\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 18px; color: #606060;\\\"><b>Dear {client_first_name},</b></p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">Just an update to let you know that we&rsquo;ve received your updated credit report information and the status has changed on the following items:</p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">{dispute_item}</p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">Please check your <a href=\\\"https://secureclientaccess.com\\\" style=\\\"color: #0099ff;\\\">SecureClientAccess.com</a> account periodically for a complete view of updated information. In the event you receive any correspondence from the Credit Bureaus, or one of your creditors, please provide copies to us right away so we can update our records.</p>\r\n<p>If you have any questions, feel free to contact us at {company_phone}, between the hours of 9 am to 5 pm. For your convenience, you can also email a member of our team at <a href=\\\"mailto:{company_email}\\\" style=\\\"color: #0099ff;\\\">{company_email}</a>. We will respond within 1 business day.</p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">Sincerely,<br /><br /> Your Team at {company_name}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'system'),
(7, 'New invoice (default)', '{company_name} Invoice #{invoice_number}', '<table style=\\\"width: 100%;\\\" bgcolor=\\\"#F2F2F2\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td align=\\\"center\\\" valign=\\\"top\\\"><br />\r\n<table style=\\\"width: 600px;\\\" align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td style=\\\"background: #fff; border: #f2f2f2 solid 1px; border-top: 0px; padding: 20px; font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060; line-height: 22px;\\\" align=\\\"left\\\" valign=\\\"top\\\">\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 18px; color: #606060;\\\"><b>Dear {client_first_name},</b></p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">Thank you for your business. We have attached this month&rsquo;s invoice generated on {invoice_date} and due on {invoice_due_date}.</p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">Invoice: #{invoice_number}<br /> Balance Due: {invoice_total_amount} USD<br /> Due Date: {invoice_due_date} .</p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">Please check your <a href=\\\"https://secureclientaccess.com\\\" style=\\\"color: #0099ff;\\\">SecureClientAccess.com</a> account periodically for a complete view of updated information. In the event you receive any correspondence from the Credit Bureaus, or one of your creditors, please provide copies to us right away so we can update our records.</p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">If you have any questions, feel free to contact us at {company_phone}, between the hours of 9 am to 5 pm. For your convenience, you can also email a member of our team at <a href=\\\"mailto:{company_email}\\\" style=\\\"color: #0099ff;\\\">{company_email}</a>. We will respond within 1 business day.</p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">Sincerely,<br /><br /> Your Team at {company_name}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'system'),
(8, 'Affiliate login info (default)', '{company_name} Welcome Letter ', '<table style=\\\"width: 100%;\\\" bgcolor=\\\"#F2F2F2\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\">\n<tbody>\n<tr>\n<td align=\\\"center\\\" valign=\\\"top\\\"><br />\n<table style=\\\"width: 600px;\\\" align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\">\n<tbody>\n<tr>\n<td style=\\\"background: #fff; border: #f2f2f2 solid 1px; border-top: 0px; padding: 20px; font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060; line-height: 22px;\\\" align=\\\"left\\\" valign=\\\"top\\\">\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 18px; color: #606060;\\\"><b>Dear {affiliate_first_name},</b></p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; ; color: #606060;\\\">Welcome to {company_name}. To access your account, please log into our secure portal and enter your membership credentials:</p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">{login_info}</p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">From there, you can access your account, review activity, exchange documents securely and monitor your overall progress.</p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">We&rsquo;re very excited that you&rsquo;ve chosen {company_name} and look forward to working with you.</p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">Sincerely,<br /><br /> Secure Client Access</p>\n</td>\n</tr>\n</tbody>\n</table>\n&nbsp;</td>\n</tr>\n</tbody>\n</table>', 'system'),
(9, 'Message to affiliate (default)', 'You\'ve got a message from {company_name} ', '<table style=\\\"width: 100%;\\\" bgcolor=\\\"#F2F2F2\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td align=\\\"center\\\" valign=\\\"top\\\"><br />\r\n<table style=\\\"width: 600px;\\\" align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td style=\\\"background: #fff; border: #f2f2f2 solid 1px; border-top: 0px; padding: 20px; font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060; line-height: 22px;\\\" align=\\\"left\\\" valign=\\\"top\\\">\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 18px; color: #606060;\\\"><b>Dear {affiliate_first_name},</b></p>\r\n<p>{company_name} has sent you a message. Please log into our secure portal to read the message:</p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\"><a href=\\\"http://www.secureclientaccess.com\\\" style=\\\"color: #0099ff;\\\">www.secureclientaccess.com</a></p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">*This is an automated notification from {company_name} at {company_phone}.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'system'),
(10, 'Client change password (default) ', 'Login Credentials for Secure Client Accesss', '<table style=\\\"width: 100%;\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" bgcolor=\\\"#F2F2F2\\\" border=\\\"0\\\">\n<tbody>\n<tr>\n<td align=\\\"center\\\" valign=\\\"top\\\"><br />\n<table style=\\\"width: 600px;\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" align=\\\"center\\\" border=\\\"0\\\">\n<tbody>\n<tr>\n<td style=\\\"background: #fff; border: #f2f2f2 solid 1px; border-top: 0px; padding: 20px; font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060; line-height: 22px;\\\" align=\\\"left\\\" valign=\\\"top\\\">\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 18px; color: #606060;\\\"><b>Dear {client_first_name},</b></p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; ; color: #606060;\\\">You have changed the password for Secure Client Access. If you did not make this change then we suggest that you please change your password to something strong immediately for security of your data.</p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; ; color: #606060;\\\">To access your account, please log into our secure portal and enter your membership credentials:</p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">{login_info}</p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">Sincerely,<br /><br /> Secure Client Access</p>\n</td>\n</tr>\n</tbody>\n</table>\n&nbsp;</td>\n</tr>\n</tbody>\n</table>', 'system'),
(11, 'Client forgot password (default) ', 'Login Credentials for Secure Client Accesss', '<table style=\\\"width: 100%;\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" bgcolor=\\\"#F2F2F2\\\" border=\\\"0\\\">\n<tbody>\n<tr>\n<td align=\\\"center\\\" valign=\\\"top\\\"><br />\n<table style=\\\"width: 600px;\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" align=\\\"center\\\" border=\\\"0\\\">\n<tbody>\n<tr>\n<td style=\\\"background: #fff; border: #f2f2f2 solid 1px; border-top: 0px; padding: 20px; font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060; line-height: 22px;\\\" align=\\\"left\\\" valign=\\\"top\\\">\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 18px; color: #606060;\\\"><b>Dear {client_first_name},</b></p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; ; color: #606060;\\\">To access your account, please log into our secure portal and enter your membership credentials:</p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">{login_info}</p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">Sincerely,<br /><br /> Secure Client Access</p>\n</td>\n</tr>\n</tbody>\n</table>\n&nbsp;</td>\n</tr>\n</tbody>\n</table>', 'system'),
(12, 'Affiliate change password (default)', 'Login Credentials for Secure Client Accesss ', '<table style=\\\"width: 100%;\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" bgcolor=\\\"#F2F2F2\\\" border=\\\"0\\\">\n<tbody>\n<tr>\n<td align=\\\"center\\\" valign=\\\"top\\\"><br />\n<table style=\\\"width: 600px;\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" align=\\\"center\\\" border=\\\"0\\\">\n<tbody>\n<tr>\n<td style=\\\"background: #fff; border: #f2f2f2 solid 1px; border-top: 0px; padding: 20px; font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060; line-height: 22px;\\\" align=\\\"left\\\" valign=\\\"top\\\">\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 18px; color: #606060;\\\"><b>Dear {affiliate_first_name},</b></p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; ; color: #606060;\\\">You have changed the password for Secure Client Access. If you did not make this change then we suggest that you please change your password to something strong immediately for security of your data.</p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; ; color: #606060;\\\">To access your account, please log into our secure portal and enter your membership credentials:</p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">{login_info}</p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">Sincerely,<br /><br /> Secure Client Access</p>\n</td>\n</tr>\n</tbody>\n</table>\n&nbsp;</td>\n</tr>\n</tbody>\n</table>', 'system'),
(13, 'Affiliate forgot password (default)', 'Login Credentials for Secure Client Accesss', '<table style=\\\"width: 100%;\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" bgcolor=\\\"#F2F2F2\\\" border=\\\"0\\\">\n<tbody>\n<tr>\n<td align=\\\"center\\\" valign=\\\"top\\\"><br />\n<table style=\\\"width: 600px;\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" align=\\\"center\\\" border=\\\"0\\\">\n<tbody>\n<tr>\n<td style=\\\"background: #fff; border: #f2f2f2 solid 1px; border-top: 0px; padding: 20px; font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060; line-height: 22px;\\\" align=\\\"left\\\" valign=\\\"top\\\">\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 18px; color: #606060;\\\"><b>Dear {affiliate_first_name},</b></p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; ; color: #606060;\\\">To access your account, please log into our secure portal and enter your membership credentials:</p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">{login_info}</p>\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">Sincerely,<br /><br /> Secure Client Access</p>\n</td>\n</tr>\n</tbody>\n</table>\n&nbsp;</td>\n</tr>\n</tbody>\n</table>', 'system'),
(14, 'Message to client from affiliate (default)', 'You\'ve got a message from {company_name}', '<table style=\\\"width: 100%;\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" bgcolor=\\\"#F2F2F2\\\" border=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td align=\\\"center\\\" valign=\\\"top\\\"><br />\r\n<table style=\\\"width: 600px;\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" align=\\\"center\\\" border=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td style=\\\"background: #fff; border: #f2f2f2 solid 1px; border-top: 0px; padding: 20px; font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060; line-height: 22px;\\\" align=\\\"left\\\" valign=\\\"top\\\">\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 18px; color: #606060;\\\"><b>Dear {client_first_name},</b></p>\r\n<p>{affiliate_first_name} {affiliate_last_name} has sent you a message. Please log into our secure portal to read the message:</p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\"><a style=\\\"color: #0099ff;\\\" href=\\\"http://www.secureclientaccess.com\\\">www.secureclientaccess.com</a></p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">*This is an automated notification from {company_name} on behalf of {affiliate_first_name}.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'system'),
(15, 'Message to affiliate from client (default) ', 'You\'ve got a message from {company_name}', '<table style=\\\"width: 100%;\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" bgcolor=\\\"#F2F2F2\\\" border=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td align=\\\"center\\\" valign=\\\"top\\\"><br />\r\n<table style=\\\"width: 600px;\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" align=\\\"center\\\" border=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td style=\\\"background: #fff; border: #f2f2f2 solid 1px; border-top: 0px; padding: 20px; font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060; line-height: 22px;\\\" align=\\\"left\\\" valign=\\\"top\\\">\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 18px; color: #606060;\\\"><b>Dear {affiliate_first_name},</b></p>\r\n<p>Your client, {client_first_name} has sent you a message. Please log into our secure portal to read the message:</p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\"><a style=\\\"color: #0099ff;\\\" href=\\\"http://www.secureclientaccess.com\\\">www.secureclientaccess.com</a></p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">*This is an automated notification from {company_name} on behalf of {client_first_name}.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'system'),
(16, 'Client choice notification (default)', 'Credit account updated choose items to dispute', '<table style=\\\"width: 100%;\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" bgcolor=\\\"#F2F2F2\\\" border=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td align=\\\"center\\\" valign=\\\"top\\\"><br />\r\n<table style=\\\"width: 600px;\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" align=\\\"center\\\" border=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td style=\\\"background: #fff; border: #f2f2f2 solid 1px; border-top: 0px; padding: 20px; font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060; line-height: 22px;\\\" align=\\\"left\\\" valign=\\\"top\\\">\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 18px; color: #606060;\\\"><b>Dear {client_first_name},</b></p>\r\n<p>Your credit report has been imported into the system.<br /><br /> Please login to your account at <a style=\\\"color: #0099ff;\\\" href=\\\"http://www.secureclientaccess.com\\\">www.secureclientaccess.com</a> and set your preferences in the \\\"Client\\\'s Choice\\\" section.</p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">This step is mandatory and must be completed by you before we can begin the dispute process. It should take you 2-3 minutes.</p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">If you have any questions, feel free to contact us at {company_phone}, between the hours of 9 am to 5 pm. For your convenience, you can also email a member of our team at <a style=\\\"color: #0099ff;\\\" href=\\\"mailto:{company_email}\\\">{company_email}</a>. We will respond within 1 business day.</p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">Sincerely,<br /><br /> Your Team at {company_name}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'system'),
(17, 'Client choice completed (default)', 'You have completed Client\'s Choice', '<table style=\\\"width: 100%;\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" bgcolor=\\\"#F2F2F2\\\" border=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td align=\\\"center\\\" valign=\\\"top\\\"><br />\r\n<table style=\\\"width: 600px;\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" align=\\\"center\\\" border=\\\"0\\\">\r\n<tbody>\r\n<tr>\r\n<td style=\\\"background: #fff; border: #f2f2f2 solid 1px; border-top: 0px; padding: 20px; font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060; line-height: 22px;\\\" align=\\\"left\\\" valign=\\\"top\\\">\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 18px; color: #606060;\\\"><b>Dear {client_first_name},</b></p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">You have successfully completed the steps for \\\"Client\\\'s Choice.\\\" We will now begin the dispute process. You will receive updates like this throughout the process.</p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">Please check your <a style=\\\"color: #0099ff;\\\" href=\\\"https://secureclientaccess.com\\\">SecureClientAccess.com</a> account periodically for a complete view of updated information. In the event you receive any correspondence from the Credit Bureaus, or one of your creditors, please provide copies to us right away so we can update our records.</p>\r\n<p>If you have any questions, feel free to contact us at {company_phone}, between the hours of 9 am to 5 pm. For your convenience, you can also email a member of our team at <a style=\\\"color: #0099ff;\\\" href=\\\"mailto:{company_email}\\\">{company_email}</a>. We will respond within 1 business day.</p>\r\n<p style=\\\"font-family: Helvetica, Arial, sans-serif; font-size: 15px; color: #606060;\\\">Sincerely,<br /><br /> Your Team at {company_name}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'system'),
(18, 'Email Audit to Client', 'Your Credit Audit Report', '<div><strong><br />Dear {client_first_name},</strong></div>\r\n<div>&nbsp;</div>\r\n<div>I\\\'m attaching a copy of your Credit Audit Report.</div>\r\n<div>&nbsp;</div>\r\n<div>This Credit Audit Report provides an analysis of your credit as potential lenders see it today. it shows all the items that are negatively affecting your score and explains how we use the power of the law to improve your credit. It also includes a simple step-by-step plan for you to speed up the process.</div>\r\n<div>&nbsp;</div>\r\n<div>We\\\'ve found that by sharing and discussing this credit audit with you, we can accelerate up the time it will take to get your credit back on track.</div>\r\n<div>&nbsp;</div>\r\n<div>Feel free to contact us at {company_phone}. For your convenience, you can also email a member of our team at&nbsp;<a class=\\\"textEditor-link\\\" href=\\\"mailto:%7Bcompany_email%7D\\\" rel=\\\"noreferrer nofollow\\\" target=\\\"_blank\\\" data-is-link=\\\"mailto:%7Bcompany_email%7D\\\">{company_email}</a>.</div>\r\n<div>&nbsp;</div>\r\n<div>Sincerely,</div>\r\n<div>&nbsp;</div>\r\n<div>Your Team at {company_name}</div>', 'system');

-- --------------------------------------------------------

--
-- Table structure for table `crd_furnishers`
--

CREATE TABLE `crd_furnishers` (
  `ifurnisher_id` int(10) NOT NULL,
  `vfurnisher_name` varchar(255) NOT NULL,
  `vcompany_name` varchar(50) NOT NULL,
  `vaddress_1` varchar(250) DEFAULT NULL,
  `vcity` varchar(50) DEFAULT NULL,
  `vstate` varchar(50) DEFAULT NULL,
  `vzip` varchar(10) DEFAULT NULL,
  `vphone_number` varchar(50) DEFAULT NULL,
  `vextension` varchar(50) DEFAULT NULL,
  `vaccount_card_type` varchar(50) DEFAULT NULL,
  `vnote` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_furnishers`
--

INSERT INTO `crd_furnishers` (`ifurnisher_id`, `vfurnisher_name`, `vcompany_name`, `vaddress_1`, `vcity`, `vstate`, `vzip`, `vphone_number`, `vextension`, `vaccount_card_type`, `vnote`) VALUES
(1, 'Sample Creditor/Furnisher', 'Sample Creditor/Furnisher', '', '', '', '', '', '', '', ''),
(2, 'American Express', 'American Express', 'P.O. Box 297804\r\n', 'Ft. Lauderdale', 'FL', '33329-7804', '(800) 528-4800', '', 'Credit Card', ''),
(3, 'Bank of America Mortgage', 'Bank of America Mortgage', '4161 Piedmont Parkway', 'Greensboro', 'NC', '27410 ', '(800) 669-6607', '', 'Mortgage', ''),
(4, 'Capitol One Bank USA', 'Capitol One Bank USA', 'P.O. Box 30279', 'P.O. Box 30279', 'UT ', '84130-0285', '(800) 955-7070', '', 'Credit Card', ''),
(5, 'CITI Cards', 'CITI Cards', 'Attn: Disputes P.O. Box 6013 \r\n', 'Sioux Falls', 'SD ', '57117', '(866) 775-0557', '', 'Credit Card', ''),
(6, 'Sample Creditor/Furnisher', 'Sample Creditor/Furnisher', '1234 Main Street\r\n', 'Santa Monica', 'CA ', '90401', '(800) 555-1212', '', 'Credit Card', ''),
(7, 'Sears Card', 'Sears Card', 'Billing Disputes Dept. P.O. Box 6283', 'Sioux Falls', 'SD', '57117', '(800) 917-7700', '', ' Credit Card', ''),
(8, 'Wells Fargo Card Services', 'Wells Fargo Card Services', 'P.O. Box 522', 'Des Moines', ' IA', '50306-0522', '(800) 390-0533', '', 'Credit Card', '');

-- --------------------------------------------------------

--
-- Table structure for table `crd_guided_tour`
--

CREATE TABLE `crd_guided_tour` (
  `itour_id` int(11) NOT NULL,
  `iuser_id` int(11) NOT NULL,
  `vpage` varchar(50) NOT NULL,
  `eflag` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 = on, 1 = off '
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_instruction`
--

CREATE TABLE `crd_instruction` (
  `iinstruction_id` int(11) NOT NULL,
  `texplanation` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_instruction`
--

INSERT INTO `crd_instruction` (`iinstruction_id`, `texplanation`) VALUES
(1, 'Please correct/update this inaccurate information on my credit report.'),
(2, 'Please remove this inaccurate information from my credit report.'),
(3, 'Please remove it from my credit report.'),
(4, 'This is not mine. I am a victim of ID Theft and I have included a police report. Please investigate and remove from my credit report.'),
(5, 'Please supply information on how you have verified this item.'),
(6, 'This is not mine.'),
(7, 'My parent has the same name as me.'),
(8, 'Please investigate and delete from my credit report.'),
(9, 'Please ensure that all information is accurate');

-- --------------------------------------------------------

--
-- Table structure for table `crd_invoiceitem_master`
--

CREATE TABLE `crd_invoiceitem_master` (
  `iInvoiceItemId` int(11) NOT NULL,
  `vDescription` varchar(255) NOT NULL,
  `vPrice` varchar(50) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_letters_dispute_relation`
--

CREATE TABLE `crd_letters_dispute_relation` (
  `iletter_dispute_id` int(10) NOT NULL,
  `idispute_id` int(10) NOT NULL COMMENT 'F_Key crd_disputeitems { idispute_id}',
  `iletter_id` int(10) NOT NULL COMMENT 'F_Key crd_clientletters {iletter_id}',
  `iclient_id` int(10) NOT NULL COMMENT 'F_Key crd_clients  {iclient_id}'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_letter_templ`
--


CREATE TABLE `crd_letter_templ` (
  `itempl_id` int(10) NOT NULL,
  `itempl_catgid` int(10) NOT NULL COMMENT 'F_Key crd_letter_templcatg {itempl_catgid}',
  `vtempl_title` varchar(500) NOT NULL,
  `vtempt_text` text NOT NULL COMMENT 'Text/long text, save HTML',
  `efavorite` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 = Not Favorite, 1 = Favorite',
  `dtempl_createdon` datetime NOT NULL,
  `estatus` enum('0','1') NOT NULL DEFAULT '1' COMMENT '1 = active',
  `iOrder` int(11) NOT NULL,
  `vadded_by` enum('system','user') NOT NULL DEFAULT 'user' COMMENT 'define from where letter is generated by system or by user',
  `letter_description` varchar(1024) NOT NULL COMMENT 'defines the description of the letter',
  `documents_needed` text COMMENT 'displays the documents after the letter is choosen from the options in letterfinder',
  `recipient` varchar(255) NOT NULL COMMENT 'defines the category to which the letter belongs'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE `crd_letter_templ` AUTO_INCREMENT=5003;

--
-- Dumping data for table `crd_letter_templ`
--

INSERT INTO `crd_letter_templ` (`itempl_id`, `itempl_catgid`, `vtempl_title`, `vtempt_text`, `efavorite`, `dtempl_createdon`, `estatus`, `iOrder`, `vadded_by`,`letter_description`,`documents_needed`,`recipient`) VALUES
(1, 1, 'Request Annual Credit Report', '<p>{client_first_name}{client_last_name}<br />{client_address}</p>\n<p>Annual Credit Report Request Service<br />P.O. Box 105281<br />Atlanta, GA 30348-5281</p>\n<p>{curr_date}</p>\n<p>Re: Request for Complimentary Annual Credit Reports</p>\n<p>To Whom It May Concern, </p>\n<p>I am writing to request my complimentary annual credit report from: Experian,</p>\n<p>Full Name: {client_first_name} {client_last_name}<br />{bdate}<br />{ss_number}<br />Address: {client_address}<br />{t_no}</p>\n<p>Enclosed are copies of documents identifying me by my name and address.</p>\n<p>Thank you for your time and help in this matter.</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />______________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 11:31:00', '1', 9, 'system','You are entitled to a free copy of your credit report each year. You may send this letter to each of the credit bureaus you wish to receive a free report from.','Photo ID, Proof of Address','Credit Bureau'),
(2, 1, 'Default Round 1 (Dispute Credit Report Items)', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />\r\n{bdate}<br />{ss_number}</p>\r\n<p>{bureau_address}</p>\r\n<p>{curr_date}</p>\r\n<p>Re: Letter to Remove Inaccurate Credit Information</p>\r\n<p>To Whom It May Concern:</p>\r\n<p>I received a copy of my credit report and found the following item(s) to be in error:</p>\r\n\r\n<p>{dispute_item_and_explanation}</p>\r\n<p>By the provisions of the Fair Credit Reporting Act, I \r\n\r\ndemand that these items be investigated and removed from my report. It is my understanding that you will recheck these items with the creditor who has posted \r\n\r\nthem. Please remove any information that the creditor cannot verify. I understand that under 15 U.S.C. Sec. 1681i(a), you must complete this reinvestigation \r\n\r\nwithin 30 days of receipt of this letter.</p>\r\n<p>Please send an updated copy of my credit report to the above address. According to the act, there shall \r\n\r\nbe no charge for this updated report. I also request that you please send notices of corrections to anyone who received my credit report in the past six \r\n\r\nmonths.</p>\r\n<p>Thank you for your time and help in this matter.</p>\r\n<p>Sincerely,</p>\r\n<p>{client_signature}<br />_____________________________________<br />\r\n{client_first_name} {client_last_name}</p>', '0', '2013-01-07 11:32:42', '1', 10, 'system','Round 1 is typically the first letter you send to the bureaus and can be used to request verification, the bureaus will contact the furnishers to verify or remove unverifiable items from credit report.','Photo ID, Proof of Address ','Default'),
(3, 2, 'Dispute Credit Report Items (Round 1 Alternate)', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{client_previous_address}<br />{t_no}<br />{bdate}<br />{ss_number}</p>\n<p>{bureau_address}</p>\n<p>{curr_date}</p>\n<p>Re: Letter to Remove Inaccurate Credit Information</p>\n<p>To Whom It May Concern:</p>\n<p>I received a copy of my credit report and found the following item(s) to be errors. See the attached copy of my credit report; the errors have been highlighted. Here as follows are items in error:</p>\n<p>{dispute_item_and_explanation}</p>\n<p>By the provisions of the Fair Credit Reporting Act, I demand that these items be investigated and removed from my report. It is my understanding that you will recheck these items with the creditor who has posted them. Please remove any information that the creditor cannot verify. I understand that under 15 U.S.C. Sec. 1681i(a), you must complete this reinvestigation within 30 days of receipt of this letter.</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />______________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 11:34:39', '1', 61, 'system','Round 1 is typically the first letter you send to the bureaus and can be used to request verification, the bureaus will contact the furnishers to verify or remove unverifiable items from credit report.','Photo ID, Proof of Address','Credit Bureau '),
(4, 2, 'Dispute Credit Report Items (Round 1 Alternate 2)', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{t_no}<br />{bdate}<br />{ss_number}</p>\n<p>{bureau_address}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>This letter is a formal complaint that you are reporting inaccurate and incomplete credit information on my Credit Report.</p>\n<p>I understand that mistakes happen but your inaccurate information could cost me in higher interest rates and I have enough expenses as it is. Please investigate the following information and either remove it or at least send me the information that you used to add it to my report.</p>\n<p>{dispute_item_and_explanation}</p>\n<p>Thank You</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 11:36:27', '1', 62, 'system','Round 1 is typically the first letter you send to the bureaus and can be used to request verification, the bureaus will contact the furnishers to verify or remove unverifiable items from credit report.','Photo ID, Proof of Address ','Credit Bureau '),
(5, 2, 'Dispute Credit Report Items (Round 1 Alternate 3)', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{t_no}<br />{bdate}<br />{ss_number}</p>\n<p>{bureau_address}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>This letter is a formal complaint that you are reporting inaccurate and incomplete credit information. I am distressed that you have included the information below in my credit profile and that you have failed to maintain reasonable procedures in your operations to assure maximum possible accuracy in the credit reports you publish. Credit reporting laws ensure that bureaus report only 100% accurate credit information. Every step must be taken to assure the information reported is completely accurate and correct. The following information therefore needs to be re-investigated.</p>\n<p>{dispute_item_and_explanation}</p>\n<p>I respectfully request to be provided proof of this alleged item, specifically the contract, note or other instrument bearing my signature.</p>\n<p>Failing that, the item must be deleted from the report as soon as possible. This information is entirely inaccurate and incomplete, and as such represents a very serious error in your reporting. Please delete this misleading information and supply a corrected credit profile to all creditors who have received a copy within the last six months, or the last two years for employment purposes.</p>\n<p>Additionally, please provide the name, address, and telephone number of each credit grantor or other subscriber.</p>\n<p>Under federal law, you have thirty (30) days to complete your re-investigation. Be advised that the description of the procedure used to determine the accuracy and completeness of the information is hereby requested as well, to be provided within fifteen (15) days of the completion of your re-investigation.</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 11:37:08', '1', 63, 'system','Round 1 is typically the first letter you send to the bureaus and can be used to request verification, the bureaus will contact the furnishers to verify or remove unverifiable items from credit report.','Photo ID, Proof of Address ','Credit Bureau '),
(6, 2, 'Request Removal after Bureau Investigation', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{bdate}<br />{ss_number}<br />Credit Report Number:</p>\n<p>{bureau_address}</p>\n<p>{curr_date}</p>\n<p>Re: Removal of Incorrect Items from Credit Report (More than 30 days have passed)</p>\n<p>To Whom It May Concern:</p>\n<p>On (DATE), I sent you a request to reinvestigate incorrect items which were listed in my credit history report.</p>\n<p>{dispute_item_and_explanation}</p>\n<p>I am enclosing a photocopy of that original request. The Fair Credit Reporting Act requires that you complete your reinvestigation of my request within 30 days. It has now been more than 30 days.</p>\n<p>I will assume that I have not received your reply because you have been unable to verify this information. Please remove this incorrect information at once and send me an updated copy of my credit history report. I also request that you please send notices of corrections to anyone who received my credit report in the past six months.</p>\n<p>Thank you time and help in this matter. I have also sent a copy of this letter to the Federal Trade Commission.</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />______________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 11:37:54', '1', 64, 'system','Follow up demand to credit bureau to remove information after no response.','Previous Dispute Letter, Photo ID, Proof of Address','Credit Bureau '),
(7, 2, 'Request Removal after Creditor Verification', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{client_previous_address}<br />{t_no}<br />{bdate}<br />{ss_number}</p>\n<p>{bureau_address}</p>\n<p>{curr_date}</p>\n<p>Re: Creditor Verification of incorrect items on my credit history report.<br />Credit Report Number:</p>\n<p>To Whom It May Concern,</p>\n<p>On (DATE), I received my credit report from you. It included the following incorrect information:</p>\n<p>{dispute_item_and_explanation}</p>\n<p>I am enclosing a copy of my credit report with the incorrect data highlighted.I just received a letter from that creditor verifying that this information on my credit report is inaccurate and should be removed from my credit file. I have enclosed a copy of the letter.</p>\n<p>OR</p>\n<p>On (DATE) I spoke with (CONTACT PERSON) from . This person verified that this information on my credit report is indeed inaccurate and should be removed from my credit file.</p>\n<p>{dispute_item_and_explanation}</p>\n<p>You can reach this person at (CONTACT NUMBER)</p>\n<p>I am enclosing a copy of my credit report with the incorrect data highlighted.This incorrect and negative information is damaging my credit. Please remove this incorrect information at once and send me an updated copy of my credit history report.I also request that you please send notices of corrections to anyone who received my credit report in the past six months.</p>\n<p>Thank you for your time and help in this matter.</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>\n<p>cc: Federal Trade Commission</p>\n<p>(ENCLOSE A COPY OF CREDIT REPORT WITH THE INCORRECT ITEMS IN QUESTION HIGHLITED. ALSO INCLUDE ALL OTHER DOCUMENTATION VERIFYING THE ABOVE FACTS)</p>', '0', '2013-01-07 11:38:35', '1', 65, 'system','Request to credit bureau to remove item with proof or creditor employee contact information that verbally agreed.','1) This letter is pointless to have in the library. When a bankruptcy is filed, the court notifies the creditors/collectors of the bankruptcy. 2) Also, there is language that I can\'t make heads or tails of, like this: \"To my knowledge, have never had non-sufficient funds and I am not aware of any negative entries. Kindly forward me a copy of my Inform Creditor for Bankruptcy record so that I may verify its accuracy.\" Consider ditching this letter.  3) If you decide to keep it, instructions on letter need formatting to consistently stand out.','Credit Bureau '),
(8, 2, 'Dispute Follow-up after no response for 30 days', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{t_no}<br />{bdate}<br />{ss_number}</p>\n<p>{bureau_address}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>This letter is a formal complaint that you are reporting inaccurate and incomplete credit information.</p>\n<p>I am distressed that you have included the information below in my credit profile and that you have failed to maintain reasonable procedures in your operations to assure maximum possible accuracy in the credit reports you publish. Credit reporting laws ensure that bureaus report only 100% accurate credit information. Every step must be taken to assure the information reported is completely accurate and correct. The following information therefore needs to be re-investigated. I respectfully request to be provided proof of this alleged item, specifically the contract, note or other instrument bearing my signature.</p>\n<p>{dispute_item_and_explanation}</p>\n<p>Failing that, the item must be deleted from the report as soon as possible. The listed item is entirely inaccurate and incomplete, and as such represents a very serious error in your reporting. Please delete this misleading information and supply a corrected credit profile to all creditors who have received a copy within the last six months, or the last two years for employment purposes.</p>\n<p>Additionally, please provide the name, address, and telephone number of each credit grantor or other subscriber.</p>\n<p>Under federal law, you have thirty (30) days to complete your re-investigation. Be advised that the description of the procedure used to determine the accuracy and completeness of the information is hereby requested as well, to be provided within fifteen (15) days of the completion of your re-investigation.</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 11:39:32', '1', 66, 'system','30 day follow up demand to credit bureau with warning to re-investigate disputed items.','Previous Dispute Letter, Photo ID, Proof of Address','Credit Bureau '),
(9, 2, 'Dispute Follow-up after no response for 60 days', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{t_no}<br />{bdate}<br />{ss_number}</p>\n<p>{bureau_address}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>This letter is formal notice that you have failed to respond in a timely manner to my dispute letter of insert date, deposited by registered mail with the U.S. Postal Service on that date. Federal law requires you to respond within thirty (30) days, yet you have failed to respond. Failure to comply with these federal regulations by credit reporting agencies are investigated by the Federal Trade Commission (FTC) (see 15 USC 41, et seq.).</p>\n<p>I am maintaining a careful record of my communications with you for the purpose of filing a complaint with the FTC should you continue in your non-compliance. I further remind you that, as in Wenger v. Trans Union Corp., No. 95-6445 (C.D.Cal. Nov. 14, 1995), you may be liable for your willful non-compliance.</p>\n<p>Be aware that I am making a final goodwill attempt to have you clear up this matter. You have 15 days to cure.</p>\n<p>For your benefit, and as a gesture of my goodwill, I will restate my dispute. The following information needs to be verified and, following failure to verify, deleted from the report as soon as possible:</p>\n<p>{dispute_item_and_explanation}</p>\n<p>The listed item is entirely inaccurate and incomplete, and represents a very serious error in your reporting. Please delete this misleading information and supply a corrected credit profile to all creditors who have received a copy within the last six months, or the last two years for employment purposes.</p>\n<p>Additionally, please provide the name, address, and telephone number of each credit grantor or other subscriber.</p>\n<p>Under federal law you had thirty (30) days to complete your re-investigation, yet you have failed to respond. Do not delay any further.</p>\n<p>Be advised that the description of the procedure used to determine the accuracy and completeness of the information is hereby requested as well, to be provided within fifteen (15) days of the completion of your re-investigation.</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 11:40:09', '1', 67, 'system','60 day follow up demand to credit bureau with warning to re-investigate disputed items.','Previous Dispute Letter, Photo ID, Proof of Address','Credit Bureau '),
(10, 2, 'Dispute After Investigation: “The Prove it” Letter', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{t_no}<br />{bdate}<br />{ss_number}</p>\n<p>{bureau_address}</p>\n<p>Attn: Customer Relations Department</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>I am in disagreement with the items listed below which still appear on my credit report, even after your Investigation. I would like these items immediately re-investigated. These inaccuracies are highly injurious to my credit rating.</p>\n<p>{dispute_item_and_explanation}</p>\n<p>Furthermore, In accordance with The Fair Credit Reporting Act, Public law 91-506, Title VI, Section 611, Subsection A-D, please provide the names and business addresses of each individual with whom you verified the above, so that I may follow up.</p>\n<p>Please forward me an updated credit report after you have completed your Investigation and corrections.</p>\n<p>Your cooperation and prompt attention are greatly appreciated.</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 11:43:48', '1', 68, 'system','Follow up demand to credit bureau with warning to re-investigate disputed items.','Previous Dispute Letter(s), Photo ID, Proof of Address','Credit Bureau '),
(11, 2, 'Request to Describe Investigation Procedures', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{t_no}<br />{bdate}<br />{ss_number}</p>\n<p>{bureau_address}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>This letter is a formal request for the description of the procedures used to determine the accuracy and completeness of the disputed information, including the business name, address, and telephone number of any furnisher of information contacted in connection with this reinvestigation.</p>\n<p>{dispute_item_and_explanation}</p>\n<p>I am disappointed that you have failed to maintain reasonable procedures to assure complete accuracy in the information you publish, and insist you comply with the law by providing the requested information within the 15 days allowed.</p>\n<p>As already stated, the listed item is inaccurate and incomplete, and is a very serious error in reporting. Please supply a corrected credit profile to all creditors who have received a copy within the last 6 months, or the last 2 years for employment purposes.</p>\n<p>Additionally, please provide the name, address, and telephone number of each credit grantor or other subscriber.</p>\n<p>Sincerely,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 11:44:38', '1', 69, 'system','Demand for credit bureau to produce procedural details and creditor contact information. Also requests copies of corrected report to be sent to all who have received a copy within the last 6 months, or the last 2 years for employment purposes.','Previous Dispute Letter, Photo ID, Proof of Address','Credit Bureau '),
(12, 2, 'Demand to Comply with Investigation Request', '<p>{client_first_name}&nbsp;{client_last_name}<br />{client_address}<br />{client_previous_address}<br />{bdate}<br />{ss_number}&nbsp;<br /><br />{bureau_address}</p>\n<p>Attn.: Consumer Relations&nbsp;</p>\n<p>{curr_date}&nbsp;</p>\n<p>To Whom It May Concern,&nbsp;</p>\n<p>On (DATE), I wrote to you requesting an investigation into items that I believed were (CHOOSE:&nbsp; INNACCURATE, OUTDATED OR OBSOLETE). To date, I have not received a reply from you or any acknowledgment that an investigation has begun. In my previous request, I listed my reasons for disputing the information. I have enclosed it again and request that you reply within a reasonable amount of time.</p>\n<p>Since this is my (SECOND, THIRD,FOURTH, ETC) ) request, I will also be sending a copy of this letter to the Federal Trade Commission notifying them that I have signed receipts for letters sent to you and you have not complied with my request. I regret that I am being forced to take such action.&nbsp;<br /><br />Please see my reasons for dispute below:&nbsp;<br /><br />{dispute_item_and_explanation}<br /><br />I also understand that you are required to notify me of your investigation results within 30 days and provide me with an updated copy of my credit report. My contact information is provided below.&nbsp;</p>\n<p><br />Sincerely,&nbsp;<br /><br />{client_signature}<br />_____________________________</p>\n<p>{client_first_name}&nbsp;{client_last_name}</p>', '0', '2013-01-07 11:45:45', '1', 70, 'system','Follow up demand to credit bureau with warning to re-investigate disputed items.','Previous Dispute Letter, Photo ID, Proof of Address','Credit Bureau '),
(13, 2, 'Dispute Accounts That Should Be Included in BK', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{client_previous_address}<br />SS#: {client_social_security}<br /><br />{credit_bureau)</p>\r\n<p>{bureau_address}<br /><br />{curr_date}<br /><br />Re: (CREDIT REPORT NUMBER):<br /><br />To Whom It May Concern,<br /><br />The below account(s) should all show the following: included in bankruptcy. Accordingly, pursuant to the Fair Credit Reporting Act, please investigate and correct this inaccurate information.</p>\r\n<p>{dispute_item_and_explanation}<br /><br />Upon completion of this process, please mail an updated report to:<br /><br />{client_first_name} {client_last_name}<br />{client_address}<br />{client_previous_address}&nbsp;</p>\r\n<p>Sincerely,</p>\r\n<p>{client_signature}<br />____________________________</p>\r\n<p>{client_first_name} {client_last_name}</p>', '0', '2013-01-07 11:46:12', '1', 71, 'system','Demand credit bureau to modify accounts which have been included in bankruptcy filing to show they are in included in bankruptcy.','Photo ID, Proof of Address','Credit Bureau '),
(14, 2, 'Validate Debt', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{bureau_address}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>This letter is a formal complaint that you are reporting inaccurate and incomplete credit information.</p>\n<p>I am distressed that you have included the information below in my credit profile and that you have failed to maintain reasonable procedures in your operations to assure maximum possible accuracy in the credit reports you publish. Credit reporting laws ensure that bureaus report only 100% accurate credit information. Every step must be taken to assure the information reported is completely accurate and correct. The following information therefore needs to be re-investigated.</p>\n<p>{dispute_item_and_explanation}</p>\n<p>I respectfully request to be provided proof of this alleged item, specifically the contract, note or other instrument bearing my signature.</p>\n<p>Failing that, the item must be deleted from the report as soon as possible. The listed item is entirely inaccurate and incomplete, and as such represents a very serious error in your reporting. Please delete this misleading information and supply a corrected credit profile to all creditors who have received a copy within the last six months, or the last two years for employment purposes.</p>\n<p>Additionally, please provide the name, address, and telephone number of each credit grantor or other subscriber.</p>\n<p>Under federal law, you have thirty (30) days to complete your re-investigation. Be advised that the description of the procedure used to determine the accuracy and completeness of the information is hereby requested as well, to be provided within fifteen (15) days of the completion of your re-investigation.</p>\n<p>Sincerely,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 11:47:22', '1', 72, 'system','Demand proof from credit bureau to remove inaccurate information.','Photo ID, Proof of Address','Credit Bureau '),
(15, 2, 'Report Identity Theft', '<p>***************Instructions delete these before saving and sending***************<br />Fraud alerts are extremely helpful if you have been a victim of Identity theft. However, if you are NOT a victim of ID Theft, DO NOT place a fraud alert in your file as it serves no useful purpose.<br />***************Instructions delete these before saving and sending***************</p>\r\n<p>{client_first_name} {client_last_name}<br />{client_address}<br />{bdate}<br />{ss_number}</p>\r\n<p>{bureau_address}</p>\r\n<p>Re: Identity Theft Notification</p>\r\n<p>To Whom It May Concern,</p>\r\n<p>This certified letter, receipt number__________________________ is to notify you that I believe I have been a victim of identity theft. Please rate the following accounts as \"unrated\" until this matter has been resolved.</p>\r\n<p>I am formally requesting the following:</p>\r\n<p>1) Please place a fraud alert note on my credit immediately.</p>\r\n<p>2) Please notify all companies that have inquired in the past 12 months that identity theft has occurred.</p>\r\n<p>3) Please do not authorize credit in my name without calling me first at ( ) _____ - ______ for verification.</p>\r\n<p>4) Please send me a complete copy of my credit report as soon as possible so I can check it again for accuracy.</p>\r\n<p>5) Please do not release my credit information to any credit issuer in the future without my permission.</p>\r\n<p>I will inform you in writing when the matter has been resolved to remove the fraud alert. Enclosed is a copy of the police report (if you have one).</p>\r\n<p>Kind regards,<br />{client_signature}<br />_________________________________________</p>\r\n<p>{client_first_name} {client_last_name}</p>', '0', '2013-01-07 11:48:25', '1', 73, 'system','Notify credit bureaus accounts are fraudulent and demand to remove the accounts from credit file.','Photo ID, Proof of Address, Copy of Identity Theft Police Report, Anything Related to Case, Notary Seal','Credit Bureau '),
(16, 2, 'Report Identity Theft (Alternate)', '<p>***************Instructions delete these before saving and sending***************<br />Fraud alerts are very helpful if you have been a victim of ID theft. If you have not, do not place a fraud alert in your file as it serves no positive purpose.<br />***************Instructions delete these before saving and sending***************</p>\n<p><br />{client_first_name} {client_last_name}<br />{client_address}<br />{t_no}<br />{bdate}<br />{ss_number}</p>\n<p>{bureau_address}<br />Attention: Fraud Department</p>\n<p>{curr_date}</p>\n<p>Re: Identity Theft Notification</p>\n<p>To Whom It May Concern,</p>\n<p>I am a victim of identity theft and have enclosed a copy of my police report/identity theft report, a copy of my drivers license and social security card as proof of my identity, plus proof of my current address. I am writing to request that you place an immediate block on the following fraudulent information in my credit file within 4 days upon receipt of this correspondence.</p>\n<p>I have recently obtained a copy of my credit file and the information does not relate to any transactions that I have made; therefore, I am requesting that these accounts be completely removed and blocked from my credit file. This is not a regular dispute I have filed a complaint with the Federal Trade Commission to document being a victim of identity theft.</p>\n<p>Please block this fraudulent information per sections 605B, 615(f) and 623(a)(6) of the Fair Credit Reporting Act. I am requesting that the following fraudulent accounts be deleted and blocked from my credit file:</p>\n<p>{dispute_item_and_explanation}</p>\n<p>Kind regards,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>\n<p>Enclosures: Police Report/Identity Theft Report, FCRA Sections 605B, 615(f), 623(a)(6)</p>', '0', '2013-01-07 11:49:07', '1', 74, 'system','Notify credit bureaus accounts are fraudulent.','Photo ID, Proof of Address, Copy of Identity Theft Police Report, Anything Related to Case, Notary Seal','Credit Bureau '),
(17, 2, 'Request to Merge Spouse\\\'s Credit History', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{bureau_address}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>As my right by law, I am requesting that you merge my spouse&rsquo;s credit history with mine. Please make the necessary changes and forward a new copy of my updated credit report to me. Both my spouse and I have authorized this change.</p>\n<p>My social security number: {ss_number}<br />My full name: {client_first_name} {client_middle_name} {client_last_name}<br />My address: {client_address} _<br />Spouses social security number:__________________________<br />Spouses full name:_______________________________________</p>\n<p>My signature:____________________________________________</p>\n<p>Spouses signature:_______________________________________</p>\n<p>Regards,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 11:49:47', '1', 75, 'system','Request to credit bureau to merge credit histories between spouses.','- N/A','Credit Bureau '),
(18, 2, 'Request to Add Additional Credit Information', '&lt;p&gt;***************Instructions delete these before saving and sending***************&lt;br /&gt;Getting positive information added by anyone other than the source is not an easy task. However, sometimes for a fee a Credit Bureau will often add the information if proof is acquired from the source. If you have valid proof of a debt with the creditor&amp;rsquo;s name, contact information and history, include that with your request.&lt;br /&gt;***************Instructions delete these before saving and sending***************&lt;/p&gt;\n&lt;p&gt;&lt;br /&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;br /&gt;{t_no}&lt;br /&gt;{dob}&lt;br /&gt;{ss_number}&lt;/p&gt;\n&lt;p&gt;{bureau_address}&lt;/p&gt;\n&lt;p&gt;Attention: Fraud Department&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;Re: Request for Addition of Credit Information&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern,&lt;/p&gt;\n&lt;p&gt;I am writing to request that you please include the additional information attached to my credit history report. You may verify this information with the source and I have included their contact details.&lt;/p&gt;\n&lt;p&gt;According to the Fair Credit Reporting Act (FCRA), Section 602(b), I am permitted to have accurate and true information reflected in my credit report. To accomplish this, I am requesting that my positive payment history with (Creditor&amp;rsquo;s Name) be added. This will justly reflect my payment history. Therefore, I request that you immediately verify and add the enclosed payment history to my credit file. (Enclose proof from Creditor)&lt;/p&gt;\n&lt;p&gt;{dispute_item_and_explanation}&lt;/p&gt;\n&lt;p&gt;Please notify me within 30 days that the additional credit information has been added by sending an updated copy of my credit history report to my address above.&lt;/p&gt;\n&lt;p&gt;The FCRA states &quot;a consumer\'s credit report should reflect completeness and accuracy within a reasonable time after notification by the consumer.&quot; By adding this information to my records it will help to reflect a more accurate credit history report.&lt;/p&gt;\n&lt;p&gt;If you require that this information be submitted to you directly from the source, please indicate the procedure and your fee to add this information.&lt;/p&gt;\n&lt;p&gt;Kind regards,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_________________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;\n&lt;p&gt;Enclosures: Police Report/Identity Theft Report&lt;br /&gt;FCRA Sections 605B, 615(f), 623(a)(6)&lt;/p&gt;', '0', '2013-01-07 11:50:54', '1', 76, 'system','Request to credit bureau to add tradeline to credit report.','Photo ID, Proof of Address, Copy of account statement, copy of cancelled check paid to creditor','Credit Bureau '),
(19, 2, 'Credit Inquiry Removal Request', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{client_previous_address}</p>\n<p>{bureau_address}</p>\n<p>{curr_date}</p>\n<p>RE: Request for Investigation of Unauthorized Inquiry</p>\n<p>To Whom It May Concern,</p>\n<p>I checked my personal credit report, which I acquired from your organization on (INSERT DATE OF REPORT) and I noticed that this unauthorized inquiry had been made:</p>\n<p>{dispute_item_and_explanation}</p>\n<p>I contacted (CREDITOR/FURNISHERS NAME), who placed the inquiry, and asked them to remove their credit inquiry from my credit profile. I also asked them to cease their illegal activities immediately, but to date there have been no responses from their office. Since sending the letter more than 30 business days ago, they have failed to respond and honor my request.</p>\n<p>Therefore, I must request your help in resolving this matter. In accordance with the Fair Credit Reporting Act, I request you immediately initiate an investigation into this inquiry on my credit report to determine who authorized the inquiry. If, once your investigation is complete, you find my allegation to be true, please remove the unauthorized inquiry from my credit report and send me an updated copy of my credit report at my address listed above. If you do find the inquiry referenced above to be valid, I request that you please send me a full description of the procedures used in your investigation within 15 business days of the completion of the investigation.</p>\n<p>Thank you for your help and assistance.</p>\n<p>Sincerely,</p>\n<p>{client_signature}<br />____________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 11:51:37', '1', 77, 'system','Request credit bureau to remove inquiry on credit report.','Photo ID, Proof of Address ','Credit Bureau '),
(20, 2, '100 Word Consumer Statement', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{bureau_address}</p>\n<p>Full Name: {client_first_name} {client_last_name}<br />{bdate}<br />{ss_number}<br />{client_address}<br />{t_no}<br />{client_previous_address}</p>\n<p>{curr_date}</p>\n<p>Re: Credit Report Number: (ENTER IF AVAILABLE) / Add Consumer Statement</p>\n<p>To Whom It May Concern,</p>\n<p>Please add following personal statement to my credit history report:</p>\n<p>(YOUR 100 WORD (OR LESS) STATEMENT GOES HERE)</p>\n<p>Enclosed are copies of documents identifying me by my name and address.</p>\n<p>Thank you for your time and help in this matter.<br /><br />Sincerely yours,</p>\n<p>{client_signature}<br />______________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 11:52:26', '1', 78, 'system','Request to credit bureau to add 100 word consumer statement to credit file.','Photo ID, Proof of Address','Credit Bureau '),
(21, 2, 'Frivolous Dispute Response', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{t_no}<br />{bdate}<br />{ss_number}</p>\n<p>{bureau_address}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>I received a letter from your firm stating that my letter requesting verification of erroneous items on my report as being classified as \"frivolous\" or \"irrelevant\". I assure you that in no way do I consider a matter of such importance to me as frivolous nor irrelevant. In fact if you do not honor my original request to verify the items contained in my previous letter, mailed (DATE SENT) via certified mail, I will file a complaint with the Federal Trade Commission against your company.</p>\n<p>I have included my original disputes for your convenience below:</p>\n<p>The following information therefore needs to be reinvestigated. I respectfully request to be provided proof of this alleged item, specifically the contract, note or other instrument bearing my signature. Failing that, the items must be deleted from the report as soon as possible:</p>\n<p>{dispute_item_and_explanation}</p>\n<p>The listed item is completely inaccurate and incomplete, and is a very serious error in reporting. Please delete this misleading information, and supply a corrected credit profile to all creditors who have received a copy within the last 6 months, or the last 2 years for employment purposes.</p>\n<p>Additionally, please provide the name, address, and telephone number of each credit grantor or other subscriber.</p>\n<p>Under federal law, you have 30 days to complete your reinvestigation. Be advised that the description of the procedure used to determine the accuracy and completeness of the information is hereby requested as well. Please provide this information within 15 days of the completion of your reinvestigation.</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 11:53:49', '1', 79, 'system','Follow up demand to credit bureau with warning to re-investigate disputed items after previous response was deemed \"frivolous\".','Previous Dispute Letter, Copy of Frivolous Accusation Letter, Photo ID, Proof of Address','Credit Bureau '),
(22, 2, 'Frivolous Dispute Response (Alternate)', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{t_no}<br />{bdate}<br />{ss_number}</p>\n<p>{bureau_address}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>This letter is a formal complaint that you are reporting inaccurate and incomplete credit information. I am distressed that you have included the below information in my credit profile and have failed to maintain reasonable procedures in your operations to assure maximum possible accuracy in the credit reports you publish.</p>\n<p>Credit reporting laws ensure that bureaus report only 100% accurate credit information. Every step must be taken to assure the information reported is completely accurate and correct.</p>\n<p>The following information therefore needs to be reinvestigated. I respectfully request to be provided proof of this alleged item, specifically the contract, note or other instrument bearing my signature. Failing that, the items must be deleted from the report as soon as possible:</p>\n<p>{dispute_item_and_explanation}</p>\n<p>The listed item is completely inaccurate and incomplete, and is a very serious error in reporting. Please delete this misleading information, and supply a corrected credit profile to all creditors who have received a copy within the last 6 months, or the last 2 years for employment purposes.</p>\n<p>Additionally, please provide the name, address, and telephone number of each credit grantor or other subscriber.</p>\n<p>Under federal law, you have 30 days to complete your reinvestigation. Be advised that the description of the procedure used to determine the accuracy and completeness of the information is hereby requested as well. Please provide this information within 15 days of the completion of your reinvestigation.</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 11:54:14', '1', 80, 'system','Follow up demand to credit bureau with warning to re-investigate disputed items after previous response was not adequate.','Previous Dispute Letter, Copy of Frivolous Accusation Letter, Photo ID, Proof of Address','Credit Bureau '),
(23, 2, 'Reply to Accusation of Credit Repair', '&lt;p&gt;***************Instructions delete these before saving and sending***************&lt;br /&gt;Sometimes a Credit Bureau will accuse you of using a credit repair company (which is your right by law) Here is a letter to put them in their place and to avoid slowing down your disputes.&lt;br /&gt;***************Instructions delete these before saving and sending***************&lt;/p&gt;\n&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;br /&gt;{t_no}&lt;br /&gt;{dob}&lt;br /&gt;{ss_number}&lt;/p&gt;\n&lt;p&gt;{bureau_address}&lt;/p&gt;\n&lt;p&gt;Re: Credit Repair Accusation&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern,&lt;/p&gt;\n&lt;p&gt;Please be advised that I have received your computer-generated letter stating that you have ceased investigation of my credit reports because, in your opinion, you believe that I have used a third party credit repair agency. Not only do I believe this to be a stall tactic on your part to grant you an additional 30 days to comply with my original request, but I believe it to be a blatant violation of the FCRA.&lt;/p&gt;\n&lt;p&gt;You were advised by me on (insert date) by certified mail (copy enclosed) that I questioned the accuracy of a few items on my credit reports. That request was written by me and mailed by me- not a third party agency. It appears obvious to me that you are abusing your power under the FCRA to escape a complete investigation.&lt;/p&gt;\n&lt;p&gt;Here again is the incorrect information being reported:&lt;/p&gt;\n&lt;p&gt;{dispute_item_and_explanation}&lt;/p&gt;\n&lt;p&gt;Additionally there is NO law that states a consumer cannot use a third party, so using that as your excuse is a irrelevant. In fact, the United States Congress has found the whole process so overwhelming that they afford consumers the right to use a third party on their behalf if the consumer so chooses. This is why your statement is so shameful.&lt;/p&gt;\n&lt;p&gt;I reserve the right to sue a credit bureau for violations of the Fair Credit Reporting Act and I believe I can prove that you did not use reasonable measures to insure the accuracy of my credit reports and now you are stalling the process even further.&lt;/p&gt;\n&lt;p&gt;I realize disputes can be expensive and it is your job to stall them, but you do so at great risk. Please take notice that this letter dated (insert today\'s date) is formal notice to you that I am requesting that you continue forward with my original investigation request and please send the results to me within 15 days. I therefore legally and lawfully refuse your &quot;form letter&quot; thus giving you only 15 days not 30 more.&lt;/p&gt;\n&lt;p&gt;I am annoyed and outraged at your accusation and I have researched my rights in regards to my credit file. Please expedite my original request immediately.&lt;/p&gt;\n&lt;p&gt;Sincerely yours,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_________________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;', '0', '2013-01-07 11:54:56', '1', 81, 'system','Follow up demand with stern warning to credit bureau after previous response with accusation of using a credit repair company to dispute.','Previous Dispute Letter, Photo ID, Proof of Address, Previous Letter, Certified Mail Receipt','Credit Bureau'),
(24, 2, 'Intention to File FTC Complaint - After 30 Days', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{t_no}<br />{bdate}<br />{ss_number}</p>\n<p>{bureau_address}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>This letter shall serve as formal notice of my intent to file a complaint with the FTC, due to your blatant and objectionable disregard of the law.</p>\n<p>As indicated by the attached copies of letters and mailing receipts, you have received and accepted through registered mail my dispute letter dated , as well as my follow-up letter dated . To date you have not done your duty as mandated by law. Your non-compliance with federal law is unacceptable, your disregard for it contemptible. Rest assured I shall hold you accountable.</p>\n<p>Federal law requires you to respond within 30 days, yet you have failed to respond. Failure to comply with these federal regulations by credit reporting agencies are investigated by the Federal Trade Commission (see 15 USC 41, et seq.).</p>\n<p>I am maintaining a careful record of my communications with you on this matter; for the purpose of filing a complaint with the FTC should you continue in your non-compliance. I further remind you that, as in Wenger v. Trans Union Corp., No. 95-6445 (C.D.CaI. Nov. 14, 1995), you may be liable for your willful noncompliance.</p>\n<p>For the record, the following information is being erroneously included on my credit report, as I have advised you on two separate occasions, more than 75 days and again 40 days ago:</p>\n<p>{dispute_item_and_explanation}</p>\n<p>If you do not immediately remove this inaccurate and incomplete information, I will file a formal complaint with the Federal Trade Commission.</p>\n<p>Should you continue to operate with complete disregard for the law, I intend to seek redress in civil action for recovery of damages, costs, and attorney fees. For this purpose I am carefully documenting these events, including the lack of response REQUIRED under law from you.</p>\n<p>Additionally, please provide the name, address, and telephone number of each credit grantor or other subscriber.</p>\n<p>Under federal law, you had 30 days to complete your re-investigation, yet you have failed to respond. Further delays are inexcusable.</p>\n<p>Be advised that the description of the procedure used to determine the accuracy and. completeness of the information is hereby requested as well, to be provided within 15 days of the completion of your re-investigation.</p>\n<p>Sincerely,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 11:55:59', '1', 83, 'system','Third attempt with stern warning and demand credit bureau to re-investigate previously verified items.','Previous Dispute Letter(s), Photo ID, Proof of Address','Credit Bureau'),
(25, 2, 'Intention to File FTC Complaint - After 30 Days (Alternate)', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{t_no}<br />{bdate}<br />{ss_number}</p>\n<p>{bureau_address}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>This letter is formal notice that you have failed to respond in a timely manner to my dispute letter of , deposited by registered mail with the U.S. Postal Service on that date.</p>\n<p>Federal law requires you to respond within thirty (30) days, yet you have failed to respond. Failure to comply with these federal regulations by credit reporting agencies are investigated by the Federal Trade Commission (see 15 USC 41, et seq.). I am maintaining a careful record of my communications with you for the purpose of filing a complaint with the FTC should you continue in your non-compliance. I further remind you that, as in Wenger v. Trans Union Corp., No. 95-6445 (C.D.cal. Nov. 14, 1995), you may be liable for your willful non-compliance.</p>\n<p>Be aware that I am making a final goodwill attempt to have you clear up this matter. You have 15 days to cure.</p>\n<p>For your benefit, and as a gesture of my goodwill, I will restate my dispute. The following information needs to be verified and, following failure to verify, deleted from the report as soon as possible:</p>\n<p>{dispute_item_and_explanation}</p>\n<p>The listed item is entirely inaccurate and incomplete, and represents a very serious error in your reporting. Please delete this misleading information and supply a corrected credit profile to all creditors who have received a copy within the last six months, or the last two years for employment purposes.</p>\n<p>Additionally, please provide the name, address, and telephone number of each credit grantor or other subscriber.</p>\n<p>Under federal law you had thirty (30) days to complete your re-investigation, yet you have failed to respond. Do not delay any further.<br />Be advised that the description of the procedure used to determine the accuracy and completeness of the information is hereby requested as well, to be provided within fifteen (15).</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 11:56:31', '1', 84, 'system','Third attempt with stern warning and demand credit bureau to re-investigate previously verified items within 15 days.','Previous Dispute Letter(s), Photo ID, Proof of Address','Credit Bureau'),
(26, 2, 'Intention to File FTC Complaint - After 60 Days', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{bureau_address}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>This letter shall serve as formal Notice of my Intent to file a Complaint with the FTC, due to your blatant disregard of the law.</p>\n<p>As indicated by the attached copies of letters and mailing receipts, you have been delivered by registered mail both a dispute letter, dated 2/10/1999, as well as a follow-up letter, dated 3/20/1999. As of this moment, you have not done your duty mandated under the law. Your inaction in this matter is inexcusable, and your disregard for the law is contemptible. Rest assured, I will hold you to account.</p>\n<p>As you are well aware, federal law requires you to respond within 30 days, yet you have failed to respond. Failure to comply with these federal regulations by credit reporting agencies are investigated by the Federal Trade Commission (see 15 USC 41, et seq.). I am maintaining a careful record of my communications with you on this matter, for the purpose of filing a complaint with the FTC should you continue in your non-compliance. I further remind you that, as in Wenger v. Trans Union Corp., No. 95-6445 (C.D.Cal. Nov. 14, 1995), you may be liable for your willful non-compliance.</p>\n<p>For the record, the following information is being erroneously included on my credit report, as I have advised you on two separate occasions, more than 75 days and again 40 days ago:</p>\n<p>{dispute_item_and_explanation}</p>\n<p>If you do not immediately remove this inaccurate and incomplete information, I will file a formal complaint with the FTC. Furthermore, I intend to seek redress in civil action, for recover of damages, costs, and attorney&rsquo;s fees, should you continue in your deliberate obstruction of the law. For this purpose, I am carefully documenting these events, including the lack of response REQUIRED under law from you.</p>\n<p>Additionally, please provide the name, address, and telephone number of each credit grantor or other subscriber.</p>\n<p>Under federal law, you had 30 days to complete your re-investigation, yet you have failed to respond. Your continued delays are inexcusable.</p>\n<p>Be advised that the description of the procedure used to determine the accuracy and completeness of the information is hereby requested as well, to be provided within 15 days of the completion of your re-investigation.</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 11:57:47', '1', 85, 'system','Fourth attempt with stern warning and demand credit bureau to re-investigate previously verified items within 15 days.','Previous Dispute Letter(s), Photo ID, Proof of Address','Credit Bureau'),
(27, 2, 'Intent To File Lawsuit for FCRA Violation', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{client_previous_address}<br />SS# {ss_number}&nbsp;</p>\r\n<p>{bureau_name}<br />{bureau_address}<br />{creditor_city} {creditor_state} {creditor_zip}&nbsp;</p>\r\n<p>{curr_date}&nbsp;</p>\r\n<p>Re: Intent To File Lawuit for FCRA Violation&nbsp;</p>\r\n<p>To Whom It May Concern,&nbsp;</p>\r\n<p>It is a crime to threaten lawsuit with no intention of doing so, therefore you can take heed that I am very serious about filing suit against your company. I have sent (NUMBER OF LETTERS) previous letters to you, all by certified mail (receipts enclosed) requesting that you remove inaccurate information from my file and you have failed to do so.<br /><br />Accordingly, I can show a judge that these accounts are inaccurate and that you violated the Fair Credit Reporting Act by ignoring my requests to investigate the items. My previous letters (all sent by certified mail) stated my reasons for an investigation and these reasons were not frivolous in any way.&nbsp;<br /><br />If this final request does not prompt you to conduct a proper investigation of these accounts in question, and send proof to me of said investigation, I will file a civil suit in my county for damages and you can travel to defend yourself.&nbsp;<br /><br />I take my credit very serious and your lack of professionalism and assistance disappoints me. I am well aware of my rights under the Fair Credit Reporting Act and I intend to pursue them to the maximum.&nbsp;<br /><br />I await your response.<br /><br />Sincerely,&nbsp;</p>\r\n<p>{client_signature}<br />____________________________</p>\r\n<p>{client_first_name} {client_last_name}&nbsp;</p>\r\n<p>cc: Federal Trade Commission; Attorney General&nbsp;</p>', '0', '2013-01-07 11:58:21', '1', 86, 'system','Stern warning and demand credit bureau to re-investigate previously verified items.','Previous Dispute Letter(s), Photo ID, Proof of Address','Credit Bureau '),
(28, 3, 'Dispute Credit Card Bill', '&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_email}&lt;br /&gt;{creditor_city} {creditor_state} {creditor_zip}&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;Re: Account number: {client_ac_no}&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern:&lt;/p&gt;\n&lt;p&gt;I am writing to dispute the following charge(s) that appear on my billing statement dated (STATEMENT DATE):&lt;/p&gt;\n&lt;p&gt;(MERCHANT\'S NAME)&lt;br /&gt;(AMOUNT IN ERROR)&lt;/p&gt;\n&lt;p&gt;The error is as follows:&lt;/p&gt;\n&lt;p&gt;(REASON FOR COMPLAINT)&lt;/p&gt;\n&lt;p&gt;As required by law, I have tried in good faith to resolve this dispute with the merchant:&lt;/p&gt;\n&lt;p&gt;(ENTER STEPS TAKEN)&lt;/p&gt;\n&lt;p&gt;Furthermore, I wish to point out that this purchase was for more than $50 and was made (CHOOSE ONE:) in the state in which I live [OR] within 100 miles of my home.&lt;/p&gt;\n&lt;p&gt;Please verify this dispute with the merchant and remove this item, and all late and interest charges associated with this item, from my billing statement.&lt;/p&gt;\n&lt;p&gt;Thank you for your time and assistance.&lt;/p&gt;\n&lt;p&gt;Sincerely yours,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_________________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;', '0', '2013-01-07 12:00:18', '1', 11, 'system','Demand creditor to remove charge/late payments associated with an invalid credit card purchase.','Copy of credit card bill with highlighted error.','Creditor');
INSERT INTO `crd_letter_templ` (`itempl_id`, `itempl_catgid`, `vtempl_title`, `vtempt_text`, `efavorite`, `dtempl_createdon`, `estatus`, `iOrder`, `vadded_by`,`letter_description`,`documents_needed`,`recipient`) VALUES
(29, 3, 'Error on Credit Card Bill', '&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city}, {creditor_state} {creditor_zip}&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;Re: Account number: {account_number}&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern:&lt;/p&gt;\n&lt;p&gt;I am writing to report an error I have discovered on my billing statement&lt;br /&gt;dated (STATEMENT DATE):&lt;/p&gt;\n&lt;p&gt;(MERCHANT\'S NAME)&lt;br /&gt;(AMOUNT IN ERROR)&lt;/p&gt;\n&lt;p&gt;The error is as follows:&lt;/p&gt;\n&lt;p&gt;(REASON FOR COMPLAINT)&lt;/p&gt;\n&lt;p&gt;I understand that the law requires you to acknowledge receipt of this letter within 30 days unless you correct this billing error before then. Furthermore, I understand that within two billing cycles (but in no event more than 90 days), you must correct the error or explain why you believe the amount to be correct.&lt;/p&gt;\n&lt;p&gt;Thank you for your time and assistance.&lt;/p&gt;\n&lt;p&gt;Sincerely yours,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_________________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;', '0', '2013-01-07 12:00:48', '1', 12, 'system','Complaint and dispute with creditor to modify credit card bill.','Copy of credit card bill with highlighted error.','Creditor'),
(30, 3, 'Request Removal of Incorrect Info', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city}, {creditor_state} {creditor_zip}</p>\n<p>{curr_date}</p>\n<p>{client_first_name} {client_last_name}, Account number: {account_number}</p>\n<p>To Whom It May Concern:</p>\n<p>On (DATE), I received a copy of my credit history report from (CREDIT BUREAU NAME). That Report contained incorrect information reported by you.</p>\n<p>I contacted the (CREDIT BUREAU NAME) to request deletion of this inaccurate data from my Credit History Report, but they have refused. They insist that your company claims this information to be accurately reported. This is not true, and here as follows is the correct information:</p>\n<p>{dispute_item_and_explanation}</p>\n<p>I am enclosing the following documentation to support my claim that the information you have reported is not correct:</p>\n<p>(LIST DOCUMENTATION)</p>\n<p>This negative mark is damaging to my credit. Please contract Experian, Equifax and Trans-Union, immediately to remove this information from my credit file.</p>\n<p>Please confirm to me within 20 days that you have contacted the credit bureaus to correct this information.</p>\n<p>Thank you for your time and assistance.</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 12:01:19', '1', 13, 'system','Demand creditor to remove inaccurate information from credit report.','- N/A','Creditor'),
(31, 3, 'Request Removal of Incorrect Info (Alternate)', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_address}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>I have recently received a copy of my credit report. The report had an account listed from your company as a credit card. I disputed the account with the credit bureau as \"not mine\" but it recently came back as verified.</p>\n<p>{dispute_item_and_explanation}</p>\n<p>I am writing this letter to you in an effort to get this removed. Please delete your information from my credit reports. I have never had an account with your company. If someone has opened an account in my name, please close it immediately before further harm is done.</p>\n<p>I am requesting that you notify all of credit bureaus that this account is \"disputed\" or that you delete this account until this matter is resolved. This is required by the Fair Credit Reporting Act. If there is any paperwork that I need to sign to confirm that this account is not mine, please send me the required documents.</p>\n<p>This is a written dispute of the this account per the Fair Credit Reporting Act, the Fair Debt Collection Practices Act and the Fair Credit Billing Act. Please be aware that I am exercising all of my rights per these laws and all other applicable laws protecting me.</p>\n<p>Sincerely,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 12:04:31', '1', 14, 'system','Demand creditor to remove inaccurate information from credit report.','- N/A','Creditor'),
(32, 3, 'Request Direct Negotiation with Creditor', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\r\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city}, {creditor_state} {creditor_zip}</p>\r\n<p>{curr_date}</p>\r\n<p>Re: {client_first_name} {client_last_name}, Account number: {account_number}</p>\r\n<p>To Whom It May Concern:</p>\r\n<p>I have been contacted several times by {creditor_name} regarding a past due account with you. I do not, however, wish to discuss this matter with them and I have asked them to cease contact with me.</p>\r\n<p>I would prefer to speak directly with the {creditor_name} collections department.</p>\r\n<p>Please pass this information to your collections department and indicate my desire to be in touch with them.</p>\r\n<p>Thank you for your help.</p>\r\n<p>Sincerely yours,<br />_{client_signature}<br />________________________________________</p>\r\n<p>{client_first_name} {client_last_name}</p>', '0', '2013-01-07 12:05:24', '1', 15, 'system','Request original creditor to negotiate settlement after account was sent/sold to a 3rd party collection agency.','- N/A','Creditor'),
(33, 3, 'Pay for Delete (Offer Payment if Negative is Removed)', '&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city}, {creditor_state} {creditor_zip}&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;Re: {client_first_name} {client_last_name} , Account number {account_number}&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern:&lt;/p&gt;\n&lt;p&gt;On (Date), I received a copy of my credit report from (Credit Bureau Name). That report lists my payments to you as being \'delinquent.\'&lt;/p&gt;\n&lt;p&gt;My financial problems are now behind me and I am in a position to pay off this debt. I can pay a lump sum amount of $______ or I can pay installments in the amount of $______ per month for _______ months if you will agree to one of the following:&lt;/p&gt;\n&lt;p&gt;( ) If I make a lump sum payment, you will agree to remove all negative information from my credit file associated with the debt.&lt;/p&gt;\n&lt;p&gt;( ) If I agree to pay off the debt in monthly installments, you agree to \'re-age\' my account - making the current month the first repayment month and showing no late payments as long as I make the agreed upon monthly payments.&lt;/p&gt;\n&lt;p&gt;If this offer is acceptable to you, please check and initial one of the above choices, sign your acceptance below and return this letter to me in the enclosed envelope.&lt;/p&gt;\n&lt;p&gt;Thank you for your time and assistance.&lt;/p&gt;\n&lt;p&gt;Sincerely yours,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_________________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;\n&lt;p&gt;Agreed to and accepted to on this _____ day of _______________, ________.&lt;/p&gt;\n&lt;p&gt;By: ________________________________&lt;br /&gt; (Creditor Representative Signature)&lt;/p&gt;\n&lt;p&gt;Name (print): ___________________________&lt;/p&gt;\n&lt;p&gt;Company:_________________________&lt;/p&gt;\n&lt;p&gt;Title:_________________________________&lt;/p&gt;', '0', '2013-01-07 12:06:18', '1', 16, 'system','Settlement offer to creditor with stipulation to remove from credit report or remove late payments.','- N/A','Creditor'),
(34, 3, 'Pay For Delete (Alternate)', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{client_previous_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}<br />{creditor_phone}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>Re: {account_number}</p>\n<p>This letter is an offer to amicably settle the above account. It shall not be misconstrued as an acknowledgment of any liability for this debt in any form.</p>\n<p>I will pay your company the amount of $XXXX as \"full settlement of this account.\"</p>\n<p>If you accept this agreement, I will send you a money order or certified cashiers check for this settlement amount of $XXXX in exchange for a full deletion of all references regarding this account from my credit reports and full satisfaction of the debt. This agreement is binding and will be void should you not fulfill your end of this agreement. Furthermore, this debt will be deleted from my credit report at all three credit bureaus, as well as any other bureaus that your company regularly reports to.</p>\n<p>If you agree to the above, please acknowledge with your signature and return a copy to me. Upon receipt of your signed acknowledgment, I will promptly send you a money order or cashiers check in the amount I have stated above.</p>\n<p>Please note: This agreement is restricted. This is not a renewed promise to pay, but rather a restricted settlement offer only. By not signing below, you agree that the debt has not been renewed nor have any written agreements been exchanged.</p>\n<p>I look forward to resolving this matter in a speedily manner.</p>\n<p>{client_first_name} {client_last_name}</p>\n<p>Creditor&rsquo;s Authorized Signature: _____________________<br />Date:_________________<br />Name: ______________________<br />Title : _______________________</p>', '0', '2013-01-07 12:07:26', '1', 17, 'system','Settlement offer to creditor with stipulation to remove from credit report and warning if no deal can be reached, validation and cease and desist forthcoming.','- N/A','Creditor'),
(35, 3, 'Pay For Delete (Alternate 2)', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{client_previous_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}<br />{creditor_phone}</p>\n<p>{curr_date}</p>\n<p>Dear Collection Manager:</p>\n<p>It has come to my attention, through my credit report, that you claim I owe a debt to your agency. I can save us both some effort and time by settling the debt out.</p>\n<p>Here below is my offer. This is not a renewed promise to pay, nor does it constitute any agreement unless you sign and return it. <br />Please Note that I have not yet agreed that this debt is indeed mine and I have the option to seek additional proof of this debt from your agency.</p>\n<p>Because you hold all the rights to report the debt to the credit bureaus as you see fit, you can certainly change that listing at any time as the source reporting the debt.</p>\n<p>I have no doubt that you are aware of my right to dispute this debt and request full proof of obligation. Paying this unverified debt to you has little value to me if we cannot mutually agree that you will report the debt as outlined below.</p>\n<p>While I realize that your function is to collect debts as a collection agent, I am also aware that a paid collection would not be favorable on my report. That being said, I have determined, through the bureaus, that you have the absolute right to report this debt as you see fit or not report it at all.</p>\n<p>If you indicate that you are unable to remove the negative listing on my credit report, I will be forced to cease communication and request full verification of the debt.</p>\n<p>My goal is to arrange a term that is acceptable to us both, since this debt is \"questionable.\"</p>\n<p>My Offer: I will pay your company the amount of $xx as \"payment in full for the full satisfaction of this account.\" Upon receipt of the above payment, your company will agree to change this entry on my credit reports to \"Paid\" immediately. You further agree to remove any and all previous notations of delinquency.</p>\n<p>If you approve and agree to these terms, please acknowledge with your signature and return this letter to me. You agree these terms herein are confidential and that you have the authority to make such decisions. No payment will be made without written confirmation.</p>\n<p>Upon receipt of this signed acknowledgment, I will immediately mail you funds by priority mail. This is not a renewed promise to pay but rather a restricted offer only. If no terms can be met, no new arrangements will be made, and the offer will be withdrawn.</p>\n<p>{client_first_name} {client_last_name}</p>\n<p><br />{creditor_name}</p>\n<p><br />________________________________<br />Signature of company officer</p>\n<p>________________________________<br />Print Company Officer name</p>\n<p>Date:</p>\n<p>Sincerely,</p>\n<p>Name<br />Address<br />Social security number</p>', '0', '2013-01-07 12:08:34', '1', 18, 'system','Settlement offer to creditor with stipulation to remove from credit report and warning if no deal can be reached, validation and cease and desist forthcoming.','- N/A','Creditor'),
(36, 3, 'Debt Settlement Offer', '&lt;p&gt;***************Instructions Delete these before saving and sending***************&lt;br /&gt;If you have effectively agreed with a creditor or collector to settle a debt, this letter will to secure your rights for amount to be paid and credit reporting issues. Do not use this letter if the debt is disputed or expired, as doing so can renew the statute of limitations. If you agree that the debt is valid and you wish to begin negotiations you may also use this letter to present your first offer.&lt;br /&gt;***************Instructions Delete these before saving and sending***************&lt;/p&gt;\n&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city}, {creditor_state} {creditor_zip}&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;Re: Debtor\'s Settlement&lt;/p&gt;\n&lt;p&gt;Re: Account number: {account_number}&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern:&lt;/p&gt;\n&lt;p&gt;I understand that I owe a balance to your company. This letter is an offer to settle the debt for less because of my inability to pay the entire balance. Because of dire financial circumstances, [overwhelming debt, loss of job, insurance settlement with limited funds, considering bankruptcy, borrowing the money, illness, loss of family member with income, etc. List your reason here as to why you are offering to pay less.] I am only able to pay a portion of this debt.&lt;/p&gt;\n&lt;p&gt;I recognize you may be motivated as well, because of the age of the debt and my financial crisis. Declining to work with me will only make matters worse for both of us.&lt;/p&gt;\n&lt;p&gt;You are claiming the amount owed on the account is $________. Please accept my good faith offer to settle this account under these following conditions ONLY:&lt;/p&gt;\n&lt;p&gt;The parties involved agree to settle the account in full for the sum of $__________ and this amount is accepted as complete and final payment on said debt. Full discharge and settlement of all monies due will be created, provided that the amount agreed upon shall be paid as follows:&lt;/p&gt;\n&lt;p&gt;Payment terms: how debt will be paid, (i.e., three payments of $250.00 to be paid monthly on the 1st of each month, 8 payments of $200.00 on the 1st of each month after execution of this agreement, etc.)&lt;/p&gt;\n&lt;p&gt;Payment address: where you will send payment each month.&lt;/p&gt;\n&lt;p&gt;Other terms: list specific arrangements made, such as, creditor agrees to freeze the account without any additional fees or interest added to the balance etc.&lt;/p&gt;\n&lt;p&gt;Credit reporting: list all account status terms you are requesting such as &quot;paid in full&quot;, &quot;deleted&quot;, &quot;settled in full&quot;, &quot;settled for less&quot;, etc.&lt;/p&gt;\n&lt;p&gt;Governing states: This agreement shall be binding under the laws of [list your state and the creditor&amp;rsquo;s state].&lt;/p&gt;\n&lt;p&gt;If your office is in agreement with this settlement, please reply with confirmation on your company letterhead and signed by an individual with the authority to accept such offers. Time is of the essence because of my financial situation so please reply as soon as possible.&lt;/p&gt;\n&lt;p&gt;Kind regards,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_________________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;', '0', '2013-01-07 12:09:08', '1', 19, 'system','Settlement offer to creditor with payment terms and reporting requirement.','- N/A','Creditor'),
(37, 3, 'Debt Settlement Offer (Alternate)', '&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;br /&gt;&lt;br /&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city} {creditor_state} {creditor_zip}&lt;br /&gt;&lt;br /&gt;{curr_date}&lt;br /&gt;&lt;br /&gt;Re: Debtor\'s Settlement Offer for Account Number: {account_number}&lt;br /&gt;&lt;br /&gt;To Whom It May Concern,&lt;br /&gt;&lt;br /&gt;I am aware that I owe a balance to your company. This letter is an offer to settle the debt for less because of my inability to pay the full balance due to financial circumstances, because of:&amp;nbsp; (LIST HARDSHIPS HERE), I am only able to pay a portion of this debt.&lt;br /&gt;&lt;br /&gt;I realize you may be motivated as well, because of the age of the debt and my financial crisis. Refusing to work with me will only make matters worse for both of us.&lt;br /&gt;&lt;br /&gt;You claim the amount owed on the account is $________.&lt;br /&gt;&lt;br /&gt;Please accept this offer to settle this account ONLY under the following conditions:&lt;br /&gt;&lt;br /&gt;The parties involved agree to settle the account in full for the sum of $__________ and this amount is accepted as full and final payment on said debt. Complete discharge and settlement of all monies due will be created, provided that the amount agreed upon shall be paid in the following manner:&amp;nbsp;&lt;br /&gt;&lt;br /&gt;Payment terms: (i.e., 10 payments of $XXX on the 1st of each month after the execution of this agreement, 3 payments of $XXX to be paid monthly on the 1st of each month, 1 lump sum of $XXXX, etc.)&lt;br /&gt;&lt;br /&gt;Payment location: (ADDRESS TO SEND THE PAYMENTS&lt;br /&gt;&lt;br /&gt;Other terms:&amp;nbsp; (list additional arrangements made, such as, creditor agrees to freeze the account without any additional fees or interest added to the balance, etc.) Credit reporting: (list status terms you are requesting such as &amp;ldquo;paid in full&amp;rdquo;, &amp;ldquo;settled in full&amp;rdquo;, &quot;Paid as agreed&quot;, &amp;ldquo;settled for less&amp;rdquo;, &amp;ldquo;deleted&amp;rdquo; etc.)&lt;br /&gt;&lt;br /&gt;This agreement shall be binding under the laws of (LIST YOUR STATE AND THE CREDITOR\'S STATE)&lt;br /&gt;&lt;br /&gt;If your office agrees to this settlement, please send back confirmation on your company letterhead and signed by someone with the authority to accept such offers. Time is of the essence due to my present financial situation so please reply as soon as possible.&lt;br /&gt;&lt;br /&gt;Sincerely,&lt;br /&gt;&lt;br /&gt;{client_signature}&lt;br /&gt;____________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;', '0', '2013-01-07 12:16:45', '1', 20, 'system','Settlement offer to creditor with hardship reason and terms.','- N/A','Creditor'),
(38, 3, 'Debt Settlement Offer (Alternate 2)', '&lt;p&gt;***********************Instructions - Delete Before Printing****************************&lt;br /&gt;Send this only if the Creditor or Collections Agent has already agreed by phone or correspondence.&lt;br /&gt;***********************Instructions - Delete Before Printing****************************&lt;br /&gt;&lt;br /&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;br /&gt;&lt;br /&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city} {creditor_state} {creditor_zip}&lt;br /&gt;&lt;br /&gt;Attn: Attn: Settlement Dept.&lt;br /&gt;&lt;br /&gt;{curr_date}&lt;br /&gt;&lt;br /&gt;Re: Debtor\'s Settlement Offer for Account Number: {account_number}&lt;br /&gt;&lt;br /&gt;Dear Settlement Dept.:&lt;br /&gt;&lt;br /&gt;This is a settlement offer for {client_first_name} {client_last_name}, (Debtor) concerning a debt owed to (Creditor), who claims the amount to be owed on Account Number:&lt;br /&gt;&lt;br /&gt;{account_number} is $(AMOUNT).&amp;nbsp;&lt;br /&gt;&lt;br /&gt;Please accept this offer to settle this account under the following conditions:&lt;br /&gt;&lt;br /&gt;The parties agree to settle the account in full for the sum of $(AMOUNT) and this amount is accepted as full and total payment on said debt provided the following is met.&amp;nbsp;&lt;/p&gt;\n&lt;ul&gt;\n&lt;li&gt;{client_first_name} {client_last_name} will pay cashiers check of $(AMOUNT) if the debt is considered paid in full and reported as such to the credit reporting agencies.&amp;nbsp;&lt;/li&gt;\n&lt;/ul&gt;\n&lt;ul&gt;\n&lt;li&gt;The creditor agrees to freeze the account without any additional fees or interest being added to the balance, provided debtor fulfills the agreed upon settlement obligations.&amp;nbsp;&lt;/li&gt;\n&lt;/ul&gt;\n&lt;ul&gt;\n&lt;li&gt;The account is marked: (list status terms you are requesting such as &amp;ldquo;paid in full&amp;rdquo;, &amp;ldquo;settled in full&amp;rdquo;, &quot;Paid as agreed&quot;, &amp;ldquo;settled for less&amp;rdquo;, &amp;ldquo;deleted&amp;rdquo; etc.)&amp;nbsp;&lt;/li&gt;\n&lt;/ul&gt;\n&lt;p&gt;This agreement shall be governed under the laws of (STATE), and shall be binding. If the above terms are acceptable to (CREDITOR), please respond in writing, on your company letterhead, acknowledging your acceptance and the terms as you agree to them.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;As soon as I receive your acceptance of this offer, I will express mail a cashiers&amp;rsquo; check.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;&amp;nbsp;________________________________&lt;br /&gt;Creditor name&lt;/p&gt;\n&lt;p&gt;________________________________&lt;br /&gt;Creditor: Title:&lt;/p&gt;\n&lt;p&gt;I agree to the terms listed above:&amp;nbsp; Yes____ No____&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;&amp;nbsp;_______________________________________&lt;br /&gt;Creditor\'s Authorized Signature&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; Date&lt;/p&gt;', '0', '2013-01-07 12:17:45', '1', 21, 'system','Settlement offer to creditor with payment terms and reporting requirement.','- N/A','Creditor'),
(39, 3, 'Debt Settlement Offer (Alternate 3)', '<p>**************************Instructions - Delete Before Printing**************************<br />Send this only if the Creditor or Collections Agent has already agreed by phone or correspondance.<br />**************************Instructions - Delete Before Printing**************************&nbsp;</p>\n<p>{client_first_name} {client_last_name}<br />{client_address}&nbsp;</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}&nbsp;</p>\n<p>Re: Account Number: {account_number}.&nbsp;</p>\n<p>Dear {creditor_name},&nbsp;</p>\n<p>This is to confirm our conversation on ___________ as to the offer of the above stated account. As discussed, I will pay your company the amount of $________ as payment in full for the final satisfaction of this account.&nbsp;&nbsp;</p>\n<p>Upon receipt of the above payment, your company has agreed to change the entry on my credit reports from: _____________________ to (list status terms you are requesting, such as &ldquo;paid in full&rdquo;, &ldquo;settled in full&rdquo;, \"Paid as agreed\", &ldquo;settled for less&rdquo;, &ldquo;deleted&rdquo; etc.) .&nbsp;&nbsp;</p>\n<p>If you agree with these terms, please acknowledge with your signature and return it to me. You agree the terms herein are confidential and you have the authority to make such decisions. No payment will be made without written confirmation.&nbsp;</p>\n<p>Upon receipt of this signed acknowledgment, I will immediately mail you funds priority mail. This is not a renewed promise to pay but rather a restricted offer only. If no terms can be met, no new arrangements will be made and the offer will be void.&nbsp;</p>\n<p>_________________________________<br />Name of Creditor&nbsp;</p>\n<p>________________________________________<br />Creditor&rsquo;s Authorized Signature&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Date</p>\n<p>_________________________________<br />Name Of Creditor&rsquo;s Authorized Representative</p>\n<p>&nbsp;_________________________________<br />Position or Title:&nbsp;</p>', '0', '2013-01-07 12:18:40', '1', 22, 'system','Written settlement agreement with creditor after previously negotiating a settlement amount.','- N/A','Creditor'),
(40, 3, 'Debt Settlement Offer to Dismiss Court Judgment', '<p>{client_first_name} {client_last_name}<br />{client_address}&nbsp;</p>\n<p>{creditor_name}<br />{creditor_address}&nbsp;</p>\n<p>To: Judgment Creditor, {creditor_name}&nbsp;</p>\n<p>From: Judgment Debtor, {client_first_name} {client_last_name}&nbsp;</p>\n<p>Case number:&nbsp; (CASE NUMBER)&nbsp;</p>\n<p>Judgment amount:&nbsp; (AMOUNT)&nbsp;</p>\n<p>Date: {curr_date}&nbsp;</p>\n<p>Dear Sir,&nbsp;&nbsp;</p>\n<p>I am aware of the money due you and of the judgment placed against me for this money. I had every intention of taking care of this prior to the entry of the judgment, but unfortunately time constraints ended that chance.&nbsp;</p>\n<p>Today I am writing to you so that we may put this matter behind us and settle out this judgment for good, under a few conditions. This will save you time and money trying to collect the judgment and will help me recover from your negative entry against me.&nbsp;</p>\n<p>I have been offered an amount from a close family member to pay you $(AMOUNT) to settle the debt in full and have the judgment dismissed.&nbsp;&nbsp;</p>\n<p>As the judgment creditor, you reserve the right to dismiss or vacate the judgment as well as entering it. If I pay you from this offer letter saving you immense time, fees and paperwork, you can then file a simple paper with the courts dismissing the judgment.&nbsp;</p>\n<p>My offer is to pay you in exchange for the dismissal so that we have both gained something from this unfortunate situation. It is extremely important that you dismiss the judgment rather than satisfying it, because a satisfied judgment really looks no better for me than a filed judgment.&nbsp;</p>\n<p>With a dismissed judgment I can justify paying you. Upon your signed approval of this offer, I will forward the full settlement to you immediately. I understand this offer is void if I do not send you $(AMOUNT) within 5-10 days of your signed confirmation.&nbsp;&nbsp;</p>\n<p>If you agree to \"dismiss\" the judgment upon full and final payment of $(AMOUNT), then please sign and return this offer and acceptance.&nbsp;</p>\n<p>Offer Accepted and Agreed,&nbsp;</p>\n<p>________________________________________<br />Judgment Creditor Signature&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Date</p>\n<p>________________________________________<br />Judgment Creditor Authorized Representative&nbsp;</p>\n<p>On behalf of:<br /><br />&nbsp;________________________________________<br />Judgment Creditor Company Name</p>', '0', '2013-01-07 12:19:15', '1', 23, 'system','Settlement offer to creditor to vacate or dismiss judgment with terms.','- N/A','Creditor'),
(41, 3, 'Unilateral Release of Claims (Include with Settlement Offer Before Payment)', '<p>{client_first_name} {client_last_name}<br />{client_address}&nbsp;</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}&nbsp;</p>\n<p>Re: Account Number: {account_number}. Balance to be paid: $__________&nbsp;</p>\n<p>Dear {creditor_name}&nbsp;</p>\n<p>Per our agreement to settle the above mentioned debt, I am requesting that you sign this unilateral release form. This form confirms that we both agreed to settle the debt listed above for the amount indicated.&nbsp;</p>\n<p>Creditors/Agency Name: _________________________________&nbsp;</p>\n<p>We agree that to accept $_______ as \"payment in full\" for account number: {account_number}.&nbsp;</p>\n<p>For: {client_first_name} {client_last_name}&nbsp;</p>\n<p>We will accept this amount as full and final satisfaction and we will have no future claims against this account or debtor. This Unilateral Release ensures that we understand we have accepted a settlement on this debt and will not pursue the debtor later for any deficiency balance.&nbsp;</p>\n<p>________________________________________<br />Creditor&rsquo;s Authorized Signature&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date&nbsp;</p>\n<p>_________________________________<br />Printed name of Creditors Authorized Rep.</p>\n<p>_________________________________<br />Position or Title:</p>\n<p>&nbsp;</p>', '0', '2013-01-07 12:20:25', '1', 24, 'system','Agreement with creditor to confirm settlement offer and waive all future claims.','Separate Settlement Offer','Creditor'),
(42, 3, 'Cashed Check Constitutes Payment in Full', '&lt;p&gt;(*NOTE: THIS LETTER IS IN TWO PARTS. DELETE THE SECTIONS THAT YOU DO NOT NEED)&lt;/p&gt;\n&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city}, {creditor_state} {creditor_zip}&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;Re: {client_first_name} {client_last_name} , Account number: {account_number}&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern:&lt;/p&gt;\n&lt;p&gt;This letter concerns the money I owe you. I have received bills from you stating that I owe (AMOUNT OF BILL). However, I am disputing the amount owed to you because of the following reasons:&lt;/p&gt;\n&lt;p&gt;(LIST REASONS FOR DISPUTE)&lt;/p&gt;\n&lt;p&gt;I feel I owe you no more than $(ENTER AMOUNT). It is obvious that there is a good faith dispute over this bill.&lt;/p&gt;\n&lt;p&gt;To settle this debt, I will send you a check for $(ENTER AMOUNT) with a restrictive endorsement; if you cash that check it will constitute an accord and satisfaction. In other words; you will receive from me a check that states &quot;cashing of this check constitutes payment in full.&quot; If you cash this check, that check will clear away any debt that I owe you.&lt;/p&gt;\n&lt;p&gt;If agreed, please sign and return this letter.&lt;/p&gt;\n&lt;p&gt;Thank you for your time and assistance.&lt;/p&gt;\n&lt;p&gt;Sincerely yours,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_________________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;\n&lt;p&gt;&lt;br /&gt;Agreed to and accepted to on this _______ day of _____________, _______.&lt;/p&gt;\n&lt;p&gt;By:&lt;/p&gt;\n&lt;p&gt;_________________________________________&lt;br /&gt;(Creditor Representative\'s Signature)&lt;/p&gt;\n&lt;p&gt;Name (print):______________________________&lt;/p&gt;\n&lt;p&gt;Title (print):______________________________&lt;/p&gt;\n&lt;p&gt;Company (print):______________________________&lt;/p&gt;\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;LETTER 2 (OF 2) TO BE SENT WITH YOUR CHECK** (AFTER 30 DAYS):&lt;/p&gt;\n&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city}, {creditor_state}, {creditor_zip}&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;Re: Account number: {account_number}&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern:&lt;/p&gt;\n&lt;p&gt;Enclosed is a check for $(Amount) to cover the balance of Account Number: {account_number}.&lt;/p&gt;\n&lt;p&gt;This check is tendered in accordance with my letter dated (Date of First Letter). If you cash this check, you agree that my debt has been paid off in full.&lt;/p&gt;\n&lt;p&gt;Sincerely yours,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_________________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;\n&lt;p&gt;(**Important: Write on the bottom of the check on the front along the top or bottom the exact language you used in the second letter&quot;This check is tendered in accordance with my letter of (DATE OF FIRST LETTER). If you cash this check you agree that my debt is paid in full.&quot;)&lt;/p&gt;', '0', '2013-01-07 12:22:01', '1', 25, 'system','Settlement offer to creditor with stipulation payment was in full.','- N/A','Creditor'),
(43, 3, 'Request Smaller Payments (Short Term)', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city}, {creditor_state} {creditor_zip}</p>\n<p>{curr_date}</p>\n<p>Re: Account number: {account_number}, Request for Reduced Payments</p>\n<p>To Whom It May Concern:</p>\n<p>In my current financial situation, I am unable to pay the required monthly payments as originally agreed. My financial position is described below:</p>\n<p>(STATE REASON)</p>\n<p>I am able to pay $_____ per month starting on ________________, and I expect to resume making the full monthly payment on or before _____________________.</p>\n<p>It would help me so much if you would accept this reduced payment schedule. If necessary, you may add the unpaid amount to the end of the account period and extend it by the appropriate number of months.</p>\n<p>Thank you for your consideration and understanding. Please let me know within 20 days if the foregoing proposal is acceptable.</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 12:22:34', '1', 26, 'system','Request lower monthly payments from creditor.','- N/A','Creditor'),
(44, 3, 'Request Smaller Payments (Long Term)', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city}, {creditor_state} {creditor_zip}</p>\n<p>{curr_date}</p>\n<p>Re: Account number: {account_number}, Request for Reduced Payments</p>\n<p>To Whom It May Concern:</p>\n<p>In my current financial situation, I am unable to pay the required monthly payments as originally agreed. My financial position is described below:</p>\n<p>(STATE REASON)</p>\n<p>I am able to pay $_____ per month starting on ________________, and I expect to resume making the full monthly payment on or before _____________________.</p>\n<p>It would help me so much if you would accept this reduced payment schedule. If necessary, you may add the unpaid amount to the end of the account period and extend it by the appropriate number of months.</p>\n<p>Thank you for your consideration and understanding. Please let me know within 20 days if the foregoing proposal is acceptable.</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 12:23:07', '1', 27, 'system','Request lower monthly payments from creditor for a specific time period.','- N/A','Creditor'),
(45, 3, 'Request No Payments (Short Term)', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city}, {creditor_state} {creditor_zip}</p>\n<p>{curr_date}</p>\n<p>Re: Account number: {account_number}, Request for Reduced Payments</p>\n<p>To Whom It May Concern:</p>\n<p>In my current financial situation, I am unable to pay the required monthly payments as originally agreed. My financial position is described below:</p>\n<p>(STATE REASON)</p>\n<p>At the present time, I cannot make any payments. I expect to resume making the full monthly payment when the following occurs:</p>\n<p>(STATE REASON)</p>\n<p>If necessary, you may add the unpaid amount to the end of the account period and extend it by the appropriate number of months.</p>\n<p>Thank you for your consideration and understanding. Please let me know within 20 days if the foregoing proposal is acceptable.</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 12:24:42', '1', 28, 'system','Notify creditor no payments will be made short term and request missed payments to be added to end of term.','- N/A','Creditor'),
(46, 3, 'Request No Payments (Long Term)', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br />(CREDITOR Address)<br />{creditor_city}, {creditor_state} {creditor_zip}</p>\n<p>{curr_date}</p>\n<p>Name(s) on account: {client_first_name} {client_last_name}</p>\n<p>Account number: {account_number}</p>\n<p>Re: Request for Reduced Payments</p>\n<p>To Whom It May Concern:</p>\n<p>In my current financial situation, I am unable to pay the required monthly payments as originally agreed. My financial position is described below:</p>\n<p>(STATE REASON)</p>\n<p>Due to my desperate financial situation, I cannot make any payments for the indefinite future.</p>\n<p>(DESCRIBE YOUR HARDSHIP)</p>\n<p>I promise to inform you immediately should my financial condition improve and I am able to resume sending you normal payments.</p>\n<p>Thank you for your consideration and understanding. Please let me know within 20 days if the foregoing proposal is acceptable.</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 12:25:26', '1', 29, 'system','Notify creditor no payments will be made unless financial situation changes.','- N/A','Creditor'),
(47, 3, 'Remove Hard Inquiry', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city}, {creditor_state} {creditor_zip}</p>\n<p>{curr_date}</p>\n<p>To Whom it May Concern,</p>\n<p>According to my most recent credit report, your company is currently reporting to the three credit bureaus that I applied for credit with your organization. I did not grant you authorization to review my credit report.</p>\n<p>The Fair Credit Reporting Act requires that a creditor be able to verify the written authorization of the consumer giving the creditor permission to review their credit. If you can provide a copy of a credit application authorizing the disclosure of my credit files with my signature, I will accept the inquiry. If a signed authorization cannot be found please remove the inquiry from the three main credit bureaus.</p>\n<p>The presence of this inquiry is adversely affecting my credit report and is impeding my ability to obtain necessary credit. Time is of the essence so I would greatly appreciate a response from you within thirty (30) days.</p>\n<p>Please mail me the copy of the signed application or a letter indicating your intention to delete the inquiry.</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 12:26:22', '1', 30, 'system','Demand creditor to provide signature or remove inquiry.','- N/A','Creditor'),
(48, 3, 'Remove Hard Inquiry (Alternate)', '<p>{client_first_name} {client_last_name}<br />{client_address}&nbsp;</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}</p>\n<p>{curr_date}&nbsp;</p>\n<p>Re: Unauthorized Credit Inquiry&nbsp;</p>\n<p>To Whom It May Concern,&nbsp;</p>\n<p>I received a copy of my credit report today and discovered a hard inquiry from your company. I do not recall authorizing this inquiry and I would like to see the application of credit. Under the Fair Credit Reporting Act, no one may access my credit without my permission for the purpose of extending credit.&nbsp;&nbsp;</p>\n<p>I am sending this letter certified mail for my protection as well as yours. Please forward proof to me at your earliest convenience or send a request to the credit bureaus that you report to if you discover this was an error.&nbsp;</p>\n<p>It is urgent that I hear from you urgently, as this hard inquiry is impacting my credit score.&nbsp;</p>\n<p>I anticipate your response.&nbsp;</p>\n<p>Sincerely,&nbsp;</p>\n<p>{client_signature}<br />____________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 12:27:59', '1', 31, 'system','Demand creditor to provide signature or remove inquiry.','- N/A','Creditor'),
(49, 3, 'Dispute Item', '&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city}, {creditor_state} {creditor_zip}&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern,&lt;/p&gt;\n&lt;p&gt;Your company is currently reporting a negative listing to the three major credit bureaus (Experian, Trans Union, and Equifax) regarding the above referenced account. Based on my recollection and my records, I can find no reason for you reporting such a history. If you\'ll review your records I think that you will find your reported notations are inaccurate.&lt;/p&gt;\n&lt;p&gt;The erroneous status of your credit reporting agency records is unacceptable and is preventing me from obtaining necessary financing. Pursuant to Title 15, Section 1666 of the United States Code, I formally request the following documentary evidence pertaining to my account:&lt;/p&gt;\n&lt;p&gt;A summary of all account activities, including all payments made, late charges, interest, date of payments received, date of payments posted, charges made and date of charges posted.&lt;/p&gt;\n&lt;p&gt;Copies of all documents and financial instruments used to pay the disputed late payments.&lt;/p&gt;\n&lt;p&gt;Copies of all charge slips, invoices, promissory notes, and all other documents proving indebtedness.&lt;/p&gt;\n&lt;p&gt;This information and documentation is critical and time is of the essence. Within less than thirty (30) days, I will be damaged partially because of the discrepancy with your reported records. The above noted code requires your response within thirty (30) days. Your prompt attention will be greatly appreciated. I hereby request that your response be mailed to the address listed below.&lt;/p&gt;\n&lt;p&gt;If you find that your information and documentation does not support the negative history reported to the three credit bureaus, I invite you to submit a completed Universal Data Form to said bureaus in order to remove the negative notations. Upon removal of the negative notations, I agree to hold your company harmless from any and all inconvenience and/or damage related thereto.&lt;/p&gt;\n&lt;p&gt;Sincerely,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_________________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;', '0', '2013-01-07 12:28:42', '1', 32, 'system','Demand to remove inaccurate information from credit report.','- N/A','Creditor'),
(50, 3, 'Dispute Item (Alternate)', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_address}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>I have recently received a copy of my credit report. The report had an account listed from your company as a credit card. I disputed the account with the credit bureau as \"not mine\" but it recently came back as verified.</p>\n<p>{dispute_item_and_explanation}</p>\n<p>I am writing this letter to you in an effort to get this removed. Please delete your information from my credit reports. I have never had an account with your company. If someone has opened an account in my name, please close it immediately before further harm is done.</p>\n<p>I am requesting that you notify all of credit bureaus that this account is \"disputed\" or that you delete this account until this matter is resolved. This is required by the Fair Credit Reporting Act. If there is any paperwork that I need to sign to confirm that this account is not mine, please send me the required documents.</p>\n<p>This is a written dispute of the this account per the Fair Credit Reporting Act, the Fair Debt Collection Practices Act and the Fair Credit Billing Act. Please be aware that I am exercising all of my rights per these laws and all other applicable laws protecting me.</p>\n<p>Sincerely,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 12:39:31', '1', 33, 'system','Demand creditor to remove inaccurate information from credit report.','- N/A','Creditor'),
(51, 3, 'Validation of Debt (Simple)', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}<br /><br />{curr_date}</p>\n<p>Re: Account # {account_number}</p>\n<p>To Whom It May Concern,<br /><br />I dispute your claims in their entirety and I am requesting validation from you pursuant to the Fair Debt Collection Practices Act, 15 USC 1692g Sec. 809 (8) (FDCPA).</p>\n<p>Sincerely,<br /><br /></p>\n<p>{client_signature}<br />____________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 12:40:32', '1', 34, 'system','Simple demand to creditor demanding to provide validation of account details. Not specific, very general.','- N/A','Creditor'),
(52, 3, 'Validation of Debt (Alternate)', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br /> {creditor_address}&nbsp;<br /> {creditor_city},&nbsp;{creditor_state}&nbsp;{creditor_zip}<br /><br />Re: &nbsp;Remove Inaccurate Information from my Credit Reports.&nbsp;Account #{account_number}&nbsp;</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>This letter is a formal complaint that you are reporting inaccurate and incomplete credit information.</p>\n<p>I am distressed that you have included the information below in my credit profile and that you have failed to maintain reasonable procedures in your operations to assure maximum possible accuracy in the credit reports you publish. Credit reporting laws ensure that bureaus report only 100% accurate credit information. Every step must be taken to assure the information reported is completely accurate and correct. The following information therefore needs to be re-investigated.</p>\n<p>Account #{account_number}&nbsp;<br />{dispute_item_and_explanation}&nbsp;</p>\n<p>I respectfully request to be provided proof of this alleged item, specifically the contract, note or other instrument bearing my signature.</p>\n<p>Failing that, the item must be deleted from the report as soon as possible. The listed item is entirely inaccurate and incomplete, and as such represents a very serious error in your reporting. Please delete this misleading information and supply a corrected credit profile to all creditors who have received a copy within the last six months, or the last two years for employment purposes.</p>\n<p>Additionally, please provide the name, address, and telephone number of each credit grantor or other subscriber.</p>\n<p>Under federal law, you have thirty (30) days to complete your re-investigation. Be advised that the description of the procedure used to determine the accuracy and completeness of the information is hereby requested as well, to be provided within fifteen (15) days of the completion of your re-investigation.</p>\n<p>Sincerely,<br /><br /></p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 12:52:46', '1', 35, 'system','Demand to creditor to provide documentation or delete inaccurate information from credit report.','- N/A','Creditor'),
(53, 3, 'Validation of Debt (Alternate 2)', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br /> {creditor_address}&nbsp;<br /> {creditor_city},&nbsp;{creditor_state}&nbsp;{creditor_zip}</p>\n<p>{curr_date}<br /><br />Re: &nbsp;Account #{account_number}&nbsp;</p>\n<p>To Whom It May Concern,</p>\n<p>This letter is a formal complaint that you are reporting inaccurate and incomplete credit information. I am distressed that you have included the information below in my credit profile and that you have failed to maintain reasonable procedures in your operations to assure maximum possible accuracy in the credit reports you publish.</p>\n<p>Credit reporting laws ensure that bureaus report only 100% accurate credit information. Every step must be taken to assure the information reported is completely accurate and correct.</p>\n<p>The following information therefore needs to be re-investigated:</p>\n<p>{dispute_item_and_explanation}</p>\n<p>I respectfully request to be provided proof of this alleged item, specifically the contract, note or other instrument bearing my signature. Failing that, the item must be deleted from the report as soon as possible:</p>\n<p>The listed item is entirely inaccurate and incomplete, and as such represents a very serious error in your reporting. Please delete this misleading information and supply a corrected credit profile to all creditors who have received a copy within the last six months, or the last two years for employment purposes.</p>\n<p>Additionally, please provide the name, address, and telephone number of each credit grantor or other subscriber.</p>\n<p>Under federal law, you have thirty (30) days to complete your re-investigation. Be advised that the description of the procedure used to determine the accuracy and completeness of the information is hereby requested as well, to be provided within fifteen (15) days of the completion of your re-investigation.</p>\n<p>Sincerely,<br /><br /></p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 12:54:30', '1', 36, 'system','Demand to creditor requesting copy of contract or the removal of the item from credit report.','- N/A','Creditor');
INSERT INTO `crd_letter_templ` (`itempl_id`, `itempl_catgid`, `vtempl_title`, `vtempt_text`, `efavorite`, `dtempl_createdon`, `estatus`, `iOrder`, `vadded_by`,`letter_description`,`documents_needed`,`recipient`) VALUES
(54, 3, 'Validation of Debt (Alternate 3)', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city}, {creditor_state} {creditor_zip}</p>\n<p>{curr_date}</p>\n<p>Re: Acct # {account_number}</p>\n<p>To Whom It May Concern:</p>\n<p>I am sending this letter to you in response to the notice I received from you on (date of letter). Please be advised that this is not a refusal to pay, but a notice sent pursuant to the Fair Debt Collection Practices Act, 15 USC 1692g Sec. 809 (b) that your claim is disputed and validation is requested.</p>\n<p>This is NOT a request for \'verification\' or proof of my mailing address, but a request for \'VALIDATION\' made pursuant to the above named Title and Section. I respectfully request that your office provide me with factual evidence that I have any legal obligation to pay you.</p>\n<p>Please provide me with the following:</p>\n<p>-What the money you say I owe is for;</p>\n<p>-Explain and show me how you calculated what you say I owe;</p>\n<p>-Provide me with copies of any papers that show I agreed to pay what you say I owe;</p>\n<p>-Provide a verification or copy of any judgment if applicable;</p>\n<p>-Identify the original creditor;</p>\n<p>-Prove the Statute of Limitations has not expired on this account;</p>\n<p>-Show me that you are licensed to collect in my state; and</p>\n<p>-Provide me with your license numbers and Registered Agent.</p>\n<p>If your offices have reported invalidated information to any of the three major Credit Bureau\'s (Equifax, Experian or TransUnion), said action might constitute fraud under both Federal and State Laws. Due to this fact, if any negative mark is found on any of my credit reports by your company or the company that you represent I will not hesitate to bring legal action against you for the following:</p>\n<p>-Violation of the Fair Credit Reporting Act</p>\n<p>-Violation of the Fair Debt Collection Practices Act</p>\n<p>-Defamation of Character</p>\n<p>If your offices are able to provide the proper documentation as requested, I will require at least 30 days to investigate this information and during such time all collection activity must cease and desist.</p>\n<p>Also during this validation period, if any action is taken which could be considered detrimental to any of my credit reports, I will consult with my legal counsel. This includes any information to a credit reporting repository that could be inaccurate or invalidated or verifying an account as accurate when in fact there is no provided proof that it is.</p>\n<p>If your offices fail to respond to this validation request within 30 days from the date of your receipt, all references to this account must be deleted and completely removed from my credit file and a copy of such deletion request shall be sent to me immediately.</p>\n<p>I would also like to request, in writing, that no telephone contact be made by your offices to my home or to my place of employment. If your offices attempt telephone communication with me, including but not limited to computer generated calls or correspondence sent to any third parties, it will be considered harassment and I will have no choice but to file suit. All future communications with me MUST be done in writing and sent to the address noted in this letter.</p>\n<p>This is an attempt to correct your records, any information obtained shall be used for that purpose.</p>\n<p>Kind regards,<br /><br /></p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-07 12:55:48', '1', 37, 'system','Demand and stern warning to creditor requiring validation of various account details, stopping collection efforts and removal of item from credit report.','- N/A','Creditor'),
(55, 3, 'Validation of Debt (Alternate 4)', '&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city} {creditor_state} {creditor_zip}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;{curr_date}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Re: {account_number}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern,&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;I am in receipt of your letter claiming that I owe your company for a debt. According to the Federal Fair Debt Collection Practices Act, I have a right to have the alleged debt validated by you.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;I have to date, received no proof that I owe your company any debt and I am requesting that you forward to me full and proper documentation as evidence of this alleged debt.&amp;nbsp; As per the FDCPA, it is a violation for any debt collector to pursue collection activity on an account without notifying the debtor in writing within 5 days after any communication. Additionally I am allowed 30 days to dispute the validity of the debt.&amp;nbsp; If you are unable to provide me with proper proof then you must stop attempting to collect this alleged debt.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;If you continue to claim I owe a debt that you cannot confirm with proof then you will be in direct violation of the FDCPA. Additionally, any attempt on your part to report this alleged debt to my credit reports will be a violation of the Fair Credit Reporting Act.&amp;nbsp;&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Please forward your documentation to me upon receipt of this certified letter. Please note that proper documentation is not a print out or bill from you but rather actual proof of the debt\'s existence.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Sincerely,&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;____________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;', '0', '2013-01-07 12:57:31', '1', 38, 'system','Demand and warning to comply with validation demand.','- N/A','Creditor'),
(56, 3, 'Validation of Debt (After Dispute to Bureau)', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}<br /><br />{curr_date}</p>\n<p>Re:&nbsp;Account #{account_number}&nbsp;</p>\n<p>To Whom It May Concern:</p>\n<p>Your company is reporting the below referenced account on my credit report as a collection account.</p>\n<p>{dispute_item_and_explanation}</p>\n<p>I have disputed this item with the credit reporting agency and they reported you confirmed the account as valid.</p>\n<p>In a good faith effort to resolve the matter amicably, I must demand proof of this debt, specifically the alleged contract or other instrument bearing my signature, as well as proof of your authority in this matter. Absent such proof, you must correct any erroneous reports of this past debt as mine.</p>\n<p>I am writing to request that you please provide the following information:</p>\n<p>1. Please evidence your authorization under 15 USC 1692(e) and 15 USC 1692(f) in this alleged matter.<br />2. What is your authorization of law for your collection of information?<br />3. What is your authorization of law for your collection of this alleged debt?<br />4. Please evidence your authorization to do business or operate in this state.<br />5. Please evidence proof of the alleged debt, including the alleged contract or other instrument bearing my signature.<br />6. Please provide a complete account history, including any charges added for collection activity.</p>\n<p>You have thirty (30) days from receipt of this notice to respond. Failure to respond in writing, hand-signed, and in a timely manner, will be considered a waiver to any and all of your claims in this matter, and will entitle me to presume you placed this on my credit report(s) in error and that this matter is permanently closed. Provide the proof, or correct the record and remove this invalid debt from all sources to which you have reported it.</p>\n<p>For the purposes of 15 USC 1692 et seq., this Notice has the same effect as a dispute to the validity of the alleged debt and a dispute to the validity of your claims. This Notice is an attempt to correct your records, and any information received from you will be collected as evidence should further action be necessary. This is a request for information only, and is not a statement, election, or waiver of status.</p>\n<p>{client_first_name} {client_last_name} (DO NOT SIGN)</p>', '0', '2013-01-07 13:01:39', '1', 39, 'system','Demand to creditor to validate debt and respond to a list of questions and warning that failure to comply may result in liability.','- N/A','Creditor'),
(57, 3, 'Validation of Debt (Estoppel by Silence)', '&lt;p&gt;***************Instructions Delete these before saving and sending***************&lt;br /&gt;Doctrine of Estoppel by Silence can be extremely powerful with collection agencies that have ignored your Validation of Debt requests. According to Black Law, the meaning is: Estoppel: A legally imposing bar resulting from one\'s own conduct and precluding any denial assertion regarding a fact. A doctrine that prevents a person from adopting an inconsistent position, attitude or action if it will result in injury to another. An affirmative defense alleging good faith. Estoppel by Silence: Estoppel that arises when a party is under a duty to speak but fails to. The Estoppel letter is used when you request Validation of Debt and do not get a response from the Collection Agency. It uses the &quot;Doctrine of Estoppel&quot; which tells the collection agency that their silence must mean they agree with you. This letter can be used after you have already sent two Validation of Debt requests to a collection agency.&lt;br /&gt;***************Instructions Delete these before saving and sending***************&lt;/p&gt;\n&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city}, {creditor_state} {creditor_zip}&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;Re: Account number: {account_number}&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern:&lt;/p&gt;\n&lt;p&gt;This certified letter, receipt number: ____________________ is to formally advise you that I believe your company has violated several of my consumer rights. Specifically:&lt;/p&gt;\n&lt;p&gt;You failed to validate a debt at my request, which is a FDCPA violation and you continued to report a disputed debt to the Credit Bureaus: another FCRA violation&lt;/p&gt;\n&lt;p&gt;Not only have you ignored my prior requests for validation of debt (proof attached: receipt copies or letter copies) but you continue to report this debt to the credit bureaus causing damage to my character. This letter will again request that you follow the FDCPA and please provide the following:&lt;/p&gt;\n&lt;p&gt;Validation of Debt Request&lt;br /&gt;-Proof of your right to own/collect this alleged debt&lt;br /&gt;-Balance claimed including all fees, interest and penalties&lt;br /&gt;-Contract bearing my personal signature&lt;/p&gt;\n&lt;p&gt;As you may be aware, &quot;Estoppel by Silence&quot; legally means that you had a duty to speak but failed to do so therefore, that must mean you agree with me that this debt is false. I will use the Estoppel in my defense.&lt;/p&gt;\n&lt;p&gt;I expect to receive the proof requested above within 15 days of this letter. Should you again ignore my request for validation of debt I reserve the right to sue your company for violations of my consumer rights as specified under both the FDCPA and the FCRA. I may also seek damages from you if warranted.&lt;/p&gt;\n&lt;p&gt;Kind regards,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_________________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;', '0', '2013-01-07 13:05:53', '1', 40, 'system','Demand reinvestigation and validation demand to creditor, failure warning using estoppel.','Certified mail receipts, copies of previous letters','Creditor'),
(58, 3, 'Validation of Debt (Admission by Silence)', '<p>***************Instructions Delete these before saving and sending***************<br />This letter is similar to the Estoppel by Silence letter. This \"Admission by Silence\" will advise a collection agency of the Black Law Legal Meaning: The failure of a party to speak after an assertion of fact by another party that, if untrue, would naturally compel a person to deny the statement. This is a powerful statement! If you are right, you speak up; if you are wrong you do nothing to stand your ground. Asserting this information can cause a collections agent to think twice about who they are dealing with and to either prove it or lose it. This is a valuable Validation of Debt tool.<br />***************Instructions Delete these before saving and sending***************</p>\n<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city}, {creditor_state} {creditor_zip}</p>\n<p>{curr_date}</p>\n<p>Re: Account number: {account_number}</p>\n<p>To Whom It May Concern:</p>\n<p>This certified letter, receipt number: XXXXXXXXXXXX is to formally advise you that I believe your company has violated my consumer rights in the following ways.</p>\n<p>Specifically you: [list all that apply]</p>\n<p>- Failed to validate a debt at my request- FDCPA violation</p>\n<p>- Continued to report a disputed debt to the CRA- FCRA violation</p>\n<p>- Continued to attempt to collect a disputed debt- FDCPA violation</p>\n<p>- Ignored my cease and desist- FDCPA violation</p>\n<p>Not only have you ignored my prior requests for validation of debt (see enclosed copies of receipts letters) but you also continue to report this debt to the credit bureaus causing damage to my character. This letter will again request that you follow guidelines of The Fair Debt Collection Practices Act (FDCPA), 15 U.S.C. &sect; 1692 and please provide the following:</p>\n<p>Validation of Debt Request</p>\n<p>- Proof of your right to own/collect this alleged debt -Balance claimed including all fees, interest and penalties</p>\n<p>-Contract bearing my personal signature -License proof to collect debts in my state</p>\n<p>As you certainly are aware, \"Admission by Silence\" means that you had a legal duty to defend your position but failed to do so and if my claims were untrue you would have been compelled to deny my charges. I will use the Admission by Silence in my defense should I be summoned to court or take action against you.</p>\n<p>I expect to receive proof requested above, within 15 days of this letter. Should you continue to ignore my request for this validation of debt I reserve the right to sue your company for violations of my consumer rights as indicated under both the FDCPA and the FCRA. I may also seek damages from you if warranted.</p>\n<p>Kind regards,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 04:41:19', '1', 41, 'system','Warns creditor of past violations, demand to provide proof the debt is valid and various other demands.','Certified mail receipts, copies of previous letters','Creditor'),
(59, 3, 'Validation of Debt with Creditor Disclosure Statement', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{client_previous_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}<br />{creditor_phone}</p>\n<p>{curr_date}</p>\n<p>Certified Mail No.: _____________</p>\n<p>Re: Inquiry dated ___: account no. {account_number}</p>\n<p>To Whom It May Concern,</p>\n<p>Thank you for your inquiry. This is not a refusal to pay, but a notice that I am disputing your claim and I am requesting validation made pursuant to the Fair Debt Collection Practices Act.</p>\n<p>Please complete and return the attached disclosure request form.</p>\n<p>Understand that I am not requesting a &ldquo;verification&rdquo; that you have my mailing address, I am requesting a &ldquo;validation of debt;&rdquo; i.e.; competent and valid evidence that I have some contractual obligation to pay you.</p>\n<p>You may be aware that sending unsubstantiated demands for payment through the United States Mail System might constitute mail fraud under federal and state law. As such, you may wish to consult with a legal adviser before your next communication with me.</p>\n<p>Your failure to satisfy this request within the requirements stated in the Fair Debt Collection Practices Act will be construed as your absolute waiver of any and all claims against me, and your tacit agreement to compensate me for costs and attorney fees.</p>\n<p>{client_first_name} {client_last_name} (DO NOT SIGN)</p>\n<p><br />CREDITOR DISCLOSURE STATEMENT</p>\n<p>Name and Address of Collector (assignee):____________________________________</p>\n<p>Name and Address of Debtor:____________________________________</p>\n<p>Account Number(s):____________________________________</p>\n<p>What are the terms of assignment for this account? You may attach a facsimile of any records relating to such terms.</p>\n<p>Have any insurance claims been made by any creditor or assignee regarding this account? Yes / no</p>\n<p>Has the purported balanced of this account been used in any tax deduction claim? Yes / no</p>\n<p>Please list the exact products or/or services sold by the collector to the debtor and the dollar amount of each:</p>\n<p>Upon failure or refusal of collector to validate this collection action, collector agrees to waive all claims against the debtor named herein and pay debtor for all costs and attorney fees involved in defending this collection action.</p>\n<p><br />X_________________________________________________<br />Authorized signature for Collector Date</p>\n<p>___________________________________________________<br />Printed name</p>\n<p>Please return this completed form and attach all assignment or other transfer agreements that would establish your right to collect this debt.</p>\n<p>Your claim cannot be considered if any portion of this form is not completed and returned with the required documents. This is a request for validation made pursuant to the Fair Debt Collection Practices Act. If you do not respond as required by this law, your claim will not be considered and you may be liable for damages for continued collection efforts.</p>', '0', '2013-01-08 04:46:31', '1', 42, 'system','Demand and warning to creditor to provide a list of account details and information to prove debt is valid.','- N/A','Creditor'),
(60, 3, 'Validation of Debt with Creditor Disclosure Statement  (Alternate)', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{client_previous_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}<br />{creditor_phone}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern:</p>\n<p>This letter is sent to you in response to a notice sent to me on (Date) or in response to a listing on my credit report (CHOOSE THE ONE APPROPRIATE FOR YOUR SPECIFIC SITUATION). Be advised that this is not a refusal to pay, but a notice sent pursuant to the Fair Debt Collection Practices Act, 15 USC 1692g Sec. 809 (8), stating your claim is disputed and validation is requested.</p>\n<p>This is NOT a request for &ldquo;verification&rdquo; or proof of my mailing address, but a request for VALIDATION made pursuant to the above named Title and Section. I respectfully request your offices provide me with competent evidence that I have any legal obligation to pay you.</p>\n<p>At this time I will also inform you that if your offices have reported invalidated information to any of the 3 major Credit Bureaus (Equifax, Experian or TransUnion) this action might constitute fraud under both Federal and State Laws. Due to this fact, if any negative mark is found on any of my credit reports by your company or the company that you represent, I will not hesitate in bringing legal action against you and your client for the following:<br />Violation of the Fair Credit Reporting Act<br />Violation of the Fair Debt Collection Practices Act<br />Defamation of Character</p>\n<p>If your offices are able to provide the proper documentation as requested in the following Declaration, I will require at least 30 days to investigate this information, during which time all collection activity must cease and desist. Also during this validation period, if any action is taken which could be considered detrimental to any of my credit reports, I will consult with my legal counsel for suit. This includes any listing of any information to a credit reporting repository that could be inaccurate or invalidated. If your office fails to respond to this validation request within 30 days from the date of your receipt, all references to this account must be deleted and completely removed from my credit file and a copy of such deletion request shall be sent to me immediately.</p>\n<p>(OPTIONAL CEASE &amp; DESIST) I would also like to request, in writing, that no further telephone contact be made by your offices to my home or to my place of employment. If your offices continue to attempt telephone communication with me it will be considered harassment and I will have no choice but to file suit. All future communications with me MUST be done in writing and sent to the address noted in this letter.</p>\n<p>It would be advisable that you and your client assure that your records are in order before I am forced to take legal action.</p>\n<p>Best Regards,</p>\n<p>{client_first_name} {client_last_name} (DO NOT SIGN)</p>\n<p><br />CREDITOR/DEBT COLLECTOR DECLARATION</p>\n<p>Please provide all of the following information and submit the appropriate forms and paperwork within 30 days from the date of your receipt of this request for validation.</p>\n<p>______________________________________________________<br />Name and Address of Alleged Creditor:</p>\n<p>______________________________________________________<br />Name on File of Alleged Debtor:</p>\n<p>_____________________________________________________________<br />Alleged Account #:</p>\n<p>_____________________________________________________________<br />Address on File for Alleged Debtor:</p>\n<p>____________________________________________________________<br />Amount of alleged debt:</p>\n<p>_____________________________________________________________<br />Date that this alleged debt became payable:</p>\n<p>_____________________________________________________<br />Date of original charge off or delinquency:</p>\n<p>___________________________________________________<br />Was this debt assigned to debt collector or purchased?</p>\n<p>____________________________________________<br />Amount paid if debt was purchased:</p>\n<p>___________________________________________________________<br />Commission for debt collector if collection efforts are successful:</p>\n<p>Please attach a copy of the agreement with your client that grants (Collection Agency Name) the authority to collect this alleged debt.</p>\n<p>Also, please attach a copy of any signed agreement debtor has made with debt collector, or other verifiable proof debtor has a contractual obligation to pay debt collector.</p>\n<p>Please attach a copy of any agreement that bears the signature of debtor, wherein he/she agreed to pay creditor.</p>\n<p>Please attach copies of all statements while this account was open.</p>\n<p>Have any insurance claims been made by any creditor regarding this account? YES or NO (circle one)</p>\n<p>Have any judgments been obtained by any creditor regarding this account? YES or NO (circle one)</p>\n<p>Please provide the name and address of the bonding agent for (Name Of Debt Collector), in case legal action becomes necessary:</p>\n<p>______________________________</p>\n<p>______________________________</p>\n<p>______________________________</p>\n<p><br />_________________________________________ <br />Authorized Signature For Creditor Date</p>\n<p>__________________________<br />Print Name</p>\n<p>You must return this completed form along with copies of all requested information, assignments or other transfer agreements, which would establish your right to collect this alleged debt within 30 days from the date of your receipt of this letter. Your claim cannot and WILL NOT be considered if any portion of this form is not completed and returned with copies of all requested documents. This is a request for validation made pursuant to the Fair Debt Collection Practices Act. Please allow 30 days for processing after I receive this information back.</p>', '0', '2013-01-08 04:47:31', '1', 43, 'system','Validation demand to creditor with request for disclosure of account details. Includes demand to stop phone contact and stern legal warnings.','- N/A','Creditor'),
(61, 3, 'Validation of Debt with Creditor Disclosure Statement)  (Alternate 2)', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{client_previous_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}<br />{creditor_phone}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern:</p>\n<p>Re: Acct # XXXX-XXXX-XXXX-XXXX</p>\n<p>To Whom It May Concern:</p>\n<p>This letter is sent to you in response to a notice sent to me on (Date) or in response to a listing on my credit report (CHOOSE THE ONE APPROPRIATE FOR YOUR SPECIFIC SITUATION). This is not a refusal to pay, but a notice that your claim is disputed.</p>\n<p>Pursuant to the Fair Debt Collection Practices Act, 15 USC 1692g Sec. 809 (8) (FDCPA), I have the right to request validation of the debt you say I owe you. I am requesting proof that I am indeed the party you are asking to pay this debt, and there is some contractual obligation which is binding on me to pay this debt.</p>\n<p>Your attorney or legal staff will agree that compliance with this request is required under State and Federal Statutes.</p>\n<p>In addition to the questionnaire below, please attach copies of:</p>\n<p>Agreement with your client that grants you the authority to collect on this alleged debt, or proof of acquisition by purchase or assignment.</p>\n<p>Agreement that bears the signature of the alleged debtor wherein he or she agreed to pay the creditor.</p>\n<p>Also, please be advised this letter is not only a formal dispute, but a request for you to cease and desist any and all collection activities.</p>\n<p>I require compliance with the terms and conditions of this letter within 30 days. or a complete withdrawal, in writing, of any claim.</p>\n<p>In the event of noncompliance, I reserve the right to file charges and/or complaints with appropriate County, State &amp; Federal authorities ,the BBB and State Bar associations for violations of the FDCPA, FCRA, and Federal and State statutes on fraudulent extortion .</p>\n<p>I also hereby reserve my right to take private civil action against you to recover damages.</p>\n<p>Sincerely,</p>\n<p>{client_first_name} {client_last_name} (DO NOT SIGN)</p>\n<p><br />DEBT VALIDATION FORM</p>\n<p>Please provide all of the following information and submit the appropriate forms and paperwork within 30 days from the date of your receipt of this request for validation.</p>\n<p>Account #: ____________________</p>\n<p>Original Creditor&rsquo;s Name:</p>\n<p>_________________________________<br />Name of Debtor:</p>\n<p>______________________________________<br />Address of Debtor:</p>\n<p>___________________________________<br />Balance of Account:</p>\n<p>__________________________________<br />Date you acquired this debt:</p>\n<p>_________________________</p>\n<p>This Debt was: assigned ___purchased___</p>\n<p>Please indicate the credit bureaus which you have reported this account to:</p>\n<p>Experian: ______</p>\n<p>Equifax: ______</p>\n<p>TransUnion: _____</p>\n<p>Other: ________________________</p>', '0', '2013-01-08 04:52:09', '1', 44, 'system','Validation demand to creditor with request for disclosure of account details. Includes demand to stop collection activities and stern legal warnings/threats.','- N/A','Creditor'),
(62, 3, 'Validation of Medical Debt (HIPAA Request)', '<p>***************Instructions delete these before saving and sending***************<br />Since A large percentage of collection debts are medical related, this letter will assist you to validate a medical debt from a collection agency by referencing the HIPAA law. HIPAA stands for HEALTH INSURANCE PORTABILITY AND ACCOUNTABILITY ACT and it protects your privacy by preventing your medical records from being given to third parties without your written consent. The HIPAA law allows you to question your privacy while validating a medical debt and may also suspend reporting the collection item to your credit reports until it is resolved. Make sure that you understand the HIPAA requirements before using this letter. If they have violated HIPAA, this letter may assist you in deleting a medical collections account along with any mention of it on your credit reports!<br />***************Instructions delete these before saving and sending***************</p>\n<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city}, {creditor_state} {creditor_zip}</p>\n<p>{curr_date}</p>\n<p>Amount of debt: Date of Service: Provider of Service:</p>\n<p>To Whom It May Concern,</p>\n<p>I received a bill from you on [insert date] and as allowable under the Fair Debt Collections Practices Act, I am requesting validation of the alleged debt. I am aware that there is a debt from [name of doctor, hospital, clinic, etc.] but I am unaware of the amount due and your bill does not include a detailed breakdown of any fees.</p>\n<p>Furthermore, I am allowed under the HIPAA law (Health Insurance Portability and Accountability Act of 1996) to protect my privacy and medical records from third parties. I do not recall giving permission to [name of provider] for them to release my medical information to a third party. I understand that the HIPAA does allow for limited information about me but any details may only be revealed with the patients authorization, therefore my request is twofold and as follows:</p>\n<p>Validation of Debt and HIPAA authorization<br />- Please provide a breakdown of fees including any and all collection costs and medical charges<br />- Please provide a copy of my signature with the provider of service to release my medical information to you<br />- Immediately cease any credit bureau reporting until debt has been validated by me</p>\n<p>Please send this information to my address listed above and accept this letter, sent certified mail, as my formal debt validation request, of which I am allowed under the FDCPA.</p>\n<p>Please note that withholding the information you received from any medical provider in an attempt to be HIPAA compliant will be a violation of the FDCPA because you will be deceiving me after my written request. I am requesting full documentation of what you received from the provider of service in connection with this alleged debt.</p>\n<p>Furthermore, any reporting of this debt to the credit bureaus prior to allowing me to validate it may be a violation of the Fair Credit Reporting Act, which can allow me to seek damages from a collection agent.</p>\n<p>I await your reply with the above requested proof. Upon receiving it, I will correspond back with you by certified mail.</p>\n<p>Kind regards,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 04:55:03', '1', 45, 'system','Validation demand to creditor with request for validation of debt and HIPAA authorization and stern legal warning.','Copy of written notice or bill','Creditor'),
(63, 3, 'Goodwill Letter sent to Original Creditor', '<p>***************Instructions delete these before saving and sending***************<br />This This letter can be used with a creditor as an attempt to have them remove negative information from your reports, especially if you have been a good customer for many years and only have minor negative marks on your record with them.<br />***************Instructions delete these before saving and sending***************</p>\n<p><br />{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city}, {creditor_state} {creditor_zip}</p>\n<p>{curr_date}</p>\n<p>Re: Account number: (Account number)</p>\n<p>To Whom It May Concern,</p>\n<p>I was advised to write to you by your customer service department concerning my credit rating with your company. I have enjoyed a credit account with (company name) for many years. During the course of our business association, I have honored and respected my account agreement to the fullest. I appreciate how wonderful your service has always been.</p>\n<p>Unfortunately, 2 years ago, I was in a financial dilemma due to (job loss, health issues, new baby, etc.). As a result 3 of my payments to you were delayed. Because your account with me is extremely important I managed to borrow the money to cover the late payments. I paid those payments 30 days late on three occasions over a nine-month period but I made sure to fulfill my obligation to ensure that your company suffered no loss.</p>\n<p>I am thankful and appreciative for the years of positive credit history that I have obtained through your company but now those 3 late marks on my credit reports are causing me tremendous stress. I am trying to move up to a better paid position at my work, but the negative remarks are hurting my efforts.</p>\n<p>This is where my \"Goodwill Request\" comes in. I desperately need this promotion and I would be extremely appreciative if you would please complete a UDF - Universal Data Form and fax it to the credit bureaus to remove those entries.</p>\n<p>The credit bureaus have advised me that they will report anything as instructed to by you, but they need to have that instruction in writing. I beg that you may help me and take into consideration how good of a customer I have been and how long I have had an account with you.</p>\n<p>Kind regards,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 04:56:08', '1', 46, 'system','Request a creditor to remove late payments with an excuse. This letter is most effective on open accounts with mild late payments.','- N/A','Creditor'),
(64, 3, 'Goodwill Adjustment Letter', '&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city}, {creditor_state} {creditor_zip}&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;Re: Account number: (Account number)&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern,&lt;/p&gt;\n&lt;p&gt;I have received my credit report, from (Credit Bureau Name). I have contacted (Creditor\'s name) numerous times and even disputed it with the Credit Bureau. I am requesting a goodwill adjustment to remove the late payment(s ) in order to refinance my home. I know this request is unusual, but it is ruining my good credit standing. I have had a mishap, and realize things happen. If you look at my records, I was always on time. The late payment(s) is reported to Equifax bureau and I am requesting removal of these two late payments, as it has been reported to the bureau\'s.&lt;/p&gt;\n&lt;p&gt;Also, the account has been paid and closed for (insert number of years closed), why is this reflecting, on my credit report? Is there interest that I am unaware of?&lt;/p&gt;\n&lt;p&gt;Sincerely,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_________________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;', '0', '2013-01-08 04:56:37', '1', 47, 'system','Request a creditor to remove late payments with an excuse. This letter is most effective on open accounts with mild late payments.','- N/A','Creditor'),
(65, 3, 'Inform a Creditor that you have filed for Bankruptcy', '&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;Re: [Company] v. [Client\'s first and last name] [Account Number] Balance: $XXX&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern,&lt;/p&gt;\n&lt;p&gt;Please be advised that I filed a voluntary petition pursuant to Chapter 7 of the Bankruptcy Code. The bankruptcy case number is ______________________________ and it was filed on_______________ with you listed as one of my creditors.&lt;/p&gt;\n&lt;p&gt;To my knowledge, have never had non-sufficient funds and I am not aware of any negative entries. Kindly forward me a copy of my InformCreditorforBankruptcy record so that I may verify its accuracy.&lt;/p&gt;\n&lt;p&gt;Pursuant to 11 U.S.C. Section 362(a), you are automatically stayed by the filing of this petition from taking any action to collect any debt from me or from enforcing any lien against me. A violation of the stay may be actionable pursuant to 362(h) or as contempt of court and punishable accordingly.&lt;/p&gt;\n&lt;p&gt;Attorney name: ____________________________________&lt;br /&gt;Attorney address: _________________________________&lt;br /&gt;Attorney phone number: ____________________________&lt;/p&gt;\n&lt;p&gt;Kind regards,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_________________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;', '0', '2013-01-08 04:57:29', '1', 48, 'system','Notify creditor agency bankruptcy has been filed.','Copy of Bankruptcy Documents','Creditor'),
(66, 3, 'Inform Creditor of Bankruptcy', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city}, {creditor_state} {creditor_zip}</p>\n<p>{curr_date}</p>\n<p>Re: Account number: (ENTER ACCOUNT NUMBER)</p>\n<p>To Whom It May Concern:</p>\n<p>Please cease and desist all collection activities you have begun or are considering to take against me. I plan on filing a petition in bankruptcy court in the coming months.</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />___________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 04:58:10', '1', 49, 'system','Notify creditor bankruptcy filing is imminent and request to stop collection activity.','- N/A','Creditor'),
(67, 3, 'Reaffirming Debt After Bankruptcy', '<p>{client_first_name} {client_last_name}<br />{client_address}&nbsp;</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}<br /><br />Attn: (name of person you are speaking with)&nbsp;</p>\n<p>{curr_date}&nbsp;</p>\n<p>Re: Reaffirmation of Debt&nbsp;</p>\n<p>Dear&nbsp; (name of person you are speaking with)&nbsp;</p>\n<p>This letter acknowledges and reaffirms to (CREDITOR/FURNISHER), its successors and assignees, that in regards to a certain prior discharged debt, the undersigned agrees to remain bound on this debt in the amount of $(AMOUNT OWED; to the same extent as if the debt was not discharged in the first place.&nbsp;&nbsp;</p>\n<p>I agree to pay this debt in the following manner:&nbsp;</p>\n<p>[PROVIDE DETAILS OF THE MANNER THIS WILL BE PAID, TERMS, DOLLAR AMOUNT, ETC.]&nbsp;</p>\n<p>This agreement is binding and I understand what a debt reaffirmation is.&nbsp;&nbsp;</p>\n<p>{client_signature}<br />___________________________________<br />{client_first_name} {client_last_name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Date&nbsp;</p>\n<p>(Debtor)&nbsp;</p>\n<p>In the presence of:&nbsp;</p>\n<p>____________________________<br />(Witness)&nbsp;</p>\n<p>Notary Seal (optional)&nbsp;</p>', '0', '2013-01-08 04:58:41', '1', 50, 'system','Agreement with creditor to waive discharge of a debt that otherwise would be discharged in a bankruptcy.','Notary Seal','Creditor'),
(68, 3, 'Agreement Offer Settlement to Dismiss Judgment', '<p>***************Instructions delete these before saving and sending***************<br />Here is an effective settlement offer to a creditor to settle and dismiss a judgment<br />***************Instructions delete these before saving and sending***************</p>\n<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city}, {creditor_state} {creditor_zip}</p>\n<p>Re: Judgment - Case number: XXXXXXXXXXXX Judgment amount: $XXXXX</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>Dear Sir,</p>\n<p>I am aware of the funds due to you and of the judgment placed against me for those funds. I had every intention of taking care of this prior to the entry of the judgment, but unfortunately time constraints made that impossible for me.</p>\n<p>Today, I am writing to you in the hope that we may put this matter behind us and settle out the judgment for good, under a few conditions. This will save you both time and money trying to collect the judgment and will help me to recover from your negative entry in my credit history reports.</p>\n<p>I have been offered a loan from a close family member to pay you (amount you are offering) to settle the debt in-full and have the judgment dismissed.</p>\n<p>As the judgment creditor, you reserve the right to dismiss or vacate the judgment as well as entering it. If I pay you from this offer letter saving you immense time, paperwork and fees, you can then file a simple paper with the courts dismissing the judgment.</p>\n<p>My offer is to pay you (amount you are offering) in exchange for the dismissal so that we have both gained something from this unfortunate situation. It is extremely important that you dismiss the judgment rather than satisfying it. The reason behind my request is because a satisfied judgment looks no better on my credit report than a filed judgment. If you agree to dismiss this judgment I can justify payment.</p>\n<p>Upon your signed approval of this offer, I will forward the full settlement funds to you immediately. I understand this offer is void if I do not send you $______ within 5-10 days of your signed confirmation.</p>\n<p>If you agree to \"dismiss\" the judgment upon receiving my full and final payment of $_________, then please sign this offer and acceptance.</p>\n<p>Sincerely,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>\n<p>Date signed _________________________</p>\n<p>I agree and accept this offer,</p>\n<p><br />_________________________________________<br />Judgment creditor signature</p>\n<p><br />_________________________________________<br />Judgment creditor name</p>\n<p>Date signed _________________________</p>', '0', '2013-01-08 04:59:49', '1', 51, 'system','Request creditor to settle judgment and remove from credit report.','- N/A','Creditor'),
(69, 3, 'Agreement to Dismiss Court Judgment', '<p>***************Instructions delete these before saving and sending***************<br />If you have been successful in getting a creditor to agree to dismissing a judgment, congratulations on a huge accomplishment! - Here is the letter you need to complete and finalize the deal.<br />***************Instructions delete these before saving and sending***************</p>\n<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city}, {creditor_state} {creditor_zip}</p>\n<p>Re: Account number</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>Court Name and Location:</p>\n<p>Judgment Creditor:</p>\n<p>Judgment Debtor:</p>\n<p>Case Number: Amount of Judgment: Date of Entry:</p>\n<p>We the undersigned Judgment Creditor and Judgment Debtor have both agreed to settle this matter and hereby jointly apply to the court for an order that this judgment involved (court case number and date entered) shall be set aside and dismissed.</p>\n<p>Signed:</p>\n<p>Judgment Credit: _________________________ Judgment Debtor: ________________________</p>\n<p>Name (printed): _________________________ Name (printed): ________________________</p>\n<p>Date signed: _________________________ Date signed: ________________________</p>', '0', '2013-01-08 05:00:41', '1', 52, 'system','Request creditor to agree to dismiss judgment.','- N/A','Creditor'),
(70, 3, 'Judgment Proof letter', '&lt;p&gt;***************Instructions delete these before saving and sending***************&lt;br /&gt;You may be judgment proof if you are retired, disabled, unemployed or on welfare. - A creditor will often consider these facts before wasting time and money in coming after you. If you have the ability to offer any proof to show that you are &amp;ldquo;judgment proof,&amp;rdquo; enclose it with your letter. If you are unsure and think you may be sued, we suggest contacting a qualified attorney in your state to see your options. If you honestly are judgment proof, most creditors will not waste the expense of taking you to court.&lt;br /&gt;***************Instructions delete these before saving and sending***************&lt;/p&gt;\n&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city}, {creditor_state} {creditor_zip}&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;Re: Account number / Debtor\'s name&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern,&lt;/p&gt;\n&lt;p&gt;Please be advised that I have received your letter requesting money for the above debt. This letter, sent certified mail, receipt number_______________ is to formally advise you that I cannot pay this debt and have no attachable income or assets to levy.&lt;/p&gt;\n&lt;p&gt;I believe that I am judgment proof and I can prove it if necessary in a court of law. Should you attempt to file suit against me I will provide the court with valid proof of my situation.&lt;/p&gt;\n&lt;p&gt;My circumstances are that I am judgment proof because :&lt;/p&gt;\n&lt;p&gt;( list reasons:) I have no assets, no home or car (to attach), no income and no prospects and; I am disabled, unemployed, on social security or welfare.&lt;/p&gt;\n&lt;p&gt;I understand the debt is due, however your repeated attempts to collect are causing me much stress and therefore I must also ask you to cease and desist you (if the account is being pursued by a third party debt collector). If my situation changes, I will contact you immediately.&lt;/p&gt;\n&lt;p&gt;Kind regards,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_________________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;', '0', '2013-01-08 05:01:43', '1', 53, 'system','Inform creditor you are judgment proof and demand cease and desist collection efforts.','- N/A','Creditor'),
(71, 3, 'Judgment Proof Letter (Alternate)', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city}, {creditor_state} {creditor_zip}</p>\n<p>{curr_date}</p>\n<p>Re: Account number: {account_number} - Request for Reduced Payments</p>\n<p>To Whom It May Concern:</p>\n<p>Due to my desperate financial situation, I am unable to make payments on my account as originally agreed. My financial position is as follows:</p>\n<p>(STATE REASON; FINANCIAL, MEDICAL, DISABILITY, UNEMPLOYED, ETC.)</p>\n<p>I cannot work sufficient hours to meet my current expenses. My only sources of income are the following:</p>\n<p>(LIST SOURCES OF INCOME)</p>\n<p>I am familiar with the law and have been advised that I am \"judgment proof.\" If I should file for bankruptcy, I will claim all of my property as exempt. If you sue me and obtain judgment, you will not be able to collect any of my property to satisfy the judgment.</p>\n<p>Please cease all collection activities you have taken or are considering. While I will absolutely present you with reasonable financial or medical information, I must avoid stress (including high-pressure collections activity and lawsuits).</p>\n<p>I promise to inform you immediately should my financial condition improve and I am able to resume sending you normal payments.</p>\n<p>Thank you for your consideration and understanding.</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 05:10:29', '1', 54, 'system','Notify creditor that assets and income are exempt and suing would be a fruitless endeavor and also to demand collection efforts to stop.','Documents that prove insolvency.','Creditor'),
(72, 3, 'Request Original Creditor to Take Back Debt from Collection Agency', '&lt;p&gt;***************Instructions delete these before saving and sending***************&lt;br /&gt;This can be a very useful letter if you have a collection agency that has been abusive to you for a valid debt. Even if you owe the balance and do not contest the debt, it\'s often a good idea to inform the Original Creditor that the Collection Agency was abusive, misleading or simply too aggressive and that you refuse to communicate with them any longer. If the Collections Agent did violate the law, the Original Creditor will be very motivated to take pull back your account to avoid trouble. Once the Original Creditor takes back the account, the Collections listing will be deleted from your credit history reports&lt;br /&gt;***************Instructions delete these before saving and sending***************&lt;/p&gt;\n&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city}, {creditor_state} {creditor_zip}&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;Re: Amount of debt: XXXXX Original creditor: XXXXXXXXXXXXXX Collection agency: XXXXXXXXXXXXXX Account ID: XXXXXXXXXXXXXX&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern,&lt;/p&gt;\n&lt;p&gt;On (insert date) you assigned my debt to (collection agency name). Since that time I believe they have violated the Fair Debt Collection Practices Act.&lt;/p&gt;\n&lt;p&gt;Specifically, violations are: (List all violations: called late at night, refused to allow you to validate it, told other third parties about your debt, left harassing telephone messages, refused to provide proof, harassed or intimidated you, etc. Be sure to include any proof you have).&lt;/p&gt;\n&lt;p&gt;I am aware that I had an outstanding debt with your company but I refuse to make any arrangements with a collection agency, particularly one that does not respect my rights. Now that they have violated the FDCPA, I am requesting to communicate directly with you, otherwise I may be forced to take legal action against this collection agency that represents you.&lt;/p&gt;\n&lt;p&gt;Please reply by mail to advise me if you will take the account back so that I may make arrangements with you. Upon receiving your reply I will immediately contact you.&lt;/p&gt;\n&lt;p&gt;I have forwarded a copy of this letter to the collection agency and I am including a cease and desist clause directed towards that agency. From this moment forward I will only correspond with you.&lt;/p&gt;\n&lt;p&gt;I await your reply. Upon receiving it, I will write back to you via certified mail.&lt;/p&gt;\n&lt;p&gt;Kind regards,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_________________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;\n&lt;p&gt;Certified mail receipt number:&lt;/p&gt;', '0', '2013-01-08 05:12:46', '1', 55, 'system','Inform original creditor of harassment and request to \"take back\" account from collection agency  to negotiate settlement.','Collection Notice','Creditor');
INSERT INTO `crd_letter_templ` (`itempl_id`, `itempl_catgid`, `vtempl_title`, `vtempt_text`, `efavorite`, `dtempl_createdon`, `estatus`, `iOrder`, `vadded_by`,`letter_description`,`documents_needed`,`recipient`) VALUES
(73, 3, 'Warning of VOD refusal and FDCPA violations', '&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;&amp;nbsp;{creditor_address}&lt;br /&gt;{creditor_city} {creditor_state} {creditor_zip}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;{curr_date}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Re: {account_number}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern,&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Please be apprised that you are in direct violation of the Fair Debt Collections Practices Act. In my opinion you have violated at least three sections of this act by:&amp;nbsp;&lt;/p&gt;\n&lt;ul&gt;\n&lt;li&gt;Failing to validate a debt as allowed to the debtor under 15 USC 1692 (g) Section 809 (b)&lt;/li&gt;\n&lt;li&gt;Communicating with a debtor after receiving a cease and desist certified mail under 15 USC 1692 (g) Section 805 (c)&lt;/li&gt;\n&lt;li&gt;Harassment of alleged debtor under the &quot;abuse &amp;amp; harassment&quot; subsection of the statute, USC 1692 (g) Section 806 (5)&amp;nbsp;&lt;/li&gt;\n&lt;/ul&gt;\n&lt;p&gt;I have complete and thorough records of your violations and I am prepared to protect myself and my rights from unscrupulous collection agencies.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;In (EXACT DATE), I sent by certified mail (receipt number: (CERTIFIED MAIL RECEIPT NUMBER), a request for your office to provide me with proof and evidence of the debt you alleged I owed, and I did so within 30 days of receiving your first notice. In that same letter I also included my cease and desist instructions.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;After verified delivery of my letter (via your office\'s signature), you proceeded to mail a simple bill which is NOT considered a &quot;validation of debt&quot; by any means. You may wish to familiarize yourself with what is required when validating a debt.&amp;nbsp;&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Your office also proceeded to contact me by phone after the delivery and acceptance of my certified letter. Contacting a person after a cease and desist can lead to serious trouble for your agency including damages of up to $1000.00 per incident.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;I highly doubt that this $(ENTER AMOUNT OF DEBT) debt is worth your agency\'s license and the fees and penalties for violations of the FDCPA.&amp;nbsp;&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;There is no question that you willfully violated my rights and that I could bring charges against you immediately. However, I am assuming this has been a terrible mistake on&amp;nbsp; your part and that you will take appropriate steps to enlighten yourself and your staff of such dangerous actions.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;I will also be checking my credit report to see if you have willfully reported an unverified and disputable debt to the credit bureaus. If so, that will be a violation of the Fair Credit Reporting Act. I will state again in this certified mailing that you have failed to verify the debt as accurate, you have provided no proof of this alleged debt, and I must remind you again to not contact me in any way via phone or mail in reference to collecting this debt.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;If I receive anything other than absolute proof from you, provided by the original creditor, I will assume you are harassing me and ignoring my cease and desist, and I will take action against you for these continued violations and abuse.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Sincerely,&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;____________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;', '0', '2013-01-08 05:14:18', '1', 56, 'system','Notification to creditor after previous validation response insufficient alleging violations and stern legal warning. ','Certified mail receipts, copies of previous letters','Creditor '),
(74, 3, 'Warning Violation for Expired Debt Collection', '&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city} {creditor_state} {creditor_zip}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;{curr_date}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Re: {account_number}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern,&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;In reviewing my credit reports, I came across a debt item that was listed incorrectly. I disputed this account to the credit bureaus and they confirmed it was verified as accurate by you.&amp;nbsp;&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;I am aware of the rights I have and am requesting that you immediately remove the debt from my credit reports or you may face damages by reporting inaccurate data to a credit reporting agency. (See the FCRA) This debt is listed as a charge off, with a last date of activity of ____________. You are reporting the charge off date as the date you purchased the debt instead of the actual charge off date.&amp;nbsp; This is a clear violation of the Fair Credit Reporting Act, as it is clearly stated that &quot;no debt may be reported to a consumers\' credit file for any longer than 7 years from the date of first serious delinquency or charge off.&quot;&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Because you have altered the charge off date as the date you purchased it, you are committing fraud.&amp;nbsp; I have informed the credit bureaus of this, and have asked for a second verification. When that verification comes to you, I suggest you follow the law and report the true facts. In addition to this debt being over the allowed time to report (7 years) it has also passed the statute of limitations to collect. I have no intention of paying this old expired debt and I am informing you of this now.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Should you attempt to report or collect this expired debt, I will contact my Attorney General and fill out a complaint to the Federal Trade Commission, and I will take steps to collect damages from you of up to $1,000.00. I believe I have a case against you for violating sections of the FDCPA and FCRA should you continue.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Sincerely,&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;____________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;', '0', '2013-01-08 05:16:03', '1', 57, 'system','Demand to stop collection attempts and reporting of expired debt with stern legal warning.','- N/A','Creditor '),
(75, 3, 'Warning Violation for Expired Debt Collection (Alternate)', '<p>{client_first_name} {client_last_name}<br />{client_address}&nbsp;</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}&nbsp;</p>\n<p>{curr_date}&nbsp;</p>\n<p>Re: {account_number}&nbsp;</p>\n<p>To Whom It May Concern,&nbsp;</p>\n<p>Please be advised that you are attempting to collect on an expired debt. I am invoking my right to cease you, based on factual law that this debt in question is legally expired under the Statute of Limitations.&nbsp; Accordingly, I am requesting that you do not attempt to collect this expired debt, and should you seek legal recourse I will invoke my right of the expired statute as a valid defense.&nbsp;</p>\n<p>Additionally any attempts to harm my credit history and rating by updating or changing dates after you have been informed that the debt is expired, is a direct violation of the FDCPA. Any abuse to my credit rating on your part will be met with all recourse available to me by the law.&nbsp;</p>\n<p>I am aware of how long items may remain on my credit reports and any attempt to extend the reporting time will be investigated by me, and reported to my State Attorney General and the American Collectors Association.&nbsp;</p>\n<p>I am completely aware of how long the debt may be legally collectable and how long it may be legally reportable. I realize a debt is allowed to be reported on my credit history for no longer than 7 years, and my research has shown me that often a collection agency will reset the date of original charge off to the date they purchased it, thus trying to extend the reporting time in an attempt to force a consumer into paying it. I am informing you of this knowledge so that you may do the right thing.&nbsp;</p>\n<p>I have no intentions of renewing the expired statute of limitations, so please stop wasting your time contacting me. I expect this will be the last time I hear from you.&nbsp;</p>\n<p>Sincerely,&nbsp;</p>\n<p>{client_signature}<br />____________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 05:17:16', '1', 58, 'system','Demand to stop collection attempts and reporting of expired debt with stern legal warning.','- N/A','Creditor '),
(76, 3, 'Warning of Expired Statute of Limitations', '<p>{client_first_name} {client_last_name}<br />{client_address}&nbsp;</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}&nbsp;</p>\n<p>{curr_date}&nbsp;</p>\n<p>RE: Account number {account_number}&nbsp;</p>\n<p>To Whom It May Concern,&nbsp;</p>\n<p>Please be advised that you are attempting to collect on an expired debt. I am invoking my right to cease you, based on factual law that this debt in question is legally expired under the Statute of Limitations.&nbsp;&nbsp;</p>\n<p>Accordingly, I am requesting that you do not attempt to collect this expired debt, and should you seek legal recourse I will invoke my right of the expired statute as a valid defense.&nbsp;</p>\n<p>Additionally any attempts to harm my credit rating by updating or changing dates after you have been informed that the debt is expired, are a direct violation of the FDCPA.<br /><br />Any abuse to my credit rating on your part will be met with all recourse available to me.&nbsp;</p>\n<p>I am aware of how long items may remain on my credit reports and any attempt to extend the reporting time will be investigated by me, and reported to the American Collectors Association and my State Attorney General.&nbsp;</p>\n<p>I am completely aware of how long the debt is legally collectable and how long it is legally reportable. I realize a debt is allowed to be reported to my credit for 7 years, and my research has shown me that often a collection agency will reset the date of original charge off to the date they purchased it, thus trying to extend the reporting time in an attempt to force a consumer into paying it. I am informing you of this knowledge so that you may do the right thing.&nbsp;</p>\n<p>I have no intention of renewing the expired statute of limitations, so please stop wasting your time contacting me.&nbsp;&nbsp;</p>\n<p>I expect this will be the last time I hear from you.&nbsp;</p>\n<p>Sincerely,&nbsp;</p>\n<p>{client_signature}<br />____________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 05:17:47', '1', 59, 'system','Demand to stop collection attempts and reporting of expired debt with stern legal warning.','- N/A','Creditor '),
(77, 4, 'Dispute Collections', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p><span>{creditor_name}</span><br />{creditor_address}<br />{creditor_city}, {creditor_state} {creditor_zip}</p>\n<p>{curr_date}</p>\n<p>Re: Dispute of Collections Action: Case # <span>{account_number}</span>.<br />[If a collection agency has sent written notice, your case number is likely in the letter. If you have not received a written notice from the collection agency, tailor this line accordingly. For example, show the date you were contacted by the collection agency and/or identify the creditor by name if you can.]</p>\n<p>To [person whose name appears on agency\'s notice to you]:</p>\n<p>On [date] I was contacted by [name of person who called you] of your agency, who informed me that [name of collection agency] is attempting to collect [amount of claimed debt]. This individual is collecting on behalf of [name of creditor]. [OR] This individual would not tell me for whom you are supposed to be collecting.</p>\n<p>[OR]</p>\n<p>On [date] I received a written notice of the claimed debt, a copy of which is attached.</p>\n<p>This is to inform you that I dispute the debt because [insert reason for dispute, e.g. the agency has mistaken you with someone else or the debt has been paid. Include copies, not originals, of any correspondence that support your dispute]. I am hereby requesting that you confirm the fact that I owe this debt as required by any applicable state and federal laws. Please contact the creditor to obtain verification.</p>\n<p>In addition, under the provisions of state and federal Fair Debt Collection Practices Act (FDCPA), Fair Credit Reporting Act (FCRA), and related consumer statutes, I am hereby instructing you to cease collection of the debt while efforts are made to obtain verification. Until you resolve this error with the creditor, you should neither contact me nor anyone else except the creditor about this collection.</p>\n<p>Furthermore, any reporting of this matter to credit reporting agencies is premature. Until you have investigated my dispute, you should not relay negative information to a credit reporting agency. If negative information has already been reported, you must notify the agency to remove said report until the investigative process is over so that my credit report remains accurate, or at the very least, my credit report should be updated to reflect my dispute.</p>\n<p>Your next contact with me should be to either notice that the creditor has failed to provide verification of the debt and that the matter has been closed or that you believe that this debt is valid and are providing proof of my responsibility. If the former, please confirm that I am not being held responsible for the debt in writing and also that if the account has already been noted on my credit report, that you will contact the bureau(s) in question to have the account removed. If the latter, I expect that you will provide me with an explanation as to why you have decided not to remove this account from collections and a copy of all documents relevant to the debt such as the application, bills, records of communications and payments, and any other data that indicates my responsibility.</p>\n<p>I am instructing you not to contact any third parties such as my employer, neighbors, friends or family members. In addition, you may not contact me by phone at work or at my home about this collection activity. All future correspondence should be sent to me in writing.</p>\n<p>[If you wish to still speak to a collector by phone, indicate the times when it is okay to contact you or note the name, address, and phone number of your attorney, if you have retained one.]</p>\n<p>Please acknowledge that you have received this notice by [Pick a date that is two weeks from date of letter].</p>\n<p>Sincerely,<br /><br /></p>\n<p>{client_signature}<br />_______________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 05:18:58', '1', 87, 'system','Demand collection agency to provide proof debt is valid or accurate, stop collection efforts and remove from report. ','Copy of Written Notice or Bill ','Collection Agency'),
(78, 4, 'Temporarily Stop Collections', '&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;/p&gt;\n&lt;p&gt;(Name of Collection Agency)&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city}, {creditor_state} {creditor_zip}&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;To [person whose name appears on agency\'s notice to you]:&lt;/p&gt;\n&lt;p&gt;Thank you for your recent inquiry. This is not a refusal to pay, but a notice that your claim is being disputed. This is a request for validation made pursuant to the Fair Debt Collection Practices Act.&lt;/p&gt;\n&lt;p&gt;Be advised that I am not requesting a &quot;verification&quot; that you have my mailing address, I am requesting a &quot;validation;&quot; that is, competent evidence that I have some contractual obligation to pay you.&lt;/p&gt;\n&lt;p&gt;You should also be aware that sending unsubstantiated demands for payment through the United States Mail System might constitute mail fraud under federal and state law. You may wish to consult with a competent legal advisor before your next communication with me.&lt;/p&gt;\n&lt;p&gt;Your failure to satisfy this request within the requirements of the Fair Debt Collection Practices Act will be construed as your absolute waiver of any and all claims against me, and your tacit agreement to compensate me for costs and attorney fees.&lt;/p&gt;\n&lt;p&gt;Sincerely,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_______________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;', '0', '2013-01-08 05:19:36', '1', 88, 'system','Demand collection agency to provide proof debt is valid and accurate.','- N/A','Collection Agency'),
(79, 3, 'Pay For Delete (Alternate 3)', '&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;br /&gt;&lt;br /&gt;{creditor_name}&lt;br /&gt;&lt;br /&gt;&amp;lt;CREDITOR/FURNISHER ADDRESS&amp;gt;&amp;nbsp;&lt;br /&gt;&lt;br /&gt;Dear Collection Manager:&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;It has come to my attention through the credit bureaus that you claim I owe a debt to your agency. While I have never had the debt verified to me as legitimate by your agency, I may be willing to save us both some time and effort by &quot;settling the debt out&quot; with restrictions.&amp;nbsp;&lt;br /&gt;&lt;br /&gt;I understand that you hold all the rights to report the debt to the credit bureaus as you see fit and you can change that listing at any time, as the source owning the debt. I am sure you are aware of my right to dispute this debt and to request full proof of the obligation as per the FDCPA. Paying this unverified debt means little to me if we cannot mutually agree that you will report the debt as mentioned below.&amp;nbsp;&lt;br /&gt;&lt;br /&gt;While I realize that your purpose is to collect debts as a collection agent, I am also aware of what a paid collection on my report would represent for me, which is not favorable. That being said, I know that you have the absolute right to report this debt as you see fit or not report it at all. It is only unlawful to report false information but you may remove a listing any time at your discretion.&amp;nbsp;&lt;br /&gt;&lt;br /&gt;Please do not attempt to continue contacting me outside of this offer or I will be forced to cease and desist our communication and request full lengthy verification of the debt. My goal is to arrange a term acceptable to both.&amp;nbsp;&lt;br /&gt;&lt;br /&gt;My financial resources are limited and I am trying to do what&amp;rsquo;s right but I am realistic about my financial ability. I will pay your company the amount of $(AMOUNT) as &quot;payment in full&quot; for this account. Upon receipt of the above payment, your company has agreed to delete the item on my credit reports.&amp;nbsp;&lt;br /&gt;&lt;br /&gt;If you agree with these terms please acknowledge this letter with your signature and return it to me. You agree that the terms herein are confidential and that you have the authority to make such decisions. No payment will be made without written confirmation from you.&amp;nbsp;&lt;br /&gt;&lt;br /&gt;Upon receipt of this signed acknowledgment, I will immediately mail you a cashier\'s check by priority mail. This is not a renewed promise to pay but rather a restricted offer only. If no terms can be met, no new arrangements will be made and the offer will be void.&amp;nbsp;&lt;br /&gt;&lt;br /&gt;________________________________________&lt;br /&gt;Name of collection agency&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;________________________________________&lt;br /&gt;Signature of company officer:&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;________________________________________&lt;br /&gt;Name&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; Title&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; Date:&lt;/p&gt;', '0', '2013-01-08 05:43:48', '1', 60, 'system','Settlement offer to creditor with stipulation to remove from credit report and warning if no deal can be reached, validation and cease and desist forthcoming.','- N/A','Creditor '),
(80, 4, 'Pay for Delete (Offer Payment if Negative is Removed)', '&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city}, {creditor_state} {creditor_zip}&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;Re: {client_first_name} {client_last_name} , Account number {account_number}&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern:&lt;/p&gt;\n&lt;p&gt;On (Date), I received a copy of my credit report from (Credit Bureau Name). That report lists my payments to you as being \'delinquent.\'&lt;/p&gt;\n&lt;p&gt;My financial problems are now behind me and I am in a position to pay off this debt. I can pay a lump sum amount of $______ or I can pay installments in the amount of $______ per month for _______ months if you will agree to one of the following:&lt;/p&gt;\n&lt;p&gt;( ) If I make a lump sum payment, you will agree to remove all negative information from my credit file associated with the debt.&lt;/p&gt;\n&lt;p&gt;( ) If I agree to pay off the debt in monthly installments, you agree to \'re-age\' my account - making the current month the first repayment month and showing no late payments as long as I make the agreed upon monthly payments.&lt;/p&gt;\n&lt;p&gt;If this offer is acceptable to you, please check and initial one of the above choices, sign your acceptance below and return this letter to me in the enclosed envelope.&lt;/p&gt;\n&lt;p&gt;Thank you for your time and assistance.&lt;/p&gt;\n&lt;p&gt;Sincerely yours,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_________________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;\n&lt;p&gt;Agreed to and accepted to on this _____ day of _______________, ________.&lt;/p&gt;\n&lt;p&gt;By: ________________________________&lt;br /&gt; (Creditor Representative Signature)&lt;/p&gt;\n&lt;p&gt;Name (print): ___________________________&lt;/p&gt;\n&lt;p&gt;Company:_________________________&lt;/p&gt;\n&lt;p&gt;Title:_________________________________&lt;/p&gt;', '0', '2013-01-08 05:47:03', '1', 89, 'system','Settlement offer to collection agency stipulating removal from credit report. ','- N/A','Collection Agency'),
(81, 4, 'Pay For Delete (Alternate)', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{client_previous_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}<br />{creditor_phone}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>Re: {account_number}</p>\n<p>This letter is an offer to amicably settle the above account. It shall not be misconstrued as an acknowledgment of any liability for this debt in any form.</p>\n<p>I will pay your company the amount of $XXXX as \"full settlement of this account.\"</p>\n<p>If you accept this agreement, I will send you a money order or certified cashiers check for this settlement amount of $XXXX in exchange for a full deletion of all references regarding this account from my credit reports and full satisfaction of the debt. This agreement is binding and will be void should you not fulfill your end of this agreement. Furthermore, this debt will be deleted from my credit report at all three credit bureaus, as well as any other bureaus that your company regularly reports to.</p>\n<p>If you agree to the above, please acknowledge with your signature and return a copy to me. Upon receipt of your signed acknowledgment, I will promptly send you a money order or cashiers check in the amount I have stated above.</p>\n<p>Please note: This agreement is restricted. This is not a renewed promise to pay, but rather a restricted settlement offer only. By not signing below, you agree that the debt has not been renewed nor have any written agreements been exchanged.</p>\n<p>I look forward to resolving this matter in a speedily manner.</p>\n<p>{client_first_name} {client_last_name}</p>\n<p>Creditor&rsquo;s Authorized Signature: _____________________<br />Date:_________________<br />Name: ______________________<br />Title : _______________________</p>', '0', '2013-01-08 05:48:08', '1', 90, 'system','Settlement offer to collection agency stipulating removal from credit report. ','- N/A','Collection Agency'),
(82, 4, 'Pay For Delete (Alternate 2)', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{client_previous_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}<br />{creditor_phone}</p>\n<p>{curr_date}</p>\n<p>Dear Collection Manager:</p>\n<p>It has come to my attention, through my credit report, that you claim I owe a debt to your agency. I can save us both some effort and time by settling the debt out.</p>\n<p>Here below is my offer. This is not a renewed promise to pay, nor does it constitute any agreement unless you sign and return it. <br />Please Note that I have not yet agreed that this debt is indeed mine and I have the option to seek additional proof of this debt from your agency.</p>\n<p>Because you hold all the rights to report the debt to the credit bureaus as you see fit, you can certainly change that listing at any time as the source reporting the debt.</p>\n<p>I have no doubt that you are aware of my right to dispute this debt and request full proof of obligation. Paying this unverified debt to you has little value to me if we cannot mutually agree that you will report the debt as outlined below.</p>\n<p>While I realize that your function is to collect debts as a collection agent, I am also aware that a paid collection would not be favorable on my report. That being said, I have determined, through the bureaus, that you have the absolute right to report this debt as you see fit or not report it at all.</p>\n<p>If you indicate that you are unable to remove the negative listing on my credit report, I will be forced to cease communication and request full verification of the debt.</p>\n<p>My goal is to arrange a term that is acceptable to us both, since this debt is \"questionable.\"</p>\n<p>My Offer: I will pay your company the amount of $xx as \"payment in full for the full satisfaction of this account.\" Upon receipt of the above payment, your company will agree to change this entry on my credit reports to \"Paid\" immediately. You further agree to remove any and all previous notations of delinquency.</p>\n<p>If you approve and agree to these terms, please acknowledge with your signature and return this letter to me. You agree these terms herein are confidential and that you have the authority to make such decisions. No payment will be made without written confirmation.</p>\n<p>Upon receipt of this signed acknowledgment, I will immediately mail you funds by priority mail. This is not a renewed promise to pay but rather a restricted offer only. If no terms can be met, no new arrangements will be made, and the offer will be withdrawn.</p>\n<p>{client_first_name} {client_last_name}</p>\n<p>{creditor_name}</p>\n<p>________________________________<br />Signature of company officer</p>\n<p>________________________________<br />Print Company Officer name</p>\n<p>Date:</p>\n<p>Sincerely,</p>\n<p>Name<br />Address<br />Social security number</p>', '0', '2013-01-08 05:48:36', '1', 91, 'system','Settlement offer to collection agency stipulating removal from credit report. ','- N/A','Collection Agency'),
(83, 4, 'Pay For Delete (Alternate 3)', '&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;&lt;br /&gt;&amp;lt;CREDITOR/FURNISHER ADDRESS&amp;gt;&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Dear Collection Manager:&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;It has come to my attention through the credit bureaus that you claim I owe a debt to your agency. While I have never had the debt verified to me as legitimate by your agency, I may be willing to save us both some time and effort by &quot;settling the debt out&quot; with restrictions.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;I understand that you hold all the rights to report the debt to the credit bureaus as you see fit and you can change that listing at any time, as the source owning the debt. I am sure you are aware of my right to dispute this debt and to request full proof of the obligation as per the FDCPA. Paying this unverified debt means little to me if we cannot mutually agree that you will report the debt as mentioned below.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;While I realize that your purpose is to collect debts as a collection agent, I am also aware of what a paid collection on my report would represent for me, which is not favorable. That being said, I know that you have the absolute right to report this debt as you see fit or not report it at all. It is only unlawful to report false information but you may remove a listing any time at your discretion.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Please do not attempt to continue contacting me outside of this offer or I will be forced to cease and desist our communication and request full lengthy verification of the debt. My goal is to arrange a term acceptable to both.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;My financial resources are limited and I am trying to do what&amp;rsquo;s right but I am realistic about my financial ability. I will pay your company the amount of $(AMOUNT) as &quot;payment in full&quot; for this account. Upon receipt of the above payment, your company has agreed to delete the item on my credit reports.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;If you agree with these terms please acknowledge this letter with your signature and return it to me. You agree that the terms herein are confidential and that you have the authority to make such decisions. No payment will be made without written confirmation from you.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Upon receipt of this signed acknowledgment, I will immediately mail you a cashier\'s check by priority mail. This is not a renewed promise to pay but rather a restricted offer only. If no terms can be met, no new arrangements will be made and the offer will be void.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;________________________________________&lt;br /&gt;Name of collection agency&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;________________________________________&lt;br /&gt;Signature of company officer:&lt;/p&gt;\n&lt;p&gt;________________________________________&lt;br /&gt;Name&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; Title&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; Date:&lt;/p&gt;', '0', '2013-01-08 05:49:24', '1', 92, 'system','Settlement offer to collection agency stipulating removal from credit report. ','- N/A','Collection Agency'),
(84, 4, 'Debt Settlement Offer', '&lt;p&gt;***************Instructions Delete these before saving and sending***************&lt;br /&gt;If you have effectively agreed with a creditor or collector to settle a debt, this letter will to secure your rights for amount to be paid and credit reporting issues. Do not use this letter if the debt is disputed or expired, as doing so can renew the statute of limitations. If you agree that the debt is valid and you wish to begin negotiations you may also use this letter to present your first offer.&lt;br /&gt;***************Instructions Delete these before saving and sending***************&lt;/p&gt;\n&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city}, {creditor_state} {creditor_zip}&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;Re: Debtor\'s Settlement&lt;/p&gt;\n&lt;p&gt;Re: Account number: {account_number}&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern:&lt;/p&gt;\n&lt;p&gt;I understand that I owe a balance to your company. This letter is an offer to settle the debt for less because of my inability to pay the entire balance. Because of dire financial circumstances, [overwhelming debt, loss of job, insurance settlement with limited funds, considering bankruptcy, borrowing the money, illness, loss of family member with income, etc. List your reason here as to why you are offering to pay less.] I am only able to pay a portion of this debt.&lt;/p&gt;\n&lt;p&gt;I recognize you may be motivated as well, because of the age of the debt and my financial crisis. Declining to work with me will only make matters worse for both of us.&lt;/p&gt;\n&lt;p&gt;You are claiming the amount owed on the account is $________. Please accept my good faith offer to settle this account under these following conditions ONLY:&lt;/p&gt;\n&lt;p&gt;The parties involved agree to settle the account in full for the sum of $__________ and this amount is accepted as complete and final payment on said debt. Full discharge and settlement of all monies due will be created, provided that the amount agreed upon shall be paid as follows:&lt;/p&gt;\n&lt;p&gt;Payment terms: how debt will be paid, (i.e., three payments of $250.00 to be paid monthly on the 1st of each month, 8 payments of $200.00 on the 1st of each month after execution of this agreement, etc.)&lt;/p&gt;\n&lt;p&gt;Payment address: where you will send payment each month.&lt;/p&gt;\n&lt;p&gt;Other terms: list specific arrangements made, such as, creditor agrees to freeze the account without any additional fees or interest added to the balance etc.&lt;/p&gt;\n&lt;p&gt;Credit reporting: list all account status terms you are requesting such as &quot;paid in full&quot;, &quot;deleted&quot;, &quot;settled in full&quot;, &quot;settled for less&quot;, etc.&lt;/p&gt;\n&lt;p&gt;Governing states: This agreement shall be binding under the laws of [list your state and the creditor&amp;rsquo;s state].&lt;/p&gt;\n&lt;p&gt;If your office is in agreement with this settlement, please reply with confirmation on your company letterhead and signed by an individual with the authority to accept such offers. Time is of the essence because of my financial situation so please reply as soon as possible.&lt;/p&gt;\n&lt;p&gt;Kind regards,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_________________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;', '0', '2013-01-08 05:50:02', '1', 93, 'system','Settlement agreement to collection agency after negotiating. ','- N/A','Collection Agency'),
(85, 4, 'Debt Settlement Offer (Alternate)', '&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city} {creditor_state} {creditor_zip}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;{curr_date}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Re: Debtor\'s Settlement Offer for Account Number: {account_number}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern,&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;I am aware that I owe a balance to your company. This letter is an offer to settle the debt for less because of my inability to pay the full balance due to financial circumstances, because of:&amp;nbsp; (LIST HARDSHIPS HERE), I am only able to pay a portion of this debt.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;I realize you may be motivated as well, because of the age of the debt and my financial crisis. Refusing to work with me will only make matters worse for both of us.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;You claim the amount owed on the account is $________.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Please accept this offer to settle this account ONLY under the following conditions:&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;The parties involved agree to settle the account in full for the sum of $__________ and this amount is accepted as full and final payment on said debt. Complete discharge and settlement of all monies due will be created, provided that the amount agreed upon shall be paid in the following manner:&amp;nbsp;&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Payment terms: (i.e., 10 payments of $XXX on the 1st of each month after the execution of this agreement, 3 payments of $XXX to be paid monthly on the 1st of each month, 1 lump sum of $XXXX, etc.)&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Payment location: (ADDRESS TO SEND THE PAYMENTS&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Other terms:&amp;nbsp; (list additional arrangements made, such as, creditor agrees to freeze the account without any additional fees or interest added to the balance, etc.) Credit reporting: (list status terms you are requesting such as &amp;ldquo;paid in full&amp;rdquo;, &amp;ldquo;settled in full&amp;rdquo;, &quot;Paid as agreed&quot;, &amp;ldquo;settled for less&amp;rdquo;, &amp;ldquo;deleted&amp;rdquo; etc.)&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;This agreement shall be binding under the laws of (LIST YOUR STATE AND THE CREDITOR\'S STATE)&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;If your office agrees to this settlement, please send back confirmation on your company letterhead and signed by someone with the authority to accept such offers. Time is of the essence due to my present financial situation so please reply as soon as possible.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Sincerely,&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;____________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;', '0', '2013-01-08 05:50:30', '1', 82, 'system','Settlement offer to collection agency with payment plan. ','- N/A','Collection Agency'),
(86, 4, 'Debt Settlement Offer (Alternate 2)', '&lt;p&gt;***********************Instructions - Delete Before Printing****************************&lt;br /&gt;Send this only if the Creditor or Collections Agent has already agreed by phone or correspondence.&lt;br /&gt;***********************Instructions - Delete Before Printing****************************&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city} {creditor_state} {creditor_zip}&lt;/p&gt;\n&lt;p&gt;Attn: Attn: Settlement Dept.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;{curr_date}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Re: Debtor\'s Settlement Offer for Account Number: {account_number}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Dear Settlement Dept.:&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;This is a settlement offer for {client_first_name} {client_last_name}, (Debtor) concerning a debt owed to (Creditor), who claims the amount to be owed on Account Number:&lt;br /&gt;&lt;br /&gt;{account_number} is $(AMOUNT).&amp;nbsp;&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Please accept this offer to settle this account under the following conditions:&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;The parties agree to settle the account in full for the sum of $(AMOUNT) and this amount is accepted as full and total payment on said debt provided the following is met.&amp;nbsp;&lt;/p&gt;\n&lt;ul&gt;\n&lt;li&gt;{client_first_name} {client_last_name} will pay cashiers check of $(AMOUNT) if the debt is considered paid in full and reported as such to the credit reporting agencies.&amp;nbsp;&lt;/li&gt;\n&lt;/ul&gt;\n&lt;ul&gt;\n&lt;li&gt;The creditor agrees to freeze the account without any additional fees or interest being added to the balance, provided debtor fulfills the agreed upon settlement obligations.&amp;nbsp;&lt;/li&gt;\n&lt;/ul&gt;\n&lt;ul&gt;\n&lt;li&gt;The account is marked: (list status terms you are requesting such as &amp;ldquo;paid in full&amp;rdquo;, &amp;ldquo;settled in full&amp;rdquo;, &quot;Paid as agreed&quot;, &amp;ldquo;settled for less&amp;rdquo;, &amp;ldquo;deleted&amp;rdquo; etc.)&amp;nbsp;&lt;/li&gt;\n&lt;/ul&gt;\n&lt;p&gt;This agreement shall be governed under the laws of (STATE), and shall be binding. If the above terms are acceptable to (CREDITOR), please respond in writing, on your company letterhead, acknowledging your acceptance and the terms as you agree to them.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;As soon as I receive your acceptance of this offer, I will express mail a cashiers&amp;rsquo; check.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;&amp;nbsp;________________________________&lt;br /&gt;Creditor name&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;________________________________&lt;br /&gt;Creditor: Title:&lt;/p&gt;\n&lt;p&gt;I agree to the terms listed above:&amp;nbsp; Yes____ No____&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;&amp;nbsp;_______________________________________&lt;br /&gt;Creditor\'s Authorized Signature&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; Date&lt;/p&gt;', '0', '2013-01-08 05:51:12', '1', 94, 'system','Settlement agreement to collection agency after negotiating by phone. ','- N/A','Collection Agency'),
(87, 4, 'Debt Settlement Offer (Alternate 3)', '<p>**************************Instructions - Delete Before Printing**************************<br />Send this only if the Creditor or Collections Agent has already agreed by phone or correspondance.<br />**************************Instructions - Delete Before Printing**************************&nbsp;</p>\n<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}&nbsp;</p>\n<p>Re: Account Number: {account_number}.&nbsp;</p>\n<p>Dear {creditor_name},&nbsp;</p>\n<p>This is to confirm our conversation on ___________ as to the offer of the above stated account. As discussed, I will pay your company the amount of $________ as payment in full for the final satisfaction of this account.&nbsp;&nbsp;</p>\n<p>Upon receipt of the above payment, your company has agreed to change the entry on my credit reports from: _____________________ to (list status terms you are requesting, such as &ldquo;paid in full&rdquo;, &ldquo;settled in full&rdquo;, \"Paid as agreed\", &ldquo;settled for less&rdquo;, &ldquo;deleted&rdquo; etc.) .&nbsp;&nbsp;</p>\n<p>If you agree with these terms, please acknowledge with your signature and return it to me. You agree the terms herein are confidential and you have the authority to make such decisions. No payment will be made without written confirmation.&nbsp;</p>\n<p>Upon receipt of this signed acknowledgment, I will immediately mail you funds priority mail. This is not a renewed promise to pay but rather a restricted offer only. If no terms can be met, no new arrangements will be made and the offer will be void.&nbsp;</p>\n<p>_________________________________<br />Name of Creditor</p>\n<p>&nbsp;________________________________________<br />Creditor&rsquo;s Authorized Signature&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Date</p>\n<p>_________________________________<br />Name Of Creditor&rsquo;s Authorized Representative</p>\n<p>_________________________________<br />Position or Title:&nbsp;</p>', '0', '2013-01-08 05:52:26', '1', 95, 'system','Settlement offer to collection agency stipulating removal from credit report. ','- N/A','Collection Agency'),
(88, 4, 'Debt Settlement Offer to Dismiss Court Judgment', '<p>{client_first_name} {client_last_name}<br />{client_address}&nbsp;</p>\n<p>{creditor_name}<br />{creditor_address}&nbsp;</p>\n<p>To: Judgment Creditor, {creditor_name}&nbsp;</p>\n<p>From: Judgment Debtor, {client_first_name} {client_last_name}&nbsp;</p>\n<p>Case number:&nbsp; (CASE NUMBER)&nbsp;</p>\n<p>Judgment amount:&nbsp; (AMOUNT)&nbsp;</p>\n<p>Date: {curr_date}&nbsp;</p>\n<p>Dear Sir,&nbsp;&nbsp;</p>\n<p>I am aware of the money due you and of the judgment placed against me for this money. I had every intention of taking care of this prior to the entry of the judgment, but unfortunately time constraints ended that chance.&nbsp;</p>\n<p>Today I am writing to you so that we may put this matter behind us and settle out this judgment for good, under a few conditions. This will save you time and money trying to collect the judgment and will help me recover from your negative entry against me.&nbsp;</p>\n<p>I have been offered an amount from a close family member to pay you $(AMOUNT) to settle the debt in full and have the judgment dismissed.&nbsp;&nbsp;</p>\n<p>As the judgment creditor, you reserve the right to dismiss or vacate the judgment as well as entering it. If I pay you from this offer letter saving you immense time, fees and paperwork, you can then file a simple paper with the courts dismissing the judgment.&nbsp;</p>\n<p>My offer is to pay you in exchange for the dismissal so that we have both gained something from this unfortunate situation. It is extremely important that you dismiss the judgment rather than satisfying it, because a satisfied judgment really looks no better for me than a filed judgment.&nbsp;</p>\n<p>With a dismissed judgment I can justify paying you. Upon your signed approval of this offer, I will forward the full settlement to you immediately. I understand this offer is void if I do not send you $(AMOUNT) within 5-10 days of your signed confirmation.&nbsp;&nbsp;</p>\n<p>If you agree to \"dismiss\" the judgment upon full and final payment of $(AMOUNT), then please sign and return this offer and acceptance.&nbsp;</p>\n<p>Offer Accepted and Agreed,&nbsp;</p>\n<p>________________________________________<br />Judgment Creditor Signature&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Date&nbsp;</p>\n<p>________________________________________<br />Judgment Creditor Authorized Representative&nbsp;</p>\n<p>On behalf of:&nbsp;</p>\n<p>________________________________________<br />Judgment Creditor Company Name</p>', '0', '2013-01-08 05:53:01', '1', 96, 'system','Settlement offer to collection agency stipulating vacating/dismissing judgment.','- N/A','Collection Agency'),
(89, 4, 'Unilateral Release of Claims (Include with Settlement Offer Before Payment)', '<p>{client_first_name} {client_last_name}<br />{client_address}&nbsp;</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}&nbsp;</p>\n<p>Re: Account Number: {account_number}. Balance to be paid: $__________&nbsp;</p>\n<p>Dear {creditor_name}&nbsp;</p>\n<p>Per our agreement to settle the above mentioned debt, I am requesting that you sign this unilateral release form. This form confirms that we both agreed to settle the debt listed above for the amount indicated.&nbsp;</p>\n<p>Creditors/Agency Name: _________________________________&nbsp;</p>\n<p>We agree that to accept $_______ as \"payment in full\" for account number: {account_number}.&nbsp;</p>\n<p>For: {client_first_name} {client_last_name}&nbsp;</p>\n<p>We will accept this amount as full and final satisfaction and we will have no future claims against this account or debtor. This Unilateral Release ensures that we understand we have accepted a settlement on this debt and will not pursue the debtor later for any deficiency balance.&nbsp;</p>\n<p>________________________________________<br />Creditor&rsquo;s Authorized Signature&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Date&nbsp;</p>\n<p>_________________________________<br />Printed name of Creditors Authorized Rep.&nbsp;</p>\n<p>_________________________________<br />Position or Title:&nbsp;</p>', '0', '2013-01-08 05:53:34', '1', 97, 'system','Settlement agreement to collection agency after negotiating. ','Separate Settlement Offer','Collection Agency'),
(90, 4, 'Validation of Debt (Simple)', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{client_previous_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}<br />{creditor_phone}</p>\n<p>{curr_date}</p>\n<p>Re: Account # {account_number}</p>\n<p>To Whom It May Concern,</p>\n<p>I dispute your claims in their entirety and I am requesting validation from you pursuant to the Fair Debt Collection Practices Act, 15 USC 1692g Sec. 809 (8) (FDCPA).</p>\n<p>Sincerely,</p>\n<p>{client_signature}<br />____________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 05:59:09', '1', 98, 'system','Demand collection agency to provide proof debt is valid and accurate.','- N/A','Collection Agency'),
(91, 4, 'Validation of Debt (Alternate)', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{bureau_address}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>This letter is a formal complaint that you are reporting inaccurate and incomplete credit information.</p>\n<p>I am distressed that you have included the information below in my credit profile and that you have failed to maintain reasonable procedures in your operations to assure maximum possible accuracy in the credit reports you publish. Credit reporting laws ensure that bureaus report only 100% accurate credit information. Every step must be taken to assure the information reported is completely accurate and correct. The following information therefore needs to be re-investigated.</p>\n<p>&lt;INSERT DISPUTE ITEMS AND EXPLANATION HERE&gt;</p>\n<p>I respectfully request to be provided proof of this alleged item, specifically the contract, note or other instrument bearing my signature.</p>\n<p>Failing that, the item must be deleted from the report as soon as possible. The listed item is entirely inaccurate and incomplete, and as such represents a very serious error in your reporting. Please delete this misleading information and supply a corrected credit profile to all creditors who have received a copy within the last six months, or the last two years for employment purposes.</p>\n<p>Additionally, please provide the name, address, and telephone number of each credit grantor or other subscriber.</p>\n<p>Under federal law, you have thirty (30) days to complete your re-investigation. Be advised that the description of the procedure used to determine the accuracy and completeness of the information is hereby requested as well, to be provided within fifteen (15) days of the completion of your re-investigation.</p>\n<p>Sincerely,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 06:00:14', '1', 99, 'system','Demand collection agency to validate and remove from credit report. ','- N/A','Collection Agency');
INSERT INTO `crd_letter_templ` (`itempl_id`, `itempl_catgid`, `vtempl_title`, `vtempt_text`, `efavorite`, `dtempl_createdon`, `estatus`, `iOrder`, `vadded_by`,`letter_description`,`documents_needed`,`recipient`) VALUES
(92, 4, 'Validation of Debt (Alternate 2)', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>This letter is a formal complaint that you are reporting inaccurate and incomplete credit information. I am distressed that you have included the information below in my credit profile and that you have failed to maintain reasonable procedures in your operations to assure maximum possible accuracy in the credit reports you publish.</p>\n<p>Credit reporting laws ensure that bureaus report only 100% accurate credit information. Every step must be taken to assure the information reported is completely accurate and correct.</p>\n<p>The following information therefore needs to be re-investigated:</p>\n<p>{dispute_item_and_explanation}</p>\n<p>I respectfully request to be provided proof of this alleged item, specifically the contract, note or other instrument bearing my signature. Failing that, the item must be deleted from the report as soon as possible:</p>\n<p>The listed item is entirely inaccurate and incomplete, and as such represents a very serious error in your reporting. Please delete this misleading information and supply a corrected credit profile to all creditors who have received a copy within the last six months, or the last two years for employment purposes.</p>\n<p>Additionally, please provide the name, address, and telephone number of each credit grantor or other subscriber.</p>\n<p>Under federal law, you have thirty (30) days to complete your re-investigation. Be advised that the description of the procedure used to determine the accuracy and completeness of the information is hereby requested as well, to be provided within fifteen (15) days of the completion of your re-investigation.</p>\n<p>Sincerely,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 06:00:46', '1', 100, 'system','Demand to credit bureau requesting copy of contract or the removal of the item from credit report. ','- N/A','Collection Agency'),
(93, 4, 'Validation of Debt (Alternate 3)', '&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city}, {creditor_state} {creditor_zip}&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;Re: Acct # {account_number}&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern:&lt;/p&gt;\n&lt;p&gt;I am sending this letter to you in response to the notice I received from you on (date of letter). Please be advised that this is not a refusal to pay, but a notice sent pursuant to the Fair Debt Collection Practices Act, 15 USC 1692g Sec. 809 (b) that your claim is disputed and validation is requested.&lt;/p&gt;\n&lt;p&gt;This is NOT a request for \'verification\' or proof of my mailing address, but a request for \'VALIDATION\' made pursuant to the above named Title and Section. I respectfully request that your office provide me with factual evidence that I have any legal obligation to pay you.&lt;/p&gt;\n&lt;p&gt;Please provide me with the following:&lt;/p&gt;\n&lt;p&gt;-What the money you say I owe is for;&lt;/p&gt;\n&lt;p&gt;-Explain and show me how you calculated what you say I owe;&lt;/p&gt;\n&lt;p&gt;-Provide me with copies of any papers that show I agreed to pay what you say I owe;&lt;/p&gt;\n&lt;p&gt;-Provide a verification or copy of any judgment if applicable;&lt;/p&gt;\n&lt;p&gt;-Identify the original creditor;&lt;/p&gt;\n&lt;p&gt;-Prove the Statute of Limitations has not expired on this account;&lt;/p&gt;\n&lt;p&gt;-Show me that you are licensed to collect in my state; and&lt;/p&gt;\n&lt;p&gt;-Provide me with your license numbers and Registered Agent.&lt;/p&gt;\n&lt;p&gt;If your offices have reported invalidated information to any of the three major Credit Bureau\'s (Equifax, Experian or TransUnion), said action might constitute fraud under both Federal and State Laws. Due to this fact, if any negative mark is found on any of my credit reports by your company or the company that you represent I will not hesitate to bring legal action against you for the following:&lt;/p&gt;\n&lt;p&gt;-Violation of the Fair Credit Reporting Act&lt;/p&gt;\n&lt;p&gt;-Violation of the Fair Debt Collection Practices Act&lt;/p&gt;\n&lt;p&gt;-Defamation of Character&lt;/p&gt;\n&lt;p&gt;If your offices are able to provide the proper documentation as requested, I will require at least 30 days to investigate this information and during such time all collection activity must cease and desist.&lt;/p&gt;\n&lt;p&gt;Also during this validation period, if any action is taken which could be considered detrimental to any of my credit reports, I will consult with my legal counsel. This includes any information to a credit reporting repository that could be inaccurate or invalidated or verifying an account as accurate when in fact there is no provided proof that it is.&lt;/p&gt;\n&lt;p&gt;If your offices fail to respond to this validation request within 30 days from the date of your receipt, all references to this account must be deleted and completely removed from my credit file and a copy of such deletion request shall be sent to me immediately.&lt;/p&gt;\n&lt;p&gt;I would also like to request, in writing, that no telephone contact be made by your offices to my home or to my place of employment. If your offices attempt telephone communication with me, including but not limited to computer generated calls or correspondence sent to any third parties, it will be considered harassment and I will have no choice but to file suit. All future communications with me MUST be done in writing and sent to the address noted in this letter.&lt;/p&gt;\n&lt;p&gt;This is an attempt to correct your records, any information obtained shall be used for that purpose.&lt;/p&gt;\n&lt;p&gt;Kind regards,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_________________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;', '0', '2013-01-08 06:01:14', '1', 101, 'system','Demand and stern warning to collection agency requiring validation of various account details, stopping collection efforts and removal of item from credit report. ','- N/A','Collection Agency'),
(94, 4, 'Validation of Debt (Alternate 4)', '&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city} {creditor_state} {creditor_zip}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;&amp;nbsp;Re: {account_number}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern,&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;I am in receipt of your letter claiming that I owe your company for a debt. According to the Federal Fair Debt Collection Practices Act, I have a right to have the alleged debt validated by you.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;I have to date, received no proof that I owe your company any debt and I am requesting that you forward to me full and proper documentation as evidence of this alleged debt.&amp;nbsp; As per the FDCPA, it is a violation for any debt collector to pursue collection activity on an account without notifying the debtor in writing within 5 days after any communication. Additionally I am allowed 30 days to dispute the validity of the debt.&amp;nbsp; If you are unable to provide me with proper proof then you must stop attempting to collect this alleged debt.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;If you continue to claim I owe a debt that you cannot confirm with proof then you will be in direct violation of the FDCPA. Additionally, any attempt on your part to report this alleged debt to my credit reports will be a violation of the Fair Credit Reporting Act.&amp;nbsp;&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Please forward your documentation to me upon receipt of this certified letter. Please note that proper documentation is not a print out or bill from you but rather actual proof of the debt\'s existence.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Sincerely,&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;____________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;', '0', '2013-01-08 06:03:33', '1', 102, 'system','Demand and warning to comply with validation demand. ','- N/A','Collection Agency'),
(95, 4, 'Validation of Debt (After Dispute to Bureau)', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{client_previous_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}<br />{creditor_phone}</p>\n<p>{curr_date}</p>\n<p>Re: Account # xxxxxxx</p>\n<p>To Whom It May Concern:</p>\n<p>Your company is reporting the below referenced account on my credit report as a collection account.</p>\n<p>{dispute_item_and_explanation}</p>\n<p>I have disputed this item with the credit reporting agency and they reported you confirmed the account as valid.</p>\n<p>In a good faith effort to resolve the matter amicably, I must demand proof of this debt, specifically the alleged contract or other instrument bearing my signature, as well as proof of your authority in this matter. Absent such proof, you must correct any erroneous reports of this past debt as mine.</p>\n<p>I am writing to request that you please provide the following information:</p>\n<p>1. Please evidence your authorization under 15 USC 1692(e) and 15 USC 1692(f) in this alleged matter.<br />2. What is your authorization of law for your collection of information?<br />3. What is your authorization of law for your collection of this alleged debt?<br />4. Please evidence your authorization to do business or operate in this state.<br />5. Please evidence proof of the alleged debt, including the alleged contract or other instrument bearing my signature.<br />6. Please provide a complete account history, including any charges added for collection activity.</p>\n<p>You have thirty (30) days from receipt of this notice to respond. Failure to respond in writing, hand-signed, and in a timely manner, will be considered a waiver to any and all of your claims in this matter, and will entitle me to presume you placed this on my credit report(s) in error and that this matter is permanently closed. Provide the proof, or correct the record and remove this invalid debt from all sources to which you have reported it.</p>\n<p>For the purposes of 15 USC 1692 et seq., this Notice has the same effect as a dispute to the validity of the alleged debt and a dispute to the validity of your claims. This Notice is an attempt to correct your records, and any information received from you will be collected as evidence should further action be necessary. This is a request for information only, and is not a statement, election, or waiver of status.</p>\n<p>{client_first_name} {client_last_name} (DO NOT SIGN)</p>', '0', '2013-01-08 06:05:14', '1', 103, 'system','Demand to collection agency to validate debt and respond to a list of questions and warning that failure to comply may result in liability. ','- N/A','Collection Agency'),
(96, 4, 'Validation of Debt (Estoppel by Silence)', '&lt;p&gt;***************Instructions Delete these before saving and sending***************&lt;br /&gt;Doctrine of Estoppel by Silence can be extremely powerful with collection agencies that have ignored your Validation of Debt requests. According to Black Law, the meaning is: Estoppel: A legally imposing bar resulting from one\'s own conduct and precluding any denial assertion regarding a fact. A doctrine that prevents a person from adopting an inconsistent position, attitude or action if it will result in injury to another. An affirmative defense alleging good faith. Estoppel by Silence: Estoppel that arises when a party is under a duty to speak but fails to. The Estoppel letter is used when you request Validation of Debt and do not get a response from the Collection Agency. It uses the &quot;Doctrine of Estoppel&quot; which tells the collection agency that their silence must mean they agree with you. This letter can be used after you have already sent two Validation of Debt requests to a collection agency.&lt;br /&gt;***************Instructions Delete these before saving and sending***************&lt;/p&gt;\n&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city}, {creditor_state} {creditor_zip}&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;Re: Account number: {account_number}&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern:&lt;/p&gt;\n&lt;p&gt;This certified letter, receipt number: ____________________ is to formally advise you that I believe your company has violated several of my consumer rights. Specifically:&lt;/p&gt;\n&lt;p&gt;You failed to validate a debt at my request, which is a FDCPA violation and you continued to report a disputed debt to the Credit Bureaus: another FCRA violation&lt;/p&gt;\n&lt;p&gt;Not only have you ignored my prior requests for validation of debt (proof attached: receipt copies or letter copies) but you continue to report this debt to the credit bureaus causing damage to my character. This letter will again request that you follow the FDCPA and please provide the following:&lt;/p&gt;\n&lt;p&gt;Validation of Debt Request&lt;br /&gt;-Proof of your right to own/collect this alleged debt&lt;br /&gt;-Balance claimed including all fees, interest and penalties&lt;br /&gt;-Contract bearing my personal signature&lt;/p&gt;\n&lt;p&gt;As you may be aware, &quot;Estoppel by Silence&quot; legally means that you had a duty to speak but failed to do so therefore, that must mean you agree with me that this debt is false. I will use the Estoppel in my defense.&lt;/p&gt;\n&lt;p&gt;I expect to receive the proof requested above within 15 days of this letter. Should you again ignore my request for validation of debt I reserve the right to sue your company for violations of my consumer rights as specified under both the FDCPA and the FCRA. I may also seek damages from you if warranted.&lt;/p&gt;\n&lt;p&gt;Kind regards,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_________________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;', '0', '2013-01-08 06:07:21', '1', 104, 'system','Demand reinvestigation and validation demand to collection agency, failure warning using estoppel.','Certified mail receipts, copies of previous letters','Collection Agency'),
(97, 4, 'Validation of Debt (Admission by Silence)', '<p>***************Instructions Delete these before saving and sending***************<br />This letter is similar to the Estoppel by Silence letter. This \"Admission by Silence\" will advise a collection agency of the Black Law Legal Meaning: The failure of a party to speak after an assertion of fact by another party that, if untrue, would naturally compel a person to deny the statement. This is a powerful statement! If you are right, you speak up; if you are wrong you do nothing to stand your ground. Asserting this information can cause a collections agent to think twice about who they are dealing with and to either prove it or lose it. This is a valuable Validation of Debt tool.<br />***************Instructions Delete these before saving and sending***************</p>\n<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city}, {creditor_state} {creditor_zip}</p>\n<p>{curr_date}</p>\n<p>Re: Account number: {account_number}</p>\n<p>To Whom It May Concern:</p>\n<p>This certified letter, receipt number: XXXXXXXXXXXX is to formally advise you that I believe your company has violated my consumer rights in the following ways.</p>\n<p>Specifically you: [list all that apply]</p>\n<p>- Failed to validate a debt at my request- FDCPA violation</p>\n<p>- Continued to report a disputed debt to the CRA- FCRA violation</p>\n<p>- Continued to attempt to collect a disputed debt- FDCPA violation</p>\n<p>- Ignored my cease and desist- FDCPA violation</p>\n<p>Not only have you ignored my prior requests for validation of debt (see enclosed copies of receipts letters) but you also continue to report this debt to the credit bureaus causing damage to my character. This letter will again request that you follow guidelines of The Fair Debt Collection Practices Act (FDCPA), 15 U.S.C. &sect; 1692 and please provide the following:</p>\n<p>Validation of Debt Request</p>\n<p>- Proof of your right to own/collect this alleged debt -Balance claimed including all fees, interest and penalties</p>\n<p>-Contract bearing my personal signature -License proof to collect debts in my state</p>\n<p>As you certainly are aware, \"Admission by Silence\" means that you had a legal duty to defend your position but failed to do so and if my claims were untrue you would have been compelled to deny my charges. I will use the Admission by Silence in my defense should I be summoned to court or take action against you.</p>\n<p>I expect to receive proof requested above, within 15 days of this letter. Should you continue to ignore my request for this validation of debt I reserve the right to sue your company for violations of my consumer rights as indicated under both the FDCPA and the FCRA. I may also seek damages from you if warranted.</p>\n<p>Kind regards,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 06:07:44', '1', 105, 'system','Collection agency warning of past violations, demand to provide proof the debt is valid and various other demands.','Certified mail receipts, copies of previous letters','Collection Agency'),
(98, 4, 'Validation of Debt with Creditor Disclosure Statement', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{client_previous_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}<br />{creditor_phone}</p>\n<p>{curr_date}</p>\n<p>Certified Mail No.: _____________</p>\n<p>Re: Inquiry dated ___: account no. {account_number}</p>\n<p>To Whom It May Concern,</p>\n<p>Thank you for your inquiry. This is not a refusal to pay, but a notice that I am disputing your claim and I am requesting validation made pursuant to the Fair Debt Collection Practices Act.</p>\n<p>Please complete and return the attached disclosure request form.</p>\n<p>Understand that I am not requesting a &ldquo;verification&rdquo; that you have my mailing address, I am requesting a &ldquo;validation of debt;&rdquo; i.e.; competent and valid evidence that I have some contractual obligation to pay you.</p>\n<p>You may be aware that sending unsubstantiated demands for payment through the United States Mail System might constitute mail fraud under federal and state law. As such, you may wish to consult with a legal adviser before your next communication with me.</p>\n<p>Your failure to satisfy this request within the requirements stated in the Fair Debt Collection Practices Act will be construed as your absolute waiver of any and all claims against me, and your tacit agreement to compensate me for costs and attorney fees.</p>\n<p>{client_first_name} {client_last_name} (DO NOT SIGN)</p>\n<p><br />CREDITOR DISCLOSURE STATEMENT</p>\n<p>Name and Address of Collector (assignee):____________________________________</p>\n<p>Name and Address of Debtor:____________________________________</p>\n<p>Account Number(s):____________________________________</p>\n<p>What are the terms of assignment for this account? You may attach a facsimile of any records relating to such terms.</p>\n<p>Have any insurance claims been made by any creditor or assignee regarding this account? Yes / no</p>\n<p>Has the purported balanced of this account been used in any tax deduction claim? Yes / no</p>\n<p>Please list the exact products or/or services sold by the collector to the debtor and the dollar amount of each:</p>\n<p>Upon failure or refusal of collector to validate this collection action, collector agrees to waive all claims against the debtor named herein and pay debtor for all costs and attorney fees involved in defending this collection action.</p>\n<p><br />X_________________________________________________<br />Authorized signature for Collector Date</p>\n<p>___________________________________________________<br />Printed name</p>\n<p>Please return this completed form and attach all assignment or other transfer agreements that would establish your right to collect this debt.</p>\n<p>Your claim cannot be considered if any portion of this form is not completed and returned with the required documents. This is a request for validation made pursuant to the Fair Debt Collection Practices Act. If you do not respond as required by this law, your claim will not be considered and you may be liable for damages for continued collection efforts.</p>', '0', '2013-01-08 06:08:04', '1', 106, 'system','Demand and warning to debt collector to provide a list of account details and information to prove debt is valid. ','- N/A','Collection Agency'),
(99, 4, 'Validation of Debt with Creditor Disclosure Statement  (Alternate)', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{client_previous_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}<br />{creditor_phone}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern:</p>\n<p>This letter is sent to you in response to a notice sent to me on (Date) or in response to a listing on my credit report (CHOOSE THE ONE APPROPRIATE FOR YOUR SPECIFIC SITUATION). Be advised that this is not a refusal to pay, but a notice sent pursuant to the Fair Debt Collection Practices Act, 15 USC 1692g Sec. 809 (8), stating your claim is disputed and validation is requested.</p>\n<p>This is NOT a request for &ldquo;verification&rdquo; or proof of my mailing address, but a request for VALIDATION made pursuant to the above named Title and Section. I respectfully request your offices provide me with competent evidence that I have any legal obligation to pay you.</p>\n<p>At this time I will also inform you that if your offices have reported invalidated information to any of the 3 major Credit Bureaus (Equifax, Experian or TransUnion) this action might constitute fraud under both Federal and State Laws. Due to this fact, if any negative mark is found on any of my credit reports by your company or the company that you represent, I will not hesitate in bringing legal action against you and your client for the following:<br />Violation of the Fair Credit Reporting Act<br />Violation of the Fair Debt Collection Practices Act<br />Defamation of Character</p>\n<p>If your offices are able to provide the proper documentation as requested in the following Declaration, I will require at least 30 days to investigate this information, during which time all collection activity must cease and desist. Also during this validation period, if any action is taken which could be considered detrimental to any of my credit reports, I will consult with my legal counsel for suit. This includes any listing of any information to a credit reporting repository that could be inaccurate or invalidated. If your office fails to respond to this validation request within 30 days from the date of your receipt, all references to this account must be deleted and completely removed from my credit file and a copy of such deletion request shall be sent to me immediately.</p>\n<p>(OPTIONAL CEASE &amp; DESIST) I would also like to request, in writing, that no further telephone contact be made by your offices to my home or to my place of employment. If your offices continue to attempt telephone communication with me it will be considered harassment and I will have no choice but to file suit. All future communications with me MUST be done in writing and sent to the address noted in this letter.</p>\n<p>It would be advisable that you and your client assure that your records are in order before I am forced to take legal action.</p>\n<p>Best Regards,</p>\n<p>{client_first_name} {client_last_name} (DO NOT SIGN)</p>\n<p><br />CREDITOR/DEBT COLLECTOR DECLARATION</p>\n<p>Please provide all of the following information and submit the appropriate forms and paperwork within 30 days from the date of your receipt of this request for validation.</p>\n<p>______________________________________________________<br />Name and Address of Alleged Creditor:</p>\n<p>______________________________________________________<br />Name on File of Alleged Debtor:</p>\n<p>_____________________________________________________________<br />Alleged Account #:</p>\n<p>_____________________________________________________________<br />Address on File for Alleged Debtor:</p>\n<p>____________________________________________________________<br />Amount of alleged debt:</p>\n<p>_____________________________________________________________<br />Date that this alleged debt became payable:</p>\n<p>_____________________________________________________<br />Date of original charge off or delinquency:</p>\n<p>___________________________________________________<br />Was this debt assigned to debt collector or purchased?</p>\n<p>____________________________________________<br />Amount paid if debt was purchased:</p>\n<p>___________________________________________________________<br />Commission for debt collector if collection efforts are successful:</p>\n<p>Please attach a copy of the agreement with your client that grants (Collection Agency Name) the authority to collect this alleged debt.</p>\n<p>Also, please attach a copy of any signed agreement debtor has made with debt collector, or other verifiable proof debtor has a contractual obligation to pay debt collector.</p>\n<p>Please attach a copy of any agreement that bears the signature of debtor, wherein he/she agreed to pay creditor.</p>\n<p>Please attach copies of all statements while this account was open.</p>\n<p>Have any insurance claims been made by any creditor regarding this account? YES or NO (circle one)</p>\n<p>Have any judgments been obtained by any creditor regarding this account? YES or NO (circle one)</p>\n<p>Please provide the name and address of the bonding agent for (Name Of Debt Collector), in case legal action becomes necessary:</p>\n<p>______________________________</p>\n<p>______________________________</p>\n<p>______________________________</p>\n<p><br />_________________________________________&nbsp;<br />Authorized Signature For Creditor Date</p>\n<p>__________________________<br />Print Name</p>\n<p>You must return this completed form along with copies of all requested information, assignments or other transfer agreements, which would establish your right to collect this alleged debt within 30 days from the date of your receipt of this letter. Your claim cannot and WILL NOT be considered if any portion of this form is not completed and returned with copies of all requested documents. This is a request for validation made pursuant to the Fair Debt Collection Practices Act. Please allow 30 days for processing after I receive this information back.</p>', '0', '2013-01-08 06:08:28', '1', 107, 'system','Validation demand to collection agency with request for disclosure of account details. Includes demand to stop phone contact and stern legal warnings.   ','- N/A','Collection Agency'),
(100, 4, 'Validation of Debt with Creditor Disclosure Statement)  (Alternate 2)', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{client_previous_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}<br />{creditor_phone}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern:</p>\n<p>Re: Acct # XXXX-XXXX-XXXX-XXXX</p>\n<p>To Whom It May Concern:</p>\n<p>This letter is sent to you in response to a notice sent to me on (Date) or in response to a listing on my credit report (CHOOSE THE ONE APPROPRIATE FOR YOUR SPECIFIC SITUATION). This is not a refusal to pay, but a notice that your claim is disputed.</p>\n<p>Pursuant to the Fair Debt Collection Practices Act, 15 USC 1692g Sec. 809 (8) (FDCPA), I have the right to request validation of the debt you say I owe you. I am requesting proof that I am indeed the party you are asking to pay this debt, and there is some contractual obligation which is binding on me to pay this debt.</p>\n<p>Your attorney or legal staff will agree that compliance with this request is required under State and Federal Statutes.</p>\n<p>In addition to the questionnaire below, please attach copies of:</p>\n<p>Agreement with your client that grants you the authority to collect on this alleged debt, or proof of acquisition by purchase or assignment.</p>\n<p>Agreement that bears the signature of the alleged debtor wherein he or she agreed to pay the creditor.</p>\n<p>Also, please be advised this letter is not only a formal dispute, but a request for you to cease and desist any and all collection activities.</p>\n<p>I require compliance with the terms and conditions of this letter within 30 days. or a complete withdrawal, in writing, of any claim.</p>\n<p>In the event of noncompliance, I reserve the right to file charges and/or complaints with appropriate County, State &amp; Federal authorities ,the BBB and State Bar associations for violations of the FDCPA, FCRA, and Federal and State statutes on fraudulent extortion .</p>\n<p>I also hereby reserve my right to take private civil action against you to recover damages.</p>\n<p>Sincerely,</p>\n<p>{client_first_name} {client_last_name} (DO NOT SIGN)</p>\n<p><br />DEBT VALIDATION FORM</p>\n<p>Please provide all of the following information and submit the appropriate forms and paperwork within 30 days from the date of your receipt of this request for validation.</p>\n<p>Account #: ____________________</p>\n<p>Original Creditor&rsquo;s Name:</p>\n<p>_________________________________<br />Name of Debtor:</p>\n<p>______________________________________<br />Address of Debtor:</p>\n<p>___________________________________<br />Balance of Account:</p>\n<p>__________________________________<br />Date you acquired this debt:</p>\n<p>_________________________</p>\n<p>This Debt was: assigned ___purchased___</p>\n<p>Please indicate the credit bureaus which you have reported this account to:</p>\n<p>Experian: ______</p>\n<p>Equifax: ______</p>\n<p>TransUnion: _____</p>\n<p>Other: ________________________</p>', '0', '2013-01-08 06:08:45', '1', 108, 'system','Validation demand to collection agency with request for disclosure of account details. Includes demand to stop collection activities and stern legal warnings/threats.','- N/A','Collection Agency'),
(101, 4, 'Validation of Medical Debt (HIPAA Request)', '<p>***************Instructions delete these before saving and sending***************<br />Since A large percentage of collection debts are medical related, this letter will assist you to validate a medical debt from a collection agency by referencing the HIPAA law. HIPAA stands for HEALTH INSURANCE PORTABILITY AND ACCOUNTABILITY ACT and it protects your privacy by preventing your medical records from being given to third parties without your written consent. The HIPAA law allows you to question your privacy while validating a medical debt and may also suspend reporting the collection item to your credit reports until it is resolved. Make sure that you understand the HIPAA requirements before using this letter. If they have violated HIPAA, this letter may assist you in deleting a medical collections account along with any mention of it on your credit reports!<br />***************Instructions delete these before saving and sending***************</p>\n<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city}, {creditor_state} {creditor_zip}</p>\n<p>{curr_date}</p>\n<p>Amount of debt: Date of Service: Provider of Service:</p>\n<p>To Whom It May Concern,</p>\n<p>I received a bill from you on [insert date] and as allowable under the Fair Debt Collections Practices Act, I am requesting validation of the alleged debt. I am aware that there is a debt from [name of doctor, hospital, clinic, etc.] but I am unaware of the amount due and your bill does not include a detailed breakdown of any fees.</p>\n<p>Furthermore, I am allowed under the HIPAA law (Health Insurance Portability and Accountability Act of 1996) to protect my privacy and medical records from third parties. I do not recall giving permission to [name of provider] for them to release my medical information to a third party. I understand that the HIPAA does allow for limited information about me but any details may only be revealed with the patients authorization, therefore my request is twofold and as follows:</p>\n<p>Validation of Debt and HIPAA authorization<br />- Please provide a breakdown of fees including any and all collection costs and medical charges<br />- Please provide a copy of my signature with the provider of service to release my medical information to you<br />- Immediately cease any credit bureau reporting until debt has been validated by me</p>\n<p>Please send this information to my address listed above and accept this letter, sent certified mail, as my formal debt validation request, of which I am allowed under the FDCPA.</p>\n<p>Please note that withholding the information you received from any medical provider in an attempt to be HIPAA compliant will be a violation of the FDCPA because you will be deceiving me after my written request. I am requesting full documentation of what you received from the provider of service in connection with this alleged debt.</p>\n<p>Furthermore, any reporting of this debt to the credit bureaus prior to allowing me to validate it may be a violation of the Fair Credit Reporting Act, which can allow me to seek damages from a collection agent.</p>\n<p>I await your reply with the above requested proof. Upon receiving it, I will correspond back with you by certified mail.</p>\n<p>Kind regards,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 06:09:45', '1', 109, 'system','Validation demand to collection agency with request for validation of debt and HIPAA authorization and stern legal warning.','Copy of written notice or bill ','Collection Agency'),
(102, 4, 'Judgment Proof letter', '&lt;p&gt;***************Instructions delete these before saving and sending***************&lt;br /&gt;You may be judgment proof if you are retired, disabled, unemployed or on welfare. - A creditor will often consider these facts before wasting time and money in coming after you. If you have the ability to offer any proof to show that you are &amp;ldquo;judgment proof,&amp;rdquo; enclose it with your letter. If you are unsure and think you may be sued, we suggest contacting a qualified attorney in your state to see your options. If you honestly are judgment proof, most creditors will not waste the expense of taking you to court.&lt;br /&gt;***************Instructions delete these before saving and sending***************&lt;/p&gt;\n&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city}, {creditor_state} {creditor_zip}&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;Re: Account number / Debtor\'s name&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern,&lt;/p&gt;\n&lt;p&gt;Please be advised that I have received your letter requesting money for the above debt. This letter, sent certified mail, receipt number_______________ is to formally advise you that I cannot pay this debt and have no attachable income or assets to levy.&lt;/p&gt;\n&lt;p&gt;I believe that I am judgment proof and I can prove it if necessary in a court of law. Should you attempt to file suit against me I will provide the court with valid proof of my situation.&lt;/p&gt;\n&lt;p&gt;My circumstances are that I am judgment proof because :&lt;/p&gt;\n&lt;p&gt;( list reasons:) I have no assets, no home or car (to attach), no income and no prospects and; I am disabled, unemployed, on social security or welfare.&lt;/p&gt;\n&lt;p&gt;I understand the debt is due, however your repeated attempts to collect are causing me much stress and therefore I must also ask you to cease and desist you (if the account is being pursued by a third party debt collector). If my situation changes, I will contact you immediately.&lt;/p&gt;\n&lt;p&gt;Kind regards,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_________________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;', '0', '2013-01-08 06:10:10', '1', 110, 'system','Notify collection agency that no assets or income exist and suing would be a fruitless endeavor and also to demand collection efforts to stop.','Proof of insolvency (Bank Statements, Paid Due Bills, 401K ETC > > )','Collection Agency'),
(103, 4, 'Judgment Proof Letter (Alternate)', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city}, {creditor_state} {creditor_zip}</p>\n<p>{curr_date}</p>\n<p>Re: Account number: {account_number} - Request for Reduced Payments</p>\n<p>To Whom It May Concern:</p>\n<p>Due to my desperate financial situation, I am unable to make payments on my account as originally agreed. My financial position is as follows:</p>\n<p>(STATE REASON; FINANCIAL, MEDICAL, DISABILITY, UNEMPLOYED, ETC.)</p>\n<p>I cannot work sufficient hours to meet my current expenses. My only sources of income are the following:</p>\n<p>(LIST SOURCES OF INCOME)</p>\n<p>I am familiar with the law and have been advised that I am \"judgment proof.\" If I should file for bankruptcy, I will claim all of my property as exempt. If you sue me and obtain judgment, you will not be able to collect any of my property to satisfy the judgment.</p>\n<p>Please cease all collection activities you have taken or are considering. While I will absolutely present you with reasonable financial or medical information, I must avoid stress (including high-pressure collections activity and lawsuits).</p>\n<p>I promise to inform you immediately should my financial condition improve and I am able to resume sending you normal payments.</p>\n<p>Thank you for your consideration and understanding.</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 06:10:35', '1', 111, 'system','Notify collection agency that assets and income are exempt and suing would be a fruitless endeavor and also to demand collection efforts to stop.','Documents that prove insolvency.','Collection Agency'),
(104, 4, 'Inform a Creditor that you have filed for Bankruptcy', '&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;Re: [Company] v. [Client\'s first and last name] [Account Number] Balance: $XXX&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern,&lt;/p&gt;\n&lt;p&gt;Please be advised that I filed a voluntary petition pursuant to Chapter 7 of the Bankruptcy Code. The bankruptcy case number is ______________________________ and it was filed on_______________ with you listed as one of my creditors.&lt;/p&gt;\n&lt;p&gt;To my knowledge, have never had non-sufficient funds and I am not aware of any negative entries. Kindly forward me a copy of my InformCreditorforBankruptcy record so that I may verify its accuracy.&lt;/p&gt;\n&lt;p&gt;Pursuant to 11 U.S.C. Section 362(a), you are automatically stayed by the filing of this petition from taking any action to collect any debt from me or from enforcing any lien against me. A violation of the stay may be actionable pursuant to 362(h) or as contempt of court and punishable accordingly.&lt;/p&gt;\n&lt;p&gt;Attorney name: ____________________________________&lt;br /&gt;Attorney address: _________________________________&lt;br /&gt;Attorney phone number: ____________________________&lt;/p&gt;\n&lt;p&gt;Kind regards,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_________________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;', '0', '2013-01-08 06:11:02', '1', 112, 'system','Notify collection agency bankruptcy has been filed.','Copy of Bankruptcy Documents','Collection Agency'),
(105, 4, 'Inform Creditor of Bankruptcy', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city}, {creditor_state} {creditor_zip}</p>\n<p>{curr_date}</p>\n<p>Re: Account number: (ENTER ACCOUNT NUMBER)</p>\n<p>To Whom It May Concern:</p>\n<p>Please cease and desist all collection activities you have begun or are considering to take against me. I plan on filing a petition in bankruptcy court in the coming months.</p>\n<p>Sincerely yours,</p>\n<p>{client_signature}<br />___________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 06:11:34', '1', 113, 'system','Inform to cease and desist collection efforts in lieu of upcoming bankruptcy filing.','- N/A','Collection Agency'),
(106, 4, 'Cease and Desist', '&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;/p&gt;\n&lt;p&gt;(Collection Agency)&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city}, {creditor_state} {creditor_zip}&lt;br /&gt;Attn: (PERSON OR DEPARTMENT THAT CONTACTED YOU)&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;Re: Notice to Cease Contact, Case # (ENTER CASE NUMBER IF AVAILABLE, PLUS CREDITOR INFORMATION AND ACCOUNT NUMBER)&lt;/p&gt;\n&lt;p&gt;To (PERSON WHOSE NAME APPEARS ON THE AGENCY\'S NOTICE TO YOU):&lt;/p&gt;\n&lt;p&gt;(CHOOSE ONE)&lt;/p&gt;\n&lt;p&gt;Since approximately _______________, I have received several phone calls and letters from you concerning an overdue account with the above-named creditor.&lt;/p&gt;\n&lt;p&gt;(OR)&lt;/p&gt;\n&lt;p&gt;On (date) I received written notice of the claimed debt, a copy of which is attached.&lt;/p&gt;\n&lt;p&gt;This is to give you notice to cease all contact with me or anyone else except the creditor about this claimed debt. Accordingly, under 15 U.S.C. Sec. 1692c, this is my formal notice to you to cease all further communications with me. If you must contact me, please do so in writing and not by telephone.&lt;/p&gt;\n&lt;p&gt;I look forward to your acknowledgement that you have received this notice by [insert a date that is two weeks from the date of this letter].&lt;/p&gt;\n&lt;p&gt;Sincerely,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_________________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;', '0', '2013-01-08 06:13:51', '1', 114, 'system','Demand collection agency to stop all contact and collection efforts.','- N/A','Collection Agency'),
(107, 4, 'Cease and Desist (Alternate)', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{client_previous_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}<br />{creditor_phone}</p>\n<p>{curr_date}</p>\n<p>Re: Account # {account_number}</p>\n<p>To Whom It May Concern,</p>\n<p>Pursuant to my rights under federal debt collection laws, I am requesting that you cease and desist communication with me, as well as my family, friends or my employer, in relation to this or any other alleged debts you claim I owe.</p>\n<p>You are hereby notified that if you do not comply with this request, I will immediately file a complaint with the Federal Trade Commission and the Attorney General of [your state here]. Civil and criminal claims will also be pursued.</p>\n<p>Sincerely,</p>\n<p>{client_signature}<br />____________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 06:14:38', '1', 115, 'system','Demand collection agency to stop all contact with stern legal warning. ','- N/A','Collection Agency'),
(108, 4, 'Cease and Desist (Alternate 2)', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{client_previous_address}</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}<br />{creditor_phone}</p>\n<p>{curr_date}</p>\n<p>Re: Account # {account_number}</p>\n<p>To Whom It May Concern,</p>\n<p>You are hereby notified under provisions of Public Laws 95-109 and 99-361, also known as the Fair Debt Collection Practices Act, that your services are no longer desired.</p>\n<p>Immediately cease and desist all attempts to collect the above debt. Failure to comply with this law will result in my immediately filing a complaint with the Federal Trade Commission and the Attorney General of [your state here]. Civil and criminal claims will also be pursued against you and your company.</p>\n<p>Let this letter also serve as your warning that I may utilize telephone recording devices in order to document any telephone conversations that we may have in the future.</p>\n<p>Furthermore, if any negative information is placed on my credit bureau reports by your agency after receipt of this notice, this will cause me to file suit against you and your organization, both personally and corporately, to seek any and all legal remedies available to me by law.</p>\n<p>It is my policy neither to recognize nor deal with collection agencies, and I will only settle this account with the original creditor.</p>\n<p>Sincerely,</p>\n<p>{client_signature}<br />____________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 06:15:58', '1', 116, 'system','Demand collection agency to stop all contact and refrain from reporting with stern warning. ','- N/A','Collection Agency'),
(109, 4, 'Complaint about Harassment', '&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city}, {creditor_state} {creditor_zip}&lt;/p&gt;\n&lt;p&gt;{curr_date}&lt;/p&gt;\n&lt;p&gt;Name(s) on account: Test Test test&lt;br /&gt;Account number: {account_number}&lt;br /&gt;Date loan/debt incurred: (DATE)&lt;br /&gt;Original loan/debt amount: (ORIGINAL AMOUNT OF LOAN/DEBT)&lt;br /&gt;Amount past due: (AMOUNT CURRENTLY PAST DUE)&lt;/p&gt;\n&lt;p&gt;Re: Collection agency: {creditor_name}&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern:&lt;/p&gt;\n&lt;p&gt;I have been unable to pay the full amount of the loan/debt noted above for the following reason(s):&lt;/p&gt;\n&lt;p&gt;(ENTER REASONS HERE)&lt;/p&gt;\n&lt;p&gt;Although I have an outstanding debt, I have the right to be treated by a collection agency with dignity and respect. The collection agency you\'ve hired (as noted above), however, has engaged in the following practices which violate the federal Fair Debt Collection Practices Act:&lt;/p&gt;\n&lt;p&gt;(ENTER COLLECTION AGENCY MISCONDUCT HERE)&lt;/p&gt;\n&lt;p&gt;I am willing to forego the legal remedies I have available, including a lawsuit in small claims court seeking punitive damages against you and the agency, in exchange for your written promise to permanently cease all efforts to collect this debt and remove all negative entries regarding this debt from my credit file. I expect to hear from you immediately.&lt;/p&gt;\n&lt;p&gt;Sincerely,&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;_______________________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;\n&lt;p&gt;cc: Federal Trade Commission&lt;br /&gt;State Collection Agency Licensing Board&lt;br /&gt;Collection Agency: (NAME OF OFFENDING COLLECTION AGENCY)&lt;/p&gt;', '0', '2013-01-08 06:17:41', '1', 117, 'system','Threat to creditor to stop collection and remove item from credit report.','- N/A','Collection Agency'),
(110, 4, 'Warning of VOD refusal and FDCPA violations', '&lt;p&gt;{client_first_name} {client_last_name}&lt;br /&gt;{client_address}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;{creditor_name}&lt;br /&gt;{creditor_address}&lt;br /&gt;{creditor_city} {creditor_state} {creditor_zip}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;{curr_date}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Re: {account_number}&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;To Whom It May Concern,&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Please be apprised that you are in direct violation of the Fair Debt Collections Practices Act. In my opinion you have violated at least three sections of this act by:&amp;nbsp;&lt;/p&gt;\n&lt;ul&gt;\n&lt;li&gt;Failing to validate a debt as allowed to the debtor under 15 USC 1692 (g) Section 809 (b)&lt;/li&gt;\n&lt;li&gt;Communicating with a debtor after receiving a cease and desist certified mail under 15 USC 1692 (g) Section 805 (c)&lt;/li&gt;\n&lt;li&gt;Harassment of alleged debtor under the &quot;abuse &amp;amp; harassment&quot; subsection of the statute, USC 1692 (g) Section 806 (5)&amp;nbsp;&lt;/li&gt;\n&lt;/ul&gt;\n&lt;p&gt;I have complete and thorough records of your violations and I am prepared to protect myself and my rights from unscrupulous collection agencies.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;In (EXACT DATE), I sent by certified mail (receipt number: (CERTIFIED MAIL RECEIPT NUMBER), a request for your office to provide me with proof and evidence of the debt you alleged I owed, and I did so within 30 days of receiving your first notice. In that same letter I also included my cease and desist instructions.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;After verified delivery of my letter (via your office\'s signature), you proceeded to mail a simple bill which is NOT considered a &quot;validation of debt&quot; by any means. You may wish to familiarize yourself with what is required when validating a debt.&amp;nbsp;&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Your office also proceeded to contact me by phone after the delivery and acceptance of my certified letter. Contacting a person after a cease and desist can lead to serious trouble for your agency including damages of up to $1000.00 per incident.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;I highly doubt that this $(ENTER AMOUNT OF DEBT) debt is worth your agency\'s license and the fees and penalties for violations of the FDCPA.&amp;nbsp;&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;There is no question that you willfully violated my rights and that I could bring charges against you immediately. However, I am assuming this has been a terrible mistake on&amp;nbsp; your part and that you will take appropriate steps to enlighten yourself and your staff of such dangerous actions.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;I will also be checking my credit report to see if you have willfully reported an unverified and disputable debt to the credit bureaus. If so, that will be a violation of the Fair Credit Reporting Act. I will state again in this certified mailing that you have failed to verify the debt as accurate, you have provided no proof of this alleged debt, and I must remind you again to not contact me in any way via phone or mail in reference to collecting this debt.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;If I receive anything other than absolute proof from you, provided by the original creditor, I will assume you are harassing me and ignoring my cease and desist, and I will take action against you for these continued violations and abuse.&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Sincerely,&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;{client_signature}&lt;br /&gt;____________________________&lt;br /&gt;{client_first_name} {client_last_name}&lt;/p&gt;\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;', '0', '2013-01-08 06:18:09', '1', 118, 'system','Notification to collection agency after previous validation response insufficient alleging violations and stern legal warning. ','Certified mail receipts, copies of previous letters','Collection Agency');
INSERT INTO `crd_letter_templ` (`itempl_id`, `itempl_catgid`, `vtempl_title`, `vtempt_text`, `efavorite`, `dtempl_createdon`, `estatus`, `iOrder`, `vadded_by`,`letter_description`,`documents_needed`,`recipient`) VALUES
(111, 4, 'Warning Violation for Expired Debt Collection', '<p>{client_first_name} {client_last_name}<br />{client_address}&nbsp;</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}&nbsp;</p>\n<p>{curr_date}&nbsp;</p>\n<p>Re: {account_number}&nbsp;</p>\n<p>To Whom It May Concern,&nbsp;</p>\n<p>Please be advised that you are attempting to collect on an expired debt. I am invoking my right to cease you, based on factual law that this debt in question is legally expired under the Statute of Limitations.&nbsp; Accordingly, I am requesting that you do not attempt to collect this expired debt, and should you seek legal recourse I will invoke my right of the expired statute as a valid defense.&nbsp;</p>\n<p>Additionally any attempts to harm my credit history and rating by updating or changing dates after you have been informed that the debt is expired, is a direct violation of the FDCPA. Any abuse to my credit rating on your part will be met with all recourse available to me by the law.&nbsp;</p>\n<p>I am aware of how long items may remain on my credit reports and any attempt to extend the reporting time will be investigated by me, and reported to my State Attorney General and the American Collectors Association.&nbsp;</p>\n<p>I am completely aware of how long the debt may be legally collectable and how long it may be legally reportable. I realize a debt is allowed to be reported on my credit history for no longer than 7 years, and my research has shown me that often a collection agency will reset the date of original charge off to the date they purchased it, thus trying to extend the reporting time in an attempt to force a consumer into paying it. I am informing you of this knowledge so that you may do the right thing.&nbsp;</p>\n<p>I have no intentions of renewing the expired statute of limitations, so please stop wasting your time contacting me. I expect this will be the last time I hear from you.&nbsp;</p>\n<p>Sincerely,&nbsp;</p>\n<p>{client_signature}<br />____________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 06:18:36', '1', 119, 'system','Demand to stop collection attempts and reporting of expired debt with stern legal warning.','- N/A','Collection Agency'),
(112, 4, 'Warning Violation for Expired Debt Collection (Alternate)', '<p>{client_first_name} {client_last_name}<br />{client_address}&nbsp;</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}&nbsp;</p>\n<p>{curr_date}</p>\n<p>Re: {account_number}&nbsp;</p>\n<p>To Whom It May Concern,&nbsp;</p>\n<p>Please be advised that you are attempting to collect on an expired debt. I am invoking my right to cease you, based on factual law that this debt in question is legally expired under the Statute of Limitations.&nbsp; Accordingly, I am requesting that you do not attempt to collect this expired debt, and should you seek legal recourse I will invoke my right of the expired statute as a valid defense.&nbsp;</p>\n<p>Additionally any attempts to harm my credit history and rating by updating or changing dates after you have been informed that the debt is expired, is a direct violation of the FDCPA. Any abuse to my credit rating on your part will be met with all recourse available to me by the law.&nbsp;</p>\n<p>I am aware of how long items may remain on my credit reports and any attempt to extend the reporting time will be investigated by me, and reported to my State Attorney General and the American Collectors Association.&nbsp;</p>\n<p>I am completely aware of how long the debt may be legally collectable and how long it may be legally reportable. I realize a debt is allowed to be reported on my credit history for no longer than 7 years, and my research has shown me that often a collection agency will reset the date of original charge off to the date they purchased it, thus trying to extend the reporting time in an attempt to force a consumer into paying it. I am informing you of this knowledge so that you may do the right thing.&nbsp;</p>\n<p>I have no intentions of renewing the expired statute of limitations, so please stop wasting your time contacting me. I expect this will be the last time I hear from you.&nbsp;</p>\n<p>Sincerely,&nbsp;</p>\n<p>{client_signature}<br />____________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 06:20:22', '1', 120, 'system','Demand to stop collection attempts and reporting of expired debt with stern legal warning.','- N/A','Collection Agency'),
(113, 4, 'Warning of Expired Statute of Limitations', '<p>{client_first_name} {client_last_name}<br />{client_address}&nbsp;</p>\n<p>{creditor_name}<br />{creditor_address}<br />{creditor_city} {creditor_state} {creditor_zip}&nbsp;</p>\n<p>{curr_date}&nbsp;</p>\n<p>RE: Account number {account_number}&nbsp;</p>\n<p>To Whom It May Concern,&nbsp;</p>\n<p>Please be advised that you are attempting to collect on an expired debt. I am invoking my right to cease you, based on factual law that this debt in question is legally expired under the Statute of Limitations.&nbsp;&nbsp;</p>\n<p>Accordingly, I am requesting that you do not attempt to collect this expired debt, and should you seek legal recourse I will invoke my right of the expired statute as a valid defense.&nbsp;</p>\n<p>Additionally any attempts to harm my credit rating by updating or changing dates after you have been informed that the debt is expired, are a direct violation of the FDCPA.<br /><br />Any abuse to my credit rating on your part will be met with all recourse available to me.&nbsp;</p>\n<p>I am aware of how long items may remain on my credit reports and any attempt to extend the reporting time will be investigated by me, and reported to the American Collectors Association and my State Attorney General.&nbsp;</p>\n<p>I am completely aware of how long the debt is legally collectable and how long it is legally reportable. I realize a debt is allowed to be reported to my credit for 7 years, and my research has shown me that often a collection agency will reset the date of original charge off to the date they purchased it, thus trying to extend the reporting time in an attempt to force a consumer into paying it. I am informing you of this knowledge so that you may do the right thing.&nbsp;</p>\n<p>I have no intention of renewing the expired statute of limitations, so please stop wasting your time contacting me.&nbsp;&nbsp;</p>\n<p>I expect this will be the last time I hear from you.&nbsp;</p>\n<p>Sincerely,&nbsp;</p>\n<p>{client_signature}<br />____________________________<br />{client_first_name} {client_last_name}</p>\n<p>&nbsp;</p>', '0', '2013-01-08 06:20:52', '1', 121, 'system','Demand to stop collection attempts and reporting of expired debt with stern legal warning.','- N/A','Collection Agency'),
(114, 5, 'ChexSystem (Request Report)', '<p>***************Instructions delete these before saving and sending***************<br />Here is a letter for requesting a report from Chexsystems. Chexsystems stores data like a credit bureau for banking and financial institutions and they must follow the same rules as the Credit Bureaus and must maintain the same accuracy when reporting about your checking account history.<br />***************Instructions delete these before saving and sending***************</p>\n<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{curr_date}</p>\n<p>ChexSystems<br />Attn: Consumer Relations <br />7805 Hudson Road, Suite 100 <br />Woodbury, MN 55125</p>\n<p>By phone at 800-428-9623 or fax at 602-659-2197</p>\n<p>To Whom It May Concern,</p>\n<p>When I recently tried to open a checking account, I was informed that I had negative entries in my ChexSystems record.</p>\n<p>To my knowledge, have never had non-sufficient funds and I am not aware of any negative entries. Kindly forward me a copy of my ChexSystems record so that I may verify its accuracy.</p>\n<p>Kind regards,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}<br />ss# {ss_number}</p>', '0', '2013-01-08 06:22:49', '1', 2, 'system','Simple request for ChexSystems to send a copy of ChexSystems report. ','Photo ID, Proof of Address ','Misc. Letters'),
(115, 5, 'ChexSystems (Request Investigation)', '<p>***************Instructions delete these before saving and sending***************<br />Here is a letter for requesting an investigation from Chexsystems. Chexsystems stores data like a credit bureau for banking and financial institutions and they must follow the same rules as the Credit Bureaus and must maintain the same accuracy when reporting about your checking account history.<br />***************Instructions delete these before saving and sending***************</p>\n<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{curr_date}</p>\n<p>ChexSystems<br />Attn: Consumer Relations <br />7805 Hudson Road, Suite 100 <br />Woodbury, MN 55125</p>\n<p>To Whom It May Concern,</p>\n<p>I received a copy of my ChexSystems record and I have found several inaccuracies in the report.</p>\n<p>{dispute_item_and_explanation}</p>\n<p>In detail, you recorded that I had non-sufficient funds with [name of bank] on or around [date]. I am disputing this record because I believe it to be inaccurate. Please request evidence of this unresolved outstanding negative record from [bank name] and investigate this item for me.</p>\n<p>I understand that your repository is required by law to begin an investigation for me because you are a credit-reporting agency and must follow the Fair Credit Reporting Act. I await your results.</p>\n<p>Kind regards,</p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}<br />ss# {ss_number}</p>', '0', '2013-01-08 06:23:29', '1', 3, 'system','Demand for ChexSystems initiate a dispute of information appearing on ChexSystems report ','Photo ID, Proof of Address ','Misc. Letters'),
(116, 5, 'Request for Loan Modification', '<p>***************Instructions delete these before saving and sending***************<br />Instructions: Include Loan Modification Proposal, Hardship Letter, Monthly Expense Worksheet, Monthly Income Worksheet, Schedule of Real Estate Owned, Copy of recent mortgage statement, Copy of any delinquency notices, notice of default, or any other pertinent documents, Past 2 years tax returns, Past 2 months pay stubs, Past 2 months bank statements, Last 6 months profit and loss (if self-employed), Copy of drivers license, 4506T - Form<br />***************Instructions delete these before saving and sending***************</p>\n<p>Loan Modification Request- 1st Mortgage</p>\n<p>{client_first_name} {client_last_name}<br />{client_address}<br />{t_no}</p>\n<p>{creditor_name}<br />{creditor_address}</p>\n<p>{curr_date}</p>\n<p>Re: Loan Modification Request- 1st Mortgage Loan # (LOAN NUMBER).</p>\n<p>To Whom It May Concern,</p>\n<p>Enclosed with this package, you will find my loan modification request and supporting documentation for a loan modification regarding loan number (LOAN NUMBER). After reviewing my income and the current real estate market, you will find that my loan modification request is necessary. In my current situation, the mortgage payments are not<br />affordable. However, with the proposed loan modification, I will be able to consistently make payments on time and avoid a foreclosure. I would prefer to stay in my home, but if a modification is not possible I will be forced into foreclosure.</p>\n<p>Please review the enclosed documents outlining my overall financial situation and real estate market conditions. You may contact me with any questions or requests for further documentation.</p>\n<p>Sincerely,</p>\n<p>{client_signature}<br />_____________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 06:24:32', '1', 4, 'system','Request to creditor to review financial documents for consideration of home loan modification. ','Loan Modification Proposal, Hardship Letter, Monthly Expense Worksheet, Monthly Income Worksheet, Schedule of Real Estate Owned, Copy of recent mortgage statement, Copy of any delinquency notices, notice of default, or any other pertinent documents, Past 2 years tax returns, Past 2 months pay stubs, Past 2 months bank statements, Last 6 months profit and loss (if self-employed), Copy of driver\'s license, 4506T - Form','Misc. Letters'),
(117, 5, 'Letter Of Hardship For Loan Modification', '<p>***************Instructions delete these before saving and sending***************<br />Instructions: Do not copy this letter exactly as written. We suggest that you modify this to letter be unique to your situation and hardship.<br />***************Instructions delete these before saving and sending***************</p>\n<p>{client_first_name} {client_last_name}<br />{client_address}<br />{t_no}</p>\n<p>{creditor_name}<br />{creditor_address}</p>\n<p>{curr_date}</p>\n<p>Re: Letter of Hardship</p>\n<p>To Whom It May Concern,</p>\n<p>I/We are requesting that Lender, Servicer, PMI, Governmental guarantor or insurer, representing lawyer, or other party related to this case review my financial situation to see if I/We qualify for any workout option.</p>\n<p>I/We are having problems making my monthly payments because of financial difficulties created by:</p>\n<p>(Unemployment, Reduced Income, Divorce, Medical Bills, Too Much Debt, Death of my Spouse, Payment Increase, Business Failure, Job Relocation, Illness, Military Service, Incarceration or Other -- Please Specify)</p>\n<p>I/We believe that my/our situation is (Choose: Temporary / Permanent)</p>\n<p>I have recently received a significant pay cut due to the current devastating economy. I used almost all of my savings and it is getting more and more difficult to stay up to date on my mortgage payment. As a result of the outlay in expenses and the bleeding dry of my money, I am struggling to make my mortgage payments. Kindly consider my current situation and consider my request for a short sale. I had every intention on making good on this loan, but at this time it does not like possible.</p>\n<p>When I received this mortgage, my mortgage broker promised me a low fixed rate mortgage. When I arrived for the closing, my rate was relatively low; however, it was only fixed for a short time. At the closing table, my broker told me the lender would refinance me in before the loan would reset and pressured me into signing the loan documents. At this time, my rate has gone way up and I cannot get a refinance. There is no equity in my home and the value has dropped tremendously. Please consider us for a short sale, as we see no other option make our housing payments affordable.</p>\n<p>Thank you for your assistance and cooperation.</p>\n<p>I/We, state the information provided above to be true and correct to the best of my/our knowledge.</p>\n<p>Sincerely,</p>\n<p>{client_signature}<br />_____________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 06:25:32', '1', 5, 'system','Notify creditor of financial hardship and request to modify loan.','- N/A','Misc. Letters'),
(118, 5, 'Letter Of Hardship For Loan Modification (Alternate)', '<p>***************Instructions delete these before saving and sending***************<br />Instructions: Do not copy this letter exactly as written. We suggest that you modify this to letter be unique to your situation and hardship.<br />***************Instructions delete these before saving and sending***************</p>\n<p>{client_first_name} {client_last_name}<br />{client_address}<br />{t_no}</p>\n<p>{creditor_name}<br />{creditor_address}</p>\n<p>{curr_date}</p>\n<p>Re: Letter of Hardship</p>\n<p>Borrower: {client_first_name} {client_last_name}</p>\n<p>Subject Property: (PROPERTY ADDRESS), Loan Number: ##########</p>\n<p>To Whom It May Concern,</p>\n<p>I am writing this letter to explain our family&rsquo;s unfortunate situation that has caused us to become delinquent on our mortgage. We have tried everything in our power to keep current on our payments but unfortunately since our interest rate adjusted, we have fallen behind and would like you to consider working with us to reduce our monthly payments.</p>\n<p>The main reasons that caused us to become late are a decrease in our income, increase in our monthly obligations, current market conditions, our adjustable rate mortgage, and our inability to refinance.</p>\n<p>I work as a waitress and my husband works at a marketing manager for a local screen printing company. Most of my income has been generated by tips and has decreased dramatically due to the unfortunate economic situation. My husband job is secure and he has been with the same company for 2 years. We have a 3 year old son and cannot afford daycare in order to get a second job.</p>\n<p>For the past several months we have been cutting back on our misc. expenses. We no longer have premium cable, go on vacations, or eat out. Our credit cards are getting maxed out due to us paying our mortgage on them and can no longer keep that up. We have currently missed 2 payments and wish to work out a payment plan with you after you reduce our rates to something we can afford.</p>\n<p>My husband and I consulted mortgage professionals regarding a refinance but due to our lack of equity, the falling home prices in our community, and our lack of assets we were denied.</p>\n<p>I have no other choice but to ask you to please consider my request for a loan modification. My family and I would really be grateful if you can help us work out a payment schedule we could afford. We do not want to lose our home. We wish to continue making mortgage payments on time for the remainder of our loan.</p>\n<p>Sincerely,</p>\n<p>{client_signature}<br />_____________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 06:26:05', '1', 6, 'system','Notify creditor of financial hardship with personal details and request to modify loan.','- N/A','Misc. Letters'),
(119, 5, 'Letter Of Hardship For Loan Modification (Alternate 2)', '<p>***************Instructions delete these before saving and sending***************<br />Instructions: Do not copy this letter exactly as written. We suggest that you modify this to letter be unique to your situation and hardship.<br />***************Instructions delete these before saving and sending***************</p>\n<p>{client_first_name} {client_last_name}<br />{client_address}<br />{t_no}</p>\n<p>{creditor_name}<br />{creditor_address}</p>\n<p>{curr_date}</p>\n<p>Re: Letter of Hardship</p>\n<p>Borrower: {client_first_name} {client_last_name}</p>\n<p>Subject Property: (PROPERTY ADDRESS), Loan Number: ##########</p>\n<p>To Whom It May Concern:</p>\n<p>We are writing to you to explain our current financial situation that has caused us to default on our loan agreement. We don&rsquo;t want to lose our home and will anything we can to work with you to remedy the situation and find a solution that will benefit us both. We first became delinquent on our mortgage payments due to [INSERT YOUR REASON HERE BRIEFLY]. We&rsquo;ve tried to bring the account current, but haven&rsquo;t been able to catch up by paying the full amount due. The trouble started approximately [INSERT DATE HERE] and we believe that this is a [TEMPORARY or PERMANENT] hardship.</p>\n<p>We are now in a better position and would like to work out a plan to begin making payments again and stay in our home. We are hard working, responsible individuals willing to work to keep our home. We would appreciate it if you would consider a modification to our existing loan terms in order to lower the monthly payment and include some or all of the past due amount. We&rsquo;ve created and implemented a new budget for our family and we are confident that we would be able to meet the new, lower monthly payment every month without fail. We&rsquo;d appreciate any help or suggestions you could give to us regarding this matter. It&rsquo;s an extremely difficult time for our family and we&rsquo;d really like to get the issue resolved as soon as possible.</p>\n<p>Sincerely,</p>\n<p>{client_signature}<br />_____________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-01-08 06:26:39', '1', 7, 'system','Notify creditor of financial hardship with personal details and request to modify loan.','- N/A','Misc. Letters'),
(120, 5, 'Letter to Dismiss Court Judgment', '<p>{client_first_name} {client_last_name}<br />{client_address}&nbsp;</p>\n<p>[Creditor/Furnisher]<br />[Creditor/Furnisher Address]&nbsp;</p>\n<p>Re: Agreement to Dismiss Court Judgment&nbsp;</p>\n<p>Court Name and Location: (COURT NAME AND LOCATION)&nbsp;</p>\n<p>Judgment Creditor: (CREDITOR NAME)&nbsp;</p>\n<p>Judgment Debtor: (DEBTOR NAME)&nbsp;</p>\n<p>Case Number: (CASE NUMBER)&nbsp;</p>\n<p>Judgment: (JUDGMENT # AND INFO)&nbsp;</p>\n<p>Date of Entry:&nbsp; (DATE)&nbsp;</p>\n<p>We, the undersigned Judgment Creditor and Judgment Debtor have agreed to settle this matter and hereby jointly apply to the court for an order that the judgment involved (enter court case number and date entered) be set aside and dismissed.&nbsp;&nbsp;</p>\n<p>&nbsp;_________________________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ____________<br />Signed: Judgment Credit:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Date signed&nbsp;&nbsp;</p>\n<p>_________________________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ____________<br />Judgment Debtor:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Date signed</p>', '0', '2013-01-08 06:27:03', '1', 8, 'system','Creditor agreement to dismiss judgment with no payment terms. Can be sent alongside settlement offer as separate agreement.','- N/A','Misc. Letters'),
(121, 3, 'Basic Dispute for Creditor or Furnisher', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{ss_number}</p>\n<p>{creditor_name}<br />{creditor_address}&nbsp;<br />{creditor_city},&nbsp;{creditor_state}&nbsp;{creditor_zip}</p>\n<p>{curr_date}</p>\n<p>Re: &nbsp;Remove Inaccurate Information from my Credit Reports.&nbsp;Account #{account_number}&nbsp;</p>\n<p>To Whom It May Concern:</p>\n<p>I received a copy of my credit report and found the following item(s) to be errors. See the attached copy of my credit report; the errors have been highlighted. Here as follows are items in error:</p>\n<p>{creditor_name}<br />Account #{account_number}&nbsp;<br />{dispute_item_and_explanation}</p>\n<p>By the provisions of the Fair Credit Reporting Act, I demand that these items be investigated and removed from my report.&nbsp;I understand that under 15 U.S.C. Sec. 1681i(a), you must complete this investigation within 30 days of receipt of this letter.</p>\n<p>Thank you for your time and help in this matter.</p>\n<p>Sincerely,</p>\n<p></p>\n<p>{client_signature}<br />_____________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2013-08-07 10:51:00', '1', 0, 'system','Demand creditor to investigate and remove from credit report. ','- N/A','Creditor '),
(122, 4, 'Basic Dispute for Collections', '<p>{client_first_name} {client_last_name}<br /> {client_address} <br /> {ss_number}</p>\r\n<p>{creditor_name}<br /> {creditor_address}<br /> {creditor_city}, {creditor_state} {creditor_zip}</p>\r\n<p>{curr_date}</p>\r\n<p>Re: Dispute of Collections Action: Case #{account_number}.</p>\r\n<p>To Whom It May Concern:</p>\r\n<p>I received a copy of my credit report and found the following errors. See the attached copy of my credit report; the errors have been highlighted. Here as follows is error:</p>\r\n<p>{creditor_name}<br /> Account #{account_number}&nbsp;<br /> {dispute_item_and_explanation}</p>\r\n<p>I am hereby requesting that you confirm the fact that I owe this debt as required by any applicable state and federal laws. Please contact the creditor to obtain verification.</p>\r\n<p>In addition, under the provisions of state and federal Fair Debt Collection Practices Act (FDCPA), Fair Credit Reporting Act (FCRA), and related consumer statutes, I am hereby instructing you to cease collection of the debt while efforts are made to obtain verification. Until you resolve this error with the creditor, you should neither contact me nor anyone else except the creditor about this collection.</p>\r\n<p>Furthermore, any reporting of this matter to credit reporting agencies is premature. Until you have investigated my dispute, you should not relay negative information to a credit reporting agency. If negative information has already been reported, you must notify the agency to remove said report until the investigative process is over so that my credit report remains accurate, or at the very least, my credit report should be updated to reflect my dispute.</p>\r\n<p>Your next contact with me should be to either notice that the creditor has failed to provide verification of the debt and that the matter has been closed or that you believe that this debt is valid and are providing proof of my responsibility. If the former, please confirm that I am not being held responsible for the debt in writing and also that if the account has already been noted on my credit report, that you will contact the bureau(s) in question to have the account removed. If the latter, I expect that you will provide me with an explanation as to why you have decided not to remove this account from collections and a copy of all documents relevant to the debt such as the application, bills, records of communications and payments, and any other data that indicates my responsibility.</p>\r\n<p>I am instructing you not to contact any third parties such as my employer, neighbors, friends or family members. In addition, you may not contact me by phone at work or at my home about this collection activity. All future correspondence should be sent to me in writing.</p>\r\n<p>Please acknowledge that you have received this notice within 14 days.&nbsp;</p>\r\n<p>Sincerely,</p>\r\n<p></p>\r\n<p>{client_signature}<br />_______________________________________<br /> {client_first_name} {client_last_name}</p>', '0', '2013-08-07 20:23:16', '1', 0, 'system','Demand to collection agency to validate, stop collection activity and removal from credit report.','Copy of credit report with highlighted errors.','Collection Agency'),
(123, 2, 'Victim of Identity Theft', '<p>{client_first_name}&nbsp;{client_last_name}<br />{client_address}<br />{bdate}&nbsp;<br />{ss_number}<br /><br />{bureau_address}&nbsp;<br /><br />{curr_date}&nbsp;<br /><br />Dear Sir/Madam:</p>\r\n<p>I am contacting you about the compromising of my social security number. I am a victim of Identity Theft.&nbsp; I contacted the Federal Trade Commission and filed a complaint # and contacted the police department and obtained a police report # which both are attached. &nbsp;Please block and remove all information from my credit report, and send me an updated copy of my credit report.&nbsp; The following items do not belong to me and is a result of fraud that I did not authorize:</p>\r\n<p>{dispute_item_and_explanation}<br />Please block and remove all information resulting from Identity Theft pursuant to FCRA 605B (15 U.S.C. &amp; 1681 c-2) which states that these accounts must be removed within 4 Business Days of receipt.</p>\r\n<p><span lang=\"PT-BR\">Also, please send an updated copy of my credit report to the above address. According to the act, there shall be no charge for this updated report. I also request that you please send notices of corrections to anyone who received my credit report in the past six months.<br /><br />Sincerely,<br /><br /><br />{client_signature}<br />_____________________________</span></p>\r\n<p><span lang=\"PT-BR\">{client_first_name}&nbsp;{client_last_name}</span></p>', '0', '2016-07-19 10:07:33', '1', 0, 'system','Request credit bureau to remove fraudulent accounts from credit report.','Photo ID, Proof of Address, Copy of Identity Theft Police Report, Anything Related to Case, Notary Seal','Credit Bureau '),
(124, 2, 'Validate Debt (609 Letter)', '<p>{client_first_name} {client_last_name}<br />{client_address}</p>\n<p>{bureau_address}</p>\n<p>{curr_date}</p>\n<p>To Whom It May Concern,</p>\n<p>This letter is a formal complaint that you are reporting inaccurate and incomplete credit information.</p>\n<p>According to the Fair Credit Reporting Act, Section 609 (a)(1)(A), you are required by federal law to verify, through the physical verification of the original signed consumer contract, any and all accounts that you post on a credit report. Otherwise anyone paying for your reporting services could fax, mail or email in a fraudulent account.&nbsp;<br /><br />I demand to see verifiable proof (i.e.: an original consumer contract with my signature on it) that you have on file for the account listed below.&nbsp;<br /><br />Your failure to positively verify these accounts has hurt my ability to obtain credit. Under the FCRA, unverifiable accounts must be removed and if you are unable to provide me a copy of verifiable proof, you must remove the account listed below.&nbsp;<br /><br />I demand that the following account be verified or removed immediately:<br /><br />{dispute_item_and_explanation}</p>\n<p>In addition, please remove all non-account holding inquries over 30 days old.&nbsp;Also, please add a promotional suppression to my credit file.&nbsp;<br /><br />Under federal law, you have thirty (30) days to complete your re-investigation. Be advised that the description of the procedure used to determine the accuracy and completeness of the information is hereby requested as well, to be provided within fifteen (15) days of the completion of your re-investigation.</p>\n<p>Thank you,<br /><br /></p>\n<p>{client_signature}<br />_________________________________________<br />{client_first_name} {client_last_name}</p>', '0', '2016-10-08 14:49:45', '1', 0, 'system','Demand credit bureau be provided proof from creditor that the account is valid or remove it from credit report. Also, requests credit bureaus to place promotional inquiry block on credit report.','Photo ID, Proof of Address ','Credit Bureau'),
(5001, 2, 'Method of Verification (MOD)', '<p><strong>[When the bureau responds to your dispute and request for verification/validation, their response may be vague. For instance, they will sometimes just say &ldquo;verified&rdquo; without offering actual proof. When this happens, you have the right by law to challenge how the credit bureau came to the decision. FCRA Act Section 611, gives you the right to request an explanation of the verification method used by the CRA. If either party has the records you can request a copy under the FACTA act, SEC 312 (b) and (c). This document will need &nbsp;modifications depending on the situation. See the notes below (in bold). Add those modifications&nbsp;when you\\\'re in the final step of the CRC Dispute Wizard 3 (the final viewer/editor page) and then delete these instructions]</strong><br /><br />{client_first_name} {client_last_name}<br />{client_address}<br />{bdate}<br />{ss_number}</p>\r\n<p>{bureau_address}<br />Attn: Customer Relations Department</p>\r\n<p>{curr_date}<br /><br />Re: Request to describe method of verification<br /><br />To Whom It May Concern:</p>\r\n<p>I am writing to request the method of verification for dispute initiated on <strong>[ENTER DATE HERE]</strong> and the subsequent response received on <strong>[ENTER CORRECT DATE HERE]</strong> enclosed with this letter.<br /><br />Re:&nbsp;{dispute_item_and_explanation}&nbsp;&nbsp;<strong>[Manually modify this line when you\\\'re in the final step of the dispute wizard (editor page)]</strong></p>\r\n<p>Please send the following information used to verify the validity of <strong>[Manually type in the items you\\\'re wanting them to describe, i.e.; identify item(s) by the name of the source, such as creditor or tax court, and the type of item, such as credit account, judgment, etc.]</strong>:</p>\r\n<ol>\r\n<li>The name of the original creditor</li>\r\n<li>The creditors address and telephone number</li>\r\n<li>The person&rsquo;s name they verified the dispute with</li>\r\n<li>The documentation used to verify the dispute</li>\r\n</ol>\r\n<p>In accordance with FCRA, Section 611, I am requesting this information to review for completeness and accuracy and appropriateness. In lieu of sending the information you can reopen the dispute and ensure a proper investigation is performed.</p>\r\n<p>I would appreciate a timely response outlining the steps that will occur to resolve this matter. If I do not receive a response I will have no choice but to exercise my right under FRCA, Section 616, and pursue legal action.</p>\r\n<p>Sincerely,<br />{client_signature}<br /><br />{client_first_name} {client_last_name}</p>\r\n<p>Attached Supporting Documentation: <strong>[Manually l<strong>ist what you are enclosing w</strong>hen you\\\'re in the final step of the dispute wizard (editor page). For example, it might be the letter from the court stating that they do not supply credit bureaus/CRA\\\'s with verification of bankruptcies or public records.&nbsp;]</strong><br /><br /></p>', '0', '2017-10-31 00:00:00', '1', 0, 'user','Follow up demand to credit bureau produce details regarding previous investigation.','Previous Letter, Photo ID, Proof of Address, Supporting Documents','Credit Bureau'),
(5002, 2, 'Method of Verification (MOD) Alternate', '<p><strong>[When the bureau responds to your dispute and request for verification/validation, their response may be vague. For instance, they will sometimes just say &ldquo;verified&rdquo; without offering actual proof. When this happens, you have the right by law to challenge how the credit bureau came to the decision. FCRA Act Section 611, gives you the right to request an explanation of the verification method used by the CRA. If either party has the records you can request a copy under the FACTA act, SEC 312 (b) and (c). This document will need &nbsp;modifications depending on the situation. See the notes below (in bold). Add those modifications&nbsp;when you\\\'re in the final step of the CRC Dispute Wizard 3 (the final viewer/editor page) and then delete these instructions]</strong><br /><br />{bureau_address}</p>\r\n<p>Attn: Customer Relations Department</p>\r\n<p>{curr_date}</p>\r\n<p><span>[TodaysDate]</span></p>\r\n<p><span>[RecipientName]</span></p>\r\n<p><span>Re:&nbsp;{dispute_item_and_explanation}&nbsp;&nbsp;<strong>[Manually modify this line when you\\\'re in the final step of the dispute wizard (editor page)]</strong><br /><br /> To Whom It May Concern:</span></p>\r\n<p><span>I am concerned about the validity and accuracy of your recent investigation of these accounts that are reporting on my credit report. Last month I requested an investigation because I felt the item was not being reported legally. Couple of days ago I received a letter stating that your investigation was complete. Please explain to me how you conducted your investigation!</span></p>\r\n<p><span>&nbsp;&nbsp;&nbsp;&nbsp; 1.Please explain to me what your representatives uncovered to lead them to believe that you are reporting this item as it <br />&nbsp; &nbsp; &nbsp; &nbsp; legally should be reported?<br /> &nbsp;&nbsp;&nbsp;&nbsp; 2.What certified documents were reviewed to conclude your investigation?<br /> &nbsp;&nbsp;&nbsp;&nbsp; 3.Please provide a complete copy of all of the information that was transmitted to the data furnisher as part of the investigation.<br /> &nbsp;&nbsp;&nbsp;&nbsp; 4.What did it cost your company to obtain the documents needed to complete your investigation?&nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp; 5.Please provide proof of your timely procurement of certified documents.<br /> &nbsp;&nbsp;&nbsp;&nbsp; 6.Did you speak directly to any agent of the company that was reporting the information to confirm the accuracy of what you are reporting?<br /> &nbsp;&nbsp;&nbsp;&nbsp; 7.If yes to above:<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a.Who did you speak to?&nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b.On what date?<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c.How long was the conversation?<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d.What was their position?<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e.What telephone number did you call?<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f. What is the name of the employee of your company that spoke directly to the above party?<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g.What is the position of the employee of your company that spoke directly to the above party?<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; h.How long has that employee been employed by your company?<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i.What formal training was provided to this employee to investigate items of this kind?<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; j.Was there any e-mail or written communication between members of your company and the above party?<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8.If so, please provide copies of all correspondence; supply copies of any and all conclusive documentation to prove that <br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;you have in fact conducted a reasonable investigation of the account in question.<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9.Provide the date of the commencement of delinquency<br /> &nbsp;&nbsp;&nbsp;&nbsp; 10.Provide the SPECIFIC date reporting that these items will cease</span></p>\r\n<p><span>Enclosed with your response to the above questions I respectfully request a notarized affidavit confirming the information that is provided is true and correct as per my civil rights granted under several federal laws. This information should not come as a form letter response.</span></p>\r\n<p><span>My initial dispute was detailed and directly related to the account in question. A template response will not be an acceptable response. If you cannot supply ALL of the above information in a timely manner as detailed in several laws, including but not limited to the Fair Credit Reporting Act, I must immediately demand the permanent removal of this item from my credit report.</span></p>\r\n<p><span>This erroneous entry is detrimental to my overall credit rating and has caused me severe financial and emotional distress. If you choose not to provide the above requested deletion or requested/required documentation of your investigation, I will pursue the enforcements of&nbsp;<br /> my constitutional rights via federal court proceedings. As you are well aware this information will come out through my formal discovery process, and necessary depositions. I have recently studied constitutional consumer protection laws along with civil/federal court procedures. I will represent myself pro-se and will formally request a jury trial.</span></p>\r\n<p><span>Please respond accordingly,<br />{client_signature}<br /><br />{client_first_name} {client_last_name}<br />{client_address}<br />{bdate}<br />{ss_number}</span></p>', '0', '2017-10-31 00:00:00', '1', 0, 'user','Follow up demand to credit bureau produce extensive details regarding previous investigation.','Previous Dispute Letter, Photo ID, Proof of Address','Credit Bureau');
INSERT INTO `crd_letter_templ` (`itempl_id`, `itempl_catgid`, `vtempl_title`, `vtempt_text`, `efavorite`, `dtempl_createdon`, `estatus`, `iOrder`, `vadded_by`,`letter_description`,`documents_needed`,`recipient`) VALUES
(125, 2,'Bureau No Response', '<p>{client_first_name} {client_last_name}<br /> {client_address}<br /> {bdate}<br /> {ss_number}</p>
<p>{bureau_address}</p>
<p>{curr_date}</p>
<p>To Whom It May Concern,</p>
<p>This letter is a formal complaint that you have ignored my previous request and failed to maintain reasonable procedures in your operations to assure maximum possible accuracy in the credit reports you publish. Credit reporting laws ensure that bureaus report only 100% accurate credit information and every step must be taken to assure the information reported is completely accurate and correct.</p>
<p>Please refer to my previous letter for the information that needs to be re-investigated.</p>
<p>{dispute_item_and_explanation}</p>
<p>The information must be deleted from my report as soon as possible. The information is inaccurate and misleading and as such represents a very serious error in your reporting. &nbsp;</p>
<p>Under federal law, you have thirty (30) days to complete your re-investigation. Be advised that the description of the procedure used to determine the accuracy and completeness of the information is hereby requested as well, to be provided within fifteen (15) days of the completion of your re-investigation.</p>
<p>Sincerely yours,</p>
<p>{client_signature}<br /> _________________________________________<br /> {client_first_name} {client_last_name}</p>', '0', '2019-10-07 11:10:09', '1', '93', 'system','30 Day reminder to credit bureau to respond when round one is ignored.','Previous Dispute Letter(s), Photo ID, Proof of Address','Credit Bureau'),
(126, 2,'Bureau Re-investigation', '<p>{client_first_name}&nbsp;{client_last_name}<br />{client_address}<br />{bdate}<br /> {ss_number}<br /><br />{bureau_address}&nbsp;<br /><br />Attn: Customer Relations Department&nbsp;<br /><br /> {curr_date}&nbsp;<br /><br /> To Whom It May Concern,</p>
<p>I am in total disagreement with your investigation response.&nbsp; The incorrect items listed below still appear on my credit report, even after your investigation.&nbsp; I would like these items immediately re-investigated and for good cause.&nbsp; These inaccuracies are highly injurious to my credit rating.</p>
<p>{dispute_item_and_explanation}</p>
<p>Furthermore, In accordance with The Fair Credit Reporting Act, Public law 91-506, Title VI, Section 611, Subsection A-D, I demand that you provide actual proof the information was verified, not a computer generated confirmation.</p>
<p>Please provide:</p>
<ol>
<li>&nbsp;The names and business addresses of each individual with whom you verified the information with above, so that I may follow up.</li>
<li>&nbsp;The date you contacted the individual funishers of information.</li>
<li>&nbsp;The method of communication you used to verify the information</li>
</ol>
<p><span lang=\"PT-BR\">I would also like to know if the furnisher provided you with my SSN, address or DOB. </span></p>
<p><span lang=\"PT-BR\">Please forward an updated credit report to me after you have completed your investigation and corrections.</span></p>
<p><span lang=\"PT-BR\">Your cooperation and prompt attention are required by law.<br /><br /> Sincerely,<br /><br />{client_signature}<br /> _________________________________________ </span></p>
<p><span lang=\"PT-BR\">{client_first_name}&nbsp;{client_last_name}</span></p>', '0', '2019-10-07 11:20:48', '1', '94', 'system','60 day follow up demand to credit bureau with warning to re-investigate disputed items.','Previous Dispute Letter(s), Photo ID, Proof of Address','Credit Bureau'), 
(127, 2,'Bureau Warning', '<p>{client_first_name} {client_last_name}<br /> {client_address}<br /> {bdate}<br /> {ss_number}</p>
<p>{bureau_address}</p><p>Re: Warning to Remove Incorrect Items from my Credit Report&nbsp;</p>
<p>{curr_date}</p><p>To Whom It May Concern:</p><p>I recently sent you a request to reinvestigate the information previously disputed. I have attached my previous correspondence for you to revisit.</p>
<p>The computer-generated response I received is unacceptable and I am losing patience. If the information is not immediately reinvestigated and removed, I will be forced to seek legal counsel for relief through the court and file complaints with regulatory enforcement agencies including the CFPB, FTC and my state attorney general.&nbsp; &nbsp;</p>
<p>Remove this incorrect information at once and send me an updated copy of my credit history report. <br /><br /><span>{dispute_item_and_explanation}&nbsp;</span><br /><br />I also request that you please send notices of corrections to anyone who received my credit report in the past six months.</p>
<p>Sincerely,</p>
<p>{client_signature}<br /> _____________________________________<br /> {client_first_name} {client_last_name}</p>', '0', '2019-10-07 11:40:35', '1', '95', 'system','Follow up demand to credit bureau with stern warning to re-investigate disputed items.','Previous Dispute Letter(s), Photo ID, Proof of Address','Credit Bureau'),   
(128, 2,'Insufficient ID Response', '<p>{client_first_name} {client_last_name}<br /> {client_address}<br /> {bdate}<br /> {ss_number}</p>
<p>{bureau_address}</p><p>{curr_date}</p><p>To Whom It May Concern,</p>
<p>I mailed you a letter disputing inaccurate information on my credit report over a month ago and in response I received a letter from your firm stating the ID I submitted was insufficient to verify my address and identity.</p>
<p>The identification I submitted is sufficient according to your guidelines and I demand that you examine the enclosed documents more carefully this time. I have also included my original letter for your convenience in this envelope.</p>
<p>The disputed items must be investigated. <br /><br />{dispute_item_and_explanation}</p>
<p>I respectfully request you to process the investigation as prescribed by my rights under the FCRA. Under federal law, you have 30 days to complete your reinvestigation. Be advised that the description of the procedure used to determine the accuracy and completeness of the information is hereby requested as well. Please provide this information within 15 days of the completion of your reinvestigation.</p>
<p>Sincerely yours,</p>
<p>{client_signature}<br /> _________________________________________<br /> {client_first_name} {client_last_name}</p>', '0', '2019-10-07 12:12:37', '1', '96', 'system','Follow up demand to credit bureau with warning to re-investigate disputed items after previous response was deemed \"Insufficient ID\"','Photo ID, Proof of Address, previous letter','Credit Bureau'),   
(129, 3,'Furnisher Basic Dispute', '<p>{client_first_name} {client_last_name}<br /> {client_address}<br /> {ss_number}</p>
<p>{creditor_name}<br /> {creditor_address}&nbsp;<br /> {creditor_city},&nbsp;{creditor_state}&nbsp;{creditor_zip}</p>
<p>Re: &nbsp;Remove Inaccurate Information from my Credit Reports.&nbsp; &nbsp;</p>
<p>{curr_date}</p><p>To Whom It May Concern:</p>
<p>I received a copy of my credit report and found you are reporting incorrect information to the credit bureaus.</p>
<p>Here are the error(s):</p>
<p>{dispute_item_and_explanation}</p>
<p>Under federal law, as a furnisher of information to consumer reporting agencies, you must conduct a reasonable investigation of my dispute and you must complete this investigation within 30 days of receipt of this letter. I demand that this information be investigated and either verified or removed from my report. Please send me confirmation the information has been removed from my credit files.</p>
<p>Thank you for your time and help in this matter.</p>
<p>Sincerely,</p>
<p>{client_signature}<br /> __________________________________ <br /> {client_first_name} {client_last_name}</p>', '0', '2019-10-07 12:25:22', '1', '67', 'system','The first letter you send to furnishers and can be used to request verification.','- N/A','Furnisher'),  
(130, 3,'Furnisher No Response', '<p>{client_first_name}&nbsp;{client_last_name}<br />{client_address}<br />{bdate}<br />{ss_number}<br /><br />{creditor_name}<br />{creditor_address} <br />{creditor_city},&nbsp;{creditor_state}&nbsp;{creditor_zip}</p>
<p>{curr_date}</p><p>To Whom It May Concern,</p>
<p>This letter is a formal complaint that you have reported inaccurate and incomplete credit information to the credit bureaus.</p>
<p>Federal laws require furnisher&rsquo;s of information to report accurate credit information to the credit bureaus and in this case, you have failed to do so. Every step must be taken to assure the information reported is completely accurate and correct. I disputed the following information over 30 days ago and you have not yet responded:</p>
<p>{dispute_item_and_explanation}</p>
<p>This inaccurate information must be deleted from my credit file immediately. Please contact the credit agencies you have reported it to and remove this misleading information from my credit profile.</p>
<p>Under federal law, you must complete your re-investigation in a timely manner. Be advised that the description of the procedure used to determine the accuracy and completeness of the information is hereby requested as well, to be provided within fifteen (15) days of the completion of your investigation.</p>
<p>Sincerely yours,</p>
<p>{client_signature}<br /> _________________________________________<br /> {client_first_name} {client_last_name}</p>
<p><br /><br /><br /></p>', '0', '2019-10-07 12:42:29', '1', '68', 'system','30 Day reminder to furnisher to respond when round one is ignored.','Previous letter','Furnisher'), 
(131, 3,'Furnisher Re-investigation', '<p>{client_first_name} {client_last_name}<br />{client_address}<br />{bdate}<br />{ss_number}</p>
<p>{creditor_name}<br /> {creditor_address}&nbsp;<br /> {creditor_city},&nbsp;{creditor_state}&nbsp;{creditor_zip}</p>
<p>Attn: Customer Relations Department</p><p>{curr_date}</p>
<p>To Whom It May Concern,</p>
<p>I am in disagreement with the information listed below which you reported to the credit agencies and still appear on my credit report, even after your investigation. I would like these item(s) immediately re-investigated and removed. These inaccuracies are impacting my credit rating.</p>
<p>{dispute_item_and_explanation}</p>
<p>Please confirm you have completed your investigation and corrections by notifying by mail. Your cooperation and prompt attention are appreciated.</p>
<p>Sincerely yours,</p>
<p>{client_signature}<br /> ________________________________________ <br /> {client_first_name} {client_last_name}</p>', '0', '2019-10-07 14:20:38', '1', '69', 'system','60 day follow up demand to credit bureau with warning to re-investigate disputed items.','Previous letter','Furnisher'),  
(132, 3,'Furnisher Warning', '<p>{client_first_name} {client_last_name}<br /> {client_address}<br /> {bdate}<br /> {ss_number}</p>
<p>{creditor_name}<br /> {creditor_address}&nbsp;<br /> {creditor_city},&nbsp;{creditor_state}&nbsp;{creditor_zip}</p>
<p>Re: Warning&nbsp;&nbsp;</p>
<p>{curr_date}</p>
<p>To Whom It May Concern:</p>
<p>I recently sent you a request to reinvestigate incorrect items which you reported to the credit agencies. You ignored my request.</p>
<p>Federal law requires that you complete your reinvestigation of my request within 30 days. It has now been more than 30 days and the items remain on my report:</p>
<p>{dispute_item_and_explanation}<br /><br />I will assume that I have not received your reply because you have been unable to verify this information. If the information is not immediately reinvestigated and removed, I will be forced to seek legal counsel for relief through the court and file complaints with regulatory enforcement agencies including the CFPB, FTC and my state attorney general.&nbsp;&nbsp;</p>
<p>Sincerely yours,</p>
<p>{client_signature}<br /> ______________________________________<br /> {client_first_name} {client_last_name}</p>
<p>&nbsp;</p>', '0', '2019-10-07 14:35:12', '1', '70', 'system','Follow up demand to furnisher with stern warning to re-investigate disputed items.','Previous letter','Furnisher'),
(133, 4,'Validation', '<p>{client_first_name}&nbsp;{client_last_name}<br />{client_address}<br /><br /> {creditor_name}<br />{creditor_address}<br />{creditor_city},&nbsp;{creditor_state}&nbsp;{creditor_zip}<br /><br /><br /> RE: Validation Required&nbsp;<br /><br /><br />{curr_date}&nbsp;<br /><br />Re: Account # {account_number}&nbsp;<br /><br /> To Whom It May Concern,</p>
<p>I dispute your claim and I am requesting validation from you pursuant to the Fair Debt Collection Practices Act, 15 USC 1692g Sec. 809 (8) (FDCPA).</p>
<ul>
<li>Provide breakdown of fees including how you calculated what you claim I owe. 2 Provide a copy of my signature on a contract or document that holds me responsible for this alleged debt.</li>
<li>Cease any credit bureau reporting until debt has been validated by me as required under the FCRA.</li>
<li>Send me proof that you are licensed to collect debt in the my state.</li>
<li>Send this information to my address listed above and accept this letter-sent as my formal debt validation request, which I am allowed under the FDCPA.</li>
</ul>
<p><span lang=\"PT-BR\">I will await your reply with above requested proof. Upon receiving it, I will correspond back with you.<br /><br />Sincerely,<br /><br />{client_signature}<br />____________________________</span></p>
<p><span lang=\"PT-BR\">{client_first_name}&nbsp;{client_last_name}</span></p>', '0', '2019-10-07 14:54:21', '1', '128', 'system','Demand collection agency to provide proof debt is valid and accurate.','Previous letter','Furnisher'),
(134, 4,'Estoppel By Silence', '<p>{client_first_name}&nbsp;{client_last_name}<br />{client_address}<br /><br /> {creditor_name}<br />{creditor_address}<br />{creditor_city},&nbsp;{creditor_state}&nbsp;{creditor_zip}<br /><br />{curr_date}&nbsp;<br /><br />Re: Account number: {account_number}&nbsp;<br /><br /> To Whom It May Concern:</p>
<p>This letter is to formally advise you that I believe your company has violated several of my consumer rights.&nbsp; Specifically, you failed to validate a debt at my request, which is a FDCPA violation and you continued to report a disputed debt to the Credit Bureaus: another FCRA violation.&nbsp; Not only have you ignored my prior requests for validation of debt (proof attached: receipt copies or letter copies) but you continue to report this debt to the credit bureaus causing damage to my character.</p>
<p>This letter will again request that you follow the FDCPA and please provide the following validation of debt request:</p>
-Proof of your right to own/collect this alleged debt<br />-Balance claimed including all fees, interest and penalties<br /> -Contract bearing my personal signature<br />
<p><span lang=\"PT-BR\">As you may be aware, \"Estoppel by Silence\" legally means that you had a duty to speak but failed to do so therefore, that must mean you agree with me that this debt is false.&nbsp; I will use the Estoppel in my defense.<br /><br />I expect to receive the proof requested above within 15 days of this letter.&nbsp; Should you again ignore my request for validation of debt I reserve the right to sue your company for violations of my consumer rights as specified under both the FDCPA and the FCRA.&nbsp; I may also seek damages from you if warranted.<br /><br />Kind regards,<br /><br />{client_signature}<br />_________________________________________</span></p>
<p><span lang=\"PT-BR\">{client_first_name}&nbsp;{client_last_name}</span></p>', '0', '2019-10-07 15:14:29', '1', '129', 'system','Demand reinvestigation and validation demand to collection agency, failure warning using estoppel.','Previous validation demand','Furnisher'),
(135, 2,'Suspicious Dispute Response', '<p>{client_first_name} {client_last_name}<br /> {client_address}<br /> {bdate}<br /> {ss_number}</p>
<p>{bureau_address}</p>
<p>{curr_date}<br /><br /></p>
<p>Dear Sir/Madam:</p>
<p>I recently mailed you a letter disputing items appearing on my credit report, which you maintain. Your response to my letter was to deem my letter &quot;suspicious&quot;, implying it was not written by me and furthermore in a threatening to report my letter to law enforcement and/or state and federal regulatory agencies. Your response is ludicrous.</p>
<p>Absolutely nothing in my letter could reasonably given rise to the suspicion that it was not sent by me. The classification of my letter as &quot;suspicious&quot; is an incredible stretch of the term.I did in fact write and send the letter in question and you are attempting to circumvent the statutory investigation period defined by the FCRA. You are still bound by the 30 day investigation period which has now lapsed. Please remove the following items:</p>
<p>{dispute_item_and_explanation}</p>
<p>I demand you conclude your investigation by deleting the items in question and sending me a free copy of my credit reporting showing the changes have been made.<br /><br /></p>
<p>Sincerely,<br /><br /></p>
<p>{client_signature}<br /> _________________________________________<br /><br /> {client_first_name} {client_last_name}</p>', '0', '2020-03-26 11:10:09', '1', '93', 'system','Follow up demand to credit bureau with warning to re-investigate disputed items after previous response was deemed \"Suspicious\" ','Previous Dispute Letter, Photo ID, Proof of Address','Credit Bureau'),
(136, 2,'Victim of Identity Theft (With Affidavit)','<strong><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style=\"text-decoration: underline;\">INSTRUCTIONS</span></strong><span style=\"text-decoration: underline;\">&nbsp;</span></strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;For cases of identity theft, send the cover letter below to each credit bureau. <br /><br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style=\"text-decoration: underline;\"><strong>&nbsp;INCLUDE&nbsp;</strong></span><strong>&nbsp;<br /></strong><span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1. Identification and Proof of Address&nbsp;<br /><span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2. Copy of your police report&nbsp;<br /><span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;3. Signed and notarized affidavit to each credit bureau.<br /></span></span></span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Download a copy of the identity theft affidavit here:&nbsp;&nbsp; <br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a href=\"https://oag.ca.gov/sites/all/files/agweb/pdfs/privacy/id_theft_affidavit.pdf\">&nbsp;https://oag.ca.gov/sites/all/files/agweb/pdfs/privacy/id_theft_affidavit.pdf</a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <br /><br /><br /><br /><br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <strong>********************** ^ DELETE TITLE &amp; INSTRUCTIONS ABOVE ^ ***********************</strong><br /><br /><br /><br /><p>{client_first_name}&nbsp;{client_last_name}<br />{client_address}<br />{bdate}&nbsp;<br />{ss_number}<br /><br />{bureau_address}&nbsp;<br /><br />{curr_date}&nbsp;<br /><br />Dear Sir/Madam:</p>
<p><span lang=\"PT-BR\">I am a victim of identity theft. Please see the attached documents relating to this case and completed identity theft affidavit. Also, please refrain from reporting and block all information resulting from this case pursuant to FCRA 605B (15 U.S.C. & 1681 c-2) which states that this information must be removed within four business days of receipt.<br /><br /><br />Sincerely,<br /><br /><br />{client_signature}<br />_____________________________</span></p>
<p><span lang=\"PT-BR\">{client_first_name}&nbsp;{client_last_name}</span></p>','0', '2020-03-26 11:20:15', '1', '94', 'system','Request credit bureau to remove fraudulent accounts from credit report.','Photo ID, Proof of Address, Notarizes Identity Theft Affidavit, Copy of Police Report and Any Documents Related to Case.','Credit Bureau');
                        
-- --------------------------------------------------------

--
-- Table structure for table `crd_letter_templcatg`
--

CREATE TABLE `crd_letter_templcatg` (
  `itempl_catgid` int(10) NOT NULL,
  `vtempl_catg` varchar(100) NOT NULL,
  `vadded_by` varchar(50) DEFAULT 'user' COMMENT 'adding by who, system or user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_letter_templcatg`
--

INSERT INTO `crd_letter_templcatg` (`itempl_catgid`, `vtempl_catg`, `vadded_by`) VALUES
(1, 'Default', 'system'),
(2, 'Credit Bureau Letters', 'system'),
(3, 'Creditor Letters', 'system'),
(4, 'Collection Letters', 'system'),
(5, 'Misc. Letters', 'system');

-- --------------------------------------------------------

--
-- Table structure for table `crd_login_logs`
--

CREATE TABLE `crd_login_logs` (
  `iId` int(11) NOT NULL,
  `iUserId` int(11) NOT NULL,
  `vUserName` varchar(50) NOT NULL,
  `eUserType` enum('client','affiliate','team') NOT NULL,
  `vUserAgent` varchar(225) DEFAULT NULL,
  `vDeviceType` varchar(255) DEFAULT NULL,
  `dLoginTime` datetime DEFAULT NULL,
  `dLogoutTime` datetime DEFAULT NULL,
  `vIpAddress` varchar(50) DEFAULT NULL,
  `vLocation` varchar(255) DEFAULT NULL,
  `vToken` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_messages`
--

CREATE TABLE `crd_messages` (
  `iMsgId` int(11) NOT NULL,
  `vSubject` varchar(255) NOT NULL,
  `tMsgText` mediumtext NOT NULL,
  `vAttachment` varchar(255) NOT NULL,
  `vSender` enum('client','affiliate','admin','team') NOT NULL,
  `vRecipient` enum('client','affiliate','admin','team') NOT NULL,
  `iSenderId` int(11) NOT NULL,
  `iRecipientId` int(11) NOT NULL,
  `dSentOn` datetime NOT NULL,
  `eIsRead` enum('yes','no') NOT NULL,
  `iSenderDel` int(1) DEFAULT 1 COMMENT 'delete flag for sender user',
  `iRecipientDel` int(1) DEFAULT 1 COMMENT 'delete flag for recipient user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `crd_module_list`
--

CREATE TABLE `crd_module_list` (
  `imodule_id` int(11) NOT NULL,
  `vmodule_name` varchar(50) NOT NULL,
  `vmodule_short_code` varchar(10) NOT NULL,
  `vcontroller_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_module_list`
--

INSERT INTO `crd_module_list` (`imodule_id`, `vmodule_name`, `vmodule_short_code`, `vcontroller_name`) VALUES
(1, 'Clients & Leads', 'client', 'myclients,userdesk,wizard,organizer,notes,securemessage,messages,invoices,report'),
(2, 'Creditor / Furnisher', 'cred_furn', 'furnishers'),
(3, 'Library', 'library', 'mediacenter'),
(4, 'My Schedule', 'schedule', 'calendar'),
(5, 'Client Agreement', 'agreement', 'agreement,mycompany'),
(6, 'Team Members', 'team', 'mycompany,team,rolepermission'),
(8, 'Role & Permissions', 'role_perm', 'mycompany,team,rolepermission'),
(9, 'Business Dashboard', 'dashboard', 'dashboard,affiliatedashboard'),
(10, 'Affiliate Commision & Payment', 'aff_compmt', 'mycompany'),
(11, 'Everything', 'everything', 'everything,progress'),
(12, 'Chargebee', 'chargebee', 'mycompany'),
(13, 'Invoice', 'invoice', 'invoices'),
(14, 'Company Profile', 'cmpny_pr', 'mycompany'),
(15, 'Tasks', 'task', 'calendar'),
(16, 'Simple Audit', 'audittempl', 'audittemplate,mycompany');

-- --------------------------------------------------------

--
-- Table structure for table `crd_module_permission_list`
--

CREATE TABLE `crd_module_permission_list` (
  `imodule_permission_id` int(11) NOT NULL,
  `imodule_id` int(11) NOT NULL,
  `vpermission_text` varchar(50) NOT NULL COMMENT 'Permission Screen text',
  `vpermission_short_code` varchar(50) NOT NULL,
  `vtoggle_module_permission_id` varchar(50) NOT NULL COMMENT 'uncheck permissions'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_module_permission_list`
--

INSERT INTO `crd_module_permission_list` (`imodule_permission_id`, `imodule_id`, `vpermission_text`, `vpermission_short_code`, `vtoggle_module_permission_id`) VALUES
(1, 1, 'All clients & Leads', 'all_clients', '2'),
(2, 1, 'Assigned Clients & Leads Only', 'assigned_clients', '1'),
(6, 2, 'Add/Edit/View', 'add_edit', '8'),
(7, 2, 'Delete', 'delete', ''),
(8, 2, 'View Only', 'view_only', '6,7'),
(9, 3, 'Add/Edit/View', 'add_edit', '11'),
(10, 3, 'Delete', 'delete', ''),
(11, 3, 'View Only', 'view_only', '9,10'),
(12, 4, 'Add/Edit/View', 'add_edit', '14'),
(13, 4, 'Delete', 'delete', ''),
(14, 4, 'View Only', 'view_only', '12,13'),
(15, 5, 'Add/Edit/View', 'add_edit', '17'),
(16, 5, 'Delete', 'delete', ''),
(17, 5, 'View Only', 'view_only', '15,16'),
(18, 6, 'Add/Edit/View', 'add_edit', '20'),
(19, 6, 'Delete', 'delete', ''),
(20, 6, 'View Only', 'view_only', '18,19'),
(23, 8, 'Add/Edit/View', 'add_edit', '24'),
(24, 8, 'View Only', 'view_only', '23,39'),
(25, 9, 'View Only', 'view_only', ''),
(26, 1, 'Delete', 'delete', ''),
(27, 10, 'Add/Edit/View', 'add_edit', ''),
(28, 11, 'View Progress activity', 'view_progress', ''),
(29, 11, 'View First work pending list', 'view_pending_clients', ''),
(30, 11, 'View All to-dos', 'view_to_dos', ''),
(31, 11, 'View All files activity', 'view_files', ''),
(32, 12, 'Edit Chargebee Information', 'edit_chargebee', ''),
(33, 11, 'View All Communication', 'view_communication', ''),
(34, 13, 'Add/Edit/View', 'add_edit', '36'),
(35, 13, 'Delete', 'delete', ''),
(36, 13, 'View Only', 'view_only', '34,35'),
(37, 14, 'Edit Company Profile', 'edit_cmpny_pr', ''),
(38, 1, 'Add New Clients & Leads', 'add_clients', ''),
(39, 8, 'Delete', 'delete', ''),
(40, 15, 'Edit Tasks For All Team Members', 'edit_task_all', ''),
(41, 15, 'Bulk Edit', 'bulk_edit', ''),
(42, 16, 'Add/Edit/View', 'add_edit', '44'),
(43, 16, 'Delete', 'delete', ''),
(44, 16, 'View Only', 'view_only', '42,43');

-- --------------------------------------------------------

--
-- Table structure for table `crd_monthly_expense`
--

CREATE TABLE `crd_monthly_expense` (
  `iMonthlyExpense_id` int(11) NOT NULL,
  `iClient_id` int(11) NOT NULL,
  `vMonth` varchar(20) NOT NULL,
  `vYear` varchar(10) NOT NULL,
  `iLabel_id` int(11) NOT NULL,
  `vAmount` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_monthly_expense_label`
--

CREATE TABLE `crd_monthly_expense_label` (
  `iLabel_id` int(11) NOT NULL,
  `vLabel` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_monthly_expense_label`
--

INSERT INTO `crd_monthly_expense_label` (`iLabel_id`, `vLabel`) VALUES
(1, 'Auto: Fuel'),
(2, 'Auto: Insurance'),
(3, 'Auto: Maintenance/Repairs'),
(4, 'Auto: Payment'),
(5, 'Cable/Satellite'),
(6, 'Cell phone(s)'),
(7, 'Child support/Alimony'),
(8, 'Childcare'),
(9, 'Cigarettes/Alcohol'),
(10, 'Clothing'),
(11, 'Credit Card/Charge Card'),
(12, 'Dining'),
(13, 'Doctor/Prescriptions'),
(14, 'Education Expenses'),
(15, 'Electric Bill'),
(16, 'Entertainment'),
(17, 'Gas Bill'),
(18, 'Gifts'),
(19, 'Groceries/ Supplies'),
(20, 'Hobbies/Clubs/Sports'),
(21, 'Home Maintenance'),
(22, 'Insurance'),
(23, 'Internet Service'),
(24, 'Loan Payment'),
(25, 'Newspapers/Magazines'),
(26, 'Rent/Mortgage Payment'),
(27, 'Taxes'),
(28, 'Telephone'),
(29, 'Work Expenses');

-- --------------------------------------------------------

--
-- Table structure for table `crd_onboarding_popup`
--

CREATE TABLE `crd_onboarding_popup` (
  `pid` int(1) NOT NULL,
  `p_name` varchar(50) NOT NULL,
  `p_default_title` varchar(500) NOT NULL,
  `p_custom_title` text NOT NULL,
  `p_default_text` text NOT NULL,
  `p_custom_text` text NOT NULL,
  `p_custom_reminder` text NOT NULL,
  `p_default_reminder` text NOT NULL,
  `rp_main` varchar(100) NOT NULL,
  `rp_sub` varchar(100) NOT NULL,
  `video_enabled` enum('yes','no') NOT NULL DEFAULT 'no',
  `backup_rp_enabled` enum('yes','no') NOT NULL DEFAULT 'no',
  `p_status` enum('custom','default') NOT NULL DEFAULT 'default',
  `visibility` enum('on','off') NOT NULL DEFAULT 'on'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_onboarding_popup`
--

INSERT INTO `crd_onboarding_popup` (`pid`, `p_name`, `p_default_title`, `p_custom_title`, `p_default_text`, `p_custom_text`, `p_custom_reminder`, `p_default_reminder`, `rp_main`, `rp_sub`, `video_enabled`, `backup_rp_enabled`, `p_status`, `visibility`) VALUES
(1, 'Welcome Step', 'Welcome to your Client Portal', '', 'You can login 24/7 to see the live status of our progress, to communicate and exchange documents securely.<br><br>Here\'s a quick video to show you our process:', '', '', '', '', '', 'yes', 'no', 'default', 'on'),
(2, 'Order credit reports & scores', 'Let\'s order reports and scores', '', 'You can get these instantly from all 3 bureaus for a $1 trial of credit monitoring.<br><br>You\'ll order the reports and scores yourself.', '', '', 'Remember: If you keep the credit monitoring beyond the free trial, there is a monthly fee and they will explain when you sign up. We recommend keeping the credit monitoring through your credit repair process. However, you can cancel your credit monitoring if needed. The cost is small and it\'s a necessary expense, because it\'s the only way to see real time changes to your reports and scores.', 'IdentityIQ', '', 'no', 'no', 'default', 'on'),
(3, 'Request credit monitoring login details', 'Login Details for Credit Monitoring', '', 'Share your login details with us for the credit monitoring account.<br>', '', '', '', '', '', 'no', 'no', 'default', 'on'),
(4, 'Setup digital signature', 'Choose a Signature Style', '', 'To challenge negative items on your report, we will send carefully drafted letters to creditors and credit bureaus on your behalf.<br><br>Enter your full name as it should appear in your signature<br>', '', '', '', '', '', 'no', 'no', 'default', 'on'),
(5, 'Upload Photo ID', 'Upload Photo ID', '', 'If you like, you can take a photo of these with your phone and upload it here.<br><br>This can be a:', '', '', '', '', '', 'no', 'no', 'default', 'on'),
(6, 'Upload Proof of Address', 'Upload Proof of Address', '', 'If you like, you can take a photo of these with your phone and upload it here.<br><br>This can be a:', '', '', '', '', '', 'no', 'no', 'default', 'on'),
(7, 'On-boarding Completion Message', 'Thanks for completing these steps!', '', 'Now we can start to work on your accounts. <br> <br>Remember, we\'ll be sending many letters on your behalf. Be sure to forward all the correspondence that you receive. You can use the camera on your phone.<br> <br>We appreciate that you chose us and we look forward to improving your financial future! ', '', '', '', '', '', 'no', 'no', 'default', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `crd_options`
--

CREATE TABLE `crd_options` (
  `iOptionId` int(10) NOT NULL,
  `vOption` varchar(255) NOT NULL,
  `vOptionValue` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_options`
--

INSERT INTO `crd_options` (`iOptionId`, `vOption`, `vOptionValue`) VALUES
(1, 'Link_label', 'ORDER REPORT FROM MY FAVORITE PROVIDER'),
(2, 'Link_Desc', 'Add a provider for importing online credit reports.'),
(3, 'Link', 'http://www.privacyguard.com'),
(4, 'credit_info_page_content', '<div class=\"row\">\n<div class=\"col-sm-2\">\n<img class=\"img-responsive\" alt=\"home\" src=\"https://www.secureclientaccess.com/application/images/roadtogood.png\">\n</div>\n<div class=\"col-sm-10\">\n<div class=\"caption contact-box\">\n<span class=\"caption-subject font-dgrey uppercase contacs\">Client Information and Recommendations:</span>\n</div>\n<p>As your credit specialist, our most important job is to review your credit history reports with you and begin the process of disputing negative inaccurate items on your reports. Our next important job is to give you recommendations to follow, which will help you to speed up the process, achieve a higher score and keep it. While we do our part, please read the following information and follow our steps and your score will start to improve quickly.</p>\n</div>\n<div class=\"col-md-12 margin-20\">\n<ul>\n<li><a href=\"#con1\">How does credit repair work?</a></li>\n<li><a href=\"#con2\">Credit Report Basics</a></li>\n<li><a href=\"#con3\">Do I have a right to know what’s in my report?</a></li>\n<li><a href=\"#con4\">What is a Credit Score?</a></li>\n<li><a href=\"#con5\">Credit Score Ranges and Their Meaning</a></li>\n<li><a href=\"#con6\">How do Credit Bureaus determine my credit score? </a></li>\n<li><a href=\"#con7\">What type of information do credit bureaus collect and sell?</a></li>\n<li><a href=\"#con8\">How does a credit bureau determine my score?</a></li>\n<li><a href=\"#con9\">What is the secret to a high credit score?</a></li>\n<li><a href=\"#con10\">What happens if you are denied credit or don’t get the terms you want?</a></li>\n<li><a href=\"#con1\">The Fair Credit Reporting Act </a></li>\n<li><a href=\"#con12\">How can I speed up the process?</a></li>\n<li><a href=\"#con12\">7 steps to increase your credit score fast</a></li>\n</ul>\n</div>\n<div id=\"con1\" class=\"col-md-12 margin-20\">\n<span class=\"caption-subject font-dgrey uppercase contacs\">Client Information and Recommendations:</span>\n<p class=\"margin-10\">\n  Credit repair is 100% legal. It works because of a law called “The Fair Credit Reporting Act.” The FCRA gives you the right to dispute any item on your credit report. If that item cannot be verified within a reasonable time (usually 30 days) it must be removed. Even accurate negative items can often be removed or negotiated away. This law is the basis of all credit repair and the foundation of our business.\n</p>\n</div>\n<div id=\"\" class=\"col-md-9 margin-10\">\n<span class=\"caption-subject font-dgrey uppercase contacs\">Client Information and Recommendations:</span>\n<p class=\"margin-10\">\n  Your credit payment history and profile is the makeup of a credit report. These files or reports are maintained and sold by “consumer reporting agencies.” One type of consumer reporting agency is commonly known as a credit bureau. The largest three credit bureaus are Transunion, Equifax, and Experian. You have a credit record with these agencies if you have ever applied for a credit or charge account, a personal loan, or a job.Your credit record contains information about your income, debts, and credit payment history. It also indicates whether you have defaulted on any debts, have any outstanding judgments or child support, and whether or not you have any bankruptcies.\n</p>\n</div>\n<div id=\"\" class=\"col-md-3\">\n<img alt=\"home\" src=\"https://www.secureclientaccess.com/application/images/goodbadcredit.png\" class=\"img-responsive\">\n</div>\n<div id=\"con3\" class=\"col-md-12 margin-10\">\n<span class=\"caption-subject font-dgrey uppercase contacs\">Do I have a right to know what\'s in my report?\n</span>\n<p class=\"margin-10\">\n  Of course you do. By law, the agencies must give you a free report annually. However those free reports do not contain scores. For credit repair scores we recommend an inexpensive credit monitoring service.\n</p>\n</div>\n<div id=\"con4\" class=\"col-md-12 margin-20\">\n<span class=\"caption-subject font-dgrey uppercase contacs\">What is a Credit Score?\n</span>\n<p class=\"margin-10\">\n  A credit score is a number generated by a mathematical formula that is meant to predict credit worthiness. Credit scores range from 300-850. The higher your score is, the more likely you are to get a loan. The lower your score is, the less likely you are to get a loan. If you have a low credit score and you do manage to get approved for credit then your interest rate will be much higher than someone who had a good credit score and borrowed money. So, basically, having a high credit score can save many thousands of dollars over the life of your mortgage, auto loan, or credit card.\n</p>\n</div>\n<div id=\"con5\" class=\"col-md-9 margin-20\">\n<span  class=\"caption-subject font-dgrey uppercase contacs\">Credit Score ranges and their meaning</span>\n<p class=\"margin-10\">\n<strong>800 and Higher (Excellent)</strong> With a credit score in this range no lender will ever disapprove your loan application. Additionally, the APR (Annual Percentage Rate) on your credit cards will be the lowest possible. You’ll be treated as royalty. Achieving this excellent credit rating not only requires financial knowledge and discipline and, but also a good credit history. Generally speaking, to achieve this excellent rating you must also use a substantial amount of credit on an ongoing monthly basis and always repay it ahead of time.</p>\n<p>700 – 799 (Very Good) 27% of the United States population belongs to this credit score range. With this credit score range you will enjoy good rates and approved for nearly any type of credit loan or personal loan, whether unsecured or secured.</p>\n</div>\n<div class=\"col-md-3\">\n<img alt=\"home\" src=\"https://www.secureclientaccess.com/application/images/creditscore.png\" class=\"img-responsive\">\n</div>\n<div class=\"col-md-12 margin-10\">\n<p><strong>680 – 699 (Good)</strong>This range is the average credit score. In this range approvals are practically guaranteed but the interest rates might be marginally higher. If you’re thinking about a long term loan such as a mortgage, try working to increase your credit score higher than 720 and you will be rewarded for your efforts – your long term savings will be noticeable.</p>\n<p><strong>620 -679 (OK or Fair)</strong>Depending on what kind of loan or credit you are applying for and your credit history, you might find that the rates you are quoted aren’t best. That doesn’t mean that you won’t be approved but, certain restrictions will apply to the loan’s terms.</p>\n<p><strong>580 – 619 (Poor)</strong>With a poor credit rating you can still get an unsecured personal loan and even a mortgage, but, the terms and interest rates won’t be very appealing. You’ll be required to pay more over a longer period of time because of the high interest rates.</p>\n<p><strong>500 – 579 (Bad)</strong>With a score in this range you can get a loan but nothing even close to what you expect it to be. Some people with bad credit apply for loans to consolidate debt in search for a fresh start. However, if you decide to do that then proceed cautiously. With a 500 credit score you need to make sure that you don’t default on payments or you’ll be making your situation worse and might head towards bankruptcy, which is not what you want.</p>\n<p><strong>499 and Lower (Very Bad)</strong>If this is your score range you need serious and professional assistance with how you handle your credit. You’re making too many credit blunders and they will only get worse if you don’t take positive action. If you are thinking of a loan then keep in mind that if you do find a sub-prime lender (which won’t be easy), the rates will be very high and the terms will be very strict. We recommend that you fix your credit and only then move on to applying for a loan.</p>\n</div>\n<div id=\"con6\" class=\"col-md-7 margin-20\">\n<span class=\"caption-subject font-dgrey uppercase contacs\">How do Credit Bureaus determine my credit score?</span>\n<p class=\"margin-10\">35% - Payment History</p>\n<p>30% - Debt Ratio</p>\n<p>15% - Length of Credit History</p>\n<p>10% - Types of Credit</p>\n<p>10% - Number of Credit Inquiries</p>\n<p>The percentages in this chart show how important each of the categories is in determining your Credit score. We will help you to remove negative items from your payment history. We will also show you how to maximize your debt ratio score, even if paying off credit cards is not an option.</p>\n</div>\n<div class=\"col-md-5 margin-10\">\n<img alt=\"home\" src=\"https://www.secureclientaccess.com/application/images/creditscoregraph.png\" class=\"img-responsive\">\n</div>\n<div id=\"con6\" class=\"col-md-12  margin-20\">\n<span class=\"caption-subject font-dgrey uppercase contacs\">What type of information do credit bureaus collect and sell?\n</span>\n<p class=\"margin-10\">\n  Credit bureaus collect and sell four basic types of information:\n</p>\n<ol>\n<li>\n<p><strong>Identification   and employment information</strong><br>\n  Your name, birth date, Social Security number, employer, and spouse’s name are routinely recorded in your credit report. They may also provide information about your employment history, home ownership, income, and previous address, if a creditor requests this type of information.</p>\n</li><li>\n<p><strong>Public record information</strong><br>\n  Events that are a matter of public record, such as bankruptcies, foreclosures, or tax liens, may appear in your report.</p>\n</li><li>\n<p><strong>Inquiries</strong><br>\n  CRAs must maintain a record of all creditors who have asked for your credit history within the past year. It is generally beneficial to keep the number of inquires as low as possible.</p>\n</li><li>\n<p><strong>Payment history</strong><br>\n  Your accounts with different creditors are listed, along with the balances, high balances, and outstanding balances. Related events, such as referral of an overdue account to a collection agency, charge off accounts or other delinquencies may also be noted.</p>\n</li>\n</ol>\n</div>\n<div id=\"con8\"class=\"col-md-7 margin-20\">\n<span class=\"caption-subject font-dgrey uppercase contacs\">How does a credit bureau determine my score?\n</span>\n<p class=\"margin-10\">\n  Credit scoring models are complex and often vary among creditors and for different types of credit. If one factor changes, your score may change — but improvement generally depends on how that factor relates to other factors considered by the model.\n</p>\n<p><strong>Scoring  models generally evaluate the following types of information in your  credit report:</strong></p>\n<ul>\n<li>\n  <p> <strong>Do you pay</strong><strong> your bills on time?</strong> Payment history is a major factor in credit scoring. If you have paid bills late, have collections, or declared bankruptcy, these events will not reflect well in your credit score. </p>\n</li><li>\n  <p> <strong>Do you have a long credit history? </strong>Generally speaking, the longer your history of holding accounts is, the more trusted you will be as a borrower. </p>\n</li><li>\n  <p> <strong>Have you applied for credit recently? </strong>If you have many recent inquires this can be construed as being negative by the credit reporting agencies. Only apply for credit when you really want it. </p>\n</li><li>\n  <p> <strong>What is your outstanding debt? </strong> It is important that you are not using all of your available credit. If all of your credit cards are maxed out, your scores will reflect that you are not managing your debt wisely. </p>\n</li>\n</ul>\n</div>\n<div  class=\"col-md-5\">\n<img alt=\"meter\" src=\"https://www.secureclientaccess.com/application/images/metergraphics.png\" class=\"img-responsive\">\n</div>\n<div id=\"con9\" class=\"col-md-8 margin-20\">\n<span class=\"caption-subject font-dgrey uppercase contacs\">What is the secret to a high credit score?\n</span>\n<ol>\n<li>\n  <p>Always pay your bills on time!</p>\n</li><li>\n  <p>Don’t close old accounts!</p>\n</li><li>\n  <p>Don’t apply for any new credit!<span lang=\"\"> </span> </p>\n</li><li>\n  <p><strong>Don’t ever use more than 30% of your available credit on each credit card!</strong> </p>\n</li>\n</ol>\n</div>\n<div class=\"col-md-4\">\n<img alt=\"meter\" src=\"https://www.secureclientaccess.com/application/images/topscore.png\" class=\"img-responsive\">\n</div>\n<div id=\"con10\" class=\"col-md-8 margin-20\">\n<span class=\"caption-subject font-dgrey uppercase contacs\">What happens if you are denied credit or don’t get the terms you want?\n</span>\n<p class=\"margin-10\">\n  If you are denied credit, the Equal Credit Opportunity Act requires that the creditor give you a notice that tells you the specific reasons your application was rejected or the fact that you have the right to learn the reasons if you ask within 60 days. Indefinite and vague reasons for denial are illegal, so ask the creditor to be specific. Acceptable reasons include: “Your income was low” or “You haven’t been employed long enough.” Unacceptable reasons include: “You didn’t meet our minimum standards” or “You didn’t receive enough points on our credit scoring system.”\n</p>\n<p>If a creditor says you were denied credit because you are too near your credit limits on your charge cards or you have too many credit card accounts, you may want to reapply after paying down your balances or closing some accounts. Credit scoring systems consider updated information and change over time.</p>\n<p>If you’ve been denied credit, or didn’t get the rate or credit terms you want, ask the creditor if a credit scoring system was used. If so, ask what characteristics or factors were used in that system, and the best ways to improve your application. If you get credit, ask the creditor whether you are getting the best rate and terms available and, if not, why. If you are not offered the best rate available because of inaccuracies in your credit report, be sure to dispute the inaccurate information in your credit report.</p>\n</div>\n<div class=\"col-md-4 margin-10\">\n  <img alt=\"\" src=\"https://www.secureclientaccess.com/application/images/cople.gif\" class=\"img-responsive\">\n</div>\n<div id=\"con12\" class=\"col-md-12 margin-20\">\n<span class=\"caption-subject font-dgrey uppercase contacs\">How can I speed up the process?</span>\n<p class=\"margin-10\">\n  Following these 7 steps will increase your score quickly.\n</p>\n</div>\n<div id=\"con2\" class=\"col-md-9 margin-20\">\n<span class=\"caption-subject font-dgrey uppercase contacs\">Credit Report Basics</span>\n<ol class=\"margin-10\">\n<li>\n   <strong>Order fresh new copies of your credit reports from all 3 bureaus: Equifax, Experian and TransUnion. </strong><strong>*We will assist you with this step.</strong><br>\n   Credit reports are constantly changing. Therefore it is important to up-to-date copies. A good rule of thumb to know is:  If  someone else runs your score or reports, this will hurt your score. However, <strong>if you order your own credit reports</strong> (which we will help you with) <strong>your score will  not be affected. </strong>You also may want to sign  up for credit monitoring to see your reports and score and track  changes as they happen.\n </li>\n</ol>\n</div>\n<div class=\"col-md-3 margin-10\">\n  <img alt=\"home\" src=\"https://www.secureclientaccess.com/application/images/bargraph.png\" class=\"img-responsive\">\n</div>\n<div class=\"col-md-12\">\n      <ol start=\"2\" class=\"margin-10\">\n<li>\n<p>  <strong>Correct all inaccuracies on your Credit Reports. *We will assist you with this step.</strong><br>   \n  Go through your credit reports very carefully.  Especially look for; Late payments, charge-offs, collections or other  negative items that aren\'t yours, Accounts listed as \"settled,\"  \"paid derogatory,\" \"paid charge-off\" or anything  other than \"current\" or \"paid as agreed\" if you  paid on time and in full, Accounts that are still listed as unpaid  that were included in a bankruptcy, Negative items older than seven  years (10 in the case of bankruptcy) that should have automatically  fallen off your report (you must be careful with this last one,  because sometimes scores actually go down when bad items fall off  your report. It\'s a quirk in the FICO credit-scoring software, and  the potential effect of eliminating old negative items is difficult  to predict in advance). Also make sure you don\'t have duplicate  collection notices listed. For example; if you have an account that  has gone to collections, the original creditor may list the debt, as  well as the collection agency. Any duplicates must be removed!  Make  sure that your proper credit lines are posted on your Credit Reports. Often, in an effort to make you less  desirable to their competitors, some creditors will not post your  proper credit line. Showing less available credit can negatively  impact your credit score. If you see this happening on your credit  report, you have a right to complain and bring this to their  attention. If you have bankruptcies that should be showing a zero  balance…make sure they show a zero balance! Very often the creditor  will not report a \"bankruptcy charge-off\" as a zero balance  until it\'s been disputed.</p>\n</li>\n<li>\n<p><strong>If you have any negative marks on your credit report, negotiate with the creditor or lender to remove it. *We will assist you with this step.</strong><br>\n\n      If you are a long time customer and it\'s something simple like a one-time late payment, a creditor will often wipe it away to keep you as a loyal customer. Sometimes they will do this if you call and ask.  However, if you have a serious negative mark (such as a long overdue bill that has gone to collections), always negotiate a payment in exchange for removal of the negative item. Always make sure you have this agreement with them in writing. Do not pay off a bill that has gone to collections unless the creditor agrees in writing that they will remove the derogatory item from your credit report. This is important; when speaking with the creditor or collection agency about a debt that has gone to collections, do not admit that the debt is yours. Admission of debt can restart the statute of limitations, and may enable the creditor to sue you. You are also less likely to be able to negotiate a letter of deletion if you admit that this debt is yours. Simply say \"I\'m calling about account number ________\" instead of \"I\'m calling    about my past due debt.\" Again, as your credit specialist, we will help you with this step.</p>\n\n </li>\n <li>\n<p><strong>Pay all credit cards and any revolving credit down to below 30% of the available credit line.</strong> \n<br>\n    This step alone can make a huge impact on your score. The credit scoring system wants to make sure you aren\'t overextended, but at the same time, they want to see that you do indeed use your credit. 30% of the available credit line seems to be the magic \"balance vs. credit line\" ratio to have. For example; if you have a Credit Card with a $10,000 credit line, make sure that never more than $3000 (even if you pay your account off in full each month). If your balances are higher than 30% of the available credit line, pay them down. Here is another thing you can try; ask your long time reditors if they will raise your Credit Line without checking your FICO score or your Credit Report. Tell them that you\'re shopping for a house and you can\'t afford to have any hits on your credit report. Many will not but some will.</p>\n</li>\n<li>\n<p><strong>Do not close your old credit card accounts.</strong> <br>\n              Old established accounts show your history, and tell about your stability and paying habits. If you have old credit card    accounts that you want to stop using, just cut up the cards or keep them in a drawer, but keep the accounts open. </p>\n</li>\n<li>\n<p><strong>Avoid applying for new credit. <br>\n  </strong>\n              Do not apply for any new credit! Each time you apply for new credit, your credit report gets checked. New credit cards will not help your credit score and a credit account less than one year old may hurt your credit score. Use your cards and credit as little as possible until the next credit scoring.</p>\n</li>\n<li>\n            <p><strong>Have at least three revolving credit lines and one active (or paid) installment loan listed on your Credit Report.</strong><br>\n               The scoring system wants to see that you maintain a variety of credit accounts. It also wants to see that you have 3 revolving credit lines. If you do not have three active credit cards, you might want to open some (but keep in mind that if you do, you will need to wait some time before rescoring). If you have poor credit and are not approved for a typical credit card, you might want to set up a \"secured credit card\" account. This means that you will have to make a deposit that is equal or more than your limit, which  guarantees the bank that you will repay the loan. It\'s an excellent way to establish credit. Examples of an installment loan would be a car loan, or it could be for furniture or a major appliance. In addition to the above, having a mortgage listed will bring your score even higher.</p>\n</li>\n</ol>\n</div>\n\n<div class=\"col-md-12 margin-20\">\n<span class=\"caption-subject font-dgrey uppercase contacs\">Throughout this process, always remember:\n</span>\n<p class=\"margin-10\">\n  It takes up to 30 Days for any of these items to get reported and often longer to reflect on your Credit History Reports. Very often we must write a series of letters challenging the credit bureaus. Each time we must allow them 30 days to respond. It can feel like a slow process, but hang in there, because it does work and the end result will save you a tremendous amount of money.\n</p>\n</div>\n</div>'),
(5, 'default_credit_info_page_content', '<div class=\"normaltext1\" style=\"text-align:justify; \">\n  <div style=\"clear:both;\"> </div>\n  <div class=\"margintop26\">\n  <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n  <tbody><tr>\n    <td align=\"left\" valign=\"top\" width=\"18%\"><img src=\"https://www.secureclientaccess.com/application/images/roadtogood.png\" alt=\"home\"></td>\n    <td align=\"left\" valign=\"top\">  <div class=\"h7\"> Client Information and Recommendations: </div>\n    <div style=\"clear:both;\"></div>\n    <div>\n     <p>As your credit specialist, our most important job is to review your credit history reports with you and begin the process of disputing negative inaccurate items on your reports. Our next important job is to give you recommendations to follow, which will help you to speed up the process, achieve a higher score and keep it. While we do our part, please read the following information and follow our steps and your score will start to improve quickly.</p>\n     </div>\n    </td>\n  </tr>\n</tbody></table>\n</div>\n\n  <div style=\"clear:both;\"> </div>\n  <div class=\"margintop26 margin35 h7\">Contents (click to view)</div>\n  <div style=\"clear:both;\"> </div>\n  <div class=\"margintop20 margin35\">\n    <ul>\n      <li><a href=\"#con1\">How does credit repair work?</a></li>\n      <li><a href=\"#con2\">Credit Report Basics</a></li>\n      <li><a href=\"#con3\">Do I have a right to know what’s in my report?</a></li>\n      <li><a href=\"#con4\">What is a Credit Score?</a></li>\n      <li><a href=\"#con5\">Credit Score Ranges and Their Meaning</a></li>\n      <li><a href=\"#con6\">How do Credit Bureaus determine my credit score? </a></li>\n      <li><a href=\"#con7\">What type of information do credit bureaus collect and sell?</a></li>\n      <li><a href=\"#con8\">How does a credit bureau determine my score?</a></li>\n      <li><a href=\"#con9\">What is the secret to a high credit score?</a></li>\n      <li><a href=\"#con10\">What happens if you are denied credit or don’t get the terms you want?</a></li>\n      <li><a href=\"#con1\">The Fair Credit Reporting Act </a></li>\n      <li><a href=\"#con12\">How can I speed up the process?</a></li>\n      <li><a href=\"#con12\">7 steps to increase your credit score fast</a></li>\n    </ul>\n  </div>\n  <div style=\"clear:both;\" id=\"con1\"> </div>\n  <div class=\"margintop20 margin35 h7\">How does credit repair work?</div>\n  <div style=\"clear:both;\"> </div>\n  <div>\n    <p>Credit repair is 100% legal.  It works because of a law called “The Fair Credit Reporting Act.”  The FCRA gives you the right to dispute any item on your credit report.  If that item cannot be verified within a reasonable time (usually 30 days) it must be removed.  Even accurate negative items can often be removed or negotiated away. This law is the basis of all credit repair and the foundation of our business.</p>\n  </div>\n  <div style=\"clear:both;\" id=\"con2\"> </div>\n  <div>\n    <div class=\"margintop20 margin35\" style=\"width:750px;height:200px;float:left; margin-right:20px;\">\n      <div class=\"h7\">Credit Report Basics</div>\n      <div style=\"clear:both;\"> </div>\n      <div style=\"float:left; margin-right:20px;\">\n        <p>Your credit payment history and profile is the makeup of a credit report. These files or reports are maintained and sold by “consumer reporting agencies.” One type of consumer reporting agency is commonly known as a credit bureau. The largest three credit bureaus are Transunion, Equifax, and Experian. You have a credit record with these agencies if you have ever applied for a credit or charge account, a personal loan, or a job.Your credit record contains information about your income, debts, and credit payment history. It also indicates whether you have defaulted on any debts, have any outstanding judgments or child support, and whether or not you have any bankruptcies.</p>\n      </div>\n    </div>\n    <div class=\"margintop20\" style=\"float:right;height:200px;\">\n    <img src=\"https://www.secureclientaccess.com/application/images/goodbadcredit.png\" alt=\"home\" style=\"width:215px;\"></div>\n  </div>\n  <div style=\"clear:both;height:50px;\" id=\"con3\"> </div>\n  <div class=\"margintop26 margin35 h7\" id=\"con1\">Do I have a right to know what’s in my report?</div>\n  <div style=\"clear:both;\"> </div>\n  <div>\n    <p>Of course you do. By law, the agencies must give you a free report annually. However those free reports do not contain scores.  For credit repair scores we recommend an inexpensive credit monitoring service. </p>\n  </div>\n  <div style=\"clear:both;\" id=\"con4\"> </div>\n  <div class=\"margintop26 margin35 h7\">What is a Credit Score?</div>\n  <div style=\"clear:both;\"> </div>\n  <div>\n    <p>A credit score is a number generated by a mathematical formula that is meant to predict credit worthiness. Credit scores range from 300-850. The higher your score is, the more likely you are to get a loan. The lower your score is, the less likely you are to get a loan. If you have a low credit score and you do manage to get approved for credit then your interest rate will be much higher than someone who had a good credit score and borrowed money. So, basically, having a high credit score can save many thousands of dollars over the life of your mortgage, auto loan, or credit card.</p>\n  </div>\n  <div style=\"clear:both;\" id=\"con5\"> </div>\n  <div>\n    <div class=\"margintop20 margin35\" style=\"width:690px;float:left; margin-right:20px;\">\n      <div class=\"h7\">Credit Score ranges and their meaning</div>\n      <div style=\"clear:both;\"> </div>\n      <div style=\"float:left;\">\n        <p><strong>800 and Higher (Excellent)</strong> With a credit score in this range no lender will ever disapprove your loan application. Additionally, the APR (Annual Percentage Rate) on your credit cards will be the lowest possible. You’ll be treated as royalty. Achieving this excellent credit rating not only requires financial knowledge and discipline and, but also a good credit history. Generally speaking, to achieve this excellent rating you must also use a substantial amount of credit on an ongoing monthly basis and always repay it ahead of time.</p>\n    \n        <p>700 – 799  (Very Good)  27% of the United States population belongs to this credit score range. With this credit score range you will enjoy good rates and approved for nearly any type of credit loan or personal loan, whether unsecured or secured.</p>\n  \n    </div>\n    </div>\n    <div class=\"margintop20\" style=\"float:right;\"> \n    <img src=\"https://www.secureclientaccess.com/application/images/creditscore.png\" alt=\"home\"></div>\n  </div>\n  <div style=\"clear:both;\"> </div>\n  <div>\n    <p><strong>680 – 699  (Good)</strong> This range is the average credit score. In this range approvals are practically guaranteed but the interest rates might be marginally higher. If you’re thinking about a long term loan such as a mortgage, try working to increase your credit score higher than 720 and you will be rewarded for your efforts – your long term savings will be noticeable. </p>\n  </div>\n  <div>\n    <p><strong>620 -679 (OK or Fair)</strong> Depending on what kind of loan or credit you are applying for and your credit history, you might find that the rates you are quoted aren’t best. That doesn’t mean that you won’t be approved but, certain restrictions will apply to the loan’s terms.</p>\n  </div>\n  <div>\n    <p><strong>580 – 619 (Poor) </strong>With  a poor credit rating you can still get an unsecured personal loan and  even a mortgage, but, the terms and interest rates won’t be very  appealing. You’ll be required to pay more over a longer period of  time because of the high interest rates.</p>\n  </div>\n  <div>\n    <p><strong>500 – 579 (Bad) </strong>With a score in this range you can get a loan but nothing even close to what you expect it to be. Some people with bad credit apply for loans to consolidate debt in search for a fresh start. However, if you decide to do that then proceed cautiously. With a 500 credit score you need to make sure that you don’t default on payments or you’ll be making your situation worse and might head towards bankruptcy, which is not what you want.</p>\n  </div>\n  <div>\n    <p><strong>499 and Lower (Very Bad) </strong>If this is your score range you need serious and professional assistance with how you handle your credit. You’re making too many credit  blunders and they will only get worse if you don’t take positive action. If you are thinking of a loan then keep in mind that if you do find a sub-prime lender (which won’t be easy), the rates will be very high and the terms will be very strict. We recommend that you fix your credit and only then move on to applying for a loan.</p>\n  </div>\n  <div style=\"clear:both;\" id=\"con6\"> </div>\n  <div>\n    <div class=\"margintop20 margin35\" style=\"width:515px;float:left; margin-right:20px;\">\n      <div class=\"h7\">How do Credit Bureaus determine my credit score?</div>\n      <div style=\"clear:both;\"> </div>\n      <div style=\"float:left;\">\n        <p>35% - Payment History</p>\n        <p>30% - Debt Ratio</p>\n        <p>15% - Length of Credit History</p>\n        <p>10% - Types of Credit</p>\n        <p>10% - Number of Credit Inquiries<br>\n        </p>\n        <p>The percentages in this chart show how important each of the categories is in determining your Credit score. We will help you to remove negative items from your payment history. We will also show you how to maximize your debt ratio score, even if paying off credit cards is not an option.</p>\n      </div>\n    </div>\n    <div class=\"margintop20\" style=\"float:right;\"> \n    <img src=\"https://www.secureclientaccess.com/application/images/creditscoregraph.png\" alt=\"home\"></div>\n  </div>\n  <div style=\"clear:both;\" id=\"con7\"> </div>\n  <div class=\"margintop26 margin35 h7\" id=\"con1\">What type of information do credit bureaus collect and sell?</div>\n  <div style=\"clear:both;\"> </div>\n  <div>\n    <p>Credit  bureaus collect and sell four basic types of information:</p>\n    <ol>\n      <li>\n        <p><strong>Identification    and employment information</strong><br>\n          Your name, birth date, Social Security number, employer, and spouse’s name are routinely recorded in your credit report. They may also provide information about your employment history, home ownership, income, and previous address, if a creditor requests this type of information.</p>\n      </li><li>\n        <p><strong>Public record information</strong><br>\n          Events that are a matter of public record, such as bankruptcies, foreclosures, or tax liens, may appear in your report.</p>\n      </li><li>\n        <p><strong>Inquiries</strong><br>\n          CRAs must maintain a record of all creditors who have asked for your credit history within the past year. It is generally beneficial to keep the number of inquires as low as possible.</p>\n      </li><li>\n        <p><strong>Payment history</strong><br>\n          Your accounts with different creditors are listed, along with the balances, high balances, and outstanding balances. Related events, such as referral of an overdue account to a collection agency, charge off accounts or other delinquencies may also be noted.</p>\n    </li></ol>\n  </div>\n  <div style=\"clear:both;\"> </div>\n  <div style=\"clear:both;\" id=\"con8\"> </div>\n  <div>\n    <div class=\"margintop20 margin35\" style=\"width:545px;float:left; margin-right:20px;\">\n      <div class=\"h7\">How does a credit bureau determine my score?</div>\n      <div style=\"clear:both;\"> </div>\n      <div style=\"float:left;\">\n        <p>Credit  scoring models are complex and often vary among creditors and for different types of credit. If one factor changes, your score may  change — but improvement generally depends on how that factor  relates to other factors considered by the model. </p>\n        <p><strong>Scoring  models generally evaluate the following types of information in your  credit report:</strong></p>\n        <ul>\n          <li>\n            <p> <strong>Do you pay</strong><strong> your bills on time?</strong> Payment history is a major factor in credit scoring. If you have paid bills late, have collections, or declared bankruptcy, these events will not reflect well in your credit score. </p>\n          </li><li>\n            <p> <strong>Do you have a long credit history? </strong>Generally speaking, the longer your history of holding accounts is, the more trusted you will be as a borrower. </p>\n          </li><li>\n            <p> <strong>Have you applied for credit recently? </strong>If you have many recent inquires this can be construed as being negative by the credit reporting agencies. Only apply for credit when you really want it. </p>\n          </li><li>\n            <p> <strong>What is your outstanding debt? </strong> It is important that you are not using all of your available credit. If all of your credit cards are maxed out, your scores will reflect that you are not managing your debt wisely. </p>\n        </li></ul>\n      </div>\n    </div>\n    <div class=\"margintop20\" style=\"float:right;\"> \n    <img src=\"https://www.secureclientaccess.com/application/images/metergraphics.png\" alt=\"meter\" height=\"300px;\"></div>\n  </div>\n  <div style=\"clear:both;\"> </div>\n  <div id=\"con9\">\n    <div class=\"margintop20 margin35\" style=\"width:680px;float:left;\">\n      <div class=\"h7\">What is the secret to a high credit score? </div>\n      <div style=\"clear:both;\"> </div>\n      <div style=\"float:left;\">\n        <ol>\n          <li>\n            <p>Always pay your bills on time!</p>\n          </li><li>\n            <p>Don’t close old accounts!</p>\n          </li><li>\n            <p>Don’t apply for any new credit!<span lang=\"\"> </span> </p>\n          </li><li>\n            <p><strong>Don’t ever use more than 30% of your available credit on each credit card!</strong> </p>\n        </li></ol>\n      </div>\n    </div>\n    <div style=\"float:right;\"> <img src=\"https://www.secureclientaccess.com/application/images/topscore.png\" alt=\"topscore\"></div>\n  </div>\n  <div style=\"clear:both;\" id=\"con10\"> </div>\n  <div>\n    <div class=\"margintop20 margin35\" style=\"width:730px;float:left; margin-right:20px;\">\n      <div class=\"h7\">What happens if you are denied credit or don’t get the terms you want?</div>\n      <div style=\"clear:both;\"> </div>\n      <div style=\"float:left;\">\n        <p>If you are denied credit, the Equal Credit Opportunity Act requires that the creditor give you a notice that tells you the specific reasons your application was rejected or the fact that you have the right to learn the reasons if you ask within 60 days. Indefinite and vague  reasons for denial are illegal, so ask the creditor to be specific. Acceptable reasons include: “Your income was low” or “You  haven’t been employed long enough.” Unacceptable reasons include:  “You didn’t meet our minimum standards” or “You didn’t  receive enough points on our credit scoring system.”</p>\n        <p>If a creditor says you were denied credit because you are too near your credit limits on your charge cards or you have too many credit card accounts, you may want to reapply after paying down your balances or closing some accounts.  Credit scoring systems consider updated information and change over time.</p>\n        <p>If you’ve been denied credit, or didn’t get the rate or credit terms you want, ask the creditor if a credit scoring system was used. If so, ask what characteristics or factors were used in that system, and the best ways to improve your application. If you get credit, ask the creditor whether you are getting the best rate and terms available and, if not, why. If you are not offered the best rate available because of inaccuracies in your credit report, be sure to dispute the inaccurate information in your credit report.</p>\n      </div>\n    </div>\n    <div class=\"margintop20\" style=\"float:right;\">\n     <img src=\"https://www.secureclientaccess.com/application/images/cople.gif\" alt=\"\" style=\"width:225px;\"></div>\n  </div>\n  <div style=\"clear:both;\" id=\"con12\"> </div>\n  <div class=\"margintop20 margin35 h7\">How can I speed up the process?</div>\n  <div style=\"clear:both;\"> </div>\n  <div>\n    <p>Following these 7 steps will increase your score quickly.</p>\n  </div>\n  <div style=\"clear:both;\" id=\"con2\"> </div>\n  <div>\n    <div class=\"margintop20 margin35\" style=\"width:730px;float:left; margin-right:20px;\">\n      <div class=\"h7\">Credit Report Basics </div>\n      <div style=\"clear:both;\"> </div>\n      <div style=\"float:left;\">\n        <ol>\n          <li>\n          <strong>Order fresh new copies of your credit reports from all 3 bureaus: Equifax, Experian and TransUnion. </strong><strong>*We will assist you with this step.</strong>\n           <br>\n\n        Credit reports are constantly changing. Therefore it is important to up-to-date copies. A good rule of thumb to know is:  If  someone else runs your score or reports, this will hurt your score. However, <strong>if you order your own credit reports</strong> (which we will help you with) <strong>your score will  not be affected. </strong>You also may want to sign  up for credit monitoring to see your reports and score and track  changes as they happen.\n          </li>\n        </ol>\n      </div>\n    </div>\n    <div class=\"margintop20\" style=\"float:right;\"> \n    <img src=\"https://www.secureclientaccess.com/application/images/bargraph.png\" alt=\"home\" style=\"width:225px;\"></div>\n  </div>\n  <div style=\"clear:both;\"></div>\n  <div class=\"margintop10 margin35\">\n    <ol start=\"2\">\n      <li>\n      <p>  <strong>Correct all inaccuracies on your Credit Reports. *We will assist you with this step.</strong>\n        <br>\n   \n     Go through your credit reports very carefully.  Especially look for; Late payments, charge-offs, collections or other  negative items that aren\'t yours, Accounts listed as \"settled,\"  \"paid derogatory,\" \"paid charge-off\" or anything  other than \"current\" or \"paid as agreed\" if you  paid on time and in full, Accounts that are still listed as unpaid  that were included in a bankruptcy, Negative items older than seven  years (10 in the case of bankruptcy) that should have automatically  fallen off your report (you must be careful with this last one,  because sometimes scores actually go down when bad items fall off  your report. It\'s a quirk in the FICO credit-scoring software, and  the potential effect of eliminating old negative items is difficult  to predict in advance). Also make sure you don\'t have duplicate  collection notices listed. For example; if you have an account that  has gone to collections, the original creditor may list the debt, as  well as the collection agency. Any duplicates must be removed!  Make  sure that your proper credit lines are posted on your Credit Reports. Often, in an effort to make you less  desirable to their competitors, some creditors will not post your  proper credit line. Showing less available credit can negatively  impact your credit score. If you see this happening on your credit  report, you have a right to complain and bring this to their  attention. If you have bankruptcies that should be showing a zero  balance…make sure they show a zero balance! Very often the creditor  will not report a \"bankruptcy charge-off\" as a zero balance  until it\'s been disputed.</p>\n      </li>\n\n      <li>\n     <p><strong>If you have any negative marks on your credit report, negotiate with the creditor or lender to remove it. *We will assist you with this step.</strong><br>\n        \n         If you are a long time customer and it\'s something simple like a one-time late payment, a creditor will often wipe it away to keep you as a loyal customer. Sometimes they will do this if you call and ask.  However, if you have a serious negative mark (such as a long overdue bill that has gone to collections), always negotiate a payment in exchange for removal of the negative item. Always make sure you have this agreement with them in writing. Do not pay off a bill that has gone to collections unless the creditor agrees in writing that they will remove the derogatory item from your credit report. This is important; when speaking with the creditor or collection agency about a debt that has gone to collections, do not admit that the debt is yours. Admission of debt can restart the statute of limitations, and may enable the creditor to sue you. You are also less likely to be able to negotiate a letter of deletion if you admit that this debt is yours. Simply say \"I\'m calling about account number ________\" instead of \"I\'m calling   about my past due debt.\" Again, as your credit specialist, we will help you with this step.</p>\n     \n      </li><li>\n      <p><strong>Pay all credit cards and any revolving credit down to below 30% of the available credit line.</strong> \n          <br>\n          This step alone can make a huge impact on your score. The credit scoring system wants to make sure you aren\'t overextended, but at the same time, they want to see that you do indeed use your credit. 30% of the available credit line seems to be the magic \"balance vs. credit line\" ratio to have. For example; if you have a Credit Card with a $10,000 credit line, make sure that never more than $3000 (even if you pay your account off in full each month). If your balances are higher than 30% of the available credit line, pay them down. Here is another thing you can try; ask your long time reditors if they will raise your Credit Line without checking your FICO score or your Credit Report. Tell them that you\'re shopping for a house and you can\'t afford to have any hits on your credit report. Many will not but some will.</p>\n\n      </li><li>\n        <p><strong>Do not close your old credit card accounts.</strong> <br>\n        \n          Old established accounts show your history, and tell about your stability and paying habits. If you have old credit card   accounts that you want to stop using, just cut up the cards or keep them in a drawer, but keep the accounts open. </p>\n\n      </li><li>\n        <p><strong>Avoid applying for new credit. <br>\n          </strong>\n          Do not apply for any new credit! Each time you apply for new credit, your credit report gets checked. New credit cards will not help your credit score and a credit account less than one year old may hurt your credit score. Use your cards and credit as little as possible until the next credit scoring.</p>\n        \n      </li><li>\n      <p><strong>Have at least three revolving credit lines and one active (or paid) installment loan listed on your Credit Report.</strong><br>\n         \n         The scoring system wants to see that you maintain a variety of credit accounts. It also wants to see that you have 3 revolving credit lines. If you do not have three active credit cards, you might want to open some (but keep in mind that if you do, you will need to wait some time before rescoring). If you have poor credit and are not approved for a typical credit card, you might want to set up a \"secured credit card\" account. This means that you will have to make a deposit that is equal or more than your limit, which  guarantees the bank that you will repay the loan. It\'s an excellent way to establish credit. Examples of an installment loan would be a car loan, or it could be for furniture or a major appliance. In addition to the above, having a mortgage listed will bring your score even higher.</p>\n    </li></ol>\n  </div>\n  <div style=\"clear:both;\"> </div>\n  <div class=\"h7\" id=\"con1\">Throughout this process, always remember:</div>\n  <div style=\"clear:both;\"> </div>\n\n    <p>It takes up to 30 Days for any of these items to get reported and often longer to reflect on your Credit History Reports. Very often we must write a series of letters challenging the credit bureaus. Each time we must allow them 30 days to respond.  It can feel like a slow process, but hang in there, because it does work and the end result will save you a tremendous amount of money.</p>\n\n  <div style=\"clear:both;height:15px;\"></div>\n</div>'),
(6, 'affiliate_global_commission_amount', ''),
(7, 'affiliate_global_commission_for_whom', ''),
(8, 'show_affiliate_earning', 'no'),
(9, 'affiliate_payment_frequency', 'monthly'),
(10, 'affiliate_minimum_payout', '100');
INSERT INTO `crd_options` (`iOptionId`, `vOption`, `vOptionValue`) VALUES
(11, 'credit_info_page_content_es', '<div class=\"row\" style=\"text-align: justify;\">\n<div style=\"clear: both;\">&nbsp;</div>\n<div class=\"col-sm-2\">\n     <img class=\"img-responsive\" src=\"https://www.secureclientaccess.com/application/images/roadtogood.png\" alt=\"home\" />\n  </div>\n  <div class=\"col-sm-10\">\n   <div class=\"caption contact-box\">\n     <span class=\"caption-subject font-dgrey uppercase contacs\">\n     Informaci&oacute;n del Cliente y Recomendaciones:\n     </span>\n   </div>\n    <div style=\"clear: both;\">&nbsp;</div>\n    <p>Como su especialista de cr&eacute;dito, nuestro trabajo m&aacute;s importante es revisar los informes de historial de cr&eacute;dito con usted y para iniciar el proceso de disputar art&iacute;culos inexactos negativos en sus informes. Nuestra pr&oacute;xima tarea importante es darle recomendaciones a seguir, lo que ayudar&aacute; a acelerar el proceso, conseguir una puntuaci&oacute;n m&aacute;s alta y mantenerlo. Mientras hacemos nuestra parte, por favor lea la siguiente informaci&oacute;n y seguir nuestros pasos y su puntuaci&oacute;n comenzar&aacute; a mejorar r&aacute;pidamente.</p>\n </div>\n  <div style=\"clear: both;\">&nbsp;</div>\n  <div class=\"col-sm-12\">Contenido (haga clic para ver)</div>\n <div class=\"col-md-12 margin-20\">\n   <ul>\n    <li><a href=\"#con1\">&iquest;C&oacute;mo funciona la reparaci&oacute;n de cr&eacute;dito?</a></li>\n   <li><a href=\"#con2\">Fundamentos de informe de cr&eacute;dito</a></li>\n   <li><a href=\"#con3\">&iquest;Tengo derecho a saber lo que hay en mi informe?</a></li>\n    <li><a href=\"#con4\">&iquest;Qu&eacute; es un puntaje de cr&eacute;dito?</a></li>\n    <li><a href=\"#con5\">Los rangos de puntuaci&oacute;n de cr&eacute;dito y su significado</a></li>\n   <li><a href=\"#con6\">&iquest;C&oacute;mo oficinas de cr&eacute;dito determinan mi puntaje de cr&eacute;dito? </a></li>\n   <li><a href=\"#con7\">&iquest;Qu&eacute; tipo de informaci&oacute;n hacen agencias de cr&eacute;dito recopilan y venden?</a></li>\n   <li><a href=\"#con8\">&iquest;C&oacute;mo una agencia de cr&eacute;dito a determinar mi puntuaci&oacute;n?</a></li>\n   <li><a href=\"#con9\">&iquest;Cu&aacute;l es el secreto de un alto puntaje de cr&eacute;dito?</a></li>\n    <li><a href=\"#con10\">&iquest;Qu&eacute; sucede si se le niega cr&eacute;dito o no consigue los t&eacute;rminos que desea?</a></li>\n    <li><a href=\"#con1\">La Ley de Informe Justo de Cr&eacute;dito </a></li>\n   <li><a href=\"#con12\">&iquest;C&oacute;mo puedo acelerar el proceso?</a></li>\n    <li><a href=\"#con12\">7 pasos para aumentar su puntuaci&oacute;n de cr&eacute;dito r&aacute;pido</a></li>\n    </ul>\n </div>\n  <div id=\"con1\" style=\"clear: both;\">&nbsp;</div>\n  <div class=\"col-md-12 margin-20\">\n   <span class=\"caption-subject font-dgrey uppercase contacs\">\n   &iquest;C&oacute;mo funciona la reparaci&oacute;n de cr&eacute;dito?\n    </span>\n   <p>La reparaci&oacute;n del cr&eacute;dito es 100% legal. Funciona debido a una ley llamada \"The Fair Credit Reporting Act.\" El FCRA le da el derecho de disputar cualquier art&iacute;culo en su informe de cr&eacute;dito. Si ese elemento no se puede verificar en un plazo razonable (generalmente 30 d&iacute;as), que debe ser eliminado. Incluso los elementos negativos precisos menudo se pueden quitar o negociados fuera. Esta ley es la base de toda la reparaci&oacute;n del cr&eacute;dito y de la base de nuestro negocio.</p>\n </div>\n\n  <div  style=\"clear: both;\">&nbsp;</div>\n <div class=\"col-md-9 margin-10\">\n    <span class=\"caption-subject font-dgrey uppercase contacs\">Fundamentos de informe de cr&eacute;dito</span>\n    <p class=\"margin-10\">Su historial de pagos de cr&eacute;dito y el perfil es la composici&oacute;n de un informe de cr&eacute;dito. Estos archivos o informes son mantenidos y vendidos por \"agencias de informes de los consumidores.\" Un tipo de agencia de informaci&oacute;n se conoce com&uacute;nmente como una oficina de cr&eacute;dito. Las tres mayores agencias de cr&eacute;dito son TransUnion, Equifax y Experian. Usted tiene un historial de cr&eacute;dito con estas agencias si ha aplicado alguna vez para una cuenta de cr&eacute;dito o cargo, un pr&eacute;stamo personal, o un historial de cr&eacute;dito job.Your contiene informaci&oacute;n sobre sus ingresos, deudas, y el historial de pagos de cr&eacute;dito. Tambi&eacute;n indica si ha incumplido las deudas, tienen juicios pendientes o manutenci&oacute;n de los hijos, y si tiene alguna quiebras.</p>\n  </div>\n  <div class=\"col-md-3\">\n    <img class=\"img-responsive\" src=\"https://www.secureclientaccess.com/application/images/goodbadcredit.png\" alt=\"home\" />\n </div>\n\n  <div id=\"con3\" style=\"clear: both; height: 50px;\">&nbsp;</div>\n  <div id=\"con1\" class=\"col-md-12 margin-10\">\n   <span class=\"caption-subject font-dgrey uppercase contacs\">\n   &iquest;Tengo derecho a saber lo que hay en mi informe?\n   </span>\n   <p class=\"margin-10\">Por supuesto que s&iacute;. Por ley, las agencias deben darle un informe gratuito anual. Sin embargo esos informes gratuitos no contienen puntuaciones. Para los resultados de reparaci&oacute;n de cr&eacute;dito le recomendamos un servicio de monitoreo de cr&eacute;dito barato.</p>\n  </div>\n\n  <div id=\"con4\" style=\"clear: both;\">&nbsp;</div>\n  <div class=\"col-md-12 margin-20\">\n   <span class=\"caption-subject font-dgrey uppercase contacs\">\n   &iquest;Qu&eacute; es un puntaje de cr&eacute;dito?\n   </span>\n   <p class=\"margin-10\">Un puntaje de cr&eacute;dito es un n&uacute;mero generado por una f&oacute;rmula matem&aacute;tica que tiene la intenci&oacute;n de predecir la capacidad crediticia. Las puntuaciones de cr&eacute;dito van desde 300 hasta 850. Cuanto m&aacute;s alto sea su puntaje, m&aacute;s probabilidades hay de obtener un pr&eacute;stamo. Cuanto menor sea su puntaje, menos probabilidades hay de obtener un pr&eacute;stamo. Si usted tiene un bajo puntaje de cr&eacute;dito y usted se las arregla para conseguir su aprobaci&oacute;n para el cr&eacute;dito, entonces su tasa de inter&eacute;s ser&aacute; mucho m&aacute;s alto que alguien que ten&iacute;a un buen puntaje de cr&eacute;dito y el dinero prestado. As&iacute; que, b&aacute;sicamente, tener un alto puntaje de cr&eacute;dito puede ahorrar miles de d&oacute;lares durante la vida de su hipoteca, pr&eacute;stamo de auto, o tarjeta de cr&eacute;dito.</p>\n </div>\n\n  <div id=\"con5\" style=\"clear: both;\">&nbsp;</div>\n  <div class=\"col-md-9 margin-20\">\n    <span class=\"caption-subject font-dgrey uppercase contacs\">Rangos de puntaje de cr&eacute;dito y su significado</span>\n    <p class=\"margin-10\"><strong>800 y Superior (Excelente)</strong> Con un puntaje de cr&eacute;dito en este rango de ning&uacute;n prestamista volver&aacute; a rechazar su solicitud de pr&eacute;stamo. Adem&aacute;s, la TAE (Tasa Anual Equivalente) en sus tarjetas de cr&eacute;dito ser&aacute; el m&aacute;s bajo posible. Usted ser&aacute; tratado como la realeza. El logro de esta excelente calificaci&oacute;n crediticia no s&oacute;lo requiere el conocimiento financiero y disciplina y, sino tambi&eacute;n un buen historial de cr&eacute;dito. En t&eacute;rminos generales, para lograr este excelente calificaci&oacute;n tambi&eacute;n debe utilizar una cantidad sustancial de cr&eacute;dito sobre una base mensual en curso y siempre pagarlo antes de tiempo.</p>\n    <p>700-799 (Muy Bueno) 27% de la poblaci&oacute;n de Estados Unidos pertenece a este rango de puntuaci&oacute;n de cr&eacute;dito. Con este rango de puntuaci&oacute;n de cr&eacute;dito podr&aacute; disfrutar de buenos precios y aprobado para casi cualquier tipo de pr&eacute;stamo de cr&eacute;dito o pr&eacute;stamo personal, si no garantizados o asegurados.</p>\n </div>\n  <div class=\"col-md-3\">\n    <img class=\"img-responsive\" src=\"https://www.secureclientaccess.com/application/images/creditscore.png\" alt=\"home\" />\n </div>\n\n  <div style=\"clear: both;\">&nbsp;</div>\n  <div class=\"col-md-12 margin-10\">\n <p><strong>680 &ndash; 699 (Bien)</strong> Esta gama es el puntaje de cr&eacute;dito promedio. En este rango de aprobaciones est&aacute;n pr&aacute;cticamente garantizadas, pero las tasas de inter&eacute;s podr&iacute;an ser ligeramente superior. Si usted est&aacute; pensando en un pr&eacute;stamo a largo plazo, como una hipoteca, tratar de trabajar para aumentar su puntuaci&oacute;n de cr&eacute;dito superior a 720 y usted ser&aacute; recompensado por sus esfuerzos - sus ahorros a largo plazo van a ser notable.</p>\n <p><strong>620 -679 (OK o Judiciales)</strong> Dependiendo de qu&eacute; tipo de pr&eacute;stamo o cr&eacute;dito que est&aacute; solicitando y su historial de cr&eacute;dito, usted podr&iacute;a encontrar que las tasas que se citan no son los mejores. Eso no quiere decir que no vas a ser aprobado, pero, se aplicar&aacute;n ciertas restricciones a los t&eacute;rminos del pr&eacute;stamo.</p>\n  <p><strong>580 &ndash; 619 (Pobre) </strong>Con una mala calificaci&oacute;n crediticia todav&iacute;a puede obtener un pr&eacute;stamo sin garant&iacute;a personal e incluso una hipoteca, pero, los t&eacute;rminos y las tasas de inter&eacute;s no va a ser muy atractivo. Usted estar&aacute; obligado a pagar m&aacute;s durante un per&iacute;odo de tiempo m&aacute;s largo debido a las altas tasas de inter&eacute;s.</p>\n  <p><strong>500 &ndash; 579 (Malo) </strong> Con una puntuaci&oacute;n de este rango se puede obtener un pr&eacute;stamo, pero nada ni siquiera cerca de lo que usted espera que sea. Algunas personas con mal cr&eacute;dito solicitar pr&eacute;stamos para consolidar la deuda en busca de un nuevo comienzo. Sin embargo, si decide hacerlo, entonces proceder con cautela. Con un puntaje de 500 cr&eacute;ditos que necesita para asegurarse de que no cumple con los pagos o se le toma su situaci&oacute;n peor y podr&iacute;a dirigirse hacia la quiebra, que no es lo que quieres.</p>\n  <p><strong>499 y Baja (muy malo) </strong>Si esta es tu rango de puntuaci&oacute;n necesita ayuda serio y profesional con la forma de manejar su cr&eacute;dito. Est&aacute;s cometiendo demasiados errores de cr&eacute;dito y que s&oacute;lo va a empeorar si no se toman medidas positivas. Si usted est&aacute; pensando en un pr&eacute;stamo a continuaci&oacute;n, tenga en cuenta que si usted encuentra un prestamista subprime (que no ser&aacute; f&aacute;cil), las tasas ser&aacute;n muy alto y las condiciones ser&aacute;n muy estricta. Le recomendamos que arreglar su cr&eacute;dito y s&oacute;lo entonces pasar a solicitar un pr&eacute;stamo.</p>\n </div>\n\n  <div id=\"con6\" style=\"clear: both;\">&nbsp;</div>\n  <div class=\"col-md-7 margin-20\">\n    <span class=\"caption-subject font-dgrey uppercase contacs\">&iquest;C&oacute;mo oficinas de cr&eacute;dito determinan mi puntaje de cr&eacute;dito?</span>\n   <p>35% - historial de pagos</p>\n   <p>30% - Ratio de Deuda</p>\n   <p>15% - Duraci&oacute;n del historial de cr&eacute;dito</p>\n    <p>10% - Tipos de cr&eacute;dito</p>\n    <p>10% - N&uacute;mero de consultas de cr&eacute;dito</p>\n   <p>Los porcentajes en esta tabla muestran la importancia de cada una de las categor&iacute;as es la hora de determinar su puntaje de cr&eacute;dito. Le ayudaremos a eliminar los elementos negativos de su historial de pagos. Tambi&eacute;n le mostramos c&oacute;mo maximizar su puntaje ratio de deuda, incluso si el pago de tarjetas de cr&eacute;dito no es una opci&oacute;n.</p>\n  </div>\n  <div class=\"col-md-5 margin-10\">\n    <img class=\"img-responsive\" src=\"https://www.secureclientaccess.com/application/images/creditscoregraph.png\" alt=\"home\" />\n  </div>\n\n  <div id=\"con7\" style=\"clear: both;\">&nbsp;</div>\n  <div id=\"con1\" class=\"col-md-12  margin-20\">\n    <span class=\"caption-subject font-dgrey uppercase contacs\">\n   &iquest;Qu&eacute; tipo de informaci&oacute;n hacen agencias de cr&eacute;dito recopilan y venden?\n    </span>\n   <p class=\"margin-10\">Las agencias de cr&eacute;dito recopilan y venden cuatro tipos b&aacute;sicos de informaci&oacute;n:</p>\n   <ol>\n      <li>\n      <p><strong>La informaci&oacute;n de identificaci&oacute;n y empleo</strong><br /> Su nombre, fecha de nacimiento, n&uacute;mero de Seguro Social, empleador, y el nombre del c&oacute;nyuge se registran habitualmente en su informe de cr&eacute;dito. Tambi&eacute;n pueden proporcionar informaci&oacute;n sobre su historial de empleo, propiedad de la vivienda, los ingresos, y la direcci&oacute;n anterior, si un acreedor solicita este tipo de informaci&oacute;n.</p>\n      </li>\n     <li>\n      <p><strong>Informaci&oacute;n de registros p&uacute;blicos</strong><br /> Eventos que son un asunto de inter&eacute;s p&uacute;blico, tales como quiebras, ejecuciones hipotecarias o embargos fiscales, pueden aparecer en su informe.</p>\n     </li>\n     <li>\n      <p><strong>Consultas</strong><br /> CRA debe mantener un registro de todos los acreedores que han pedido su historial de cr&eacute;dito en el &uacute;ltimo a&ntilde;o. Por lo general, es beneficioso para mantener el n&uacute;mero de consultas tan bajas como sea posible.</p>\n      </li>\n     <li>\n      <p><strong>Historial de pagos</strong><br /> Sus cuentas con diferentes acreedores se enumeran, junto con los balances, saldos altos, y los saldos pendientes. Eventos relacionados, como la remisi&oacute;n de una cuenta atrasada a una agencia de cobro, cobran de cuentas u otros incumplimientos tambi&eacute;n pueden tenerse en cuenta.</p>\n      </li>\n   </ol>\n </div>\n  <div style=\"clear: both;\">&nbsp;</div>\n\n  <div id=\"con8\" style=\"clear: both;\">&nbsp;</div>\n  <div class=\"col-md-7 margin-20\">\n    <span class=\"caption-subject font-dgrey uppercase contacs\">\n   &iquest;C&oacute;mo una agencia de cr&eacute;dito a determinar mi puntuaci&oacute;n?</span>\n   <p class=\"margin-10\">Modelos de calificaci&oacute;n de cr&eacute;dito son complejas y var&iacute;an a menudo entre los acreedores y para diferentes tipos de cr&eacute;dito. Si uno de los factores cambia, su puntuaci&oacute;n puede cambiar - pero la mejor&iacute;a depende generalmente de c&oacute;mo ese factor se relaciona con otros factores considerados por el modelo.</p>\n    <p class=\"margin-10\"><strong>Modelos de puntuaci&oacute;n general eval&uacute;an los siguientes tipos de informaci&oacute;n en su informe de cr&eacute;dito:</strong></p>\n   <ul>\n      <li>\n      <p><strong>&iquest;Paga</strong><strong> sus facturas a tiempo?</strong> El historial de pagos es un factor importante en la puntuaci&oacute;n de cr&eacute;dito. Si usted ha pagado las facturas finales, tienen colecciones, o se declar&oacute; en bancarrota, estos eventos no reflejar&aacute; bien en su puntaje de cr&eacute;dito.</p>\n     </li>\n     <li>\n      <p><strong>&iquest;Usted tiene un historial de cr&eacute;dito de largo? </strong>En t&eacute;rminos generales, el m&aacute;s largo de su historia de cuentas de haberes, m&aacute;s confiado en que habr&aacute; como prestatario.</p>\n      </li>\n     <li>\n      <p><strong>&iquest;Ha solicitado cr&eacute;dito recientemente? </strong>Si tiene muchas consultas recientes esto puede ser interpretado como negativo por las agencias de informes de cr&eacute;dito. S&oacute;lo solicitar cr&eacute;dito cuando usted realmente lo desea.</p>\n     </li>\n     <li>\n      <p><strong>&iquest;Cu&aacute;l es su deuda pendiente? </strong> Es importante que usted no est&aacute; utilizando toda su cr&eacute;dito disponible. Si todas sus tarjetas de cr&eacute;dito est&aacute;n al m&aacute;ximo, sus calificaciones reflejar&aacute;n que usted no est&aacute; manejando su deuda con prudencia.</p>\n     </li>\n   </ul>\n </div>\n  <div class=\"col-md-5\" style=\"float: right;\">\n  <img class=\"img-responsive\" src=\"https://www.secureclientaccess.com/application/images/metergraphics.png\" alt=\"meter\" />\n  </div>\n  <div style=\"clear: both;\">&nbsp;</div>\n\n  <div id=\"con9\">\n <div class=\"col-md-8 margin-20\">\n    <span class=\"caption-subject font-dgrey uppercase contacs\">&iquest;Cu&aacute;l es el secreto de un alto puntaje de cr&eacute;dito?\n    </span>\n   <ol>\n      <li>\n      <p>Siempre pague sus cuentas a tiempo!</p>\n      </li>\n     <li>\n      <p>No cierre las cuentas viejas!</p>\n      </li>\n     <li>\n      <p>No aplicar para cualquier nuevo cr&eacute;dito!</p>\n      </li>\n     <li>\n      <p><strong>No utilice nunca m&aacute;s del 30% de su cr&eacute;dito disponible en cada tarjeta de cr&eacute;dito!</strong></p>\n      </li>\n   </ol>\n </div>\n  <div class=\"col-md-4\">\n  <img class=\"img-responsive\" src=\"https://www.secureclientaccess.com/application/images/topscore.png\" alt=\"topscore\" />\n  </div>\n\n  <div id=\"con10\" style=\"clear: both;\">&nbsp;</div>\n <div class=\"col-md-8 margin-20\">\n    <span class=\"caption-subject font-dgrey uppercase contacs\">&iquest;Qu&eacute; sucede si se le niega cr&eacute;dito o no consigue los t&eacute;rminos que desea?\n </span>\n   <p class=\"margin-10\">Si se le niega el cr&eacute;dito, la Ley de Igualdad de Oportunidades de Cr&eacute;dito requiere que el acreedor le dar&aacute; un aviso que le indica las razones espec&iacute;ficas de su solicitud fue rechazada o el hecho de que usted tiene el derecho de conocer las razones si le preguntas a un plazo de 60 d&iacute;as. Razones indefinidas y vagas para la negaci&oacute;n son ilegales, por lo que piden al acreedor para ser espec&iacute;fico. Las razones aceptables incluyen: \"Su ingreso fue baja\" o \"No se han empleado el tiempo suficiente.\" Razones inaceptables incluyen: \"Usted no cumple con nuestros est&aacute;ndares m&iacute;nimos\" o \"Usted no recibe suficientes puntos en nuestro sistema de puntuaci&oacute;n de cr&eacute;dito . \"</p>\n    <p>Si un acreedor dice que estaba negado el cr&eacute;dito, porque usted est&aacute; demasiado cerca de sus l&iacute;mites de cr&eacute;dito en sus tarjetas de cr&eacute;dito o si tiene demasiadas cuentas de tarjetas de cr&eacute;dito, es posible que desee volver a aplicar despu&eacute;s de pagar sus balances o el cierre de algunas cuentas. Sistemas de puntuaci&oacute;n de cr&eacute;dito consideran informaci&oacute;n actualizada y cambian con el tiempo.</p>\n   <p>Si usted ha sido negado el cr&eacute;dito, o no recibi&oacute; los t&eacute;rminos de tasas o de cr&eacute;dito que desea, pedir al acreedor si se utiliz&oacute; un sistema de puntuaci&oacute;n de cr&eacute;dito. Si es as&iacute;, pregunte qu&eacute; caracter&iacute;sticas o factores fueron utilizados en ese sistema, y las mejores maneras de mejorar su aplicaci&oacute;n. Si obtiene cr&eacute;dito, pedir al acreedor si vas a encontrar las mejores tarifas y condiciones disponibles y, si no, por qu&eacute;. Si no se le ofrece la mejor tarifa disponible debido a imprecisiones en su informe de cr&eacute;dito, aseg&uacute;rese de disputar la informaci&oacute;n inexacta en su informe de cr&eacute;dito.</p>\n </div>\n  <div class=\"col-md-4 margin-10\">\n  <img class=\"img-responsive\" src=\"https://www.secureclientaccess.com/application/images/cople.gif\" alt=\"\" />\n </div>\n\n  <div id=\"con12\" style=\"clear: both;\">&nbsp;</div>\n <div class=\"col-md-12 margin-20\">\n   <span class=\"caption-subject font-dgrey uppercase contacs\">\n   &iquest;C&oacute;mo puedo acelerar el proceso?\n    </span>\n   <p class=\"margin-10\">Despu&eacute;s de estos 7 pasos aumentar&aacute; su puntaje r&aacute;pidamente.</p>\n  </div>\n\n  <div id=\"con2\" style=\"clear: both;\">&nbsp;</div>\n  <div class=\"col-md-9 margin-20\">\n    <span class=\"caption-subject font-dgrey uppercase contacs\">Fundamentos de informe de cr&eacute;dito</span>\n  <ol class=\"margin-10\">\n    <li><strong>Ordene nuevas copias nuevas de sus informes de cr&eacute;dito de las 3 agencias: Equifax, Experian y TransUnion. </strong><strong>*Nosotros le ayudaremos con este paso.</strong> <br /> Los informes de cr&eacute;dito est&aacute;n en constante cambio. Por lo tanto es importante copias arriba-hasta la fecha. Una buena regla de oro que saber es: si alguien corre su puntuaci&oacute;n o informes, esto har&aacute; da&ntilde;o a su puntuaci&oacute;n. Sin embargo, <strong>si usted pide sus propios informes de cr&eacute;dito</strong> (que le ayudaremos con) <strong>su puntaje no se ver&aacute; afectada. </strong>Tambi&eacute;n puede inscribirse para el monitoreo de cr&eacute;dito para ver sus informes y anotar y seguir los cambios que se van produciendo.</li>\n </ol>\n </div>\n  <div class=\"col-md-3 margin-10\">\n  <img class=\"img-responsive\" src=\"https://www.secureclientaccess.com/application/images/bargraph.png\" alt=\"home\" />\n  </div>\n  <div style=\"clear: both;\">&nbsp;</div>\n\n  <div class=\"col-md-12\">\n <ol class=\"margin-10\" start=\"2\">\n    <li>\n    <p><strong>Corrija todos los errores en sus informes de cr&eacute;dito. * Le ayudaremos con este paso.</strong> <br /> Ir a trav&eacute;s de sus informes de cr&eacute;dito con mucho cuidado. Especialmente buscar; Retrasos en los pagos, cancelaciones, colecciones u otros elementos negativos que no son los suyos, cuentas que aparecen como \"resuelta\", \"pagado despectiva\", \"pagado anulaci&oacute;n de deudas\" o que no sea \"actual\" o \"pagado seg&uacute;n lo acordado\" nada si que pag&oacute; a tiempo y en su totalidad, las cuentas que todav&iacute;a se muestran como no remunerado que se incluyeron en una quiebra, los elementos negativos mayores de siete a&ntilde;os (10 en el caso de quiebra) que deber&iacute;a haber ca&iacute;do autom&aacute;ticamente su informe (hay que tener cuidado con este &uacute;ltimo, porque a veces las puntuaciones en realidad descienden cuando los malos elementos se caen de su informe. Es una peculiaridad en el software de cr&eacute;dito de puntuaci&oacute;n FICO, y el efecto potencial de eliminar los elementos negativos de edad es dif&iacute;cil de predecir por adelantado). Tambi&eacute;n aseg&uacute;rese de que usted no tiene avisos de cobro duplicado de la lista. Por ejemplo; si usted tiene una cuenta que ha ido a las colecciones, el acreedor original puede enumerar la deuda, as&iacute; como la agencia de cobranza. Cualquier duplicados deben ser removidos! Aseg&uacute;rese de que sus l&iacute;neas de cr&eacute;dito adecuadas se publican en sus informes de cr&eacute;dito. A menudo, en un esfuerzo por hacer que sea menos deseable sus competidores, algunos acreedores no publicar su l&iacute;nea de cr&eacute;dito adecuada. Mostrando de cr&eacute;dito menos disponible puede afectar negativamente su puntaje de cr&eacute;dito. Si usted ve que esto ocurra en su informe de cr&eacute;dito, usted tiene derecho a quejarse y traer a su atenci&oacute;n. Si usted tiene quiebras que debe mostrar un saldo de cero ... asegurarse de que muestran un saldo de cero! Muy a menudo, el acreedor no reportar&aacute; una \"quiebra anulaci&oacute;n de deudas\" como un saldo de cero hasta que haya sido discutida.</p>\n    </li>\n   <li>\n    <p><strong>Si tiene alguna marcas negativas en su informe de cr&eacute;dito, negociar con el acreedor o prestamista para quitarla. * Le ayudaremos con este paso.</strong><br /> Si usted ya es cliente desde hace mucho tiempo y es algo tan simple como un retraso en el pago de una sola vez, un acreedor a menudo limpiar la basura para mantenerlo como un cliente fiel. A veces van a hacer esto si usted llama y pregunta. Sin embargo, si usted tiene una marca negativa grave (como un proyecto de ley desde hace mucho tiempo que se ha ido a las colecciones), siempre negociar un pago a cambio de la retirada del elemento negativo. Siempre aseg&uacute;rese de que tiene este acuerdo con ellos por escrito. No pague una factura que ha ido a las colecciones a menos que el acreedor se compromete por escrito que van a quitar el elemento despectivo de su informe de cr&eacute;dito. Esto es importante; al hablar con el acreedor o agencia de colecci&oacute;n de una deuda que ha ido a las colecciones, no admiten que la deuda es suya. Admisi&oacute;n de la deuda puede reiniciar el estatuto de limitaciones, y puede permitir que el acreedor de demandar a usted. Usted es tambi&eacute;n menos probable que sea capaz de negociar una carta de eliminaci&oacute;n si usted admite que esta deuda es suya. Simplemente digo \"Llamo por n&uacute;mero de cuenta ________\" en lugar de \"Voy a llamar a mi deuda atrasada.\" De nuevo, como su especialista de cr&eacute;dito, nosotros le ayudaremos con este paso.</p>\n    </li>\n   <li>\n    <p><strong>Pagar todas las tarjetas de cr&eacute;dito y cualquier cr&eacute;dito revolvente hasta por debajo de 30% de la l&iacute;nea de cr&eacute;dito disponible.</strong> <br /> Este paso por s&iacute; solo puede hacer un gran impacto en su calificaci&oacute;n. El sistema de puntuaci&oacute;n de cr&eacute;dito quiere asegurarse de que usted no est&aacute; extendido demasiado, pero al mismo tiempo, se quiere ver de que realmente utiliza su tarjeta de cr&eacute;dito. 30% de la l&iacute;nea de cr&eacute;dito disponible parece ser el \"ajuste de l&iacute;neas de cr&eacute;dito frente a\" la magia relaci&oacute;n a tener. Por ejemplo; si usted tiene una tarjeta de cr&eacute;dito con una l&iacute;nea de cr&eacute;dito de $ 10.000, asegurarse de que nunca m&aacute;s de $ 3000 (incluso si usted paga su cuenta en su totalidad cada mes). Si sus saldos son m&aacute;s altos que el 30% de la l&iacute;nea de cr&eacute;dito disponible, pagarles abajo. Aqu&iacute; es otra cosa que puedes intentar; pregunte a sus reditors largos de tiempo si van a aumentar su l&iacute;nea de cr&eacute;dito sin verificar su puntaje de FICO o su informe de cr&eacute;dito. D&iacute;gales que usted va a comprar una casa y usted no puede permitirse el lujo de tener accesos a su informe de cr&eacute;dito. Muchos no lo har&eacute;, pero algunos lo har&aacute;n.</p>\n   </li>\n   <li>\n    <p><strong>No cierre sus cuentas de tarjetas de cr&eacute;dito de edad.</strong> <br /> Antiguo estableci&oacute; cuentas muestran su historia, y le dicen acerca de su estabilidad y h&aacute;bitos de pago. Si usted tiene una cuenta de tarjeta de cr&eacute;dito de edad que desea dejar de usar, simplemente cortar las tarjetas o guardarlos en un caj&oacute;n, pero mantener las cuentas abiertas.</p>\n    </li>\n   <li>\n    <p><strong>Evitar la aplicaci&oacute;n de un nuevo cr&eacute;dito. <br /> </strong> No aplicar para cualquier nuevo cr&eacute;dito! Cada vez que usted solicita un nuevo cr&eacute;dito, su informe de cr&eacute;dito se comprueba. Nuevas tarjetas de cr&eacute;dito no le ayudar&aacute; a su puntaje de cr&eacute;dito y una cuenta de cr&eacute;dito de menos de un a&ntilde;o de edad pueden hacerle da&ntilde;o a su puntuaci&oacute;n de cr&eacute;dito. Use sus tarjetas de cr&eacute;dito y lo menos posible hasta la pr&oacute;xima evaluaci&oacute;n de cr&eacute;dito.</p>\n    </li>\n   <li>\n    <p><strong>Tener al menos tres l&iacute;neas de cr&eacute;dito revolventes y un pr&eacute;stamo a plazos activa (o pagado) que aparece en su informe de cr&eacute;dito.</strong><br /> El sistema de puntuaci&oacute;n quiere ver que usted mantenga una variedad de cuentas de cr&eacute;dito. Tambi&eacute;n se quiere ver que usted tiene 3 l&iacute;neas de cr&eacute;dito revolventes. Si usted no tiene tres tarjetas de cr&eacute;dito activas, es posible que desee abrir algunos (pero tenga en cuenta que si lo hace, tendr&aacute; que esperar alg&uacute;n tiempo antes de rescoring). Si usted tiene mal cr&eacute;dito y no es aprobado para una tarjeta de cr&eacute;dito normal, es posible que desee configurar una cuenta de \"tarjeta de cr&eacute;dito asegurada\". Esto significa que usted tendr&aacute; que hacer un dep&oacute;sito que es igual o superior a su l&iacute;mite, lo que garantiza que el banco que va a pagar el pr&eacute;stamo. Es una excelente manera de establecer cr&eacute;dito. Ejemplos de un pr&eacute;stamo a plazos ser&iacute;an un pr&eacute;stamo de coche, o podr&iacute;a ser para los muebles o un electrodom&eacute;stico. Adem&aacute;s de lo anterior, que tiene una hipoteca que figuran traer&aacute; su puntaje a&uacute;n m&aacute;s alto.</p>\n    </li>\n </ol>\n </div>\n  <div style=\"clear: both;\">&nbsp;</div>\n\n\n  <div id=\"con1\" class=\"h7\">\n    <div class=\"col-md-12 margin-20\">\n     <span class=\"caption-subject font-dgrey uppercase contacs\">\n     A lo largo de este proceso, recuerde siempre:\n     </span>\n     <p class=\"margin-10\">Se tarda hasta 30 d&iacute;as para cualquiera de estos elementos para ser informado ya menudo ya reflexionar sobre su historia Informes de Cr&eacute;dito. Muy a menudo tenemos que escribir una serie de cartas que desaf&iacute;an las agencias de cr&eacute;dito. Cada vez que nos debe permitir 30 d&iacute;as para responder. Se puede sentir como un proceso lento, pero colgar en &eacute;l, ya que no funciona y el resultado final le ahorrar&aacute; una enorme cantidad de dinero.</p>\n    <div style=\"clear: both; height: 15px;\">&nbsp;</div>\n    </div>\n  </div>\n            </div>\n</div>');
INSERT INTO `crd_options` (`iOptionId`, `vOption`, `vOptionValue`) VALUES
(12, 'default_credit_info_page_content_es', '<div class=\"normaltext1\" style=\"text-align:justify; \">\r\n  <div style=\"clear:both;\"> </div>\r\n  <div class=\"margintop26\">\r\n  <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n  <tbody><tr>\r\n    <td align=\"left\" valign=\"top\" width=\"18%\"><img src=\"https://www.secureclientaccess.com/application/images/roadtogood.png\" alt=\"home\"></td>\r\n    <td align=\"left\" valign=\"top\">  <div class=\"h7\"> Información del Cliente y Recomendaciones: </div>\r\n    <div style=\"clear:both;\"></div>\r\n    <div>\r\n     <p>Como su especialista de crédito, nuestro trabajo más importante es revisar los informes de historial de crédito con usted y para iniciar el proceso de disputar artículos inexactos negativos en sus informes. Nuestra próxima tarea importante es darle recomendaciones a seguir, lo que ayudará a acelerar el proceso, conseguir una puntuación más alta y mantenerlo. Mientras hacemos nuestra parte, por favor lea la siguiente información y seguir nuestros pasos y su puntuación comenzará a mejorar rápidamente.</p>\r\n     </div>\r\n    </td>\r\n  </tr>\r\n</tbody></table>\r\n</div>\r\n\r\n  <div style=\"clear:both;\"> </div>\r\n  <div class=\"margintop26 margin35 h7\">Contenido (haga clic para ver)</div>\r\n  <div style=\"clear:both;\"> </div>\r\n  <div class=\"margintop20 margin35\">\r\n    <ul>\r\n      <li><a href=\"#con1\">¿Cómo funciona la reparación de crédito?</a></li>\r\n      <li><a href=\"#con2\">Fundamentos de informe de crédito</a></li>\r\n      <li><a href=\"#con3\">¿Tengo derecho a saber lo que hay en mi informe?</a></li>\r\n      <li><a href=\"#con4\">¿Qué es un puntaje de crédito?</a></li>\r\n      <li><a href=\"#con5\">Los rangos de puntuación de crédito y su significado</a></li>\r\n      <li><a href=\"#con6\">¿Cómo oficinas de crédito determinan mi puntaje de crédito? </a></li>\r\n      <li><a href=\"#con7\">¿Qué tipo de información hacen agencias de crédito recopilan y venden?</a></li>\r\n      <li><a href=\"#con8\">¿Cómo una agencia de crédito a determinar mi puntuación?</a></li>\r\n      <li><a href=\"#con9\">¿Cuál es el secreto de un alto puntaje de crédito?</a></li>\r\n      <li><a href=\"#con10\">¿Qué sucede si se le niega crédito o no consigue los términos que desea?</a></li>\r\n      <li><a href=\"#con1\">La Ley de Informe Justo de Crédito </a></li>\r\n      <li><a href=\"#con12\">¿Cómo puedo acelerar el proceso?</a></li>\r\n      <li><a href=\"#con12\">7 pasos para aumentar su puntuación de crédito rápido</a></li>\r\n    </ul>\r\n  </div>\r\n  <div style=\"clear:both;\" id=\"con1\"> </div>\r\n  <div class=\"margintop20 margin35 h7\">¿Cómo funciona la reparación de crédito?</div>\r\n  <div style=\"clear:both;\"> </div>\r\n  <div>\r\n    <p>La reparación del crédito es 100% legal. Funciona debido a una ley llamada \"The Fair Credit Reporting Act.\" El FCRA le da el derecho de disputar cualquier artículo en su informe de crédito. Si ese elemento no se puede verificar en un plazo razonable (generalmente 30 días), que debe ser eliminado. Incluso los elementos negativos precisos menudo se pueden quitar o negociados fuera. Esta ley es la base de toda la reparación del crédito y de la base de nuestro negocio.</p>\r\n  </div>\r\n  <div style=\"clear:both;\" id=\"con2\"> </div>\r\n  <div>\r\n    <div class=\"margintop20 margin35\" style=\"width:750px;height:200px;float:left; margin-right:20px;\">\r\n      <div class=\"h7\">Fundamentos de informe de crédito</div>\r\n      <div style=\"clear:both;\"> </div>\r\n      <div style=\"float:left; margin-right:20px;\">\r\n        <p>Su historial de pagos de crédito y el perfil es la composición de un informe de crédito. Estos archivos o informes son mantenidos y vendidos por \"agencias de informes de los consumidores.\" Un tipo de agencia de información se conoce comúnmente como una oficina de crédito. Las tres mayores agencias de crédito son TransUnion, Equifax y Experian. Usted tiene un historial de crédito con estas agencias si ha aplicado alguna vez para una cuenta de crédito o cargo, un préstamo personal, o un historial de crédito job.Your contiene información sobre sus ingresos, deudas, y el historial de pagos de crédito. También indica si ha incumplido las deudas, tienen juicios pendientes o manutención de los hijos, y si tiene alguna quiebras.</p>\r\n      </div>\r\n    </div>\r\n    <div class=\"margintop20\" style=\"float:right;height:200px;\">\r\n    <img src=\"https://www.secureclientaccess.com/application/images/goodbadcredit.png\" alt=\"home\" style=\"width:215px;\"></div>\r\n  </div>\r\n  <div style=\"clear:both;height:50px;\" id=\"con3\"> </div>\r\n  <div class=\"margintop26 margin35 h7\" id=\"con1\">¿Tengo derecho a saber lo que hay en mi informe?</div>\r\n  <div style=\"clear:both;\"> </div>\r\n  <div>\r\n    <p>Por supuesto que sí. Por ley, las agencias deben darle un informe gratuito anual. Sin embargo esos informes gratuitos no contienen puntuaciones. Para los resultados de reparación de crédito le recomendamos un servicio de monitoreo de crédito barato. </p>\r\n  </div>\r\n  <div style=\"clear:both;\" id=\"con4\"> </div>\r\n  <div class=\"margintop26 margin35 h7\">¿Qué es un puntaje de crédito?</div>\r\n  <div style=\"clear:both;\"> </div>\r\n  <div>\r\n    <p>Un puntaje de crédito es un número generado por una fórmula matemática que tiene la intención de predecir la capacidad crediticia. Las puntuaciones de crédito van desde 300 hasta 850. Cuanto más alto sea su puntaje, más probabilidades hay de obtener un préstamo. Cuanto menor sea su puntaje, menos probabilidades hay de obtener un préstamo. Si usted tiene un bajo puntaje de crédito y usted se las arregla para conseguir su aprobación para el crédito, entonces su tasa de interés será mucho más alto que alguien que tenía un buen puntaje de crédito y el dinero prestado. Así que, básicamente, tener un alto puntaje de crédito puede ahorrar miles de dólares durante la vida de su hipoteca, préstamo de auto, o tarjeta de crédito.</p>\r\n  </div>\r\n  <div style=\"clear:both;\" id=\"con5\"> </div>\r\n  <div>\r\n    <div class=\"margintop20 margin35\" style=\"width:690px;float:left; margin-right:20px;\">\r\n      <div class=\"h7\">Rangos de puntaje de crédito y su significado</div>\r\n      <div style=\"clear:both;\"> </div>\r\n      <div style=\"float:left;\">\r\n        <p><strong>800 y Superior (Excelente)</strong> Con un puntaje de crédito en este rango de ningún prestamista volverá a rechazar su solicitud de préstamo. Además, la TAE (Tasa Anual Equivalente) en sus tarjetas de crédito será el más bajo posible. Usted será tratado como la realeza. El logro de esta excelente calificación crediticia no sólo requiere el conocimiento financiero y disciplina y, sino también un buen historial de crédito. En términos generales, para lograr este excelente calificación también debe utilizar una cantidad sustancial de crédito sobre una base mensual en curso y siempre pagarlo antes de tiempo.</p>\r\n    \r\n        <p>700-799 (Muy Bueno) 27% de la población de Estados Unidos pertenece a este rango de puntuación de crédito. Con este rango de puntuación de crédito podrá disfrutar de buenos precios y aprobado para casi cualquier tipo de préstamo de crédito o préstamo personal, si no garantizados o asegurados.</p>\r\n  \r\n    </div>\r\n    </div>\r\n    <div class=\"margintop20\" style=\"float:right;\"> \r\n    <img src=\"https://www.secureclientaccess.com/application/images/creditscore.png\" alt=\"home\"></div>\r\n  </div>\r\n  <div style=\"clear:both;\"> </div>\r\n  <div>\r\n    <p><strong>680 – 699  (Bien)</strong> Esta gama es el puntaje de crédito promedio. En este rango de aprobaciones están prácticamente garantizadas, pero las tasas de interés podrían ser ligeramente superior. Si usted está pensando en un préstamo a largo plazo, como una hipoteca, tratar de trabajar para aumentar su puntuación de crédito superior a 720 y usted será recompensado por sus esfuerzos - sus ahorros a largo plazo van a ser notable. </p>\r\n  </div>\r\n  <div>\r\n    <p><strong>620 -679 (OK o Judiciales)</strong> Dependiendo de qué tipo de préstamo o crédito que está solicitando y su historial de crédito, usted podría encontrar que las tasas que se citan no son los mejores. Eso no quiere decir que no vas a ser aprobado, pero, se aplicarán ciertas restricciones a los términos del préstamo.</p>\r\n  </div>\r\n  <div>\r\n    <p><strong>580 – 619 (Pobre) </strong>Con una mala calificación crediticia todavía puede obtener un préstamo sin garantía personal e incluso una hipoteca, pero, los términos y las tasas de interés no va a ser muy atractivo. Usted estará obligado a pagar más durante un período de tiempo más largo debido a las altas tasas de interés.</p>\r\n  </div>\r\n  <div>\r\n    <p><strong>500 – 579 (Malo) </strong>\r\nCon una puntuación de este rango se puede obtener un préstamo, pero nada ni siquiera cerca de lo que usted espera que sea. Algunas personas con mal crédito solicitar préstamos para consolidar la deuda en busca de un nuevo comienzo. Sin embargo, si decide hacerlo, entonces proceder con cautela. Con un puntaje de 500 créditos que necesita para asegurarse de que no cumple con los pagos o se le toma su situación peor y podría dirigirse hacia la quiebra, que no es lo que quieres.</p>\r\n  </div>\r\n  <div>\r\n    <p><strong>499 y Baja (muy malo) </strong>Si esta es tu rango de puntuación necesita ayuda serio y profesional con la forma de manejar su crédito. Estás cometiendo demasiados errores de crédito y que sólo va a empeorar si no se toman medidas positivas. Si usted está pensando en un préstamo a continuación, tenga en cuenta que si usted encuentra un prestamista subprime (que no será fácil), las tasas serán muy alto y las condiciones serán muy estricta. Le recomendamos que arreglar su crédito y sólo entonces pasar a solicitar un préstamo.</p>\r\n  </div>\r\n  <div style=\"clear:both;\" id=\"con6\"> </div>\r\n  <div>\r\n    <div class=\"margintop20 margin35\" style=\"width:515px;float:left; margin-right:20px;\">\r\n      <div class=\"h7\">¿Cómo oficinas de crédito determinan mi puntaje de crédito?</div>\r\n      <div style=\"clear:both;\"> </div>\r\n      <div style=\"float:left;\">\r\n        <p>35% - historial de pagos</p>\r\n        <p>30% - Ratio de Deuda</p>\r\n        <p>15% - Duración del historial de crédito</p>\r\n        <p>10% - Tipos de crédito</p>\r\n        <p>10% - Número de consultas de crédito<br>\r\n        </p>\r\n        <p>Los porcentajes en esta tabla muestran la importancia de cada una de las categorías es la hora de determinar su puntaje de crédito. Le ayudaremos a eliminar los elementos negativos de su historial de pagos. También le mostramos cómo maximizar su puntaje ratio de deuda, incluso si el pago de tarjetas de crédito no es una opción.</p>\r\n      </div>\r\n    </div>\r\n    <div class=\"margintop20\" style=\"float:right;\"> \r\n    <img src=\"https://www.secureclientaccess.com/application/images/creditscoregraph.png\" alt=\"home\"></div>\r\n  </div>\r\n  <div style=\"clear:both;\" id=\"con7\"> </div>\r\n  <div class=\"margintop26 margin35 h7\" id=\"con1\">¿Qué tipo de información hacen agencias de crédito recopilan y venden?</div>\r\n  <div style=\"clear:both;\"> </div>\r\n  <div>\r\n    <p>Las agencias de crédito recopilan y venden cuatro tipos básicos de información:</p>\r\n    <ol>\r\n      <li>\r\n        <p><strong>La información de identificación y empleo</strong><br>\r\n          Su nombre, fecha de nacimiento, número de Seguro Social, empleador, y el nombre del cónyuge se registran habitualmente en su informe de crédito. También pueden proporcionar información sobre su historial de empleo, propiedad de la vivienda, los ingresos, y la dirección anterior, si un acreedor solicita este tipo de información.</p>\r\n      </li><li>\r\n        <p><strong>Información de registros públicos</strong><br>\r\n         Eventos que son un asunto de interés público, tales como quiebras, ejecuciones hipotecarias o embargos fiscales, pueden aparecer en su informe.</p>\r\n      </li><li>\r\n        <p><strong>Consultas</strong><br>\r\n          CRA debe mantener un registro de todos los acreedores que han pedido su historial de crédito en el último año. Por lo general, es beneficioso para mantener el número de consultas tan bajas como sea posible.</p>\r\n      </li><li>\r\n        <p><strong>Historial de pagos</strong><br>\r\n          Sus cuentas con diferentes acreedores se enumeran, junto con los balances, saldos altos, y los saldos pendientes. Eventos relacionados, como la remisión de una cuenta atrasada a una agencia de cobro, cobran de cuentas u otros incumplimientos también pueden tenerse en cuenta.</p>\r\n    </li></ol>\r\n  </div>\r\n  <div style=\"clear:both;\"> </div>\r\n  <div style=\"clear:both;\" id=\"con8\"> </div>\r\n  <div>\r\n    <div class=\"margintop20 margin35\" style=\"width:545px;float:left; margin-right:20px;\">\r\n      <div class=\"h7\">¿Cómo una agencia de crédito a determinar mi puntuación?</div>\r\n      <div style=\"clear:both;\"> </div>\r\n      <div style=\"float:left;\">\r\n        <p>Modelos de calificación de crédito son complejas y varían a menudo entre los acreedores y para diferentes tipos de crédito. Si uno de los factores cambia, su puntuación puede cambiar - pero la mejoría depende generalmente de cómo ese factor se relaciona con otros factores considerados por el modelo. </p>\r\n        <p><strong>Modelos de puntuación general evalúan los siguientes tipos de información en su informe de crédito:</strong></p>\r\n        <ul>\r\n          <li>\r\n            <p> <strong>¿Paga</strong><strong> sus facturas a tiempo?</strong> El historial de pagos es un factor importante en la puntuación de crédito. Si usted ha pagado las facturas finales, tienen colecciones, o se declaró en bancarrota, estos eventos no reflejará bien en su puntaje de crédito. </p>\r\n          </li><li>\r\n            <p> <strong>¿Usted tiene un historial de crédito de largo? </strong>En términos generales, el más largo de su historia de cuentas de haberes, más confiado en que habrá como prestatario. </p>\r\n          </li><li>\r\n            <p> <strong>¿Ha solicitado crédito recientemente? </strong>Si tiene muchas consultas recientes esto puede ser interpretado como negativo por las agencias de informes de crédito. Sólo solicitar crédito cuando usted realmente lo desea. </p>\r\n          </li><li>\r\n            <p> <strong>¿Cuál es su deuda pendiente? </strong> Es importante que usted no está utilizando toda su crédito disponible. Si todas sus tarjetas de crédito están al máximo, sus calificaciones reflejarán que usted no está manejando su deuda con prudencia. </p>\r\n        </li></ul>\r\n      </div>\r\n    </div>\r\n    <div class=\"margintop20\" style=\"float:right;\"> \r\n    <img src=\"https://www.secureclientaccess.com/application/images/metergraphics.png\" alt=\"meter\" height=\"300px;\"></div>\r\n  </div>\r\n  <div style=\"clear:both;\"> </div>\r\n  <div id=\"con9\">\r\n    <div class=\"margintop20 margin35\" style=\"width:680px;float:left;\">\r\n      <div class=\"h7\">¿Cuál es el secreto de un alto puntaje de crédito? </div>\r\n      <div style=\"clear:both;\"> </div>\r\n      <div style=\"float:left;\">\r\n        <ol>\r\n          <li>\r\n            <p>Siempre pague sus cuentas a tiempo!</p>\r\n          </li><li>\r\n            <p>No cierre las cuentas viejas!</p>\r\n          </li><li>\r\n            <p>No aplicar para cualquier nuevo crédito!<span lang=\"\"> </span> </p>\r\n          </li><li>\r\n            <p><strong>No utilice nunca más del 30% de su crédito disponible en cada tarjeta de crédito!</strong> </p>\r\n        </li></ol>\r\n      </div>\r\n    </div>\r\n    <div style=\"float:right;\"> <img src=\"https://www.secureclientaccess.com/application/images/topscore.png\" alt=\"topscore\"></div>\r\n  </div>\r\n  <div style=\"clear:both;\" id=\"con10\"> </div>\r\n  <div>\r\n    <div class=\"margintop20 margin35\" style=\"width:730px;float:left; margin-right:20px;\">\r\n      <div class=\"h7\">¿Qué sucede si se le niega crédito o no consigue los términos que desea?</div>\r\n      <div style=\"clear:both;\"> </div>\r\n      <div style=\"float:left;\">\r\n        <p>Si se le niega el crédito, la Ley de Igualdad de Oportunidades de Crédito requiere que el acreedor le dará un aviso que le indica las razones específicas de su solicitud fue rechazada o el hecho de que usted tiene el derecho de conocer las razones si le preguntas a un plazo de 60 días. Razones indefinidas y vagas para la negación son ilegales, por lo que piden al acreedor para ser específico. Las razones aceptables incluyen: \"Su ingreso fue baja\" o \"No se han empleado el tiempo suficiente.\" Razones inaceptables incluyen: \"Usted no cumple con nuestros estándares mínimos\" o \"Usted no recibe suficientes puntos en nuestro sistema de puntuación de crédito . \"</ p>\r\n         <p> Si un acreedor dice que estaba negado el crédito, porque usted está demasiado cerca de sus límites de crédito en sus tarjetas de crédito o si tiene demasiadas cuentas de tarjetas de crédito, es posible que desee volver a aplicar después de pagar sus balances o el cierre de algunas cuentas. Sistemas de puntuación de crédito consideran información actualizada y cambian con el tiempo.</p>\r\n        <p>Si usted ha sido negado el crédito, o no recibió los términos de tasas o de crédito que desea, pedir al acreedor si se utilizó un sistema de puntuación de crédito. Si es así, pregunte qué características o factores fueron utilizados en ese sistema, y las mejores maneras de mejorar su aplicación. Si obtiene crédito, pedir al acreedor si vas a encontrar las mejores tarifas y condiciones disponibles y, si no, por qué. Si no se le ofrece la mejor tarifa disponible debido a imprecisiones en su informe de crédito, asegúrese de disputar la información inexacta en su informe de crédito.</p>\r\n      </div>\r\n    </div>\r\n    <div class=\"margintop20\" style=\"float:right;\">\r\n     <img src=\"https://www.secureclientaccess.com/application/images/cople.gif\" alt=\"\" style=\"width:225px;\"></div>\r\n  </div>\r\n  <div style=\"clear:both;\" id=\"con12\"> </div>\r\n  <div class=\"margintop20 margin35 h7\">¿Cómo puedo acelerar el proceso?</div>\r\n  <div style=\"clear:both;\"> </div>\r\n  <div>\r\n    <p>Después de estos 7 pasos aumentará su puntaje rápidamente.</p>\r\n  </div>\r\n  <div style=\"clear:both;\" id=\"con2\"> </div>\r\n  <div>\r\n    <div class=\"margintop20 margin35\" style=\"width:730px;float:left; margin-right:20px;\">\r\n      <div class=\"h7\">Fundamentos de informe de crédito </div>\r\n      <div style=\"clear:both;\"> </div>\r\n      <div style=\"float:left;\">\r\n        <ol>\r\n          <li>\r\n          <strong>Ordene nuevas copias nuevas de sus informes de crédito de las 3 agencias: Equifax, Experian y TransUnion. </strong><strong>*Nosotros le ayudaremos con este paso.</strong>\r\n           <br>\r\n\r\n        Los informes de crédito están en constante cambio. Por lo tanto es importante copias arriba-hasta la fecha. Una buena regla de oro que saber es: si alguien corre su puntuación o informes, esto hará daño a su puntuación. Sin embargo, <strong>si usted pide sus propios informes de crédito</strong> (que le ayudaremos con) <strong>su puntaje no se verá afectada. </strong>También puede inscribirse para el monitoreo de crédito para ver sus informes y anotar y seguir los cambios que se van produciendo.\r\n          </li>\r\n        </ol>\r\n      </div>\r\n    </div>\r\n    <div class=\"margintop20\" style=\"float:right;\"> \r\n    <img src=\"https://www.secureclientaccess.com/application/images/bargraph.png\" alt=\"home\" style=\"width:225px;\"></div>\r\n  </div>\r\n  <div style=\"clear:both;\"></div>\r\n  <div class=\"margintop10 margin35\">\r\n    <ol start=\"2\">\r\n      <li>\r\n      <p>  <strong>Corrija todos los errores en sus informes de crédito. * Le ayudaremos con este paso.</strong>\r\n        <br>\r\n   \r\n     Ir a través de sus informes de crédito con mucho cuidado. Especialmente buscar; Retrasos en los pagos, cancelaciones, colecciones u otros elementos negativos que no son los suyos, cuentas que aparecen como \"resuelta\", \"pagado despectiva\", \"pagado anulación de deudas\" o que no sea \"actual\" o \"pagado según lo acordado\" nada si que pagó a tiempo y en su totalidad, las cuentas que todavía se muestran como no remunerado que se incluyeron en una quiebra, los elementos negativos mayores de siete años (10 en el caso de quiebra) que debería haber caído automáticamente su informe (hay que tener cuidado con este último, porque a veces las puntuaciones en realidad descienden cuando los malos elementos se caen de su informe. Es una peculiaridad en el software de crédito de puntuación FICO, y el efecto potencial de eliminar los elementos negativos de edad es difícil de predecir por adelantado). También asegúrese de que usted no tiene avisos de cobro duplicado de la lista. Por ejemplo; si usted tiene una cuenta que ha ido a las colecciones, el acreedor original puede enumerar la deuda, así como la agencia de cobranza. Cualquier duplicados deben ser removidos! Asegúrese de que sus líneas de crédito adecuadas se publican en sus informes de crédito. A menudo, en un esfuerzo por hacer que sea menos deseable sus competidores, algunos acreedores no publicar su línea de crédito adecuada. Mostrando de crédito menos disponible puede afectar negativamente su puntaje de crédito. Si usted ve que esto ocurra en su informe de crédito, usted tiene derecho a quejarse y traer a su atención. Si usted tiene quiebras que debe mostrar un saldo de cero ... asegurarse de que muestran un saldo de cero! Muy a menudo, el acreedor no reportará una \"quiebra anulación de deudas\" como un saldo de cero hasta que haya sido discutida.</p>\r\n      </li>\r\n\r\n      <li>\r\n     <p><strong>Si tiene alguna marcas negativas en su informe de crédito, negociar con el acreedor o prestamista para quitarla. * Le ayudaremos con este paso.</strong><br>\r\n        \r\n         Si usted ya es cliente desde hace mucho tiempo y es algo tan simple como un retraso en el pago de una sola vez, un acreedor a menudo limpiar la basura para mantenerlo como un cliente fiel. A veces van a hacer esto si usted llama y pregunta. Sin embargo, si usted tiene una marca negativa grave (como un proyecto de ley desde hace mucho tiempo que se ha ido a las colecciones), siempre negociar un pago a cambio de la retirada del elemento negativo. Siempre asegúrese de que tiene este acuerdo con ellos por escrito. No pague una factura que ha ido a las colecciones a menos que el acreedor se compromete por escrito que van a quitar el elemento despectivo de su informe de crédito. Esto es importante; al hablar con el acreedor o agencia de colección de una deuda que ha ido a las colecciones, no admiten que la deuda es suya. Admisión de la deuda puede reiniciar el estatuto de limitaciones, y puede permitir que el acreedor de demandar a usted. Usted es también menos probable que sea capaz de negociar una carta de eliminación si usted admite que esta deuda es suya. Simplemente digo \"Llamo por número de cuenta ________\" en lugar de \"Voy a llamar a mi deuda atrasada.\" De nuevo, como su especialista de crédito, nosotros le ayudaremos con este paso.</p>\r\n     \r\n      </li><li>\r\n      <p><strong>Pagar todas las tarjetas de crédito y cualquier crédito revolvente hasta por debajo de 30% de la línea de crédito disponible.</strong> \r\n          <br>\r\n          Este paso por sí solo puede hacer un gran impacto en su calificación. El sistema de puntuación de crédito quiere asegurarse de que usted no está extendido demasiado, pero al mismo tiempo, se quiere ver de que realmente utiliza su tarjeta de crédito. 30% de la línea de crédito disponible parece ser el \"ajuste de líneas de crédito frente a\" la magia relación a tener. Por ejemplo; si usted tiene una tarjeta de crédito con una línea de crédito de $ 10.000, asegurarse de que nunca más de $ 3000 (incluso si usted paga su cuenta en su totalidad cada mes). Si sus saldos son más altos que el 30% de la línea de crédito disponible, pagarles abajo. Aquí es otra cosa que puedes intentar; pregunte a sus reditors largos de tiempo si van a aumentar su línea de crédito sin verificar su puntaje de FICO o su informe de crédito. Dígales que usted va a comprar una casa y usted no puede permitirse el lujo de tener accesos a su informe de crédito. Muchos no lo haré, pero algunos lo harán.</p>\r\n\r\n      </li><li>\r\n        <p><strong>No cierre sus cuentas de tarjetas de crédito de edad.</strong> <br>\r\n        \r\n          Antiguo estableció cuentas muestran su historia, y le dicen acerca de su estabilidad y hábitos de pago. Si usted tiene una cuenta de tarjeta de crédito de edad que desea dejar de usar, simplemente cortar las tarjetas o guardarlos en un cajón, pero mantener las cuentas abiertas. </p>\r\n\r\n      </li><li>\r\n        <p><strong>Evitar la aplicación de un nuevo crédito. <br>\r\n          </strong>\r\n          No aplicar para cualquier nuevo crédito! Cada vez que usted solicita un nuevo crédito, su informe de crédito se comprueba. Nuevas tarjetas de crédito no le ayudará a su puntaje de crédito y una cuenta de crédito de menos de un año de edad pueden hacerle daño a su puntuación de crédito. Use sus tarjetas de crédito y lo menos posible hasta la próxima evaluación de crédito.</p>\r\n        \r\n      </li><li>\r\n      <p><strong>Tener al menos tres líneas de crédito revolventes y un préstamo a plazos activa (o pagado) que aparece en su informe de crédito.</strong><br>\r\n         \r\n         \r\nEl sistema de puntuación quiere ver que usted mantenga una variedad de cuentas de crédito. También se quiere ver que usted tiene 3 líneas de crédito revolventes. Si usted no tiene tres tarjetas de crédito activas, es posible que desee abrir algunos (pero tenga en cuenta que si lo hace, tendrá que esperar algún tiempo antes de rescoring). Si usted tiene mal crédito y no es aprobado para una tarjeta de crédito normal, es posible que desee configurar una cuenta de \"tarjeta de crédito asegurada\". Esto significa que usted tendrá que hacer un depósito que es igual o superior a su límite, lo que garantiza que el banco que va a pagar el préstamo. Es una excelente manera de establecer crédito. Ejemplos de un préstamo a plazos serían un préstamo de coche, o podría ser para los muebles o un electrodoméstico. Además de lo anterior, que tiene una hipoteca que figuran traerá su puntaje aún más alto.</p>\r\n    </li></ol>\r\n  </div>\r\n  <div style=\"clear:both;\"> </div>\r\n  <div class=\"h7\" id=\"con1\">A lo largo de este proceso, recuerde siempre:</div>\r\n  <div style=\"clear:both;\"> </div>\r\n\r\n    <p>Se tarda hasta 30 días para cualquiera de estos elementos para ser informado ya menudo ya reflexionar sobre su historia Informes de Crédito. Muy a menudo tenemos que escribir una serie de cartas que desafían las agencias de crédito. Cada vez que nos debe permitir 30 días para responder. Se puede sentir como un proceso lento, pero colgar en él, ya que no funciona y el resultado final le ahorrará una enorme cantidad de dinero.</p>\r\n\r\n  <div style=\"clear:both;height:15px;\"></div>\r\n</div>');

-- --------------------------------------------------------

--
-- Table structure for table `crd_paperwork`
--

CREATE TABLE `crd_paperwork` (
  `iclientpaperid` int(10) NOT NULL,
  `vpaperworktext` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_paperwork`
--

INSERT INTO `crd_paperwork` (`iclientpaperid`, `vpaperworktext`) VALUES
(1, 'Client Agreement'),
(4, 'Photo ID Copy'),
(5, 'Utility Bill/Proof of Address'),
(6, 'Social Security Card (optional)');

-- --------------------------------------------------------

--
-- Table structure for table `crd_paperwork_client`
--

CREATE TABLE `crd_paperwork_client` (
  `iPaperWorkClientId` int(11) NOT NULL,
  `iclientpaperid` int(11) NOT NULL COMMENT 'crd_papwerwork{iclientpaperid}',
  `iClient_id` int(11) NOT NULL COMMENT 'crd_clients{iclient_id}',
  `eReceived` enum('yes','no') NOT NULL COMMENT 'documents received: yes/no',
  `document_name` varchar(255) DEFAULT NULL,
  `original_name` text DEFAULT NULL,
  `dAdded_Date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_paperwork_client`
--

INSERT INTO `crd_paperwork_client` (`iPaperWorkClientId`, `iclientpaperid`, `iClient_id`, `eReceived`, `document_name`, `original_name`, `dAdded_Date`) VALUES
(1, 6, 1, 'yes', 'sample_power_of_attorney.pdf', NULL, NULL),
(2, 5, 1, 'yes', 'sample_utility_bill_copy.png', NULL, NULL),
(3, 4, 1, 'yes', 'sample_photo_id_copy.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `crd_quicknote`
--

CREATE TABLE `crd_quicknote` (
  `iid` int(11) NOT NULL,
  `vtitle` varchar(250) NOT NULL COMMENT 'title of the quicknotes',
  `tbody` text NOT NULL COMMENT 'body of the quicknotes',
  `icreate_by` int(11) NOT NULL COMMENT 'team member id who creatd this quicknotes',
  `dcreated_on` datetime NOT NULL COMMENT 'created date',
  `dmodified_on` datetime NOT NULL COMMENT 'modified date'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='QuickNotes (macros) module';

--
-- Dumping data for table `crd_quicknote`
--

INSERT INTO `crd_quicknote` (`iid`, `vtitle`, `tbody`, `icreate_by`, `dcreated_on`, `dmodified_on`) VALUES
(1, 'Sample Quick Note', 'Here is a Sample Quick Note. These are pre-written, saved messages to use for Secure Messaging. You can automatically insert the name of the Client, Affiliate or Team Member by adding \"Placeholders\" to the stored message. Click on \"Manage QuickNotes\" to see available placeholders. Remember: secure messages don\'t send. That is why they\'re secure. A user must log in to see them!', 1, '2014-05-19 00:00:00', '2014-05-19 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `crd_quick_mode_item_description`
--

CREATE TABLE `crd_quick_mode_item_description` (
  `iid` int(11) NOT NULL,
  `vdescription` varchar(250) NOT NULL,
  `iteam_id` int(11) NOT NULL COMMENT 'who team member added',
  `dadded_date` datetime NOT NULL COMMENT 'added date',
  `vmodify_date` datetime NOT NULL COMMENT 'modify date',
  `vadded_by` varchar(50) NOT NULL DEFAULT 'team' COMMENT 'this description may be added by team or system'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dispute Item -Quick Mode- Description.';

--
-- Dumping data for table `crd_quick_mode_item_description`
--

INSERT INTO `crd_quick_mode_item_description` (`iid`, `vdescription`, `iteam_id`, `dadded_date`, `vmodify_date`, `vadded_by`) VALUES
(1, '30 Days Late', 0, '2014-04-22 03:02:57', '2014-04-22 03:02:57', 'system'),
(2, '60 Days Late', 0, '2014-04-22 03:02:57', '2014-04-22 03:02:57', 'system'),
(3, '90 Days Late', 0, '2014-04-22 03:02:57', '2014-04-22 03:02:57', 'system'),
(4, '120 Days Late', 0, '2014-04-22 03:02:57', '2014-04-22 03:02:57', 'system'),
(5, '150 Days Late', 0, '2014-04-22 03:02:57', '2014-04-22 03:02:57', 'system'),
(6, '180 Days Late', 0, '2014-04-22 03:02:57', '2014-04-22 03:02:57', 'system'),
(7, 'Defaulted', 0, '2014-04-22 03:02:57', '2014-04-22 03:02:57', 'system'),
(8, 'Unsatisfactory', 0, '2014-04-22 03:02:58', '2014-04-22 03:02:58', 'system'),
(9, 'Bad Debt', 0, '2014-04-22 03:02:58', '2014-04-22 03:02:58', 'system'),
(10, 'Write-Off', 0, '2014-04-22 03:02:58', '2014-04-22 03:02:58', 'system'),
(11, 'Charge-Off', 0, '2014-04-22 03:02:58', '2014-04-22 03:02:58', 'system'),
(12, 'Derogatory', 0, '2014-04-22 03:02:58', '2014-04-22 03:02:58', 'system'),
(13, 'Judgment', 0, '2014-04-22 03:02:58', '2014-04-22 03:02:58', 'system'),
(14, 'Bankruptcy', 0, '2014-04-22 03:02:58', '2014-04-22 03:02:58', 'system'),
(15, 'Returned Check', 0, '2014-04-22 03:02:58', '2014-04-22 03:02:58', 'system'),
(16, 'Unpaid', 0, '2014-04-22 03:02:58', '2014-04-22 03:02:58', 'system'),
(17, 'Claim Filed', 0, '2014-04-22 03:02:58', '2014-04-22 03:02:58', 'system'),
(18, 'Bad Debt & Placed For Collection & Skip', 0, '2014-04-22 03:02:58', '2014-04-22 03:02:58', 'system'),
(23, 'Profit And Loss Writeoff', 0, '2014-04-22 03:06:31', '2014-04-22 03:06:31', 'system'),
(24, 'Foreclosure', 0, '2014-04-22 03:06:31', '2014-04-22 03:06:31', 'system'),
(26, 'Credit Grantor Reclaimed Collateral To Settle', 0, '2014-04-22 03:06:48', '2014-04-22 03:06:48', 'system'),
(27, 'Lien', 0, '2014-04-22 03:06:48', '2014-04-22 03:06:48', 'system'),
(28, 'Lawsuit', 0, '2014-04-22 03:06:48', '2014-04-22 03:06:48', 'system'),
(30, 'Civil Action', 0, '2014-04-22 03:07:03', '2014-04-22 03:07:03', 'system'),
(31, 'Delinquent', 0, '2014-04-22 03:07:03', '2014-04-22 03:07:03', 'system'),
(32, 'Delinquencies', 0, '2014-04-22 03:07:03', '2014-04-22 03:07:03', 'system'),
(33, 'Delinquency', 0, '2014-04-22 03:07:03', '2014-04-22 03:07:03', 'system'),
(34, 'Liability', 0, '2014-04-22 03:07:03', '2014-04-22 03:07:03', 'system'),
(35, 'Repossession', 0, '2014-04-22 03:07:03', '2014-04-22 03:07:03', 'system'),
(36, 'Repossessed', 0, '2014-04-22 03:07:03', '2014-04-22 03:07:03', 'system'),
(37, 'Collection', 0, '2014-04-22 03:07:03', '2014-04-22 03:07:03', 'system'),
(38, 'Collection Department / Agency / Attorney', 0, '2014-04-22 03:07:03', '2014-04-22 03:07:03', 'system'),
(39, 'Collections', 0, '2014-04-22 03:07:03', '2014-04-22 03:07:03', 'system'),
(40, 'Placed For Collection', 0, '2014-04-22 03:07:03', '2014-04-22 03:07:03', 'system'),
(41, 'Assigned To Attorney', 0, '2014-04-22 03:07:03', '2014-04-22 03:07:03', 'system'),
(42, 'Seriously Past Due', 0, '2014-04-22 03:07:03', '2014-04-22 03:07:03', 'system'),
(43, 'Past Due', 0, '2014-04-22 03:07:03', '2014-04-22 03:07:03', 'system'),
(44, 'Unpaid Balance Reported As A Loss', 0, '2014-04-22 03:07:04', '2014-04-22 03:07:04', 'system'),
(45, 'Reported As A Loss', 0, '2014-04-22 03:07:04', '2014-04-22 03:07:04', 'system'),
(46, 'Late', 0, '2014-04-22 03:07:04', '2014-04-22 03:07:04', 'system'),
(47, 'Inquiry', 0, '2014-04-22 03:07:04', '2014-04-22 03:07:04', 'system'),
(48, 'Debt Purchase', 0, '2014-04-22 03:07:04', '2014-04-22 03:07:04', 'system'),
(49, 'Legally Paid In Full For Less Than The Full Balance', 0, '2014-04-22 03:07:04', '2014-04-22 03:07:04', 'system'),
(50, 'Settled', 0, '2014-04-22 03:07:04', '2014-04-22 03:07:04', 'system'),
(51, 'Judgement', 0, '2014-04-22 03:07:04', '2014-04-22 03:07:04', 'system'),
(52, 'Late 30', 0, '2014-04-22 03:07:04', '2014-04-22 03:07:04', 'system'),
(53, 'Late 60 Days', 0, '2014-04-22 03:07:04', '2014-04-22 03:07:04', 'system'),
(54, 'Late 90 Days', 0, '2014-04-22 03:07:04', '2014-04-22 03:07:04', 'system'),
(55, 'Late 120 Days', 0, '2014-04-22 03:07:04', '2014-04-22 03:07:04', 'system'),
(56, 'Late 150 Days', 0, '2014-04-22 03:07:04', '2014-04-22 03:07:04', 'system'),
(57, 'Late 180 Days', 0, '2014-04-22 03:07:04', '2014-04-22 03:07:04', 'system');

-- --------------------------------------------------------

--
-- Table structure for table `crd_reminder_type`
--

CREATE TABLE `crd_reminder_type` (
  `ireminder_type_id` int(11) NOT NULL,
  `vreminder_type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_reminder_type`
--

INSERT INTO `crd_reminder_type` (`ireminder_type_id`, `vreminder_type_name`) VALUES
(1, 'Billing'),
(2, 'Send Invoice'),
(3, 'Follow Up'),
(4, 'Appointment'),
(5, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `crd_resources`
--

CREATE TABLE `crd_resources` (
  `iid` int(11) NOT NULL,
  `eresources_for` enum('admin','client') NOT NULL COMMENT 'option resources for whom.',
  `vtitle_en` varchar(250) NOT NULL COMMENT 'title in english',
  `vtitle_es` varchar(250) NOT NULL COMMENT 'title in spanish',
  `vdesc_en` text NOT NULL COMMENT 'description in english',
  `vdesc_es` text NOT NULL COMMENT 'description in spanish',
  `vlink` varchar(250) NOT NULL COMMENT 'web link address URL',
  `vlogo` varchar(250) DEFAULT NULL COMMENT 'image logo name',
  `estatus` enum('active','inactive') NOT NULL,
  `edefault` enum('yes','no') NOT NULL COMMENT 'is resources default (generated by the system) or not',
  `dadded_date` datetime NOT NULL,
  `iorder` int(12) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_resources`
--

INSERT INTO `crd_resources` (`iid`, `eresources_for`, `vtitle_en`, `vtitle_es`, `vdesc_en`, `vdesc_es`, `vlink`, `vlogo`, `estatus`, `edefault`, `dadded_date`, `iorder`) VALUES
(1, 'admin', 'American Credit Repair Academy', 'American Credit Repair Academy', 'Learn to make unlimited revenue with your own Credit Repair Business. Learn the business and skills of credit repair; How to get clients fast and receive a steady flow of paid referrals, plus proven methods to achieve a high credit repair success rate.', 'Learn to make unlimited revenue with your own Credit Repair Business. Learn the business and skills of credit repair; How to get clients fast and receive a steady flow of paid referrals, plus proven methods to achieve a high credit repair success rate.', 'http://www.americancreditrepairacademy.com/', 'acra.png', 'active', 'no', '2013-05-30 09:44:52', 0),
(2, 'admin', 'MyCreditRepairSite.com ', 'MyCreditRepairSite.com ', 'Make your own instant business website in minutes with no experience necessary! Or have pre-designed Credit Repair Business website that you can customize by clicking your mouse.', 'Make your own instant business website in minutes with no experience necessary! Or have pre-designed Credit Repair Business website that you can customize by clicking your mouse.', 'http://www.mycreditrepairsite.com/', 'mcrs.png', 'active', 'no', '2013-05-30 09:45:43', 0),
(3, 'admin', 'Credit-Aid Software  ', 'Credit-Aid Software  ', 'Americaâ€™s most popular Credit Repair Software. Everything you need to run a lucrative credit repair business.', 'Americaâ€™s most popular Credit Repair Software. Everything you need to run a lucrative credit repair business.', 'http://www.credit-aid.com/pro.htm', 'cas.gif', 'active', 'no', '2013-05-30 09:46:26', 0),
(4, 'admin', 'Credit Repair Software Reseller ', 'Credit Repair Software Reseller ', 'Want an alternative product for potential clients who would rather do-it-themselves? Offer them your own brand of credit repair software. If you offer to refund the cost of the software if they come back for your services. 9 times out of 10 they will return.', 'Want an alternative product for potential clients who would rather do-it-themselves? Offer them your own brand of credit repair software. If you offer to refund the cost of the software if they come back for your services. 9 times out of 10 they will return.', 'http://www.credit-aid.com/pro.htm', 'crsk.png', 'active', 'no', '2013-05-30 09:47:05', 0),
(5, 'admin', 'Credit Card Processing for Credit Services', 'Credit Card Processing for Credit Services', 'Apply for a Merchant Account to process credit card payments from your clients.', 'Apply for a Merchant Account to process credit card payments from your clients.', 'http://www.credit-aid.com/pro.htm', 'ccp.png', 'active', 'no', '2013-05-30 09:47:42', 0),
(6, 'admin', 'Kall8.com ', 'Kall8.com ', 'Need a Toll-Free 800 Line or a Virtual PBX Phone System? This is who we use in our offices and we love them.', 'Need a Toll-Free 800 Line or a Virtual PBX Phone System? This is who we use in our offices and we love them.', 'http://www.toll-free800.com/15478.htm', 'k8.gif', 'active', 'no', '2013-05-30 09:48:16', 0),
(7, 'client', 'CreditCheckTotal', 'CreditCheckTotal', 'Get fast and secure access to your 3 bureau credit report, scores, credit simulator and credit monitoring.', 'Get fast and secure access to your 3 bureau credit report, scores, credit simulator and credit monitoring.', 'http://www.creditchecktotal.com', 'cct.jpg', 'active', 'yes', '2013-05-30 09:48:48', 1),
(8, 'client', 'Wells Fargo Enhanced ID Theft Protection', 'Wells Fargo Enhanced ID Theft Protection', 'Get fast and secure access to your 3 bureau credit report, scores, credit simulator and credit monitoring.', 'Get fast and secure access to your 3 bureau credit report, scores, credit simulator and credit monitoring.', 'https://www.wellsfargo.com/insurance-identity-theft-protection', 'wf.png', 'active', 'yes', '2013-05-30 09:49:22', 2);

-- --------------------------------------------------------

--
-- Table structure for table `crd_role_list`
--

CREATE TABLE `crd_role_list` (
  `irole_id` int(10) NOT NULL,
  `vrole_name` varchar(50) NOT NULL,
  `iallow` int(1) NOT NULL DEFAULT 0 COMMENT '1 = cannot update or delete, 0 = can update or delete'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_role_list`
--

INSERT INTO `crd_role_list` (`irole_id`, `vrole_name`, `iallow`) VALUES
(1, 'Admin', 1),
(2, 'Credit Specialist', 1),
(3, 'Sales Representative', 1);

-- --------------------------------------------------------

--
-- Table structure for table `crd_role_module_permission_list`
--

CREATE TABLE `crd_role_module_permission_list` (
  `irmp_id` int(11) NOT NULL,
  `irole_id` int(11) NOT NULL,
  `imodule_permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_role_module_permission_list`
--

INSERT INTO `crd_role_module_permission_list` (`irmp_id`, `irole_id`, `imodule_permission_id`) VALUES
(1, 1, 1),
(2, 1, 6),
(3, 1, 7),
(4, 1, 9),
(5, 1, 10),
(6, 1, 12),
(7, 1, 13),
(8, 1, 15),
(9, 1, 16),
(10, 1, 18),
(11, 1, 19),
(12, 1, 23),
(23, 1, 25),
(24, 1, 26),
(25, 1, 27),
(26, 1, 28),
(27, 1, 29),
(28, 1, 30),
(29, 1, 31),
(35, 1, 32),
(36, 1, 33),
(37, 1, 34),
(38, 1, 37),
(39, 1, 38),
(42, 1, 39),
(43, 1, 40),
(44, 1, 41),
(45, 1, 42),
(46, 1, 43),
(14, 2, 2),
(15, 2, 6),
(16, 2, 11),
(19, 2, 12),
(18, 2, 15),
(17, 2, 20),
(13, 2, 24),
(30, 2, 28),
(31, 2, 29),
(32, 2, 30),
(33, 2, 31),
(40, 2, 38),
(47, 2, 44),
(20, 3, 2),
(21, 3, 12),
(22, 3, 15),
(34, 3, 28),
(41, 3, 38),
(48, 3, 42),
(49, 3, 43);

-- --------------------------------------------------------

--
-- Table structure for table `crd_scheduler`
--

CREATE TABLE `crd_scheduler` (
  `Id` int(11) NOT NULL,
  `Subject` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `Location` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `Description` text CHARACTER SET utf8 DEFAULT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `IsAllDayEvent` smallint(6) NOT NULL,
  `Color` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `RecurringRule` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `iclient_id` int(50) DEFAULT NULL COMMENT 'Ref  crd_clients {clients_id}',
  `iTeam_id` int(11) DEFAULT NULL COMMENT 'crd_team {iTeam_id}',
  `created_by` int(11) DEFAULT NULL,
  `reminder_type` varchar(50) DEFAULT NULL,
  `IsRead` enum('yes','no') NOT NULL DEFAULT 'no',
  `cronjob_reference_id` int(11) DEFAULT NULL,
  `estatus` enum('done','pending') NOT NULL DEFAULT 'pending',
  KEY `reminder_type` (`reminder_type`),
  KEY `estatus` (`estatus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_score`
--

CREATE TABLE `crd_score` (
  `iId` int(10) NOT NULL,
  `iclient_id` int(10) NOT NULL,
  `iBureau_id` int(10) NOT NULL,
  `iScore` int(10) DEFAULT NULL,
  `iScoreGroupID` int(10) NOT NULL DEFAULT 0 COMMENT 'common for the bureaus and score',
  `dDatetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crd_score`
--

INSERT INTO `crd_score` (`iId`, `iclient_id`, `iBureau_id`, `iScore`, `iScoreGroupID`, `dDatetime`) VALUES
(1, 2, 1, 465, 1, '2012-01-02 00:00:00'),
(2, 2, 2, 451, 1, '2012-01-02 00:00:00'),
(3, 2, 3, 472, 1, '2012-01-02 00:00:00'),
(4, 2, 1, 536, 2, '2012-03-06 00:00:00'),
(5, 2, 2, 532, 2, '2012-03-06 00:00:00'),
(6, 2, 3, 538, 2, '2012-03-06 00:00:00'),
(7, 2, 1, 641, 3, '2012-04-04 00:00:00'),
(8, 2, 2, 649, 3, '2012-04-04 00:00:00'),
(9, 2, 3, 645, 3, '2012-04-04 00:00:00'),
(10, 2, 1, 748, 4, '2012-12-04 00:00:00'),
(11, 2, 2, 752, 4, '2012-12-04 00:00:00'),
(12, 2, 3, 751, 4, '2012-12-04 00:00:00'),
(13, 1, 1, 450, 5, '2012-08-01 00:00:00'),
(14, 1, 2, 451, 5, '2012-08-01 00:00:00'),
(15, 1, 3, 452, 5, '2012-08-01 00:00:00'),
(16, 1, 1, 550, 6, '2012-09-03 00:00:00'),
(17, 1, 2, 552, 6, '2012-09-03 00:00:00'),
(18, 1, 3, 551, 6, '2012-09-03 00:00:00'),
(19, 1, 1, 650, 7, '2012-10-01 00:00:00'),
(20, 1, 2, 649, 7, '2012-10-01 00:00:00'),
(21, 1, 3, 652, 7, '2012-10-01 00:00:00'),
(22, 1, 1, 735, 8, '2012-11-29 00:00:00'),
(23, 1, 2, 740, 8, '2012-11-29 00:00:00'),
(24, 1, 3, 738, 8, '2012-11-29 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `crd_team`
--

CREATE TABLE `crd_team` (
  `iTeam_id` int(11) NOT NULL,
  `iUser_id` int(11) NOT NULL COMMENT 'cro_user_access {iuser_id}',
  `iRole_id` int(11) NOT NULL COMMENT 'crd_role_list {irole_id}',
  `vFirst_Name` varchar(20) NOT NULL,
  `vLast_Name` varchar(20) NOT NULL,
  `vEmail` varchar(50) NOT NULL,
  `vPhone` varchar(20) DEFAULT NULL,
  `vPhoneExt` varchar(10) DEFAULT NULL COMMENT 'extension for phone number',
  `vMobile` varchar(20) DEFAULT NULL,
  `vFax` varchar(20) DEFAULT NULL COMMENT 'fax number for the team-member',
  `vPhoto` varchar(255) NOT NULL,
  `vAddress` varchar(255) DEFAULT NULL,
  `gender` varchar(20) NOT NULL,
  `dnew_feature_date` datetime DEFAULT NULL COMMENT 'for new feature link heighlight',
  `estatus` enum('active','inactive') NOT NULL DEFAULT 'active' COMMENT 'active / inactive functionailty of team member',
  `dnext_renual_date` datetime DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `link` varchar(200) DEFAULT NULL,
  `grp` varchar(25) DEFAULT NULL,
  `friends` text DEFAULT NULL,
  `title_for_portal` varchar(50) DEFAULT NULL COMMENT 'Title to display in portal'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_team_login_sent`
--

CREATE TABLE `crd_team_login_sent` (
  `iLoginSent_id` int(11) NOT NULL,
  `iTeam_id` int(11) NOT NULL COMMENT 'crd_team {iTeam_id}',
  `sent_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crd_to_do_list`
--

CREATE TABLE `crd_to_do_list` (
  `itodo_id` int(11) NOT NULL,
  `ttotdo_text` text NOT NULL,
  `iuser_id` int(11) NOT NULL,
  `estatus` enum('done','pending') NOT NULL,
  `dadded_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cometchat`
--
ALTER TABLE `cometchat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to` (`to`),
  ADD KEY `from` (`from`),
  ADD KEY `direction` (`direction`),
  ADD KEY `read` (`read`),
  ADD KEY `sent` (`sent`);

--
-- Indexes for table `cometchat_announcements`
--
ALTER TABLE `cometchat_announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to` (`to`),
  ADD KEY `time` (`time`),
  ADD KEY `to_id` (`to`,`id`);

--
-- Indexes for table `cometchat_block`
--
ALTER TABLE `cometchat_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fromid` (`fromid`),
  ADD KEY `toid` (`toid`),
  ADD KEY `fromid_toid` (`fromid`,`toid`);

--
-- Indexes for table `cometchat_chatroommessages`
--
ALTER TABLE `cometchat_chatroommessages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `chatroomid` (`chatroomid`),
  ADD KEY `sent` (`sent`);

--
-- Indexes for table `cometchat_chatrooms`
--
ALTER TABLE `cometchat_chatrooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lastactivity` (`lastactivity`),
  ADD KEY `createdby` (`createdby`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `cometchat_chatrooms_users`
--
ALTER TABLE `cometchat_chatrooms_users`
  ADD PRIMARY KEY (`userid`,`chatroomid`) USING BTREE,
  ADD KEY `chatroomid` (`chatroomid`),
  ADD KEY `lastactivity` (`lastactivity`),
  ADD KEY `userid` (`userid`),
  ADD KEY `userid_chatroomid` (`chatroomid`,`userid`);

--
-- Indexes for table `cometchat_guests`
--
ALTER TABLE `cometchat_guests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lastactivity` (`lastactivity`);

--
-- Indexes for table `cometchat_session`
--
ALTER TABLE `cometchat_session`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `cometchat_status`
--
ALTER TABLE `cometchat_status`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `typingto` (`typingto`),
  ADD KEY `typingtime` (`typingtime`);

--
-- Indexes for table `cometchat_users`
--
ALTER TABLE `cometchat_users`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `cometchat_videochatsessions`
--
ALTER TABLE `cometchat_videochatsessions`
  ADD PRIMARY KEY (`username`),
  ADD KEY `username` (`username`),
  ADD KEY `identity` (`identity`),
  ADD KEY `timestamp` (`timestamp`);

--
-- Indexes for table `crd_abbreviation`
--
ALTER TABLE `crd_abbreviation`
  ADD PRIMARY KEY (`iId`);

--
-- Indexes for table `crd_affiliate`
--
ALTER TABLE `crd_affiliate`
  ADD PRIMARY KEY (`iAffilate_id`),
  ADD KEY `iUser_id` (`iUser_id`),
  ADD KEY `estatus_portal` (`estatus`,`ePortalAccess`);

--
-- Indexes for table `crd_affiliates_assignedto`
--
ALTER TABLE `crd_affiliates_assignedto`
  ADD PRIMARY KEY (`iAssignedTo_id`),
  ADD KEY `iaffiliate_id` (`iaffiliate_id`),
  ADD KEY `iTeam_id` (`iTeam_id`);

--
-- Indexes for table `crd_affiliate_commission`
--
ALTER TABLE `crd_affiliate_commission`
  ADD PRIMARY KEY (`iid`),
  ADD UNIQUE KEY `deffective_date` (`deffective_date`,`iaffiliate_id`);

--
-- Indexes for table `crd_affiliate_commission_log`
--
ALTER TABLE `crd_affiliate_commission_log`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `crd_affiliate_login_sent`
--
ALTER TABLE `crd_affiliate_login_sent`
  ADD PRIMARY KEY (`iLoginSent_id`),
  ADD KEY `iAffilate_id` (`iAffilate_id`);

--
-- Indexes for table `crd_affiliate_payment_hist`
--
ALTER TABLE `crd_affiliate_payment_hist`
  ADD PRIMARY KEY (`ipay_id`);

--
-- Indexes for table `crd_agreements`
--
ALTER TABLE `crd_agreements`
  ADD PRIMARY KEY (`iagreement_id`),
  ADD KEY `estatus` (`estatus`);

--
-- Indexes for table `crd_api_logs`
--
ALTER TABLE `crd_api_logs`
  ADD PRIMARY KEY (`iId`);

--
-- Indexes for table `crd_audit_template`
--
ALTER TABLE `crd_audit_template`
  ADD PRIMARY KEY (`audit_template_id`);

--
-- Indexes for table `crd_bureaus`
--
ALTER TABLE `crd_bureaus`
  ADD PRIMARY KEY (`iIds`);

--
-- Indexes for table `crd_chargebee_coupon`
--
ALTER TABLE `crd_chargebee_coupon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `crd_chargebee_plan`
--
ALTER TABLE `crd_chargebee_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crd_chat`
--
ALTER TABLE `crd_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crd_checklist_track`
--
ALTER TABLE `crd_checklist_track`
  ADD KEY `check_id` (`check_id`);

--
-- Indexes for table `crd_clientletters`
--
ALTER TABLE `crd_clientletters`
  ADD PRIMARY KEY (`iletter_id`),
  ADD KEY `iclient_id` (`iclient_id`),
  ADD KEY `ibureau_id` (`ibureau_id`),
  ADD KEY `ifurnisher_id` (`ifurnisher_id`),
  ADD KEY `flag` (`flag`);
  
--
-- Indexes for table `crd_clients`
--
ALTER TABLE `crd_clients`
  ADD PRIMARY KEY (`iclient_id`),
  ADD KEY `iuser_id` (`iuser_id`),
  ADD KEY `vclient_mname` (`vclient_mname`),
  ADD KEY `vclient_fname` (`vclient_fname`),
  ADD KEY `vclient_lname` (`vclient_lname`),
  ADD KEY `vclient_email` (`vclient_email`),
  ADD KEY `ireferredby_id` (`ireferredby_id`),
  ADD KEY `ePortalAccessClient` (`ePortalAccessClient`),
  ADD KEY `iclient_status` (`iclient_status`);

--
-- Indexes for table `crd_clients_assignedto`
--
ALTER TABLE `crd_clients_assignedto`
  ADD PRIMARY KEY (`iAssignedTo_id`),
  ADD KEY `iClient_id` (`iClient_id`),
  ADD KEY `iTeam_id` (`iTeam_id`);

--
-- Indexes for table `crd_clients_deleted`
--
ALTER TABLE `crd_clients_deleted`
  ADD PRIMARY KEY (`iclient_id`),
  ADD KEY `iuser_id` (`iuser_id`),
  ADD KEY `vclient_mname` (`vclient_mname`),
  ADD KEY `vclient_fname` (`vclient_fname`),
  ADD KEY `vclient_lname` (`vclient_lname`),
  ADD KEY `vclient_email` (`vclient_email`),
  ADD KEY `ireferredby_id` (`ireferredby_id`),
  ADD KEY `ePortalAccessClient` (`ePortalAccessClient`),
  ADD KEY `iclient_status` (`iclient_status`);

--
-- Indexes for table `crd_clients_onboarding`
--
ALTER TABLE `crd_clients_onboarding`
  ADD PRIMARY KEY (`obid`),
  ADD KEY `obid` (`obid`,`iclient_id`,`tokan`);

--
-- Indexes for table `crd_clients_simple_audit`
--
ALTER TABLE `crd_clients_simple_audit`
  ADD PRIMARY KEY (`said`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `crd_client_affiliate_hist`
--
ALTER TABLE `crd_client_affiliate_hist`
  ADD PRIMARY KEY (`iid`);

--
-- Indexes for table `crd_client_debt`
--
ALTER TABLE `crd_client_debt`
  ADD PRIMARY KEY (`iDebt_id`);

--
-- Indexes for table `crd_client_imported_pdf`
--
ALTER TABLE `crd_client_imported_pdf`
  ADD PRIMARY KEY (`iPDF_id`);

--
-- Indexes for table `crd_client_invoice`
--
ALTER TABLE `crd_client_invoice`
  ADD PRIMARY KEY (`iInvoiceId`),
  ADD KEY `iClientId` (`iClientId`);

--
-- Indexes for table `crd_client_invoiceitem`
--
ALTER TABLE `crd_client_invoiceitem`
  ADD PRIMARY KEY (`iInvoiceItemId`);

--
-- Indexes for table `crd_client_login_sent`
--
ALTER TABLE `crd_client_login_sent`
  ADD PRIMARY KEY (`iLoginSent_id`),
  ADD KEY `iClient_id` (`iClient_id`);

--
-- Indexes for table `crd_client_notes`
--
ALTER TABLE `crd_client_notes`
  ADD PRIMARY KEY (`inote_id`);

--
-- Indexes for table `crd_client_payment_option`
--
ALTER TABLE `crd_client_payment_option`
  ADD PRIMARY KEY (`iid`);

--
-- Indexes for table `crd_client_payment_recieved`
--
ALTER TABLE `crd_client_payment_recieved`
  ADD PRIMARY KEY (`iPaymentReceivedId`);

--
-- Indexes for table `crd_client_statuses`
--
ALTER TABLE `crd_client_statuses`
  ADD PRIMARY KEY (`istatus_id`);

--
-- Indexes for table `crd_client_status_logs`
--
ALTER TABLE `crd_client_status_logs`
  ADD PRIMARY KEY (`iid`),
  ADD KEY `iold_status_id` (`iold_status_id`),
  ADD KEY `inew_status_id` (`inew_status_id`),
  ADD KEY `iclient_id` (`iclient_id`),
  ADD KEY `ddate` (`ddate`),
  ADD KEY `iaffiliate_id` (`esource`);

--
-- Indexes for table `crd_common_log`
--
ALTER TABLE `crd_common_log`
  ADD PRIMARY KEY (`iid`),
  ADD KEY `iclient_id` (`iclient_id`),
  ADD KEY `ddate` (`ddate`),
  ADD KEY `iteam_id` (`iteam_id`);

--
-- Indexes for table `crd_company_contacts`
--
ALTER TABLE `crd_company_contacts`
  ADD PRIMARY KEY (`icontact_id`);

--
-- Indexes for table `crd_credit_monitoring_details`
--
ALTER TABLE `crd_credit_monitoring_details`
  ADD PRIMARY KEY (`alid`);

--
-- Indexes for table `crd_cr_source`
--
ALTER TABLE `crd_cr_source`
  ADD PRIMARY KEY (`iid`);

--
-- Indexes for table `crd_daily_expense`
--
ALTER TABLE `crd_daily_expense`
  ADD PRIMARY KEY (`iDailyExpense_id`);

--
-- Indexes for table `crd_disputeitems`
--
ALTER TABLE `crd_disputeitems`
  ADD PRIMARY KEY (`idispute_id`),
  ADD KEY `iclient_id` (`iclient_id`);

--
-- Indexes for table `crd_disputeitems_qm`
--
ALTER TABLE `crd_disputeitems_qm`
  ADD PRIMARY KEY (`idispute_id`);

--
-- Indexes for table `crd_dispute_bureaus_furni`
--
ALTER TABLE `crd_dispute_bureaus_furni`
  ADD PRIMARY KEY (`idispbur_id`),
  ADD KEY `idispute_id` (`idispute_id`,`ibureau_id`),
  ADD KEY `idisputestatus_id` (`idisputestatus_id`);

--
-- Indexes for table `crd_dispute_bureaus_furni_qm`
--
ALTER TABLE `crd_dispute_bureaus_furni_qm`
  ADD PRIMARY KEY (`idispbur_id`);

--
-- Indexes for table `crd_dispute_reasons`
--
ALTER TABLE `crd_dispute_reasons`
  ADD PRIMARY KEY (`idisputereason_id`);

--
-- Indexes for table `crd_dispute_statustypes`
--
ALTER TABLE `crd_dispute_statustypes`
  ADD PRIMARY KEY (`idisputestatus_id`);

--
-- Indexes for table `crd_email_setting`
--
ALTER TABLE `crd_email_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_key` (`option_key`),
  ADD KEY `option_value` (`option_value`),
  ADD KEY `template_id` (`template_id`);

--
-- Indexes for table `crd_email_template`
--
ALTER TABLE `crd_email_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crd_furnishers`
--
ALTER TABLE `crd_furnishers`
  ADD PRIMARY KEY (`ifurnisher_id`);

--
-- Indexes for table `crd_guided_tour`
--
ALTER TABLE `crd_guided_tour`
  ADD PRIMARY KEY (`itour_id`);

--
-- Indexes for table `crd_instruction`
--
ALTER TABLE `crd_instruction`
  ADD PRIMARY KEY (`iinstruction_id`);

--
-- Indexes for table `crd_invoiceitem_master`
--
ALTER TABLE `crd_invoiceitem_master`
  ADD PRIMARY KEY (`iInvoiceItemId`);

--
-- Indexes for table `crd_letters_dispute_relation`
--
ALTER TABLE `crd_letters_dispute_relation`
  ADD PRIMARY KEY (`iletter_dispute_id`),
  ADD UNIQUE KEY `idispute_id` (`idispute_id`,`iletter_id`,`iclient_id`);

--
-- Indexes for table `crd_letter_templ`
--
ALTER TABLE `crd_letter_templ`
  ADD PRIMARY KEY (`itempl_id`);

--
-- Indexes for table `crd_letter_templcatg`
--
ALTER TABLE `crd_letter_templcatg`
  ADD PRIMARY KEY (`itempl_catgid`);

--
-- Indexes for table `crd_login_logs`
--
ALTER TABLE `crd_login_logs`
  ADD PRIMARY KEY (`iId`);

--
-- Indexes for table `crd_messages`
--
ALTER TABLE `crd_messages`
  ADD PRIMARY KEY (`iMsgId`);

--
-- Indexes for table `crd_module_list`
--
ALTER TABLE `crd_module_list`
  ADD PRIMARY KEY (`imodule_id`);

--
-- Indexes for table `crd_module_permission_list`
--
ALTER TABLE `crd_module_permission_list`
  ADD PRIMARY KEY (`imodule_permission_id`);

--
-- Indexes for table `crd_monthly_expense`
--
ALTER TABLE `crd_monthly_expense`
  ADD PRIMARY KEY (`iMonthlyExpense_id`);

--
-- Indexes for table `crd_monthly_expense_label`
--
ALTER TABLE `crd_monthly_expense_label`
  ADD PRIMARY KEY (`iLabel_id`);

--
-- Indexes for table `crd_onboarding_popup`
--
ALTER TABLE `crd_onboarding_popup`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `pid_2` (`pid`);

--
-- Indexes for table `crd_options`
--
ALTER TABLE `crd_options`
  ADD PRIMARY KEY (`iOptionId`);

--
-- Indexes for table `crd_paperwork`
--
ALTER TABLE `crd_paperwork`
  ADD PRIMARY KEY (`iclientpaperid`);

--
-- Indexes for table `crd_paperwork_client`
--
ALTER TABLE `crd_paperwork_client`
  ADD PRIMARY KEY (`iPaperWorkClientId`);

--
-- Indexes for table `crd_quicknote`
--
ALTER TABLE `crd_quicknote`
  ADD PRIMARY KEY (`iid`);

--
-- Indexes for table `crd_quick_mode_item_description`
--
ALTER TABLE `crd_quick_mode_item_description`
  ADD PRIMARY KEY (`iid`),
  ADD UNIQUE KEY `vdescription` (`vdescription`),
  ADD KEY `iteam_id` (`iteam_id`);

--
-- Indexes for table `crd_reminder_type`
--
ALTER TABLE `crd_reminder_type`
  ADD PRIMARY KEY (`ireminder_type_id`);

--
-- Indexes for table `crd_resources`
--
ALTER TABLE `crd_resources`
  ADD PRIMARY KEY (`iid`);

--
-- Indexes for table `crd_role_list`
--
ALTER TABLE `crd_role_list`
  ADD PRIMARY KEY (`irole_id`);

--
-- Indexes for table `crd_role_module_permission_list`
--
ALTER TABLE `crd_role_module_permission_list`
  ADD PRIMARY KEY (`irmp_id`),
  ADD UNIQUE KEY `irole_id` (`irole_id`,`imodule_permission_id`);

--
-- Indexes for table `crd_scheduler`
--
ALTER TABLE `crd_scheduler`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `crd_score`
--
ALTER TABLE `crd_score`
  ADD PRIMARY KEY (`iId`);

--
-- Indexes for table `crd_team`
--
ALTER TABLE `crd_team`
  ADD PRIMARY KEY (`iTeam_id`);

--
-- Indexes for table `crd_team_login_sent`
--
ALTER TABLE `crd_team_login_sent`
  ADD PRIMARY KEY (`iLoginSent_id`);

--
-- Indexes for table `crd_to_do_list`
--
ALTER TABLE `crd_to_do_list`
  ADD PRIMARY KEY (`itodo_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cometchat`
--
ALTER TABLE `cometchat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cometchat_announcements`
--
ALTER TABLE `cometchat_announcements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cometchat_block`
--
ALTER TABLE `cometchat_block`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cometchat_chatroommessages`
--
ALTER TABLE `cometchat_chatroommessages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cometchat_chatrooms`
--
ALTER TABLE `cometchat_chatrooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cometchat_guests`
--
ALTER TABLE `cometchat_guests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cometchat_users`
--
ALTER TABLE `cometchat_users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_abbreviation`
--
ALTER TABLE `crd_abbreviation`
  MODIFY `iId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `crd_affiliate`
--
ALTER TABLE `crd_affiliate`
  MODIFY `iAffilate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `crd_affiliates_assignedto`
--
ALTER TABLE `crd_affiliates_assignedto`
  MODIFY `iAssignedTo_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_affiliate_commission`
--
ALTER TABLE `crd_affiliate_commission`
  MODIFY `iid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_affiliate_commission_log`
--
ALTER TABLE `crd_affiliate_commission_log`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_affiliate_login_sent`
--
ALTER TABLE `crd_affiliate_login_sent`
  MODIFY `iLoginSent_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_affiliate_payment_hist`
--
ALTER TABLE `crd_affiliate_payment_hist`
  MODIFY `ipay_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_agreements`
--
ALTER TABLE `crd_agreements`
  MODIFY `iagreement_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `crd_api_logs`
--
ALTER TABLE `crd_api_logs`
  MODIFY `iId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_audit_template`
--
ALTER TABLE `crd_audit_template`
  MODIFY `audit_template_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `crd_bureaus`
--
ALTER TABLE `crd_bureaus`
  MODIFY `iIds` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `crd_chargebee_coupon`
--
ALTER TABLE `crd_chargebee_coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_chargebee_plan`
--
ALTER TABLE `crd_chargebee_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_chat`
--
ALTER TABLE `crd_chat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_checklist_track`
--
ALTER TABLE `crd_checklist_track`
  MODIFY `check_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_clientletters`
--
ALTER TABLE `crd_clientletters`
  MODIFY `iletter_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_clients`
--
ALTER TABLE `crd_clients`
  MODIFY `iclient_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `crd_clients_assignedto`
--
ALTER TABLE `crd_clients_assignedto`
  MODIFY `iAssignedTo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `crd_clients_deleted`
--
ALTER TABLE `crd_clients_deleted`
  MODIFY `iclient_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_clients_onboarding`
--
ALTER TABLE `crd_clients_onboarding`
  MODIFY `obid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `crd_clients_simple_audit`
--
ALTER TABLE `crd_clients_simple_audit`
  MODIFY `said` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_client_affiliate_hist`
--
ALTER TABLE `crd_client_affiliate_hist`
  MODIFY `iid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_client_debt`
--
ALTER TABLE `crd_client_debt`
  MODIFY `iDebt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `crd_client_imported_pdf`
--
ALTER TABLE `crd_client_imported_pdf`
  MODIFY `iPDF_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_client_invoice`
--
ALTER TABLE `crd_client_invoice`
  MODIFY `iInvoiceId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_client_invoiceitem`
--
ALTER TABLE `crd_client_invoiceitem`
  MODIFY `iInvoiceItemId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_client_login_sent`
--
ALTER TABLE `crd_client_login_sent`
  MODIFY `iLoginSent_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_client_notes`
--
ALTER TABLE `crd_client_notes`
  MODIFY `inote_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_client_payment_option`
--
ALTER TABLE `crd_client_payment_option`
  MODIFY `iid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_client_payment_recieved`
--
ALTER TABLE `crd_client_payment_recieved`
  MODIFY `iPaymentReceivedId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_client_statuses`
--
ALTER TABLE `crd_client_statuses`
  MODIFY `istatus_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Client Status Id', AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `crd_client_status_logs`
--
ALTER TABLE `crd_client_status_logs`
  MODIFY `iid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_common_log`
--
ALTER TABLE `crd_common_log`
  MODIFY `iid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_company_contacts`
--
ALTER TABLE `crd_company_contacts`
  MODIFY `icontact_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_credit_monitoring_details`
--
ALTER TABLE `crd_credit_monitoring_details`
  MODIFY `alid` int(5) NOT NULL AUTO_INCREMENT COMMENT 'id for referral links', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `crd_cr_source`
--
ALTER TABLE `crd_cr_source`
  MODIFY `iid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `crd_daily_expense`
--
ALTER TABLE `crd_daily_expense`
  MODIFY `iDailyExpense_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_disputeitems`
--
ALTER TABLE `crd_disputeitems`
  MODIFY `idispute_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `crd_disputeitems_qm`
--
ALTER TABLE `crd_disputeitems_qm`
  MODIFY `idispute_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_dispute_bureaus_furni`
--
ALTER TABLE `crd_dispute_bureaus_furni`
  MODIFY `idispbur_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `crd_dispute_bureaus_furni_qm`
--
ALTER TABLE `crd_dispute_bureaus_furni_qm`
  MODIFY `idispbur_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_dispute_reasons`
--
ALTER TABLE `crd_dispute_reasons`
  MODIFY `idisputereason_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `crd_dispute_statustypes`
--
ALTER TABLE `crd_dispute_statustypes`
  MODIFY `idisputestatus_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `crd_email_setting`
--
ALTER TABLE `crd_email_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `crd_email_template`
--
ALTER TABLE `crd_email_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `crd_furnishers`
--
ALTER TABLE `crd_furnishers`
  MODIFY `ifurnisher_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `crd_guided_tour`
--
ALTER TABLE `crd_guided_tour`
  MODIFY `itour_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_instruction`
--
ALTER TABLE `crd_instruction`
  MODIFY `iinstruction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `crd_invoiceitem_master`
--
ALTER TABLE `crd_invoiceitem_master`
  MODIFY `iInvoiceItemId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_letters_dispute_relation`
--
ALTER TABLE `crd_letters_dispute_relation`
  MODIFY `iletter_dispute_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_letter_templ`
--
ALTER TABLE `crd_letter_templ`
  MODIFY `itempl_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `crd_letter_templcatg`
--
ALTER TABLE `crd_letter_templcatg`
  MODIFY `itempl_catgid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `crd_login_logs`
--
ALTER TABLE `crd_login_logs`
  MODIFY `iId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_messages`
--
ALTER TABLE `crd_messages`
  MODIFY `iMsgId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_module_list`
--
ALTER TABLE `crd_module_list`
  MODIFY `imodule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `crd_module_permission_list`
--
ALTER TABLE `crd_module_permission_list`
  MODIFY `imodule_permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `crd_monthly_expense`
--
ALTER TABLE `crd_monthly_expense`
  MODIFY `iMonthlyExpense_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_monthly_expense_label`
--
ALTER TABLE `crd_monthly_expense_label`
  MODIFY `iLabel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `crd_onboarding_popup`
--
ALTER TABLE `crd_onboarding_popup`
  MODIFY `pid` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `crd_options`
--
ALTER TABLE `crd_options`
  MODIFY `iOptionId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `crd_paperwork`
--
ALTER TABLE `crd_paperwork`
  MODIFY `iclientpaperid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `crd_paperwork_client`
--
ALTER TABLE `crd_paperwork_client`
  MODIFY `iPaperWorkClientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `crd_quicknote`
--
ALTER TABLE `crd_quicknote`
  MODIFY `iid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `crd_quick_mode_item_description`
--
ALTER TABLE `crd_quick_mode_item_description`
  MODIFY `iid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `crd_reminder_type`
--
ALTER TABLE `crd_reminder_type`
  MODIFY `ireminder_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `crd_resources`
--
ALTER TABLE `crd_resources`
  MODIFY `iid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `crd_role_list`
--
ALTER TABLE `crd_role_list`
  MODIFY `irole_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `crd_role_module_permission_list`
--
ALTER TABLE `crd_role_module_permission_list`
  MODIFY `irmp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `crd_scheduler`
--
ALTER TABLE `crd_scheduler`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_score`
--
ALTER TABLE `crd_score`
  MODIFY `iId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `crd_team`
--
ALTER TABLE `crd_team`
  MODIFY `iTeam_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_team_login_sent`
--
ALTER TABLE `crd_team_login_sent`
  MODIFY `iLoginSent_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crd_to_do_list`
--
ALTER TABLE `crd_to_do_list`
  MODIFY `itodo_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
