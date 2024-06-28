/* view */
-- 테이블을 활용한 가상 테이블 
-- view는 원본 테이블을 참조해서 보여주는 용도이고
-- 보여지는건 실제 테이블 (베이스 테이블)의 값이다. 


SELECT 
		menu_name
	  , menu_price
	FROM tb1_menu;
	
-- DROP VIEW v_menu;
CREATE OR replace VIEW v_menu
AS
SELECT
		menu_name AS '메뉴명'
	 , menu_price AS '메뉴단가'
  FROM tb1_menu;
	
SELECT * FROM v_menu;
SELECT * FROM tbl_menu;


/* view를 통한 DML (절대적으로 비추) */
SELECT * form tb1_menu;

-- view 생성 
CREATE OR REPLACE VIEW hansik
AS
SELECT
		 menu_code
		, menu_name
		, menu_price
		, category_code 
		, orderable_ststus
   FROM tb1_menu
 WHERE category_code = 4;
 
SELECT * FROM hansik;

-- hansik이라는 VIEW 통해 tb1_menu라는 베이스 테이블에 영향을 줌
INSERT
	INTO hansik
VALUES
(NULL,' 식혜맛국밥',5500,4,'Y')

SELECT * FROM tb1_menu;

UPDATE hansik 
	SET menu_name = '버터맛국밥'
	  , menu_price = 6000
 WHERE menu_name = '식혜맛국밥';
 
CREATE OR REPLACE VIEW v_test
AS
SELECT 
 		 AVG(menu_price) + 3
 		 FROM tb1_menu;
 		 
SELECT * FROM v_test;

INSERT INTO v_test VALUES(10);


