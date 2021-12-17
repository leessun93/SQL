--문제1번.
select first_name || last_name 이름,
        salary 월급,
        Phone_number 전화번호,
        hire_date 입사일
from employees
ORDER BY hire_date asc;


--문제2번. *
select  job_title,
        max_salary
from jobs, employees
order by salary desc;

--문제3번.
select  first_name,
        manager_id,
        commission_pct,
        salary
from employees
where manager_id is not null
and commission_pct is null;
     
--문제4번.

select  job_title,
        max_salary
from jobs, employees 
where salary > 10000
order by max_salary desc;

--문제5번.
select first_name,
        salary,
        NVL (commission_pct, 0)
from employees
where salary<14000
and salary>=10000
order by salary desc;


--문제6번.
select first_name,
        salary,
        to_char(hire_date, 'yyyy-mm'),
        department_id
from employees
where department_id in (10, 90, 100);



--문제7번.
select first_name,
        salary
from employees
where first_name like '%s%'
or first_name like '%S%';



--문제8번.
select *
from employees, departments
order by length(department_name) desc;


--문제9번.

select upper(country_name)
from countries
order by country_name asc;


--문제10번.

select  first_name,
        salary,
        replace(phone_number,'999.9999.9999', '999-9999-9999'),
        hire_date        
from employees
where hire_date < '03/12/31';