SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `Wolf`
--
CREATE DATABASE IF NOT EXISTS `Wolf` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `Wolf`;

-- --------------------------------------------------------

--
-- Table structure for table `Deaths`
--

CREATE TABLE `Deaths` (
  `match_id` int(10) unsigned NOT NULL,
  `killer` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `victim` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `weapon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Match`
--

CREATE TABLE `Match` (
`match_id` int(10) unsigned NOT NULL,
  `mapname` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Stats`
--

CREATE TABLE `Stats` (
  `match_id` int(10) unsigned NOT NULL,
  `client_uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `client_name` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `player_num` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `w0_atts` int(11) NOT NULL,
  `w0_deaths` int(11) NOT NULL,
  `w0_hs` int(11) NOT NULL,
  `w0_hits` int(11) NOT NULL,
  `w0_kills` int(11) NOT NULL,
  `w1_atts` int(11) NOT NULL,
  `w1_deaths` int(11) NOT NULL,
  `w1_hs` int(11) NOT NULL,
  `w1_hits` int(11) NOT NULL,
  `w1_kills` int(11) NOT NULL,
  `w2_atts` int(11) NOT NULL,
  `w2_deaths` int(11) NOT NULL,
  `w2_hs` int(11) NOT NULL,
  `w2_hits` int(11) NOT NULL,
  `w2_kills` int(11) NOT NULL,
  `w3_atts` int(11) NOT NULL,
  `w3_deaths` int(11) NOT NULL,
  `w3_hs` int(11) NOT NULL,
  `w3_hits` int(11) NOT NULL,
  `w3_kills` int(11) NOT NULL,
  `w4_atts` int(11) NOT NULL,
  `w4_deaths` int(11) NOT NULL,
  `w4_hs` int(11) NOT NULL,
  `w4_hits` int(11) NOT NULL,
  `w4_kills` int(11) NOT NULL,
  `w5_atts` int(11) NOT NULL,
  `w5_deaths` int(11) NOT NULL,
  `w5_hs` int(11) NOT NULL,
  `w5_hits` int(11) NOT NULL,
  `w5_kills` int(11) NOT NULL,
  `w6_atts` int(11) NOT NULL,
  `w6_deaths` int(11) NOT NULL,
  `w6_hs` int(11) NOT NULL,
  `w6_hits` int(11) NOT NULL,
  `w6_kills` int(11) NOT NULL,
  `w7_atts` int(11) NOT NULL,
  `w7_deaths` int(11) NOT NULL,
  `w7_hs` int(11) NOT NULL,
  `w7_hits` int(11) NOT NULL,
  `w7_kills` int(11) NOT NULL,
  `w8_atts` int(11) NOT NULL,
  `w8_deaths` int(11) NOT NULL,
  `w8_hs` int(11) NOT NULL,
  `w8_hits` int(11) NOT NULL,
  `w8_kills` int(11) NOT NULL,
  `w9_atts` int(11) NOT NULL,
  `w9_deaths` int(11) NOT NULL,
  `w9_hs` int(11) NOT NULL,
  `w9_hits` int(11) NOT NULL,
  `w9_kills` int(11) NOT NULL,
  `w10_atts` int(11) NOT NULL,
  `w10_deaths` int(11) NOT NULL,
  `w10_hs` int(11) NOT NULL,
  `w10_hits` int(11) NOT NULL,
  `w10_kills` int(11) NOT NULL,
  `w11_atts` int(11) NOT NULL,
  `w11_deaths` int(11) NOT NULL,
  `w11_hs` int(11) NOT NULL,
  `w11_hits` int(11) NOT NULL,
  `w11_kills` int(11) NOT NULL,
  `w12_atts` int(11) NOT NULL,
  `w12_deaths` int(11) NOT NULL,
  `w12_hs` int(11) NOT NULL,
  `w12_hits` int(11) NOT NULL,
  `w12_kills` int(11) NOT NULL,
  `w13_atts` int(11) NOT NULL,
  `w13_deaths` int(11) NOT NULL,
  `w13_hs` int(11) NOT NULL,
  `w13_hits` int(11) NOT NULL,
  `w13_kills` int(11) NOT NULL,
  `w14_atts` int(11) NOT NULL,
  `w14_deaths` int(11) NOT NULL,
  `w14_hs` int(11) NOT NULL,
  `w14_hits` int(11) NOT NULL,
  `w14_kills` int(11) NOT NULL,
  `w15_atts` int(11) NOT NULL,
  `w15_deaths` int(11) NOT NULL,
  `w15_hs` int(11) NOT NULL,
  `w15_hits` int(11) NOT NULL,
  `w15_kills` int(11) NOT NULL,
  `w16_atts` int(11) NOT NULL,
  `w16_deaths` int(11) NOT NULL,
  `w16_hs` int(11) NOT NULL,
  `w16_hits` int(11) NOT NULL,
  `w16_kills` int(11) NOT NULL,
  `w17_atts` int(11) NOT NULL,
  `w17_deaths` int(11) NOT NULL,
  `w17_hs` int(11) NOT NULL,
  `w17_hits` int(11) NOT NULL,
  `w17_kills` int(11) NOT NULL,
  `w18_atts` int(11) NOT NULL,
  `w18_deaths` int(11) NOT NULL,
  `w18_hs` int(11) NOT NULL,
  `w18_hits` int(11) NOT NULL,
  `w18_kills` int(11) NOT NULL,
  `w19_atts` int(11) NOT NULL,
  `w19_deaths` int(11) NOT NULL,
  `w19_hs` int(11) NOT NULL,
  `w19_hits` int(11) NOT NULL,
  `w19_kills` int(11) NOT NULL,
  `w20_atts` int(11) NOT NULL,
  `w20_deaths` int(11) NOT NULL,
  `w20_hs` int(11) NOT NULL,
  `w20_hits` int(11) NOT NULL,
  `w20_kills` int(11) NOT NULL,
  `w21_atts` int(11) NOT NULL,
  `w21_deaths` int(11) NOT NULL,
  `w21_hs` int(11) NOT NULL,
  `w21_hits` int(11) NOT NULL,
  `w21_kills` int(11) NOT NULL,
  `w22_atts` int(11) NOT NULL,
  `w22_deaths` int(11) NOT NULL,
  `w22_hs` int(11) NOT NULL,
  `w22_hits` int(11) NOT NULL,
  `w22_kills` int(11) NOT NULL,
  `w23_atts` int(11) NOT NULL,
  `w23_deaths` int(11) NOT NULL,
  `w23_hs` int(11) NOT NULL,
  `w23_hits` int(11) NOT NULL,
  `w23_kills` int(11) NOT NULL,
  `w24_atts` int(11) NOT NULL,
  `w24_deaths` int(11) NOT NULL,
  `w24_hs` int(11) NOT NULL,
  `w24_hits` int(11) NOT NULL,
  `w24_kills` int(11) NOT NULL,
  `w25_atts` int(11) NOT NULL,
  `w25_deaths` int(11) NOT NULL,
  `w25_hs` int(11) NOT NULL,
  `w25_hits` int(11) NOT NULL,
  `w25_kills` int(11) NOT NULL,
  `battlesense` int(11) NOT NULL,
  `engineering` int(11) NOT NULL,
  `medic` int(11) NOT NULL,
  `fieldops` int(11) NOT NULL,
  `lightweapons` int(11) NOT NULL,
  `heavyweapons` int(11) NOT NULL,
  `covertops` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Deaths`
--
ALTER TABLE `Deaths`
 ADD KEY `match_id` (`match_id`);

--
-- Indexes for table `Match`
--
ALTER TABLE `Match`
 ADD PRIMARY KEY (`match_id`), ADD KEY `created_on` (`created_on`);

--
-- Indexes for table `Stats`
--
ALTER TABLE `Stats`
 ADD KEY `match_id` (`match_id`);

--
-- AUTO_INCREMENT for table `Match`
--
ALTER TABLE `Match`
MODIFY `match_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
