--join 프롬두개쓰는거, 별명

select first_name,
        salary,
        dep.department_id,
        dep.department_name
from employees emp, departments dep
where employees.department_id = departments.department_id;

select first_name,
        salary,
        department_id
from employees;

select*
from departments;

--예)

select em.first_name,
        de.department_id,
        jo.job_id
from employees em, departments de, jobs jo
where em.department_id = de.department_id
and em.job_id = jo.job_id;

--left outer join 쓰는법은 프롬에 이퀄대신 left outer join 그다음에 and 대신 on
--left outer join은 안맞는 null 값이 이퀄쓸떈 빠져서 그것까지 포함할때사용

select em.first_name,
        em.salary,
        em.department_id,
        de.department_id,
        de.department_name
from employees em left outer join departments de --기준점이 중요함 임플로이먼저
on em.department_id = de.department_id
order by em.department_id desc;

--원래 알고있던 웨어절처럼 쓰고 웨어절 마지막에 (+)씀
select d.department_id,
        e.first_name,
        d.department_id
from employees e, departments d
where d.department_id = e.department_id(+)
order by e.department_id desc;

--널값 찾을때 in null
select *
from employees em
where em.department_id in null;
--178 kimberlay

select *
from employees em
order by em.department_id asc;

select *
from departments de
order by de.department_id asc;

select *
from employees em, departments de
where em.department_id = de.department_id
order by em.department_id asc;

select *
from employees em, departments de
where em.department_id = de.department_id(+)
order by em.department_id asc;
--킴벌리 디파트먼트가 null값이기떄문에 킴벌리 널을 쓰기위해선 붙여줘야하는 테이블에 (+)를 써줘야함

select *
from departments de, employees em
where de.department_id = em.department_id(+);

--right outer join
select em.first_name,
        em.salary,
        em.department_id,
        de.department_id,
        de.department_name
from employees em, departments de
where em.department_id(+) = de.department_id;
--널로 표현해야하는쪽에 플러스를 붙인다 left, right on 표현법도 있음

--right outer join --->left outer join
select em.first_name,
        em.salary,
        em.department_id,
        de.department_id
from departments de right outer join employees em
on de.department_id = em.department_id;


--full outer join       풀 아우터 조인은 (+) (+) 두개 못씀
select em.first_name,
        em.salary,
        em.department_id,
        de.department_id,
        de.department_name
from employees em full outer join departments de
on em.department_id = de.department_id;

--self join
select  employee_id,
        first_name,
        phone_number,
        salary,
        manager_id
from employees;



select*
from employees em, departments de
where em.department_id = de.department_id;

--셀프조인을 하는경우 두 테이블이 같기때문에 꼭 별명을 설정해주어야 쓸 수 있다.
select  em.employee_id,
        em.first_name,
        em.salary,
        em.phone_number,
        em.manager_id,
        ma.employee_id,
        ma.first_name,
        ma.phone_number,
        ma.email
from employees em, employees ma 
where em.manager_id = ma.employee_id
order by em.manager_id asc;



--잘못된 조인 얼추 숫자가 맞아서 매칭되어도 오류가 안뜰 수 있음
select em.employee_id,
    em.first_name,
    em.salary,
    lo.location_id,
    lo.city
from employees em, locations lo
where em.salary= lo.location_id;