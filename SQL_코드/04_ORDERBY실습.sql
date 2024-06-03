/*
ORDER BY 실습하기
*/

select * from employee order by emp_name;
select * from employee order by salary desc;
select emp_id as "사번", emp_name as "이름" from employee order by 이름 desc;
select emp_id, emp_name, salary as "월급" from employee order by 월급 desc;

select bonus as "보너스", salary as "월급" from employee order by 보너스 desc, 월급;
--> 먼저 보너스 기준으로 내림차순 정렬하고, 그 안에서 월급 기준으로 오름차순 정렬한 것이다.
---> 보너스 값이 같을 때, 그 안에서 월급 기준으로 오름차순 정렬한 것이다.

select email as "이메일", phone as "전화번호" from employee order by 이메일, 전화번호 desc;
select emp_name as "사원이름", hire_date as "입사일자" from employee order by 사원이름 desc, 입사일자;