-- mysql function 

-- MYSQL String Function 
select ascii('b');

select char_length('MY SQL TEST') as 문자길이;
select char_length('홍길동') as 이름;
select concat('boot', 'class', '100%') as class_name;
select concat_ws('->', 'boot', 'class', '100%') as class_name;
-- 문자열 목록 내에서 q 를 검색할 수 있다. 
select find_in_set('l', 's,q,l');
select format(250500.5634, 0); 
-- 숫자 형식은 "#.##.##.##"(소수점 2자리 반올림)으로 지정 한다. 
select lcase('HELLO JAVA');
select ucase('hello java');
select trim('    M Y S Q L    ');
select replace('      aaa 11    ', ' ', '');


-- inner join 2 
-- 유저 이름 글자 갯수 확인하기 
select  b.amount, char_length(a.username)
from userTbl as a
inner join buytbl as b  
on a.userName = b.userName;









































