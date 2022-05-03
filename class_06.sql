
-- MYSQL Numberic Function 

select ABS(-252.2);

select * from buytbl;

-- 합계 
select *, sum(price) as 합계
from buytbl;

select sum(price) as 합계
from buytbl;

-- 서브쿼리 ( 3가지 ) 
select *, (select sum(price) from buytbl) as 총합계
from buytbl;


-- 평균 값 
select *, avg(price) as 평균값 
from buytbl;

-- 서브 쿼리 
select *, (select avg(price) from buytbl) as 평균값
from buytbl; 

-- 올림 처리 
select ceil(25.12);

-- 반올림 
select round(134.523);
select round(134.523, 1);

-- 버림 처리 
select floor(25.81);

select ceil(round(10 - 5) + 5);

-- max 값 
select max(price)
from buytbl; 


-- min 값 
select min(price)
from buytbl; 

-- usertbl , buytbl 문제 1 


































