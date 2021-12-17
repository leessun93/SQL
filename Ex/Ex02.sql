/*단일행 함수*/
select  email,
        INITCAP(email) "Email2", --첫글자만 대문자고 나머지는 소문자로 바꿔줌
        department_id
from employees
where department_id = 100
;

select  first_name,
        lower(first_name) l_name,  -- 전부 소문자로
        upper(first_name) u_name   -- 전부 대문자로
from employees
where department_id = 100;

--문자함수 - SUBSTR(컬럼명, 시작위치, 글자수)
select  first_name,
        SUBSTR(first_name,1,3), -- 1부터 3번까지 출력
        SUBSTR(first_name,-3,2) -- 뒤에서부터 3부터 시작 거기서부터 2까지 출력
from employees
where department_id = 100;

--문자함수 -LPAD(컬럼명, 자리수, '채울문자') /RPAD(컬럼명, 자리수, '채울문자')
select first_name,
        lpad(first_name, 10, '*'), -- 퍼스트네임을 최대 10글자 빈곳에 왼쪽으로 *채움
        rpad(first_name, 10, '*')  -- 퍼스트네임 최대 10글자 빈곳에 오른쪽으로 *채움    
FROM employees;

--문자함수 - repalce(컬럼명, 문자1, 문자2)
select first_name,
        replace(first_name, 'a', '*'), -- 퍼스트네임의 a를 찾아  *로 바꾼다    
        replace(first_name, substr(first_name, 2, 3), '***')
from employees
where department_id = 100;

--숫자함수 - round(숫자, 출력을 원하는 자릿수)
/*select sysdate -- 현재 사용자의 날짜 테이블은 상관없지만 써줘야함 그래서 가상의 dual써줌
from dual;*/
select  round(123.456, 2) "r2", --(a , b) a숫자를 소숫점 b자리 숫자전까지 반올림
        round(123.456, 0) "r0", --(a , b) a숫자의 소숫점 0번=정수 까지 반올림
        round(123.456, -1) "r-1" --(a, b) a 숫자의 소숫점 -1=정수부분 1번 까지 반올림
from dual;

--숫자함수 --trunc(숫자, 출력을 원하는 자리수)
select trunc(123.346, 2) "r2", --소숫점 둘째자리까지 놔두고 버림
        trunc(123.956, 0) "r0", --소숫점 0번째자리=정수 까지 놔두고 버림
        trunc(123.456, -1) "r-1" -- 소숫점 -1번째=정수1의자리 까지 전부 버림
from dual;

--날짜 함수- sysdate()
select sysdate
from dual;

select sysdate,
        hire_date,
        months_between(sysdate, hire_date)
from employees
where department_id = 100;

--to char(숫자, '출력모양') 숫자형-> 문자형으로 변환하기
select first_name,
        salary,
        salary*12,
        to_char(salary*12,'999999999'), --문자로 취급함 9는 기호,자릿수 라고 생각하면 좋음
        to_char(salary*12,'099999'), --6자리로 맞춰주고 빈공간은 0으로 채움 특정 숫자를 채우는게 아님
        to_char(salary*12,'$999999'), -- 달러 숫자 5자리로 표현해라
        to_char(salary*12,'999999.99'), -- 소숫점 2자리 까지 표현해라
        to_char(salary*12,'999,999'), -- 우리나라 돈표시처럼 표현
        to_char(salary*12,'9999,999999,999')
from employees
where department_id = 100;

--변환함수>to char(날짜, '출력모양') 날짜 -> 문자형으로 변환하기
select  sysdate,
        to_char(sysdate, 'yyyy-mm-dd') -- yyyy yy mm dd 젤 많이 씀 hh24:mi:ss 시분초
from dual;


select sysdate,
        to_char(sysdate, 'dd'),
        hire_date,
        to_char(sysdate, 'MM')
from employees;

--일반함수 > nvl(컬럼명, null일대 값)/nvl2(컬럼명, null아닐떄값, null일때 값)
SELECT first_name,
        commission_pct,
        NVL(commission_pct, 0), -- null값을 평균같은걸 구할때 쓰기위해 0으로 표기만해달라
        NVL2(commission_pct, -1, 0) --원래값을 무시하고 null은 0으로 아닌애는 100으로 전부 바꾼다
FROM employees;
    


