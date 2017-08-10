-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 10 Agu 2017 pada 10.49
-- Versi Server: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airlines_servlet`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(255) NOT NULL,
  `nm_admin` varchar(50) NOT NULL,
  `email_admin` varchar(50) NOT NULL,
  `pass_admin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nm_admin`, `email_admin`, `pass_admin`) VALUES
(1, 'faisal arkan', 'faisalarkan21@gmail.com', 'makan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detil_pesan_tiket`
--

CREATE TABLE `detil_pesan_tiket` (
  `prefix` varchar(2) NOT NULL DEFAULT 'TK',
  `id_pembeli` int(5) NOT NULL,
  `harga_tiket` decimal(10,2) NOT NULL,
  `total_transfer` decimal(10,2) NOT NULL,
  `pilihan_bank` varchar(225) NOT NULL,
  `bandara_berangkat` int(11) NOT NULL,
  `bandara_tujuan` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detil_pesan_tiket`
--

INSERT INTO `detil_pesan_tiket` (`prefix`, `id_pembeli`, `harga_tiket`, `total_transfer`, `pilihan_bank`, `bandara_berangkat`, `bandara_tujuan`, `status`) VALUES
('TK', 3, '1200000.00', '0.00', 'BRI NO. 78787878741 - Sativa Ken', 3, 3, NULL),
('TK', 4, '600000.00', '0.00', 'BCA NO. 98080986643 - Faisal Arkan', 2, 2, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `id_kursus` int(11) NOT NULL,
  `tgl_daftar_mulai` date NOT NULL,
  `tgl_daftar_selesai` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pajak_bandara`
--

CREATE TABLE `pajak_bandara` (
  `id_bandara` int(11) NOT NULL,
  `nm_bandara` varchar(225) NOT NULL,
  `pajak` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pajak_bandara`
--

INSERT INTO `pajak_bandara` (`id_bandara`, `nm_bandara`, `pajak`) VALUES
(1, 'Soekarno Hatta International Airport', '400000'),
(2, 'Juanda International Airport', '300000'),
(3, 'Ngurah Rai International Airport', '600000'),
(4, 'Ahmad Yani International Airport ', '350000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembeli`
--

CREATE TABLE `pembeli` (
  `prefix` varchar(3) NOT NULL DEFAULT 'CS_',
  `id_pembeli` int(5) NOT NULL,
  `nm_pembeli` varchar(40) NOT NULL,
  `email_pembeli` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `hp_pembeli` varchar(225) NOT NULL,
  `gd_pembeli` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembeli`
--

INSERT INTO `pembeli` (`prefix`, `id_pembeli`, `nm_pembeli`, `email_pembeli`, `password`, `hp_pembeli`, `gd_pembeli`) VALUES
('CS_', 3, 'faisal arkanzzzzz', 'faisalarkan21@gmail.com', 'makan', '085778805197', 'Pria'),
('CS_', 4, 'asdasd', 'asdasdasd@sadasds', '', 'dasdsd', 'Wanita');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembeli_validasi`
--

CREATE TABLE `pembeli_validasi` (
  `id_pembeli` int(11) NOT NULL,
  `nm_pembeli` varchar(225) NOT NULL,
  `email_pembeli` varchar(225) NOT NULL,
  `hp_pembeli` varchar(225) NOT NULL,
  `uang_transfer_validasi` decimal(10,2) DEFAULT NULL,
  `pilihan_bank` varchar(225) DEFAULT 'Belum Konfirmasi'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembeli_validasi`
--

INSERT INTO `pembeli_validasi` (`id_pembeli`, `nm_pembeli`, `email_pembeli`, `hp_pembeli`, `uang_transfer_validasi`, `pilihan_bank`) VALUES
(3, 'Faisal Arkan', 'faisalarkan21@gmail.com', '085778805197', '1200000.00', 'BRI NO. 78787878741 - Sativa Ken'),
(4, 'asdasd', 'asdasdasd@sadasds', 'dasdsd', NULL, 'BCA NO. 98080986643 - Faisal Arkan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tgl_pesan`
--

CREATE TABLE `tgl_pesan` (
  `prefix` varchar(3) DEFAULT 'CS_',
  `id_pembeli` int(5) NOT NULL,
  `tgl_order` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tgl_pesan`
--

INSERT INTO `tgl_pesan` (`prefix`, `id_pembeli`, `tgl_order`) VALUES
('CS_', 3, '2017/08/08 19:46:46'),
('CS_', 4, '2017/08/08 19:50:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `detil_pesan_tiket`
--
ALTER TABLE `detil_pesan_tiket`
  ADD PRIMARY KEY (`id_pembeli`),
  ADD KEY `FK_detil_pesan` (`id_pembeli`),
  ADD KEY `bandara_berangkat` (`bandara_berangkat`),
  ADD KEY `bandara_tujuan` (`bandara_tujuan`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_jadwal` (`id_jadwal`),
  ADD KEY `id_kursus` (`id_kursus`);

--
-- Indexes for table `pajak_bandara`
--
ALTER TABLE `pajak_bandara`
  ADD PRIMARY KEY (`id_bandara`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id_pembeli`),
  ADD KEY `email_pembeli` (`email_pembeli`);

--
-- Indexes for table `pembeli_validasi`
--
ALTER TABLE `pembeli_validasi`
  ADD PRIMARY KEY (`id_pembeli`);

--
-- Indexes for table `tgl_pesan`
--
ALTER TABLE `tgl_pesan`
  ADD PRIMARY KEY (`id_pembeli`),
  ADD KEY `id_pembeli` (`id_pembeli`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `detil_pesan_tiket`
--
ALTER TABLE `detil_pesan_tiket`
  MODIFY `id_pembeli` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pajak_bandara`
--
ALTER TABLE `pajak_bandara`
  MODIFY `id_bandara` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pembeli`
--
ALTER TABLE `pembeli`
  MODIFY `id_pembeli` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pembeli_validasi`
--
ALTER TABLE `pembeli_validasi`
  MODIFY `id_pembeli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tgl_pesan`
--
ALTER TABLE `tgl_pesan`
  MODIFY `id_pembeli` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detil_pesan_tiket`
--
ALTER TABLE `detil_pesan_tiket`
  ADD CONSTRAINT `FK_detil_pesan` FOREIGN KEY (`id_pembeli`) REFERENCES `tgl_pesan` (`id_pembeli`) ON DELETE CASCADE,
  ADD CONSTRAINT `detil_pesan_tiket_ibfk_1` FOREIGN KEY (`bandara_berangkat`) REFERENCES `pajak_bandara` (`id_bandara`),
  ADD CONSTRAINT `detil_pesan_tiket_ibfk_2` FOREIGN KEY (`bandara_tujuan`) REFERENCES `pajak_bandara` (`id_bandara`);

--
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`id_kursus`) REFERENCES `kursus` (`id_kursus`);

--
-- Ketidakleluasaan untuk tabel `pembeli_validasi`
--
ALTER TABLE `pembeli_validasi`
  ADD CONSTRAINT `pembeli_validasi_ibfk_1` FOREIGN KEY (`id_pembeli`) REFERENCES `detil_pesan_tiket` (`id_pembeli`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tgl_pesan`
--
ALTER TABLE `tgl_pesan`
  ADD CONSTRAINT `tgl_pesan_ibfk_1` FOREIGN KEY (`id_pembeli`) REFERENCES `pembeli` (`id_pembeli`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
