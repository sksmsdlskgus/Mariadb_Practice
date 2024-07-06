CREATE USER 'practice'@'%' IDENTIFIED BY 'practice';

SHOW DATABASES;

USE mysql;

SELECT * FROM USER;


CREATE DATABASE employeedb;

SHOW DATABASES;

SHOW GRANTS FOR 'practice'@'%';

GRANT ALL PRIVILEGES ON employeedb.* TO 'practice'@'%';

SHOW GRANTS FOR 'practice'@'%';


-- 'practice' 계정 접속 후 employeedb를 통한 과제 풀기
USE employeedb;