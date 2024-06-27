-- limit
-- 전체 행 조회 
-- limit이 포함된 order by랑 단순 order by는 정렬 기준 컬럼의 값이 같으면
-- 약간의 순서 차이가 있을 수 있다. ( 추가적인 정렬 기준으로 조정가능 )

SELECT 
       menu_code
     , menu_name
     , menu_price
  FROM tb1_menu
 ORDER BY menu_price DESC;  
 
SELECT 
 	    menu_code
 	  , menu_name
 	  , menu_price
  FROM tb1_menu
  ORDER BY menu_price DESC
  LIMIT 4, 3; -- 4번 인덱스 위치부터 3개를 잘라라
              -- 이 limit은 order by에 붙어있는 키워드라고 생각해라
              
SELECT 
 	    menu_code
 	  , menu_name
 	  , menu_price
  FROM tb1_menu
  ORDER BY menu_price DESC, menu_code DESC
  LIMIT 4, 3;
  
SELECT
	    *
	FROM tb1_menu
  ORDER BY menu_code LIMIT 10; -- 하나의 수치만 주면 length의 의미를 가지게 됨 
  
  