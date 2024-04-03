--
-- Database: `parkingallotment`
--
create database parkingallotment
-- --------------------------------------------------------


-- Table structure for table `admin`
--
use parkingallotment;
CREATE TABLE `admin` (
  `adminid` int(11) NOT NULL,
  `password` varchar(100) NOT NULL
);

--
-- Dumping data for table `admin`
--
drop database  parkingallotment
INSERT INTO `admin` (`adminid`, `password`) VALUES
(1001, 'siri@123');
select * from admin;
-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `bookingid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `vehicle_type` varchar(50) NOT NULL,
  `vehicle_no` varchar(50) NOT NULL,
  `locationid` int(8) DEFAULT NULL,
  `slotid` varchar(20) NOT NULL,
  `date` varchar(30) NOT NULL,
  `time` varchar(20) NOT NULL,
  `duration` varchar(10) NOT NULL,
  `cost` varchar(100) NOT NULL,
  `paid` int(1) NOT NULL DEFAULT 0
) ;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`bookingid`, `email`, `vehicle_type`, `vehicle_no`, `locationid`, `slotid`, `date`, `time`, `duration`, `cost`, `paid`) VALUES
(22,'siri@gmail.com', 'Four Wheeler', 'TN-01-AA-1234', 1,'1slot1','12-7-2020','11:45','2','60',1),
(23,'snehitha@gmail.com', 'Four Wheeler', 'TN-01-AA-1111', 1,'1slot2','12-7-2020','12:58','2','60',1),
(25,'rishitha@gmail.com', 'Four Wheeler', 'TN-01-AA-1111', 2,'2slot2','13-7-2020','11:09','24','720',1),
(27,'vandhana@gmail.com', 'Four Wheeler', 'TN-01-AA-4321', 2,'2slot2','16-7-2020','14:28','1','30',1),
(28,'chandana@gmail.com','Two Wheeler', 'TN-39-AH-8687', 1,'1slot1','18-7-2020','20:51','9','90',1);
select * from bookings

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `locationid` int(8) UNSIGNED NOT NULL,
  `location_name` varchar(80) NOT NULL,
  `area` varchar(100) NOT NULL,
  `slots` int(8) NOT NULL
) ;
drop table locations
--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`locationid`, `location_name`, `area`, `slots`) VALUES
(1, 'Fathimanagar', ' Cross Cut Rd, warangal, telangana 506001', 3),
(2, 'miyapur', 'Dr Krishnasamy Mudaliyar Rd, Brookefields, Sukrawar Pettai, Ram Nagar, hyderabad 500004 ', 2),
(27, 'The Chennai Silks', 'Cross Cut Rd, Ram Nagar, Coimbatore, Tamil Nadu 641012', 2),
(28, 'Race Course', 'Coimbatore - 641 037, mumbai, INDIA.', 1);
0
-- --------------------------------------------------------

--
-- Table structure for table `slots`
--

CREATE TABLE `slots` (
  `slotid` varchar(20) NOT NULL,
  `locationid` int(8) NOT NULL,
  `slotno` varchar(20) NOT NULL,
  `status` int(8) NOT NULL,
  `time` varchar(20) NOT NULL,
  `duration` int(8) NOT NULL
) ;

--
-- Dumping data for table `slots`
--

INSERT INTO `slots` (`slotid`, `locationid`, `slotno`, `status`, `time`, `duration`) VALUES
('1slot1', 1, 'Slot 1', 0, '0', 0),
('1slot2', 1, 'Slot 2', 0, '0', 0),
('1slot3', 1, 'Slot 3', 0, '0', 0),
('27slot1', 27, 'Slot 1', 0, '0', 0),
('27slot2', 27, 'Slot 2', 0, '0', 0),
('28slot1', 28, 'Slot 1', 0, '0', 0),
('2slot1', 2, 'Slot 1', 0, '0', 0),
('2slot2', 2, 'Slot 2', 0, '0', 0);
drop table slots
-- --------------------------------------------------------
select * from slots
--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `email` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `mobno` varchar(15) NOT NULL,
  `password` varchar(200) DEFAULT NULL
) ;



INSERT INTO `users` (`email`, `fullname`, `mobno`, `password`) VALUES
('siri@gmail.com', 'siri chandana', '9666245806', 'siri@123'),
('snehitha@gmail.com', 'snehitha ', '9666246907', 'abc@123'),
('rishitha@gmail.com', 'rishitha', '1234567890', 'xyz@321'),
('vandhana@gmail.com', 'vandhana', '1234567890', '123@stu'),
('sirichandana.p96@gmail.com', 'sirichandana.p', '9666245906', '123@stu1');
TRUNCATE TABLE users;
-- --------------------------------------------------------
select * from users
--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `vehicleid` int(8) NOT NULL,
  `vehicle_type` varchar(50) NOT NULL,
  `cost` varchar(10) DEFAULT NULL
) ;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`vehicleid`, `vehicle_type`, `cost`) VALUES
(4, 'Two Wheeler', '10'),
(5, 'Four Wheeler', '30');
select * from vehicle;
--
drop table vehicle

-- Indexes for dumped tables
--
show tables
CREATE TABLE `login` (
  `login_id` INT AUTO_INCREMENT PRIMARY KEY,
  `user_email` VARCHAR(50),
  `admin_id` INT,
  FOREIGN KEY (`user_email`) REFERENCES `users` (`email`),
  FOREIGN KEY (`admin_id`) REFERENCES `admin` (`adminid`)
);
INSERT INTO `login` (`user_email`, `admin_id`) VALUES
('siri@gmail.com', NULL),
(NULL, 1001); 

select * from login
drop table login
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminid`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`bookingid`),
  ADD KEY `fk_email` (`email`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`locationid`);

--
-- Indexes for table `slots`
--
ALTER TABLE `slots`
  ADD PRIMARY KEY (`slotid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`vehicleid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `bookingid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `locationid` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `vehicleid` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `fk_email` FOREIGN KEY (`email`) REFERENCES `users` (`email`);
COMMIT;


