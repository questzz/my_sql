-- 

create database shop_db; 
use shop_db;


create table shop_db.product(
	id tinyint not null, 
    p_name varchar(30) not null, 
    created date, 
    company varchar(30)
);

-- index : create index(UNIQUE INDEX) 
create index idx_product_name
on product (p_name);


-- 가상 테이블 (뷰 테이블) 
select * from product;

-- 데이터 생성 
insert into product values(1, '세탁기', '2020-12-12', '삼성');
insert into product values(2, '냉장고', now(), '엘지');
insert into product values(3, '모니터', curdate(), '삼성');
insert into product values(4, '컴퓨터', curdate(), '삼성');

desc product;

-- 컬럼 추가하기 
alter table product add input_time timestamp;

-- 가상 테이블 생성하기 
create view product_view 
as select p_name, created, company
from product;

select * from product_view; 
select * from product;

-- delete ( 계정 삭제 권한 안주면 된다) 
delete from product_view where p_name = '컴퓨터';

-- drop database shop_db;

show databases;

-- drop index 
-- index 조회 하는 방법 
show index from product;
-- -- index 수정 하는 방법 추가 확인 
-- alter table product 

alter table product
drop index idx_product_name;


-- 테이블 복사 
select * from product;

create table product_2 select * from product; 
select * from product_2;


-- 집계 함수 !!! 

-- GROUP BY 
use shopdb; 

select * from buytbl;

-- GROUP BY 
select userName
from buytbl
group by userName; 


select * 
from buytbl
group by price;


select * 
from buytbl
group by amount;

-- 이름으로 묶고 amount 3보다 큰 사람들을 출력 하라 !!! 
select * 
from buytbl
where amount >= 3
group by userName;

-- 집계 함수 
select count(*) as 판매횟수 
from buytbl;

select userName, sum(price) as '구매 금액'
from buytbl;

-- 집계 함수와 그룹 바이 
select userName, sum(price) as '구매 금액'
from buytbl
group by userName;



























































































