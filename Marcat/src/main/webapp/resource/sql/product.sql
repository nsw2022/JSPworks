-- product 테이블 생성
create table product(
	p_id varchar(10) primary key,   -- 상품 아이디
    p_name varchar(30),				-- 상품이름
    p_unitPrice integer,			-- 상품 가격
    p_description Text,				-- 상품 설명
    p_category varchar(20),			-- 상품 분류
    p_manufacturer varchar(20),     -- 상품 제조사
    p_unitsInStock Long,			-- 상품 재고수
    p_condition varchar(20),		-- 신상품 or 중고품 or 재생품
    p_productImage varchar(20)		-- 상품이미지
);
INSERT INTO product 
(p_id, p_name, p_unitPrice, p_description, p_category, p_manufacturer, p_unitsInStock, p_condition, p_productImage)
VALUES ('101', '노트북', 1000000, '노트북입니다', '노트북', 'LG', 3, '중고품', 'gla360.png');

select * from product;

select * from product where p_id = '101';
drop table product;
