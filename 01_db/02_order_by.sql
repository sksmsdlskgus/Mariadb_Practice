-- order by(정렬)

-- 오름차순 (Ascending, ASC)
-- 내림차순(Descending, DESC)
SELECT 
       menu_code     -- 1번째
     , menu_name     -- 2번째
     , menu_price     -- 3번째
	from tbl_menu
-- ORDER BY menu_pricr ASC;
-- ORDER BY menu_price ASC, menu_name DESC; -- 정렬을 우선순위를 나눈어 정렬할 수도 있다. 
-- ORDER BY 3 ASC, 2 DESC; -- SELECT절의 컬럼 순번으로 정렬 가능 
  ORDER BY 3 , 2 DESC; -- ASC는 default라 생략 가능하다. 
  
 -- 별칭을 이용한 정렬
 SELECT 
        menu_code AS '메뉴코드'
		, menu_name AS 'ms' 
		, menu_price AS 'mp'
	FROM tbl_menu 
  ORDER BY '메뉴코드' DESC;  -- 싱글쿼테이션 생략 불가 (별칭에 특수기호 불가 )
  
  
-- ---------------------------------------------------------

-- mariadb는 field 함수를 활용해서 정렬이 가능하다.
SELECT FIELD('a','b','a','d'); -- 가장 왼쪽에 있는 a가 오른쪽 bad 중 a의 위치가 몇번째냐를 알 수 있음

SELECT
       orderable_status
		, field (orderable_status, 'N', 'y')
  FROM tbl_menu;
  
  
-- field를 활용한 order by 
-- 주문 가능한 것부터 보이게 정렬하기 
SELECT 
       menu_name 
      , orderable_status
  FROM tbl_menu
 ORDER BY FIELD(orderable_status, 'N','Y') DESC;
 
-- 코드를 외우는것보다 문제(ex.주문 가능한 것부터 보이게 정렬하기)를 주면 코드를 짜내야함 

-- -------------------------------------------------------
-- null 값(비어있는 컬럼 값)에 대한 정렬 
-- 1) 오름차순 시 : null값이 먼저 나옴 

SELECT 
       * 
  FROM tbl_category
 ORDER BY ref_category_code ASC;
 
-- 2) 내림차순 시 : null값이 나중에 나옴 
SELECT 
      * 
   FROM tbl_category 
 ORDER BY ref_category_code DESC;

-- 3) 오름차순에서 null이 나중에 나오도록 바꿈 
SELECT 
      * 
   FROM tbl_category 
 ORDER BY -ref_category_code DESC; -- desc 를 통해 null을 나중으로 보내고, '-'로 desc와 반대로 진행 (asc)
 
-- 4) 내림차순에서 null이 먼저 오도록 바꿈
SELECT 
      * 
   FROM tbl_category 
 ORDER BY -ref_category_code ASC;