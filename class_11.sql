
-- 그룹함수, 그룹바이, having 절 

-- GROUP BY 절 
-- 그룹바이절은 데이터들을 원하는 그룹으로 나눌 수 있다. 
-- 나누고자 하는 구룹의 컬럼명을 SELECT 절과 GROUP BY 절 뒤에 추가하면 된다. 
-- 집계함수와 함께 사용되는 상수는 그룹바이절에 추가하지 않아도 된다(많이 실수 하는 부분) 

-- DISTINCT 와 GROUP BY 절 
-- DISTINCT 주로 중복을 제거 하기 위해서 사용한다. 
-- 그룹바이는 데이터를 그룹핑해서 그 결과를 가져오는 사용한다. 
-- 하지만 두 작업은 조금만 생각해 보면 동일한 형태의 작업이라는 것을 쉽게 알수 있고, 일부 작업의 경우 
-- distinct로 에 처리할 수 도 있다. 


-- HAGVING 절 
-- where 절에서는 집계함수를 사용 할 수 없다. 
-- having 절은 집계함수를 가지고 조건을 비교할 때 사용한다. 
-- having 절은 group by 절과 함께 사용 된다. 
use employees;
show tables;

select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

-- 합계 함수 
-- 문제 1. 전체 직원수 (전체 직원수), 제일먼저 입사한 일자 (최초 고용일자), 제일 마지막 입사일자(가장최근 고용일자)  
select count(*), min(hire_date), max(hire_date)
from employees;

-- 문제 2. gender 로 그룹핑 
select * 
from employees
group by gender;


-- 문제 3. 남성, 여성 수와, gender 를 표시 하세요 
select count(*), gender
from employees
group by gender; 


-- 문제 4. 고용일자로 그룹화 
select * 
from employees
group by hire_date;


-- 문제 5.  hire_date 가 같은 직원에 명수를 표시 하시오 
-- 전체,  as 동기 
select *, count(emp_no) as '동기' 
from employees
group by hire_date;




-- 문제 6. 위 쿼리에서 남성과, 여성을 구분해서 결과값을 구하시오 ! 
select *, count(emp_no) as '동기' 
from employees
group by hire_date, gender
order by hire_date asc;

select *, count(emp_no) as '동기' 
from employees
group by hire_date, gender
order by hire_date desc;


-- 
select * from salaries;
desc salaries;

-- 급여 테이블에서 
-- 총건수, 총 급여, 평균 급여 (소수점 2자리 표현), 최고연봉자금액, 최소연봉자에금액 
select count(*) as "총 건수",
       round(avg(salary), 2)  as "평균급여",
       max(salary) as "최고연봉금액",
       min(salary) as "최소연봉자에금액"
from salaries;       

-- 데이터 검증 
select max(salary) from salaries;


-- having 절 연습 
-- 연봉을 10번 이상 받은 직원들을 출력 하시오 
select *, count(emp_no) as '횟수'
from salaries
group by emp_no
having count(emp_no) >= 10
order by emp_no asc
limit 30;

-- 문제 
select * from titles;

select count(*) from titles;

-- having 절 문제 1 
-- 10만명 이상 사용하고 있는 직함의 이름과 직원의 수를 출력 하시오!! 
select title, count(*)
from titles
group by title
having count(*) >= 100000;

-- having 절 문제 2 
-- 5만명 이상 근무하고 있는 부서의 부서 번호와 부서 소속 사원의 수를 출력 하시오 !!! 
select *, count(*)
from dept_emp
group by dept_no
having count(*) >= 50000;


select * from dept_emp;
-- 현재 근무중인 사람들만 출력 하시오 
select * 
from dept_emp
where to_date = '9999-01-01';

select * , count(*)
from dept_emp
where to_date = '9999-01-01';

-- 각 부서별과 매니저의 수를 구하시오 (퇴사자) 
select * from dept_manager;

select *
from dept_manager 
where to_date <> '9999-01-01';
-- != , <> 













































       




























































