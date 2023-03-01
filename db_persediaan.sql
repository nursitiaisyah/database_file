-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Feb 2023 pada 04.26
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
-- Database: `db_persediaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_barang`
--

CREATE TABLE `t_barang` (
  `kode_brg` varchar(4) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_barang`
--

INSERT INTO `t_barang` (`kode_brg`, `nama`, `stok`) VALUES
('B001', 'Monitor LCD 20\"', 32),
('B002', 'Mouse Wifi', 20),
('B003', 'Printer 440', 24),
('B004', 'Keyboard', 30),
('B005', 'Flash Disk', 20),
('B006', 'Proyektor', 23),
('B007', 'Webcame', 10),
('B008', 'Kipas Angin', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_karyawan`
--

CREATE TABLE `t_karyawan` (
  `kode_karyawan` varchar(4) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telepon` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_karyawan`
--

INSERT INTO `t_karyawan` (`kode_karyawan`, `nama`, `alamat`, `telepon`) VALUES
('S001', 'Nur Siti Aisyah', 'Jl. Joyo Suryo No 614', '081234567876'),
('S002', 'Okta Viana Rafika', 'Jl. Majapahit No 56', '087234567897'),
('S003', 'Tiara Kasih', 'Jl. Soekarno Hatta No 456', '089334234567'),
('S004', 'Putri Andini', 'Jl. Mayjen Panjaitan No 34', '089334775895'),
('S005', 'Erlin Novita ', 'Jl. Veteran No 289', '081333546739');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_keluar`
--

CREATE TABLE `t_keluar` (
  `id_keluar` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_brg` varchar(4) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `kode_karyawan` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_keluar`
--

INSERT INTO `t_keluar` (`id_keluar`, `tanggal`, `kode_brg`, `jumlah`, `kode_karyawan`) VALUES
(1, '2022-12-12', 'B002', 3, 'S002'),
(2, '2022-12-12', 'B002', 2, 'S001'),
(3, '2023-01-06', 'B001', 3, 'S001'),
(4, '2023-01-07', 'B001', 7, 'S001'),
(5, '2023-01-07', 'B001', 1, 'S001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_masuk`
--

CREATE TABLE `t_masuk` (
  `id_masuk` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_brg` varchar(4) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `kode_supplier` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_masuk`
--

INSERT INTO `t_masuk` (`id_masuk`, `tanggal`, `kode_brg`, `jumlah`, `kode_supplier`) VALUES
(1, '2022-12-12', 'B002', 6, 'S001'),
(2, '2022-12-12', 'B002', 5, 'S003'),
(3, '2022-12-12', 'B001', 5, 'S001'),
(4, '2022-12-12', 'B001', 1, 'S002'),
(5, '2022-12-12', 'B002', 3, 'S002'),
(6, '2022-12-12', 'B001', 2, 'S001'),
(7, '2022-12-12', 'B002', 1, 'S001'),
(8, '2023-01-03', 'B001', 1, 'S001'),
(9, '2023-01-07', 'B001', 2, 'S001'),
(10, '2023-01-08', 'B002', 2, 'S001'),
(11, '2023-01-08', 'B001', 2, 'S001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_supplier`
--

CREATE TABLE `t_supplier` (
  `kode_supplier` varchar(4) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telepon` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_supplier`
--

INSERT INTO `t_supplier` (`kode_supplier`, `nama`, `alamat`, `telepon`) VALUES
('S001', 'PT. BIMATAMA TEKNIK', 'Jl. Gading Griya Lestari Blok E3', '081333456123'),
('S002', 'PT. ARMADA DIGICARD', 'Jl. Dr Saharjo No 18', '081333641723'),
('S003', 'PT. ASIA PRIMA SEJAHTERA', 'Jl. Karang Tengah Jaya No 340', '082345567879'),
('S004', 'PT. CITRA KARYA TEKNIK', 'Jl. Bandengan Utara Raya No 27', '082337567987'),
('S005', 'CV. SURABAYA COOL', 'Jl. Wiguna Tengah No 35', '0856789840092'),
('S006', 'PT. Aisyah Jaya', 'Jl. Bhayangkara 05', '0812345678984'),
('S007', 'PT. CITRA ABADI', 'Jl. Ijen', '0812348879085'),
('S008', 'PT. CAHAYA MURNI', 'Jl. Soekarno ', '0812345678987');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `t_barang`
--
ALTER TABLE `t_barang`
  ADD PRIMARY KEY (`kode_brg`);

--
-- Indeks untuk tabel `t_karyawan`
--
ALTER TABLE `t_karyawan`
  ADD PRIMARY KEY (`kode_karyawan`);

--
-- Indeks untuk tabel `t_keluar`
--
ALTER TABLE `t_keluar`
  ADD PRIMARY KEY (`id_keluar`),
  ADD KEY `kode_brg` (`kode_brg`),
  ADD KEY `kode_karyawan` (`kode_karyawan`);

--
-- Indeks untuk tabel `t_masuk`
--
ALTER TABLE `t_masuk`
  ADD PRIMARY KEY (`id_masuk`),
  ADD KEY `kode_brg` (`kode_brg`),
  ADD KEY `kode_supplier` (`kode_supplier`);

--
-- Indeks untuk tabel `t_supplier`
--
ALTER TABLE `t_supplier`
  ADD PRIMARY KEY (`kode_supplier`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `t_keluar`
--
ALTER TABLE `t_keluar`
  MODIFY `id_keluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `t_masuk`
--
ALTER TABLE `t_masuk`
  MODIFY `id_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `t_keluar`
--
ALTER TABLE `t_keluar`
  ADD CONSTRAINT `t_keluar_ibfk_1` FOREIGN KEY (`kode_brg`) REFERENCES `t_barang` (`kode_brg`),
  ADD CONSTRAINT `t_keluar_ibfk_2` FOREIGN KEY (`kode_karyawan`) REFERENCES `t_karyawan` (`kode_karyawan`);

--
-- Ketidakleluasaan untuk tabel `t_masuk`
--
ALTER TABLE `t_masuk`
  ADD CONSTRAINT `t_masuk_ibfk_1` FOREIGN KEY (`kode_brg`) REFERENCES `t_barang` (`kode_brg`),
  ADD CONSTRAINT `t_masuk_ibfk_2` FOREIGN KEY (`kode_supplier`) REFERENCES `t_supplier` (`kode_supplier`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
