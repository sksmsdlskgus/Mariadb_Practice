/* index */
SELECT * FROM tb1_menu;

CREATE TABLE phone (
  phone_code INT PRIMARY KEY,
  phone_name VARCHAR(100),
  phone_price DECIMAL(10,2)
);

INSERT 
	INTO phone
VALUES
(1,'galaxyS24',1200000),
(2,'iphone14pro',1430000),
(3,'galaxyfold3',1730000);
	
SELECT * FROM phon;

-- where절을 활용한 단순조회
SELECT * FROM phone WHERE phone_name =  'galaxyS24';
EXPLAIN SELECT * form phone WHERE phone_name = 'galaxyS24';

-- phone_name에 index 추가하기
CREATE INDEX idx_name ON phone(phonr_name);
SHOW INDEX FROM phone;

-- 다시 index가 추가된 컬럼으로 조회해서 index를 태웠는지 확인
SELECT * FROM phone WHERE phone_name =  'galaxyS24';
EXPLAIN SELECT * form phone WHERE phone_name = 'galaxyS24';


-- 주기적으로 한번씩 다시 index를 rebuild 해주어야한다. 
-- ( mariadb는 optimize 키워드를 사용한다.)
OPTIMIZE TABLE phone;

DROP INDEX idx_anme ON phone;
SHOW INDEX FROM phone;