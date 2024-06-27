/* Transaction */

-- autocommit 비활성화 
SET autocommit = 0;
SET autocommit = OFF; 

-- sutocommit 활성화 
SET autocommit = 1;
SET autocommit = ON;

START TRANSACTION;
INSERT
 INTO tb1_menu
 VALUES 
 (
 NULL, '바나나해장국', 8500
 ,4,'Y'
 );
 
UPDATE tb1_menu
   SET menu_name ='수정된 메뉴'
   WHERE menu_code = 5; 
   
SELECT * fromm tb1_menu;

-- ROLLBACK;
COMMIT;

SELECT * FROM tb1_menu;
