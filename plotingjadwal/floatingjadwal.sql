-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2019 at 12:07 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `floatingjadwal`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `data_jadwal_kuliah`
-- (See below for the actual view)
--
CREATE TABLE `data_jadwal_kuliah` (
`kode_jadwal` int(10)
,`kode_hari` int(10)
,`kode_jam` int(10)
,`kode_mk` varchar(50)
,`kode_ruang` int(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `kode_dosen` int(2) NOT NULL,
  `nidn` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dosen`
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
-- Table structure for table `jadwalkuliah`
--

CREATE TABLE `jadwalkuliah` (
  `kode_mk` varchar(50) NOT NULL,
  `kode_jadwal` int(10) NOT NULL,
  `kode_jam` int(10) NOT NULL,
  `kode_hari` int(10) NOT NULL,
  `kode_ruang` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwalkuliah`
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
-- Table structure for table `jam`
--

CREATE TABLE `jam` (
  `kode_jam` int(10) NOT NULL,
  `range_jam` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jam`
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
-- Table structure for table `matakuliah`
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
-- Dumping data for table `matakuliah`
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
-- Table structure for table `ruang`
--

CREATE TABLE `ruang` (
  `kode_ruang` int(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kapastitas` int(10) NOT NULL,
  `jenis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ruang`
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

-- --------------------------------------------------------

--
-- Structure for view `data_jadwal_kuliah`
--
DROP TABLE IF EXISTS `data_jadwal_kuliah`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `data_jadwal_kuliah`  AS  select `jadwalkuliah`.`kode_jadwal` AS `kode_jadwal`,`jadwalkuliah`.`kode_hari` AS `kode_hari`,`jam`.`kode_jam` AS `kode_jam`,`matakuliah`.`kode_mk` AS `kode_mk`,`ruang`.`kode_ruang` AS `kode_ruang` from (((`jadwalkuliah` join `jam` on((`jam`.`kode_jam` = `jadwalkuliah`.`kode_jam`))) join `matakuliah` on((`matakuliah`.`kode_mk` = `jadwalkuliah`.`kode_mk`))) join `ruang` on((`ruang`.`kode_ruang` = `jadwalkuliah`.`kode_ruang`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jadwalkuliah`
--
ALTER TABLE `jadwalkuliah`
  ADD PRIMARY KEY (`kode_mk`),
  ADD KEY `kode_jadwal` (`kode_jadwal`),
  ADD KEY `kode_hari` (`kode_hari`),
  ADD KEY `kode_ruang` (`kode_ruang`),
  ADD KEY `kode_jam` (`kode_jam`);

--
-- Indexes for table `jam`
--
ALTER TABLE `jam`
  ADD PRIMARY KEY (`kode_jam`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `kode_mk` (`kode_mk`);

--
-- Indexes for table `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`kode_ruang`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jadwalkuliah`
--
ALTER TABLE `jadwalkuliah`
  ADD CONSTRAINT `jadwalkuliah_ibfk_1` FOREIGN KEY (`kode_jam`) REFERENCES `jam` (`kode_jam`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jadwalkuliah_ibfk_2` FOREIGN KEY (`kode_ruang`) REFERENCES `ruang` (`kode_ruang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD CONSTRAINT `matakuliah_ibfk_1` FOREIGN KEY (`kode_mk`) REFERENCES `jadwalkuliah` (`kode_mk`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
