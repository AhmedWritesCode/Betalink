-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2025 at 04:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `betalink`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(8, 'Course Files'),
(9, 'Research'),
(10, 'Course Coordination'),
(11, 'Internship'),
(12, 'PSM 1'),
(13, 'Timetable'),
(15, 'Training'),
(16, 'Workshop'),
(17, 'Meeting'),
(18, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `sharedBy` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `resourceLink` varchar(255) NOT NULL,
  `lecturerId` varchar(255) DEFAULT NULL,
  `visibility` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`id`, `name`, `category`, `description`, `sharedBy`, `date`, `resourceLink`, `lecturerId`, `visibility`) VALUES
(1, 'Timetable', 'Timetable', 'Undergraduate Timetable 2024/2025-1', 'rohani.mzain@gmail.com', '2024-01-01', 'https://bit.ly/Timetable202420251', '12085', 2),
(2, 'DSA', 'Course Coordination', 'Data Structure and Algorithm course materials', 'mrazak@utm.my', '2024-01-01', 'https://drive.google.com/drive/folders/???', '12085', 2),
(3, 'AD', 'Course Coordination', 'Application Development course materials', 'shahida@utm.my', '2024-01-01', 'https://drive.google.com/drive/folders/???', '12085', 2),
(4, 'WebTech', 'Course Coordination', 'Web Technology course materials', 'rizam@utm.my', '2024-01-01', 'https://drive.google.com/drive/folders/???', '12085', 2),
(5, 'OOP', 'Course Coordination', 'Course assessments', 'aszuraini@utm.my', '2024-01-01', 'https://drive.google.com/drive/folders/???', '12085', 2),
(6, 'OOP-SPACE', 'Course Files', 'Course files submission for SECJ2154/SCSJ2154', 'hakim@utmspace.edu.my', '2024-01-01', 'https://drive.google.com/drive/folders/???', '12085', 2),
(7, 'SE Department Meeting (Bil. 2)', 'Meeting', 'Mesyuarat Jabatan SE Bil. 2 2023/2024', 'radziahm@utm.my', '2024-01-01', 'https://drive.google.com/drive/folders/???', '12085', 2),
(8, 'SE Department Meeting (Bil. 1)', 'Meeting', 'Mesyuarat Jabatan SE Bil. 1 2023/2024', 'radziahm@utm.my', '2024-01-01', 'https://drive.google.com/drive/folders/???', '12085', 2),
(9, 'DevOps Training', 'Training', 'DevOps Fundamental Training Materials', 'radziahm@utm.my', '2024-01-01', 'https://drive.google.com/drive/folders/???', '12085', 2),
(10, 'Course Rubric', 'Training', 'Kursus Pembangunan Rubrik Penilaian - Siri 2', 'radziahm@utm.my', '2024-01-01', 'https://drive.google.com/drive/folders/???', '12085', 2),
(11, 'Book Chapter', 'Training', 'Kursus Penerbitan Book Chapter', 'radziahm@utm.my', '2024-01-01', 'https://drive.google.com/drive/folders/???', '12085', 1),
(12, 'BSE Teaching Materials', 'Workshop', 'Bengkel Penyediaan Material Pengajaran Tahun 1 BSE', 'radziahm@utm.my', '2024-01-01', 'https://drive.google.com/drive/folders/???', '12085', 1),
(13, 'DSA', 'Course Coordination', 'Data Structure and Algorithm course materials', 'johana@utm.my', '2023-08-01', 'https://drive.google.com/drive/folders/???', '12085', 1),
(14, 'SECJ2013-03', 'Course Files', 'Course files submission for DSA Course Section 03', 'academicoffice@fc.utm.my', '2023-08-01', 'https://drive.google.com/drive/folders/???', '12085', 1),
(15, 'SECJ2013-09', 'Course Files', 'Course files submission for DSA Course Section 09', 'academicoffice@fc.utm.my', '2023-08-01', 'https://drive.google.com/drive/folders/???', '12085', 1),
(16, 'SECR3104-03', 'Course Files', 'Course files submission for AD Course (R) Section 03', 'academicoffice@fc.utm.my', '2023-08-01', 'https://drive.google.com/drive/folders/???', '12085', 1),
(17, 'Evaluation Form', 'Internship', 'Borang Penilaian Latihan Industri oleh Penyelia Fakulti', 'norsham@utm.my', '2023-08-01', 'https://forms.gle/???', '12085', 1),
(18, 'Visit Form', 'Internship', 'Borang lawatan latihan praktik', 'norsham@utm.my', '2023-08-01', 'https://forms.gle/???', '12085', 1),
(19, 'Presentation Schedule', 'PSM 1', 'Jadual pembentangan PSM 1 untuk dilengkapkan oleh penilai', 'noraini_ib@utm.my', '2023-08-01', 'https://docs.google.com/spreadsheets/d/???', '12085', 1),
(20, 'SV Project Proposal', 'PSM 1', 'Project Proposal by Supervisor', 'noraini@utm.my', '2023-08-01', 'https://docs.google.com/spreadsheets/d/???', '12085', 1),
(21, 'Undergraduate', 'Timetable', 'Course-section timetable for undergraduate program', 'sp-rohani@utm.my', '2023-08-01', 'https://bit.ly/202320241', '9876', 2),
(22, 'BSE Program', 'Training/Workshop', 'Materials for Course Constructive Alignment of BSE Program', 'radziahm@utm.my', '2023-08-01', 'https://drive.google.com/drive/folders/???', '5432', 2),
(23, 'SECJ3104-01', 'Course Files', 'Course files submission for AD Course (J) Section 01', 'academicoffice@fc.utm.my', '2021-12-31', 'https://drive.google.com/drive/folders/???', '6789', 1),
(24, 'SECV3104-01', 'Course Files', 'Course files submission for AD Course (V) Section 01', 'academicoffice@fc.utm.my', '2022-01-01', 'https://drive.google.com/drive/folders/???', '4321', 2),
(25, 'SECJ2154-07', 'Course Files', 'Course files submission for OOP Course Section 07', 'academicoffice@fc.utm.my', '2022-06-01', 'https://drive.google.com/drive/folders/???', '8765', 2),
(26, 'UTMFR', 'Research', 'UTMFR Slides', 'murtadha@utm.my', '2022-05-31', 'https://drive.google.com/drive/folders/???', '3210', 1),
(27, 'Project Report Examples', 'Course Files', 'Report Examples for SECJ3104 Project', 'mrazak@utm.my', '2024-10-10', 'https://drive.google.com/drive/folders/11agIp2CSMIwrizRHJoCCQRQm_uVk98IL', '12085', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
