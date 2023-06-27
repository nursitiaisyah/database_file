-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Apr 2023 pada 09.55
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
-- Database: `db_sewalaptop_uniga`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_anggota`
--

CREATE TABLE `data_anggota` (
  `ID_anggota` int(11) NOT NULL,
  `nim` varchar(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `ID_unit` varchar(4) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_tlp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_anggota`
--

INSERT INTO `data_anggota` (`ID_anggota`, `nim`, `nama`, `ID_unit`, `alamat`, `no_tlp`) VALUES
(1, '1234567890', 'Agus Budi Santoso', 'U01', ' Jl. Kebon Jeruk No. 10, Jakarta Barat', ' 081234567890'),
(2, '0987654321', 'Siti Aisyah', 'U02', 'Jl. Diponegoro No. 25, Surabaya', '081234567891'),
(3, '1357924680', 'Irfan Setiawan', 'U03', 'Jl. Ahmad Yani No. 15, Bandung', '081234567892'),
(4, '2468013579', 'Dewi Sartika', 'U04', ' Jl. Raya Bogor No. 30, Depok', '081234567893'),
(5, '3692581470', 'Farhan Maulana', 'U05', 'Jl. Pangeran Antasari No. 40, Banjarmasin', '081234567894'),
(6, '9753102468', 'Lia Aulia Putri', 'U06', 'Jl. Bypass Ngurah Rai No. 20, Denpasar', '081234567895'),
(7, '8642091537', 'Ahmad Taufik', 'U07', 'Jl. Pattimura No. 5, Malang', '081234567896'),
(8, '7519036284', 'Lutfi Yulianto', 'U08', 'Jl. Taman Siswa No. 7, Yogyakarta', '081234567897'),
(9, '4827309156', 'Rina Septiani', 'U09', 'Jl. Gajah Mada No. 12, Medan', '081234567898'),
(10, '6192847350', 'Bambang Kusuma', 'U10', 'Jl. Pemuda No. 25, Semarang', '081234567343');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_laptop`
--

CREATE TABLE `data_laptop` (
  `ID_laptop` int(11) NOT NULL,
  `merk` varchar(20) NOT NULL,
  `tipe` varchar(20) NOT NULL,
  `harddrive` varchar(30) NOT NULL,
  `ram` varchar(10) NOT NULL,
  `processor` varchar(30) NOT NULL,
  `tahun_pengadaan` varchar(10) NOT NULL,
  `kondisi` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_laptop`
--

INSERT INTO `data_laptop` (`ID_laptop`, `merk`, `tipe`, `harddrive`, `ram`, `processor`, `tahun_pengadaan`, `kondisi`) VALUES
(1, 'Dell', 'Inspiron 15 5000', '1 TB', '8 GB', ' Intel Core i5-1135G', ' 2021', 'Baru'),
(2, 'HP', 'Pavilion x360', '512 GB SSD', ' 16 GB', 'AMD Ryzen 7 4700U', '2020', 'Bekas '),
(3, 'Asus', 'Zenbook UX425', '512 GB PCIe NVMe M.2 SSD', '16 GB', 'Intel Core i7-1165G7', '2022', 'Baru'),
(4, 'Acer', 'Swift 5', '512 GB PCIe NVMe SSD', '16 GB', 'Intel Core i7-1165G7', '2021', 'Bekas'),
(5, 'Lenovo', 'ThinkPad X1 Carbon', '1 TB PCIe NVMe SSD', '16 GB', ' Intel Core i7-1165G7', '2022', 'Baru'),
(6, 'Apple', 'MacBook Air M1', '256 GB SSD', ' 8 GB', 'Apple M1 chip', '2020', 'Baru'),
(7, ' MSI', 'GF63 Thin', '512 GB SSD', '8 GB', 'Intel Core i5-10300H', '2021', 'Baru'),
(8, 'Razer', 'Blade Stealth', '512 GB SSD', ' 16 GB', ' Intel Core i7-1165G7', '2020', 'Bekas '),
(9, 'Samsung', 'Notebook 9 Pro', ' 256 GB SSD', '8 GB', ' Intel Core i7-8550U', ' 2018', 'Bekas'),
(10, 'Asus', 'ROG Strix G15', '512 GB PCIe NVMe SSD', '16 GB', ' Intel Core i7-10750H', '2020', 'Bekas ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_peminjaman`
--

CREATE TABLE `data_peminjaman` (
  `ID_peminjaman` int(11) NOT NULL,
  `data_anggota` int(11) NOT NULL,
  `data_laptop` int(11) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `jam_pinjam` time NOT NULL,
  `jam_kembali` time NOT NULL,
  `biaya` int(11) NOT NULL,
  `status_peminjaman` enum('Kembali','Belum Kembali') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_peminjaman`
--

INSERT INTO `data_peminjaman` (`ID_peminjaman`, `data_anggota`, `data_laptop`, `tgl_pinjam`, `jam_pinjam`, `jam_kembali`, `biaya`, `status_peminjaman`) VALUES
(4, 1, 1, '2023-04-16', '09:00:00', '12:00:00', 8000, 'Belum Kembali'),
(5, 2, 2, '2023-04-16', '09:00:00', '16:00:00', 16000, 'Belum Kembali'),
(6, 3, 3, '2023-04-16', '12:00:00', '16:00:00', 6000, 'Kembali'),
(7, 4, 4, '2023-04-01', '13:00:00', '14:00:00', 4000, 'Kembali'),
(8, 5, 5, '2023-04-01', '09:00:00', '10:00:00', 4000, 'Belum Kembali'),
(9, 6, 6, '2023-04-12', '14:00:00', '17:00:00', 8000, 'Belum Kembali'),
(10, 7, 7, '2023-04-17', '15:00:00', '17:00:00', 6000, 'Belum Kembali'),
(17, 8, 8, '2023-04-28', '12:00:00', '14:00:00', 6000, 'Belum Kembali'),
(18, 9, 9, '2023-04-28', '14:00:00', '15:00:00', 4000, 'Belum Kembali');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_unit`
--

CREATE TABLE `data_unit` (
  `ID_unit` varchar(4) NOT NULL,
  `nama_unit` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_unit`
--

INSERT INTO `data_unit` (`ID_unit`, `nama_unit`) VALUES
('U01', 'FEB'),
('U02', 'FISB'),
('U03', 'FTI'),
('U04', 'PASCA'),
('U05', 'LPPM'),
('U06', 'BAU'),
('U07', 'PTI'),
('U08', 'Perpustakaan'),
('U09', 'PMB'),
('U10', 'Akademik'),
('U11', 'Wakil Rektor'),
('U12', 'Rektor');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_anggota`
--
ALTER TABLE `data_anggota`
  ADD PRIMARY KEY (`ID_anggota`),
  ADD KEY `ID_unit` (`ID_unit`);

--
-- Indeks untuk tabel `data_laptop`
--
ALTER TABLE `data_laptop`
  ADD PRIMARY KEY (`ID_laptop`);

--
-- Indeks untuk tabel `data_peminjaman`
--
ALTER TABLE `data_peminjaman`
  ADD PRIMARY KEY (`ID_peminjaman`),
  ADD KEY `data_anggota` (`data_anggota`,`data_laptop`),
  ADD KEY `data_laptop` (`data_laptop`);

--
-- Indeks untuk tabel `data_unit`
--
ALTER TABLE `data_unit`
  ADD PRIMARY KEY (`ID_unit`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data_anggota`
--
ALTER TABLE `data_anggota`
  MODIFY `ID_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `data_laptop`
--
ALTER TABLE `data_laptop`
  MODIFY `ID_laptop` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `data_peminjaman`
--
ALTER TABLE `data_peminjaman`
  MODIFY `ID_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `data_anggota`
--
ALTER TABLE `data_anggota`
  ADD CONSTRAINT `data_anggota_ibfk_1` FOREIGN KEY (`ID_unit`) REFERENCES `data_unit` (`ID_unit`);

--
-- Ketidakleluasaan untuk tabel `data_peminjaman`
--
ALTER TABLE `data_peminjaman`
  ADD CONSTRAINT `data_peminjaman_ibfk_1` FOREIGN KEY (`data_anggota`) REFERENCES `data_anggota` (`ID_anggota`),
  ADD CONSTRAINT `data_peminjaman_ibfk_2` FOREIGN KEY (`data_laptop`) REFERENCES `data_laptop` (`ID_laptop`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
