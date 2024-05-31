/*함수 실습 코드*/

-- LENGTH --

select emp_name, emp_id, length(emp_name) as "이름_길이" from employee order by "이름_길이";
select emp_name, emp_id, email, length(email) as "이메일 길이" from employee order by "이메일 길이";
select emp_name, emp_id, phone, length(phone) as "전화번호_길이" from employee where length(phone) = 11  order by "전화번호_길이";
select emp_name, emp_id, email, length(email) as "이메일 길이" from employee where length(email) >= 15 order by "이메일 길이";
select emp_name, emp_id, dept_code, length(dept_code) as "부서코드_길이" from employee where length(dept_code) = 2 order by "부서코드_길이";


select emp_name, emp_id, phone from employee where instr(phone, '010') >= 1;
-- ▲ 맨 뒤의 부등호는 index 기준 값이다.
-- index 는 1부터 시작하기 때문에, >0 또는 >=1 을 작성해 주어야 한다.

select emp_name, emp_id, phone from employee where phone like '010%';

select substr(emp_name, 1, 3) as "이름" from employee;
select substr(phone, -4) as "전화번호 뒷자리" from employee where phone is not null;
select emp_name as "사원이름", substr(emp_no, 1, 6) as "생년월일" from employee;
select substr(phone, 1, 3) from employee where phone is not null;
select emp_name as "사원이름", substr(email, instr(email, '@') +1) as "도메인" from employee;


-- AVG(평균)

-- 모든 사원의 급여 평균 조회
SELECT AVG(SALARY) FROM EMPLOYEE;

-- 올림 내림 반올림을 사용하여 정수로 출력하기
SELECT CEIL (AVG (SALARY)) FROM EMPLOYEE;
SELECT FLOOR (AVG (SALARY)) FROM EMPLOYEE;
SELECT ROUND (AVG (SALARY)) FROM EMPLOYEE;

/***** COUNT 실습 *****/
SELECT COUNT(*) AS "총 직원 수" FROM EMPLOYEE;
SELECT COUNT(*) AS "D9 부서 직원 수" FROM EMPLOYEE WHERE DEPT_CODE = 'D9';
SELECT COUNT(BONUS) AS "보너스 수령자" FROM EMPLOYEE;
SELECT COUNT(BONUS) AS "보너스 수령자" FROM EMPLOYEE WHERE BONUS IS NOT NULL;

/***** AVG(평균) 실습 *****/
SELECT ROUND(AVG(SALARY)) AS "급여 평균" FROM EMPLOYEE;
SELECT DEPT_CODE AS "부서코드", ROUND(AVG(SALARY)) AS "부서별 급여 평균" FROM EMPLOYEE GROUP BY DEPT_CODE;
SELECT ROUND(AVG(SALARY)) AS "D5 부서 급여 평균" FROM EMPLOYEE WHERE DEPT_CODE = 'D5';

/***** REPLACE 실습 *****/
SELECT EMP_NAME, EMAIL, REPLACE (EMAIL, '.', '-') AS "수정된 이메일" FROM EMPLOYEE;
SELECT EMP_NAME, EMP_NO, REPLACE (EMP_NO, '-', ' ') AS "수정된 주민번호" FROM EMPLOYEE;
SELECT EMP_NAME, REPLACE (EMP_NAME, '김', 'KIM') AS "수정된 이름" FROM EMPLOYEE;
SELECT EMP_NAME, REPLACE (JOB_CODE, 'J', 'JOB') AS "수정된 직무코드" FROM EMPLOYEE;