
CREATE TABLE `mg_role` (
  `role_id` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `tenant_id` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  KEY `cust_key` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mg_user` (
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `firstname` VARCHAR(50) DEFAULT NULL,
  `lastname` VARCHAR(50) DEFAULT NULL,
  `email` VARCHAR(50) DEFAULT NULL,
  `mobile` VARCHAR(15) DEFAULT NULL,
  `enabled` VARCHAR(1) DEFAULT NULL,
  `locked` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `cust_key` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mg_user_authorities` (
  `username` VARCHAR(255) NOT NULL,
  `authority` VARCHAR(255) NOT NULL,
  KEY `username_idx` (`username`),
  KEY `role_idx` (`authority`),
  CONSTRAINT `role` FOREIGN KEY (`authority`) REFERENCES `mg_role` (`role_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `mg_user` (`username`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE mg_oauth_refresh_token (
  TOKEN_ID VARCHAR(64) NOT NULL PRIMARY KEY,
  TOKEN BLOB NOT NULL,
  authentication BLOB NOT NULL
);


CREATE TABLE  `mobgate`.`mg_oauth_access_token` (
  `token_id` VARCHAR(255) DEFAULT NULL,
  `token` blob,
  `authentication_id` VARCHAR(255) DEFAULT NULL,
  `user_name` VARCHAR(255) DEFAULT NULL,
  `client_id` VARCHAR(255) DEFAULT NULL,
  `authentication` blob,
  `refresh_token` VARCHAR(255) DEFAULT NULL,
  UNIQUE KEY `token_key` (`token_id`),
  UNIQUE KEY `Refresh_token_key` (`refresh_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE table mg_oauth_client_details (
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


-- oAuth2 Provider Tables [End]--

-- Multitenant Tables [Start]--
CREATE table mg_tenant (
  tenant_id VARCHAR(50) NOT NULL,
  tenant_name VARCHAR(255) NOT NULL,
  database_type VARCHAR(10) NOT NULL,
  database_name VARCHAR(50) NOT NULL,
  database_url VARCHAR(255) NOT NULL,
  database_username VARCHAR(50) NOT NULL,
  database_password VARCHAR(50)  NOT NULL,
  tenant_role VARCHAR(50) NOT NULL,
  PRIMARY KEY (`tenant_id`),
  KEY `tenant_key` (`tenant_id`))
  ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Multitenant Tables [END]--

-- MobGate Admin tables [START]--
CREATE TABLE `mg_admin_user` (
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `firstname` VARCHAR(50) DEFAULT NULL,
  `lastname` VARCHAR(50) DEFAULT NULL,
  `email` VARCHAR(50) DEFAULT NULL,
  `mobile` VARCHAR(15) DEFAULT NULL,
  `enabled` VARCHAR(1) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `cust_key` (`username`))
  ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO mg_admin_user VALUES('admin','admin','MobGate','Admin','user1@mob.com','123456','Y');

CREATE TABLE `mg_admin_user_authorities` (
  `username` VARCHAR(255) NOT NULL,
  `authority` VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO mg_admin_user_authorities VALUES('admin','ROLE_ADMIN');

CREATE TABLE `mg_admin_role` (
  `role_id` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `cust_key` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO mg_admin_role VALUES ('ROLE_ADMIN','Role for MobGate Admin');

CREATE TABLE `mg_admin_config` (
  `username` VARCHAR(50) NOT NULL,
  `multitenancy` bit(1) DEFAULT NULL,
  `oauth2` bit(1) DEFAULT NULL,
  CONSTRAINT `fk_admin_config_username` FOREIGN KEY (`username`) REFERENCES `mg_admin_user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mg_admin_config`(`username`,`multitenancy`,`oauth2`) VALUES ('admin',true,true);

CREATE TABLE `mg_connector` (
  `connector_name` VARCHAR(100) NOT NULL,
  `connector_desc` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`connector_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `mg_admin_connector` (
  `username` VARCHAR(100) NOT NULL,
  `connector` VARCHAR(200) NOT NULL,
  KEY `fk_username_idx` (`username`),
  KEY `fk_connector_idx` (`connector`),
  CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `mg_admin_config` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_connector` FOREIGN KEY (`connector`) REFERENCES `mg_connector` (`connector_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- MobGate Admin tables [END]--


