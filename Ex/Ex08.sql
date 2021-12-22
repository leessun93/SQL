/***************************************************
* 서브 쿼리 단일행 in 같다 any=all 합집합 all=and 교집합
***********************************************/
--1)전체쿼리문 구조
select  first_name,
        salary
from employees
where salary > "Den 의 급여" ; 

--2) Den의 급여
select  first_name,
        salary
from employees
where first_name = 'Den';

--3) Query문 완성   -->들여쓰기 잘할것
select  first_name,
        salary,
        phone_number,
        department_id
from employees
where salary > (select  salary
                from employees
                where first_name = 'Den');


--예제)
--급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?

--1. 급여를 가장 적게 받는 사람의 급여
select min(salary)
from employees;

--2. 2100받는 사람의 이름, 급여, 사원번호
select  first_name,
        salary,
        employee_id
from employees
where salary = 2100;

--3. 식 조합
select  first_name,
        salary,
        employee_id
from employees
where salary = (select min(salary)
                from employees);


--예제)
--평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요?
--1. 평균급여?
select avg(salary)
from employees;

--2. 6461.83 보다 적게 받은 사람의 이름, 급여
select  first_name,
        salary
from employees
where salary < 6461.83;

--3. 식 조합
select  first_name,
        salary
from employees
where salary < (select avg(salary)
                from employees);


/***********************************
*Sub Query(다중행)
************************************/
--부서번호가 110인 직원의 급여와 같은 모든 직원의 사번, 이름, 급여를 출력하세요
--1. 부서번호가 110인 직원의 급여리스트를 구한다.
--   12008  8300
select  salary
from employees
where department_id = 110;

--2. 급여가 12008, 8300 인 직원의 리스틀 구한다
--표현1
select  employee_id,
        first_name,
        salary
from employees
where salary = 12008
or salary = 8300;

--표현2
select  employee_id,
        first_name,
        salary
from employees
where salary in (12008, 8300);

--3 두식을 조합한다
select  employee_id,
        first_name,
        salary
from employees
where salary in (select  salary
                 from employees
                 where department_id = 110);


--예제)
--각 부서별로 최고급여를 받는 사원을 출력하세요
/*
 100(마케팅)  20000   황일영   
 200(IT)     12300   강호동   
 200(IT)     8700    이효리    (X)
*/
--1. 그룹(부서)별 최고급여를 구한다 (사람 first_name은 표현할 수 없다)
select  department_id,
        max(salary)
from employees
group by department_id;

--그룹(부서)별 최고급여 --> 사원테이블에서 그룹(부서)번호 와 급여가 같은 직원을 구한다.
select  first_name,
        salary,
        phone_number,
        department_id
from employees
where (department_id, salary) in (select department_id, 
                                         max(salary)
                                  from employees
                                  group by department_id);

-- any 연산자
--부서번호가 110인 직원의 급여 보다 큰 모든 직원의 
--사번, 이름, 급여를 출력하세요.(or연산--> 8300보다 큰)

--1. 부서번호가 110인 직원의 급여
select salary
from employees
where department_id = 110;

--2. 부서번호가 110인(12008, 8300) 보다 급여가 큰직원리스트( 사번, 이름, 급여)를 출력
select  employee_id,
        first_name,
        salary
from employees
where salary > 12008
or salary > 8300;

--3.조합
select  employee_id,
        first_name,
        salary
from employees
where salary >any ( select salary --any 는 합집합
                    from employees
                    where department_id = 110); 


-- all 연산자
--부서번호가 110인 직원의 급여 보다 큰 모든 직원의 
--사번, 이름, 급여를 출력하세요.(and연산--> 12008보다 큰)

--1. 부서번호가 110인 직원의 급여
select salary
from employees
where department_id = 110;

--2. 부서번호가 110인(12008, 8300) 보다 급여가 큰직원리스트( 사번, 이름, 급여)를 출력
select  employee_id,
        first_name,
        salary
from employees
where salary > 12008
and salary >8300;

--3. 조합
select  employee_id,
        first_name,
        salary
from employees
where salary >all ( select salary --all 은 교집합
                    from employees
                    where department_id = 110);
/****************************************************
 ********************************************************
 **********************************************************/
 
 --각 부서별로 최고급여를 받는 사원을 출력하세요
 select department_id,
        max(salary)
 from employees
 group by department_id;
 
 --직원 리스트에서 부서별 최고 급여를 받는사람 구하기
 select first_name,
        salary,
        department_id
 from employees
 where salary = 11000
 and department_id = 30;
 
  select first_name,
        salary,
        department_id
 from employees
 where (department_id , salary) in (select department_id,
                                           max(salary)
                                    from employees
                                    group by department_id);
                                    

--table 서브쿼리 -->join 에 이용할 테이블로 사용예정
select department_id,
        max(salary)
from employees
group by department_id;




select  em.first_name,
        em.department_id,
        ms.department_id,
        ms.salary
from employees em, (select department_id,
                     max(salary) salary
                     from employees
                     group by department_id) ms
where em.department_id = ms.department_id
and em.salary = ms.salary;

