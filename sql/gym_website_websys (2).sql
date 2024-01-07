-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2024 at 10:35 AM
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
-- Database: `gym_website_websys`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_username` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_username`, `admin_password`) VALUES
('admin1', 'admin1'),
('admin2', 'admin2');

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

CREATE TABLE `calendar` (
  `routine_id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start_event` datetime NOT NULL,
  `end_event` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `calendar`
--

INSERT INTO `calendar` (`routine_id`, `userID`, `title`, `start_event`, `end_event`) VALUES
(1, 1, 'Leg Day', '2024-01-07 00:08:37', '2024-01-06 00:12:37'),
(2, 15, 'Upper Body Workout', '2024-01-10 00:00:00', '2024-01-11 00:00:00'),
(3, 15, 'Leg and Core Workout', '2024-01-14 00:00:00', '2024-01-17 00:00:00'),
(4, 1, 'Cardio Day', '2024-02-28 00:00:00', '2024-02-29 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `added_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryID` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryID`, `categoryName`) VALUES
(1, 'Shoes'),
(2, 'Clothing');

-- --------------------------------------------------------

--
-- Table structure for table `checkins`
--

CREATE TABLE `checkins` (
  `checkinID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `date_checkin` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `checkins`
--

INSERT INTO `checkins` (`checkinID`, `userID`, `username`, `date_checkin`) VALUES
(17, 14, 'allen1', '2023-12-13 18:01:51'),
(18, 3, 'Gerald123', '2024-01-06 19:05:06'),
(19, 3, 'Gerald123', '2024-01-06 19:46:36'),
(20, 1, 'Patrick11', '2024-01-06 19:47:43'),
(21, 1, 'Patrick11', '2024-01-06 19:48:13'),
(22, 1, 'Patrick11', '2024-01-06 19:53:03'),
(23, 1, 'Patrick11', '2024-01-06 19:53:33'),
(24, 10, 'Recy12', '2024-01-06 19:54:06'),
(25, 10, 'Recy12', '2024-01-06 19:55:27'),
(26, 10, 'Recy12', '2024-01-06 19:55:54'),
(27, 3, 'Gerald123', '2024-01-06 20:42:53'),
(28, 16, 'uhaw1234', '2024-01-07 17:34:20');

-- --------------------------------------------------------

--
-- Table structure for table `coach`
--

CREATE TABLE `coach` (
  `coach_id` int(11) NOT NULL,
  `coach_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coach`
--

INSERT INTO `coach` (`coach_id`, `coach_name`) VALUES
(5, 'Post Malone'),
(6, 'Bruno Mars'),
(7, 'Anita Max Wynn');

-- --------------------------------------------------------

--
-- Table structure for table `featured_products`
--

CREATE TABLE `featured_products` (
  `featuredID` int(11) NOT NULL,
  `productID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `featured_products`
--

INSERT INTO `featured_products` (`featuredID`, `productID`) VALUES
(3, 8),
(1, 11),
(2, 13);

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `membershipID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `membership_type` varchar(50) NOT NULL,
  `membership_fee` decimal(10,2) NOT NULL,
  `payment_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`membershipID`, `userID`, `start_date`, `end_date`, `membership_type`, `membership_fee`, `payment_status`) VALUES
(14, 3, '2023-12-13', '2024-12-12', 'annual', 3000.00, ''),
(15, 12, '2023-12-13', '2023-12-27', 'semi-monthly', 150.00, ''),
(17, 7, '2023-12-13', '2023-12-27', 'semi-monthly', 150.00, ''),
(18, 10, '2023-12-13', '2024-01-12', 'monthly', 300.00, ''),
(19, 9, '2023-12-13', '2023-12-28', 'semi-monthly', 150.00, ''),
(20, 13, '2023-12-13', '2024-12-13', 'annual', 3000.00, ''),
(21, 14, '2023-12-13', '2024-01-13', 'monthly', 300.00, ''),
(28, 15, '2024-01-06', '2025-01-06', 'annual', 3000.00, ''),
(33, 4, '2024-01-07', '2024-02-07', 'monthly', 300.00, ''),
(34, 16, '2024-01-07', '2024-01-22', 'semi-monthly', 150.00, '');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `desc` text NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `rrp` decimal(7,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL,
  `img` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `desc`, `price`, `rrp`, `quantity`, `img`, `date_added`) VALUES
(6, 'Fitness Tracker Band', 'The \"Fitness Tracker Band\" is a sleek and versatile wearable designed to enhance your fitness journey. With advanced features such as heart rate monitoring, step tracking, and sleep analysis, this band provides comprehensive insights into your daily activities. Its stylish design ensures comfort throughout workouts or daily wear, while the intuitive interface allows for easy navigation. Stay motivated and achieve your fitness goals with the Fitness Tracker Band – your reliable companion for a healthier lifestyle.', 3999.99, 4599.99, 194, 'fitnesstrackerband.jpg', '2023-12-12 22:30:53'),
(7, 'Kettlebell', 'Kettle bell is a versatile and dynamic fitness tool, essential for strength training and functional workouts. Crafted from durable materials, our kettlebells offer a comfortable grip and balanced design, allowing users to engage in a wide range of exercises to target various muscle groups. Ideal for both beginners and seasoned fitness enthusiasts, these kettlebells are perfect for enhancing cardiovascular fitness, building strength, and promoting overall wellness. Elevate your home gym experience with our high-quality kettlebells, designed to deliver effective and efficient workouts. ', 598.00, 698.00, 47, 'kettlebell.jpg', '2023-12-12 22:33:09'),
(8, 'Protein Bar', 'Indulge in our high-protein bars, the perfect on-the-go snack to fuel your active lifestyle. Packed with premium protein, these bars offer a delicious and convenient way to support your muscle recovery and energy needs. Whether you\'re hitting the gym or craving a nutritious treat, our protein bars provide a tasty blend of flavors while delivering the essential nutrients your body deserves. ', 28.00, 32.00, 235, 'proteinbar.jpg', '2023-12-12 22:34:25'),
(9, 'Yoga Mat', 'Discover the perfect companion for your yoga practice with our premium Yoga Mat. Designed for optimal comfort and support, this non-slip mat provides a stable foundation for your poses. The durable and eco-friendly material ensures longevity, while the lightweight design makes it convenient for on-the-go yogis. Elevate your practice with a mat that combines functionality with style, offering a slip-resistant surface and easy maintenance. Embrace the serenity of your yoga journey with our high-quality Yoga Mat, an essential for every mindful practitioner.', 589.30, 679.50, 34, 'yogamat.jpg', '2023-12-12 22:35:37'),
(10, 'Resistance Bands for Working Out', 'Enhance your workout routine with our Fabric Resistance Bands Set designed for both women and men. These booty bands provide targeted resistance, making them ideal for leg workouts. Whether you\'re at the gym or in the comfort of your home, these exercise bands are perfect for strengthening and toning your lower body. The set includes a variety of resistance levels, allowing you to customize your fitness routine. Elevate your exercise experience with these durable and versatile workout bands, crafted for maximum comfort and effectiveness. Achieve your fitness goals with style and convenience using our premium Fabric Resistance Bands.', 340.00, 0.00, 57, 'resistancebands.jpg', '2023-12-12 22:40:11'),
(11, 'Active Quick Dry Crew T Shirts', 'The \"Active Quick Dry Crew T-Shirts\" are the perfect blend of comfort and functionality. Crafted with a quick-drying fabric, these T-shirts keep you cool and dry during intense workouts or active pursuits. The crew neck design offers a classic and versatile look, suitable for both exercise and casual wear. Whether you\'re hitting the gym or navigating a busy day, these T-shirts provide the breathability and moisture-wicking performance you need to stay comfortable and stylish throughout your activities. Elevate your active wardrobe with these essential and high-performance quick-dry T-shirts.', 499.75, 0.00, 47, 'gymshirt.jpg', '2023-12-12 23:05:50'),
(12, 'Quick Dry Activewear with Pockets', 'Elevate your game with our Athletic Basketball Shorts – a perfect blend of style and functionality. Crafted from breathable mesh fabric, these shorts offer quick-dry technology to keep you cool and comfortable on and off the court. Featuring convenient pockets for added versatility, these activewear shorts are designed to enhance your performance while providing a sleek and modern look. Whether you\'re hitting the gym or dominating the basketball court, our Athletic Basketball Shorts are your go-to choice for superior comfort and athletic style.', 395.25, 0.00, 187, 'shorts.jpg', '2023-12-12 23:05:50'),
(13, 'Ultraboost 22 Running Shoes', 'Experience peak performance with our Men\'s Ultraboost 22 Running Shoes. Engineered for comfort and speed, these cutting-edge running shoes feature advanced cushioning technology for a responsive and energized run. The sleek design combines style with functionality, providing a perfect blend of support and flexibility. Whether you\'re hitting the track or the pavement, these Ultraboost 22 Running Shoes deliver unparalleled comfort and performance, making every run an exhilarating experience.', 1999.50, 2799.80, 9, 'shoes.jpg', '2023-12-12 23:10:08'),
(14, 'Breathable Sneakers ONEMIX', 'Experience the perfect blend of comfort and style with ONEMIX Light Armor 21601 Breathable Sneakers. Designed for the modern individual, these sneakers feature advanced breathable technology that keeps your feet cool and comfortable throughout the day. The Light Armor series combines sleek aesthetics with innovative materials, ensuring a lightweight feel without compromising durability. Whether you\'re hitting the gym, running errands, or simply enjoying a casual day out, these sneakers provide the ideal balance of support and breathability. Elevate your footwear collection with ONEMIX Light Armor 21601, where fashion meets functionality for the active lifestyle.', 11499.99, 27000.99, 3, 'onemix.jpg', '2023-12-12 23:10:08'),
(15, 'IRON °FLASK Sports Water Bottle', 'The \"IRON °FLASK Sports Water Bottle\" is a premium hydration solution designed for active lifestyles. Crafted with durable stainless steel, this sports water bottle is built to withstand the demands of your toughest workouts. With a sleek and modern design, it not only delivers on performance but also makes a stylish statement. The double-wall vacuum insulation keeps your beverages at the desired temperature, whether you\'re enjoying a refreshing cold drink or a piping hot beverage. The wide-mouth opening ensures easy filling, and the leak-proof lid guarantees a mess-free experience on the go. Stay hydrated in style with the IRON °FLASK Sports Water Bottle, your reliable companion for all your fitness endeavors.', 599.00, 0.00, 35, 'tumblr.jpg', '2023-12-13 02:46:15');

-- --------------------------------------------------------

--
-- Table structure for table `qrcode`
--

CREATE TABLE `qrcode` (
  `qr_codeID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `qr_username` varchar(255) NOT NULL,
  `qr_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `qrcode`
--

INSERT INTO `qrcode` (`qr_codeID`, `userID`, `qr_username`, `qr_image`) VALUES
(32, 9, 'Recy1', '1702304999.png'),
(33, 9, 'Recy1', '1702305006.png'),
(34, 1, 'Patrick11', '1702305130.png'),
(35, 3, 'Gerald123', '1702308972.png'),
(36, 11, 'Recy123', '1702378698.png'),
(37, 10, 'Recy12', '1702410844.png'),
(38, 9, 'Recy1', '1702427073.png'),
(39, 9, 'Recy1', '1702427091.png'),
(40, 9, 'Recy1', '1702427095.png'),
(41, 9, 'Recy1', '1702427333.png'),
(42, 9, 'Recy1', '1702427398.png'),
(43, 9, 'Recy1', '1702427831.png'),
(44, 9, 'Recy1', '1702428065.png'),
(45, 9, 'Recy1', '1702428098.png'),
(46, 9, 'Recy1', '1702428163.png'),
(47, 9, 'Recy1', '1702428216.png'),
(48, 9, 'Recy1', '1702428252.png'),
(49, 9, 'Recy1', '1702428266.png'),
(50, 4, 'Paulo-1.-.', '1702438873.png'),
(51, 4, 'Paulo-1.-.', '1702439252.png'),
(52, 4, 'Paulo-1.-.', '1702439353.png'),
(53, 4, 'Paulo-1.-.', '1702440459.png'),
(54, 14, 'allen1', '1702460761.png'),
(55, 15, 'uhaw123', '1704373579.png'),
(56, 16, 'uhaw1234', '1704620033.png');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `coach_selected` varchar(255) NOT NULL,
  `workout` varchar(50) NOT NULL,
  `date_of_workout` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `date_of_creation` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `userID`, `coach_selected`, `workout`, `date_of_workout`, `start_time`, `end_time`, `date_of_creation`) VALUES
(10, 3, '', 'chest', '2023-12-25', '07:56:00', '19:56:00', '2023-12-10 19:56:47'),
(11, 3, '', 'back', '2023-12-22', '07:57:00', '19:57:00', '2023-12-10 19:57:38'),
(12, 3, '', 'triceps', '2023-12-21', '07:58:00', '08:58:00', '2023-12-10 19:58:33'),
(13, 3, '', 'core', '2023-12-11', '21:09:00', '22:09:00', '2023-12-10 20:09:39'),
(14, 1, '', 'chest', '2023-12-25', '14:00:00', '15:00:00', '2023-12-10 20:54:34'),
(15, 1, '', 'back', '2023-12-25', '03:21:00', '04:21:00', '2023-12-11 10:21:45'),
(16, 11, '', 'back', '2023-12-15', '20:49:00', '23:49:00', '2023-12-12 18:49:10'),
(17, 14, '', 'back', '2023-12-16', '17:47:00', '20:47:00', '2023-12-13 17:47:51'),
(29, 1, 'Post Malone', 'Chest, Shoulder, Triceps', '2024-01-10', '09:40:00', '11:00:00', '2024-01-06 23:39:24'),
(30, 1, '', 'Back, Core, Biceps', '2024-01-20', '10:00:00', '12:30:00', '2024-01-06 23:42:06'),
(31, 1, 'Post Malone', 'Chest, Shoulder, Triceps', '2024-01-10', '11:00:00', '13:00:00', '2024-01-06 23:52:01'),
(32, 15, 'Bruno Mars', 'Chest, Shoulder, Triceps', '2024-01-07', '08:00:00', '10:00:00', '2024-01-06 23:55:34'),
(33, 4, 'Anita Max Wynn', 'Chest, Shoulder, Triceps', '2024-01-10', '18:00:00', '22:00:00', '2024-01-07 17:17:50');

-- --------------------------------------------------------

--
-- Table structure for table `shopmanager`
--

CREATE TABLE `shopmanager` (
  `sm_username` varchar(255) NOT NULL,
  `sm_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shopmanager`
--

INSERT INTO `shopmanager` (`sm_username`, `sm_password`) VALUES
('manager1', 'manager1'),
('manager2', 'manager2');

-- --------------------------------------------------------

--
-- Table structure for table `tracker`
--

CREATE TABLE `tracker` (
  `tracker_id` int(11) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `weight` double NOT NULL,
  `height` double NOT NULL,
  `bmi_classification` varchar(50) NOT NULL,
  `bmi` decimal(10,2) NOT NULL,
  `date_of_bmi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tracker`
--

INSERT INTO `tracker` (`tracker_id`, `user_ID`, `weight`, `height`, `bmi_classification`, `bmi`, `date_of_bmi`) VALUES
(26, 7, 50.5, 167, 'Underweight', 18.11, '2023-12-13'),
(27, 7, 60.1, 123, 'Obesity', 39.73, '2023-12-13'),
(28, 1, 50.5, 167, 'Underweight', 18.11, '2023-12-13'),
(29, 1, 53.89, 169, 'Normal weight', 18.87, '2023-12-13'),
(30, 1, 48.98, 169, 'Underweight', 17.15, '2023-12-13'),
(31, 1, 60.1, 173, 'Normal weight', 20.08, '2023-12-13'),
(32, 1, 70.34, 180, 'Normal weight', 21.71, '2023-12-13'),
(33, 13, 55, 155, 'Normal weight', 22.92, '2023-05-09'),
(34, 13, 65, 157, 'Obesity', 26.40, '2023-07-10'),
(35, 13, 50, 157, 'Normal weight', 20.38, '2023-10-28'),
(36, 13, 55, 158, 'Normal weight', 22.02, '2023-11-17'),
(37, 13, 50, 157, 'Normal weight', 20.38, '2023-09-22'),
(38, 13, 67, 155, 'Overweight', 27.89, '2023-12-13'),
(39, 13, 60, 173, 'Normal weight', 20.05, '2023-12-13'),
(40, 1, 65, 180, 'Normal weight', 20.06, '2024-01-04');

-- --------------------------------------------------------

--
-- Table structure for table `training_guide`
--

CREATE TABLE `training_guide` (
  `training_id` int(11) NOT NULL,
  `training_name` varchar(255) NOT NULL,
  `training_video_link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `training_guide`
--

INSERT INTO `training_guide` (`training_id`, `training_name`, `training_video_link`) VALUES
(1, 'Bench Press', 'https://www.youtube.com/watch?v=4Y2ZdHCOXok'),
(2, 'Bench Press', 'https://www.youtube.com/watch?v=4Y2ZdHCOXok'),
(3, 'Dip', 'https://www.youtube.com/watch?v=l41SoWZiowI'),
(4, 'Dip', 'https://www.youtube.com/watch?v=l41SoWZiowI'),
(5, 'Incline Dumbbell Bench Press', 'https://www.youtube.com/watch?v=IP4oeKh1Sd4'),
(6, 'Incline Dumbbell Bench Press', 'https://www.youtube.com/watch?v=IP4oeKh1Sd4');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `userID` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `birthdate` date NOT NULL,
  `address` varchar(255) NOT NULL,
  `phoneNumber` varchar(50) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `confirm_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`userID`, `fname`, `lname`, `sex`, `birthdate`, `address`, `phoneNumber`, `username`, `password`, `confirm_password`) VALUES
(1, 'Patrick John', 'Tomas', 'Male', '2023-02-07', '', '09372367263', 'Patrick11', 'patpat', 'patpat'),
(3, 'Gerald', 'Tomas', 'male', '2010-10-01', '', '09123456789', 'Gerald123', 'gerald', 'gerald'),
(4, 'Pacinio', 'Tomaso', 'Female', '2023-05-03', '', '4832932479', 'Paulo123', 'paulo', 'paulo'),
(7, 'Mingming', 'Tomas', 'female', '2023-09-14', '', '098789765456', 'Mingming143', 'ming', 'ming'),
(9, 'Recy', 'Alejandre', 'male', '2023-12-13', '', '09879757975', 'Recy1', '123', '123'),
(10, 'Recy', 'Alejandre', 'male', '2023-12-07', '', '09879757975', 'Recy12', '123', '123'),
(11, 'Recy', 'Alejandre', 'male', '2023-12-07', '', '09879757975', 'Recy123', '123', '123'),
(12, 'Recy', 'Alejandre', 'male', '2023-12-04', '', '09879757975', 'Recy1234', '123', '123'),
(13, 'Patrick', 'Tomas', 'Male', '2002-02-12', '', '09123456789', 'patpat', 'patpat11', 'patpat11'),
(14, 'allen', 'alvaro', 'Male', '2023-09-07', '', '09123456789', 'allen1', 'allen123', 'allen123'),
(15, 'Dilaw', 'Uhaw', 'Female', '2003-02-28', 'Urdaneta City, Pangasinan', '09876543212', 'uhaw123', 'uhawuhaw', 'uhawuhaw'),
(16, 'Dilaw', 'Uhaw', 'Male', '2024-01-04', 'Urdaneta City, Pangasinan', '09876543212', 'uhaw1234', 'uhawuhaw', 'uhawuhaw'),
(17, 'Dilaw', 'Uhaw', 'Male', '2024-01-19', 'Urdaneta City, Pangasinan', '09876543212', 'uhaw12345', 'uhaw', 'uhaw'),
(18, 'Dilaw', 'Uhaw', 'Male', '2024-02-02', 'Urdaneta City, Pangasinan', '09876543212', 'uhaw123456', 'uhawuhaw', 'uhawuhaw');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_username`);

--
-- Indexes for table `calendar`
--
ALTER TABLE `calendar`
  ADD PRIMARY KEY (`routine_id`),
  ADD KEY `fk_calendar_user` (`userID`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `checkins`
--
ALTER TABLE `checkins`
  ADD PRIMARY KEY (`checkinID`),
  ADD KEY `Fk_validate_checkin` (`userID`);

--
-- Indexes for table `coach`
--
ALTER TABLE `coach`
  ADD PRIMARY KEY (`coach_id`);

--
-- Indexes for table `featured_products`
--
ALTER TABLE `featured_products`
  ADD PRIMARY KEY (`featuredID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`membershipID`),
  ADD KEY `Fk_membership_user` (`userID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qrcode`
--
ALTER TABLE `qrcode`
  ADD PRIMARY KEY (`qr_codeID`),
  ADD KEY `Fk_user_qr` (`userID`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `Fk_sched_user` (`userID`);

--
-- Indexes for table `shopmanager`
--
ALTER TABLE `shopmanager`
  ADD PRIMARY KEY (`sm_username`);

--
-- Indexes for table `tracker`
--
ALTER TABLE `tracker`
  ADD PRIMARY KEY (`tracker_id`),
  ADD KEY `Fk_user_bmi` (`user_ID`);

--
-- Indexes for table `training_guide`
--
ALTER TABLE `training_guide`
  ADD PRIMARY KEY (`training_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calendar`
--
ALTER TABLE `calendar`
  MODIFY `routine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `checkins`
--
ALTER TABLE `checkins`
  MODIFY `checkinID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `coach`
--
ALTER TABLE `coach`
  MODIFY `coach_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `featured_products`
--
ALTER TABLE `featured_products`
  MODIFY `featuredID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `membershipID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `qrcode`
--
ALTER TABLE `qrcode`
  MODIFY `qr_codeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tracker`
--
ALTER TABLE `tracker`
  MODIFY `tracker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `training_guide`
--
ALTER TABLE `training_guide`
  MODIFY `training_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `calendar`
--
ALTER TABLE `calendar`
  ADD CONSTRAINT `fk_calendar_user` FOREIGN KEY (`userID`) REFERENCES `user_info` (`userID`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `checkins`
--
ALTER TABLE `checkins`
  ADD CONSTRAINT `Fk_validate_checkin` FOREIGN KEY (`userID`) REFERENCES `user_info` (`userID`);

--
-- Constraints for table `featured_products`
--
ALTER TABLE `featured_products`
  ADD CONSTRAINT `featured_products_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `products` (`id`);

--
-- Constraints for table `membership`
--
ALTER TABLE `membership`
  ADD CONSTRAINT `Fk_membership_user` FOREIGN KEY (`userID`) REFERENCES `user_info` (`userID`);

--
-- Constraints for table `qrcode`
--
ALTER TABLE `qrcode`
  ADD CONSTRAINT `Fk_user_qr` FOREIGN KEY (`userID`) REFERENCES `user_info` (`userID`);

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `Fk_sched_user` FOREIGN KEY (`userID`) REFERENCES `user_info` (`userID`);

--
-- Constraints for table `tracker`
--
ALTER TABLE `tracker`
  ADD CONSTRAINT `Fk_user_bmi` FOREIGN KEY (`user_ID`) REFERENCES `user_info` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
