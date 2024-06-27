-- distinct 중복되는 값 한번만 표기 

SELECT 
       category_code
  FROM tb1_menu
 ORDER BY category_code;
 
 -- 메뉴가 할당된 카테고리의 종류를 확인함 *********
 SELECT 
       DISTINCT category_code
  FROM tb1_menu
 ORDER BY category_code;
 
-- 상위 카테고리 조회하기 (null조회) *******
-- 1) where 절 활용 
SELECT
		 *
  FROM tb1_category
 WHERE ref_category_code IS NULL;

-- 2) 아래 코드를 통해 카테고리의 상위 카테고리 번호를 알 수 있다. 

SELECT 
       DISTINCT ref_category_code
--      , categry_name AS '카테고리명'
	FROM tb1_category;
  WHERE ref_category_code IS NOT NULL; 
	
	
-- 추후 배울 예정이지만 서브 쿼리를 활용하면 
-- 하나의 쿼리로 작성할 수 있다.
SELECT 
		 *
  FROM tb1_category;
 WHERE category_code IN (SELECT DISTINCT ref_category_code
                           FROM tb1_category
                          WHERE ref_category_code IS NOT NULL
                             );
                             
-- 다중열 distinct

SELECT 
		 category_code
     , orderable_status
  FROM tb1_menu;

SELECT
       DISTINCT
       category_code
     , orderable_status
  FROM tb1_menu;
	