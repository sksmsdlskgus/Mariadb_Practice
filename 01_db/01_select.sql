SELECT 
       menu_name
  FROM tbl_menu;
  
SELECT
       menu_code
     , menu_name
     , menu_price
  FROM tbl_menu;
  
SELECT
       menu_code
     , menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tbl_menu
  JOIN tb1_category ON tb1_menu.category_code = tb1_category.category_code;
  
  
  -- -----------------------------------------------------------
  -- from절 없는 select 해보기 
  SELECT 7*3;
  SELECT 10*2;
  SELECT 6%3,6%4;
  SELECT NOW();
  SELECT CONCAT('유', '','관순');
  -- select concat ( '메뉴 이름은 :', menu_name,'이고 가격은 ', menu_price,'입니다.)from tb1_menu;
-- 별칭 (alias) 달아보기 
SELECT 7+3 AS '합' , 10*2 AS '곱';
SELECT NOW() AS '현재시간';
SELECT 7+3 AS '합입니다.';  -- 별칭을 달 떄 별칭에 특수기호가 있다면 싱글쿼테이션(') 을 반드시 추가한다. 
