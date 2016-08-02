CREATE Database mybatis;
-------------正式表------------------
Drop Table If Exists Role;
CREATE TABLE Role (
  Id int(10) NOT NULL AUTO_INCREMENT,
  State varchar(3) DEFAULT NULL,
  Name varchar(50) DEFAULT NULL,
  Flag varchar(50) DEFAULT NULL,
  Description varchar(50) DEFAULT NULL,
  PRIMARY KEY (Id)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

Drop Table If Exists User;
Create Table User
	(UserNo varchar(32) PRIMARY KEY,
	 UserName varchar(64) Not Null Unique,
	 Password varchar(128) Not Null,
	 CredentialsSalt varchar(128) DEFAULT NULL,
	 Email varchar(64) ,
	 MobilePhone char(11) ,
	 Address varchar(128) ,
	 Career varchar(64) ,
	 Industry varchar(64) ,
	 Locked varchar(3) DEFAULT '0',
	 SignTime char(14) Not Null
	 )ENGINE=InnoDB DEFAULT CHARSET=utf8;
	 
DROP TABLE IF EXISTS Resources;
CREATE TABLE Resources (
  Id int(11) NOT NULL,
  Name varchar(50) DEFAULT NULL,
  ParentId int(11) DEFAULT NULL,
  ResKey varchar(50) DEFAULT NULL,
  Type varchar(40) DEFAULT NULL,
  Url varchar(200) DEFAULT NULL,
  Level int(4) DEFAULT NULL,
  Icon varchar(100) DEFAULT NULL,
  IsHide int(3) DEFAULT '0',
  Description varchar(200) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
 
DROP TABLE IF EXISTS UserRole;
CREATE TABLE UserRole (
  UserNo varchar(32) NOT NULL,
  RoleId int(11) NOT NULL Default '0',
  PRIMARY KEY (UserNo,RoleId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

DROP TABLE IF EXISTS RoleResources;
CREATE TABLE RoleResources (
  RoleId int(11) NOT NULL,
  ResId int(11) NOT NULL,
  PRIMARY KEY (RoleId,ResId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

Drop Table If Exists UserPasswordChange;
Create Table UserPasswordChange
	(SystemNo varchar(32) PRIMARY KEY,
	 Name varchar(64) Not Null,
	 OldPassword varchar(64) Not Null,
	 NewPassword varchar(64) Not Null,
	 ChangeTime varchar(64) Not Null,
	 UNIQUE KEY pwdChange (Name,OldPassword,NewPassword) 
	 )ENGINE=InnoDB DEFAULT CHARSET=utf8;

Drop Table If Exists Login;
Create Table Login
	(SystemNo varchar(32) PRIMARY KEY,
	 Name varchar(64) Not Null,
	 LoginIP varchar(64) ,
	 LoginBrowser varchar(32) ,
	 OfflineTime char(14) 
	 )ENGINE=InnoDB DEFAULT CHARSET=utf8;



