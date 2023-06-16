-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Jun 2023 pada 18.27
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_unigacourse`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_kursus`
--

CREATE TABLE `t_kursus` (
  `id_kursus` int(11) NOT NULL,
  `nama_kursus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_kursus`
--

INSERT INTO `t_kursus` (`id_kursus`, `nama_kursus`) VALUES
(1, 'Bahasa Jepang'),
(2, 'Bahasa Inggris'),
(3, 'Bahasa Jerman'),
(4, 'Bahasa Arab');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_pengajar`
--

CREATE TABLE `t_pengajar` (
  `id_pengajar` int(11) NOT NULL,
  `nama_pengajar` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_tlp` varchar(13) NOT NULL,
  `bidang_ajar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_pengajar`
--

INSERT INTO `t_pengajar` (`id_pengajar`, `nama_pengajar`, `tgl_lahir`, `alamat`, `no_tlp`, `bidang_ajar`) VALUES
(1, 'Susanty', '1980-04-12', '0 Jl. Mertojoyo 78 Malang', '089112456786', 'Bahasa Jerman'),
(2, 'Handika', '1990-01-05', 'Jl. Piranha 99 Malang', '087654778432', 'Bahasa Inggris'),
(3, 'Afrilia', '1988-04-04', 'Jl. Kutilang 45 Malang', '089333453123', 'Bahasa Inggris'),
(4, 'Hardianto', '1982-08-02', 'Jl. Manyar 12 Malang', '081223432576', 'Bahasa Jepang'),
(5, 'Thomas', '1989-08-29', 'Jl. Manyar 12 Malang', '089234876112', 'Bahasa Jerman'),
(6, 'Anas', '1988-12-30', 'Jl. Mertojoyo 12 Malang', '082332441234', 'Bahasa Arab'),
(7, 'Lila', '1990-01-19', 'Jl. Sidodadi 10 Malang', '082445678997', 'Bahasa Inggris');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_peserta`
--

CREATE TABLE `t_peserta` (
  `id_peserta` int(11) NOT NULL,
  `no_induk` int(11) NOT NULL,
  `nama_peserta` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_tlp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_peserta`
--

INSERT INTO `t_peserta` (`id_peserta`, `no_induk`, `nama_peserta`, `tgl_lahir`, `alamat`, `no_tlp`) VALUES
(1, 1001, 'Martana', '1997-06-30', 'Jalan. Mekar No.13', '089334556789'),
(2, 1002, 'Nur', '1998-08-02', 'Jalan. Majapahit No 21', '089776543332'),
(3, 1003, 'Michel			', '1988-12-10', 'Jalan Gatot Subroto No. 789', '083456789015'),
(4, 1004, 'Sarah 			', '1995-04-02', 'Jalan Diponegoro No. 234', '084567890125'),
(5, 1005, 'Adam', '1991-07-25', 'Jalan Ahmad Yani No. 567	', '085678901235'),
(6, 1006, 'Emily 		', '1994-03-18', 'Jalan Imam Bonjol No. 890	', '086789012341'),
(7, 1007, 'David		', '1989-09-08', 'Jalan Thamrin No. 1234	', '087890123451'),
(8, 1008, 'Olivia ', '1993-11-30', 'Jalan Hayam Wuruk No. 5678	', '088901234562'),
(9, 1009, 'Lisa		', '1997-01-12', 'Jalan Pemuda No. 9012', '089012345672'),
(10, 1010, 'Yeri	', '1996-06-05', 'Jalan Raya No. 123', '090123456784');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_registrasi`
--

CREATE TABLE `t_registrasi` (
  `id_registrasi` int(11) NOT NULL,
  `no_induk` int(11) NOT NULL,
  `id_peserta` int(11) NOT NULL,
  `id_kursus` int(11) NOT NULL,
  `biaya` int(11) NOT NULL,
  `id_pengajar` int(11) NOT NULL,
  `tgl_pelaksanaan` date NOT NULL,
  `status` enum('Belum Dimulai','Sedang Berlangsung','Sudah Selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_registrasi`
--

INSERT INTO `t_registrasi` (`id_registrasi`, `no_induk`, `id_peserta`, `id_kursus`, `biaya`, `id_pengajar`, `tgl_pelaksanaan`, `status`) VALUES
(4, 1, 1, 1, 500000, 4, '2023-05-01', 'Sudah Selesai'),
(5, 2, 2, 2, 500000, 2, '2023-05-02', 'Sudah Selesai'),
(6, 3, 3, 3, 500000, 5, '2023-06-03', 'Sudah Selesai'),
(7, 4, 4, 4, 500000, 6, '2023-06-16', 'Sedang Berlangsung'),
(8, 5, 5, 1, 500000, 4, '2023-06-15', 'Belum Dimulai'),
(9, 1, 1, 1, 500000, 4, '2023-06-14', 'Sudah Selesai'),
(10, 10, 10, 3, 500000, 1, '2023-06-17', 'Belum Dimulai'),
(11, 7, 7, 4, 500000, 6, '2023-06-19', 'Belum Dimulai'),
(12, 6, 6, 3, 500000, 5, '2023-06-12', 'Sudah Selesai'),
(13, 3, 3, 2, 500000, 3, '2023-06-16', 'Sedang Berlangsung');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `t_kursus`
--
ALTER TABLE `t_kursus`
  ADD PRIMARY KEY (`id_kursus`);

--
-- Indeks untuk tabel `t_pengajar`
--
ALTER TABLE `t_pengajar`
  ADD PRIMARY KEY (`id_pengajar`);

--
-- Indeks untuk tabel `t_peserta`
--
ALTER TABLE `t_peserta`
  ADD PRIMARY KEY (`id_peserta`);

--
-- Indeks untuk tabel `t_registrasi`
--
ALTER TABLE `t_registrasi`
  ADD PRIMARY KEY (`id_registrasi`),
  ADD KEY `no_induk` (`no_induk`),
  ADD KEY `id_peserta` (`id_peserta`),
  ADD KEY `id_kursus` (`id_kursus`),
  ADD KEY `id_pengajar` (`id_pengajar`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `t_kursus`
--
ALTER TABLE `t_kursus`
  MODIFY `id_kursus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `t_pengajar`
--
ALTER TABLE `t_pengajar`
  MODIFY `id_pengajar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `t_peserta`
--
ALTER TABLE `t_peserta`
  MODIFY `id_peserta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `t_registrasi`
--
ALTER TABLE `t_registrasi`
  MODIFY `id_registrasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `t_registrasi`
--
ALTER TABLE `t_registrasi`
  ADD CONSTRAINT `t_registrasi_ibfk_1` FOREIGN KEY (`id_pengajar`) REFERENCES `t_pengajar` (`id_pengajar`),
  ADD CONSTRAINT `t_registrasi_ibfk_2` FOREIGN KEY (`id_kursus`) REFERENCES `t_kursus` (`id_kursus`),
  ADD CONSTRAINT `t_registrasi_ibfk_3` FOREIGN KEY (`id_peserta`) REFERENCES `t_peserta` (`id_peserta`),
  ADD CONSTRAINT `t_registrasi_ibfk_4` FOREIGN KEY (`no_induk`) REFERENCES `t_peserta` (`id_peserta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
