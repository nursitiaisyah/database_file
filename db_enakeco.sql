-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Bulan Mei 2023 pada 13.13
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_enakeco`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_bagian`
--

CREATE TABLE `t_bagian` (
  `BID` varchar(3) NOT NULL,
  `nama` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_bagian`
--

INSERT INTO `t_bagian` (`BID`, `nama`) VALUES
('A04', 'Akunting'),
('G03', 'Gudang'),
('K01', 'Kasir'),
('P02', 'Penjaga'),
('S05', 'Satpam');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_gaji`
--

CREATE TABLE `t_gaji` (
  `GID` int(11) NOT NULL,
  `PID` int(11) NOT NULL,
  `periode` date NOT NULL,
  `jml_masuk` int(11) NOT NULL,
  `bonus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_gaji`
--

INSERT INTO `t_gaji` (`GID`, `PID`, `periode`, `jml_masuk`, `bonus`) VALUES
(3, 2, '2023-01-28', 28, 300000),
(4, 3, '2023-01-25', 25, 200000),
(5, 4, '2023-01-27', 27, 300000),
(6, 5, '2023-01-25', 25, 200000),
(7, 6, '2023-01-29', 29, 400000),
(8, 7, '2023-01-28', 28, 300000),
(9, 8, '2023-01-25', 25, 200000),
(10, 9, '2023-01-24', 24, 200000),
(11, 10, '2023-01-25', 25, 200000),
(12, 11, '2023-01-26', 26, 200000),
(13, 12, '2023-01-27', 27, 300000),
(14, 13, '2023-01-28', 28, 300000),
(15, 14, '2023-01-28', 28, 300000),
(16, 15, '2023-01-28', 28, 300000),
(17, 16, '2023-01-27', 27, 300000),
(18, 2, '2023-02-24', 24, 200000),
(19, 3, '2023-02-28', 28, 400000),
(20, 4, '2023-02-24', 24, 200000),
(21, 5, '2023-02-27', 27, 300000),
(22, 6, '2023-02-24', 24, 200000),
(23, 7, '2023-02-24', 24, 200000),
(24, 7, '2023-02-28', 28, 300000),
(25, 8, '2023-02-27', 27, 300000),
(26, 9, '2023-02-28', 28, 300000),
(27, 10, '2023-02-27', 27, 300000),
(28, 11, '2023-02-24', 24, 200000),
(29, 12, '2023-02-24', 24, 200000),
(30, 13, '2023-02-24', 24, 200000),
(31, 14, '2023-02-24', 24, 200000),
(32, 15, '2023-02-24', 24, 200000),
(33, 2, '2023-03-27', 27, 300000),
(34, 3, '2023-03-25', 25, 200000),
(35, 4, '2023-03-25', 25, 200000),
(36, 5, '2023-03-25', 25, 200000),
(37, 6, '2023-03-28', 28, 300000),
(38, 7, '2023-03-27', 27, 300000),
(39, 8, '2023-03-29', 29, 300000),
(40, 9, '2023-03-25', 25, 200000),
(41, 10, '2023-03-25', 25, 200000),
(42, 11, '2023-03-27', 27, 300000),
(43, 12, '2023-03-25', 25, 200000),
(44, 13, '2023-03-28', 28, 300000),
(45, 14, '2023-03-29', 29, 300000),
(46, 15, '2023-03-27', 27, 300000),
(47, 16, '2023-03-28', 28, 300000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_kategori`
--

CREATE TABLE `t_kategori` (
  `KID` varchar(3) NOT NULL,
  `gaji_pokok` int(11) NOT NULL,
  `tunjangan` int(11) NOT NULL,
  `keterangan` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_kategori`
--

INSERT INTO `t_kategori` (`KID`, `gaji_pokok`, `tunjangan`, `keterangan`) VALUES
('A1', 1500000, 0, 'SMA dengan masa kerja < 2 Tahun	'),
('A2', 1500000, 100000, 'SMA dengan masa kerja > 2 Tahun'),
('P1', 1000000, 0, 'SMP dengan masa kerja < 2 Tahun	'),
('P2', 1000000, 100000, 'SMP dengan masa kerja > 2 Tahun'),
('S1', 2000000, 0, 'S1 dengan masa kerja < 2 Tahun'),
('S2', 2000000, 200000, 'S1 dengan masa kerja > 2 Tahun');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_pegawai`
--

CREATE TABLE `t_pegawai` (
  `PID` int(11) NOT NULL,
  `NIK` varchar(16) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `JK` varchar(1) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telepon` varchar(13) NOT NULL,
  `tahun_masuk` year(4) NOT NULL,
  `pendidikan` varchar(3) NOT NULL,
  `BID` varchar(3) NOT NULL,
  `KID` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_pegawai`
--

INSERT INTO `t_pegawai` (`PID`, `NIK`, `nama`, `JK`, `alamat`, `telepon`, `tahun_masuk`, `pendidikan`, `BID`, `KID`) VALUES
(2, '1708764568761234', 'Andi Matalino', 'L', 'Jl. Bauksit 78 Madiun', '081344445555', '2018', 'SMA', 'S05', 'A2'),
(3, '8710245369852473', 'Ronaldino Arifin', 'L', 'Jl. Mataram Gg.7 No. 34 Batu				\r\n', '085655556666', '2020', 'SMP', 'P02', 'P2'),
(4, '2864397152409831', 'Reni Putri', 'P', 'Jl. Mawar No. 68 Kediri					\r\n		\r\n', '085623410909', '2021', 'S1', 'A04', 'S2'),
(5, '5176903428596728', 'Kala Mandala', 'P', 'Jl. Surabaya No. 456A Malang', '085624410909', '2022', 'SMA', 'P02', 'P1'),
(6, '1298375062746854', 'Sartono', 'L', 'Jl. Mertojoyo H.90 Malang\r\n	\r\n		\r\n', '085625410909', '2015', 'SMA', 'S05', 'A2'),
(7, '6372819450321785', 'Budianto Dian', 'L', 'Jl. Suropati Blok K No.01B Bali\r\n\r\n', '085626410909', '2023', 'SMA', 'G03', 'A1'),
(8, '9048562173685192', 'Arsya Ekawira', 'L', 'Jl. Raya Karanglo Gg. 10 No.13 Malang Kab.\r\n', '085627410909', '2018', 'SMA', 'P02', 'A2'),
(9, '7685934210573812', 'Tutiana Islami', 'P', 'Jl. Jakarta 105 Malang	\r\n\r\n\r\n\r\n', '081314081329', '2020', 'S1', 'A04', 'S2'),
(10, '4568902713459271', 'Wanda Kartini', 'P', 'Jl. Rindang No, 04 Bogor				\r\n', '081314081329', '2020', 'SMA', 'K01', 'A2'),
(11, '2109548675391864', 'Sinta Kurniasih', 'P', 'Jl. Batubara 890 Jember	', '081314081329', '2022', 'S1', 'K01', 'S1'),
(12, '8765432109876543', 'Yanti Karina', 'P', 'JL. Kartini No. 790 Gresik', '085766662435', '2020', 'S1', 'G03', 'S1'),
(13, '3948562176059372', 'Ahmad Purnomo', 'L', 'Jl. Embong Malang No. 57 Surabaya				\r\n\r\n\r\n\r\n', '085673234123', '2019', 'SMA', 'G03', 'A2'),
(14, '6135792804910674', 'Koko Andara', 'L', 'Jl. Marunda Jaya 11B Bekasi			\r\n', '085446578995', '2018', 'SMP', 'P02', 'P2'),
(15, '4257309861573498', 'Sofia Anara', 'P', 'Jl. Simpang Balapan 78 Malang				\r\n		\r\n', '085221343889', '2018', 'SMP', 'P02', 'P2'),
(16, '8502374198632951', 'Diah Winarti', 'P', 'JL. Garuda No. 505 Batu', '085771876231', '2019', 'SMA', 'K01', 'A2');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `t_bagian`
--
ALTER TABLE `t_bagian`
  ADD PRIMARY KEY (`BID`);

--
-- Indeks untuk tabel `t_gaji`
--
ALTER TABLE `t_gaji`
  ADD PRIMARY KEY (`GID`),
  ADD KEY `PID` (`PID`);

--
-- Indeks untuk tabel `t_kategori`
--
ALTER TABLE `t_kategori`
  ADD PRIMARY KEY (`KID`);

--
-- Indeks untuk tabel `t_pegawai`
--
ALTER TABLE `t_pegawai`
  ADD PRIMARY KEY (`PID`),
  ADD KEY `BID` (`BID`),
  ADD KEY `KID` (`KID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `t_gaji`
--
ALTER TABLE `t_gaji`
  MODIFY `GID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT untuk tabel `t_pegawai`
--
ALTER TABLE `t_pegawai`
  MODIFY `PID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `t_gaji`
--
ALTER TABLE `t_gaji`
  ADD CONSTRAINT `t_gaji_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `t_pegawai` (`PID`);

--
-- Ketidakleluasaan untuk tabel `t_pegawai`
--
ALTER TABLE `t_pegawai`
  ADD CONSTRAINT `t_pegawai_ibfk_2` FOREIGN KEY (`BID`) REFERENCES `t_bagian` (`BID`),
  ADD CONSTRAINT `t_pegawai_ibfk_3` FOREIGN KEY (`KID`) REFERENCES `t_kategori` (`KID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
