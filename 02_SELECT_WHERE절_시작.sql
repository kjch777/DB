-- 모든 직원 정보 조회
SELECT * FROM employee;

-- 모든 부서 정보 조회
SELECT * FROM department;

-- 모든 직급 정보 조회
SELECT * FROM job;

-- EMPLOYEE TABLE 에서 이름, 입사일 만 조회
SELECT EMP_NAME, hire_date FROM employee;

/*
칼럼 값 산술 연산
    칼럼 값: 행과 열이 교차되는 TABLE 한 칸에 작성된 값
    
    SELECT 문 작성 시, 칼럼명에 산술 연산을 직접 작성하면,
    조회 결과(RESULT SET) 에 연산 결과가 반영되어 조회된다.
*/
-- EMPLOYEE TABLE 에서, 모든 사원의 이름, 급여, 급여 + 100만원 조회해보기
--                        (급여를 100만원 인상 한 조회 결과를 출력해보기)
SELECT emp_name, salary, salary + 1000000 FROM employee;

-- 급여 + 100만원 항목에 AS 를 사용하여 별칭 붙이기
-- AS 는 붙이고 싶은 별칭 앞뒤로 큰 따옴표 " " 를 작성해 주어야 한다.
SELECT emp_name, salary, salary + 1000000 AS "급여_100만원_인상" FROM employee;

-- EMPLOYEE TABLE 에서, 모든 사원의 사번, 이름, 연봉(급여 * 12) 조회해보기
SELECT emp_id, emp_name, salary * 12 AS "연봉" FROM employee;

-- EMPLOYEE TABLE 에서, 모든 사원의 사번, 이름, 상반기 급여(급여 * 6) 조회해보기
SELECT emp_id, emp_name, salary * 6 AS "상반기 급여" FROM employee;

-- 특정 부서에서, 그 부서에 속한 사원의 이름과 이메일만 조회해보기
SELECT DEPT_CODE, emp_name, email FROM employee WHERE dept_code = 'D9';

-- 특정 부서 D1에서, 그 부서에 속한 사원의 이름과 이메일만 조회해보기
select dept_code, emp_name, email from employee where dept_code = 'D1';

-- 특정 부서 D4에서, 그 부서에 속한 사원의 이름, 전화번호, 이메일만 조회해보기
select dept_code, emp_name, phone, email from employee where dept_code = 'D4';
-- WHERE 조건식에서, 조건에 부합하는 값이 없으면 아무것도 출력되지 않는다.

-- IS NULL 을 사용하면, 없는 값(NULL) 도 조회할 수 있다.
select dept_code, emp_name, email, phone from employee where dept_code is null;

-- dept_code 가 null 인 사람의 모든 정보 조회
select * from employee where dept_code is null;