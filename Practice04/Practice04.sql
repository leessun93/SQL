--1번 
select first_name,
        manager_id,
        commission_pct,
        salary
from employees
where manager_id is not null
and commission_pct is null
and salary > 3000;
        
--2번문제2. 
/*
각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name), 급여(salary), 입사일(hire_date), 전화번호(phone_number), 부서번호(department_id) 를 조회하세요 
-조건절비교 방법으로 작성하세요
-급여의 내림차순으로 정렬하세요
-입사일은 2001-01-13 토요일 형식으로 출력합니다.
-전화번호는 515-123-4567 형식으로 출력합니다.
(11건)*/

select  employee_id,
        first_name,
        salary,
        to_char(hire_date, 'yyyy-mm-dd'),
        replace(phone_number, '999-999-9999'),
        department_id
from employees
where (department_id, salary) in (select department_id,
                                        max(salary)
                                        from employees
                                 group by department_id
                                 )
order by salary desc;

/*
문제3
매니저별 담당직원들의 평균급여 최소급여 최대급여를 알아보려고 한다.
-통계대상(직원)은 2005년 이후(2005년 1월 1일 ~ 현재)의 입사자 입니다.
-매니저별 평균급여가 5000이상만 출력합니다.
-매니저별 평균급여의 내림차순으로 출력합니다.
-매니저별 평균급여는 소수점 첫째자리에서 반올림 합니다.
-출력내용은 매니저아이디, 매니저이름(first_name), 매니저별평균급여, 매니저별최소급여, 매니저별최대급여 입니다.
(9건)*/

select  ma.manager_id,
        em.first_name,
        ma.a,
        ma.b,
        ma.c
from employees em,( select  manager_id,
                            avg(salary) c,
                            min(salary) b,
                            max(salary) a
                            
                    from employees
                    where manager_id is not null
                    group by manager_id
                    ) ma
where em.manager_id = ma.manager_id
and em.hire_date > '05/01/01'
and ma.c >= 5000
order by ma.c desc;

--매니저별 평균 맥스 미니멈 급여
select  manager_id,
        avg(salary),
        min(salary),
        max(salary)
from employees
group by manager_id;



        