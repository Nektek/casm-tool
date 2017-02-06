-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               10.1.13-MariaDB - mariadb.org binary distribution
-- Server Betriebssystem:        Win32
-- HeidiSQL Version:             9.3.0.5049
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Exportiere Struktur von Tabelle casm-tool.assignment_group
CREATE TABLE IF NOT EXISTS `assignment_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organisationID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` longtext,
  `statusID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__organisation` (`organisationID`),
  KEY `FK_assignment_group_status` (`statusID`),
  CONSTRAINT `FK__organisation` FOREIGN KEY (`organisationID`) REFERENCES `organisation` (`id`),
  CONSTRAINT `FK_assignment_group_status` FOREIGN KEY (`statusID`) REFERENCES `assignment_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle casm-tool.assignment_group: ~4 rows (ungefähr)
/*!40000 ALTER TABLE `assignment_group` DISABLE KEYS */;
INSERT INTO `assignment_group` (`id`, `organisationID`, `name`, `description`, `statusID`) VALUES
	(1, 1, 'FM_Stuttgart', NULL, 1),
	(3, 1, 'FM_Bonn_Access', NULL, 2),
	(4, 1, 'Hallo', '', 1),
	(5, 2, 'Lel i think it Works', 'Test Description', 1);
/*!40000 ALTER TABLE `assignment_group` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle casm-tool.assignment_status
CREATE TABLE IF NOT EXISTS `assignment_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle casm-tool.assignment_status: ~2 rows (ungefähr)
/*!40000 ALTER TABLE `assignment_status` DISABLE KEYS */;
INSERT INTO `assignment_status` (`id`, `name`) VALUES
	(1, 'Status 1'),
	(2, 'Status 2'),
	(3, 'Status 3');
/*!40000 ALTER TABLE `assignment_status` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle casm-tool.assignment_sub_group
CREATE TABLE IF NOT EXISTS `assignment_sub_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignmentGroupID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` longtext,
  `statusID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_assignment_sub_group_assignment_group` (`assignmentGroupID`),
  KEY `FK_assignment_sub_group_status` (`statusID`),
  CONSTRAINT `FK_assignment_sub_group_assignment_group` FOREIGN KEY (`assignmentGroupID`) REFERENCES `assignment_group` (`id`),
  CONSTRAINT `FK_assignment_sub_group_status` FOREIGN KEY (`statusID`) REFERENCES `assignment_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle casm-tool.assignment_sub_group: ~3 rows (ungefähr)
/*!40000 ALTER TABLE `assignment_sub_group` DISABLE KEYS */;
INSERT INTO `assignment_sub_group` (`id`, `assignmentGroupID`, `name`, `description`, `statusID`) VALUES
	(2, 1, 'Backbone', NULL, 1),
	(3, 1, 'VoIP', NULL, 2),
	(4, 3, 'Fan_Access', NULL, 3),
	(5, 5, 'asd', 'asd peter trololololooolollllo', 2);
/*!40000 ALTER TABLE `assignment_sub_group` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle casm-tool.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle casm-tool.groups: ~2 rows (ungefähr)
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`id`, `name`) VALUES
	(1, 'Developer'),
	(2, 'Administrator');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle casm-tool.group_permissions
CREATE TABLE IF NOT EXISTS `group_permissions` (
  `groupID` int(11) NOT NULL,
  `permissionID` int(11) NOT NULL,
  KEY `FK__groups` (`groupID`),
  KEY `FK__permissions_groups` (`permissionID`),
  CONSTRAINT `FK__groups` FOREIGN KEY (`groupID`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK__permissions_groups` FOREIGN KEY (`permissionID`) REFERENCES `permissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle casm-tool.group_permissions: ~18 rows (ungefähr)
/*!40000 ALTER TABLE `group_permissions` DISABLE KEYS */;
INSERT INTO `group_permissions` (`groupID`, `permissionID`) VALUES
	(2, 7),
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 7),
	(1, 8),
	(1, 9),
	(1, 10),
	(1, 11),
	(1, 12),
	(1, 13),
	(1, 14),
	(1, 15),
	(1, 16),
	(1, 17),
	(1, 18);
/*!40000 ALTER TABLE `group_permissions` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle casm-tool.group_user_relation
CREATE TABLE IF NOT EXISTS `group_user_relation` (
  `userID` int(11) NOT NULL,
  `groupID` int(11) NOT NULL,
  KEY `FK__users_groups` (`userID`),
  KEY `FK__groups_user` (`groupID`),
  CONSTRAINT `FK__groups_user` FOREIGN KEY (`groupID`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK__users_groups` FOREIGN KEY (`userID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle casm-tool.group_user_relation: ~3 rows (ungefähr)
/*!40000 ALTER TABLE `group_user_relation` DISABLE KEYS */;
INSERT INTO `group_user_relation` (`userID`, `groupID`) VALUES
	(1, 1),
	(1, 2);
/*!40000 ALTER TABLE `group_user_relation` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle casm-tool.menu_point
CREATE TABLE IF NOT EXISTS `menu_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `parentID` int(11) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `FK_menu_menu` (`parentID`),
  CONSTRAINT `FK_menu_menu` FOREIGN KEY (`parentID`) REFERENCES `menu_point` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle casm-tool.menu_point: ~7 rows (ungefähr)
/*!40000 ALTER TABLE `menu_point` DISABLE KEYS */;
INSERT INTO `menu_point` (`id`, `name`, `parentID`, `description`) VALUES
	(1, 'Favoriten und Dashboards', NULL, NULL),
	(2, 'Change Management', 1, NULL),
	(3, 'Configuration Management', 1, NULL),
	(4, 'Change Management', NULL, NULL),
	(5, 'Administration', 1, NULL),
	(6, 'Groups', 5, NULL),
	(7, 'Settings', 5, NULL);
/*!40000 ALTER TABLE `menu_point` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle casm-tool.menu_point_access
CREATE TABLE IF NOT EXISTS `menu_point_access` (
  `roleID` int(11) NOT NULL,
  `menuID` int(11) NOT NULL,
  KEY `FK_menu_point_access_menu_point` (`menuID`),
  KEY `FK_menu_point_access_roles` (`roleID`),
  CONSTRAINT `FK_menu_point_access_menu_point` FOREIGN KEY (`menuID`) REFERENCES `menu_point` (`id`),
  CONSTRAINT `FK_menu_point_access_roles` FOREIGN KEY (`roleID`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle casm-tool.menu_point_access: ~4 rows (ungefähr)
/*!40000 ALTER TABLE `menu_point_access` DISABLE KEYS */;
INSERT INTO `menu_point_access` (`roleID`, `menuID`) VALUES
	(1, 1),
	(2, 4),
	(2, 1),
	(2, 6);
/*!40000 ALTER TABLE `menu_point_access` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle casm-tool.organisation
CREATE TABLE IF NOT EXISTS `organisation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle casm-tool.organisation: ~3 rows (ungefähr)
/*!40000 ALTER TABLE `organisation` DISABLE KEYS */;
INSERT INTO `organisation` (`id`, `name`) VALUES
	(1, 'FM'),
	(2, 'ESOC'),
	(3, 'DS');
/*!40000 ALTER TABLE `organisation` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle casm-tool.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `errorCode` int(11) NOT NULL,
  `errorMessage` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle casm-tool.permissions: ~17 rows (ungefähr)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `errorCode`, `errorMessage`) VALUES
	(1, 'User can view the userlist.', 1001, 'No Permission to view a complete Userlist.'),
	(2, 'User can view the Userdetails in the Admin-Panel.', 1002, 'No Permission to view the Userdetails in the Adminpanel.'),
	(3, 'User can view the Permissions of a specific user.', 1003, 'No Permission to view the Permissions of a specific User.'),
	(4, 'User can change the Permissions of a user.', 1004, 'No Permission to change the Permissions of a User.'),
	(5, 'User can view the Groups of a User.', 1005, 'No Permission to view the Groups of a User.'),
	(6, 'User can add User to other Groups.', 1006, 'No Permission to add Users to other Groups.'),
	(7, 'User can remove Groups from other Users.', 1007, 'No Permission to remove the group from this User.'),
	(8, 'User can view the Grouplist.', 1008, 'No Permission to view a complete Grouplist.'),
	(9, 'User can view a specific Group in the Admin-Panel', 1009, 'No Permission to view a specific Group.'),
	(10, 'User can list the Groupmembers.', 1010, 'No Permission to view the Members of a Group.'),
	(11, 'User can view the Permissions of a specific Group.', 1011, 'No Permission to view the Permissions of a specific Group.'),
	(12, 'User can change the Permissions of a Group', 1012, 'No Permission to change the Permissions of a Group.'),
	(13, 'User can delete a Group.', 1013, 'No Permission to delete a Group.'),
	(14, 'User can create a new Group.', 1014, 'No Permission to create a new Group.'),
	(15, 'User can view the Assignment-Groups.', 2015, 'No Permission to view the Assingment-Groups.'),
	(16, 'User can create new Assignment-Groups.', 2016, 'No Permission to create a new Assignment-Group.'),
	(17, 'User can create new Assignment-Sub-Groups.', 2017, 'No Permission to create a new Assignment--Sub-Group.'),
	(18, 'User can view the Menu-Points.', 2018, 'No Permission to view the Menu-Points.');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle casm-tool.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle casm-tool.roles: ~2 rows (ungefähr)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`) VALUES
	(1, 'Role Test'),
	(2, 'Role Next Test 2'),
	(3, 'Role 3 Free');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle casm-tool.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `rankName` varchar(50) NOT NULL DEFAULT '',
  `lastLogin` datetime DEFAULT NULL,
  `lastIP` varchar(50) NOT NULL DEFAULT '0.0.0.0',
  `registerDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle casm-tool.users: ~2 rows (ungefähr)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `email`, `password`, `rankName`, `lastLogin`, `lastIP`, `registerDate`) VALUES
	(1, 'nabrezzelt', 'nabrezzelt@trash-mail.com', '35e576830afed7fa287b4883e816dbf21c3129cfbca5fbec81bf702cde50f87c', 'Developer', '2017-02-06 09:36:09', '127.0.0.1', '2017-01-23 14:01:28');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle casm-tool.user_permissions
CREATE TABLE IF NOT EXISTS `user_permissions` (
  `userID` int(11) NOT NULL,
  `permissionID` int(11) NOT NULL,
  KEY `FK__users` (`userID`),
  KEY `FK__permissions` (`permissionID`),
  CONSTRAINT `FK__permissions` FOREIGN KEY (`permissionID`) REFERENCES `permissions` (`id`),
  CONSTRAINT `FK__users` FOREIGN KEY (`userID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle casm-tool.user_permissions: ~13 rows (ungefähr)
/*!40000 ALTER TABLE `user_permissions` DISABLE KEYS */;
INSERT INTO `user_permissions` (`userID`, `permissionID`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 7),
	(1, 8),
	(1, 9),
	(1, 10),
	(1, 11),
	(1, 12),
	(1, 13);
/*!40000 ALTER TABLE `user_permissions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;