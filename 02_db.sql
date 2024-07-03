--  Employee DB 관련 예제를 위해서 새로운 계정 만들 것
--  1. **id: practice**, **pwd: practice**
--  2. **practice** 계정에 모든 권한 부여
--  3. 아래 스크립트로 **employeedb** 데이터베이스 세팅

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