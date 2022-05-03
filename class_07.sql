
-- MYSQL Date Function 

select curdate();
select current_date();
-- 현재 날짜를 출력하는 함수 (년 월 일) 

select curtime();
select current_time();
-- 현재 시간을 출력하는 함수 

select day("2017-06-15");
select day(curdate());
select curdate();
-- 일자를 반환 하는 함수 

select week("2017-06-15");
select week(curdate()); -- week;; 

select weekday("2017-06-15");
select weekday(curdate());
-- 1주일 안에 월 0, 화1,  수2 

/*
WEEK(date , mode)
MySQL에서는 WEEK() 함수를 사용하여 주어진 날짜의 '주 번호'를 가져올 수 있다.
이때 '주 번호'는 한 해의 주를 의미한다. 함수에는 첫 번째 날짜를 인수로 제공하면 번호가 반환된다.
두 번째 인수에는 한 주의 시작을 일요일,
월요일로 지정할 수 있고 또한 주 번호의 범위를 0~53, 1~53으로 지정할 수 있다.

*/



select now();
select sysdate();

select timestamp("2019-06-15", "13:10:11");
-- 문자열 , 시간 date 
-- 인수에 따라서 datetime 값을 반환 한다. 

select timediff("13:10:11", "13:10:10");
select timediff("2022-05-03 13:10:11", "2022-01-03 13:10:10");
select timediff(now(), "2021-01-03 13:10:10"); -- 최대 범위 확인 ! 

select now();

select subdate(now(), interval 10 day);
-- 날짜 빼기 

select date_add(sysdate(), interval 10 day);
-- 날짜 더하기 

-- 
select system_user();
select session_user();
select current_user();
select version();

select nullif("Hello", null);
select nullif("x", null);











-- timestamp로 주문날짜 정하고 date_add로 5일 추가해서 도착날짜 정하기
select b.userName, b.prodName, b.price, b.amount,timestamp("2022-05-01" , "13:21:16") as 주문날짜, 
        (select date_add(주문날짜 , interval 5 day)) as 도착날짜 
from buytbl as b
where b.userName = '이순신';



















