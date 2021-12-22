--rownum
--급여를 가장 많이 받는 5명의 직원 이름 출력

select  max(salary)
from employees;
/*
select first_name,
        salary
from employees
where salary = (select max(salary)
                from employees);
*/
--rownum은 일련번호 매기기
select  rownum,   
        first_name,
        salary
from employees
where rownum >=1
and rownum <=5
order by salary desc; -- 순서먼저 가져오고 정렬해서 높은순의 월급출력이 X
--
--급여순으로 정렬--> rownum이 섞여버림
--정렬이 가장 나중에 실행됨
select  rownum,
        first_name,
        salary
from employees
order by salary desc;

--
select  first_name,
        salary
from employees
order by salary desc;

--정렬이 된 테이블을 사용해서 rownum을 붙임/ 로우 넘이랑 섞이니까 프롬에 한테이블로 따로 불러와서 함
select  rownum,
        first_name,
        salary
from (  select  first_name,
                salary
        from employees
        order by salary desc);
--앞서 오토바이와 로우넘을 그냥 사용했을땐 로우넘이 먼저 작동해서 그냥 순서를 가져와서 거기서부터 월급순 정렬을했기때문에
--섞이지 않았다 따라서 급여별로 따로 정렬된 테이블을 가져와 로우넘으로 순서를 붙여주면 따로작용한다
--
select  rno,
        first_name,
        salary
from (select    rownum rno, 
                o.first_name,
                o.salary
      from (  select  first_name, -- 테이블에 별명붙이면 별명써야함
                      salary
              from employees
              order by salary desc) o
            ) r
where rno >=2
and rno <= 4;

-- 07년입사자중 급여가 많은 3등 7등 직원 출력
select  no,
        first_name,
        salary,
        hire_date
from (select rownum no,
            first_name,
            salary,
            hire_date
      from (    select  first_name,
                        salary,
                     hire_date
                from employees
                where hire_date >= '07/01/01'
                and hire_date < '08/01/01'
                order by salary desc)
            ) hi
where no>= 3
and no <= 7;

-- 07년입사자중 급여가 많은 3등 7등 직원 입사일 + 부서명 출력
select  no,
        first_name,
        salary,
        department_name,
        hire_date
from (select rownum no,
            first_name,
            salary,
            department_name,
            hire_date
      from (    select  first_name,
                        salary,
                        department_name,
                        hire_date
                from employees em, departments de
                where em. department_id = de.department_id
                and hire_date >= '07/01/01'
                and hire_date < '08/01/01'
                order by salary desc)
            ) hi
where no>= 3
and no <= 7;


-- 순서=로우의 범위 출력 from(로우럼 붙이고 (테이블 정렬해서 ot)) 
-- 순서 다시 정리 1.정렬하고 2.rownum붙이고 3.where절 사용!


/*7년도에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은?*/
select  ort.rn,
        ort.first_name,
        ort.salary,
        ort.hire_date,
        ort.department_name
from (select rownum rn,
             ot.first_name,
             ot.salary,
             ot.hire_date,
             ot.department_name
      from (select  emp.first_name,
                    emp.salary,
                    emp.hire_date,
                    dep.department_name
            from employees emp, departments dep      ---(0) 부서명 때문에 조인
            where emp.department_id = dep.department_id
            and hire_date >= '07/01/01'
            and hire_date < '08/01/01' 
            order by salary desc) ot     ----(1)
      ) ort   ----(2)
where ort.rn >= 3   ----(3)
and ort.rn <=7
