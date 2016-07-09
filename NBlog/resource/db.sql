CREATE Database mybatis;
----------测试表（待删除）----------
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `age` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
-------------正式表------------------
Drop Table If Exists UserInformation;
Create Table UserInformation
	(SystemNo varchar(32) PRIMARY KEY,
	 Name varchar(64) Not Null Unique,
	 Password varchar(64) Not Null,
	 Email varchar(64) ,
	 MobilePhone char(11) ,
	 Address varchar(128) ,
	 Career varchar(64) ,
	 Industry varchar(64) ,
	 Type char(1) Not Null Default '0',
	 SignTime char(14) Not Null
	 )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Drop Table If Exists UserPasswordChange;
Create Table UserPasswordChange
	(Name varchar(64) Not Null,
	 OldPassword varchar(64) Not Null,
	 NewPassword varchar(64) Not Null,
	 ChangeTime varchar(64) Not Null,
	 UNIQUE KEY `pwdChange` (Name,OldPassword,NewPassword) 
	 )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Drop Table If Exists Menu;
Create Table  Menu
	(MenuNo char(4) PRIMARY KEY,
	 MenuLevel varchar(64) Not Null,
	 MenuLabel varchar(64) Not Null,
	 URL varchar(128) ,
	 PermissionLevel char(1) Not Null
	 )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Drop Table If Exists Login;
Create Table Login
	(SystemNo varchar(32) PRIMARY KEY,
	 Name varchar(64) Not Null,
	 LoginIP varchar(64) ,
	 LoginBrowser varchar(32) ,
	 OfflineTime char(14) 
	 )ENGINE=InnoDB DEFAULT CHARSET=utf8;


	 