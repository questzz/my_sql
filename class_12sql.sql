

-- db 생성 
create database reservationdb;
use reservationdb;


-- 테이블 생성 (예약) 
create table reservation(
	id int auto_increment, 
    name varchar(20) not null, 
    reserveDate date not null, 
    roomNum varchar(5) not null, 
    primary key(id)
);

-- 고객 테이블 
create table customer(
	id int auto_increment, 
    name varchar(20) not null, 
    age int not null, 
    address varchar(10),
    primary key(id)
);


-- 데이터 입력 
insert into reservation values(1, '홍길동', '2020-05-01 00:00:00', 1);
insert into reservation values(2, '임꺽정', '2020-05-02 00:00:00', 2);
insert into reservation values(3, '장길산', '2020-05-03 00:00:00', 3);
insert into reservation values(4, '홍길동', '2020-05-04 00:00:00', 4);


select * from reservation;

-- 문제1  데이터 수정 
-- 1 = roomNum 1001
-- 2 = roomNum 1002
-- 3 = roomNum 1003
-- 4 = roomNum 1004

update reservation set roomNum = '1001' where id = 1;
update reservation set roomNum = '1002' where id = 2;
update reservation set roomNum = '1003' where id = 3;
update reservation set roomNum = '1004' where id = 4;

select * from reservation;

-- 고객 테이블 데이터 생성 
insert into customer values(1, '홍길동', 20, '서울');

insert into customer values(2, '임꺽정', 30, '서울');
insert into customer values(3, '장길산', 24, '서울');
insert into customer values(4, '전우치', 33, '서울');

-- 2. -> 인천, 3 --> 서울 , 4 수원 
update customer set address = '인천' where id = 2; 
update customer set address = '서울' where id = 3; 
update customer set address = '수원' where id = 4; 

select * from customer where address in ('서울');

-- 서브쿼리 
-- 주소가 서울인 고객들에 예약 정보를 확인하는 쿼리 
select id, reserveDate, roomNum, name 
from reservation
where name in(
				select name 
                from customer 
                where address = '서울'
			); 

-- JOIN 문으로 변경해서 같은 결과를 출력해주세요 
select r.id, r.reserveDate, r.roomNum, r.name, c.address
from reservation as r 
left join customer as c 
on r.name = c.name 
where c.address = '서울';

select r.id, r.name, reserveDate, roomNum, address
from reservation as r
inner join customer as c
on r.name = c.name
where address = '서울';


-- FROM 절 서브쿼리 
select name, reservedRoom
from ( select name , reserveDate, (roomNum) as  reservedRoom
		from reservation 
        where roomNum > 1001) as reservationInfo
/*
	쿼리 실행 순서 
    1. reservation 테이블에서 roomNum > 1001 보다 큰 레코드를 먼 찾은후  roomNum 필드값 1씩 증가 
    해당 쿼리에 결과 집합 reservationInfo 임시 테이블로 만들어 진다. (내부 쿼리, 서브쿼리) 
    외부 쿼리에서는 이렇게 만들어진 임시 테이블에서 name, reservedRoom 필드만을 선택해서 결과 집합을 보여주게 된다. 
*/

-- 서브쿼리 사용해서 문제 생성 !! 


























