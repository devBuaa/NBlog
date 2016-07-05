CREATE Database mybatis;

CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `age` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
