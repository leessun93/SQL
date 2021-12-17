--group by 그 그룹별로 묶어줌
select department_id avg(salary)
from employees
group by department_id
order by department_id; 


select department_id, count(*), avg(salary),  -- 그룹별로 나타내기때문에 여기도 그룹 써줄수 있음
from employees
group by department_id
;

select department_id, job_id, count(*), avg(salary)
from employees
group by department_id, job_id
order by department_id asc, count(*) desc;



--연봉의 합계가 20000 이상인 부서의 부서번호 인원수 급여합계


--where 절에는 그룹 함수를 쓸 수 없다
select department_id,
        count(*),
        sum(salary)
from employees
where sum(salary*12) > 20000;

--having절 having 절에는 그룹함수와 groub by에 참여한 칼럼만 사용할 수 있다.

select department_id, count(*), sum(salary) --사원번호와 몇명인지 월급합계를 나타내주라
from employees
group by department_id        --디파트먼트 아이디 테이블에서
having sum(salary) >= 20000   --월급 합계가 20000인 그룹중에서
and department_id = 80     --사원번호가 100번인 애들의
;

--case and 문  (if else와 유사)

select employee_id,
        first_name,
        salary,
        job_id,
        case    when job_id = 'AC_ACCOUNT' then salary + salary*0.1
                when job_id = 'SA_REP' then salary+salary*0.2
                when job_id = 'ST_CLERK' then salary+salary*0.3
                else salary       
        end realsalary
from employees;


--DECODE()
SELECT employee_id,
        first_name,
        salary,
        job_id,
        decode(job_id ,'AC_ACCOUNT' ,salary+salary*0.1 ,     -- decode   (이게,이거면,이 식,
                    'SA-REP', salary+salary*0.2,             --          중복생략,이거면,이 식,
                    'ST_CLERK', salary+salary*0.3,           --           엘스)
               salary) realSalary     
FROM employees;                               
                                            


--예제
select first_name,
        department_name,
        case when department_id >= 10 and department_id <= 50 than  'A-TEAM'
             when department_id >= 60 and department_id <= 100 than 'B-TEAM'
             when department_id >= 110 and department_id <= 150 than 'C-TEAM'
            else '팀없음'
        
        
/*        decode(department_id, department_id > 10 and department_id < 50, 'A-TEAM',
                              department_id > 60 and department_id < 100, 'B-TEAM',
                              department_id > 110 and department_id < 150, 'C-TEAM',
                '팀없음') TEAM          내가 틀린거*/
from employees;

--
