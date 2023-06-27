-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Jun 2023 pada 07.08
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
-- Database: `db_klinik_uniga`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_dokter`
--

CREATE TABLE `t_dokter` (
  `id_dokter` varchar(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `spesialis` varchar(50) NOT NULL,
  `telp` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_dokter`
--

INSERT INTO `t_dokter` (`id_dokter`, `nama`, `alamat`, `spesialis`, `telp`) VALUES
('ID001', 'Dr. Nuriana', 'Jl. Mertojoyo 64 Malang ', 'Umum', '081233334444'),
('ID002', 'Dr. Ronni', 'Jl. Mawar 25 Malang ', 'Umum', '085566667777'),
('ID003', 'Dr. Ishma', 'Jl. Mundu 122 Malang ', 'Umum', '087191910000'),
('ID004', 'Dr. Fairuz', 'Surabaya ', 'Gigi', '089945456666');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_history`
--

CREATE TABLE `t_history` (
  `id` int(11) NOT NULL,
  `id_kunjungan` varchar(11) NOT NULL,
  `id_dokter` varchar(11) NOT NULL,
  `id_pelayanan` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_history`
--

INSERT INTO `t_history` (`id`, `id_kunjungan`, `id_dokter`, `id_pelayanan`) VALUES
(1, 'K001', 'ID001', 'P001'),
(2, 'K002', 'ID002', 'P002'),
(3, 'K003', 'ID001', 'P001'),
(4, 'K004', 'ID003', 'P003');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_kunjungan`
--

CREATE TABLE `t_kunjungan` (
  `id_kunjungan` varchar(11) NOT NULL,
  `tgl_kunjungan` date NOT NULL,
  `pesien` varchar(11) NOT NULL,
  `keluhan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_kunjungan`
--

INSERT INTO `t_kunjungan` (`id_kunjungan`, `tgl_kunjungan`, `pesien`, `keluhan`) VALUES
('K001', '2023-06-01', 'PA01', 'Sakit kepala dan demam'),
('K002', '2023-06-02', 'PA02', 'Batuk dan pilek'),
('K003', '2023-06-03', 'PA03', 'Nyeri perut dan mual'),
('K004', '2023-06-04', 'PA04', 'Pegal pada bagian punggung dan leher\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_pasien`
--

CREATE TABLE `t_pasien` (
  `id_pasien` varchar(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `gender` char(1) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_pasien`
--

INSERT INTO `t_pasien` (`id_pasien`, `nama`, `gender`, `alamat`, `tgl_lahir`) VALUES
('PA01', 'Siska ', 'P', 'Jl. Sudirman No. 123', '2000-06-06'),
('PA02', 'Rudi Hartono', 'L', 'Jl. Gatot Subroto No. 456', '1997-09-01'),
('PA03', 'Ridwan', 'L', 'Jl. Pahlawan No. 789', '1995-06-26'),
('PA04', 'Alfia', 'P', 'Jl. Diponegoro No. 321', '2000-03-02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_pelayanan`
--

CREATE TABLE `t_pelayanan` (
  `id_pelayanan` varchar(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tarif` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_pelayanan`
--

INSERT INTO `t_pelayanan` (`id_pelayanan`, `nama`, `tarif`) VALUES
('P001', 'Rawat Jalan', 100000),
('P002', 'Rawat Inap', 50000),
('P003', 'Konsultasi Khusus', 150000),
('P004', 'USG', 100000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `t_dokter`
--
ALTER TABLE `t_dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indeks untuk tabel `t_history`
--
ALTER TABLE `t_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kunjungan` (`id_kunjungan`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_pelayanan` (`id_pelayanan`);

--
-- Indeks untuk tabel `t_kunjungan`
--
ALTER TABLE `t_kunjungan`
  ADD PRIMARY KEY (`id_kunjungan`),
  ADD KEY `pesien` (`pesien`);

--
-- Indeks untuk tabel `t_pasien`
--
ALTER TABLE `t_pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indeks untuk tabel `t_pelayanan`
--
ALTER TABLE `t_pelayanan`
  ADD PRIMARY KEY (`id_pelayanan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `t_history`
--
ALTER TABLE `t_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `t_history`
--
ALTER TABLE `t_history`
  ADD CONSTRAINT `t_history_ibfk_1` FOREIGN KEY (`id_kunjungan`) REFERENCES `t_kunjungan` (`id_kunjungan`),
  ADD CONSTRAINT `t_history_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `t_dokter` (`id_dokter`),
  ADD CONSTRAINT `t_history_ibfk_3` FOREIGN KEY (`id_pelayanan`) REFERENCES `t_pelayanan` (`id_pelayanan`);

--
-- Ketidakleluasaan untuk tabel `t_kunjungan`
--
ALTER TABLE `t_kunjungan`
  ADD CONSTRAINT `t_kunjungan_ibfk_1` FOREIGN KEY (`pesien`) REFERENCES `t_pasien` (`id_pasien`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
