 /* set operator */
-- 얘랑 조인이랑 차이점 중요 
-- /*union*/
SELECT 
      menu_code
    , menu_name
    , menu_price
    , category_code
    , orderacle_status
  FROM tb1_menu
 WHERE category_code = 10
UNION 
SELECT 
       menu_code
     , menu_name
     , menu_price
     , category_code
     , orderacle_status
  FROM tb1_menu 
 WHERE menu_price < 9000;
 
 /*union all*/
 
 SELECT 
      menu_code
    , menu_name
    , menu_price
    , category_code
    , orderacle_status
  FROM tb1_menu
 WHERE category_code = 10
UNION ALL 
SELECT 
       menu_code
     , menu_name
     , menu_price
     , category_code
     , orderacle_status
  FROM tb1_menu 
 WHERE menu_price < 9000;
 
 /*intersect*/
 -- mysql과 mariadb 는 intersect가 공식적으로 지원되지 않는다. 
 -- 1) INNER JOIN 활용
 SELECT 
       menu_code
     , menu_name
     , menu_price
     , category_code
     , orderacle_status
    FROM tb1_menu a
   INNER JOIN (SELECT b.menu_code
                    , b.menu_name
                    , b.menu_price
                    , b.category_code
    					  , b.orderacle_status
   					FROM tb1_menu b
					WHERE b.menu_price < 9000) c ON (a.menu_code = c.menu_code)
	WHERE a. category_code = 10;
	
	
-- 2) in 연산자 활용 
SELECT 
       a.menu_code
     , a.menu_name
     , a.menu_price
     , a.category_code
     , a.orderacle_statusd
   FROM tb1_menu a
  WHERE a.category_code =10
   AND a.menu_code IN (SELECT b.menu_code 
                         FROM tb1_menu b
                        WHERE b. menu_price < 9000 );
                        
                        
/* minus */
 SELECT -- --------4번 해석
       menu_code
     , menu_name
     , menu_price
     , category_code
     , orderacle_status
    FROM tb1_menu a -- ------------------1번 해석
   LEFT JOIN (SELECT b.menu_code
                    , b.menu_name
                    , b.menu_price
                    , b.category_code
    					  , b.orderacle_status
   					FROM tb1_menu b
					WHERE b.menu_price < 9000) c ON (a.menu_code = c.menu_code) -- --
	WHERE a. category_code = 10 -- ----2번 해석
     AND c.menu_code IS NULL;	 -- -------3번 해석
     
     
     
     