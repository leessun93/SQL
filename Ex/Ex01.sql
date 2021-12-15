select *
from employees; /*컨트롤 엔터하면 실행, 컨트롤 쉬프트하면 자동완성*/
--부서 테이블 전체 조회
select * 
from departments;/*테이블자료를 볼수있게 불러오는 코드셀렉트 프롬*/

select employee_id,
       first_name,
       last_name   /*셀렉트 자료제목하면 그것들만 가져옴*/
from employees;
--원하는 컬럼만 조회
select first_name,
        last_name,
        salary,
        phone_number,
        email,
        hire_date -- 적은 순서대로 나옴 마지막에 꼭 콤마 붙이면 안됨
from employees; --테이블 먼저 작성하고 안의 내용물 작성
       
       
       --출력할 컬럼명의 별명 적용 == <as 별명> 
select  employee_id as empNo,
        first_name as "f-name",
        salary as "연 봉"
from employees;

select  employee_id,    --꼭 띄어쓰기, 소문자로 출력하고싶다면 ""
        first_name 이름, --띄어쓰기없이 한글로 그냥 사용 가능
        last_name 전화번호,
        salary as 급여,
        phone_number as 핸드폰번호,
        email as 이메일,
        hire_date as 입사일
from employees;

-- 연결 연산자(Concatenation)로 컬럼들 붙이기 ||
select  first_name || last_name
from employees;

select  first_name || ' ' || last_name as name -- 가운데'' 공백 넣고 전체 네임으로 리네임
from employees;

select  first_name || '입사일은' || hire_date as name 
from employees;

--산술 연산자 사용하기
select first_name,
        salary,
        salary*12 연봉,
        (salary+300)*12 보너스연봉
from employees;

--예제

select  first_name || '-'|| last_name "성 명",
        salary "급 여",      --띄어쓰기 쓸때는 "" 기호쓸때는 ''
        salary*12 연봉,
        salary*12+5000 연봉2,
        phone_number 전화번호
from employees;

--where절
--비교 연산자
--부서번호가 10인 사원의 이름을 구하시오
/*= != > < >= <= 연산자 사용*/

select  first_name, --2.의 이름 급여 사원번호
        last_name,
        salary,
        department_id --개발할땐 구하고자하는 조건까지 검색해서 보고 확인후 지우던가 수정함
from employees --이땐 마침표 사용 x
where department_id >10; --1. 10번인 사원



-- 1. 연봉 15000 이상인 사원들의 급여와 이름출력
select salary 급여,
        first_name 이름
        --salary*12 연봉
from employees
where salary*12 > 15000;

select  first_name 이름,
        hire_date 입사일
from employees
where hire_date >= '07/01/01'; //숫자 뿐만 아니라 날짜등도 연산 가능

--이름이 lex인 직원의 연봉 출력
select salary
from employees
where first_name = 'Lex';

/*연봉이 14000이상 17000이하인 사원의 이름과 연봉을 구하세요 == and*/

select  first_name 이름,
        salary*12 연봉
from employees
where salary>=14000
and salary <= 17000;

--연봉이 14000 이하이거나 17000 이상인 사원
select first_name 사원
from employees
where salary <= 14000
or salary >= 17000;

--비트윈으로 사용--
select first_name 사원 --비트윈은 무조건 양쪽 포함 크거나 같다, 작거나 같다
from employees
where salary between 14000 and 17000; --작은 값을앞에 큰값을 뒤에 느린연산자인편

--IN 연산자로 여러 조건을 검사하기
select  first_name,
        last_name,
        salary
from employees
where first_name = 'Neena'
or first_name = 'Lex' --and는 깐깐 그래서 or
or first_name = 'John'
; 
--in 사용한 위와 같은 표현
select  first_name,
        last_name,
        salary
from employees
where first_name in ('Neena', 'Lex', 'John');

--예제)
select  first_name,
        salary
from employees
where salary in (2100, 3100, 4100, 5100);


--입사일이 04/01/01 에서 05/12/31 사이의 사원
select first_name 사원
from employees
where hire_date > '04/01/01'
and hire_date < '05/12/31';

--like 연산자로 비슷한것들 모두 찾기
select  first_name,
        last_name,
        salary
from employees
where first_name like 'L%'; --L로 시작하는애들 다 찾기


--이름에 am 을 포함한 사원의 이름과 연봉을 출력
select  first_name,
        salary
from employees
where first_name || last_name like '%am%'; --앞에오든 뒤에오든 상관없다 모두 포함
 
 --이름에 두번째 글자가 a인 사원의 이름과 연봉 출력
SELECT first_name,
        salary*12
FROM employees
where first_name like '_a%';

--이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select first_name
from employees
where first_name like '___a%'; --%안붙이면 4글자짜리만 이라는뜻 그뒤로 더 상관없다 는 %를 붙여야함

--이름이 4글자인 사원중 끝에서 두번쨰 글자가 a인 사원 출력
select first_name
from employees
where first_name like '__a_';

--null

select  first_name,
        salary,
        commission_pct,
        salary*commission_pct
from employees
where salary between 13000 and 15000;

--is null / is not null 널은 값이 없음 0은 숫자 0 서로 다름
--where commision_pct = null 이렇게 쓰면 안됨
select *
from employees
where commission_pct is not null;

--예제) 1 커미션 있는사람 출력
select first_name 이름,
        salary*12 연봉,
        commission_pct 커미션비율
from employees
where commission_pct is not null;

--예제) 2 담당 매니저가 없고 커미션 비율이 없는 직원의 이름 출력
select first_name
from employees
where manager_id is null
and commission_pct is null;

--ORDER BY 절
--정렬은 연산,에너지가 많이든다 않이궂이 안필요하면 안쓰는게 좋다
select *
from employees
order by salary asc, first_name desc --order by 는 정렬 asc는 작은수부터 desc 는 큰수부터
;

select  first_name,
        salary
from employees
where salary >= 9000
order by salary desc;
;

--예제)
select  department_id,
        salary,
        first_name
from employees
order by department_id; 

--예제2)
select  first_name,
        salary
from employees
where salary >= 10000    
order by salary desc;

SELECT  department_id,
        salary,
        first_name
FROM EMPLOYEES
order by department_id asc, salary desc;


