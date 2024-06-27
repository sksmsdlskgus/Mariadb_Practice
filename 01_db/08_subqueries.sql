-- subqueries

-- '민트 미역국'의 카테고리 번호 조회 (서브 쿼리 개념)
SELECT * FROM tb1_menu;

SELECT 
 		 category_code
	FROM tb1_menu
  WHERE menu_name = '민트미역국'; -- 4


-- '민트 미역국'과 같은 카테고리의 메뉴를 조회 (메인 쿼리 개념)
SELECT
       menu_name
   FROM tb1_menu
  WHERE category_code = 4;
  

SELECT  --- main 쿼리
   	 menu_name
--   , category_code
  FROM tb1_menu
 WHERE category_code = (SELECT category_code -- sub 쿼리
 							     FROM tb1_menu	
								 WHERE menu_name = '민트미역국');
								
-- 서브쿼리의 종류								 
-- 1) 다중행 다중열 서브쿼리
SELECT 
      *
   FROM tb1_menu;
   
-- 2) 다중행 단일열 서브퉈리
SELECT 
       menu_name
   FROM tb1_menu;
   
-- 3) 단일행 다중열 서브쿼리 
SELECT 
       * 
   FROM tb1_menu
   WHERE menu_name = '우럭스무디':

-- 4) 단일행 단일열 서브쿼리
SELECT 
       category_code
   FROM tb1_menu
  WHERE menu_name = '우럭스무디';
  
-- 가장 많은 메뉴가 포함된 카테고리에 메뉴 개수(count(), max())
SELECT
       COUNT(*) AS '카테고리별 메뉴 갯수'
   FROM tb1_menu
  GROUP BY category_code;
  
SELECT
       MAX(a.count)
 FROM (SELECT COUNT(*) AS COUNT 
           , category_code
         FROM tb1_menu
        GROUP BY category_code) a;
        
-- 선행해서 쿼리에서 동작해야 할 쿼리를 서브쿼리로 작성한다. 
-- mariadb에서는 서브쿼리를 fron절에 사용시 (인라인 뷰)에는 반드시 별칭을 
-- 달아야한다. (-> a)
-- 서브쿼리의 그룹함수의 결과를 메인쿼리에서 쓰기 위해서는 역시나 
-- 반드시 별칭을 달아야한다. (-> count)

/*상관 서브쿼리*/
-- 메인쿼리를 활용한 서브쿼리라면 상관(메인쿼리와 서브쿼리의 상관관계활용)
--서브쿼리라고 한다.

-- 메뉴가 존재하는 카테고리 별로 평균 구하기 
SELECT 
	    AVG (menu_price)
  FROM tb1_menu
 WHERE category_code = 6;
 
-- 메뉴별 각 메뉴가 속한 카테고리의 평균보다 높은 가격의 메뉴들만 조회
SELECT 
       a.menu_code
     , a.menu_name
     , a.menu_price
     , a.category_code
     , a.orderable_status
  FROM tb1_menu a
 WHERE a.menu_price > (SELECT AVG (b.menu_price)
  							  FROM tb1_menu b
 							 WHERE category_code = a.category_code);


SELECT *FROM tb1_menu;

 /*exists*/
-- 결과가 하나라도 존재하면 (한 행이라도 조회가 되면) true. 아니면 false
-- 카테고리 중에 메뉴에 부여된 카테고리들의 카테고리 이름 조회 

SELECT 
       category_naem
  FROM tb1_category a
 WHERE EXISTS (SELECT menu_code 
                 FROM tb1_menu b
               WHERE b.category_code = a. category_code)
 ORDER BY 1;
	
	
	
    





  