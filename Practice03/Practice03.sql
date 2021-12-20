--예제 1번

select  em.employee_id,
        em.first_name,
        em.last_name,
        de.department_name
from employees em, departments de
where em.department_id = de.department_id
order by department_name asc, employee_id asc;

--예제 2번사번 
select  em.employee_id,
        em.first_name,
        em.salary,
        de.department_name,
        jo.job_title
from employees em, departments de, jobs jo
where jo.job_id = em.job_id
and em.department_id = de.department_id
order by employee_id asc;

--예제 2-1번
select  em.employee_id,
        em.first_name,
        em.salary,
        de.department_name,
        jo.job_title
from employees em, departments de, jobs jo
where jo.job_id = em.job_id
and em.department_id = de.department_id(+)
order by employee_id asc;

--예제3번 도시아이디, 도시명, 부서명, 부서아이디를 도시아이디(오름차순)로 정렬하여 출력하세요
select lo.location_id,
        lo.city,
        de.department_name,
        de.department_id
from departments de, locations lo
where lo.location_id = de.location_id
order by location_id asc;




--예제 3-1번
select lo.location_id,
        lo.city,
        de.department_name,
        de.department_id
from departments de, locations lo
where lo.location_id = de.location_id(+)
order by location_id asc;

--예제4번 

select  re.region_name,
        co.country_name
from countries co, regions re
where co.region_id = re.region_id
order by re.region_id desc, co.country_name asc;

--예제 5번

select  em.employee_id,
        em.first_name,
        em.hire_date,
        ma.first_name,
        ma.hire_date
from employees em, employees ma
where em.manager_id = ma.employee_id
and ma.hire_date > em.hire_date;

--예제 6번 

select  co.country_name,
        co.country_id,
        lo.city,
        lo.location_id,
        de.department_name,
        de.department_id
from departments de, locations lo, countries co
where de.location_id = lo.location_id
and lo.country_id = co.country_id
order by country_name asc;


--예제7번
--(job_id)가 ‘AC_ACCOUNT’로 근무한 사원의 사번, 이름(풀네임), 업무아이디, 시작일, 종료일을 출력하세요.

select  em.employee_id,
        em.first_name || last_name,
        em.job_id,
        jh.start_date,
        jh.end_date
from employees em, job_history jh
where em.employee_id = jh.employee_id
and jh.job_id = 'AC_ACCOUNT';

--예제8번 

select  de.department_id,
        de.department_name,
        em.first_name,
        lo.location_id,
        lo.city,
        co.country_id,
        co.country_name,
        re.region_id,
        re.region_name
from employees em, departments de, locations lo, countries co, regions re
where em.employee_id = de.manager_id
and de.location_id = lo.location_id
and lo.country_id = co.country_id
and co.region_id = re.region_id;

--예제 9번각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 부서명(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.
/*부서가 없는 직원(Kimberely)도 표시합니다.
(106명)*/

select  em.employee_id,
        em.first_name,
        de.department_name,
        ma.first_name
from employees em, employees ma, departments de
where em.manager_id = ma.employee_id
and em.department_id = de.department_id(+);

