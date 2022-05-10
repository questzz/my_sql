-- 서브쿼리 2 
use employees;
select * from employees;
select * from dept_emp; -- employees vs dept_emp ( 1 : N ) 
select * from departments order by dept_no; -- departments vs dept_emp ( 1 : N ) 
select * from dept_manager;
select * from titles;

desc dept_emp;
desc departments;


select *, dept_no as '뽑아야 되는 값'
from departments as A 
where a.dept_name = 'development';

-- 문제 1 (중첩 서브 쿼리) 
-- dept_emp 테이블에서 development인 emp_no 와 dept_no를 출력 하세요 
select * 
from dept_emp as A 
where A.dept_no = (select dept_no
					from departments
					where dept_name = 'development');
                    
-- 문제 2 (중첩 서브쿼리) 
-- employees 테이블에서 현재 development 매니저인 직원만 출력 하시오 !!! 

-- 테스트 코드  
select * from dept_manager;
select * from employees;
select * from departments;

select *  
from employees as A 
where a.emp_no = ( select emp_no 
					from dept_manager 
                    where to_date = '9999-01-01' 
                    and dept_no = 'd005');
-- 단일행 결과 집합 나와서 외부 쿼리인 emp_no 조건식으로 처리가 된다. 

select * 
from employees as a 
where a.emp_no = ( select emp_no 
		from dept_manager where to_date ="9999-01-01" 
        and dept_no = (select dept_no 
					from departments
                    where dept_name = "development")
				);
-- d005 --> development (값으로 변경해서 쿼리문을 완성해주세요) 

/*
	다중 행 서브쿼리 
    결과값이 2건 이상 출력되는 것을 말한다. 다중 행 서브쿼리는 쿼리에 결과가 여러건 출력되기 때문에 
    단일행 연산자를 사용할 수 없다. 
	별도의 연산자를 사용해야 한다. in 
*/

select * from employees;
select * from titles;

-- join 
select a.emp_no, a.first_name, b.title
from employees as a 
inner join titles as b 
on a.emp_no = b.emp_no;

use employees;
-- 인라뷰 로 결과를 출력해주세요( from 서브쿼리) 
select a.emp_no, a.first_name, b.title
from employees as a, (select * from titles) as b 
where a.emp_no = b.emp_no; 

-- 문제 1 
-- 직원 테이블에서 부서 팀장만 출력 하시오(join 사용, 단 현재 근무중인 사람만 출력)  
select * 
from employees as a 
inner join dept_manager as b 
on a.emp_no = b.emp_no
where b.to_date = '9999-01-01';

-- 문제 2 
-- 인라인 뷰로 출력 하시오 
select * 
from employees as a, (select *
						from dept_manager
							where to_date = "9999_01_01") as b 
where a.emp_no = b.emp_no;

-- 스칼라 서브쿼리 (select 절에 사용하는 서브쿼리) 
-- select 절에 서브쿼리를 사용하여 하나의 컬럼처럼 사용하기 위한 목적 
-- Join의 대체 표현식으로 자주 사용하지만 성능면에서 좋은 편이 아니다 !! 

select *, (select dept_name 
			from departments as b 
            where a.dept_no = b.dept_no) as '부서명'
from dept_manager as a 
where to_date = "9999_01_01";

-- 스칼라 서브쿼리 사용해서 결과를 뽑아주세요 
-- 문제 employees 테이블 emp_no, first_name (타이틀명) 

-- 단일행으로 변경 해야 한다. (title )
select a.emp_no, a.first_name, (select b.title
								from titles as b
								where a.emp_no = b.emp_no
                                group by emp_no ) as '직함'
from employees as a;





select title from titles;























































