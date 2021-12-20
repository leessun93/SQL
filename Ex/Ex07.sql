/*********************************************
*Sub Query
*********************************************/
select  first_name,
        salary
from employees
where first_name = 'Den';

select  first_name,
        salary
from employees
where salary >= 11000;

-- 웨어절에 전체를 넣어서 하나의 문장으로 넣을수 있다. 수시로 변동하는 덴의 월급을 넣어주기위해 고정값 11000 대신넣음
select  first_name,
        salary
from employees
where salary >= (select salary --식에서 사용할때는 필요한 값만 사용해야한다 first_name같은거 여면 컨일난다
                 from employees
                 where first_name = 'Den' );
--월급을 가장 적게받는사람
select first_name,
        salary,
        employee_id
from employees
where salary = (select min(salary)
                    from employees);
--예제 평균급여보다 적게받는사람
select first_name,
        salary
from employees
where salary <=(select avg(salary)
                from employees);
                
 
-- = > >= < <= <>(같지않다)
