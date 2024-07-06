-- type casting 
-- 명시적 형변환 

-- 1) 숫자 -> 숫자
-- as = 왼쪽의 친구를 오른쪽의 친구로 전환해줘.
SELECT CAST(AVG(menu_price) AS UNSIGNED INTEGER) AS '가격평균'
   FROM tbl_menu;
DESC tbl_menu;

-- 소수점 이하 한자리 까지만 표기할 수 있다.
SELECT CAST(AVG(menu_price) AS FLOAT) AS '가격평균'
   FROM tb1_menu;

-- 소수점 이하 12자리 까지도 표기할 수 있다 .
SELECT CAST(AVG(menu_price) AS DOUBLE) AS '가격평균'
   FROM tb1_menu;
   
INSERT INTO tb1_menu VALUES (NULL, '커피맛 푸딩',2000,7,'Y');

-- 2) 문자 -> 날짜 
-- 2024년 6월 27일을 date형으로 변환 
SELECT CAST('2024$6$27'AS DATE);
SELECT CAST('2024/6/27' AS DATE); --위와 동일 2024-6-27
SELECT CAST('2024#6#27' AS DATE); --위와 동일 2024-6-27

-- 3) 숫자 -> 문자 
SELECT CONCAT(1000,'원'); -- 암시적으로 int 로 바꿔줘 1000원 출력 
SELECT CONCAT(cast(1000 AS CHAR),'원'); -- 명시적으로 cast 사용해야함

-- 암시적 형변환
SELECT 1 + '2'; -- 3 출력 하지만 2대신 김 들어가면 김은 출력안됨 1출력 
-- mariadb 가 연산 시 , 치환한기 힘든 문자열은 0으로 치환하여 적용한다.
SELECT 5 > '반가워'; -- 1출력 true 라는 의미
-- 반가워가 0으로 치환됨 (true에 해당하는건 1, false는 0)
SELECT 5 > '반가워2'; -- 반가워는 0으로 인식
SELECT 5 > '2반가워'; -- 반가워는 2로 인식 

SELECT RAND(, FLOOR(RAND() * (11-1) +1);

