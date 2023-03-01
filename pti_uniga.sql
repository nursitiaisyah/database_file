-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Feb 2023 pada 04.27
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pti_uniga`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_config`
--

CREATE TABLE `t_config` (
  `cid` int(11) NOT NULL,
  `hid` int(11) NOT NULL,
  `sid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_hardware`
--

CREATE TABLE `t_hardware` (
  `hid` int(11) NOT NULL,
  `speed` varchar(10) NOT NULL,
  `hdd` varchar(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `serial` varchar(25) NOT NULL,
  `model` varchar(20) NOT NULL,
  `manufakture` varchar(20) NOT NULL,
  `kategori` varchar(20) NOT NULL,
  `ram` varchar(15) NOT NULL,
  `kid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_karyawan`
--

CREATE TABLE `t_karyawan` (
  `kid` int(11) NOT NULL,
  `nama_karyawan` varchar(40) NOT NULL,
  `unit_kerja` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_software`
--

CREATE TABLE `t_software` (
  `sid` int(11) NOT NULL,
  `publiser` varchar(25) NOT NULL,
  `judul` varchar(25) NOT NULL,
  `lesensi` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `t_config`
--
ALTER TABLE `t_config`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `hid` (`hid`,`sid`),
  ADD KEY `sid` (`sid`);

--
-- Indeks untuk tabel `t_hardware`
--
ALTER TABLE `t_hardware`
  ADD PRIMARY KEY (`hid`);

--
-- Indeks untuk tabel `t_karyawan`
--
ALTER TABLE `t_karyawan`
  ADD PRIMARY KEY (`kid`);

--
-- Indeks untuk tabel `t_software`
--
ALTER TABLE `t_software`
  ADD PRIMARY KEY (`sid`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `t_config`
--
ALTER TABLE `t_config`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t_hardware`
--
ALTER TABLE `t_hardware`
  MODIFY `hid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `t_karyawan`
--
ALTER TABLE `t_karyawan`
  MODIFY `kid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `t_software`
--
ALTER TABLE `t_software`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `t_config`
--
ALTER TABLE `t_config`
  ADD CONSTRAINT `t_config_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `t_software` (`sid`);

--
-- Ketidakleluasaan untuk tabel `t_hardware`
--
ALTER TABLE `t_hardware`
  ADD CONSTRAINT `t_hardware_ibfk_1` FOREIGN KEY (`hid`) REFERENCES `t_config` (`hid`);

--
-- Ketidakleluasaan untuk tabel `t_karyawan`
--
ALTER TABLE `t_karyawan`
  ADD CONSTRAINT `t_karyawan_ibfk_1` FOREIGN KEY (`kid`) REFERENCES `t_hardware` (`kid`);

--
-- Ketidakleluasaan untuk tabel `t_software`
--
ALTER TABLE `t_software`
  ADD CONSTRAINT `t_software_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `t_config` (`sid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
