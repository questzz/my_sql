-- C R U D 

-- 데이터 생성 insert 
desc memberTbl;

insert into memberTbl values("Dang", "탕탕이", "경기도 부천시"); 
insert into memberTbl values('Han', '한주연', '부산시 해운대구');
insert into memberTbl(memberAddress, memberName, memberId) values('서울시 상암동', '지운이', 'jee');

-- 오류 구문 (memberTbl 에 memberId, memberName 필드명이 not null 로 설계 했기 때문이다) 
insert into memberTbl(memberId) values('jee2222');
insert into memberTbl(memberId, memberName) values('kee2', '홍길삼');

-- 전체 테이블에 대한 데이터 조회 
select * from memberTbl;

-- 한건에 대한 데이터 조회를 어떻게 할까? 
select * from memberTbl where memberId = 'jee';

-- 한건에 대한 조회 + 조건절 
select memberName 
from memberTbl 
where memberId = 'jee';

-- 한건에 대한 데이터 삭제 
delete from memberTbl where memberId = 'kee2';

-- 전체에 대한 데이터 삭제 구문 
delete from memberTbl;
truncate memberTBl;

-- 한건에 대한 데이터 수정 
update memberTBL set memberName = '홍길동' where memberId = 'jee';

-- 전체 데이터에 대한 값 수정 
update memberTBL set memberAddress = '부산시';


-- --------------------------- 
desc productTBl;

-- 문제 1 productTBl 데이터를 3건 입력해 주세요 
select * from productTBL; 

insert into productTBL values(1, '세탁기', 10, '엘지', 10);
insert into productTBL values(2, '컴퓨터', 90, '삼성', 2);
insert into productTBL values(3, '냉장고', 80, '엘지', 100);


truncate PRODUCTtbl;

-- 불필요한 컬럼 삭제 하는 방법 
alter table productTBL drop makeDate;


-- 문제 2 검색 

-- 문제 3 수정 

-- 문제 4 삭제 













