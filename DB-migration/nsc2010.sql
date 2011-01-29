-- phpMyAdmin SQL Dump
-- version 3.3.4
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Янв 25 2011 г., 22:11
-- Версия сервера: 5.1.49
-- Версия PHP: 5.3.2

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT=0;
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;

--
-- База данных: `nsc2010`
--

-- --------------------------------------------------------

--
-- Структура таблицы `driver__previous_employment`
--

DROP TABLE IF EXISTS `driver__previous_employment`;
CREATE TABLE IF NOT EXISTS `driver__previous_employment` (
  `dpe_ID` int(11) NOT NULL AUTO_INCREMENT,
  `dpe_Driver_ID` int(11) NOT NULL,
  `dpe_Employer_ID` int(11) NOT NULL,
  `dpe_Employment_Start_Date` date NOT NULL,
  `dpe_Employment_Stop_Date` date NOT NULL,
  `dpe_Position` varchar(24) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpe_Salary` varchar(10) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpe_Reason_for_Leaving` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`dpe_ID`),
  KEY `fk_previous_employment_driver1` (`dpe_Driver_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=22 ;
--
-- Структура таблицы `driver__hos`
--

DROP TABLE IF EXISTS `driver__hos`;
CREATE TABLE IF NOT EXISTS `driver__hos` (
  `dhos_ID` int(11) NOT NULL AUTO_INCREMENT,
  `dhos_Driver_ID` int(11) NOT NULL,
  `dhos_date` date NOT NULL,
  `dhos_hours` int(11) NOT NULL,
  PRIMARY KEY (`dhos_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Структура таблицы `driver__lrfw`
--

DROP TABLE IF EXISTS `driver__lrfw`;
CREATE TABLE IF NOT EXISTS `driver__lrfw` (
  `dlrfw_Driver_ID` int(11) NOT NULL,
  `dlrfw_date` date NOT NULL,
  `dlrfw_from_time` varchar(5) NOT NULL,
  UNIQUE KEY `dlrfw_Driver_ID` (`dlrfw_Driver_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `driver__equipment_operated`
--

DROP TABLE IF EXISTS `driver__equipment_operated`;
CREATE TABLE IF NOT EXISTS `driver__equipment_operated` (
  `deo_ID` int(11) NOT NULL AUTO_INCREMENT,
  `deo_Driver_ID` int(11) NOT NULL,
  `deo_Equipment_Type_ID` int(11) NOT NULL,
  `deo_is_operated` enum('Yes','No') NOT NULL DEFAULT 'No',
  `deo_From_Date` date NOT NULL,
  `deo_To_Date` date DEFAULT NULL,
  `deo_Total_Miles` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`deo_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Структура таблицы `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_Parent_Company_Account_Number` int(11) DEFAULT NULL,
  `c_Number` varchar(12) COLLATE latin1_general_ci NOT NULL,
  `c_EIN` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `c_SSN` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `c_DOT_Number` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `c_Carrier_Number` varchar(15) COLLATE latin1_general_ci DEFAULT NULL,
  `c_Name` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `c_Contact_Table_ID` int(11) NOT NULL,
  `c_Annual_Support` set('Yes','No') COLLATE latin1_general_ci NOT NULL,
  `c_DOT_Regulated` set('Yes','No') COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `FK_Company_2_Parent_Company__pc_id` (`c_Parent_Company_Account_Number`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Структура таблицы `contacts_table`
--

DROP TABLE IF EXISTS `contacts_table`;
CREATE TABLE IF NOT EXISTS `contacts_table` (
  `ct_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ct_Contact` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `ct_Contact_Title` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `ct_Telephone_Number` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `ct_Contact_Fax` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `ct_Contact_Email` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ct_Address1` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ct_Address2` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ct_City` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `ct_State` tinyint(2) NOT NULL,
  `ct_Postal_Code` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `ct_Country_Code` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `ct_Start_Date` date NOT NULL,
  `ct_Created_Date_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ct_URL` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ct_logo` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `ct_Memo` text COLLATE latin1_general_ci,
  PRIMARY KEY (`ct_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Структура таблицы `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `country_ID` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(100) NOT NULL,
  PRIMARY KEY (`country_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------
--
-- Структура таблицы `custom_document__form_name`
--

DROP TABLE IF EXISTS `custom_document__form_name`;
CREATE TABLE IF NOT EXISTS `custom_document__form_name` (
  `cdfn_ID` int(11) NOT NULL AUTO_INCREMENT,
  `cdfn_pdf` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `cdfn_category_id` int(11) NOT NULL,
  `cdfn_name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`cdfn_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=15 ;

--
-- Структура таблицы `custom_document__form_category`
--

DROP TABLE IF EXISTS `custom_document__form_category`;
CREATE TABLE IF NOT EXISTS `custom_document__form_category` (
  `cdfc_ID` int(11) NOT NULL AUTO_INCREMENT,
  `cdfc_name` varchar(100) NOT NULL,
  PRIMARY KEY (`cdfc_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Структура таблицы `custom_document`
--

DROP TABLE IF EXISTS `custom_document`;
CREATE TABLE IF NOT EXISTS `custom_document` (
  `cd_ID` int(11) NOT NULL AUTO_INCREMENT,
  `cd_Driver_ID` int(11) DEFAULT NULL,
  `cd_Company_ID` int(11) DEFAULT NULL,
  `cd_Homebase_ID` int(11) DEFAULT NULL,
  `cd_Form_Name_ID` tinyint(4) NOT NULL,
  `cd_Description` text COLLATE latin1_general_ci,
  `cd_Logo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `cd_Fax_Status_id` tinyint(4) NOT NULL DEFAULT '1',
  `cd_Document_Form_Status` tinyint(4) DEFAULT NULL,
  `cd_Date_Requested` date DEFAULT NULL,
  `cd_Date_Completed` date DEFAULT NULL,
  `cd_Scan` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `cd_Archived` set('Yes','No') COLLATE latin1_general_ci NOT NULL DEFAULT 'No',
  `cd_Electronic_Signature` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `cd_DOT_Regulated` set('Yes','No') COLLATE latin1_general_ci DEFAULT NULL,
  `cd_Current_Page` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cd_ID`),
  KEY `fk_custom_document_company1` (`cd_Company_ID`),
  KEY `fk_custom_document_driver1` (`cd_Driver_ID`),
  KEY `fk_custom_document_homebase1` (`cd_Homebase_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Структура таблицы `custom_document__fax_status`
--

DROP TABLE IF EXISTS `custom_document__fax_status`;
CREATE TABLE IF NOT EXISTS `custom_document__fax_status` (
  `cdfs_id` int(11) NOT NULL AUTO_INCREMENT,
  `cdfs_status` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`cdfs_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------





--
-- Структура таблицы `custom_document__form_status`
--

DROP TABLE IF EXISTS `custom_document__form_status`;
CREATE TABLE IF NOT EXISTS `custom_document__form_status` (
  `cdfms_id` int(11) NOT NULL AUTO_INCREMENT,
  `cdfms_status` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`cdfms_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Структура таблицы `depot`
--

DROP TABLE IF EXISTS `depot`;
CREATE TABLE IF NOT EXISTS `depot` (
  `dp_id` int(11) NOT NULL AUTO_INCREMENT,
  `dp_HomeBase_Account_Number` int(11) NOT NULL,
  `dp_Name` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `dp_Contact_Table_ID` int(11) NOT NULL,
  `dp_Annual_Support` set('Yes','No') COLLATE latin1_general_ci NOT NULL,
  `dp_Road_Test_Record_Required` set('Yes','No') COLLATE latin1_general_ci NOT NULL,
  `dp_DOT_Regulated` set('Yes','No') COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`dp_id`),
  KEY `FK_Depot_2_HomeBase__h_id` (`dp_HomeBase_Account_Number`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Структура таблицы `driver`
--

DROP TABLE IF EXISTS `driver`;
CREATE TABLE IF NOT EXISTS `driver` (
  `d_ID` int(11) NOT NULL AUTO_INCREMENT,
  `d_homebase_ID` int(11) DEFAULT NULL,
  `d_depot_ID` int(11) DEFAULT NULL,
  `d_Driver_Alternate_ID` varchar(12) COLLATE latin1_general_ci DEFAULT NULL,
  `d_Driver_SSN` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `d_Entry_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `d_Employment_Type` tinyint(4) NOT NULL DEFAULT '5',
  `d_Suffix` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `d_Account` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `d_First_Name` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `d_Middle_Name` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `d_Last_Name` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `d_Gender` tinyint(4) DEFAULT NULL,
  `d_Hair_Color` tinyint(4) DEFAULT NULL,
  `d_Eye_Color` tinyint(4) DEFAULT NULL,
  `d_Height_Feet` tinyint(4) DEFAULT NULL COMMENT '1 - 9',
  `d_Height_Inches` tinyint(4) DEFAULT NULL COMMENT '1 - 11',
  `d_Date_Of_Birth` date NOT NULL,
  `d_Date_Of_Hire` date DEFAULT NULL,
  `d_Description` text COLLATE latin1_general_ci,
  `d_Telephone_Number1` varchar(14) COLLATE latin1_general_ci DEFAULT NULL,
  `d_Telephone_Number2` varchar(14) COLLATE latin1_general_ci DEFAULT NULL,
  `d_Telephone_Number3` varchar(14) COLLATE latin1_general_ci DEFAULT NULL,
  `d_Fax` varchar(14) COLLATE latin1_general_ci DEFAULT NULL,
  `d_Status` tinyint(4) NOT NULL DEFAULT '1',
  `d_Total Miles Driven` int(11) DEFAULT NULL,
  `d_Physical_Exam_Date` date DEFAULT NULL,
  `d_Doctor_Name` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `d_Medical_Card_Issue_Date` date DEFAULT NULL,
  `d_Medical_Card_Expiration_Date` date DEFAULT NULL,
  `d_DOT_Regulated` set('Yes','No') COLLATE latin1_general_ci DEFAULT NULL,
  `d_TWIC` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `d_TWIC_expiration` date DEFAULT NULL,
  `d_R_A` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `d_R_A_expiration` date DEFAULT NULL,
  `d_last_update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`d_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Структура таблицы `driver_address_history`
--

DROP TABLE IF EXISTS `driver_address_history`;
CREATE TABLE IF NOT EXISTS `driver_address_history` (
  `dah_ID` int(11) NOT NULL AUTO_INCREMENT,
  `dah_Driver_ID` int(11) NOT NULL,
  `dah_Start_Date` date NOT NULL,
  `dah_End_Date` date NOT NULL,
  `dah_Current_Address` set('YES','NO') COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dah_Address1` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dah_Address2` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `dah_City` varchar(250) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dah_State` tinyint(2) NOT NULL,
  `dah_Postal_Code` varchar(10) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dah_Country_Code` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `dah_Phone` varchar(14) COLLATE latin1_general_ci DEFAULT NULL,
  `dah_row_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dah_ID`),
  KEY `fk_driver_address_history_driver1` (`dah_Driver_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Структура таблицы `driver_service_hours`
--

DROP TABLE IF EXISTS `driver_service_hours`;
CREATE TABLE IF NOT EXISTS `driver_service_hours` (
  `dsh_ID` int(11) NOT NULL AUTO_INCREMENT,
  `dsh_Driver_ID` int(11) NOT NULL,
  `dsh_Date` date NOT NULL,
  `dsh_Off_Duty_Start_Time_1` int(11) DEFAULT NULL,
  `dsh_Off_Duty_Stop_Time_1` int(11) DEFAULT NULL,
  `dsh_Off_Duty_Start_Time_2` int(11) DEFAULT NULL,
  `dsh_Off_Duty_Stop_Time_2` int(11) DEFAULT NULL,
  `dsh_Off_Duty_Start_Time_3` int(11) DEFAULT NULL,
  `dsh_Off_Duty_Stop_Time_3` int(11) DEFAULT NULL,
  `dsh_Off_Duty_Start_Time_4` int(11) DEFAULT NULL,
  `dsh_Off_Duty_Stop_Time_4` int(11) DEFAULT NULL,
  `dsh_Total_Hours_Off_Duty` int(11) DEFAULT NULL,
  `dsh_Sleeper_Berth_Start_Time_1` int(11) DEFAULT NULL,
  `dsh_Sleeper_Berth_Stop_Time_1` int(11) DEFAULT NULL,
  `dsh_Sleeper_Berth_Start_Time_2` int(11) DEFAULT NULL,
  `dsh_Sleeper_Berth_Stop_Time_2` int(11) DEFAULT NULL,
  `dsh_Total_Hours_Sleeper_Berth` int(11) DEFAULT NULL,
  `dsh_Driving_Start_Time_1` int(11) DEFAULT NULL,
  `dsh_Driving_Stop_Time_1` int(11) DEFAULT NULL,
  `dsh_Driving_Start_Time_2` int(11) DEFAULT NULL,
  `dsh_Driving_Stop_Time_2` int(11) DEFAULT NULL,
  `dsh_Total_Hours_Driving` int(11) DEFAULT NULL,
  `dsh_On_Duty_Not_Driving_Start_Time_1` int(11) DEFAULT NULL,
  `dsh_On_Duty_Not_Driving_Stop_Time_1` int(11) DEFAULT NULL,
  `dsh_On_Duty_Not_Driving_Start_Time_2` int(11) DEFAULT NULL,
  `dsh_On_Duty_Not_Driving_Stop_Time_2` int(11) DEFAULT NULL,
  `dsh_Total_Hours_On_Duty` int(11) DEFAULT NULL,
  `dsh_Odometer_Start_1` int(11) DEFAULT NULL,
  `dsh_Odometer_Stop_1` int(11) DEFAULT NULL,
  `dsh_Total_Miles_Driving` int(11) DEFAULT NULL,
  `dsh_DOT_Regulated` set('Yes','No') COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`dsh_ID`),
  KEY `fk_driver_service_hours_driver1` (`dsh_Driver_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `driver__employment_type`
--

DROP TABLE IF EXISTS `driver__employment_type`;
CREATE TABLE IF NOT EXISTS `driver__employment_type` (
  `det_id` int(11) NOT NULL AUTO_INCREMENT,
  `det_type` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`det_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Структура таблицы `driver__equipment_operated`
--

DROP TABLE IF EXISTS `driver__equipment_operated`;
CREATE TABLE IF NOT EXISTS `driver__equipment_operated` (
  `deo_ID` int(11) NOT NULL AUTO_INCREMENT,
  `deo_Driver_ID` int(11) NOT NULL,
  `deo_Equipment_Type_ID` int(11) NOT NULL,
  `deo_is_operated` enum('Yes','No') NOT NULL DEFAULT 'No',
  `deo_From_Date` date NOT NULL,
  `deo_To_Date` date DEFAULT NULL,
  `deo_Total_Miles` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`deo_ID`),
  UNIQUE KEY `deo_driver_equipment_assigment` (`deo_Driver_ID`,`deo_Equipment_Type_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Структура таблицы `driver__eye_color`
--

DROP TABLE IF EXISTS `driver__eye_color`;
CREATE TABLE IF NOT EXISTS `driver__eye_color` (
  `dhc_id` int(11) NOT NULL AUTO_INCREMENT,
  `dhc_type` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`dhc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Структура таблицы `driver__gender`
--

DROP TABLE IF EXISTS `driver__gender`;
CREATE TABLE IF NOT EXISTS `driver__gender` (
  `dg_id` int(11) NOT NULL AUTO_INCREMENT,
  `dg_type` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`dg_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Структура таблицы `driver__hair_color`
--

DROP TABLE IF EXISTS `driver__hair_color`;
CREATE TABLE IF NOT EXISTS `driver__hair_color` (
  `dhc_id` int(11) NOT NULL AUTO_INCREMENT,
  `dhc_type` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`dhc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=7 ;





-- --------------------------------------------------------

--
-- Структура таблицы `driver__status`
--

DROP TABLE IF EXISTS `driver__status`;
CREATE TABLE IF NOT EXISTS `driver__status` (
  `ds_id` int(11) NOT NULL AUTO_INCREMENT,
  `ds_type` varchar(100) NOT NULL,
  PRIMARY KEY (`ds_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Структура таблицы `email_notification`
--

DROP TABLE IF EXISTS `email_notification`;
CREATE TABLE IF NOT EXISTS `email_notification` (
  `en_id` int(11) NOT NULL AUTO_INCREMENT,
  `en_user_id` int(11) NOT NULL,
  `en_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `en_subject_id` int(11) NOT NULL,
  `en_body` int(11) NOT NULL,
  `en_status_id` int(11) NOT NULL,
  PRIMARY KEY (`en_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `employer`
--

DROP TABLE IF EXISTS `employer`;
CREATE TABLE IF NOT EXISTS `employer` (
  `emp_ID` int(11) NOT NULL AUTO_INCREMENT,
  `emp_Employer_Name` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `emp_Address1` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `emp_Address2` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `emp_City` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `emp_State_ID` tinyint(2) NOT NULL,
  `emp_Country_ID` tinyint(2) NOT NULL DEFAULT '1',
  `emp_Postal_Code` varchar(10) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `emp_Phone` varchar(14) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `emp_Fax` varchar(14) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `emp_DOT_Safety_Sensitive_Function` set('Yes','No') COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `emp_FMCSR` enum('YES','NO') COLLATE latin1_general_ci NOT NULL DEFAULT 'NO',
  `emp_approved` enum('YES','NO') COLLATE latin1_general_ci NOT NULL DEFAULT 'NO',
  PRIMARY KEY (`emp_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=40 ;

-- --------------------------------------------------------

--
-- Структура таблицы `equipment`
--

DROP TABLE IF EXISTS `equipment`;
CREATE TABLE IF NOT EXISTS `equipment` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `e_Number` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `e_Owner_Number` varchar(12) COLLATE latin1_general_ci DEFAULT NULL,
  `e_Unit_Number` varchar(12) COLLATE latin1_general_ci DEFAULT NULL,
  `e_Alternate_ID` varchar(12) COLLATE latin1_general_ci DEFAULT NULL,
  `e_RFID_No` varchar(12) COLLATE latin1_general_ci DEFAULT NULL,
  `e_Entry_Date` datetime NOT NULL,
  `e_License_Number` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `e_License_Expiration_Date` date NOT NULL DEFAULT '0000-00-00',
  `e_Start_Mileage` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `e_Registration_State` tinyint(2) DEFAULT NULL,
  `e_Gross_Equipment_Weight_Rating` varchar(7) COLLATE latin1_general_ci DEFAULT NULL,
  `e_Gross_Equipment_Registered_Weight` varchar(7) COLLATE latin1_general_ci DEFAULT NULL,
  `e_Unladen_Weight` varchar(7) COLLATE latin1_general_ci DEFAULT NULL,
  `e_Axles` tinyint(2) DEFAULT NULL,
  `e_Name` varchar(250) COLLATE latin1_general_ci DEFAULT NULL,
  `e_Year` year(4) DEFAULT NULL,
  `e_Make` varchar(12) COLLATE latin1_general_ci DEFAULT NULL,
  `e_Color` varchar(12) COLLATE latin1_general_ci DEFAULT NULL,
  `e_Model` varchar(12) COLLATE latin1_general_ci DEFAULT NULL,
  `e_Description` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `e_New_Equipment_Status` tinyint(4) DEFAULT '1',
  `e_Active_Status` tinyint(4) DEFAULT NULL,
  `e_Fee` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `e_Title_Status` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `e_Picture` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `e_DOT_Regulated` set('Yes','No') COLLATE latin1_general_ci DEFAULT NULL,
  `e_type_id` int(11) DEFAULT NULL,
  `e_activation_date` date DEFAULT NULL,
  `e_activation_comment` tinytext COLLATE latin1_general_ci,
  `e_change_active_status_date` date DEFAULT NULL,
  `e_change_active_status_comment` tinytext COLLATE latin1_general_ci,
  `e_last_modified_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `e_valuation_value` int(11) DEFAULT NULL,
  `e_valuation_date` date DEFAULT NULL,
  `e_number_passenger_seats` int(11) DEFAULT NULL,
  PRIMARY KEY (`e_id`),
  UNIQUE KEY `e_Number` (`e_Number`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `equipment_types`
--
DROP TABLE IF EXISTS `equipment_types`;
CREATE TABLE IF NOT EXISTS `equipment_types` (
  `et_id` int(11) NOT NULL AUTO_INCREMENT,
  `et_type` varchar(50) NOT NULL,
  PRIMARY KEY (`et_id`),
  UNIQUE KEY `et_type` (`et_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `equipment_assignment`
--

DROP TABLE IF EXISTS `equipment_assignment`;
CREATE TABLE IF NOT EXISTS `equipment_assignment` (
  `ea_id` int(11) NOT NULL AUTO_INCREMENT,
  `ea_company_id` int(11) DEFAULT NULL,
  `ea_homebase_id` int(11) NOT NULL,
  `ea_depot_id` int(11) DEFAULT NULL,
  `ea_equipment_id` int(11) NOT NULL,
  `ea_owner_id` int(11) NOT NULL,
  `ea_driver_id` int(11) DEFAULT NULL,
  `ea_start_date` date NOT NULL,
  `ea_end_date` date NOT NULL,
  `ea_mileage` int(11) DEFAULT NULL,
  `ea_DOT_regulated` enum('Yes','No') NOT NULL,
  `ea_last_modified_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ea_id`),
  KEY `fk_owner_id` (`ea_owner_id`),
  KEY `fk_homebase_id` (`ea_homebase_id`),
  KEY `fk_equipment_id` (`ea_equipment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `equipment_owner`
--

DROP TABLE IF EXISTS `equipment_owner`;
CREATE TABLE IF NOT EXISTS `equipment_owner` (
  `eo_id` int(11) NOT NULL AUTO_INCREMENT,
  `eo_number` varchar(12) DEFAULT NULL,
  `eo_code` varchar(12) DEFAULT NULL,
  `eo_SSN` int(11) DEFAULT NULL,
  `eo_federal_id` int(11) NOT NULL,
  `eo_name` varchar(255) NOT NULL,
  `eo_contact` varchar(250) NOT NULL,
  `eo_phone` int(11) NOT NULL,
  `eo_fax` int(11) DEFAULT NULL,
  `eo_address1` varchar(250) NOT NULL,
  `eo_address2` varchar(250) DEFAULT NULL,
  `eo_city` varchar(250) NOT NULL,
  `eo_state_id` int(11) NOT NULL,
  `eo_postal_code` int(11) NOT NULL,
  PRIMARY KEY (`eo_id`),
  UNIQUE KEY `eo_number` (`eo_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `equipment_identifier`
--

DROP TABLE IF EXISTS `equipment_identifier`;
CREATE TABLE IF NOT EXISTS `equipment_identifier` (
  `ei_id` int(11) NOT NULL AUTO_INCREMENT,
  `ei_Equipment_Type_Types` set('EIN','Serial Number','Vessel Number') COLLATE latin1_general_ci NOT NULL,
  `ei_Equipment_Number_ID` int(11) NOT NULL,
  PRIMARY KEY (`ei_id`),
  KEY `fk_equipment_identifier_equipment1` (`ei_Equipment_Number_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `equipment_maintenance`
--

DROP TABLE IF EXISTS `equipment_maintenance`;
CREATE TABLE IF NOT EXISTS `equipment_maintenance` (
  `em_id` int(11) NOT NULL AUTO_INCREMENT,
  `em_equipment_id` int(11) DEFAULT NULL,
  `em_service_provider_id` int(11) DEFAULT NULL,
  `em_requested_date` date NOT NULL,
  `em_next_maintenance_date` date DEFAULT NULL,
  `em_completed_date` date NOT NULL,
  `em_invoice_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `em_service_date` date NOT NULL,
  `em_notes` text COLLATE latin1_general_ci,
  `em_dot_regulated` set('Yes','No') COLLATE latin1_general_ci NOT NULL DEFAULT 'No',
  `em_last_modified_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`em_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Структура таблицы `equipment__active_status`
--

DROP TABLE IF EXISTS `equipment__active_status`;
CREATE TABLE IF NOT EXISTS `equipment__active_status` (
  `eas_id` int(11) NOT NULL AUTO_INCREMENT,
  `eas_type` varchar(20) NOT NULL,
  PRIMARY KEY (`eas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Структура таблицы `equipment__new_equipment_status`
--

DROP TABLE IF EXISTS `equipment__new_equipment_status`;
CREATE TABLE IF NOT EXISTS `equipment__new_equipment_status` (
  `enes_id` int(11) NOT NULL AUTO_INCREMENT,
  `enes_type` varchar(10) NOT NULL,
  PRIMARY KEY (`enes_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Структура таблицы `fee`
--

DROP TABLE IF EXISTS `fee`;
CREATE TABLE IF NOT EXISTS `fee` (
  `f_ID` int(11) NOT NULL AUTO_INCREMENT,
  `f_Fee_Number` varchar(12) COLLATE latin1_general_ci DEFAULT NULL,
  `f_IFTA_Sticker` set('Yes','No') COLLATE latin1_general_ci DEFAULT NULL,
  `f_Expiration_Date` date NOT NULL,
  `f_Weight_Code` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `f_NYHUT` set('Yes','No') COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`f_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `fee`
--


-- --------------------------------------------------------

--
-- Структура таблицы `homebase`
--

DROP TABLE IF EXISTS `homebase`;
CREATE TABLE IF NOT EXISTS `homebase` (
  `h_id` int(11) NOT NULL AUTO_INCREMENT,
  `h_Company_Account_Number` int(11) NOT NULL,
  `h_Carrier_Number` varchar(15) COLLATE latin1_general_ci DEFAULT NULL,
  `h_Name` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `h_Contact_Table_ID` int(11) NOT NULL,
  `h_Annual_Support` set('Yes','No') COLLATE latin1_general_ci NOT NULL,
  `h_Road_Test_Record_Required` set('Yes','No') COLLATE latin1_general_ci NOT NULL,
  `h_DOT_Regulated` set('Yes','No') COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`h_id`),
  KEY `FK_HomeBase_2_Company__c_id` (`h_Company_Account_Number`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Структура таблицы `incident`
--

DROP TABLE IF EXISTS `incident`;
CREATE TABLE IF NOT EXISTS `incident` (
  `i_ID` int(11) NOT NULL AUTO_INCREMENT,
  `i_Number` varchar(12) COLLATE latin1_general_ci DEFAULT NULL,
  `i_Type_ID` int(11) DEFAULT NULL,
  `i_Violation_ID` varchar(12) COLLATE latin1_general_ci DEFAULT NULL,
  `i_Driver_ID` int(11) NOT NULL,
  `i_Date` date NOT NULL,
  `i_Time` time DEFAULT '00:00:00',
  `i_Status` enum('Open','Closed') COLLATE latin1_general_ci NOT NULL DEFAULT 'Open',
  `i_City` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `i_State_ID` tinyint(2) DEFAULT NULL,
  `i_Postal_Code` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `i_Highway_Street` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `i_Travel_Direction_ID` tinyint(4) DEFAULT NULL,
  `i_At_Intersection` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `i_Collision_Highway_Street` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `i_Collision_Movement` set('Stopped','ProceedingStraight','RunOffRoadway','MakingLeftTurn','MakingRightTurn','MakingUTurn','Backing','Slowing','Stopping','Passing','ChangingLanes','Parking','EnteringTraffic','UnsafeTurning','Parked','Merging','WrongWay') COLLATE latin1_general_ci DEFAULT NULL,
  `i_Collision_Movement_Other` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `i_Mile_Marker` int(11) DEFAULT NULL,
  `i_Speed_Limit` tinyint(3) DEFAULT NULL,
  `i_Actual_Speed` tinyint(3) DEFAULT NULL,
  `i_Construction_Zone` enum('Yes','No') COLLATE latin1_general_ci DEFAULT 'No',
  `i_Alcohol_Test` enum('2 hours','8 hours','No Alcohol Test') COLLATE latin1_general_ci DEFAULT 'No Alcohol Test',
  `i_reason_not_conducted_alcohol_test` text COLLATE latin1_general_ci,
  `i_Drug_Test` enum('32 hours','No Drug Test') COLLATE latin1_general_ci DEFAULT 'No Drug Test',
  `i_reason_not_conducted_drug_test` text COLLATE latin1_general_ci,
  `i_Cell_Phone_Usage` enum('Yes','No') COLLATE latin1_general_ci DEFAULT 'No',
  `i_Photo_Taken_By` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `i_Injured` enum('Yes','No') COLLATE latin1_general_ci DEFAULT 'No',
  `i_Injury_Description` text COLLATE latin1_general_ci,
  `i_Injured_Persons_Name` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `i_Deceased` enum('Yes','No') COLLATE latin1_general_ci DEFAULT 'No',
  `i_Incident_Diagram_Taken` enum('Yes','No') COLLATE latin1_general_ci DEFAULT 'No',
  `i_Reported` enum('Yes','No') COLLATE latin1_general_ci DEFAULT 'No',
  `i_Police_Department` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `i_Officer_Name` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `i_Police_Report_Number` varchar(24) COLLATE latin1_general_ci DEFAULT NULL,
  `i_Narrative` text COLLATE latin1_general_ci,
  `i_DOT_Regulated` enum('Yes','No') COLLATE latin1_general_ci DEFAULT 'No',
  `i_Incident_Cause_ID` int(11) DEFAULT NULL,
  `i_Preventable` enum('Yes','No') COLLATE latin1_general_ci DEFAULT 'No',
  `i_Equipment_ID` int(11) NOT NULL,
  `i_last_modified_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `i_fatality` enum('Yes','No') COLLATE latin1_general_ci NOT NULL DEFAULT 'No',
  `i_injuries` enum('Yes','No') COLLATE latin1_general_ci NOT NULL DEFAULT 'No',
  `i_towed` enum('Yes','No') COLLATE latin1_general_ci NOT NULL DEFAULT 'No',
  `i_citation` enum('Yes','No') COLLATE latin1_general_ci NOT NULL DEFAULT 'No',
  PRIMARY KEY (`i_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `incidents_passengers`
--

DROP TABLE IF EXISTS `incidents_passengers`;
CREATE TABLE IF NOT EXISTS `incidents_passengers` (
  `ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_incident_id` int(11) NOT NULL,
  `ip_person_id` int(11) NOT NULL,
  PRIMARY KEY (`ip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `incidents_witnesses`
--

DROP TABLE IF EXISTS `incidents_witnesses`;
CREATE TABLE IF NOT EXISTS `incidents_witnesses` (
  `iw_id` int(11) NOT NULL AUTO_INCREMENT,
  `iw_incident_id` int(11) NOT NULL,
  `iw_person_id` int(11) NOT NULL,
  PRIMARY KEY (`iw_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `incident_cause`
--

DROP TABLE IF EXISTS `incident_cause`;
CREATE TABLE IF NOT EXISTS `incident_cause` (
  `ic_id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_type` varchar(50) NOT NULL,
  PRIMARY KEY (`ic_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Структура таблицы `incident_investigator`
--

DROP TABLE IF EXISTS `incident_investigator`;
CREATE TABLE IF NOT EXISTS `incident_investigator` (
  `ii_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ii_Investigator_Number` varchar(12) COLLATE latin1_general_ci DEFAULT NULL,
  `ii_Driver_ID` int(11) DEFAULT NULL,
  `ii_Company_ID` int(11) DEFAULT NULL,
  `ii_Organization_Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ii_Contact_Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ii_Telephone_Number` varchar(14) COLLATE latin1_general_ci NOT NULL,
  `ii_Fax` varchar(14) COLLATE latin1_general_ci DEFAULT NULL,
  `ii_Address1` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ii_Address2` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ii_City` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `ii_State` tinyint(2) NOT NULL,
  `ii_Postal_Code` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `ii_Country_Code` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ii_ID`),
  KEY `fk_incident_investigator_company1` (`ii_Company_ID`),
  KEY `fk_incident_investigator_driver1` (`ii_Driver_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `inspection`
--

DROP TABLE IF EXISTS `inspection`;
CREATE TABLE IF NOT EXISTS `inspection` (
  `ins_id` int(11) NOT NULL AUTO_INCREMENT,
  `ins_equipment_id` int(11) NOT NULL,
  `ins_start_date` date NOT NULL,
  `ins_start_time` time NOT NULL,
  `ins_entry_date` date NOT NULL,
  `ins_inspector_id` int(11) NOT NULL,
  `ins_type_id` tinyint(4) NOT NULL,
  `ins_result_id` tinyint(4) NOT NULL,
  `ins_next_date` date NOT NULL,
  `ins_reinspection_date` date NOT NULL,
  `ins_diesel_inspection_information` text COLLATE latin1_general_ci,
  `ins_dot_regulated` enum('Yes','No') COLLATE latin1_general_ci NOT NULL,
  `ins_last_modified_datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ins_id`),
  KEY `ins_equipment_id` (`ins_equipment_id`),
  KEY `ins_type_id` (`ins_type_id`),
  KEY `ins_result_id` (`ins_result_id`),
  KEY `ins_inspector_id` (`ins_inspector_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `inspection_result`
--

DROP TABLE IF EXISTS `inspection_result`;
CREATE TABLE IF NOT EXISTS `inspection_result` (
  `ir_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `ir_result` varchar(255) NOT NULL,
  PRIMARY KEY (`ir_id`),
  UNIQUE KEY `ir_result` (`ir_result`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Структура таблицы `inspection_types`
--

DROP TABLE IF EXISTS `inspection_types`;
CREATE TABLE IF NOT EXISTS `inspection_types` (
  `it_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `it_type` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `it_parameters` text COLLATE latin1_general_ci,
  PRIMARY KEY (`it_id`),
  UNIQUE KEY `it_type` (`it_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Структура таблицы `inspector`
--

DROP TABLE IF EXISTS `inspector`;
CREATE TABLE IF NOT EXISTS `inspector` (
  `in_id` int(11) NOT NULL AUTO_INCREMENT,
  `in_first_name` varchar(50) NOT NULL,
  `in_last_name` varchar(50) NOT NULL,
  `in_certificate` varchar(255) DEFAULT NULL,
  `in_service_provider_id` int(11) NOT NULL,
  PRIMARY KEY (`in_id`),
  KEY `in_service_provider_id` (`in_service_provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `insurance`
--

DROP TABLE IF EXISTS `insurance`;
CREATE TABLE IF NOT EXISTS `insurance` (
  `i_Insurance_Carrier_ID` varchar(12) COLLATE latin1_general_ci DEFAULT NULL,
  `i_Insurance_Carrier_Name` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `i_Insurance_Policy_Number` varchar(24) COLLATE latin1_general_ci DEFAULT NULL,
  `i_Insurance_Liability_Limit` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `i_Insurance_Deductible` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `i_Insurance_Expiration_Date` date NOT NULL,
  `i_Insurance_General_Liability` varchar(14) COLLATE latin1_general_ci DEFAULT NULL,
  `i_Insurance_Auto` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `i_Insurance_Cargo` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `i_Insurance_Workers_Compensation` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `i_DOT_Regulated` set('Yes','No') COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `i_ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`i_ID`),
  UNIQUE KEY `i_Insurance_Carrier_Name` (`i_Insurance_Carrier_Name`),
  UNIQUE KEY `Insurance_ID` (`i_Insurance_Carrier_ID`,`i_Insurance_Carrier_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------
--
-- `License`
--

DROP TABLE IF EXISTS `license`;
CREATE TABLE IF NOT EXISTS `license` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `l_Driver_License_Number` varchar(24) NOT NULL,
  `l_Driver_Issue_State_id` int(11) NOT NULL,
  `l_Driver_ID` int(11) NOT NULL,
  `l_Class` enum('A','B','C','D','E','M') NOT NULL,
  `l_Expiration_Date` date NOT NULL,
  `l_License_Endorsements` set('P','T','H','N','X') NOT NULL,
  `l_License_Restrictions` varchar(100) NOT NULL,
  `l_Points_Score` varchar(10) NOT NULL,
  `l_DOT_Regulated` set('YES','NO') NOT NULL,
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `medical_history`
--

DROP TABLE IF EXISTS `medical_history`;
CREATE TABLE IF NOT EXISTS `medical_history` (
  `mh_Driver_ID` varchar(12) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `mh_Examiner_Name` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `mh_Exam_Date` date NOT NULL,
  `mh_Passed` set('Yes','No') COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `mh_Expiration_Date` date NOT NULL,
  `mh_DOT_Regulated` set('Yes','No') COLLATE latin1_general_ci NOT NULL DEFAULT '',
  UNIQUE KEY `mh_ID` (`mh_Driver_ID`,`mh_Examiner_Name`,`mh_Exam_Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Дамп данных таблицы `medical_history`
--


-- --------------------------------------------------------

--
-- Структура таблицы `parent_company`
--

DROP TABLE IF EXISTS `parent_company`;
CREATE TABLE IF NOT EXISTS `parent_company` (
  `pc_id` int(11) NOT NULL AUTO_INCREMENT,
  `pc_Account_Number` varchar(12) COLLATE latin1_general_ci NOT NULL,
  `pc_EIN` varchar(12) COLLATE latin1_general_ci NOT NULL,
  `pc_Name` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `pc_Telephone_Number` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `pc_Contact_Table_ID` int(11) NOT NULL,
  `pc_DOT_Regulated` set('Yes','No') COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`pc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Структура таблицы `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `per_id` int(11) NOT NULL AUTO_INCREMENT,
  `per_first_name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `per_last_name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `per_telephone_number` varchar(14) COLLATE latin1_general_ci NOT NULL,
  `per_address1` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `per_address2` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `per_city` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `per_state_id` tinyint(2) NOT NULL,
  `per_postal_code` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `per_last_modified_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`per_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;



-- --------------------------------------------------------



-- --------------------------------------------------------

--
-- Структура таблицы `report__annual_review_of_motor_vehicle`
--

DROP TABLE IF EXISTS `report__annual_review_of_motor_vehicle`;
CREATE TABLE `report__annual_review_of_motor_vehicle` (
`raromv_id` INT NOT NULL AUTO_INCREMENT,
`raromv_driver_id` INT NOT NULL ,
`raromv_review_date` DATE NOT NULL ,
`raromv_name_of_person_reviewing_user_id` INT NOT NULL ,
`raromv_confirm_review` INT NOT NULL ,
`raromv_driver_info` INT NOT NULL ,
`raromv_remarks` TEXT NULL,
  PRIMARY KEY (`raromv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `r_ID` int(11) NOT NULL AUTO_INCREMENT,
  `r_Level_ID` int(11) NOT NULL DEFAULT '11',
  `r_Company_ID` int(11) DEFAULT NULL,
  `r_Homebase_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`r_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `score`
--

DROP TABLE IF EXISTS `score`;
CREATE TABLE IF NOT EXISTS `score` (
  `s_ID` int(11) NOT NULL AUTO_INCREMENT,
  `s_Driver_License_Number` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `s_DOT_Regulated` set('Yes','No') COLLATE latin1_general_ci NOT NULL,
  `s_Driver_License_Point` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`s_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `service_provider`
--

DROP TABLE IF EXISTS `service_provider`;
CREATE TABLE IF NOT EXISTS `service_provider` (
  `sp_id` int(11) NOT NULL AUTO_INCREMENT,
  `sp_name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `sp_contact` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `sp_type_id` int(11) NOT NULL,
  `sp_telephone_number` varchar(14) COLLATE latin1_general_ci NOT NULL,
  `sp_fax` varchar(14) COLLATE latin1_general_ci DEFAULT NULL,
  `sp_address1` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `sp_address2` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `sp_city` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `sp_state_id` tinyint(2) NOT NULL,
  `sp_postal_code` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `sp_description` text COLLATE latin1_general_ci,
  `sp_dot_regulated` enum('Yes','No') COLLATE latin1_general_ci NOT NULL DEFAULT 'No',
  `sp_status` enum('Open','Closed') COLLATE latin1_general_ci NOT NULL DEFAULT 'Open',
  `sp_entry_date` date NOT NULL,
  `sp_last_modified_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sp_id`),
  UNIQUE KEY `sp_name` (`sp_name`),
  KEY `sp_type_id` (`sp_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Структура таблицы `service_providers_companies`
--

DROP TABLE IF EXISTS `service_providers_companies`;
CREATE TABLE IF NOT EXISTS `service_providers_companies` (
  `spc_id` int(11) NOT NULL AUTO_INCREMENT,
  `spc_service_provider_id` int(11) NOT NULL,
  `spc_company_id` int(11) NOT NULL,
  PRIMARY KEY (`spc_id`),
  UNIQUE KEY `spc_service_provider_company_unique_index` (`spc_service_provider_id`,`spc_company_id`),
  KEY `spc_service_provider_id` (`spc_service_provider_id`),
  KEY `spc_company_id` (`spc_company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `service_providers_equipments`
--

DROP TABLE IF EXISTS `service_providers_equipments`;
CREATE TABLE IF NOT EXISTS `service_providers_equipments` (
  `spe_id` int(11) NOT NULL AUTO_INCREMENT,
  `spe_service_provider_id` int(11) NOT NULL,
  `spe_equipment_id` int(11) NOT NULL,
  PRIMARY KEY (`spe_id`),
  UNIQUE KEY `spe_service_provider_equipment_unique_index` (`spe_service_provider_id`,`spe_equipment_id`),
  KEY `spe_service_provider_id` (`spe_service_provider_id`),
  KEY `spe_equipment_id` (`spe_equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `service_providers_insurances`
--

DROP TABLE IF EXISTS `service_providers_insurances`;
CREATE TABLE IF NOT EXISTS `service_providers_insurances` (
  `spi_id` int(11) NOT NULL AUTO_INCREMENT,
  `spi_service_provider_id` int(11) NOT NULL,
  `spi_insurance_company_id` int(11) NOT NULL,
  PRIMARY KEY (`spi_id`),
  UNIQUE KEY `spi_service_provider_insuarance_unique_index` (`spi_service_provider_id`,`spi_insurance_company_id`),
  KEY `spi_service_provider_id` (`spi_service_provider_id`),
  KEY `spi_insurance_company_id` (`spi_insurance_company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Структура таблицы `service_provider_types`
--

CREATE TABLE IF NOT EXISTS `service_provider_types` (
  `spt_id` int(11) NOT NULL AUTO_INCREMENT,
  `spt_type` varchar(50) NOT NULL,
  PRIMARY KEY (`spt_id`),
  UNIQUE KEY `spt_type` (`spt_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Структура таблицы `state`
--

DROP TABLE IF EXISTS `state`;
CREATE TABLE IF NOT EXISTS `state` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(2) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=52 ;

-- --------------------------------------------------------
--
-- Структура таблицы `travel_direction`
--

DROP TABLE IF EXISTS `travel_direction`;
CREATE TABLE IF NOT EXISTS `travel_direction` (
  `td_id` int(11) NOT NULL AUTO_INCREMENT,
  `td_type` varchar(10) NOT NULL,
  PRIMARY KEY (`td_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=9 ;

--
-- Структура таблицы `violation`
--

DROP TABLE IF EXISTS `violation`;
CREATE TABLE IF NOT EXISTS `violation` (
  `v_id` int(11) NOT NULL AUTO_INCREMENT,
  `v_code` varchar(2) COLLATE latin1_general_ci NOT NULL,
  `v_type` enum('Driver','Equipment') COLLATE latin1_general_ci NOT NULL DEFAULT 'Driver',
  `v_item` varchar(150) COLLATE latin1_general_ci NOT NULL,
  `v_item_specific` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`v_id`),
  UNIQUE KEY `v_item` (`v_item`),
  UNIQUE KEY `v_code` (`v_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=130 ;

--
-- Структура таблицы `violation_assignment`
--

DROP TABLE IF EXISTS `violation_assignment`;
CREATE TABLE IF NOT EXISTS `violation_assignment` (
  `va_id` int(11) NOT NULL AUTO_INCREMENT,
  `va_inspection_id` int(11) NOT NULL,
  `va_violation_id` int(12) NOT NULL,
  `va_equipment_id` int(11) NOT NULL,
  `va_driver_id` int(11) NOT NULL,
  `va_company_id` int(11) NOT NULL,
  `va_DOT_Regulated` enum('Yes','No') COLLATE latin1_general_ci NOT NULL DEFAULT 'No',
  PRIMARY KEY (`va_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------


--
-- Структура таблицы `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `u_ID` int(11) NOT NULL AUTO_INCREMENT,
  `u_User_ID` varchar(24) COLLATE latin1_general_ci DEFAULT NULL,
  `u_Parent_Company_ID` int(11) DEFAULT NULL,
  `u_Company_ID` int(11) DEFAULT NULL,
  `u_Homebase_ID` int(11) DEFAULT NULL,
  `u_Depot_ID` int(11) DEFAULT NULL,
  `u_Role_ID` int(11) NOT NULL DEFAULT '11',
  `u_User_Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `u_Password` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `u_Status` tinyint(4) DEFAULT NULL,
  `u_Title` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `u_Date_Created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `u_Allowed_Access_To_DQF` set('Yes','No') COLLATE latin1_general_ci NOT NULL,
  `u_Allowed_Access_To_VIM` set('Yes','No') COLLATE latin1_general_ci NOT NULL,
  `u_Allowed_Access_To_Accident` set('Yes','No') COLLATE latin1_general_ci NOT NULL,
  `u_First_Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `u_Last_Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `u_Email` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `u_Telephone_Number` varchar(14) COLLATE latin1_general_ci NOT NULL,
  `u_Fax` varchar(14) COLLATE latin1_general_ci DEFAULT NULL,
  `u_Address1` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `u_Address2` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `u_City` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `u_State` tinyint(2) NOT NULL,
  `u_Postal_Code` varchar(10) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`u_ID`),
  UNIQUE KEY `u_User_Name` (`u_User_Name`),
  UNIQUE KEY `u_User_ID` (`u_User_ID`),
  KEY `fk_user_user_role1` (`u_Role_ID`),
  KEY `fk_user_company1` (`u_Company_ID`),
  KEY `fk_user_parent_company1` (`u_Parent_Company_ID`),
  KEY `fk_user_homebase1` (`u_Homebase_ID`),
  KEY `fk_user_depot1` (`u_Depot_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Структура таблицы `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `ur_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ur_role` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `ur_title` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ur_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Структура таблицы `user__status`
--

DROP TABLE IF EXISTS `user__status`;
CREATE TABLE IF NOT EXISTS `user__status` (
  `us_id` int(11) NOT NULL AUTO_INCREMENT,
  `us_type` varchar(50) NOT NULL,
  PRIMARY KEY (`us_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Структура для представления `vauthuser`
--
DROP VIEW IF EXISTS `vauthuser`;
CREATE VIEW `vauthuser` AS
select
`user`.`u_ID` AS `vau_ID`,`user`.`u_User_Name` AS `vau_username`,`user`.`u_Password` AS `vau_password`,
`user`.`u_Role_ID` AS `vau_role_id`,`user_role`.`ur_title` AS `vau_role_title`,`user_role`.`ur_role` AS `vau_role`,
`user`.`u_Homebase_ID` AS `vau_homebase_id`, `user`.`u_First_Name` AS `vau_First_Name`,
`user`.`u_Last_Name` AS `vau_Last_Name`, `homebase`.`h_Name` AS `vau_homebase_code`,
`user`.`u_Company_ID` AS `vau_company_id`,`company`.`c_Name` AS `vau_company_code`,`depot`.`dp_Name` AS `vau_depot_name`,
`parent_company`.`pc_Name` AS `vau_parent_company_code`
from
(((((`user` join `company` on((`user`.`u_Company_ID` = `company`.`c_id`)))
left join `parent_company` on((`company`.`c_Parent_Company_Account_Number` = `parent_company`.`pc_id`)))
join `user_role` on((`user`.`u_Role_ID` = `user_role`.`ur_ID`)))
join `homebase` on((`user`.`u_Homebase_ID` = `homebase`.`h_id`)))
left join `depot` on((`user`.`u_Depot_ID` = `depot`.`dp_id`)));




--
-- Структура таблицы `witness`
--

DROP TABLE IF EXISTS `witness`;
CREATE TABLE IF NOT EXISTS `witness` (
  `w_ID` int(11) NOT NULL AUTO_INCREMENT,
  `w_Witness_First_Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `w_Witness_Last_Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `w_Telephone_Number` varchar(14) COLLATE latin1_general_ci NOT NULL,
  `w_Address1` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `w_Address2` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `w_City` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `w_State` tinyint(2) NOT NULL,
  `w_Postal_Code` varchar(10) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`w_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------
COMMIT;