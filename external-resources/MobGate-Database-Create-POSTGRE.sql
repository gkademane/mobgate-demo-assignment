create database mobgate;
CREATE USER mobgate WITH PASSWORD 'mobgate';
GRANT ALL PRIVILEGES ON DATABASE mobgate TO mobgate WITH GRANT OPTION;

CREATE TABLE mg_role (
  role_id varchar(255) NOT NULL,
  name varchar(255) NOT NULL,
  tenant_id varchar(50) DEFAULT NULL,
  PRIMARY KEY (role_id)
 );
CREATE INDEX cust_key ON mg_role (role_id);

Insert into mg_role values ('ROLE_ANDROID','Role for Android Device',null);
Insert into mg_role values ('ROLE_IOS','Role for IOS Device',null);
Insert into mg_role values ('ROLE_TENANT1','Role for Tenant 1','tenant1');
Insert into mg_role values ('ROLE_TENANT2','Role for Tenant 2','tenant2');

CREATE TABLE mg_user (
 username varchar(255) NOT NULL,
 password varchar(255) NOT NULL,
 firstname varchar(50) DEFAULT NULL,
 lastname varchar(50) DEFAULT NULL,
 email varchar(50) DEFAULT NULL,
 mobile varchar(15) DEFAULT NULL,
 enabled varchar(1) DEFAULT NULL,
 PRIMARY KEY (username)
) ;

CREATE INDEX user_key ON mg_user (username);

 Insert into mg_user values('1@mob.com','pass','User1','','user1@mob.com','123456','Y');
 Insert into mg_user values('2@mob.com','pass','User2','','user2@mob.com','123456','Y');

CREATE TABLE mg_user_authorities (
 username varchar(255) NOT NULL,
 authority varchar(255) NOT NULL) ;

 Insert into mg_user_authorities values('1@mob.com','ROLE_ANDROID');
 Insert into mg_user_authorities values('1@mob.com','ROLE_TENANT1');
 Insert into mg_user_authorities values('2@mob.com','ROLE_IOS');
 Insert into mg_user_authorities values('2@mob.com','ROLE_TENANT2');

 CREATE TABLE mg_oauth_refresh_token ( TOKEN_ID VARCHAR(64) NOT NULL PRIMARY KEY, TOKEN BYTEA NOT NULL, authentication BYTEA NOT NULL);

 create table mg_oauth_access_token (
  token_id VARCHAR(256),
  token BYTEA,
  authentication_id VARCHAR(256),
  user_name VARCHAR(256),
  client_id VARCHAR(256),
  authentication BYTEA,
  refresh_token VARCHAR(256)
) ;

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
) ;

Insert into mg_oauth_client_details values('7b5a38705d7b3562655925406a652e32','','655f523128212d6e70634446224c2a48','password','password,refresh_token','','',1000,1000,'{"info":""}','');
-- oAuth2 Provider Tables [End]--
