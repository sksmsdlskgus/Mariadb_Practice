-- where 절 
-- 주문가능한 메뉴만 조회 (메뉴이름, 메뉴가격, 주문가능상태)
SELECT * FROM tb1_menu;

SELECT -- 3번 (해석순서) 
      menu_name
    , menu_price 
    , orderable_status
  FROM tb1_menu  -- 2번
 WHERE orderable_status = 'y'; -- 1번
-- WHERE orderable_status = 'n';

-- desc를 통해 컬럼명 빠르게 확인해보자  
DESC tb1_menu -- 이테이블을 간략하게 보여줘 

-- ------------------------------------------------------
-- '기타' 카테고리에 해당하지 않는 메뉴를 조회하시오. 
-- 1) 카테고리 명이 '기타'인 카테고리는 카테고리 코드가 10번이다. 
SELECT 
       *
  FROM tb1_category
 WHERE category_name ='기타';
 
-- 2) 카테고리 코드가 10번이 아닌 메뉴 조회
 
SELECT 
		 *
  FROM tb1_menu
--  WHERE category_code != 10;
 WHERE category_code <> 10;
 
 
-- where 절은 조건은 나타 내는데 (=)와 같지 않은지 (!=,<>)를 활용 할 수 있다. 
-- 뿐만 아니라, 대소 비교(>,<,>=,<=)를 통해서도 where 절에 활용 할 수 있다. 

SELECT --3번 (해석순서)
		 *
  FROM tb1_menu --1번
 WHERE menu_peice >= 5000 --2번
 ORDER BY menu_price ASC; -- 4번 5000원 이상이면서 오름차순 
 
 
 -- 5000원 이상이면서 7000원 미만인 메뉴 조회 
 
 SELECT 
   	  *
   FROM tb1_menu
  WHERE menu_price >= 5000
    AND menu_price <7000;
	 	  
 -- 10000원 보다 크거나 5000원 이하인 메뉴 조회 
 
 SELECT 
   	  *
   FROM tb1_menu
  WHERE menu_price > 10000
     OR menu_price <=5000;

-- -----------------------------------

SELECT 
		 menu_code
	  , menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tb1_menu
 WHERE menu_price > 5000
    OR category_code = 10;
    
    
SELECT 
		 menu_code
	  , menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tb1_menu
 WHERE menu_price > 5000
   AND category_code = 10;
   
-- ------------------------------
-- between 연산자 활용하기 (이상~이하)
-- 가격이 5000원 이상이면서 9000원 이하인 메뉴 전체 칼럼 조회 

SELECT 
	    * 
  FROM tb1_menu
 WHERE menu_price >= 5000
	AND menu_price <= 9000;
	   

SELECT 
	    * 
  FROM tb1_menu
 WHERE menu_price BETWEEN 5000 AND 9000;
	   
	   
-- 반대 범위도 테스트 ( 5000 미만 또는 (OR) 9000 초과 ) 

SELECT 
	    * 
  FROM tb1_menu
 WHERE menu_price NOT BETWEEN 5000 AND 9000;
 
-- -------------------------
-- like문 ************
-- 제목, 작성자 등을 검색할 때 사용 

SELECT 
  FROM tb1_menu
 WHERE menu_name LIKE '%밥%'; -- 2개출력


 SELECT 
  FROM tb1_menu
 WHERE menu_name NOT LIKE '%밥%'; -- 19개 출력 


-- -----------------------
-- in 연상자 -- where절을 도와주는 연산자 
-- 카테고리가 '중식', '커피','기타'인 메뉴 조회하기
SELECT 
 		 *
  FROM tb1_menu
 WHERE category_code = 5
    OR category_code = 8
	 OR category_code = 10;d

SELECT 
		 * 
 	FROM tb1_menu
  WHERE category_code IN (5,8,10);
-- WHERE category_code NOT IN (5,8,10);

-- 속이 빈 친구들만 조회할래? 스껄할래? = null하면 안됨 ㅋㅋ
SELECT * FROM tb1_category;
-- ----------------------
-- is null 연산자 활용 
-- 개념상 상위 카테고리 조회하기 
SELECT 
		* 
 FROM tb1_category 
 WHERE ref_category_code IS NULL ;
 
 -- 하위 카테고리 조회하기 
 SELECT 
		* 
 FROM tb1_category 
 WHERE ref_category_code IS NOT NULL ;
 
-- 오늘 총정리 

SELECT 
 		*
 	FROM tb1_menu
 	WHERE menu_price > 7000
 	AND menu_name LIKE '%밥%'
 ORDER BY 2 DESC;
 
 