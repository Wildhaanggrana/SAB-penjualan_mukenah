-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2020 at 05:19 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penjualan_mukenah`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_customer`
--

CREATE TABLE `tb_customer` (
  `customer_id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jenkel` enum('L','P') NOT NULL,
  `no_telpon` varchar(20) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_customer`
--

INSERT INTO `tb_customer` (`customer_id`, `nama`, `jenkel`, `no_telpon`, `alamat`) VALUES
(4, 'Khairul Umam', 'L', '085242943376', 'Sengkang'),
(5, 'Khairul', 'L', '085242943376', 'Sengkang');

-- --------------------------------------------------------

--
-- Table structure for table `tb_mukenah`
--

CREATE TABLE `tb_mukenah` (
  `mukenah_id` int(11) NOT NULL,
  `merek` varchar(50) NOT NULL,
  `bahan` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `gambar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_mukenah`
--

INSERT INTO `tb_mukenah` (`mukenah_id`, `merek`, `bahan`, `harga`, `gambar`) VALUES
(4, 'Mukena Import', 'woolpeach exclusive', 310000, 'mukenah-200617-49844ba129.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_reseller`
--

CREATE TABLE `tb_reseller` (
  `reseller_id` int(11) NOT NULL,
  `reseller` varchar(30) NOT NULL,
  `jenkel` enum('L','P') NOT NULL,
  `no_telpon` varchar(20) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_reseller`
--

INSERT INTO `tb_reseller` (`reseller_id`, `reseller`, `jenkel`, `no_telpon`, `alamat`) VALUES
(3, 'E olshop', 'P', '0851155325', 'Soppeng');

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `mukenah_id` int(11) NOT NULL,
  `reseller_id` int(11) NOT NULL,
  `ukuran` varchar(5) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`transaksi_id`, `customer_id`, `mukenah_id`, `reseller_id`, `ukuran`, `tanggal`, `jumlah`) VALUES
(6, 5, 4, 3, 'S', '2020-06-20', 2),
(11, 4, 4, 3, 'S', '2020-06-20', 1),
(12, 5, 4, 3, 'M', '2020-06-20', 23);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `tb_mukenah`
--
ALTER TABLE `tb_mukenah`
  ADD PRIMARY KEY (`mukenah_id`);

--
-- Indexes for table `tb_reseller`
--
ALTER TABLE `tb_reseller`
  ADD PRIMARY KEY (`reseller_id`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`transaksi_id`),
  ADD KEY `mukenah_id` (`mukenah_id`) USING BTREE,
  ADD KEY `customer_id` (`customer_id`) USING BTREE,
  ADD KEY `reseller_id` (`reseller_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_customer`
--
ALTER TABLE `tb_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_mukenah`
--
ALTER TABLE `tb_mukenah`
  MODIFY `mukenah_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_reseller`
--
ALTER TABLE `tb_reseller`
  MODIFY `reseller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `transaksi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD CONSTRAINT `tb_transaksi_ibfk_2` FOREIGN KEY (`mukenah_id`) REFERENCES `tb_mukenah` (`mukenah_id`),
  ADD CONSTRAINT `tb_transaksi_ibfk_3` FOREIGN KEY (`reseller_id`) REFERENCES `tb_reseller` (`reseller_id`),
  ADD CONSTRAINT `tb_transaksi_ibfk_4` FOREIGN KEY (`customer_id`) REFERENCES `tb_customer` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
