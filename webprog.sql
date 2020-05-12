-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2020 at 06:56 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webprog`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `nama`, `harga`, `foto`) VALUES
(1, 'Pokky', 10, 'pokky.jpg'),
(2, 'Jam Tangan', 250, 'jam.jpg'),
(3, 'Beng-beng', 20, 'beng.jpg'),
(4, 'Sprite', 50, 'sprite.jpg'),
(5, 'Fanta', 50, 'fanta.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ranking`
--

CREATE TABLE `ranking` (
  `id` int(11) NOT NULL,
  `first` varchar(100) NOT NULL,
  `last` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `intensitas` int(11) NOT NULL,
  `waktu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ranking`
--

INSERT INTO `ranking` (`id`, `first`, `last`, `username`, `intensitas`, `waktu`) VALUES
(1, 'Badru', 'Salam', 'badrusalam11', 0, '2020-03-14 04:22:26'),
(2, 'rizki', 'hidayat', 'rizkihid', 0, '0000-00-00 00:00:00'),
(3, 'Wahyu', 'Hidayat', 'wahuydund', 0, NULL),
(5, 'Irvan', 'Maulana', 'irvanm12', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `saldo`
--

CREATE TABLE `saldo` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `poin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `saldo`
--

INSERT INTO `saldo` (`id`, `username`, `poin`) VALUES
(2, 'badrusalam11', 99996929),
(3, 'wahuydund', 0),
(4, 'rizkihid', 0),
(5, 'irvanm12', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `first` varchar(100) NOT NULL,
  `last` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `kota` varchar(50) DEFAULT NULL,
  `negara` varchar(50) DEFAULT NULL,
  `kodepos` varchar(50) DEFAULT NULL,
  `nohp` varchar(50) DEFAULT NULL,
  `about` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`first`, `last`, `email`, `username`, `password`, `alamat`, `kota`, `negara`, `kodepos`, `nohp`, `about`) VALUES
('Badru', 'Salam', 'badrusalam760@gmail.com', 'badrusalam11', '$2y$10$2D1ybk6KZOfI1r3pQAcTw.cHfn6OWX8OP0sS.GNYTm2xYYVDE0f7m', 'linkungan cipocok tegal rt 01/06', 'Serang', 'Indonesia', '42121', '087871855339', 'Saya adalah seorang mahasiswa'),
('Irvan', 'Maulana', 'irvanmaulana@gmail.com', 'irvanm12', '$2y$10$BZnpn.XhRbV2e6fNchXZGulZ/kuMxuI9u/dNlNEhNRVz1/6CKBsGS', '', '', '', '', '', ''),
('rizki', 'hidayat', 'rizkihidayat@gmail.com', 'rizkihid', '$2y$10$TjKmuIzarm6.Cf0AX7ig4.dnd9WgrSRhetIzFdiGHmGfxDRAYhgmy', '', '', '', '', '', ''),
('Wahyu', 'Hidayat', 'wahuy@gmail.com', 'wahuydund', '$2y$10$pEnptvE0dT0G.at4U/9kyu6O9ypAcnpLhOiQw45r7Pr/KcRggknGO', '', '', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ranking`
--
ALTER TABLE `ranking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `first` (`first`),
  ADD KEY `last` (`last`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `saldo`
--
ALTER TABLE `saldo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`),
  ADD KEY `first` (`first`),
  ADD KEY `last` (`last`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ranking`
--
ALTER TABLE `ranking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `saldo`
--
ALTER TABLE `saldo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ranking`
--
ALTER TABLE `ranking`
  ADD CONSTRAINT `ranking_ibfk_1` FOREIGN KEY (`first`) REFERENCES `users` (`first`),
  ADD CONSTRAINT `ranking_ibfk_2` FOREIGN KEY (`last`) REFERENCES `users` (`last`),
  ADD CONSTRAINT `ranking_ibfk_3` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Constraints for table `saldo`
--
ALTER TABLE `saldo`
  ADD CONSTRAINT `saldo_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
