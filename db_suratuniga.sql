-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Bulan Mei 2023 pada 16.00
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
-- Database: `db_suratuniga`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_identitas`
--

CREATE TABLE `t_identitas` (
  `NIM` int(11) NOT NULL,
  `Nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_jenis`
--

CREATE TABLE `t_jenis` (
  `ID_Jenis` varchar(3) NOT NULL,
  `NamaSurat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_jenis`
--

INSERT INTO `t_jenis` (`ID_Jenis`, `NamaSurat`) VALUES
('J01', 'Surat Permohonan'),
('J02', 'Surat Pemberitahuan'),
('J03', 'Surat Keterangan'),
('J04', 'Surat Undangan'),
('J05', 'Surat Tugas'),
('J06', 'Memo Dinas'),
('J07', 'Lain Lain');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_suratkeluar`
--

CREATE TABLE `t_suratkeluar` (
  `No_Pengajuan` int(11) NOT NULL,
  `ID_Jenis` varchar(3) NOT NULL,
  `ID_Unit` varchar(3) NOT NULL,
  `Perihal` varchar(40) NOT NULL,
  `Tujuan` varchar(40) NOT NULL,
  `No_Surat` varchar(20) NOT NULL,
  `Tgl_Surat` date NOT NULL,
  `Keterangan` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_suratkeluar`
--

INSERT INTO `t_suratkeluar` (`No_Pengajuan`, `ID_Jenis`, `ID_Unit`, `Perihal`, `Tujuan`, `No_Surat`, `Tgl_Surat`, `Keterangan`) VALUES
(1, 'J04', 'U03', 'Undangan Seminar', 'Universitas Semalang Raya', '121/UG/II/2022', '2022-03-03', '-'),
(2, 'J01', 'U01', 'Pengajuan Laboratorium', 'Rektor', '122/UG/III/2022', '2022-03-06', '-'),
(3, 'J03', 'U08', 'Hasil Audit Induk', 'Kopertis 7', '124/UG/III/2022', '2022-03-10', 'Penting'),
(4, 'J05', 'U01', 'Pengangkatan Dosen Tetap', 'Dosen FEB', '125/UG/ST/2022', '2022-04-01', 'Penting'),
(5, 'J06', 'U06', 'Jam Oparasional Bulan Ramadhan', 'Dosen, Karyawan', '130/UG/IV/2022', '2022-04-04', '-'),
(6, 'J04', 'U06', 'Undangan Buka Bersama', 'Civitas Akademika dan Pengurus Yayasan', '141/UG/IV/2022', '2022-04-15', '-'),
(7, 'J01', 'U07', 'Permohonan Pengajuan Proposal Telkom', 'Telkom Cabang Malang', '149/UG/IV/2022', '2022-03-22', 'Penting');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_suratmasuk`
--

CREATE TABLE `t_suratmasuk` (
  `No_Arsip` int(11) NOT NULL,
  `No_Surat` varchar(30) NOT NULL,
  `ID_Jenis` varchar(3) NOT NULL,
  `Perihal` varchar(40) NOT NULL,
  `Asal_Surat` varchar(40) NOT NULL,
  `Tgl_Surat` date NOT NULL,
  `Tgl_Terima` date NOT NULL,
  `Keterangan` varchar(40) NOT NULL,
  `Disposisi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_suratmasuk`
--

INSERT INTO `t_suratmasuk` (`No_Arsip`, `No_Surat`, `ID_Jenis`, `Perihal`, `Asal_Surat`, `Tgl_Surat`, `Tgl_Terima`, `Keterangan`, `Disposisi`) VALUES
(1, '023/UWG/II/2022', 'J04', 'Seminar', 'Univ. Widyagama', '2022-03-20', '2022-03-23', '-', '5/FEB/2022'),
(2, '778/TTK/2022', 'J02', 'Kenaikan Pajak', 'PT TELKOM', '2022-03-25', '2022-03-26', 'Penting', '9/PTI/2022'),
(3, '645/k7/III/2022', 'J05', 'Pengangkatan Dosen Baru', 'Kopertis 7 ', '2022-03-26', '2022-03-30', 'Penting', '10/BAU/2022'),
(4, '054/88/C/2022', 'J07', 'Pengajuan Sistem Informasi', 'PT Wahana', '2022-04-01', '2022-04-02', '-', '3/REK/2022'),
(5, '889/OI/4/2022', 'J01', 'PermohonanPeminjaman Aula', 'SDI Surya Buana', '2022-04-03', '2022-04-03', 'Penting', '4/BAU/2022'),
(6, '556/K/7/2022', 'J04', 'Rapat Pemkot', 'Pemkot Malang', '2022-04-03', '2022-04-05', 'Penting', '6/REK/2022'),
(7, '071/UUK/4/2022', 'J01', 'Peminjaman Aula', 'PKK RW 10', '2022-04-06', '2022-04-07', 'Penting', '4/BAU/2022'),
(8, '009.A/WS/81/2022', 'J04', 'Sosialisasi Sister Kopertis 7', 'Kopertis VII', '2022-04-05', '2022-04-10', 'Penting', '5/REK/2022'),
(9, '186/BNI/M3/4/2022', 'J01', 'Permohonan Pengecekan Ijazah', 'Bank BNI Cab. Madiun', '2022-04-20', '2022-04-23', '-', '8/BAAk/2022');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_unit`
--

CREATE TABLE `t_unit` (
  `ID_Unit` varchar(3) NOT NULL,
  `NamaUnit` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_unit`
--

INSERT INTO `t_unit` (`ID_Unit`, `NamaUnit`) VALUES
('U01', 'FEB'),
('U02', 'FISB'),
('U03', 'FTI'),
('U04', 'PASCA'),
('U05', 'LPPM'),
('U06', 'BAU'),
('U07', 'PTI'),
('U08', 'PERPUSTAKAAN'),
('U09', 'PMB'),
('U10', 'BIRO AKADEMIK');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `t_jenis`
--
ALTER TABLE `t_jenis`
  ADD PRIMARY KEY (`ID_Jenis`);

--
-- Indeks untuk tabel `t_suratkeluar`
--
ALTER TABLE `t_suratkeluar`
  ADD PRIMARY KEY (`No_Pengajuan`),
  ADD UNIQUE KEY `ID_Jenis` (`ID_Jenis`,`ID_Unit`),
  ADD KEY `ID_Unit` (`ID_Unit`),
  ADD KEY `ID_Jenis_2` (`ID_Jenis`,`ID_Unit`);

--
-- Indeks untuk tabel `t_suratmasuk`
--
ALTER TABLE `t_suratmasuk`
  ADD PRIMARY KEY (`No_Arsip`),
  ADD KEY `ID_Jenis` (`ID_Jenis`);

--
-- Indeks untuk tabel `t_unit`
--
ALTER TABLE `t_unit`
  ADD PRIMARY KEY (`ID_Unit`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `t_suratkeluar`
--
ALTER TABLE `t_suratkeluar`
  MODIFY `No_Pengajuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `t_suratmasuk`
--
ALTER TABLE `t_suratmasuk`
  MODIFY `No_Arsip` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `t_suratkeluar`
--
ALTER TABLE `t_suratkeluar`
  ADD CONSTRAINT `t_suratkeluar_ibfk_1` FOREIGN KEY (`ID_Unit`) REFERENCES `t_unit` (`ID_Unit`),
  ADD CONSTRAINT `t_suratkeluar_ibfk_2` FOREIGN KEY (`ID_Jenis`) REFERENCES `t_jenis` (`ID_Jenis`);

--
-- Ketidakleluasaan untuk tabel `t_suratmasuk`
--
ALTER TABLE `t_suratmasuk`
  ADD CONSTRAINT `t_suratmasuk_ibfk_1` FOREIGN KEY (`ID_Jenis`) REFERENCES `t_jenis` (`ID_Jenis`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
