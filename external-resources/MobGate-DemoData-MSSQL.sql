INSERT INTO mg_role VALUES ('ROLE_ANDROID','Role for Android Device',null);
INSERT INTO mg_role VALUES ('ROLE_IOS','Role for IOS Device',null);
INSERT INTO mg_role VALUES ('ROLE_TENANT1','Role for Tenant 1','tenant1');
INSERT INTO mg_role VALUES ('ROLE_TENANT2','Role for Tenant 2','tenant2');

INSERT INTO mg_user VALUES('1@mob.com','pass','User1','','user1@mob.com','123456','Y',0);
INSERT INTO mg_user VALUES('2@mob.com','pass','User2','','user2@mob.com','123456','Y',0);

INSERT INTO mg_user_authorities VALUES('1@mob.com','ROLE_ANDROID');
INSERT INTO mg_user_authorities VALUES('1@mob.com','ROLE_TENANT1');
INSERT INTO mg_user_authorities VALUES('2@mob.com','ROLE_IOS');
INSERT INTO mg_user_authorities VALUES('2@mob.com','ROLE_TENANT2');

INSERT INTO mg_oauth_client_details VALUES('7b5a38705d7b3562655925406a652e32','','655f523128212d6e70634446224c2a48','password','password,refresh_token','','',1000,1000,'{"test":""}','');
INSERT INTO mg_oauth_client_details VALUES('5e572e694e4d61763b567059273a4d3d','','316457735c4055642744596b302e2151','password','password,refresh_token','','',1000,1000,'{"test":""}','');
INSERT INTO mg_oauth_client_details VALUES('1e572e694e4d61763b569059273a5d3z','','116457735c4055642844596c302e2159','password','password,refresh_token','','',1000,1000,'{"test":""}','');

INSERT INTO mg_tenant VALUES('tenant1','Tenant 1','MYSQL','tenant1','jdbc:mysql://mobgatedb.cpq0wd7ig8gq.us-east-1.rds.amazonaws.com:3306/tenant1?useUnicode=true&characterEncoding=UTF8','mobgateuse','mobgatepass','ROLE_TENANT1');
INSERT INTO mg_tenant VALUES('tenant2','Tenant 2','MYSQL','tenant2','jdbc:mysql://mobgatedb.cpq0wd7ig8gq.us-east-1.rds.amazonaws.com:3306/tenant2?useUnicode=true&characterEncoding=UTF8','mobgateuse','mobgatepass','ROLE_TENANT2');
INSERT INTO mg_tenant VALUES('tenant3','Tenant 3','ORACLE','tenant3','jdbc:oracle:thin:@mobgateoradb.cpq0wd7ig8gq.us-east-1.rds.amazonaws.com:1521:mobgate','mobgateorauser','mobgateorapass','ROLE_TENANT3');