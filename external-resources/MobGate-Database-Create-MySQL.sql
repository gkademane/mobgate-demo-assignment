#create database mobgate;
#CREATE USER 'mobgate'@'localhost' IDENTIFIED BY 'mobgate';
#GRANT ALL PRIVILEGES ON mobgate.* TO 'mobgate'@'localhost' WITH GRANT OPTION;

CREATE TABLE `mg_role` (
  `role_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tenant_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  KEY `cust_key` (`role_id`))
  ENGINE=InnoDB DEFAULT CHARSET=utf8;

Insert into mg_role values ('ROLE_ANDROID','Role for Android Device',null);
Insert into mg_role values ('ROLE_IOS','Role for IOS Device',null);


 CREATE TABLE `mg_user` (
 `username` varchar(255) NOT NULL,
 `password` varchar(255) NOT NULL,
 `firstname` varchar(50) DEFAULT NULL,
 `lastname` varchar(50) DEFAULT NULL,
 `email` varchar(50) DEFAULT NULL,
 `mobile` varchar(15) DEFAULT NULL,
 `enabled` varchar(1) DEFAULT NULL,
 `locked` int(11) DEFAULT NULL,
 PRIMARY KEY (`username`),
 KEY `cust_key` (`username`))
 ENGINE=InnoDB DEFAULT CHARSET=utf8;

 Insert into mg_user values('demo@mobgate.com','password','Demo User','','demo@mobgate.com','123456','Y',1);

CREATE TABLE `mg_user_authorities` (
  `username` varchar(255) NOT NULL,
  `authority` varchar(255) NOT NULL,
  KEY `username_idx` (`username`),
  KEY `role_idx` (`authority`),
  CONSTRAINT `role` FOREIGN KEY (`authority`) REFERENCES `mg_role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `mg_user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 Insert into mg_user_authorities values('demo@mobgate.com','ROLE_ANDROID');
 Insert into mg_user_authorities values('demo@mobgate.com','ROLE_IOS');

 CREATE TABLE mg_oauth_refresh_token ( TOKEN_ID VARCHAR(64) NOT NULL PRIMARY KEY, TOKEN BLOB NOT NULL, authentication BLOB NOT NULL);

 create table mg_oauth_access_token (
  token_id VARCHAR(256),
  token BLOB,
  authentication_id VARCHAR(256),
  user_name VARCHAR(256),
  client_id VARCHAR(256),
  authentication BLOB,
  refresh_token VARCHAR(256)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table mg_oauth_client_details (
  client_id VARCHAR(100) PRIMARY KEY,
  resource_ids VARCHAR(256),
  client_secret VARCHAR(256),
  scope VARCHAR(256),
  authorized_grant_types VARCHAR(256),
  web_server_redirect_uri VARCHAR(256),
  authorities VARCHAR(256),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additional_information VARCHAR(255),
  autoapprove VARCHAR(256)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

Insert into mg_oauth_client_details values('7b5a38705d7b3562655925406a652e32','','655f523128212d6e70634446224c2a48','password','password,refresh_token','','',1000,1000,'{"info":""}','');
-- oAuth2 Provider Tables [End]--