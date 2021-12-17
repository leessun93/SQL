/********************************
*그룹함수
*******************************/
--오류 발생 이유는 한개의 로우에 다 표현할 수 없다.
select first_name, avg(salary)
from employees;

--그룹함수 avg()
select avg(salary)
from employees;

--그룹함수 count()
select count(*),
        count(commission_pct),
        count(DEPARTMENT_id)
from employees; --row의 갯수 구하기


select count(*)
from employees
where salary > 16000;

--부서 번호가 100번인 사람들을 모두 세세요
select count(*)
from employees
where department_id = 100;

--그룹함수 sum()
select sum(salary), count(*), avg(salary)
from employees
where salary > 16000;


select *
from employees;

--그룹함수 avg()
select count(*),
        sum(salary),
        sum(salary)/count(*) avg,
        avg( nvl(salary, 0))
from employees;


--그룹함수 max() / min()
select count(*),
        max(salary),
        min(salary)
from employees;


/*********************************************
*group by 절
*********************************************/
select avg(salary), department_id -- 2 이건 가능하다
from employees
group by department_id; --그룹으로 지으라고 했으니까1
