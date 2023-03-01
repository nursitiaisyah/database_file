-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Okt 2022 pada 06.29
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `t_barang`
--

INSERT INTO `t_barang` (`kode_brg`, `nama`, `stok`) VALUES
('B001', 'Monitor LCD 20\"', 30),
('B002', 'Mouse Wifi', 50),
('B003', 'Printer 440', 24),
('B004', 'Keyboard', 30),
('B005', 'Flash Disk', 20);

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_karyawan`
--

CREATE TABLE `t_karyawan` (
  `kode_karyawan` varchar(4) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telepon` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `t_karyawan`
--

INSERT INTO `t_karyawan` (`kode_karyawan`, `nama`, `alamat`, `telepon`) VALUES
('S001', 'Nur Siti Aisyah', 'Jl. Joyo Suryo No 614', '081333641651'),
('S002', 'Okta Viana Rafika', 'Jl. Majapahit No 56', '813336416789'),
('S003', 'Tiara Kasih', 'Jl. Soekarno Hatta No 456', '823455678234'),
('S004', 'Putri Andini', 'Jl. Mayjen Panjaitan No 34', '812223456224'),
('S005', 'Erlin Novita Sari', 'Jl. Veteran No 289', '823645890101');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_supplier`
--

CREATE TABLE `t_supplier` (
  `kode_supplier` varchar(4) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telepon` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `t_supplier`
--

INSERT INTO `t_supplier` (`kode_supplier`, `nama`, `alamat`, `telepon`) VALUES
('S001', 'PT. BIMATAMA TEKNIK', 'Jl. Gading Griya Lestari Blok E3', '081333456123'),
('S002', 'PT. ARMADA DIGICARD', 'Jl. Dr Saharjo No 18', '081333641723'),
('S003', 'PT. ASIA PRIMA SEJAHTERA', 'Jl. Karang Tengah Jaya No 340', '082345567879'),
('S004', 'PT. CITRA KARYA TEKNIK', 'Jl. Bandengan Utara Raya No 27', '082337567987'),
('S005', 'CV. SURABAYA COOL', 'Jl. Wiguna Tengah No 35', '085678984009');

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
-- AUTO_INCREMENT untuk tabel `t_masuk`
--
ALTER TABLE `t_masuk`
  MODIFY `id_masuk` int(11) NOT NULL AUTO_INCREMENT;

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
