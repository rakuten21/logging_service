-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2024 at 01:59 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `logging_service`
--

-- --------------------------------------------------------

--
-- Table structure for table `log_entries`
--

CREATE TABLE `log_entries` (
  `id` int(11) NOT NULL,
  `log_level` varchar(50) DEFAULT NULL,
  `system_name` varchar(100) DEFAULT NULL,
  `action_type` varchar(100) DEFAULT NULL,
  `entity_affected` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `previous_state` text DEFAULT NULL,
  `new_state` text DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `transaction_type` varchar(50) DEFAULT NULL,
  `inventory_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log_entries`
--

INSERT INTO `log_entries` (`id`, `log_level`, `system_name`, `action_type`, `entity_affected`, `user_id`, `username`, `role`, `ip_address`, `message`, `details`, `previous_state`, `new_state`, `transaction_id`, `amount`, `transaction_type`, `inventory_id`, `quantity`, `date_created`, `date_updated`) VALUES
(1, 'INFO', 'reservation', 'CREATE', 'booking', 1, 'johndoe', 'admin', '192.168.1.1', 'Booking created', 'Booking ID: 1001', 'Pending', 'Confirmed', 'T123', 200.00, 'Credit', 10, 2, '2024-08-06 10:17:53', '2024-08-06 10:17:53'),
(2, 'ERROR', 'crm', 'UPDATE', 'customer', 2, 'janedoe', 'manager', '192.168.1.2', 'Failed to update customer', 'Customer ID: 2002', 'Active', 'Inactive', 'T124', 0.00, 'N/A', 0, 0, '2024-08-06 10:17:53', '2024-08-06 10:17:53'),
(3, 'INFO', 'finance', 'DELETE', 'transaction', 3, 'admin', 'admin', '192.168.1.3', 'Transaction deleted', 'Transaction ID: 3003', 'Completed', 'N/A', 'T125', 150.00, 'Debit', 20, 1, '2024-08-06 10:17:53', '2024-08-06 10:17:53'),
(4, 'WARNING', 'logistics', 'CREATE', 'shipment', 4, 'logmanager', 'logistics', '192.168.1.4', 'Shipment created', 'Shipment ID: 4004', 'In Transit', 'Delivered', 'T126', 500.00, 'Credit', 15, 5, '2024-08-06 10:17:53', '2024-08-06 10:17:53'),
(5, 'INFO', 'reservation', 'UPDATE', 'booking', 5, 'admin', 'admin', '192.168.1.5', 'Booking updated', 'Booking ID: 1002', 'Confirmed', 'Cancelled', 'T127', 100.00, 'Credit', 5, 1, '2024-08-06 10:17:53', '2024-08-06 10:17:53'),
(6, 'ERROR', 'crm', 'CREATE', 'customer', 6, 'janedoe', 'manager', '192.168.1.6', 'Failed to create customer', 'Customer Name: Alice', 'N/A', 'Active', 'T128', 0.00, 'N/A', 0, 0, '2024-08-06 10:17:53', '2024-08-06 10:17:53'),
(7, 'INFO', 'finance', 'UPDATE', 'transaction', 7, 'admin', 'admin', '192.168.1.7', 'Transaction updated', 'Transaction ID: 3004', 'Pending', 'Completed', 'T129', 250.00, 'Debit', 25, 3, '2024-08-06 10:17:53', '2024-08-06 10:17:53'),
(8, 'WARNING', 'logistics', 'UPDATE', 'shipment', 8, 'logmanager', 'logistics', '192.168.1.8', 'Shipment updated', 'Shipment ID: 4005', 'In Transit', 'Delivered', 'T130', 450.00, 'Credit', 10, 2, '2024-08-06 10:17:53', '2024-08-06 10:17:53'),
(9, 'INFO', 'reservation', 'DELETE', 'booking', 9, 'admin', 'admin', '192.168.1.9', 'Booking deleted', 'Booking ID: 1003', 'Confirmed', 'N/A', 'T131', 300.00, 'Credit', 12, 3, '2024-08-06 10:17:53', '2024-08-06 10:17:53'),
(10, 'ERROR', 'crm', 'DELETE', 'customer', 10, 'janedoe', 'manager', '192.168.1.10', 'Failed to delete customer', 'Customer ID: 2003', 'Active', 'N/A', 'T132', 0.00, 'N/A', 0, 0, '2024-08-06 10:17:53', '2024-08-06 10:17:53'),
(11, 'INFO', 'finance', 'CREATE', 'transaction', 11, 'admin', 'admin', '192.168.1.11', 'Transaction created', 'Transaction ID: 3005', 'Completed', 'N/A', 'T133', 350.00, 'Credit', 30, 4, '2024-08-06 10:17:53', '2024-08-06 10:17:53'),
(12, 'WARNING', 'logistics', 'DELETE', 'shipment', 12, 'logmanager', 'logistics', '192.168.1.12', 'Shipment deleted', 'Shipment ID: 4006', 'Delivered', 'N/A', 'T134', 550.00, 'Debit', 25, 6, '2024-08-06 10:17:53', '2024-08-06 10:17:53'),
(13, 'INFO', 'reservation', 'CREATE', 'booking', 13, 'admin', 'admin', '192.168.1.13', 'Booking created', 'Booking ID: 1004', 'Pending', 'Confirmed', 'T135', 400.00, 'Credit', 7, 2, '2024-08-06 10:17:53', '2024-08-06 10:17:53'),
(14, 'ERROR', 'crm', 'UPDATE', 'customer', 14, 'janedoe', 'manager', '192.168.1.14', 'Failed to update customer', 'Customer ID: 2004', 'Active', 'Inactive', 'T136', 0.00, 'N/A', 0, 0, '2024-08-06 10:17:53', '2024-08-06 10:17:53'),
(15, 'INFO', 'finance', 'DELETE', 'transaction', 15, 'admin', 'admin', '192.168.1.15', 'Transaction deleted', 'Transaction ID: 3006', 'Completed', 'N/A', 'T137', 200.00, 'Debit', 10, 3, '2024-08-06 10:17:53', '2024-08-06 10:17:53'),
(16, 'WARNING', 'logistics', 'CREATE', 'shipment', 16, 'logmanager', 'logistics', '192.168.1.16', 'Shipment created', 'Shipment ID: 4007', 'In Transit', 'Delivered', 'T138', 600.00, 'Credit', 8, 3, '2024-08-06 10:17:53', '2024-08-06 10:17:53'),
(17, 'INFO', 'reservation', 'UPDATE', 'booking', 17, 'admin', 'admin', '192.168.1.17', 'Booking updated', 'Booking ID: 1005', 'Confirmed', 'Cancelled', 'T139', 150.00, 'Credit', 3, 1, '2024-08-06 10:17:53', '2024-08-06 10:17:53'),
(18, 'ERROR', 'crm', 'CREATE', 'customer', 18, 'janedoe', 'manager', '192.168.1.18', 'Failed to create customer', 'Customer Name: Bob', 'N/A', 'Active', 'T140', 0.00, 'N/A', 0, 0, '2024-08-06 10:17:53', '2024-08-06 10:17:53'),
(19, 'INFO', 'finance', 'UPDATE', 'transaction', 19, 'admin', 'admin', '192.168.1.19', 'Transaction updated', 'Transaction ID: 3007', 'Pending', 'Completed', 'T141', 500.00, 'Credit', 40, 5, '2024-08-06 10:17:53', '2024-08-06 10:17:53'),
(20, 'WARNING', 'logistics', 'UPDATE', 'shipment', 20, 'logmanager', 'logistics', '192.168.1.20', 'Shipment updated', 'Shipment ID: 4008', 'In Transit', 'Delivered', 'T142', 700.00, 'Debit', 12, 4, '2024-08-06 10:17:53', '2024-08-06 10:17:53'),
(21, 'INFO', 'CRM', 'CREATE', 'user', 123, 'john_doe', 'admin', '192.168.1.1', 'User account created', 'User john_doe created an account with admin role', NULL, '{\"username\": \"john_doe\", \"role\": \"admin\"}', 'txn_001', NULL, NULL, NULL, NULL, '2024-08-06 11:34:28', '2024-08-06 11:34:28'),
(22, 'INFO', 'Finance', 'CREATE', 'invoice', 234123, 'maria.t', 'finance manager', '192.168.21.3', 'Payment is successful', 'User Maria received a notification that a booking is paid', '1750', NULL, 'AITI-0938', 1750.00, 'debit', NULL, NULL, '2024-08-06 11:45:20', '2024-08-06 11:45:20'),
(23, 'WARNING', 'Finance', 'CREATE', 'invoice', 2121212, 'victor.t', 'finance manager', '192.168.1.13', 'Payment is failed', 'User Victor received a notification that a payment in the booking is failed', '0', NULL, 'AITI-0939', 0.00, NULL, NULL, NULL, '2024-08-06 11:57:15', '2024-08-06 11:57:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log_entries`
--
ALTER TABLE `log_entries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log_entries`
--
ALTER TABLE `log_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
