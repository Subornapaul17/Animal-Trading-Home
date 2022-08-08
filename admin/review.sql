-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2020 at 03:48 AM
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
-- Database: `review`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `author_no` int(11) NOT NULL,
  `author_name` varchar(255) NOT NULL,
  `category_no` int(11) NOT NULL,
  `department_no` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `is_deleted` int(1) NOT NULL DEFAULT 0,
  `deleted_by` int(11) NOT NULL,
  `deleted_on` datetime NOT NULL,
  `is_updated` int(1) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(255) NOT NULL,
  `file1` varchar(255) NOT NULL,
  `optradio2` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `title` longtext NOT NULL,
  `desci` longtext NOT NULL,
  `rest_no` varchar(255) NOT NULL,
  `dt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `file1`, `optradio2`, `email`, `title`, `desci`, `rest_no`, `dt`) VALUES
(3, '1233705826ProductPush_443497HVKEG9772_001_Light.jpg', 'on', 'mhsiam.pro@gmail.com', 'Europe', 'as', '3', '2019-12-08 15:16:47'),
(4, '1249116778ProductPush_443497HVKEG9772_001_Light.jpg', 'on', 'mhsiam.pro@gmail.com', 'Europe', 'as', '3', '2019-12-08 15:19:36'),
(5, '317202048ProductPush_443497HVKEG9772_001_Light.jpg', 'on', 'mhsiam.pro@gmail.com', 'Europe', 'as', '3', '2019-12-08 15:19:57'),
(6, '880507962backpack-396x396.jpg', 'on', 'mhsiam.pro@gmail.com', 'Europe', 'Aws', '3', '2019-12-08 15:23:04'),
(7, '53645289077024046_2178292862476849_5665193392502472704_n.png', '4', 'mhsiam.pro@gmail.com', 'Europe', 'S', '3', '2019-12-08 15:24:43');

-- --------------------------------------------------------

--
-- Table structure for table `customer_reg`
--

CREATE TABLE `customer_reg` (
  `customer_reg_no` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_contact` varchar(25) NOT NULL,
  `customer_email` varchar(55) NOT NULL,
  `customer_city` varchar(255) NOT NULL,
  `customer_address` text NOT NULL,
  `password` varchar(55) NOT NULL,
  `reg_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_reg`
--

INSERT INTO `customer_reg` (`customer_reg_no`, `customer_name`, `customer_contact`, `customer_email`, `customer_city`, `customer_address`, `password`, `reg_time`) VALUES
(1, 'Riyad Hossein', '01680651229', 'riyadhossein@gmail.com ', 'Dhaka', 'Mirpur', '202cb962ac59075b964b07152d234b70', '2018-04-30 03:16:54');

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `document_no` int(11) NOT NULL,
  `headline` varchar(300) NOT NULL,
  `details` varchar(3500) NOT NULL,
  `image_url` varchar(200) NOT NULL,
  `document_url` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_date` varchar(100) NOT NULL,
  `created_time` varchar(100) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `deleted_by` int(11) NOT NULL,
  `deleted_on` datetime NOT NULL,
  `is_updated` int(11) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`document_no`, `headline`, `details`, `image_url`, `document_url`, `created_by`, `created_on`, `created_date`, `created_time`, `is_deleted`, `deleted_by`, `deleted_on`, `is_updated`, `updated_by`, `updated_on`) VALUES
(1, 'ডাকসু নির্বাচনের প্রস্তুতি নিতে ছাত্রলীগকে প্রধানমন্ত্রীর নির্দেশনা', '<p>ohnvwrifv iowerufuiof oiwuefweuiof pioepufnweiouf weijfnewuiofn eoiufnewiofn eiojfnejoifn weiojfneojifn eowiqfnewnf ef njei nfoiwefnwefn</p>', '1549212986315.jpg', '1549211732120 grammar & vocab mistakes.pdf', 1, '2019-02-03 10:35:32', '2019-02-03', '10:35:32 PM', 0, 0, '0000-00-00 00:00:00', 1, 1, '2019-02-03 10:56:26');

-- --------------------------------------------------------

--
-- Table structure for table `english_news`
--

CREATE TABLE `english_news` (
  `english_news_no` int(11) NOT NULL,
  `category_no` int(11) NOT NULL,
  `department_no` int(11) NOT NULL,
  `headline` varchar(300) NOT NULL,
  `details` varchar(3000) NOT NULL,
  `image_url` varchar(300) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_date` varchar(100) NOT NULL,
  `created_time` varchar(100) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `deleted_by` int(11) NOT NULL,
  `deleted_on` datetime NOT NULL,
  `is_updated` int(11) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `english_news`
--

INSERT INTO `english_news` (`english_news_no`, `category_no`, `department_no`, `headline`, `details`, `image_url`, `created_by`, `created_on`, `created_date`, `created_time`, `is_deleted`, `deleted_by`, `deleted_on`, `is_updated`, `updated_by`, `updated_on`) VALUES
(1, 50, -1, 'Golmaal Again: Ajay Devgn starrer crosses Rs 100 cr', '<p>Rohit Shetty has once again proved that he knows how to make the cars fly and tickle the funnybones all at the same time. His latest outing Golmaal Again has smoothly sailed the litmus test at the Box Office and entered the much-coveted Rs 100 crore club.</p>\r\n<p>Golmaal Again has minted Rs 103. 64 crore at the Box Office so far, as per noted film critic and trade analyst Tarran Adarsh. Check out his tweets which reflect about the BO figures.</p>\r\n<p>The film is a fourth part of the superhit Golmaal franchise which has always managed to make viewers go bonkers. The mass entertainer boasts of an ensemble star cast with Ajay Devgn, Arshad Warsi, Shreyas Talpade, Tusshar Kapoor, Kunal Kemmu, Parineeti Chopra, Tabu and Neil Nitin Mukesh in pivotal parts.</p>\r\n<p>Also, veteran comedian Johnny Lever, Sanjay Mishra, Mukesh Tiwari, Vrajesh Hirjee and Prakash Raj play interesting parts in the horror comedy drama. The film released during Diwali time and encashed on the festivity.</p>', '1548170716image-11362-1508932661.jpg', 1, '2019-01-22 09:25:16', '2019-01-22', '09:25:16 PM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(2, 50, 0, 'US judge to sentence first official in FIFA scandal', '<p>A 63-year-old former Guatemalan football official is expected Wednesday to become the first person sentenced by a US judge over the sweeping corruption scandal that rocked world soccer.</p>\r\n<p>The US investigation, first unveiled in May 2015, has seen federal prosecutors in New York indict around 40 football and sports marketing executives with allegedly receiving tens of millions of bribes and kickbacks.</p>\r\n<p>Like many of the indicted, Hector Trujillo cut a deal with prosecutors and pleaded guilty to one count of wire fraud and one count of wire fraud conspiracy in a US federal court in Brooklyn four months ago.</p>\r\n<p>He served as general secretary of Guatemala\'s Football Federation from 2009 to 2015 and also was a judge on the country\'s constitutional court.</p>\r\n<p>US prosecutors are seeking a minimum sentence of just over three years and for Trujillo to pay back $415,000 to the Guatemalan soccer federation, when Judge Pamela Chen opens the hearing at a Brooklyn federal court at 2:30 pm (1830 GMT).</p>\r\n<p>They dispute a claim from Trujillo\'s lawyers that he has already endured \"sufficient punishment\" due to a month in custody before his release on bail, his bail conditions and the expected damage to his professional life.</p>', '154817185829062892_1634954516559459_3990136166874611712_n.jpg', 1, '2019-01-22 09:44:18', '2019-01-22', '09:44:18 PM', 0, 0, '0000-00-00 00:00:00', 1, 1, '2019-01-22 09:46:54'),
(3, 50, -1, '112 Rohingyas lost lives in 17 days', '<p>With this, so far, bodies of 112 Rohingya people, who lost lives in 23 incidents of boat capsize between 29 August and 14 September, were recovered.</p>\r\n<p>&ldquo;Two boats capsized in the bay near Pashchimpara of Shah Parirdwip on Thursday. She may have died in one of those incidents. Her very appearance says she is a Rohingya,&rdquo; said Teknaf model police station officer-in-charge Md Mainuddin Khan.</p>\r\n<p>&ldquo;I have directed locals to bury her as the body has started to decompose,&rdquo; he added.</p>\r\n<p>Meanwhile, a large number of Rohingya people are entering Bangladesh from Myanmar continuously through several points of Shah Parirdwip.</p>\r\n<p>Members of Border Guard Bangladesh are taking the Rohingyas to Whykong Putibunia temporary camp, said Teknaf-2 BGB commander Lieutenant Colonel SM Ariful Islam.</p>', '1548171923826.jpg', 1, '2019-01-22 09:45:23', '2019-01-22', '09:45:23 PM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(4, 50, 76, 'Volkswagen plans an electric hippie bus', '<p>Volkswagen will revisit its Microbus history, but with a twist. The German automaker plans to begin production of a new, all-electric version of the its famous van. The extremely groovy vehicle, called the ID Buzz, won\'t arrive in dealerships until 2022, VW said. The van will be part of Volkswagen\'s planned ID line of electric vehicles. The first, a compact car simply called the ID, was unveiled as a concept car at the Paris Motor Show last September. The ID Buzz concept van was unveiled at the Detroit Motor Show in January. The name Buzz plays off the word \"Bus,\" VW said. ID stands for any number of things including \"Idea,\" \"Identity\" or \"Intelligent Design.\" The electric compact car will go on sale before the van does, VW said.</p>\r\n<p>&nbsp;</p>\r\n<p>The ID Buzz concept van is an all-wheel-drive vehicle with electric motors in front and back. Together, the motors can produce 369 horsepower. That\'s a vast improvement over the famously underpowered and slow original VW Microbus, a vehicle that became an icon of the \"flower power\" movement of the late 1960s and early 1970s. The bus ID Buzz concept has a driving range of 270 miles, according to VW The concept van is also designed for autonomous driving, with a rectangular steering wheel that retracts into the dashboard when not in use. With the steering retracted, the driver\'s seat can be rotated around so the driver can talk with passengers while the van drives itself.</p>\r\n<p>&nbsp;</p>\r\n<p>A short test drive in the concept van demonstrated limitations to the rectangular steering wheel. It isn\'t really practical, making for awkward turns in real-world driving. (There\'s a reason steering wheels are generally round.) The actual production van will feature \"highly automated driving,\" according to VW, if not fully automated driving,</p>\r\n<p>&nbsp;</p>\r\n<p>VW\'s big push on electric vehicles follows the automaker\'s recent diesel emissions scandal. Volkswagen was found to have installed software that reduced harmful emissions from many of the automaker\'s diesel-powered vehicles only during testing. As part of a plan to make up for that, VW has agreed to promote electric cars.</p>\r\n<p>Many other automakers, however, are also making big plans for electric vehicles. And several countries, including Great Britain, France, Norway and China, have announced plans to begin phasing out gasoline- and</p>', '154817229749793779_527816821057640_1193479602337480704_n.jpg', 1, '2019-01-22 09:51:19', '2019-01-22', '09:51:19 PM', 0, 0, '0000-00-00 00:00:00', 1, 1, '2019-01-22 09:51:37'),
(5, 50, 76, 'New cyber attack hits Russia and Ukraine', '<p style=\"text-align: justify;\">Cybersecurity experts said the computer virus also appeared to have spread to Turkey and Germany as the day progressed -- but that its size appeared to be relatively small.</p>\r\n<p style=\"text-align: justify;\">Ukraine&rsquo;s Odessa International Airport said on Facebook that its &ldquo;information system&rdquo; stopped functioning in the afternoon. &ldquo;All airport services are working in a reinforced security regime,&rdquo; the airport said without elaborating.</p>\r\n<p style=\"text-align: justify;\">Its website showed air traffic going in and out of the Black Sea resort city according to schedule.</p>\r\n<p style=\"text-align: justify;\">Russia&rsquo;s Interfax news agency -- one of the country&rsquo;s biggest -- also sent its last dispatch at 2:13 pm (1113 GMT) before falling silent. A cyber security expert told AFP that the Fontanka news site in Russia&rsquo;s second city of Saint Petersburg and a third media outlet &ldquo;whose name, unfortunately, we cannot reveal at this time&rdquo; had also gone off line.</p>', '1548172328jjj.jpg', 1, '2019-01-22 09:52:08', '2019-01-22', '09:52:08 PM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(6, 50, 76, 'China unveils new leadership', '<p>Xi Jinping was elected general secretary of the Communist Party of China (CPC) Central Committee for the second term at the first plenary session of the 19th CPC Central Committee on Wednesday.</p>\r\n<p>Members of the newly elected Standing Committee of the Political Bureau of the 19th CPC Central Committee are Xi Jinping, Li Keqiang, Li Zhanshu, Wang Yang, Wang Huning, Zhao Leji and Han Zheng.</p>\r\n<p>Amid applause, Xi led the other six newly elected members of the Standing Committee of the Political Bureau of the CPC Central Committee into a brightly-lit room inside the grandiose Great Hall of the People, facing rows of eager journalists. Xi, 64, was flanked by Li Keqiang, Li Zhanshu, Wang Yang, Wang Huning, Zhao Leji and Han Zheng.</p>\r\n<p>He smiled, waved to the journalists and took the podium. \"I was re-elected general secretary of the CPC Central Committee,\" said a confident Xi against the backdrop of a giant Chinese landscape painting featuring the Great Wall.</p>\r\n<p>\"I see this as not just approval of my work, but also encouragement that will spur me on,\" he said. Xi thanked all other members of the Party for the trust they have placed in the new leadership and vowed to work diligently to \"meet our duty, fulfill our mission and be worthy of their trust.\" The coming five years, Xi said, will see several important junctures and signposts. \"Not only must we deliver the first centenary goal, we must also embark on the journey toward the second centenary goal,\" he said.</p>', '1548172351190.jpg', 1, '2019-01-22 09:52:31', '2019-01-22', '09:52:31 PM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `footer`
--

CREATE TABLE `footer` (
  `no` int(11) NOT NULL,
  `display_text` varchar(500) NOT NULL,
  `coloum` int(11) NOT NULL,
  `display_type` int(11) NOT NULL,
  `link` text NOT NULL,
  `serial_no` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `is_deleted` int(1) NOT NULL DEFAULT 0,
  `deleted_by` int(11) NOT NULL,
  `deleted_on` datetime NOT NULL,
  `is_updated` int(1) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gen_tags`
--

CREATE TABLE `gen_tags` (
  `tags_no` int(11) NOT NULL,
  `tags_name` varchar(255) NOT NULL,
  `tags_position` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `is_deleted` int(1) NOT NULL DEFAULT 0,
  `deleted_by` int(11) NOT NULL,
  `deleted_on` datetime NOT NULL,
  `is_updated` int(1) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `gen_tags`
--

INSERT INTO `gen_tags` (`tags_no`, `tags_name`, `tags_position`, `created_by`, `created_on`, `is_deleted`, `deleted_by`, `deleted_on`, `is_updated`, `updated_by`, `updated_on`) VALUES
(1, 'ছাত্র সংসদ', 1, 1, '2019-01-29 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(2, 'নির্বাচন', 2, 1, '2019-02-04 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `logo`
--

CREATE TABLE `logo` (
  `logo_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `is_updated` int(1) DEFAULT 0,
  `updated_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logo`
--

INSERT INTO `logo` (`logo_id`, `image_url`, `created_by`, `created_on`, `is_updated`, `updated_by`, `updated_on`) VALUES
(1, '1523088518logo_3.png', 0, '0000-00-00 00:00:00', 1, 0, '2018-04-07 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `photo_gallery`
--

CREATE TABLE `photo_gallery` (
  `photo_gallery_no` int(11) NOT NULL,
  `rest_no` int(11) NOT NULL,
  `rest_image` varchar(300) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_date` varchar(100) NOT NULL,
  `created_time` varchar(100) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `deleted_by` int(11) NOT NULL,
  `deleted_on` datetime NOT NULL,
  `is_updated` int(11) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `photo_gallery`
--

INSERT INTO `photo_gallery` (`photo_gallery_no`, `rest_no`, `rest_image`, `created_by`, `created_on`, `created_date`, `created_time`, `is_deleted`, `deleted_by`, `deleted_on`, `is_updated`, `updated_by`, `updated_on`) VALUES
(1, 1, '1575556223no9_8_ff5db7da-87af-4e82-8112-d83938b394b5.jpg', 1, '2019-12-05 08:28:04', '2019-12-05', '08:28:04 PM', 0, 0, '0000-00-00 00:00:00', 1, 1, '2019-12-05 08:30:23'),
(2, 1, '157555610916049446716_340f508dc8_z.jpg', 1, '2019-12-05 08:28:29', '2019-12-05', '08:28:29 PM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(3, 2, '157555620676199276_994357810918388_1817148930056519680_n.jpg', 1, '2019-12-05 08:28:44', '2019-12-05', '08:28:44 PM', 0, 0, '0000-00-00 00:00:00', 1, 1, '2019-12-05 08:30:06'),
(4, 1, '1575556174Indian-Restaurants-In-Australia-cover.jpg', 1, '2019-12-05 08:29:34', '2019-12-05', '08:29:34 PM', 0, 0, '0000-00-00 00:00:00', 1, 1, '2019-12-05 08:41:42'),
(5, 1, '1575556242Pay-for-the-veggies-food-item-not-your-restaurant-bills.jpg', 1, '2019-12-05 08:30:42', '2019-12-05', '08:30:42 PM', 0, 0, '0000-00-00 00:00:00', 1, 1, '2019-12-05 08:41:36'),
(6, 1, '1575556444tofu-rice-625_625x350_71467969111.webp', 1, '2019-12-05 08:34:04', '2019-12-05', '08:34:04 PM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(7, 7, '157568895620150915-_Upland_Burger_3.0.0.0.0.jpg', 1, '2019-12-07 09:22:36', '2019-12-07', '09:22:36 AM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(8, 5, '15756889675cc8c3cb20f77.image.jpg', 1, '2019-12-07 09:22:47', '2019-12-07', '09:22:47 AM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(9, 5, '1575688974Mega-Munch-640x360.jpg', 1, '2019-12-07 09:22:54', '2019-12-07', '09:22:54 AM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(10, 6, '1575688981i0gkbqma3ebejql3q2sv.jpg', 1, '2019-12-07 09:23:01', '2019-12-07', '09:23:01 AM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(11, 6, '1575688990the-eye-on-the-tyne.jpg', 1, '2019-12-07 09:23:10', '2019-12-07', '09:23:10 AM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(12, 4, '1575689001pepperoni-lovers.jpg', 1, '2019-12-07 09:23:21', '2019-12-07', '09:23:21 AM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(13, 4, '1575689011veggie-pasta-bake-f2437453.webp', 1, '2019-12-07 09:23:31', '2019-12-07', '09:23:31 AM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(14, 7, '1575689042Sausage-Pasta-Bake-featured-1.jpg', 1, '2019-12-07 09:24:02', '2019-12-07', '09:24:02 AM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(15, 7, '1575689049i0gkbqma3ebejql3q2sv.jpg', 1, '2019-12-07 09:24:09', '2019-12-07', '09:24:09 AM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(16, 7, '157568905899298023-hamburgers-and-french-fries-on-the-wooden-tray-.jpg', 1, '2019-12-07 09:24:18', '2019-12-07', '09:24:18 AM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(17, 3, '15756890835cc8c3cb20f77.image.jpg', 1, '2019-12-07 09:24:43', '2019-12-07', '09:24:43 AM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(18, 3, '157568908920150915-_Upland_Burger_3.0.0.0.0.jpg', 1, '2019-12-07 09:24:49', '2019-12-07', '09:24:49 AM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(19, 3, '1575689096delish-keto-pizza-073-1544039876.jpg', 1, '2019-12-07 09:24:56', '2019-12-07', '09:24:56 AM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(20, 3, '1575689103tuna_pasta_bake_lr_1.jpg', 1, '2019-12-07 09:25:03', '2019-12-07', '09:25:03 AM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(21, 3, '1575689109rrceou4uvzehiovektbg.jpg', 1, '2019-12-07 09:25:09', '2019-12-07', '09:25:09 AM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(22, 6, '1575689152pepperoni-lovers.jpg', 1, '2019-12-07 09:25:52', '2019-12-07', '09:25:52 AM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(23, 6, '1575689165tuna_pasta_bake_lr_1.jpg', 1, '2019-12-07 09:26:05', '2019-12-07', '09:26:05 AM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `reporter`
--

CREATE TABLE `reporter` (
  `reporter_no` int(11) NOT NULL,
  `reporter_name` varchar(255) NOT NULL,
  `reporter_position` int(111) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `is_deleted` int(1) NOT NULL DEFAULT 0,
  `deleted_by` int(11) NOT NULL,
  `deleted_on` datetime NOT NULL,
  `is_updated` int(1) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `reporter`
--

INSERT INTO `reporter` (`reporter_no`, `reporter_name`, `reporter_position`, `created_by`, `created_on`, `is_deleted`, `deleted_by`, `deleted_on`, `is_updated`, `updated_by`, `updated_on`) VALUES
(1, 'Nawsish Ahmed', 1, 1, '2019-02-04 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(2, 'Nasir Islam', 2, 1, '2019-02-04 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `rest_name`
--

CREATE TABLE `rest_name` (
  `rest_no` int(11) NOT NULL,
  `hotel_name` varchar(250) NOT NULL,
  `sub_title` varchar(250) NOT NULL,
  `contact` varchar(300) NOT NULL,
  `location` varchar(250) NOT NULL,
  `description` varchar(3000) NOT NULL,
  `image_url` varchar(300) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_date` varchar(100) NOT NULL,
  `created_time` varchar(100) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `deleted_by` int(11) NOT NULL,
  `deleted_on` datetime NOT NULL,
  `is_updated` int(11) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL,
  `review_count` int(255) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rest_name`
--

INSERT INTO `rest_name` (`rest_no`, `hotel_name`, `sub_title`, `contact`, `location`, `description`, `image_url`, `created_by`, `created_on`, `created_date`, `created_time`, `is_deleted`, `deleted_by`, `deleted_on`, `is_updated`, `updated_by`, `updated_on`, `review_count`) VALUES
(1, 'Yellow Leaf Hammocks', 'The Food House', '017XXXXXXXX', 'Dhanmondi', '<p style=\"box-sizing: border-box; margin: 1em 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 18px; line-height: inherit; font-family: AvenirNext, \'Helvetica Neue\', Helvetica, Arial, sans-serif; vertical-align: baseline; color: #33475b;\">When you have a great story about how your product or service was built to change lives, share it. The \"About Us\" page is a great place for it to live, too. Good stories humanize your brand, providing context and meaning for your product. What&rsquo;s more, good stories are sticky -- which means people are more likely to connect with them and pass them on.</p>\r\n<p style=\"box-sizing: border-box; margin: 1em 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 18px; line-height: inherit; font-family: AvenirNext, \'Helvetica Neue\', Helvetica, Arial, sans-serif; vertical-align: baseline; color: #33475b;\">Yellow Leaf Hammocks tells users about its product by describing how the hammocks empower artisan weavers and their families. The company breaks down different pieces of the story into sections that combine words and easily digestible graphics, painting a picture instead of big chunks of text. They\'re clear about why they\'re different: \"Not a Charity,\" the page reads. And then: \"This is the basis for a brighter future, built on a hand up, not a handout.\"</p>\r\n<p style=\"box-sizing: border-box; margin: 1em 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 18px; line-height: inherit; font-family: AvenirNext, \'Helvetica Neue\', Helvetica, Arial, sans-serif; vertical-align: baseline; color: #33475b;\">Every company has a story to tell, so break out your storytelling skills from that random English class you took years ago and put them to work on your \"About Us\" page. Using descriptive and emotive copy and gorgeous graphics, an \"About Us\" page with a story works harder for your business than a generic one.</p>', '1575604857three-col-1-2048x0.jpg', 1, '2019-12-05 08:38:56', '2019-12-05', '08:38:56 PM', 0, 0, '0000-00-00 00:00:00', 1, 1, '2019-12-06 10:13:35', 0),
(2, 'The spot', 'A Dinner Restaurant', '017XXXXXXXX', 'Uttora', '<p style=\"text-align: center;\"><span style=\"font-size: 16px; line-height: 20pt;\">Craving some delicious Greek food? Maybe you&rsquo;re in the mood for a juicy steak? No matter what kind of meal you have in mind, The Spot Restaurant is ready to prepare it for you.</span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: 16px; line-height: 20pt;\">Since 1973, The Spot Restaurant has been the go-to diner for residents of Binghamton, NY. Our diner serves breakfast all day, in addition to wholesome and flavorful dining options for lunch and dinner. From burgers to salads, seafood to pastas, you&rsquo;ll find all kinds of hearty meals prepared fresh at The Spot Restaurant. Our diner also has a full bakery with delicious baked goods and other treats, including our famous cheesecake. Sounds delicious, right?</span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: 16px; line-height: 20pt;\">The Spot Restaurant is open daily from 5 a.m. to 11 p.m. We&rsquo;re here to serve you the best food around, whenever you&rsquo;re looking for a great American restaurant in Binghamton, NY.</span></p>', '1575603143cheetos_sandwich_KFC.0.jpg', 1, '2019-12-06 09:32:23', '2019-12-06', '09:32:23 AM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0),
(3, 'Ninety Nine and Half', 'Restaurant & PUB For All', '019XXXXXXXX', 'Mirpur', '<h3>Our founder, Charlie Doe, had an idea to create a restaurant that was more than a place that served great food. Charlie wanted to give locals a place where they\'d always feel at home. A place where they could get no-nonsense food at down-to-earth prices, and where they\'d be treated right by people who had a passion to serve.</h3>\r\n<h3>The culture at the Ninety Nine Restaurants was instilled by Charlie Doe long before a mission statement was ever written down on paper and is still evident today. At the Ninety Nine, guests, team members and community are all treated with respect.&nbsp; We\'re loved for our hand-breaded Boneless Buffalo Wings, our signature Broiled Sirloin Tips, our famous tall, frosted mugs of beer and more. All are served in a distinctly hearty New England style, enjoyed over good times with great family and friends. Simple, honest, genuine food.&nbsp; &nbsp; Never pretentious. Always satisfying.</h3>', '1575604951tofu-rice-625_625x350_71467969111.webp', 1, '2019-12-06 09:35:38', '2019-12-06', '09:35:38 AM', 0, 0, '0000-00-00 00:00:00', 1, 1, '2019-12-06 10:02:31', 9),
(4, 'The Dove Restaurant', 'For Food Lovers', '017XXXXXXXX', 'Uttora', '<h2>The Dove Restaurant is one of the top restaurants in Orchard Park - just ask our regular customers. We combine our own family recipes with style and personal flair to create a unique experience every time you visit us. We strive to make each visit satisfying and memorable.</h2>\r\n<h2>The Dove Restaurant has continually provided each of its guests with only the finest in Italian-Continental cuisine since 2003. The Dove specializes in creating a uniquely thoughtful atmosphere, which will not only excite one\'s tastes, but provide the perfect dining experience.</h2>\r\n<h2>Our restaurant, which used to be The Pony Post back \"in the day\", is located near the borders of Orchard Park, West Seneca, Hamburg and Lackawanna, NY, and features dishes ranging from mouthwatering steaks, seafood, and chicken to an assortment of appetizers, pastas and fresh salads.</h2>\r\n<h2>While everything on the Dove\'s delicious lunch and dinner menus are always cooked to perfection, there are a few standout dishes that can not go without special mention:</h2>\r\n<h2>\"Our 12oz. Prime Pork Chop\" - grilled to perfection and topped off with a variety of sauces;\"Shrimp Scampi\" - served in our unique style, with lemon and butter drizzled over the dish, and complimented with a side of pasta;</h2>\r\n<h2>\"Our Linguine Shrimp and Clams\" - my personal favorite, can be served in either our homemade red or white sauce.For those who have a sweet tooth, we offer homemade desserts like Italian style cheesecake, tiramisu and cannoli.Our newest addition, which we are extremely proud of, is our extensive Gluten-Free menu. It is available for both lunch and dinner.</h2>\r\n<p style=\"margin: 0px; padding: 0px; overflow-wrap: break-word; color: #5c5c5c; font-family: Georgia, serif; font-size: 16px; background-color: #e6e6e6;\">&nbsp;</p>', '1575603583image-placeholder-title.jpg', 1, '2019-12-06 09:39:43', '2019-12-06', '09:39:43 AM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0),
(5, 'Coalition Restaurant', 'The Food House', '019XXXXXXXX', 'Mirpur', '<h3>Wollenzien has partnered with general manager and co-owner Deacon Eells and the two have a long, storied history growing up together in small town River Falls, WI, moving and immersing themselves in a variety of Twin Cities restaurants, and now returning to a close knit community for their first solo venture. The menu takes its inspiration from classic American dishes like beef, lamb, pork and walleye, creatively prepared, vibrantly presented, and influenced by cuisines around the world reflecting the global, sophisticated, expanded palates of today. The restaurant is located in a historic Excelsior brick building dating from 1886. Creating a sense of the natural evolution of the building was a goal of the designer, Kara Karpenske of Kamarron Design, Inc. (KDI) of Edina. New rustic floors, tall booths, oversized chandeliers, and industrial lighting enhance the look of the exposed original brick. Antiqued mirrored panels set off the white marble design bar top and warm toned leather bar stools create an inviting space to enjoy Chef Eli&rsquo;s crafted cocktail menu regionally sourced from such boutique distilleries as 45th Parallel Vodka (New Richmond, WI), North Shore Gin #11 (Lake Bluff, IL), Cedar Ridge Iowa Bourbon (Swisher, Iowa), and locally produced Bittercube Bitters (Minneapolis, MN). A large selection of wine and MN sourced tap beers complement the full bar.</h3>\r\n<h3 style=\"background: none #f8f7f2; border: 0px; line-height: 1.5em; list-style: none; margin: 1em 0px; padding: 0px; color: #999999; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-size: 16px; outline: none !important;\">&nbsp;</h3>', '1575603768Hand-Made-Burger-2.jpg', 1, '2019-12-06 09:42:48', '2019-12-06', '09:42:48 AM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0),
(6, 'Legends restaurant', 'A Dinner Restaurant & BAR', '019XXXXXXXX', 'Dhanmondi', '<h3>Opened in 1993 by Diane and Dennis Harkoff, Legends offers &ldquo;The Best of Both Worlds:&rdquo; fine dining in two distinct sections &ndash; the sophisticated, cozy and eclectic dining room, and the classic-style bar with rich, warm woods and brass accents &ndash; that both serve the same innovative food. The menu is updated seasonally to reflect what&rsquo;s best on the farmstands and in the water, but old favorites remain a constant. Legends is open year round for lunch and dinner, with a late-night menu available, and is the perfect setting for a romantic dinner or a family gathering. Come visit this beloved longtime North Fork destination.&nbsp; Our chef prepares dishes that highlight locally sourced ingredients such as fresh-caught fish paired with seasonal vegetables, and he&rsquo;ll often use an unusual preparation or seasoning to add interest to the traditional.</h3>', '1575604826no9_8_ff5db7da-87af-4e82-8112-d83938b394b5.jpg', 1, '2019-12-06 10:00:26', '2019-12-06', '10:00:26 AM', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0),
(7, 'Restaurant Barun', 'over 30 years of tradition', '017XXXXXXXX', 'Mogbazar', '<p style=\"box-sizing: border-box; margin: 15px 0px; line-height: 26px; color: #434343; font-family: \'Lato Regular\'; font-size: 16px;\">Welcome to our restaurant Barun that is proud of its long family tradition. Over 30 years of experience in preparing great food with sincere hospitality are a guarantee that you will have a great time and tasty food at our place.</p>\r\n<p style=\"box-sizing: border-box; margin: 15px 0px; line-height: 26px; color: #434343; font-family: \'Lato Regular\'; font-size: 16px;\">Our guests are offered the rich menu and the wide choice of meals and quality wines. Beside popular \"gradele\" - a Dalmatian name for barbecue - we prepare meals in our wood stove.</p>\r\n<p style=\"box-sizing: border-box; margin: 15px 0px; line-height: 26px; color: #434343; font-family: \'Lato Regular\'; font-size: 16px;\">We especially recommend fresh fish and seafood specialties. All our meat is domestic, and all the vegetables we serve are fresh and home grown from our garden, so you are sure to get only the best.</p>\r\n<p style=\"box-sizing: border-box; margin: 15px 0px; line-height: 26px; color: #434343; font-family: \'Lato Regular\'; font-size: 16px;\">The restaurant is 200 m from the sea and has a spacious terrace, providing relaxing atmosphere for you to enjoy your meal in our restaurant. We will be happy to welcome you at restaurant Barun.</p>', '1575606154BBWe4zt.jpg', 1, '2019-12-06 10:11:49', '2019-12-06', '10:11:49 AM', 0, 0, '0000-00-00 00:00:00', 1, 1, '2019-12-06 10:22:34', 0);

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `slider_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `title_h1` text NOT NULL,
  `title_h2` text NOT NULL,
  `title_h3` text NOT NULL,
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
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`slider_id`, `image_url`, `title_h1`, `title_h2`, `title_h3`, `created_by`, `created_on`, `is_deleted`, `deleted_by`, `deleted_on`, `is_updated`, `updated_by`, `updated_on`) VALUES
(1, '1521640022banner1.jpg', 'MEDICAL MARKETING', 'TOOLKIT', 'Ali Asadi', 0, '2018-03-21 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(2, '1521640055banner2.jpg', 'FANDAMENTAL OF MEDICAL', 'PRACTICE INVESTIGATION', 'Jeffrey D. Lane', 0, '2018-03-21 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(3, '1521887893pic5.jpg', 'Title One for slider', 'Title two for slider', 'Title three for slider', 0, '2018-03-24 00:00:00', 1, 0, '2018-04-24 00:00:00', 0, 0, '0000-00-00 00:00:00'),
(4, '1524838217Chrysanthemum.jpg', 'test', 'test2', 'test3', 0, '2018-04-27 00:00:00', 1, 0, '2018-04-27 00:00:00', 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `video_gallery`
--

CREATE TABLE `video_gallery` (
  `video_gallery_no` int(11) NOT NULL,
  `headline` varchar(300) NOT NULL,
  `details` mediumtext NOT NULL,
  `image_url` varchar(200) NOT NULL,
  `video_url` varchar(3500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_date` varchar(100) NOT NULL,
  `created_time` varchar(100) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `deleted_by` int(11) NOT NULL,
  `deleted_on` datetime NOT NULL,
  `is_updated` int(11) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `video_gallery`
--

INSERT INTO `video_gallery` (`video_gallery_no`, `headline`, `details`, `image_url`, `video_url`, `created_by`, `created_on`, `created_date`, `created_time`, `is_deleted`, `deleted_by`, `deleted_on`, `is_updated`, `updated_by`, `updated_on`) VALUES
(1, 'হেলমেট মাথায় মাঠে রাশিয়ার প্রেসিডেন্ট পুতিন', '<p>মাথায় সাদা রঙয়ের হেলমেট, পায়ে প্যাড ও হাতে স্কেটস পড়ে গাড়ি থেকে নামলেন রাশিয়ার প্রেসিডেন্ট ভ্লাদিমির পুতিন। ঢুকে পড়লেন মস্কোর রেড স্কয়ারে। ঐতিহ্য বজায় রাখতে গত বছরের শেষের দিকে খেললেন আইস হকি। &lsquo;অ্যামেচার নাইট হকি লিগে&rsquo;র একটি ম্যাচে অংশগ্রহণ করেন তিনি।২০১১ সাল থেকে এই ধারাবাহিকতা তিনি বজায় রেখেছেন। ওই ম্যাচে পুতিন ছাড়াও অংশগ্রহণ করেছিলেন রাশিয়ার প্রতিরক্ষা মন্ত্রী সের্গেই শোইগু। এছাড়া সে দেশের বিখ্যাত আইস হকি খেলোয়াড় ভ্যাচেস্লাভ ফেটিসভ ও পাভেল বুরেও পুতিনের সঙ্গে এই ম্যাচ খেলেছেন।</p>', '154917874727750526_2079591325605002_603479267116074166_n.jpg', '<iframe width=\"700\" height=\"480\" src=\"https://www.youtube.com/embed/h1iXsOt8xZM\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 1, '2019-02-03 01:25:47', '2019-02-03', '01:25:47 PM', 0, 0, '0000-00-00 00:00:00', 1, 1, '2019-02-03 01:59:15');

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_no`),
  ADD KEY `category_no` (`category_no`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_reg`
--
ALTER TABLE `customer_reg`
  ADD PRIMARY KEY (`customer_reg_no`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`document_no`);

--
-- Indexes for table `english_news`
--
ALTER TABLE `english_news`
  ADD PRIMARY KEY (`english_news_no`);

--
-- Indexes for table `footer`
--
ALTER TABLE `footer`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `gen_tags`
--
ALTER TABLE `gen_tags`
  ADD PRIMARY KEY (`tags_no`);

--
-- Indexes for table `logo`
--
ALTER TABLE `logo`
  ADD PRIMARY KEY (`logo_id`);

--
-- Indexes for table `photo_gallery`
--
ALTER TABLE `photo_gallery`
  ADD PRIMARY KEY (`photo_gallery_no`);

--
-- Indexes for table `reporter`
--
ALTER TABLE `reporter`
  ADD PRIMARY KEY (`reporter_no`);

--
-- Indexes for table `rest_name`
--
ALTER TABLE `rest_name`
  ADD PRIMARY KEY (`rest_no`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`slider_id`);

--
-- Indexes for table `video_gallery`
--
ALTER TABLE `video_gallery`
  ADD PRIMARY KEY (`video_gallery_no`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `author_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_reg`
--
ALTER TABLE `customer_reg`
  MODIFY `customer_reg_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `document_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `english_news`
--
ALTER TABLE `english_news`
  MODIFY `english_news_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `footer`
--
ALTER TABLE `footer`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gen_tags`
--
ALTER TABLE `gen_tags`
  MODIFY `tags_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `logo`
--
ALTER TABLE `logo`
  MODIFY `logo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `photo_gallery`
--
ALTER TABLE `photo_gallery`
  MODIFY `photo_gallery_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `reporter`
--
ALTER TABLE `reporter`
  MODIFY `reporter_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rest_name`
--
ALTER TABLE `rest_name`
  MODIFY `rest_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `slider_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `video_gallery`
--
ALTER TABLE `video_gallery`
  MODIFY `video_gallery_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xxx_user`
--
ALTER TABLE `xxx_user`
  MODIFY `user_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
