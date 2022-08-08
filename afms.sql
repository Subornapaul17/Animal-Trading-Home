-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2020 at 12:38 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `afms`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_animal`
--

CREATE TABLE `add_animal` (
  `animal_no` int(11) NOT NULL,
  `animal_name` varchar(64) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `deleted_by` int(11) NOT NULL,
  `deleted_on` datetime NOT NULL,
  `is_updated` int(11) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `add_animal`
--

INSERT INTO `add_animal` (`animal_no`, `animal_name`, `created_by`, `created_on`, `is_deleted`, `deleted_by`, `deleted_on`, `is_updated`, `updated_by`, `updated_on`) VALUES
(1, 'Cow', 1, 0, 0, 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00'),
(2, 'Goat', 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(3, 'Sheep', 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(4, 'Cammel', 1, 0, 1, 1, '2020-12-14 07:11:16', 0, 0, '0000-00-00 00:00:00'),
(5, 'Horse', 1, 0, 1, 1, '2020-12-14 07:11:25', 0, 0, '0000-00-00 00:00:00'),
(6, 'Cat', 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(7, 'Dog', 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `add_services`
--

CREATE TABLE `add_services` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(200) NOT NULL,
  `details` varchar(200) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `deleted_by` int(11) NOT NULL,
  `deleted_on` datetime NOT NULL,
  `is_updated` int(11) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `add_services`
--

INSERT INTO `add_services` (`service_id`, `service_name`, `details`, `is_deleted`, `deleted_by`, `deleted_on`, `is_updated`, `updated_by`, `updated_on`, `created_by`, `created_on`) VALUES
(1, 'Here you add new services', 'Input here details for add new services', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, '2020-12-11 00:00:00'),
(2, 'Anything', 'Input here details for add new services', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, '2020-12-11 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `id` int(11) NOT NULL,
  `admin` varchar(100) NOT NULL,
  `fname` varchar(250) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `password` varchar(250) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` longtext NOT NULL,
  `photo` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT '1',
  `dt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `role` varchar(255) NOT NULL DEFAULT 'user'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`id`, `admin`, `fname`, `lname`, `password`, `phone`, `email`, `address`, `photo`, `status`, `dt`, `role`) VALUES
(1, '1', 'Suborna', '', '123', '01777777777', 'suborna8964@gmail.com', '16d/3, Tollabag, Sobhanbag, Dhaka-1209', '84194= - Copy.jpg', '1', '2020-12-10 14:24:09', 'admin'),
(2, '1', 'Jannat', '', '123', '0188888888888', 'jannat8707@gmail.com', 'Rajshahi', '', '1', '2020-12-10 15:39:17', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `animal_disease`
--

CREATE TABLE `animal_disease` (
  `animal_disease_no` int(11) NOT NULL,
  `animal_no` int(11) NOT NULL,
  `disease_name` longtext NOT NULL,
  `disease_pic` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `causes` longtext NOT NULL,
  `affected_animal` longtext NOT NULL,
  `symptom` longtext NOT NULL,
  `impacts` longtext NOT NULL,
  `comments_count` int(112) NOT NULL,
  `prevention` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `deleted_by` int(11) NOT NULL,
  `deleted_on` int(11) NOT NULL,
  `is_updated` int(11) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `animal_disease`
--

INSERT INTO `animal_disease` (`animal_disease_no`, `animal_no`, `disease_name`, `disease_pic`, `description`, `causes`, `affected_animal`, `symptom`, `impacts`, `comments_count`, `prevention`, `created_by`, `created_on`, `is_deleted`, `deleted_by`, `deleted_on`, `is_updated`, `updated_by`, `updated_on`) VALUES
(1, 0, 'Avian influenza', '', '<p><span style=\"color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">Avian influenza (AI) is a highly contagious viral infection of birds, including poultry. There are many strains of the virus, some of which cause no clinical signs while others can be devastating to susceptible birds. Turkeys and chickens are particularly susceptible to the AI virus.</span></p>', '<p>Orthomyxovirus</p>', '<ul style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">birds</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">poultry</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">turkeys</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">chickens</li>\r\n</ul>', '<ul style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\" type=\"disc\">\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">depression</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">excessive lacrimation (secretion of tears)</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">coughing, sneezing and rales (rattling sound in the lungs)</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">swelling of the head, eyelids, comb, wattles and hocks</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">purple discoloration of the wattles, combs and legs</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">decrease in egg production</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">production of soft-shelled eggs</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">profuse watery diarrhoea</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">difficulty breathing</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">high mortality.</li>\r\n</ul>', '<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">An outbreak of highly pathogenic (HPAI any subtype) or low pathogenic (LPAI H5/H7) avian influenza in Australian poultry could have serious social and economic impacts. Trade and markets will likely be disrupted and infected properties will have requirements (including movement control) imposed to control the disease under legislation.</p>', 10, '<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">Prevention of AI is through routine use of on-farm biosecurity measures<a style=\"box-sizing: inherit; background-color: transparent; color: #007db3; text-decoration-line: none;\" href=\"https://www.business.qld.gov.au/industries/farms-fishing-forestry/agriculture/livestock/poultry/biosecurity-for-poultry-producers\">&nbsp;</a>that can help to prevent the introduction of the disease into the flock. It is the responsibility of all bird owners (commercial and non-commercial) to implement biosecurity measures to protect their animals from pests and disease.</p>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">In free range situations, the risk is increased as birds are outside and have a higher chance of coming into contact with wild birds or their droppings, compared to flocks that are kept indoors.</p>', 1, '2020-07-23 00:00:00', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(2, 0, 'Aflatoxicosis', '', '<p><span style=\"color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">Aflatoxicosis is&nbsp;a fungal toxicosis that may affect all species of animals. The fungus grows on carbohydrate-rich feeds such as peanuts, cottonseed, corn, sorghum and cereal grains when they are stored in hot conditions without adequate drying and aeration. Peanuts and corn can be contaminated before harvest, when drought leads to premature drying of the developing seeds</span></p>', '<p><em style=\"box-sizing: inherit; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">&nbsp;Aspergillus flavus</em><span style=\"color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">&nbsp;and&nbsp;</span><em style=\"box-sizing: inherit; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">A. parasiticus</em><span style=\"color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">.</span></p>', '<ul style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">cattle</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">pigs</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">ducklings</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">turkeys</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">horses</li>\r\n</ul>', '<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\"><strong style=\"box-sizing: inherit;\">In cattle</strong></p>\r\n<ul style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">Blindness</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">Walking in circles</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">Ear twitching</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">Teeth grinding</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">Frothing at the mouth</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">Diarrhoea</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">Straining</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">Abortion</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">Anal prolapse</li>\r\n</ul>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">Terminally affected animals usually die within 48 hours after lying down which is followed by convulsions.</p>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">Lower levels of the toxin in the feed may cause loss of appetite, resulting in a reduction in weight gain or milk production.</p>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\"><strong style=\"box-sizing: inherit;\">In pigs</strong></p>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">Young pigs are at greater risk than adults and a variety of clinical signs are seen. Depression, jaundice, lethargy and death occur in acute cases. Uneven growth across a litter is common in more chronic cases.</p>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\"><strong style=\"box-sizing: inherit;\">In birds</strong></p>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">Ducklings and turkey poults are sensitive to aflatoxin. Reduced growth rates are the most common sign, but increased mortality and disease can occur due to immunosuppression (weakened immune system). Chickens show similar signs, but are more resistant than ducks and turkeys. Laying hens are even more resistant, but immunosuppression is possible.</p>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\"><strong style=\"box-sizing: inherit;\">In horses</strong></p>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">Horses can show signs from sudden death to more chronic signs such as lack of appetite and energy, weight loss, anaemia and jaundice.</p>', '<p><span style=\"color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">Aflatoxins produced by the fungus mainly cause damage to the liver.</span></p>', 0, '<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">Do not feed noticeably contaminated feed to animals. Correct harvesting, handling, drying and storage of grains and seeds are the main means of control.</p>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">There is no effective treatment. Mildly affected animals will recover.</p>', 1, '2020-07-23 00:00:00', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(3, 0, 'Bluetongue', '', '<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">Bluetongue is an insect-borne, viral disease that can affect sheep, goats, deer and cattle. Sheep are the most seriously affected species. Clinical disease and mortalities occur, and production and trade losses may result. Most infections in cattle are unapparent.</p>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">The severe clinical disease seen in other countries has not occurred here. Disease has been produced in experimentally-infected sheep, with some serotypes present in areas of Australia with few sheep.</p>', '<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">An orbivirus virus belonging to the family Reoviridae.</p>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">There are 26 types of bluetongue virus (BTV) and 10 of these have been isolated in Australia. Orbiviruses are insect-borne viruses (arboviruses) transmitted by&nbsp;<em style=\"box-sizing: inherit;\">Culicoides</em>&nbsp;midges. Many other non-bluetongue orbiviruses are also endemic in Australia</p>', '<ul style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">sheep</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">goats</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">deer</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">cattle</li>\r\n</ul>', '<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">In countries where bluetongue is found, the disease is characterised by:</p>\r\n<ul style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">fever</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">widespread haemorrhages of the oral and nasal tissue</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">excessive salivation, and</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">nasal discharge.</li>\r\n</ul>', '<p><span style=\"color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">Convalescence of surviving sheep is slow. The high fever in sheep results in wool breaks, which adds to production losses.</span></p>', 2, '<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">In countries where bluetongue outbreaks occur, the strategy is to contain the outbreak and minimise trade impact by:</p>\r\n<ul style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">using movement controls to prevent spread</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">using treatments and husbandry procedures to control vectors, reduce transmission and protect susceptible animals</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">tracing and surveillance to determine the extent of virus and vector distribution</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">zoning to define infected and disease-free areas.</li>\r\n</ul>', 1, '2020-07-23 00:00:00', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(4, 1, 'Cattle tick', '1608885333unnamed.jpg', '<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">The cattle tick is an external parasite, mainly of cattle, and is regarded as a significant economic pest of the Queensland cattle industry. Cattle ticks are notifiable when they occur outside the Queensland cattle tick infested zone and must be reported to Biosecurity Queensland.</p>', '<p><em style=\"box-sizing: border-box; margin: 0px; padding: 0px; color: #363636; font-family: proxima_nova_condensedregular, Arial, Helvetica, sans-serif; font-size: 16px;\">Rhipicephalus microplus</em><span style=\"color: #363636; font-family: proxima_nova_condensedregular, Arial, Helvetica, sans-serif; font-size: 16px;\">, formerly known as&nbsp;</span><em style=\"box-sizing: border-box; margin: 0px; padding: 0px; color: #363636; font-family: proxima_nova_condensedregular, Arial, Helvetica, sans-serif; font-size: 16px;\">Boophilus microplus</em></p>', '<ul style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">cattle</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">horses</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">goats</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">sheep</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">deer</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">camels</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">alpaca</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">vicuna</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">guanacos</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">buffaloes</li>\r\n</ul>', '<p><span style=\"color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">Ticks can be found anywhere on the body when cattle are heavily infested. Check the escutcheon, tail butt, belly, shoulder, dewlap and ears when there are minimal ticks present.</span></p>', '<div class=\"species-content\" style=\"box-sizing: inherit; margin-bottom: 1em; padding-top: 1em; border-top: 1px dotted #cccccc; clear: both; overflow: hidden; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">\r\n<div class=\"species-inner-content\" style=\"box-sizing: inherit; float: left; width: 611px;\">\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1rem;\">&nbsp;</p>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1rem;\">Heavy cattle-tick infestation causes tick-worry and blood loss which leads to loss of condition and sometimes death. They can also carry and transmit tick fever organisms, which cause illness and death in cattle.</p>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1rem;\">If left unchecked, this parasite can significantly reduce cattle live-weight gain and milk production. It can also transmit 3 blood-borne tick fever organisms, which cause sickness and death in cattle</p>\r\n</div>\r\n</div>', 4, '<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">Cattle ticks can be controlled to varying degrees using tick-resistant cattle, treatments with chemicals, pasture spelling or combinations of these methods.</p>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1rem; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">Queensland is divided into 2 tick zones:</p>\r\n<ul style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: #242424; font-family: Lato, sans-serif; font-size: 16px;\">\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">the Queensland infested zone</li>\r\n<li style=\"box-sizing: inherit; margin: 0.5em 0px;\">the Queensland free zone.</li>\r\n</ul>', 1, '2020-07-23 00:00:00', 0, 0, 0, 1, 1, '2020-12-25 00:00:00'),
(5, 3, 'A', '', '<p>q</p>', '<p>fg</p>', '<p>g</p>', '<p>hgchg</p>', '<p>gfh</p>', 0, '<p>ffcvgb</p>', 1, '2020-11-23 00:00:00', 1, 1, 2020, 0, 0, '0000-00-00 00:00:00'),
(6, 1, 'gkfggm', '', '<p>hvhkvh</p>', '', '', '', '', 0, '', 1, '2020-12-14 00:00:00', 1, 1, 2020, 0, 0, '0000-00-00 00:00:00'),
(7, 1, 'Anthrax', '', '<p>fijvifvifhvihfivhifhvifh</p>', '', '', '', '', 0, '', 1, '2020-12-14 00:00:00', 1, 1, 2020, 0, 0, '0000-00-00 00:00:00'),
(8, 1, 'Anthrax', '', '', '', '', '', '', 0, '', 1, '2020-12-14 00:00:00', 1, 1, 2020, 0, 0, '0000-00-00 00:00:00'),
(9, 1, 'Anthrax', '', '<p>aas<span class=\"ILfuVd\" style=\"font-size: 16px; line-height: 1.375; color: #202124; font-family: arial, sans-serif;\"><span class=\"hgKElc\" style=\"padding: 0px 8px 0px 0px;\"><strong>Anthrax</strong>&nbsp;is an infectious soil-borne&nbsp;<strong>disease</strong>&nbsp;caused by Bacillus anthracis, a relatively large spore-forming bacteria that can infect mammals.&nbsp;<strong>Anthrax</strong>&nbsp;is primarily a&nbsp;<strong>disease</strong>&nbsp;of herbivores, particularly bison and beef&nbsp;<strong>cattle</strong>.&nbsp;<strong>Anthrax</strong>&nbsp;is not highly contagious (i.e. is not typically passed from animal to animal).</span></span><span class=\"kX21rb\" style=\"padding-right: 0px; display: inline-block; color: #70757a; font-size: 12px; line-height: 1.34; white-space: nowrap; font-family: arial, sans-serif;\">Jun 12, 2020</span></p>', '', '', '', '', 0, '', 1, '2020-12-16 00:00:00', 1, 1, 2020, 0, 0, '0000-00-00 00:00:00'),
(10, 6, 'Anthraxz', '160840144517a8b662e7fab8e541486047e464b357.jpg', '<p><span class=\"ILfuVd\" style=\"font-size: 16px; line-height: 1.375; color: #202124; font-family: arial, sans-serif;\"><span class=\"hgKElc\" style=\"padding: 0px 8px 0px 0px;\"><strong>Anthrax</strong>&nbsp;is an infectious soil-borne&nbsp;<strong>disease</strong>&nbsp;caused by Bacillus anthracis, a relatively large spore-forming bacteria that can infect mammals.&nbsp;<strong>Anthrax</strong>&nbsp;is primarily a&nbsp;<strong>disease</strong>&nbsp;of herbivores, particularly bison and beef&nbsp;<strong>cattle</strong>.&nbsp;<strong>Anthrax</strong>&nbsp;is not highly contagious (i.e. is not typically passed from animal to animal).</span></span><span class=\"kX21rb\" style=\"padding-right: 0px; display: inline-block; color: #70757a; font-size: 12px; line-height: 1.34; white-space: nowrap; font-family: arial, sans-serif;\">Jun 12, 2020</span></p>', '<p><span class=\"ILfuVd\" style=\"font-size: 16px; line-height: 1.375; color: #202124; font-family: arial, sans-serif;\"><span class=\"hgKElc\" style=\"padding: 0px 8px 0px 0px;\"><strong>Anthrax</strong>&nbsp;is an infectious soil-borne&nbsp;<strong>disease</strong>&nbsp;caused by Bacillus anthracis, a relatively large spore-forming bacteria that can infect mammals.&nbsp;<strong>Anthrax</strong>&nbsp;is primarily a&nbsp;<strong>disease</strong>&nbsp;of herbivores, particularly bison and beef&nbsp;<strong>cattle</strong>.&nbsp;<strong>Anthrax</strong>&nbsp;is not highly contagious (i.e. is not typically passed from animal to animal).</span></span><span class=\"kX21rb\" style=\"padding-right: 0px; display: inline-block; color: #70757a; font-size: 12px; line-height: 1.34; white-space: nowrap; font-family: arial, sans-serif;\">Jun 12, 2020</span></p>', '<p><span class=\"ILfuVd\" style=\"font-size: 16px; line-height: 1.375; color: #202124; font-family: arial, sans-serif;\"><span class=\"hgKElc\" style=\"padding: 0px 8px 0px 0px;\"><strong>Anthrax</strong>&nbsp;is an infectious soil-borne&nbsp;<strong>disease</strong>&nbsp;caused by Bacillus anthracis, a relatively large spore-forming bacteria that can infect mammals.&nbsp;<strong>Anthrax</strong>&nbsp;is primarily a&nbsp;<strong>disease</strong>&nbsp;of herbivores, particularly bison and beef&nbsp;<strong>cattle</strong>.&nbsp;<strong>Anthrax</strong>&nbsp;is not highly contagious (i.e. is not typically passed from animal to animal).</span></span><span class=\"kX21rb\" style=\"padding-right: 0px; display: inline-block; color: #70757a; font-size: 12px; line-height: 1.34; white-space: nowrap; font-family: arial, sans-serif;\">Jun 12, 2020</span></p>', '<p><span class=\"ILfuVd\" style=\"font-size: 16px; line-height: 1.375; color: #202124; font-family: arial, sans-serif;\"><span class=\"hgKElc\" style=\"padding: 0px 8px 0px 0px;\"><strong>Anthrax</strong>&nbsp;is an infectious soil-borne&nbsp;<strong>disease</strong>&nbsp;caused by Bacillus anthracis, a relatively large spore-forming bacteria that can infect mammals.&nbsp;<strong>Anthrax</strong>&nbsp;is primarily a&nbsp;<strong>disease</strong>&nbsp;of herbivores, particularly bison and beef&nbsp;<strong>cattle</strong>.&nbsp;<strong>Anthrax</strong>&nbsp;is not highly contagious (i.e. is not typically passed from animal to animal).</span></span><span class=\"kX21rb\" style=\"padding-right: 0px; display: inline-block; color: #70757a; font-size: 12px; line-height: 1.34; white-space: nowrap; font-family: arial, sans-serif;\">Jun 12, 2020</span></p>', '<p><span class=\"ILfuVd\" style=\"font-size: 16px; line-height: 1.375; color: #202124; font-family: arial, sans-serif;\"><span class=\"hgKElc\" style=\"padding: 0px 8px 0px 0px;\"><strong>Anthrax</strong>&nbsp;is an infectious soil-borne&nbsp;<strong>disease</strong>&nbsp;caused by Bacillus anthracis, a relatively large spore-forming bacteria that can infect mammals.&nbsp;<strong>Anthrax</strong>&nbsp;is primarily a&nbsp;<strong>disease</strong>&nbsp;of herbivores, particularly bison and beef&nbsp;<strong>cattle</strong>.&nbsp;<strong>Anthrax</strong>&nbsp;is not highly contagious (i.e. is not typically passed from animal to animal).</span></span><span class=\"kX21rb\" style=\"padding-right: 0px; display: inline-block; color: #70757a; font-size: 12px; line-height: 1.34; white-space: nowrap; font-family: arial, sans-serif;\">Jun 12, 2020</span></p>', 0, '<p><span class=\"ILfuVd\" style=\"font-size: 16px; line-height: 1.375; color: #202124; font-family: arial, sans-serif;\"><span class=\"hgKElc\" style=\"padding: 0px 8px 0px 0px;\"><strong>Anthrax</strong>&nbsp;is an infectious soil-borne&nbsp;<strong>disease</strong>&nbsp;caused by Bacillus anthracis, a relatively large spore-forming bacteria that can infect mammals.&nbsp;<strong>Anthrax</strong>&nbsp;is primarily a&nbsp;<strong>disease</strong>&nbsp;of herbivores, particularly bison and beef&nbsp;<strong>cattle</strong>.&nbsp;<strong>Anthrax</strong>&nbsp;is not highly contagious (i.e. is not typically passed from animal to animal).</span></span><span class=\"kX21rb\" style=\"padding-right: 0px; display: inline-block; color: #70757a; font-size: 12px; line-height: 1.34; white-space: nowrap; font-family: arial, sans-serif;\">Jun 12, 2020</span></p>', 1, '2020-12-16 00:00:00', 1, 1, 2020, 1, 1, '2020-12-19 00:00:00'),
(11, 1, 'Anthrax', '1608823794120861780_1667934266745675_6334629612486053556_o.jpg', '<p><span style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">Domestic and wild&nbsp;</span><strong style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">animals</strong><span style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">&nbsp;such as&nbsp;</span><strong style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">cattle</strong><span style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">, sheep, goats, antelope, and deer can become infected when they breathe in or ingest spores in contaminated soil, plants, or water. In areas where domestic&nbsp;</span><strong style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">animals</strong><span style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">&nbsp;have had&nbsp;</span><strong style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">anthrax</strong><span style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">&nbsp;in the past, routine vaccination can help prevent outbreaks.</span></p>', '', '<p><span style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">Domestic and wild&nbsp;</span><strong style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">animals</strong><span style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">&nbsp;such as&nbsp;</span><strong style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">cattle</strong><span style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">, sheep, goats, antelope, and deer can become infected when they breathe in or ingest spores in contaminated soil, plants, or water. In areas where domestic&nbsp;</span><strong style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">animals</strong><span style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">&nbsp;have had&nbsp;</span><strong style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">anthrax</strong><span style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">&nbsp;in the past, routine vaccination can help prevent outbreaks.</span></p>', '', '', 0, '', 1, '2020-12-19 00:00:00', 1, 1, 2020, 1, 1, '2020-12-24 00:00:00'),
(12, 1, 'A', '1608400168barbari-goat-500x500.jpg', '<p><span style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">Domestic and wild&nbsp;</span><strong style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">animals</strong><span style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">&nbsp;such as&nbsp;</span><strong style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">cattle</strong><span style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">, sheep, goats, antelope, and deer can become infected when they breathe in or ingest spores in contaminated soil, plants, or water. In areas where domestic&nbsp;</span><strong style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">animals</strong><span style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">&nbsp;have had&nbsp;</span><strong style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">anthrax</strong><span style=\"color: #202124; font-family: arial, sans-serif; font-size: 16px;\">&nbsp;in the past, routine vaccination can help prevent outbreaks.</span></p>', '', '', '', '', 0, '', 1, '2020-12-19 00:00:00', 1, 1, 2020, 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `animal_gallery`
--

CREATE TABLE `animal_gallery` (
  `animal_gallery_no` int(11) NOT NULL,
  `image_title` varchar(200) NOT NULL,
  `price` varchar(200) NOT NULL,
  `animal_tag` varchar(200) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `gallery_pic` varchar(10000) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `is_deleted` int(1) NOT NULL DEFAULT 0,
  `deleted_by` int(11) NOT NULL,
  `deleted_on` int(11) NOT NULL,
  `is_updated` int(1) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `animal_gallery`
--

INSERT INTO `animal_gallery` (`animal_gallery_no`, `image_title`, `price`, `animal_tag`, `description`, `gallery_pic`, `created_by`, `created_on`, `is_deleted`, `deleted_by`, `deleted_on`, `is_updated`, `updated_by`, `updated_on`) VALUES
(1, 'anything', '100', 'T123', 'detals', '1607933245', 1, '2020-12-14 02:01:02', 1, 1, 2020, 1, 1, '2020-12-14 02:07:25'),
(2, 'anything', '100', 'T123', 'detals', '1607933348', 1, '2020-12-14 02:08:58', 1, 1, 2020, 1, 1, '2020-12-14 02:09:08'),
(3, 'ssss', '100', 'T123', 'detals', '1607934088aa.jpg', 1, '2020-12-14 02:21:16', 1, 1, 2020, 1, 1, '2020-12-14 02:21:28'),
(4, 'anything', '115', 'T11', 'Write about 20 words', '16079343741595323650uhrbgfhufr.jpg', 1, '2020-12-14 02:26:14', 1, 1, 2020, 0, 0, '0000-00-00 00:00:00'),
(5, 'Ayshire', 'BDT 1,80,000/- to 300000', 'T15', 'Ayrshires are strong and robust cows with distinctive red and white markings that originated in Ayrshire, Scotland.', '1607973117Ayshire-1.jpg', 1, '2020-12-15 12:40:15', 0, 0, 0, 1, 1, '2020-12-15 01:12:48'),
(6, 'Brown Swiss', 'BDT .75,000/- to BDT. 5,00,000', 'T13', 'A native to Switzerland, the Brown Swiss is the oldest of the pure dairy breeds.', '1607972418Brown-Swiss-2-3.jpg', 1, '2020-12-15 01:00:18', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(7, 'Jersey', 'BDT. 20,000 to  BDT. 50,000', 'T14', 'This breed originated on the island of Jersey (off the coast of the British Isles). Their color is a beautiful shade of fawn or cream with black muzzles.', '1607972800Jersey-2-1.jpg', 1, '2020-12-15 01:06:40', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(8, 'Artikel', 'BDT 210,000/- to 300000', 'T1', 'Our animal is chosen carefully & in accordance to right method & rules.', '1607973354artikel_2_web.jpg', 1, '2020-12-15 01:15:54', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(9, 'Guernsery', 'BDT 500000/-600000', 'T2', 'Guernsey’s are a shade of fawn with clearly defined white markings that originated on the Isle of Guernsey. They are known for their golden yellow pigmentation and great size and strength. A mature Guernsey cow typically weighs around 1,100 pounds.', '1607975645Guernsey-Cow.jpg', 1, '2020-12-15 01:54:05', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(10, 'Red and White Holstein', 'BDT 310,000/-400000', 'T3', 'Red and White cattle are unique animals among those recognized through the Purebred Cattle Association because they can have genetics from several different breeds of dairy cows.', '1607976030Red-and-White-Holstein-Uconn-website.png', 1, '2020-12-15 02:00:30', 0, 0, 0, 1, 1, '2020-12-15 02:03:24'),
(11, 'Milking Shorthorn', 'BDT 500000/-650000', 'T4', 'Originating in England, the Milking Shorthorn is an average sized breed with mature cows weighing nearly 1,250 pounds. Their color is either red, red and white or roan. Shorthorns are known for high levels of fertility, grazing efficiency and ease of management that result in the breed being highly suitable for many different environments. They are also popular among farmers for their durability, longevity and ease of calving.', '1607976168Milking-Shorthorn-New-website.png', 1, '2020-12-15 02:02:48', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(12, 'Norwegian Red Cattle', 'BDT 6,50,000/-7,00,000', 'T5', 'Norwegian Red is well known as NRF and also well known for the fortune of its milk. NRF provides 10,000 kilogram milk production per year.', '1607980103008-fertility-datter-prestangen.jpg', 1, '2020-12-15 02:23:25', 0, 0, 0, 1, 1, '2020-12-15 03:08:23'),
(13, 'Kostroma Cattle Type', 'BDT 250000/-300000', 'T6', 'Kostroma is long-lived cattle who have duration of 25 years. This is producing milk 10,000 kilograms every year. This cattle breed is very helpful for milk processing and production process.', '1607977687Kostroma-Cattle.jpg', 1, '2020-12-15 02:28:07', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(14, 'Swedish Red Cattle', 'BDT 870000/-900000', 'T7', 'Swedish Red Cattle is well-known as Swedish Red and White Cattle. This cattle breed is famous for its healthy structure and long life. The cattle breed produce milk 8000 kilograms per year. The height of this cattle breed is 140cm and weight is 600 kg.', '1607979965unnamed.jpg', 1, '2020-12-15 02:38:06', 0, 0, 0, 1, 1, '2020-12-15 03:06:05'),
(15, 'Angeln Cattle Breed', 'BDT 650000/-700000', 'T9', 'This dairy cow is famous for the higher milk fat height of its milk. It provides milk production 7570 kg per year. The milk production of cattle is very useful for dairy farm that utilized by the many milk processing equipment and supply in the market.', '1607978447aa.jpg', 1, '2020-12-15 02:40:47', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(16, 'Pie Rouge des Plaines', 'BDT 550000/-670000', 'T8', 'It is well known as Lowland Red Pied Cattle that meat is improved in value and amount than Holstein cattle. The Milk Production is 6900 kg per year and Height is 138cm and Weight is 700 kilograms.  Thus, these types of cattle breeds are top breeds that produce higher quantity milk every year which are very useful in every dairy farm.', '1607979693pie-rouge-des-plaines-b4074859-8568-4a31-bde3-a358fab50bc-resize-750.jpeg', 1, '2020-12-15 03:01:33', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(17, 'Boer goat', '18,000 TK', 'TagnoG1', 'The Boer goat is a breed of goat that was developed in South Africa in the early 1900s and is a popular breed for meat production. Their name is derived from the Afrikaans word boer, meaning farmer.', '1607981125Boerbok.jpg', 1, '2020-12-15 03:25:25', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(18, 'Anglo-Nubian goat', '25,000TK', 'TagnoG2', 'The Anglo-Nubian is a British breed of domestic goat. It originated in the nineteenth century from cross-breeding between native British goats and a mixed population of large lop-eared goats imported from India, the Middle East and North Africa. It is characterised by large, pendulous ears and a convex profile.', '1607981310Nubische_geiten.jpg', 1, '2020-12-15 03:28:30', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(19, 'Saanen goat', '55,000 TK', 'TagnoG3', 'The Saanen, German: \'Saanenziege\', French: \'Chèvre de Gessenay\', is a Swiss breed of domestic goat. It takes its name from the Saanental in the Bernese Oberland, in the southern part of the Canton of Bern, in western Switzerland.', '16079815292152216.png', 1, '2020-12-15 03:32:09', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(20, 'Beetal', '20,000', 'TagnoG4', 'The Beetal goat is a breed from the Punjab region of India and Pakistan is used for milk and meat production. It is similar to the Jamnapari goat and the Malabari goat. It is also known as Lahori goat; it is considered to be a good milker with large body size. Ears are flat long curled and drooping.', '1607981924download.jpg', 1, '2020-12-15 03:34:56', 0, 0, 0, 1, 1, '2020-12-15 03:38:44'),
(21, 'Barbari goat', '27000', 'TagnoG5', 'The Barbari or Bari is a breed of small domestic goat found in a wide area in India and Pakistan. It is distributed in the states of Haryana, Punjab and Uttar Pradesh in India, and in Punjab and Sindh provinces of Pakistan.', '1607981860barbari-goat-500x500.jpg', 1, '2020-12-15 03:37:40', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(22, 'Changthangi', '15,000', 'TagnoG6', 'The Changthangi or Ladakh Pashmina is a breed of cashmere goat native to the high plateaux of Ladakh, India. The cold temperatures in the region are the primary factor in the growth of the fine pashmina grade of cashmere wool for which they are reared. It is also used as a pack animal and for meat.', '1607982053220px-Changthangi_goat.jpg', 1, '2020-12-15 03:40:53', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(23, 'Jamnapari goat', '30,000', 'TagnoG7', 'Jamnapari is a breed of goat originating from Indian subcontinent. Since 1953 they have been exported to Indonesia where they have been a great success. It is bred for both milk and meat. The name is derived from the Yamuna river. This breed is one of the ancestors of the American Nubian.', '1607982231jamunapari-goat-500x500.jpg', 1, '2020-12-15 03:43:51', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(24, 'Spanish goat', '28,000', 'TagnoG8', 'The Spanish goat, also called the brush goat or scrub goat, came originally from Spain via Mexico to the USA. It is now a meat and brush-clearing type found widely in the United States. In the Southeast and elsewhere, they are often referred to as \"wood\", \"brush\" or \"briar\", \"hill\", and \"scrub\" goats.', '160798261617a8b662e7fab8e541486047e464b357.jpg', 1, '2020-12-15 03:50:16', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(25, 'Persian Cat', '40,000', 'TagNoC80', 'The Persian cat is a long-haired breed of cat characterized by its round face and short muzzle. It is also known as the', '1608049926fitted.jpg', 1, '2020-12-15 10:26:02', 0, 0, 0, 1, 1, '2020-12-15 10:32:06'),
(26, 'Adult tortoiseshell female persian', '30,000', 'TagNoC81', 'Tortoiseshell is a cat coat coloring named for its similarity to tortoiseshell material. Like calicos, tortoiseshell cats are almost exclusively female. Male tortoiseshells are rare and are usually sterile.', '1608052115fitted (2).jpg', 1, '2020-12-15 10:35:27', 0, 0, 0, 1, 1, '2020-12-15 11:08:35'),
(27, 'Bombay Cat', '5,000Tk', 'TagnoC82', 'The Bombay is an easy-going, yet energetic cat. She does well in quiet apartments where she’s the center of attention as well as in lively homes with children and other pets. She’ll talk to you in a distinct voice, and you’re likely to find her in the warmest spot in your home, whether that’s in the sunlight from a window or curled up under the covers in bed with you.', '1608050718Bombay_body_6.jpg', 1, '2020-12-15 10:45:18', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(28, 'American Bobtail Cat Breed', '4,000', 'TagnoC83', 'The American Bobtail is an athletic breed that looks like a bobtailed wildcat and has many dog-like tendencies.', '1608050821AmericanBobtail_body_6.jpg', 1, '2020-12-15 10:47:01', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(29, 'Manx Cat', '5000 Tk', 'TagnoC84', 'When she’s not hunting bugs or rodents or standing guard, the Manx is an affectionate, even-tempered and playful cat. She loves to follow her favorite person from room to room and curling up on their lap for a snooze. Your Manx will even carry on a conversation with you in her quiet trill.', '1608051115ManxSH_body_6.jpg', 1, '2020-12-15 10:51:55', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(30, 'Japanese Bobtail Cat Breed', '6000 Tk', 'TagnoC85', 'Size: Medium, with males weighing 7 to 10 pounds and females weighing 5 to 7 pounds     Coat: Long (longhaired) and short (shorthaired)     Color: White, black, red, blue and cream, plus various patterns and shadings', '1608051219JapaneseBobtailSHOddEyed_body_6.jpg', 1, '2020-12-15 10:53:39', 0, 0, 0, 1, 1, '2020-12-15 10:55:18'),
(31, 'LaPerm Cat', '7000Tk', 'TagNoc86', 'Distinguished by her curly, rippled coat and people-oriented personality, the LaPerm is calm and friendly, yet at other times energetic and inquisitive. This feline thrives on attention and likes to be close to her human companions. Though curious, this breed is content to be a lap cat and close to whatever is going on. The LaPerm blossoms with a loving family.', '1608052238LaPerm_body_6.jpg', 1, '2020-12-15 11:10:38', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(32, 'Munchkin Cat', '9000 Tk', 'TagNoC87', 'They may have short legs, but Munchkin Cats don’t let it hold them back. Although they can’t make big leaps like other breeds, they can make small jumps, climb and even sit back on their haunches to get a better look at something.', '1608052396Munchkin.jpg', 1, '2020-12-15 11:13:16', 0, 0, 0, 1, 1, '2020-12-15 11:14:01'),
(33, 'Pixiebob Cat Breed', '9000TK', 'TagNo88', 'A muscular, brawny cat that resembles the wild Coastal Red Bobcat found in the Pacific Northwest, the Pixiebob has the loving personality of a domestic cat. This active, intelligent feline is often called a dog in disguise because she can be taught to fetch and walk on a leash. The Pixiebob is an easygoing, relaxed cat that is a loving companion for children and enjoys other pets.', '1608052812PixieBob_body_6.jpg', 1, '2020-12-15 11:20:12', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(34, 'Singapura Cat Breed', '5600Tk', 'TagnoC89', 'The smallest domestic cat breed, the Singapura is an extroverted, playful feline sometimes called a “pesky people cat.” This breed thrives on attention and interactive play. Called Pura for short, these cats are intelligent and keenly observant. Friendly and social, they enjoy cats and cat friendly dogs, but dislike loud noises so are not ideal for busy households with boisterous children.', '1608052913Singapura_body_7.jpg', 1, '2020-12-15 11:21:52', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(35, 'Toyger Cat Breed', '8000Tk', 'TagNo90', 'With her beautiful bold stripes and powerful body, the Toyger looks like a jungle tiger. This breed has a friendly, outgoing temperament and delights in being with people, even strangers, and gets along well with other pets. Highly intelligent, the Toyger is easy to train to go on leash walks and to play fetch. The Toyger is generally robust and healthy.', '1608053062Toyger_body_7.jpg', 1, '2020-12-15 11:24:22', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(36, 'Russian Blue Cat Breed', '8,000Tk', 'TagNoC91', 'The Russian Blue is gentle, quiet and even shy around strangers, but she’s affectionate and loyal toward her people. She’ll follow you around and even ride on your shoulder.', '1608053215RussianBlue_body_7.jpg', 1, '2020-12-15 11:26:55', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(37, 'Savannah Cat Breed', '12000', 'TagNo92', 'The Savannah Cat’s personality is playful, adventurous and loyal. Unlike most cats, she loves to play in water and can even be trained to walk on a leash and play fetch. Don’t be fooled by her dog-like personality, though.', '1608053529Savannah_body_7.jpg', 1, '2020-12-15 11:32:09', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(38, 'Norwegian Forest Cat Breed', '7500Tk', 'TagNoC93', 'The Norwegian Forest Cat is a gentle giant. They’re large and athletic, so you may find them sitting atop the highest point in your home, and they have no qualms about jumping down. Norwegian Forest Cats are fond of their family but are reserved with visitors.', '1608054383NorwegianForestCat_body_6.jpg', 1, '2020-12-15 11:46:23', 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
(39, 'Merino sheep', '18000 Tk', 'TagnoS111', 'The Merino is one of the most historically relevant and economically influential breeds of sheep, much prized for its wool.Wool is very long and high quality. Mouth and legs are white colored. Male sheep has horns but female has no horns. Their whole body is covered with hair.', '1608064535download.jpg', 1, '2020-12-16 02:35:35', 0, 0, 0, 1, 1, '2020-12-16 05:15:02'),
(40, 'Rambouillet', '35000TK', 'TagnoS112', '1.This breed came from Marino sheep.2. Head become big sized. 3.Ears are surrounded by white hair. 4.Male sheep weights about 110-125 kg and female 70-90 kg.5. Hair weights very high and dense. 6.Whole body is covered with hair. 7.Even on mouth and legs.', '1608118456images.jpg', 1, '2020-12-16 05:23:38', 0, 0, 0, 1, 1, '2020-12-16 05:34:45'),
(41, 'Cheviot', '20,000Tk', 'TagNo113', '1.Cheviot sheep breed originated from Scotland. 2.They become very beautiful to look. 3.Ears become straight. Mouth and legs are bright white. 4.Hair of mouth and legs become very tiny. 5.Nose, lips and legs become blackish. 6.Male cheviot sheep weights about 80 kg and female 55 kg. 7.Legs, hip and thighs are very fleshy. 8.Produce about 2.5-3.5 kg wool annually.', '1608118771bordercheviot-1.jpg', 1, '2020-12-16 05:26:02', 0, 0, 0, 1, 1, '2020-12-16 05:40:17'),
(42, 'Southdown', '18500TK', 'TagnoS114', '1.Southdown sheep breed is a very old species of Britain.2. This breed was made artificially.3. Small in size. 4.Head is comparatively wide.5. Adult male sheep weights about 80 kg and female 55 kg. 6.Color of their mouth is slightly brown.', '1608119102Ram-Compare1.gif', 1, '2020-12-16 05:28:41', 0, 0, 0, 1, 1, '2020-12-16 05:45:02'),
(43, 'Leicester', '21,000', 'TagnoS115', 'This sheep breeds originated from England. Medium sized. Mouth and legs are clean. Hair become very long.', '1608120290lister.jpg', 1, '2020-12-16 06:00:02', 0, 0, 0, 1, 1, '2020-12-16 06:04:49'),
(44, 'Lincoln', '16000 Tk for 1 sheep', 'TagNoS120', 'Become very big sized. Head become wide. Ears are thick.', '1608121619lin.jpg', 1, '2020-12-16 06:13:17', 0, 0, 0, 1, 1, '2020-12-16 06:27:56');

-- --------------------------------------------------------

--
-- Table structure for table `animal_type`
--

CREATE TABLE `animal_type` (
  `animal_type_no` int(11) NOT NULL,
  `animal_no` int(11) NOT NULL,
  `ear_tag` varchar(200) NOT NULL,
  `dob` date NOT NULL,
  `age` varchar(200) NOT NULL,
  `color` varchar(200) NOT NULL,
  `breed` int(11) NOT NULL,
  `weight` varchar(200) NOT NULL,
  `image_animal` varchar(200) NOT NULL,
  `comments_count` int(200) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `is_deleted` int(1) NOT NULL DEFAULT 0,
  `deleted_by` int(11) NOT NULL,
  `deleted_on` datetime NOT NULL,
  `is_updated` int(1) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `animal_type`
--

INSERT INTO `animal_type` (`animal_type_no`, `animal_no`, `ear_tag`, `dob`, `age`, `color`, `breed`, `weight`, `image_animal`, `comments_count`, `created_by`, `created_on`, `is_deleted`, `deleted_by`, `deleted_on`, `is_updated`, `updated_by`, `updated_on`) VALUES
(1, 3, 'Tag No. 587', '2017-11-21', '1year', 'Red', 2, '140kg', '1595336045iStock-182344013.jpg', 2, 1, '2020-07-21 11:27:30', 0, 0, '0000-00-00 00:00:00', 1, 1, '2020-07-21 14:54:05'),
(2, 2, 'Tag No. C45', '2016-07-03', '2years', 'Black', 4, '55kg', '15953261293733idea99osmanabadi-female-goat.jpg', 42, 1, '2020-07-21 12:08:49', 0, 0, '0000-00-00 00:00:00', 1, 1, '2020-07-21 14:45:33'),
(3, 1, 'Tagno32', '2017-12-22', '3', 'red', 1, '90kg', '16079334981595323650uhrbgfhufr.jpg', 0, 1, '2020-12-14 07:17:42', 0, 0, '0000-00-00 00:00:00', 1, 1, '2020-12-14 09:11:38'),
(4, 2, 'tagno18', '2017-11-11', '4', 'white', 2, '69-130 kg', '1607980624Boerbok.jpg', 0, 1, '2020-12-14 22:17:04', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `buyer_info`
--

CREATE TABLE `buyer_info` (
  `buyer_no` int(11) NOT NULL,
  `buyer_name` varchar(200) NOT NULL,
  `buyer_email` varchar(200) NOT NULL,
  `buyer_phone` varchar(200) NOT NULL,
  `buyer_address` varchar(2000) NOT NULL,
  `animal_gallery_no` int(11) NOT NULL,
  `created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `buyer_info`
--

INSERT INTO `buyer_info` (`buyer_no`, `buyer_name`, `buyer_email`, `buyer_phone`, `buyer_address`, `animal_gallery_no`, `created_on`) VALUES
(2, '23423', 'nawsishahmed@gmail.com', '324234234', '3423', 2, '2020-12-23 05:20:11'),
(3, '23423', 'nawsishahmed@gmail.com', '65785678678768', 'AHANGIRNAGAR UNIVERSITY', 1, '2020-12-23 05:20:33'),
(4, 'Nawsish', 'nawsishahmed@gmail.com', '23435346767856', 'EAST VATDI', 3, '2020-12-24 04:19:02'),
(5, 'Nawsish', 'nawsishahmed@gmail.com', '56758567664', 'EAST VATDI', 1, '2020-12-24 04:19:58'),
(6, 'a', 'nawsishahmed@gmail.com', '5555555555', 'dwqds', 2, '2020-12-24 15:41:17');

-- --------------------------------------------------------

--
-- Table structure for table `buyer_user`
--

CREATE TABLE `buyer_user` (
  `buyer_user_no` int(11) NOT NULL,
  `buyer_name` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `buyer_email` varchar(200) NOT NULL,
  `buyer_phone` varchar(200) NOT NULL,
  `buyer_address` varchar(255) NOT NULL,
  `buyer_image` varchar(250) NOT NULL,
  `password` varchar(200) NOT NULL,
  `buyer_active_from` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `buyer_user`
--

INSERT INTO `buyer_user` (`buyer_user_no`, `buyer_name`, `buyer_email`, `buyer_phone`, `buyer_address`, `buyer_image`, `password`, `buyer_active_from`) VALUES
(1, 'Suborna', 'suborna@gmail.com', '017000000', '16d/3,tollabag', 'efd3a32b1d38dd11cf2587092.jpg', '123123', '0000-00-00'),
(2, 'Jannat', 'jannat@gmail.com', '01800000000', 'Rajshahi', '', '123123', '0000-00-00'),
(3, 'Admin', 'admin@gmail.com', '12345678910', '16d/3,tollabag', '', '123456', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(255) NOT NULL,
  `messages` varchar(400) NOT NULL,
  `animal_type_no` int(255) NOT NULL,
  `buyer_user_no` int(111) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `messages`, `animal_type_no`, `buyer_user_no`, `created_time`) VALUES
(1, 'rgrgr', 1, 1, '2020-08-14 08:10:10'),
(2, '42rt24t4g5yh4', 2, 1, '2020-08-14 08:10:33'),
(3, 'duccccc', 2, 1, '2020-08-14 19:54:12');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_no` int(11) NOT NULL,
  `contact_name` varchar(200) NOT NULL,
  `contact_email` varchar(200) NOT NULL,
  `contact_phone` varchar(200) NOT NULL,
  `contact_address` varchar(200) NOT NULL,
  `message` varchar(2000) NOT NULL,
  `created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_no`, `contact_name`, `contact_email`, `contact_phone`, `contact_address`, `message`, `created_on`) VALUES
(1, 'Nawsish', 'nawsishahmed@gmail.com', '456675756', 'fweduweg', 'gfgfd', '2020-12-25 10:20:29'),
(2, 'Nawsish', 'nawsishahmed@gmail.com', '54654674', 'fweduweg', 'gfrgevg', '2020-12-25 10:22:10'),
(3, 'Nawsish', 'nawsishahmed@gmail.com', '65787687', 'fweduweg', 'jjhjhhgmgm', '2020-12-25 10:22:51'),
(4, 'Nawsish', 'nawsishahmed@gmail.com', '565467545', 'fweduweg', 'ergregvber ergrgverfgr ergrge', '2020-12-25 10:23:57'),
(5, 'Nawsish', 'nawsishahmed@gmail.com', '4234', 'rfgrf', 'fgr', '2020-12-25 10:24:44');

-- --------------------------------------------------------

--
-- Table structure for table `disease_comments`
--

CREATE TABLE `disease_comments` (
  `id` int(255) NOT NULL,
  `d_messages` varchar(400) NOT NULL,
  `animal_disease_no` int(255) NOT NULL,
  `buyer_user_no` int(111) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `disease_comments`
--

INSERT INTO `disease_comments` (`id`, `d_messages`, `animal_disease_no`, `buyer_user_no`, `created_time`) VALUES
(1, 'rgrgr', 1, 1, '2020-08-14 20:21:50'),
(2, 'ggg', 4, 1, '2020-09-01 22:14:43');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doctors_no` int(11) NOT NULL,
  `doctor_name` varchar(200) NOT NULL,
  `doctors_pic` varchar(1000) NOT NULL,
  `doctor_title` varchar(200) NOT NULL,
  `doctor_email` varchar(200) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `is_deleted` int(1) NOT NULL DEFAULT 0,
  `deleted_by` int(11) NOT NULL,
  `deleted_on` int(11) NOT NULL,
  `is_updated` int(1) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctors_no`, `doctor_name`, `doctors_pic`, `doctor_title`, `doctor_email`, `phone`, `address`, `created_by`, `created_on`, `is_deleted`, `deleted_by`, `deleted_on`, `is_updated`, `updated_by`, `updated_on`) VALUES
(1, 'haa', '16081291771595323650uhrbgfhufr.jpg', 'Suborna', 'great@gmail.com', '1234567812', 'nanana', 1, '2020-12-16 08:32:57', 1, 1, 2020, 1, 1, '2020-12-16 08:36:27'),
(2, 'Sumi Chawdhuri', '1608322508Pet-doctor-Stock-Photo-04.jpg', 'veterinary', 'great@gmail.com', '01711111112', '15a/3,gulshan1', 1, '2020-12-19 02:15:08', 0, 0, 0, 1, 1, '2020-12-24 11:36:04'),
(3, 'Robert Jno', '16083229992018-10-04-doctor-and-cows.jpg', 'Veterinary Practitioners', 'Contact@gmail.com', '18123456978', 'Address:15a/3,Banani', 1, '2020-12-19 02:23:19', 0, 0, 0, 1, 1, '2020-12-24 11:35:47'),
(4, 'Sayed Bappy khan', '1608323393mature-veterinarian-stethoscope-writing-clipboard-goat-farm-farming-senior-vet-doctor-white-uniform-blue-medical-163153760.jpg', 'Animal Veterinary Surgeon', 'Khan@gmail.com', '01512345678', 'Address:1/3,Banani', 1, '2020-12-19 02:29:23', 0, 0, 0, 1, 1, '2020-12-24 11:35:27'),
(5, 'Evana SSP', '160832472317240_1.jpg', 'Food safety and inspection Veterinarian', 'SSP@gmail.com', '01523456814', 'Address:115d/3,tollabag', 1, '2020-12-19 02:52:03', 0, 0, 0, 1, 1, '2020-12-24 11:35:12'),
(6, 'Masuma jahan', '1608325848529121920-1-640w.jpg', 'veterinary', 'contactme@gmail.com', '01897654321', 'Address:18d/3,ward5,Rajshahi', 1, '2020-12-19 03:10:48', 0, 0, 0, 1, 1, '2020-12-24 11:34:44'),
(7, 'Nure Yesmin', '1608326011asian-muslim-veterinarian-medical-check-up-farm-animal-doctor-check-goat-health_8595-15366.jpg', 'veterinary', 'shapla@gmail.com', '01769876543', '4/5a,block19,Rangpur', 1, '2020-12-19 03:13:31', 0, 0, 0, 1, 1, '2020-12-24 11:34:17'),
(8, 'Khatun-A-Jannat', '1608326290download.jpg', 'Veterinary Practitioners', 'jannat@gmail.com', '01876543209', 'Address:19no road/46 no house,Uttara,Dhaka', 1, '2020-12-19 03:18:10', 0, 0, 0, 1, 1, '2020-12-24 11:34:04'),
(9, 'Suborna Paul', '1608326466pet-doctor.jpg', 'Animal Veterinary Surgeon', 'Suborna11@gmai.com', '01782960451', '16d/3,tollabag,Sobhanbag,Dhanmondi,Dhaka', 1, '2020-12-19 03:21:06', 0, 0, 0, 1, 1, '2020-12-24 11:33:53');

-- --------------------------------------------------------

--
-- Table structure for table `employees_setup`
--

CREATE TABLE `employees_setup` (
  `EMPLOYEE_NO` int(11) NOT NULL,
  `EMPLOYEE_ID` int(11) NOT NULL,
  `USER_NO` int(11) NOT NULL,
  `FATHER_NAME` varchar(64) NOT NULL,
  `MOTHER_NAME` varchar(64) NOT NULL,
  `ID_TYPE_NO` int(11) NOT NULL,
  `ID_NUMBER` varchar(30) NOT NULL,
  `PRESENT_ADDRESS` varchar(32) NOT NULL,
  `PERMANENT_ADDRESS` varchar(32) NOT NULL,
  `MARITAL_STATUS` varchar(30) NOT NULL,
  `NUM_OF_CHILD` int(11) NOT NULL,
  `BASIC_SALARY` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees_setup`
--

INSERT INTO `employees_setup` (`EMPLOYEE_NO`, `EMPLOYEE_ID`, `USER_NO`, `FATHER_NAME`, `MOTHER_NAME`, `ID_TYPE_NO`, `ID_NUMBER`, `PRESENT_ADDRESS`, `PERMANENT_ADDRESS`, `MARITAL_STATUS`, `NUM_OF_CHILD`, `BASIC_SALARY`) VALUES
(1, 41, 1, 'FV', 'FDZ', 1, '1', 'HFV', 'GFDX', 'GHX', 1, 42.2),
(2, 0, 2, '', '', 0, '', '', '', '', 0, 0),
(3, 0, 3, '', '', 0, '', '', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `engineer_groups`
--

CREATE TABLE `engineer_groups` (
  `ENG_GROUP_NO` int(11) NOT NULL,
  `ENG_GROUP_NAME` varchar(64) NOT NULL,
  `ENG_GROUP_CODE` varchar(32) NOT NULL,
  `IS_DELETED` int(11) NOT NULL DEFAULT 0,
  `DELETED_BY` int(11) NOT NULL,
  `DELETED_ON` datetime NOT NULL,
  `IS_UPDATED` int(11) NOT NULL DEFAULT 0,
  `UPDATED_BY` int(11) NOT NULL,
  `UPDATED_ON` datetime NOT NULL,
  `CREATED_BY` int(11) NOT NULL,
  `CREATED_ON` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `engineer_groups`
--

INSERT INTO `engineer_groups` (`ENG_GROUP_NO`, `ENG_GROUP_NAME`, `ENG_GROUP_CODE`, `IS_DELETED`, `DELETED_BY`, `DELETED_ON`, `IS_UPDATED`, `UPDATED_BY`, `UPDATED_ON`, `CREATED_BY`, `CREATED_ON`) VALUES
(1, 'sd', 'asdf23', 1, 1, '2018-03-27 00:00:00', 1, 1, '2018-03-27 00:00:00', 1, '2018-03-27 00:00:00'),
(2, 'PHONEISDSF', 'SADLKFHH', 1, 1, '2018-03-28 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, '2018-03-27 00:00:00'),
(3, 'PHONEISDSF', 'SADLKFHHx', 0, 0, '0000-00-00 00:00:00', 1, 1, '2018-03-30 00:00:00', 1, '2018-03-27 00:00:00'),
(4, 'PHONEISDSF', 'SADLKFHH', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, '2018-03-27 00:00:00'),
(5, 's', 'fsdfg', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, '2018-03-28 00:00:00'),
(6, 'G', 'SDG', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, '2018-03-28 00:00:00'),
(7, 'RA', 'RA', 0, 0, '0000-00-00 00:00:00', 1, 1, '2018-03-28 00:00:00', 1, '2018-03-28 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `food_no` int(11) NOT NULL,
  `animal_no` int(11) NOT NULL,
  `food` varchar(255) NOT NULL,
  `food_pic` varchar(200) NOT NULL,
  `day_time` varchar(255) NOT NULL,
  `from_time` varchar(200) NOT NULL,
  `to_time` varchar(200) NOT NULL,
  `quantity` varchar(200) NOT NULL,
  `age_wise_food` varchar(200) NOT NULL,
  `comments_count` int(110) NOT NULL,
  `is_deleted` int(1) NOT NULL DEFAULT 0,
  `deleted_by` int(11) NOT NULL,
  `deleted_on` datetime NOT NULL,
  `is_updated` int(1) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`food_no`, `animal_no`, `food`, `food_pic`, `day_time`, `from_time`, `to_time`, `quantity`, `age_wise_food`, `comments_count`, `is_deleted`, `deleted_by`, `deleted_on`, `is_updated`, `updated_by`, `updated_on`, `created_by`, `created_on`) VALUES
(1, 0, 'Grass', '', 'Moring', '9AM', '11AM', '', '2-5 years', 1, 0, 0, '0000-00-00 00:00:00', 1, 1, '2020-07-23 00:00:00', 1, '2020-07-19 00:00:00'),
(2, 0, 'Grass', '', 'Noon', '1PM', '3PM', '', '2-5 years', 0, 0, 0, '0000-00-00 00:00:00', 1, 1, '2020-07-23 00:00:00', 1, '2020-07-19 00:00:00'),
(3, 0, 'grass', '', 'Morning', '6am', '10am', '', '2-5 years', 0, 0, 0, '0000-00-00 00:00:00', 1, 1, '2020-07-23 00:00:00', 1, '2020-07-19 00:00:00'),
(4, 0, 'grass', '', 'Morning', '6am', '10am', '', '5+years', 0, 0, 0, '0000-00-00 00:00:00', 1, 1, '2020-07-23 00:00:00', 1, '2020-07-19 00:00:00'),
(5, 2, 'yfgduvhbijwnk', '', 'Moring', '9AM', '11AM', '', '0-1 year', 3, 0, 0, '0000-00-00 00:00:00', 1, 1, '2020-11-23 00:00:00', 1, '2020-07-23 00:00:00'),
(6, 1, 'Grass', '', 'Noon', '2pm', '3pm', '', '1-2 years', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, '2020-11-23 00:00:00'),
(7, 1, 'Concentrate feed', '', 'During Lactation period', '----', '----', '', '---Select Age---', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, '2020-12-17 00:00:00'),
(8, 1, 'Concentrate feed,4.5kg', '', 'During Lactation period', '----', '----', '', '---Select Age---', 0, 0, 0, '0000-00-00 00:00:00', 1, 1, '2020-12-17 00:00:00', 1, '2020-12-17 00:00:00'),
(10, 1, 'Concentrate feed', '', 'During dry period ,1.5 kg is needed', '---', '---', '', '---Select Age---', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, '2020-12-17 00:00:00'),
(11, 1, '1 kg Green Fodder', '', 'During Lactation period', '---', '---', '', '---Select Age---', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, '2020-12-17 00:00:00'),
(12, 1, 'Green Fodder', '1608401897Nubische_geiten.jpg', 'During Lactation period,15 kg', '---', '---', '', '5+years', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, '2020-12-17 00:00:00'),
(13, 1, 'Dry fodder,4.5 kg', '1608401897Nubische_geiten.jpg', 'During Lactation period', '---', '---', '', '5+years', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, '2020-12-17 00:00:00'),
(14, 1, 'Grass-fed', '1608401897Nubische_geiten.jpg', 'During Lactation period', '2pm', '3pm', '', '2-5 years', 0, 0, 0, '0000-00-00 00:00:00', 1, 1, '2020-12-17 00:00:00', 1, '2020-12-17 00:00:00'),
(15, 1, 'Corn-fed', '1608401897Nubische_geiten.jpg', 'Noon', '----', '----', '', '1-2 years', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, '2020-12-17 00:00:00'),
(16, 1, 'Barley-fed', '1608401897Nubische_geiten.jpg', 'During dry period ,1.5 kg is needed', '1pm', '4pm', '', '2-5 years', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, '2020-12-17 00:00:00'),
(17, 2, 'Alfalfa', '1608401897Nubische_geiten.jpg', 'Morning', '9 am', '11 am', '', '1-2 years', 0, 1, 1, '2020-12-19 00:00:00', 1, 1, '2020-12-17 00:00:00', 1, '2020-12-17 00:00:00'),
(18, 2, 'Clover', '1608401897Nubische_geiten.jpg', 'Noon', '1pm', '3pm', '', '1-2 years', 0, 1, 1, '2020-12-19 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, '2020-12-17 00:00:00'),
(19, 2, 'Lespedeza', '1608401897Nubische_geiten.jpg', 'Noon', '5 pm', '6 pm', '', '0-1 year', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, '2020-12-17 00:00:00'),
(20, 2, 'Grass-Hay', '1608401897Nubische_geiten.jpg', 'During dry period ,1.5 kg is needed', '2pm', '4pm', '', '1-2 years', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, '2020-12-17 00:00:00'),
(21, 2, 'Grass-Hay', '1608401897Nubische_geiten.jpg', 'During dry period ,1.5 kg is needed', '2pm', '4pm', '', '1-2 years', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, '2020-12-18 00:00:00'),
(22, 2, 'Grass-Hay', '1608401897Nubische_geiten.jpg', 'During dry period ,1.5 kg is needed', '2pm', '4pm', '', '1-2 years', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, '2020-12-18 00:00:00'),
(23, 2, 'Grass-Hay', '1608401897Nubische_geiten.jpg', 'During dry period ,1.5 kg is needed', '2pm', '4pm', '', '1-2 years', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, '2020-12-18 00:00:00'),
(26, 3, 'Green Fodder', '1608402998fitted (2).jpg', 'nvnvhh', '9 am', '11 am', '56kg', '2-5 years', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, '2020-12-19 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `food_comments`
--

CREATE TABLE `food_comments` (
  `id` int(255) NOT NULL,
  `f_messages` varchar(400) NOT NULL,
  `food_no` int(255) NOT NULL,
  `buyer_user_no` int(111) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_comments`
--

INSERT INTO `food_comments` (`id`, `f_messages`, `food_no`, `buyer_user_no`, `created_time`) VALUES
(1, 'good', 1, 1, '2020-12-14 15:22:17');

-- --------------------------------------------------------

--
-- Table structure for table `gen_area`
--

CREATE TABLE `gen_area` (
  `AREA_NO` int(11) NOT NULL,
  `AREA_NAME` varchar(64) NOT NULL,
  `AREA_CODE` varchar(20) NOT NULL,
  `AREA_REMARKS` text NOT NULL,
  `CREATED_BY` int(11) NOT NULL,
  `CREATED_ON` datetime NOT NULL,
  `IS_DELETED` int(1) NOT NULL DEFAULT 0,
  `DELETED_BY` int(11) NOT NULL,
  `DELETED_ON` datetime NOT NULL,
  `IS_UPDATED` int(1) NOT NULL DEFAULT 0,
  `UPDATED_BY` int(11) NOT NULL,
  `UPDATED_ON` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `gen_area`
--

INSERT INTO `gen_area` (`AREA_NO`, `AREA_NAME`, `AREA_CODE`, `AREA_REMARKS`, `CREATED_BY`, `CREATED_ON`, `IS_DELETED`, `DELETED_BY`, `DELETED_ON`, `IS_UPDATED`, `UPDATED_BY`, `UPDATED_ON`) VALUES
(1, 'Sreerayer Char', 'src', 'Village', 1, '2018-03-21 00:00:00', 1, 1, '2018-03-21 15:14:09', 0, 0, '0000-00-00 00:00:00'),
(2, 'Sreerayer Char', 'src', 'Village', 1, '2018-03-21 15:07:38', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(3, 'House Building', 'hb11', 'Remarks', 1, '2018-03-22 05:35:07', 0, 0, '0000-00-00 00:00:00', 1, 1, '2018-03-22 05:35:22');

-- --------------------------------------------------------

--
-- Table structure for table `gen_bits`
--

CREATE TABLE `gen_bits` (
  `BIT_NO` int(11) NOT NULL,
  `BIT_ADDRESS` varchar(500) NOT NULL,
  `DIVISION_NO` int(11) NOT NULL,
  `CREATED_BY` int(11) NOT NULL,
  `CREATED_ON` datetime NOT NULL,
  `IS_DELETED` int(1) NOT NULL DEFAULT 0,
  `DELETED_BY` int(11) NOT NULL,
  `DELETED_ON` datetime NOT NULL,
  `IS_UPDATED` int(1) NOT NULL DEFAULT 0,
  `UPDATED_BY` int(11) NOT NULL,
  `UPDATED_ON` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gen_bits`
--

INSERT INTO `gen_bits` (`BIT_NO`, `BIT_ADDRESS`, `DIVISION_NO`, `CREATED_BY`, `CREATED_ON`, `IS_DELETED`, `DELETED_BY`, `DELETED_ON`, `IS_UPDATED`, `UPDATED_BY`, `UPDATED_ON`) VALUES
(1, 'Address', 2, 1, '2018-03-22 06:01:01', 0, 0, '0000-00-00 00:00:00', 1, 1, '2018-03-23 06:18:40'),
(2, 'details', 2, 1, '2018-03-22 06:01:48', 0, 0, '0000-00-00 00:00:00', 1, 1, '2018-03-22 06:04:15');

-- --------------------------------------------------------

--
-- Table structure for table `gen_branches`
--

CREATE TABLE `gen_branches` (
  `BRANCH_NO` int(11) NOT NULL,
  `BRANCH_ADDRESS` text NOT NULL,
  `CREATED_BY` int(11) NOT NULL,
  `CREATED_ON` datetime NOT NULL,
  `IS_DELETED` int(1) NOT NULL DEFAULT 0,
  `DELETED_BY` int(11) NOT NULL,
  `DELETED_ON` datetime NOT NULL,
  `IS_UPDATED` int(1) NOT NULL DEFAULT 0,
  `UPDATED_BY` int(11) NOT NULL,
  `UPDATED_ON` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gen_districts`
--

CREATE TABLE `gen_districts` (
  `DISTRICT_NO` int(11) NOT NULL,
  `DIVISION_NO` int(11) NOT NULL,
  `DISTRICT_NAME` varchar(55) NOT NULL,
  `IS_DELETED` int(11) NOT NULL DEFAULT 0,
  `IS_UPDATED` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gen_districts`
--

INSERT INTO `gen_districts` (`DISTRICT_NO`, `DIVISION_NO`, `DISTRICT_NAME`, `IS_DELETED`, `IS_UPDATED`) VALUES
(1, 1, 'Comilla', 1, 0),
(2, 1, 'Chandpur', 1, 0),
(3, 2, 'Manikgaon', 1, 0),
(4, 2, 'RANPUR', 1, 0),
(5, 1, 'ghv', 1, 0),
(6, 1, 'kbjn', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `gen_divisions`
--

CREATE TABLE `gen_divisions` (
  `DIVISION_NO` int(11) NOT NULL,
  `IS_DELETED` int(11) NOT NULL DEFAULT 0,
  `UPDATED_ON` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gen_divisions`
--

INSERT INTO `gen_divisions` (`DIVISION_NO`, `IS_DELETED`, `UPDATED_ON`) VALUES
(1, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gen_organizations`
--

CREATE TABLE `gen_organizations` (
  `ORGANIZATION_NO` int(11) NOT NULL,
  `ORGANIZATION_NAME` varchar(64) NOT NULL,
  `ORGANIZATION_CODE` varchar(20) NOT NULL,
  `DIVISION_NO` int(11) NOT NULL,
  `DISTRICT_NO` int(11) NOT NULL,
  `UPAZILA_NO` int(11) NOT NULL,
  `BUILDING_NAME` varchar(64) NOT NULL,
  `CONTACT_EMAIL` varchar(64) NOT NULL,
  `CONTACT_NUM` varchar(20) NOT NULL,
  `ROAD_NUM` varchar(20) NOT NULL,
  `HOUSE_NUM` varchar(20) NOT NULL,
  `BLOCK_NUM` varchar(20) NOT NULL,
  `ORGANIZATION_ADDRESS` varchar(500) NOT NULL,
  `CREATED_BY` int(11) NOT NULL,
  `CREATED_ON` datetime NOT NULL,
  `IS_DELETED` int(1) NOT NULL DEFAULT 0,
  `DELETED_BY` int(11) NOT NULL,
  `DELETED_ON` datetime NOT NULL,
  `IS_UPDATED` int(1) NOT NULL DEFAULT 0,
  `UPDATED_BY` int(11) NOT NULL,
  `UPDATED_ON` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gen_organizations`
--

INSERT INTO `gen_organizations` (`ORGANIZATION_NO`, `ORGANIZATION_NAME`, `ORGANIZATION_CODE`, `DIVISION_NO`, `DISTRICT_NO`, `UPAZILA_NO`, `BUILDING_NAME`, `CONTACT_EMAIL`, `CONTACT_NUM`, `ROAD_NUM`, `HOUSE_NUM`, `BLOCK_NUM`, `ORGANIZATION_ADDRESS`, `CREATED_BY`, `CREATED_ON`, `IS_DELETED`, `DELETED_BY`, `DELETED_ON`, `IS_UPDATED`, `UPDATED_BY`, `UPDATED_ON`) VALUES
(1, 'BDSoft IT Solutions', 'bds001', 2, 4, 4, '', '', '', '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(2, 'SoftBD', 'SBD', 2, 4, 4, 'Farmview', 'soft@info.com', '34567890', '12', '3', '4', 'IT Firm', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, 1, '0000-00-00 00:00:00'),
(3, 'Sallu It', 'sir4', 1, 2, 2, 'concord', 's@gmail.com', '456787897545678', '31', '87', '9', 'details', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gen_outlates`
--

CREATE TABLE `gen_outlates` (
  `OUTLATE_NO` int(11) NOT NULL,
  `OUTLATE_NAME` varchar(64) NOT NULL,
  `OUTLATE_CODE` varchar(20) NOT NULL,
  `BIT_NO` int(11) NOT NULL,
  `ORGANIZATION_NO` int(11) NOT NULL,
  `OWNER_NAME` varchar(64) NOT NULL,
  `CONTACT_NO` varchar(20) NOT NULL,
  `ROAD_NO` int(11) NOT NULL,
  `HOUSE_NO` varchar(15) NOT NULL,
  `BLOCK_NO` int(11) NOT NULL,
  `OUTLATE_DUE_LIMIT` varchar(20) NOT NULL,
  `ADDRESS` text NOT NULL,
  `CREATED_BY` int(11) NOT NULL,
  `CREATED_ON` datetime NOT NULL,
  `IS_DELETED` int(1) NOT NULL DEFAULT 0,
  `DELETED_BY` int(11) NOT NULL,
  `DELETED_ON` datetime NOT NULL,
  `IS_UPDATED` int(1) NOT NULL DEFAULT 0,
  `UPDATED_BY` int(11) NOT NULL,
  `UPDATED_ON` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `gen_outlates`
--

INSERT INTO `gen_outlates` (`OUTLATE_NO`, `OUTLATE_NAME`, `OUTLATE_CODE`, `BIT_NO`, `ORGANIZATION_NO`, `OWNER_NAME`, `CONTACT_NO`, `ROAD_NO`, `HOUSE_NO`, `BLOCK_NO`, `OUTLATE_DUE_LIMIT`, `ADDRESS`, `CREATED_BY`, `CREATED_ON`, `IS_DELETED`, `DELETED_BY`, `DELETED_ON`, `IS_UPDATED`, `UPDATED_BY`, `UPDATED_ON`) VALUES
(1, 'BDsoft', 'BDS', 2, 1, 'Saikat', '2147483647000000000', 18, '22', 3, '8', 'Rupnagar', 1, '2018-03-22 06:20:46', 0, 0, '0000-00-00 00:00:00', 1, 1, '2018-03-22 06:24:19');

-- --------------------------------------------------------

--
-- Table structure for table `gen_upazilas`
--

CREATE TABLE `gen_upazilas` (
  `UPAZILA_NO` int(11) NOT NULL,
  `DIVISION_NO` int(11) NOT NULL,
  `DISTRICT_NO` int(11) NOT NULL,
  `UPAZILA_NAME` varchar(255) NOT NULL,
  `IS_DELETED` int(11) NOT NULL DEFAULT 0,
  `DELETED_BY` int(11) NOT NULL,
  `DELETED_ON` datetime NOT NULL,
  `IS_UPDATED` int(11) NOT NULL DEFAULT 0,
  `UPDATED_BY` int(11) NOT NULL,
  `UPDATED_ON` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gen_upazilas`
--

INSERT INTO `gen_upazilas` (`UPAZILA_NO`, `DIVISION_NO`, `DISTRICT_NO`, `UPAZILA_NAME`, `IS_DELETED`, `DELETED_BY`, `DELETED_ON`, `IS_UPDATED`, `UPDATED_BY`, `UPDATED_ON`) VALUES
(1, 1, 1, 'Daudkandi', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(2, 1, 2, 'Matlab', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(3, 2, 4, 'Mirpur', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(4, 2, 4, 'Uttara', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gen_users`
--

CREATE TABLE `gen_users` (
  `USER_NO` int(11) NOT NULL,
  `USER_EMAIL` varchar(64) CHARACTER SET utf8mb4 NOT NULL,
  `PASSWORD` varchar(64) CHARACTER SET utf8mb4 NOT NULL,
  `FULL_NAME` varchar(64) CHARACTER SET utf8mb4 NOT NULL,
  `MOBILE` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `DESIGNATION_NO` int(11) NOT NULL,
  `DOB` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `DEPARTMENT_NO` int(11) NOT NULL,
  `USER_TYPE_NO` int(11) NOT NULL,
  `ORGANIZATION_NO` int(11) NOT NULL,
  `IS_SUPER_ADMIN` int(1) NOT NULL DEFAULT 0,
  `IS_ACTIVE` int(1) NOT NULL DEFAULT 0,
  `ACTIVE_FROM` datetime NOT NULL,
  `ACTIVE_TO` datetime NOT NULL,
  `IS_FIRST_LOGIN` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gen_users`
--

INSERT INTO `gen_users` (`USER_NO`, `USER_EMAIL`, `PASSWORD`, `FULL_NAME`, `MOBILE`, `DESIGNATION_NO`, `DOB`, `DEPARTMENT_NO`, `USER_TYPE_NO`, `ORGANIZATION_NO`, `IS_SUPER_ADMIN`, `IS_ACTIVE`, `ACTIVE_FROM`, `ACTIVE_TO`, `IS_FIRST_LOGIN`) VALUES
(1, 'admin@bdsoft.biz', '0192023a7bbd73250516f069df18b500', 'Admin', '01680651229', 1, '2018-03-21', 1, 1, 1, 0, 1, '2018-03-20 00:00:00', '2018-08-31 00:00:00', 1),
(2, 'd', '62026aaed5419a1ceaa229bf6886443e', 'd', '4257', 0, '2013-03-08', 0, 1, 1, 0, 1, '2018-03-31 00:00:00', '2018-03-31 00:00:00', 1),
(3, 'xv', '4531e8924edde928f341f7df3ab36c70', 'xc', '2', 0, '2018-03-31', 0, 1, 1, 0, 1, '2018-03-31 00:00:00', '2018-03-31 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_area_maps`
--

CREATE TABLE `group_area_maps` (
  `GROUP_AREA_NO` int(11) NOT NULL,
  `DIVISION_NO` int(11) NOT NULL,
  `DISTRICT_NO` int(11) NOT NULL,
  `UPAZILA_NO` int(11) NOT NULL,
  `ENG_GROUP_NO` int(11) NOT NULL,
  `GROUP_AREA_MAPS_REMARKS` text NOT NULL,
  `CREATED_BY` int(11) NOT NULL,
  `CREATED_ON` datetime NOT NULL,
  `IS_DELETED` int(1) NOT NULL DEFAULT 0,
  `DELETED_BY` int(11) NOT NULL,
  `DELETED_ON` datetime NOT NULL,
  `IS_UPDATED` int(1) NOT NULL DEFAULT 0,
  `UPDATED_BY` int(11) NOT NULL,
  `UPDATED_ON` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `group_area_maps`
--

INSERT INTO `group_area_maps` (`GROUP_AREA_NO`, `DIVISION_NO`, `DISTRICT_NO`, `UPAZILA_NO`, `ENG_GROUP_NO`, `GROUP_AREA_MAPS_REMARKS`, `CREATED_BY`, `CREATED_ON`, `IS_DELETED`, `DELETED_BY`, `DELETED_ON`, `IS_UPDATED`, `UPDATED_BY`, `UPDATED_ON`) VALUES
(1, 1, 1, 1, 0, 'Village', 0, '0000-00-00 00:00:00', 1, 1, '2018-03-21 15:14:09', 0, 0, '0000-00-00 00:00:00'),
(2, 1, 1, 1, 0, 'Village', 0, '0000-00-00 00:00:00', 1, 1, '2018-03-28 12:27:45', 0, 0, '0000-00-00 00:00:00'),
(3, 1, 1, 1, 1, 'Remarks', 0, '0000-00-00 00:00:00', 1, 1, '2018-04-03 15:29:36', 1, 1, '2018-03-30 22:14:56'),
(4, 1, 1, 1, 1, 'jhg', 1, '2018-03-28 14:35:34', 1, 1, '2018-03-30 22:12:30', 0, 0, '0000-00-00 00:00:00'),
(5, 1, 1, 1, 1, '', 1, '2018-03-30 22:12:30', 1, 1, '2018-03-30 22:12:48', 0, 0, '0000-00-00 00:00:00'),
(6, 1, 1, 1, 1, '', 1, '2018-03-30 22:20:01', 1, 1, '2018-03-30 22:20:26', 0, 0, '0000-00-00 00:00:00'),
(7, 1, 1, 1, 1, 'vb', 1, '2018-03-30 22:20:26', 0, 0, '0000-00-00 00:00:00', 1, 1, '2018-03-30 22:32:53'),
(8, 1, 1, 1, 1, '', 1, '2018-03-30 22:32:20', 1, 1, '2018-04-03 15:29:32', 0, 0, '0000-00-00 00:00:00'),
(9, 1, 1, 1, 1, 'CCXC', 1, '2018-04-03 14:59:12', 0, 0, '0000-00-00 00:00:00', 1, 1, '2018-04-03 15:04:46'),
(10, 1, 1, 1, 1, '', 1, '2018-04-03 15:00:19', 1, 1, '2018-04-03 15:29:33', 0, 0, '0000-00-00 00:00:00'),
(11, 1, 1, 1, 1, '', 1, '2018-04-03 15:08:11', 1, 1, '2018-04-03 15:29:34', 0, 0, '0000-00-00 00:00:00'),
(12, 1, 1, 1, 0, '', 1, '2018-04-03 15:11:28', 1, 1, '2018-04-03 15:29:34', 0, 0, '0000-00-00 00:00:00'),
(13, 1, 1, 1, 0, '', 1, '2018-04-03 15:13:18', 1, 1, '2018-04-03 15:29:35', 0, 0, '0000-00-00 00:00:00'),
(14, 1, 2, 2, 3, 'xZ', 1, '2018-04-03 15:15:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(15, 1, 1, 1, 1, 'ssdf', 1, '2018-04-03 15:24:04', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `item_category_types`
--

CREATE TABLE `item_category_types` (
  `ITEM_CATEGORY_TYPE_NO` int(11) NOT NULL,
  `ITEM_CATEGORY_TYPE_NAME` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item_category_types`
--

INSERT INTO `item_category_types` (`ITEM_CATEGORY_TYPE_NO`, `ITEM_CATEGORY_TYPE_NAME`) VALUES
(1, 'item1'),
(2, 'item2');

-- --------------------------------------------------------

--
-- Table structure for table `needs`
--

CREATE TABLE `needs` (
  `AREA_NO` int(11) NOT NULL,
  `ORGANIZATION_NO` int(11) NOT NULL,
  `DIVISION_NO` int(11) NOT NULL,
  `DISTRICT_NO` int(11) NOT NULL,
  `UPAZILA_NO` int(11) NOT NULL,
  `AREA_NAME` varchar(64) NOT NULL,
  `AREA_CODE` varchar(20) NOT NULL,
  `AREA_REMARKS` text NOT NULL,
  `CREATED_BY` int(11) NOT NULL,
  `CREATED_ON` datetime NOT NULL,
  `IS_DELETED` int(1) NOT NULL DEFAULT 0,
  `DELETED_BY` int(11) NOT NULL,
  `DELETED_ON` int(11) NOT NULL,
  `IS_UPDATED` int(1) NOT NULL DEFAULT 0,
  `UPDATED_BY` int(11) NOT NULL,
  `UPDATED_ON` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_details`
--

CREATE TABLE `purchase_order_details` (
  `PURCHASE_ORDER_DETAILS_NO` int(11) NOT NULL,
  `PURCHASE_ORDER_MASTER_NO` int(11) NOT NULL,
  `ITEM_NO` int(11) NOT NULL,
  `UNIT_NO` int(11) NOT NULL,
  `UNIT_RATE` double NOT NULL,
  `ORDER_QUANTITY` double NOT NULL,
  `COMISSION_AMOUNT` double NOT NULL,
  `ORDER_AMOUNT` double NOT NULL,
  `CREATED_BY` int(11) NOT NULL,
  `CREATED_ON` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_masters`
--

CREATE TABLE `purchase_order_masters` (
  `PURCHASE_ORDER_MASTER_NO` int(11) NOT NULL,
  `PURCHASE_ORDER_DATE` date NOT NULL,
  `PURCHASE_ORDER_NUMBER` varchar(20) NOT NULL,
  `ORDER_AMOUNT` double NOT NULL,
  `VERIFIED_BY` int(11) NOT NULL,
  `VERIFIED_ON` datetime NOT NULL,
  `IS_PROCESSED` int(1) NOT NULL DEFAULT 0,
  `IS_CANCELED` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `seller_info`
--

CREATE TABLE `seller_info` (
  `seller_no` int(11) NOT NULL,
  `seller_name` varchar(200) NOT NULL,
  `seller_email` varchar(200) NOT NULL,
  `seller_phone` varchar(200) NOT NULL,
  `seller_address` varchar(2000) NOT NULL,
  `animal_pic` varchar(200) NOT NULL,
  `price` varchar(200) NOT NULL,
  `created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `seller_info`
--

INSERT INTO `seller_info` (`seller_no`, `seller_name`, `seller_email`, `seller_phone`, `seller_address`, `animal_pic`, `price`, `created_on`) VALUES
(8, 'demo', 'demo1@gmail.com', '2132132132131', 'ROOM NO.:405, BAR UNIVERSITY', '1608351082', '222', '2020-12-19 05:11:22'),
(9, 'a', 'demo1@gmail.com', '2556786756', 'qwdqwdqwdqw', '1608351386', '232', '2020-12-19 05:16:26'),
(10, 'demo2', 'demo1@gmail.com', '34545667', 'yftgvhj', '1608435532', '232', '2020-12-20 04:38:52'),
(11, 'demo2', 'demo1@gmail.com', '765786789', 'EAST VATDI', '1608435944WhatsApp Image 2020-11-18 at 3.24.21 PM.jpeg', '232', '2020-12-20 04:45:44');

-- --------------------------------------------------------

--
-- Table structure for table `xxx_user`
--

CREATE TABLE `xxx_user` (
  `user_no` int(11) NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `user_full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_contact` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL,
  `active_from` date NOT NULL,
  `active_to` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `xxx_user`
--

INSERT INTO `xxx_user` (`user_no`, `user_name`, `pass`, `user_full_name`, `user_email`, `user_contact`, `is_active`, `active_from`, `active_to`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', '', 'admin@gmail.com', '', 1, '2017-10-10', '2098-11-22'),
(2, 'Director', 'e10adc3949ba59abbe56e057f20f883e', 'Monwarul Islam Rebel', '', '', 1, '2018-12-18', '2098-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `xxx_users`
--

CREATE TABLE `xxx_users` (
  `user_no` int(11) NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `user_full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_contact` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL,
  `active_from` date NOT NULL,
  `active_to` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `xxx_users`
--

INSERT INTO `xxx_users` (`user_no`, `user_name`, `pass`, `user_full_name`, `user_email`, `user_contact`, `is_active`, `active_from`, `active_to`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', '', 'admin@gmail.com', '', 1, '2017-10-10', '2022-11-30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_animal`
--
ALTER TABLE `add_animal`
  ADD PRIMARY KEY (`animal_no`);

--
-- Indexes for table `add_services`
--
ALTER TABLE `add_services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `animal_disease`
--
ALTER TABLE `animal_disease`
  ADD PRIMARY KEY (`animal_disease_no`);

--
-- Indexes for table `animal_gallery`
--
ALTER TABLE `animal_gallery`
  ADD PRIMARY KEY (`animal_gallery_no`);

--
-- Indexes for table `animal_type`
--
ALTER TABLE `animal_type`
  ADD PRIMARY KEY (`animal_type_no`);

--
-- Indexes for table `buyer_info`
--
ALTER TABLE `buyer_info`
  ADD PRIMARY KEY (`buyer_no`);

--
-- Indexes for table `buyer_user`
--
ALTER TABLE `buyer_user`
  ADD PRIMARY KEY (`buyer_user_no`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_no`);

--
-- Indexes for table `disease_comments`
--
ALTER TABLE `disease_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctors_no`);

--
-- Indexes for table `employees_setup`
--
ALTER TABLE `employees_setup`
  ADD PRIMARY KEY (`EMPLOYEE_NO`);

--
-- Indexes for table `engineer_groups`
--
ALTER TABLE `engineer_groups`
  ADD PRIMARY KEY (`ENG_GROUP_NO`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`food_no`);

--
-- Indexes for table `food_comments`
--
ALTER TABLE `food_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gen_area`
--
ALTER TABLE `gen_area`
  ADD PRIMARY KEY (`AREA_NO`);

--
-- Indexes for table `gen_bits`
--
ALTER TABLE `gen_bits`
  ADD PRIMARY KEY (`BIT_NO`);

--
-- Indexes for table `gen_districts`
--
ALTER TABLE `gen_districts`
  ADD PRIMARY KEY (`DISTRICT_NO`);

--
-- Indexes for table `gen_divisions`
--
ALTER TABLE `gen_divisions`
  ADD PRIMARY KEY (`DIVISION_NO`);

--
-- Indexes for table `gen_organizations`
--
ALTER TABLE `gen_organizations`
  ADD PRIMARY KEY (`ORGANIZATION_NO`);

--
-- Indexes for table `gen_upazilas`
--
ALTER TABLE `gen_upazilas`
  ADD PRIMARY KEY (`UPAZILA_NO`);

--
-- Indexes for table `gen_users`
--
ALTER TABLE `gen_users`
  ADD PRIMARY KEY (`USER_NO`);

--
-- Indexes for table `group_area_maps`
--
ALTER TABLE `group_area_maps`
  ADD PRIMARY KEY (`GROUP_AREA_NO`),
  ADD KEY `DIVISION_NO` (`DIVISION_NO`),
  ADD KEY `DISTRICT_NO` (`DISTRICT_NO`),
  ADD KEY `UPAZILA_NO` (`UPAZILA_NO`);

--
-- Indexes for table `seller_info`
--
ALTER TABLE `seller_info`
  ADD PRIMARY KEY (`seller_no`);

--
-- Indexes for table `xxx_user`
--
ALTER TABLE `xxx_user`
  ADD PRIMARY KEY (`user_no`),
  ADD UNIQUE KEY `USER_NAME` (`user_name`),
  ADD UNIQUE KEY `USER_FULL_NAME` (`user_full_name`),
  ADD UNIQUE KEY `USER_EMAIL` (`user_email`),
  ADD UNIQUE KEY `USER_NO` (`user_no`),
  ADD UNIQUE KEY `USER_NO_2` (`user_no`);

--
-- Indexes for table `xxx_users`
--
ALTER TABLE `xxx_users`
  ADD PRIMARY KEY (`user_no`),
  ADD UNIQUE KEY `USER_NAME` (`user_name`),
  ADD UNIQUE KEY `USER_FULL_NAME` (`user_full_name`),
  ADD UNIQUE KEY `USER_EMAIL` (`user_email`),
  ADD UNIQUE KEY `USER_NO` (`user_no`),
  ADD UNIQUE KEY `USER_NO_2` (`user_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `add_animal`
--
ALTER TABLE `add_animal`
  MODIFY `animal_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `add_services`
--
ALTER TABLE `add_services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_login`
--
ALTER TABLE `admin_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `animal_disease`
--
ALTER TABLE `animal_disease`
  MODIFY `animal_disease_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `animal_gallery`
--
ALTER TABLE `animal_gallery`
  MODIFY `animal_gallery_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `animal_type`
--
ALTER TABLE `animal_type`
  MODIFY `animal_type_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `buyer_info`
--
ALTER TABLE `buyer_info`
  MODIFY `buyer_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `buyer_user`
--
ALTER TABLE `buyer_user`
  MODIFY `buyer_user_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `disease_comments`
--
ALTER TABLE `disease_comments`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctors_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `employees_setup`
--
ALTER TABLE `employees_setup`
  MODIFY `EMPLOYEE_NO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `engineer_groups`
--
ALTER TABLE `engineer_groups`
  MODIFY `ENG_GROUP_NO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `food_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `food_comments`
--
ALTER TABLE `food_comments`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gen_districts`
--
ALTER TABLE `gen_districts`
  MODIFY `DISTRICT_NO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gen_divisions`
--
ALTER TABLE `gen_divisions`
  MODIFY `DIVISION_NO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gen_organizations`
--
ALTER TABLE `gen_organizations`
  MODIFY `ORGANIZATION_NO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gen_upazilas`
--
ALTER TABLE `gen_upazilas`
  MODIFY `UPAZILA_NO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gen_users`
--
ALTER TABLE `gen_users`
  MODIFY `USER_NO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `group_area_maps`
--
ALTER TABLE `group_area_maps`
  MODIFY `GROUP_AREA_NO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `seller_info`
--
ALTER TABLE `seller_info`
  MODIFY `seller_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `xxx_user`
--
ALTER TABLE `xxx_user`
  MODIFY `user_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `xxx_users`
--
ALTER TABLE `xxx_users`
  MODIFY `user_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `group_area_maps`
--
ALTER TABLE `group_area_maps`
  ADD CONSTRAINT `group_area_maps_ibfk_1` FOREIGN KEY (`DIVISION_NO`) REFERENCES `gen_divisions` (`DIVISION_NO`),
  ADD CONSTRAINT `group_area_maps_ibfk_2` FOREIGN KEY (`DISTRICT_NO`) REFERENCES `gen_districts` (`DISTRICT_NO`),
  ADD CONSTRAINT `group_area_maps_ibfk_3` FOREIGN KEY (`UPAZILA_NO`) REFERENCES `gen_upazilas` (`UPAZILA_NO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
