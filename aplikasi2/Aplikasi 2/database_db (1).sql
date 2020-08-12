-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Agu 2020 pada 14.56
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Struktur dari tabel `data`
--

CREATE TABLE `data` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokumen`
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
-- Struktur dari tabel `jenis_survei`
--

CREATE TABLE `jenis_survei` (
  `Nama_Survei` varchar(20) NOT NULL,
  `Waktu_Survei` int(10) DEFAULT NULL,
  `Target_Survei` int(10) DEFAULT NULL,
  `periode_pencacahan` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jenis_survei`
--

INSERT INTO `jenis_survei` (`Nama_Survei`, `Waktu_Survei`, `Target_Survei`, `periode_pencacahan`) VALUES
('AJR', 30, 2, 'TAHUNAN'),
('APBD dan realisasi A', 30, 1, 'TAHUNAN'),
('HK 4 % 5', 10, 83, 'BULANAN'),
('HPS', 15, 6, 'BULANAN'),
('PAW', 60, 187, 'TAHUNAN'),
('PJ', 30, 1, 'TAHUNAN'),
('POLDIS', 30, 13, 'TAHUNAN'),
('SDT', 20, 10, 'TRIWULAN'),
('SHMP', 20, 5, 'TRIWULAN'),
('SHPP', 20, 2, 'TRIWULAN'),
('SPHB', 20, 60, 'BULANAN'),
('Survei Angkutan Bara', 20, 1, 'TRIWULAN'),
('Survei Ecommerce', 60, 225, 'TAHINAN'),
('Survei Harga Kemahal', 10, 32, 'TRIWULAN'),
('Survei Lembaga Keuan', 60, 0, 'TAHUNAN'),
('Updating Direktori P', 60, 60, 'TAHUNAN'),
('Updating Usaha Perda', 60, 273, 'TAHUNAN'),
('VDTW', 60, 8, 'TAHUNAN'),
('VHTL', 60, 117, 'TAHUNAN'),
('VHTS', 20, 53, 'BULANAN'),
('VREST-UMB', 60, 45, 'TAHUNAN'),
('VREST-UMK', 60, 25, 'TAHUNAN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `Nama_Petugas` varchar(20) NOT NULL,
  `Jabatan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`Nama_Petugas`, `Jabatan`) VALUES
('A Maradona', 'ORGANIK'),
('A Raidi', 'ORGANIK'),
('Agus Sarjono', 'ORGANIK'),
('Ahmad Erwin Alviansa', 'MITRA'),
('Ahmad Nur Ramadhani', 'MITRA'),
('Akhmad Riadi', 'ORGANIK'),
('Anggi Budi Pratiwi', 'ORGANIK'),
('Aprilia Puspita S', 'ORGANIK'),
('Ardiyanti', 'MITRA'),
('Astri Kumala', 'MITRA'),
('Bagus Prio', 'ORGANIK'),
('Bagus PS', 'ORGANIK'),
('Basuki', 'ORGANIK'),
('Bela Sri Kiswati', 'MITRA'),
('Burlian', 'MITRA'),
('Dede Vitriah', 'MITRA'),
('Depi Deswati', 'MITRA'),
('Dewi Rahmasari', 'ORGANIK'),
('Dewi Rahmawati', 'ORGANIK'),
('Diana Dian', 'MITRA'),
('Edy Kurniawan', 'ORGANIK'),
('Egik Nopriyando', 'MITRA'),
('Evie Ermawati', 'ORGANIK'),
('Fahroni Agustarita', 'ORGANIK'),
('Farida Iriyani', 'ORGANIK'),
('Gustiawati', 'MITRA'),
('Imam Thohari', 'ORGANIK'),
('Indra Kurniawan', 'ORGANIK'),
('Isnawati', 'MITRA'),
('Kaisar', 'ORGANIK'),
('Marlina', 'MITRA'),
('Micke Irmawati', 'MITRA'),
('Nanang Qosim', 'ORGANIK'),
('Nur A. Ramadhani', 'MITRA'),
('Rahman Eric Msd', 'MITRA'),
('Rukiyah', 'MITRA'),
('Santi Novitasari', 'ORGANIK'),
('Sari Citra Pratiwi', 'ORGANIK'),
('Sobirin', 'ORGANIK'),
('Sri Susilawati', 'ORGANIK'),
('Sukmawati', 'MITRA'),
('Sumiati', 'MITRA '),
('Supartini', 'MITRA'),
('Taufik Mauludin', 'MITRA'),
('Tri Aprilia', 'ORGANIK'),
('Ujang Sabirin', 'ORGANIK'),
('Wahyu Marifia N', 'MITRA'),
('Winda Defita', 'MITRA');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `dokumen`
--
ALTER TABLE `dokumen`
  ADD KEY `Nama_Survei` (`Nama_Survei`),
  ADD KEY `Nama_Petugas` (`Nama_Petugas`);

--
-- Indeks untuk tabel `jenis_survei`
--
ALTER TABLE `jenis_survei`
  ADD PRIMARY KEY (`Nama_Survei`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`Nama_Petugas`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `dokumen`
--
ALTER TABLE `dokumen`
  ADD CONSTRAINT `Nama_Petugas` FOREIGN KEY (`Nama_Petugas`) REFERENCES `petugas` (`Nama_Petugas`),
  ADD CONSTRAINT `Nama_Survei` FOREIGN KEY (`Nama_Survei`) REFERENCES `jenis_survei` (`Nama_Survei`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
