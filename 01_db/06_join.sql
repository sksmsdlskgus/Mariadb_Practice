-- join

-- alias (별칭)
-- 컬럼에 별칭을 다는 것 외에도 from절에 작성되는 것들에 별칭도 추가 가능하다.
-- 테이블 또는 from절에 별칭을 추가할 때는 싱글쿼테이션(') 없이 별칭을 작성한다.
-- AS 생략은 가능하지만 가독성을 위해 작성바람

SELECT
       a.category_code
     , a.menu_name
  FROM tb1_menu AS a 
 ORDER BY a.category_code, a.menu_name;
 
 -- inner Join
 -- inner라는 키워드는 생략해도 inner join이다.
 -- 1) on을 활용

SELECT 
       a.menu_name
     , b.category_name
     , a.category_code
     , b.category_code
  FROM tb1_menu a -- 나는 메뉴를 보고싶은데 남의 테이블의 카테고리 를 보고싶어
-- INNER JOIN tb1_category b ON a.category_code = b.category_code;
 JOIN tb1_category b ON a.category_code = b.category_code;
 
 
SELECT 
       a.*
      ,b.*
  FROM tb1_menu a 
 INNER JOIN tb1_category b ON a.category_code = b.category_code;
 
 -- 2) using을 활용
 -- join할 테이블들의 매핑 칼럼명들이 동일할 경우에만 사용 가능한 문법
 SELECT 
       a.menu_name
     , b.category_name
     , a.category_code
     , b.category_code
  FROM tb1_menu a 
 JOIN tb1_category b USING (category_code);
 
 -- ------------------------------
 -- outer join 
 -- 1) left join
 SELECT 
       a. category_name
     , b. menu_name
   FROM tb1_category a 
   left JOIN tb1_menu b ON (a.category_code = b.category_code);
   
 -- 2) right join
 SELECT 
       a.menu_name
     , b.category_name
   FROM tb1_menu a
 RIGHT join tb1_category b ON ( a.category_code = b.category_code);
 
 
-- 3) cross join -- 모든 경우의 수를 매핑 
SELECT
       a.menu_name
     , b category_name
  FROM tb1_menu a
 CROSS JOIN tb1_category b; 
 
 
-- 4) self join
-- a에 해당하는 것은 하위 카테고리, b에 해당하는것은 상위 카테고리
SELECT 
       a.category_name
     , b.category_name
   FROM tb1_category a 
   JOIN tb1_category b ON (a.ref_category_code = b.category_code);                                                                                               

 