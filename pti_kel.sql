-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2023 at 04:40 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pti_kel`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_hardware`
--

CREATE TABLE `data_hardware` (
  `id_hardware` int(11) NOT NULL,
  `speed` varchar(10) NOT NULL,
  `tipe` varchar(20) NOT NULL,
  `seri` varchar(50) NOT NULL,
  `hard_drive` varchar(10) NOT NULL,
  `model` varchar(20) NOT NULL,
  `ram` varchar(10) NOT NULL,
  `manufacture` varchar(20) NOT NULL,
  `kategori` varchar(10) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_pegawai`
--

CREATE TABLE `data_pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `unit` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_software`
--

CREATE TABLE `data_software` (
  `id_software` int(11) NOT NULL,
  `publisher` varchar(50) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `lisensi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_software`
--

INSERT INTO `data_software` (`id_software`, `publisher`, `judul`, `lisensi`) VALUES
(1, 'Microsoft', 'MS.Office 2010', '100'),
(2, 'Microsoft', 'Ms.Project 2010', '25'),
(3, 'Adobe', 'Photoshop 5', '30'),
(4, 'Norton', 'Norton Antivirus 2016', '100');

-- --------------------------------------------------------

--
-- Table structure for table `instalansi`
--

CREATE TABLE `instalansi` (
  `id_instalansi` int(11) NOT NULL,
  `id_hardware` int(11) NOT NULL,
  `id_software` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_hardware`
--
ALTER TABLE `data_hardware`
  ADD PRIMARY KEY (`id_hardware`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `data_pegawai`
--
ALTER TABLE `data_pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `data_software`
--
ALTER TABLE `data_software`
  ADD PRIMARY KEY (`id_software`);

--
-- Indexes for table `instalansi`
--
ALTER TABLE `instalansi`
  ADD PRIMARY KEY (`id_instalansi`),
  ADD KEY `id_hardware` (`id_hardware`,`id_software`),
  ADD KEY `id_software` (`id_software`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_hardware`
--
ALTER TABLE `data_hardware`
  MODIFY `id_hardware` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `data_pegawai`
--
ALTER TABLE `data_pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `data_software`
--
ALTER TABLE `data_software`
  MODIFY `id_software` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `instalansi`
--
ALTER TABLE `instalansi`
  MODIFY `id_instalansi` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_hardware`
--
ALTER TABLE `data_hardware`
  ADD CONSTRAINT `data_hardware_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `data_pegawai` (`id_pegawai`);

--
-- Constraints for table `instalansi`
--
ALTER TABLE `instalansi`
  ADD CONSTRAINT `instalansi_ibfk_1` FOREIGN KEY (`id_software`) REFERENCES `data_software` (`id_software`),
  ADD CONSTRAINT `instalansi_ibfk_2` FOREIGN KEY (`id_hardware`) REFERENCES `data_hardware` (`id_hardware`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
