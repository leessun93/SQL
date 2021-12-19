--1매니저가 있는 직원 106명 출력
select count(manager_id)
from employees;

--2최고임금 최저임금 차이 출력
select max(salary) 최고임금,
        min(salary) 최저임금,
        max(salary) - min (salary) 임금차이
from employees;

--3마지막으로 입사한 애송이는 누구냐
select to_char(max(hire_date), 'yyyy"년" mm"월" dd"일"')
from employees;

--4부서별로 평균 최저 최고를 부서 아이디와 출력하라
select avg(salary) ,
        max(salary) ,
        min(salary) ,
        department_id 부서아이디
from employees
group by department_id
order by department_id desc;

--5부서별로 평균, 최고, 최저임금, 업무아이디 출력 정렬순서는 최저임금 내림차순, 평균임금(소숫점 반올림), 오름차순

select
    trunc(avg(salary), 0),
    max(salary),
    min(salary),
    job_id
from employees
group by job_id
having min(salary) >= 2500
order by min(salary) desc, max(salary) asc;

--6 가장 연장자의 입사일을 ( 2001-01-13 토요일 ) 형식으로 출력하라
select
    to_char(MIN(hire_date), 'yyyy-mm-dd day') 
from employees;

--7 평균과 최저임금의 차이가 2000미만인 부서, 평균임금, 최저임금, (평균-최저)를 (평균-최저)내림차순으로 정렬
select
    department_id,
    avg(salary),
    min(salary),
    avg(salary)-min(salary)
from employees
group by department_id
having avg(salary) - min(salary) < 2000
order by avg(salary)-min(salary) desc;

--8 업무별로 최고임금과 최저임금의차이를 출력 정렬은 내림차순
select
    job_id,
    max(salary)-min(salary)
from employees
group by job_id
order by max(salary) - min(salary) desc;

--9번 2005년 이후 입사자중 관리자별로 평균 최대 최소급여 나타내라
--관리자별로 평균급여가 5000이상중에 평균 최소 최대급여를 출력해라
--평균급여 내림차순으로 정렬하고 평균급여는 소숫점 첫번째에서 반올림해라

select manager_id,
    trunc(avg(salary), 0),
    max(salary),
    min(salary)
from employees
where hire_date >= '2005-01-01'
group by manager_id
having avg(salary) > 5000
order by avg(salary) desc;

--10번 입사일 02/12/31일 이전이면 '창립맴버, 03 04 는 03,04년입사 나머지는 상장이후입사 optDate컬럼의 데이터로 출력
--정렬은 입사일 오름차순
select first_name,
       hire_date,
    case
        when hire_date < '2003/01/01' then '창립맴버'
        when hire_date > '2003/01/01' and hire_date < '2003/12/31' then '03년 창립맴버'
        when hire_date > '2004/01/01' and hire_date < '2004/12/31' then '04년 창립맴버'
        when hire_date > '2005/01/01' then '상장이후입사'
        end optDate
from employees
order by hire_date asc;


