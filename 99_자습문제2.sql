-- ORDER BY
select * from department order by dept_title;
select * from employee order by salary desc;
-- from -> select -> order by 순으로 해석된다.
select emp_name, hire_date from employee order by hire_date;
select local_name from location order by national_code;
select emp_id, emp_name from employee order by emp_name;

-- HAVING ◀ 반드시 group by 가 선행되어야 한다.
select dept_code, round(avg(salary)) from employee group by dept_code having avg(salary) > 3000000;
--           where: 조건에 해당하는 값들을 검색한 다음, 조건에 맞는 것처럼 보이게 해준다..?
-- group by having: 모든 값을 조회하고, 조건에 맞는 값만 선별한다.
select job_code, count(*) as "직원 수" from employee group by job_code having count(*) >= 3;
-- from(찾을 테이블 설정) -> group by(묶을 그룹 설정) -> having(조건 설정) -> select(그룹 조건에 맞는 값 조회) 순으로 해석된다.
select dept_code, sum(salary) as "급여 합계" from employee group by dept_code having sum(salary) >= 10000000;
select sal_level, max(salary) as "최대 급여" from employee group by sal_level having max(salary) < 5000000;
select dept_code, min(salary) as "최소 급여" from employee group by dept_code having min(salary) >= 2000000;

-- GROUP BY
select dept_code, count(*) as "직원 수" from employee group by dept_code;
select job_code, round(avg(salary)) from employee group by job_code;
-- avg 또는 sum 을 사용했을 때, 정수 값으로 출력되게 만들고 싶다면
-- ceil(올림), floor(내림), round(반올림) 등을 사용하면 된다.
select sal_level, sum(bonus) from employee group by sal_level;
select dept_code, max(salary) from employee group by dept_code;
select job_code, min(salary) from employee group by job_code;
select national_code, count(*) as "지역 수" from location group by national_code;
select location_id, count(*) as "부서 수" from department group by location_id;
select dept_code, avg(bonus) as "보너스 평균" from employee group by dept_code;
select sal_level, count(*) as "직원 수" from employee group by sal_level;
select job_code, sum(salary) as "급여 합계" from employee group by job_code;

-- WHERE
select emp_name as "직원 이름", salary as "급여" from employee where salary >= 3000000;
select emp_name, dept_code from employee where dept_code = 'D1';
select emp_name, job_code from employee where job_code = 'J2';
select emp_name, sal_level from employee where sal_level = 'S4';
select location_id as "부서 이름" from department where location_id = 'L1';
select local_name, national_code from location where national_code = 'US';
select national_name from national where national_name = '한국';
select sal_level from sal_grade where min_sal >= 2000000;
select emp_name, bonus from employee where bonus is not null;
select dept_title from department where dept_title like '해외%';
select emp_name, ent_yn from employee where ent_yn = 'N';
select emp_name, hire_date from employee where hire_date > to_date('2000-01-01', 'yyyy-mm-dd');
select emp_name, phone from employee where phone like '010%';
select emp_name, email from employee where email like '%@or.kr';
select emp_name, manager_id from employee where manager_id is null;
select emp_name, salary from employee where salary between 2000000 and 3000000;
select emp_name, job_code from employee where job_code in ('J5', 'J6', 'J7');
select emp_name, dept_code, job_code from employee where dept_code = 'D1' and job_code = 'J7';
select emp_name, salary, bonus from employee where salary >= 3000000 and bonus is not null;
select emp_name, dept_code from employee where dept_code = 'D5' or dept_code = 'D6';
select emp_name, hire_date from employee where hire_date < to_date('00', 'yy');
select emp_name, phone from employee where phone is null;
select dept_title, location_id from department where location_id in ('L1', 'L2', 'L3');
select emp_name, salary, ent_yn from employee where salary >= 3000000 and ent_yn = 'N';
select emp_name, dept_code, ent_date from employee where dept_code = 'D2' and ent_date is null;