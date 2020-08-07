-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2020 at 05:18 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dokumen`
--

CREATE TABLE `dokumen` (
  `Nama_Survei` varchar(20) NOT NULL,
  `Jenis_Survei` varchar(20) NOT NULL,
  `Nama_Petugas` varchar(20) NOT NULL,
  `Tanggal_Masuk` int(10) NOT NULL,
  `Nama_Responden` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_survei`
--

CREATE TABLE `jenis_survei` (
  `Nama_Survei` varchar(20) NOT NULL,
  `Waktu_Survei` int(10) DEFAULT NULL,
  `Target_Survei` int(10) DEFAULT NULL,
  `periode_pencacahan` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `Nama_Petugas` varchar(20) NOT NULL,
  `Jabatan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `dokumen`
--
ALTER TABLE `dokumen`
  ADD KEY `Nama_Survei` (`Nama_Survei`),
  ADD KEY `Nama_Petugas` (`Nama_Petugas`);

--
-- Indexes for table `jenis_survei`
--
ALTER TABLE `jenis_survei`
  ADD PRIMARY KEY (`Nama_Survei`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`Nama_Petugas`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dokumen`
--
ALTER TABLE `dokumen`
  ADD CONSTRAINT `Nama_Petugas` FOREIGN KEY (`Nama_Petugas`) REFERENCES `petugas` (`Nama_Petugas`),
  ADD CONSTRAINT `Nama_Survei` FOREIGN KEY (`Nama_Survei`) REFERENCES `jenis_survei` (`Nama_Survei`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
