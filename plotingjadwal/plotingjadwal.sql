-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Bulan Mei 2019 pada 15.21
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `plotingjadwal`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `kode_dosen` int(2) NOT NULL,
  `nidn` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`kode_dosen`, `nidn`, `nama`, `alamat`, `telp`) VALUES
(1, 'NIDN01', 'Mulyana', 'Jatitujuh', '081214220001'),
(2, 'NIDN02', 'Amran', 'Kadipaten', '081214220002'),
(3, 'NIDN03', 'Fikri', 'Majalengka', '081214220003'),
(4, 'NIDN04', 'Asep', 'Sumedang', '081214220004'),
(5, 'NIDN05', 'Wildan', 'Ciamis', '081214220005'),
(6, 'NIDN06', 'Harist', 'Jatitujuh', '081214220006'),
(7, 'NIDN07', 'Jaja', 'Cibodas', '081214220007'),
(8, 'NIDN08', 'Iwan', 'Jatiwangi', '081214220008'),
(9, 'NIDN09', 'Iqbal', 'Kertajati', '081214220009'),
(10, 'NIDN10', 'Yusup', 'Maja', '081214220010');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwalkuliah`
--

CREATE TABLE `jadwalkuliah` (
  `kode_mk` varchar(50) NOT NULL,
  `kode_jadwal` int(10) NOT NULL,
  `kode_jam` int(10) NOT NULL,
  `kode_hari` int(10) NOT NULL,
  `kode_ruang` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jadwalkuliah`
--

INSERT INTO `jadwalkuliah` (`kode_mk`, `kode_jadwal`, `kode_jam`, `kode_hari`, `kode_ruang`) VALUES
('MK01', 1, 1, 1, 1),
('MK02', 2, 2, 2, 2),
('MK03', 3, 3, 3, 3),
('MK04', 4, 4, 4, 4),
('MK05', 5, 5, 5, 5),
('MK06', 6, 6, 6, 6),
('MK07', 7, 7, 7, 7),
('MK08', 8, 8, 8, 8),
('MK09', 9, 9, 9, 9),
('MK10', 10, 10, 10, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jam`
--

CREATE TABLE `jam` (
  `kode_jam` int(10) NOT NULL,
  `range_jam` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jam`
--

INSERT INTO `jam` (`kode_jam`, `range_jam`) VALUES
(1, '2 jam'),
(2, '2 jam'),
(3, '2 jam'),
(4, '2 jam'),
(5, '2 jam'),
(6, '2 jam'),
(7, '2 jam'),
(8, '2 jam'),
(9, '2 jam'),
(10, '2 jam');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kode` int(10) NOT NULL,
  `kode_mk` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `sks` int(6) NOT NULL,
  `semester` int(6) NOT NULL,
  `aktif` varchar(50) NOT NULL,
  `jenis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `matakuliah`
--

INSERT INTO `matakuliah` (`kode`, `kode_mk`, `nama`, `sks`, `semester`, `aktif`, `jenis`) VALUES
(1, 'MK01', 'Mulyana', 2, 4, 'tidak', 'Reguler'),
(2, 'MK02', 'Amran', 3, 4, 'aktif', 'Reguler'),
(3, 'MK03', 'Fikri', 2, 4, 'aktif', 'Reguler'),
(4, 'MK04', 'Asep', 3, 4, 'aktif', 'Reguler'),
(5, 'MK05', 'Wildan', 2, 4, 'aktif', 'Reguler'),
(6, 'MK06', 'Harist', 2, 4, 'aktif', 'Reguler'),
(7, 'MK07', 'Jaja', 3, 4, 'aktif', 'Reguler'),
(8, 'MK08', 'Iwan', 2, 4, 'aktif', 'Reguler'),
(9, 'MK09', 'Iqbal', 3, 4, 'aktif', 'Karyawan'),
(10, 'MK10', 'Yusup', 2, 4, 'aktif', 'Karyawan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruang`
--

CREATE TABLE `ruang` (
  `kode_ruang` int(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kapastitas` int(10) NOT NULL,
  `jenis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ruang`
--

INSERT INTO `ruang` (`kode_ruang`, `nama`, `kapastitas`, `jenis`) VALUES
(1, 'Mulyana', 20, 'Reguler'),
(2, 'Amran', 20, 'Reguler'),
(3, 'Fikri', 20, 'Reguler'),
(4, 'Asep', 20, 'Reguler'),
(5, 'Wildan', 20, 'Reguler'),
(6, 'Harist', 20, 'Reguler'),
(7, 'Jaja', 20, 'Reguler'),
(8, 'Iwan', 20, 'Reguler'),
(9, 'Iqbal', 20, 'Karyawan'),
(10, 'Yusup', 20, 'Karyawan');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jadwalkuliah`
--
ALTER TABLE `jadwalkuliah`
  ADD PRIMARY KEY (`kode_mk`),
  ADD KEY `kode_jadwal` (`kode_jadwal`),
  ADD KEY `kode_hari` (`kode_hari`),
  ADD KEY `kode_ruang` (`kode_ruang`),
  ADD KEY `kode_jam` (`kode_jam`);

--
-- Indeks untuk tabel `jam`
--
ALTER TABLE `jam`
  ADD PRIMARY KEY (`kode_jam`);

--
-- Indeks untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `kode_mk` (`kode_mk`);

--
-- Indeks untuk tabel `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`kode_ruang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
