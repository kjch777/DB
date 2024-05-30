/*
SELECT WHERE 절
    WHERE 은, 조건을 걸어 선택한 조건에 해당하는 행만 볼 수 있도록 설정할 수 있다.
    WHERE 원하는칼럼 = 원하는 칼럼에서 해당하는 조건;
    
    만약, NULL 값(아무것도 없는 값) 을 가진 정보만 조회하고 싶다면
    WHERE 원하는칼럼 IS NULL;
    
    만약, NULL 이 아닌 값을 가진 정보만 조회하고 싶다면
    WHERE 원하는칼럼 IS NOT NULL;
    
    ~ 이상이거나 ~ 이하일 때는 >= <=  > < 를 사용한다.(미만, 초과 포함)
    WHERE 원하는칼럼 >= 원하는값;
    
    OO 와 OO 사이만 조회하고 싶다면
    BETWEEN OO AND OO;
    
        예제
        WHERE 원하는칼럼 BETWEEN 사당 AND 의정부;
        
-- 여기서부터는 WHERE 절을 사용하지 않는다.--
    
    ORDER BY
        오름차순: ASC
        내림차순: DESC
    
*/

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

-- 보너스가 0.2 이상인 사원의 이름과 보너스 조회
select emp_name, bonus from employee where bonus >= 0.2;

-- 급여가 3백만원 ~ 4백만원 사이인 사원의 이름과 급여 조회
select emp_name, salary from employee where salary between 3000000 and 4000000;

-- 급여가 높은 순서대로 사원의 이름과 급여 조회
-- 숫자 체계에서의 오름차순은 1부터 시작한다.
-- 숫자 체계에서의 내림차순은 9부터 시작한다.
select emp_name, salary from employee order by salary desc;

-- 글자 체계에서의 오름차순은 ㄱ부터 시작한다.(ㄱ▶ㅎ A▶Z)
-- 글자 체계에서의 내림차순은 ㅎ부터 시작한다.(ㅎ▶ㄱ Z▶A)
select emp_name from employee order by emp_name asc;

select emp_id, emp_name, salary, dept_code from employee where salary > 3000000;

-- 연봉이 5천만원 이하인 사원
select emp_id, emp_name, salary * 12 as "연봉" from employee where salary * 12 <= 50000000;

-- 부서 코드가 D9 이 아닌 사원
select emp_name, dept_code, phone from employee where dept_code != 'D9';

-- 부서 코드가 D6 면서, 급여가 3백만원을 초과하는 사원
select emp_name, dept_code, salary from employee where dept_code = 'D6' and salary > 3000000;

select emp_name, salary, dept_code, job_code from employee where dept_code = 'D6' and job_code = 'J3';


-- 날짜 범위 비교해보기
select emp_name, hire_date as "입사일" from employee where hire_date between to_date ('2000-01-01', 'yyyy-mm-dd') and to_date('2000-12-31', 'yyyy-mm-dd');

select emp_name, hire_date as "입사일" from employee where hire_date > to_date ('2000', 'yyyy');

-- 특정 전화번호 패턴을 가진 사원의 이름과 전화번호 조회해보기
select emp_name, phone from employee where phone like '010%';

-- 이메일 아이디의 글자 수가, @ 앞이 5글자인 사원의 이름, 이메일 조회해보기
select emp_name, email from employee where email like '_____@%';

-- 이메일 아이디의 글자 수가, _ 앞이 3글자인 사원의 사번, 이름, 이메일 조회해보기
select emp_id, emp_name, email from employee where email like '___%';
-- ▲ 원하는 결과가 나오지 않는다. 따라서 ▼


-- ESCAPE 옵션: LIKE 의 의미를 벗어나 단순 문자열로 인식하는 것
--  ▶ 적용 범위: 특수문자 뒤 한글자
select emp_id, emp_name, email from employee where email like '___#_%' escape '#';
/*
___ 3개 의미

ESCAPE: '#' 으로 구분지을 것이다. 이 때, # 은 다른 특수문자나 영어, 숫자로 대체할 수 있다.
___LIKE: 사용하는 3글자만 찾으라는 의미로 구분짓는것
_%: _ 로 된 글자 찾기

___#_% ___@%
_ 를 @ 처럼 사용하길 원했기 때문에 중간에 # 을 넣어준 것이다.

___#_% __돈%
_ 를 돈 처럼 사용하길 원했기 때문에 중간에 # 을 넣어준 것이다.
*/

-- EMPLOYEE TABLE
select emp_name as "이름", salary as "급여" from employee;
select dept_code as "부서코드", job_code as "직무코드" from employee;
select email as "이메일", phone as "전화번호" from employee;
select emp_id as "사원번호", hire_date as "입사일" from employee;
select emp_name as "이름", dept_code as "부서", salary as "급여" from employee;
select distinct dept_code from employee;
select distinct job_code from employee;
select distinct sal_level from employee;
select distinct manager_id from employee;
select distinct emp_name from employee;

-- OR 연산자
select emp_name, salary from employee where salary > 2000000 or dept_code = 'D5';

select emp_name, salary from employee where dept_code = 'D6' or job_code = 'J3';

select emp_name, sal_level, bonus from employee where sal_level = 'S5' or bonus = 0.2;

select emp_name, hire_date from employee where ent_yn = 'N' or hire_date > to_date('2000', 'yyyy');