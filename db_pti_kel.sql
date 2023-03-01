-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Mar 2023 pada 13.34
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pti_kel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_hardware`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `data_hardware`
--

INSERT INTO `data_hardware` (`id_hardware`, `speed`, `tipe`, `seri`, `hard_drive`, `model`, `ram`, `manufacture`, `kategori`, `id_pegawai`) VALUES
(11, '3,2 Ghz', 'Pentium 4', '4765-56-7543', '160 GB', 'E-6100', '1 GB', 'Gateway', 'Desktop', 5),
(12, '2,6 Ghz', 'Pentium 4', '9879-34-2856', '80 GB', 'XW 4101', '1 GB', 'HP', 'Desktop', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_pegawai`
--

CREATE TABLE `data_pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `unit` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `data_pegawai`
--

INSERT INTO `data_pegawai` (`id_pegawai`, `nama`, `unit`) VALUES
(5, 'Andianto', 'Pemasaran'),
(6, 'Fita Amaro', 'Admin'),
(7, 'Sony', 'PTI'),
(8, 'Yanto', 'Manager'),
(9, 'Susi', 'Personalia'),
(10, 'Beny', 'Direktur'),
(11, 'Rudy', 'Keuangan'),
(12, 'Veni', 'Programer'),
(13, 'Erlin Novita', 'SDM');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_software`
--

CREATE TABLE `data_software` (
  `id_software` int(11) NOT NULL,
  `publisher` varchar(50) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `lisensi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `data_software`
--

INSERT INTO `data_software` (`id_software`, `publisher`, `judul`, `lisensi`) VALUES
(1, 'Microsoft', 'MS.Office 2010', '100'),
(2, 'Microsoft', 'Ms.Project 2010', '25'),
(3, 'Adobe', 'Photoshop 5', '30'),
(4, 'Norton', 'Norton Antivirus 2016', '100');

-- --------------------------------------------------------

--
-- Struktur dari tabel `instalansi`
--

CREATE TABLE `instalansi` (
  `id_instalansi` int(11) NOT NULL,
  `id_hardware` int(11) NOT NULL,
  `id_software` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_hardware`
--
ALTER TABLE `data_hardware`
  ADD PRIMARY KEY (`id_hardware`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indeks untuk tabel `data_pegawai`
--
ALTER TABLE `data_pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indeks untuk tabel `data_software`
--
ALTER TABLE `data_software`
  ADD PRIMARY KEY (`id_software`);

--
-- Indeks untuk tabel `instalansi`
--
ALTER TABLE `instalansi`
  ADD PRIMARY KEY (`id_instalansi`),
  ADD KEY `id_hardware` (`id_hardware`,`id_software`),
  ADD KEY `id_software` (`id_software`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data_hardware`
--
ALTER TABLE `data_hardware`
  MODIFY `id_hardware` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `data_pegawai`
--
ALTER TABLE `data_pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `data_software`
--
ALTER TABLE `data_software`
  MODIFY `id_software` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `instalansi`
--
ALTER TABLE `instalansi`
  MODIFY `id_instalansi` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `data_hardware`
--
ALTER TABLE `data_hardware`
  ADD CONSTRAINT `data_hardware_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `data_pegawai` (`id_pegawai`);

--
-- Ketidakleluasaan untuk tabel `instalansi`
--
ALTER TABLE `instalansi`
  ADD CONSTRAINT `instalansi_ibfk_1` FOREIGN KEY (`id_software`) REFERENCES `data_software` (`id_software`),
  ADD CONSTRAINT `instalansi_ibfk_2` FOREIGN KEY (`id_hardware`) REFERENCES `data_hardware` (`id_hardware`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
