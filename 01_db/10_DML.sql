/*DML (Data manipulation language)*/

-- insert, update, delete, select(DQL)

/*insert*/]
--새로운 행을 추가하는 구문이다. 
-- 테이블의 행의 수가 증가한다. 
selecrr * FROM tb1_munu;
INSERT 
INTO tb1_menu
( 
 menu_name
,menu_price
,category_code
,orderable_status
)
VALUES 
{'초콜릿죽'
,65000
,7
,'Y'
);
SELECT *FROM tb1_menu ORDER BY1 DESC;

/*multi insert*/
INSERT 
   INTO tb1_menu
 VALUES 
   (NULL, '참치맛아이스크림', 1700,12,'Y'),
   (NULL,  '멸치맛아이스크림', 1500,11,'Y'),
   (NULL, '소시지맛아이스크림', 2500,8,'Y'),

/*update*/
-- 테이블에 기록된 컬럼 값을 수정하는 구문이다.
-- 행의 개수에는 변화가 없다. 
SELECT
* 
  FROM tb1_menu
  WHERE menu_name = ''소시지맛커피;
  
UPDATE tb1_mennu
SET category_code =7;
WHERE menu_code = 28;


-- subquery를 활용한 update
UPDATE tb1_menu
SET category_code = 6 -- = 는 단일행 섭쿼리가 나모고 in은 다중행 서브쿼리가 나옴
qhere mrnu_code = (SELECT menu_code
                     FROM tb1__menu
                     WHERE menu_name = '소시지맛커피');
  

/* DELETE */

-- 테이블의 행을 삭제하는 구문이다. 
-- 테이블의 행의 갯수가 줄어든다.

SELECT * from tb1_menu;
DELETE 
  FROM tb1_menu;
ROLLBACK;


-- mysql 또는 mariadb는 autocommit 이 기본저그올 'on'이라 insert, update, deete
--시에 베이스 테이블에 (메모리에) 바로 반영된다. 
-- 다시 살리고 싶다면 autocommit 을 꺼주어야 한다. 
SET autocommit = OFF; -- 수동 롤백

DELETE 
FROM tb1_menu
ORDER BY menu_price --메뉴 가격 기준 오름차순
LIMIT 2;            -- 정렬된 첫 행부터 두개의 행에 해당


/*replace*/
-- INSERT 시 primary key(null X, 붕복 X,  이후 수정 X) :또는 unique key (중복 X)가 
-- 충돌이 발생하지 않도록 replace를 통해 붕복된 데이터는 덮어씌울 수 있다.

REPLACE 
INTO tb1_menu
VALUES 
(
17
, '참기름소주'
,5000
,10
,'Y'
);
SELECT *FROM tb1_menu WHERE menu_code = 17;







