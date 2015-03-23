create database mobgate;
CREATE USER mobgate IDENTIFIED BY mobgate;
GRANT ALL PRIVILEGES ON mobgate.* TO 'mobgate'@'localhost' WITH GRANT OPTION;

CREATE TABLE mg_role (
  role_id varchar2(255) NOT NULL,
  name varchar2(255) NOT NULL,
  tenant_id varchar2(50) DEFAULT NULL,
  PRIMARY KEY (role_id)
 );
CREATE INDEX cust_key ON mg_role (role_id);

Insert into mg_role values ('ROLE_ANDROID','Role for Android Device',null);
Insert into mg_role values ('ROLE_IOS','Role for IOS Device',null);
Insert into mg_role values ('ROLE_TENANT1','Role for Tenant 1','tenant1');
Insert into mg_role values ('ROLE_TENANT2','Role for Tenant 2','tenant2');

CREATE TABLE mg_user (
 username varchar2(255) NOT NULL,
 password varchar2(255) NOT NULL,
 firstname varchar2(50) DEFAULT NULL,
 lastname varchar2(50) DEFAULT NULL,
 email varchar2(50) DEFAULT NULL,
 mobile varchar2(15) DEFAULT NULL,
 enabled varchar2(1) DEFAULT NULL,
 PRIMARY KEY (username)
);
CREATE INDEX cust_key ON mg_role (role_id);

 Insert into mg_user values('1@mob.com','pass','User1','','user1@mob.com','123456','Y');
 Insert into mg_user values('2@mob.com','pass','User2','','user2@mob.com','123456','Y');

CREATE TABLE mg_user_authorities (
 username varchar2(255) NOT NULL,
 authority varchar2(255) NOT NULL);

 Insert into mg_user_authorities values('1@mob.com','ROLE_ANDROID');
 Insert into mg_user_authorities values('1@mob.com','ROLE_TENANT1');
 Insert into mg_user_authorities values('2@mob.com','ROLE_IOS');
 Insert into mg_user_authorities values('2@mob.com','ROLE_TENANT2');

CREATE TABLE mg_oauth_refresh_token ( TOKEN_ID VARCHAR2(64) NOT NULL PRIMARY KEY, TOKEN BLOB NOT NULL, authentication BLOB NOT NULL);

create table mg_oauth_access_token (
  token_id VARCHAR2(256),
  token BLOB,
  authentication_id VARCHAR2(256),
  user_name VARCHAR2(256),
  client_id VARCHAR2(256),
  authentication BLOB,
  refresh_token VARCHAR2(256));

create table mg_oauth_client_details (
  client_id VARCHAR2(100) PRIMARY KEY,
  resource_ids VARCHAR2(256),
  client_secret VARCHAR2(256),
  scope VARCHAR2(256),
  authorized_grant_types VARCHAR2(256),
  web_server_redirect_uri VARCHAR2(256),
  authorities VARCHAR2(256),
  access_token_validity NUMBER(10),
  refresh_token_validity NUMBER(10),
  additional_information VARCHAR2(255),
  autoapprove VARCHAR2(256));

Insert into mg_oauth_client_details values('7b5a38705d7b3562655925406a652e32','','655f523128212d6e70634446224c2a48','password','password,refresh_token','','',1000,1000,'{"info":""}','');
-- oAuth2 Provider Tables [End]--
