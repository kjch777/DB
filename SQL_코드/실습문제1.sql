select emp_name as "사원이름", dept_code as "부서코드" from employee where dept_code != 'D5';
select emp_name as "사원이름", salary as "급여" from employee where salary < 3000000;
select emp_name as "사원이름", job_code as "직무코드" from employee where job_code != 'J3';
select emp_name as "사원이름", bonus as "보너스" from employee where bonus != 0.1;
select emp_name as "사원이름", manager_id as "매니저ID" from employee where manager_id != 200;
-- where 절에서 숫자는 정수, 실수를 막론하고 작은 따옴표 ' ' 를 사용하지 않아도 상관없다.

select emp_name as "사원이름", email as "이메일" from employee where email is null;
select emp_name as "사원이름", phone as "전화번호" from employee where phone is null;
select emp_name as "사원이름", bonus as "보너스" from employee where bonus is null;
select emp_name as "사원이름", manager_id as "매니저ID" from employee where manager_id is null;
select emp_name as "사원이름", ent_date from employee where ent_date is null;

select emp_name as "사원이름", email as "이메일" from employee where email is not null;
select emp_name as "사원이름", phone as "전화번호" from employee where phone is not null;
select emp_name as "사원이름", bonus as "보너스" from employee where bonus is not null;
select emp_name as "사원이름", manager_id as "매니저ID" from employee where manager_id is not null;
select emp_name as "사원이름", ent_date as "퇴사일자" from employee where ent_date is not null;

select emp_name as "사원이름", salary as "급여" from employee where salary between 2000000 and 3000000;
select emp_name as "사원이름", hire_date as "입사일자" from employee where hire_date between to_date('2000-01-01', 'yyyy-mm-dd') and to_date('2010-12-31', 'yyyy-mm-dd');
select emp_name as "사원이름", emp_id as "사원번호" from employee where emp_id between 210 and 220;
select emp_name as "사원이름", bonus as "보너스" from employee where bonus between 0.1 and 0.3;
select emp_name as "사원이름", sal_level as "급여등급" from employee where sal_level between 'S3' and 'S5';

select emp_name as "사원이름", salary as "급여" from employee where salary not between 2000000 and 3000000;
select emp_name as "사원이름", hire_date as "입사일자" from employee where hire_date not between to_date('2000-01-01', 'yyyy-mm-dd') and to_date('2010-12-31', 'yyyy-mm-dd');
select emp_name as "사원이름", emp_id as "사원번호" from employee where emp_id not between 210 and 220;
select emp_name as "사원이름", bonus as "보너스" from employee where bonus not between 0.1 and 0.3;
select emp_name as "사원이름", sal_level as "급여등급" from employee where sal_level not between 'S3' and 'S5';