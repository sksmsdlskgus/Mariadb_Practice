/*DDL (Data Definition Language*/
CREATE TABLE if NOT EXISTS tb1(
	pk INT PRIMARY KEY,
	fk	INT,
	col1 VARCHAR(255),
	CHECK(col1 IN ('Y','N'))
	
	) ENGINE = INNODB;
	
-- 존재하는 테이블을 요약해서 보고 싶다면 describe 키워드 가능 
DESC tb1;
DESCRIBE tb1;

INSERT
   INTO tb1
VALUES
(
   1, 2, 'Y'
);


/* auro_increment */
DROP TABLE tb1;

CREATE TABLE tb2(
	pk INT PRIMARY KEY auto_increment
	fk INT, 
	col1 VARCHAR(255),
	CHECK(col1 IN ('Y','N'))
) ENGINE=INNODB;

DESC tb2;

INSERT
INTO tb2
VALUES 
(
NULL
,2
,'N'
);

SELECT *form tb2;
COMMIT;
ROLLBACK;


/* alter */
-- 컬럼 추가 
ALTER TABLE tb2 ADD col2 INT NOT NULL;
DESC tb2;

-- 컬럼 삭제 
ALTER TABLE tb2 DROP COLUMN col2;
DESC tb2;

--컬럼 이름 및 컬럼 정의 변경
ALTER TABLE tb2 CHANGE fk change_fk INT NOT NULL;
DESC tb2;

--제약조건 제거 (prinary key 제약조건 제거 도전)
ALTER TABLE tb2 DROP PRIMARY KEY;

-- auto_increment 먼저 제거 (drop이 아닌 modify)
ALTER TABLE tb2 MODIFY pk INT;
DESC tb2;

--다시 primary key 제거 
ALTER TABLE tb2 DROP PRIMARY KEY;
DESC tb2;


/* trancate */
-- 절삭( truncate) vs 삭제(delte)
--테이블의 데이터 ( 데이터 및 관련 제약조건 관련 등 깔끔하게 제거)
-- 체이블의 초기화 (테이블  처음 만들 당시로 돌려줌)

CREATE TABLE if NOT EXISTS tb3(		
	pk INT AUTO_INCREMENT,
	fk INT, 
	col1 VARCHAR(255) CHECK(col1 IN ('Y','N')),
	PRIMARY KEY(pk)
);

INSERT 
INTO tb3
VALUES
(
NULL
,1
,'N'
);


DESC tb3;

SELECT * FROM tb3;

TRUNCATE table tb3;
