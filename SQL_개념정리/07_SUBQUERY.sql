/*****
SUBQUERY(서브 쿼리)
    - 하나의 SQL 문 안에 포함된 또 다른 SQL 문을 의미한다.
    - 메인 쿼리(기존 쿼리) 를 위해 보조 역할을 하는 쿼리문을 가리킨다.
    - SELECT, FROM, WHERE, HAVING 절에서 사용이 가능하다.
    
    * SQL 에서 작성하는 모든 구문은 전부 쿼리라고 부른다.
*****/

-- 서브 쿼리

---> 예시 1번
SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '노옹철';
SELECT EMP_NAME, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE = 'D9';

SELECT EMP_NAME, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '노옹철');

---> 예시 2번
SELECT ROUND(AVG(SALARY)) FROM EMPLOYEE;
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY FROM EMPLOYEE WHERE SALARY >= 3000000;

SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY FROM EMPLOYEE WHERE SALARY >= (SELECT ROUND(AVG(SALARY)) FROM EMPLOYEE);

-- SELECT 절 에서 작성하는 서브 쿼리

---> 예시 3번
SELECT ROUND(AVG(SALARY)) FROM EMPLOYEE;
SELECT JOB_NAME FROM JOB;

SELECT JOB_NAME, (SELECT ROUND(AVG(SALARY)) FROM EMPLOYEE) AS "급여 평균" FROM JOB;
/*
JOB 테이블에서 JOB_NAME 선택

서브 쿼리
    EMPLOYEE 테이블에서 전체 직원의 급여 평균을 계산
    JOB 테이블의 각 행에 대하여, 급여 평균이 계산된 서브 쿼리가 실행되기 때문에
    각 직급에 대하여 동일한 급여 평균 값을 반환한다.

위 코드는 각 직급별 급여 평균이 반환되지 않는 문제점이 있다.
만약, 각 직급별 급여 평균을 반환하고 싶다면
아래 코드처럼 서브 쿼리에 WHERE E.JOB_CODE = J.JOB_CODE 를 넣어주어야 한다.
*/
SELECT JOB_NAME, (SELECT ROUND(AVG(SALARY)) FROM EMPLOYEE E WHERE E.JOB_CODE = J.JOB_CODE) AS "급여 평균" FROM JOB J;