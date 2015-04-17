-- Table structure for table `userslogin`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT COMMENT 'Many user ids to 1 tracker id',
  `department_id` tinyint(5) NOT NULL COMMENT 'FK to department table',
  `username` varchar(55) NOT NULL,
  `password` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `file_no` varchar(55) DEFAULT NULL COMMENT 'FK to file_no in track tbl/must enter Naseni file number',
  `file_name` varchar(55) NOT NULL,
  `file_description` varchar(255) NOT NULL,
  `file_volume` tinyint(5) NOT NULL,
  `category_id` varchar(55) NOT NULL COMMENT 'FK to category table, many categories to many files',
  `file_sub` varchar(15) NOT NULL,
  `tracker_id` int(11) NOT NULL COMMENT 'PK to tracker',
  PRIMARY KEY (`id`),
  KEY `category` (`category_id`),
  KEY `category_2` (`category_id`),
  KEY `file_sub` (`file_sub`),
  KEY `file_no` (`file_no`), COMMENT 'Naseni file number'
  KEY `file_name` (`file_name`),
  KEY `tracker_id` (`tracker_id`),
  KEY `tracker_id_2` (`tracker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_name` (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- Table structure for table `trackers`
--

CREATE TABLE IF NOT EXISTS `trackers` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT COMMENT 'trckid to many file numbers, 1 to many/ 1 tracker id to many users/ 1 tracker id to many offices',
  `officer_collecting` varchar(55) NOT NULL,
  `officer_recieving` varchar(55) NOT NULL,
  `date_received` datetime DEFAULT NULL,
  `date_collected` datetime DEFAULT NULL,
  `office_id` tinyint(11) NOT NULL COMMENT 'FK to office tbl',
  `status` varchar(5) NOT NULL,
  `notes` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `officer_collecting` (`officer_collecting`),
  KEY `officer_recieving` (`officer_recieving`),
  KEY `date_received` (`date_received`),
  KEY `date_collected` (`date_collected`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- Table structure for table `offices`
--

CREATE TABLE IF NOT EXISTS `offices` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `offices_description` varchar(55) NOT NULL,
  `department_id` varchar(11) NOT NULL COMMENT 'FK to department table',
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  KEY `offices_description` (`offices_description`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT COMMENT '1 department to many tracker id/1 department to many offices',
  `dept_name` varchar(55) NOT NULL,
  `dept_head` varchar(55) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
