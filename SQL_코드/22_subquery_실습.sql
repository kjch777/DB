/*****
SUBQUERY 실습 문제
*****/

SELECT EMP_ID, EMP_NAME, PHONE, HIRE_DATE, DEPT_TITLE
FROM EMPLOYEE 
JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
WHERE DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '전지연')
AND EMP_NAME != '전지연';


SELECT EMP_ID, EMP_NAME, PHONE, SALARY, JOB_NAME, HIRE_DATE
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE HIRE_DATE > TO_DATE('2000', 'YYYY')
AND SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE WHERE HIRE_DATE > TO_DATE('2000', 'YYYY'));


SELECT EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
JOIN JOB USING(JOB_CODE)
WHERE DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '노옹철')
AND JOB_CODE = (SELECT JOB_CODE FROM EMPLOYEE WHERE EMP_NAME = '노옹철')
AND EMP_NAME != '노옹철';


SELECT E1.EMP_ID, E1.EMP_NAME, E1.DEPT_CODE, E1.JOB_CODE, E1.HIRE_DATE
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 ON E1.DEPT_CODE = E2.DEPT_CODE
AND E1.JOB_CODE = E2.JOB_CODE
WHERE TO_CHAR(E1.HIRE_DATE, 'YYYY') = '2000'
AND E1.EMP_ID != E2.EMP_ID;
-- 204	유재식	D6	J3	00/12/29
-- 먼저 2000년에 입사한 직원들을 찾고, 그 다음 앞에서 찾은 직원들과 동일한 부서/직급을 가진 다른 직원을 찾은 것이다.
-- 2000년에 입사한 직원 E1과 동일한 부서/직급을 가진 다른 직원 E2
-- 결과적으로 2000년에 입사한 직원을 찾은 것

SELECT E2.EMP_ID, E2.EMP_NAME, E2.DEPT_CODE, E2.JOB_CODE, E2.HIRE_DATE
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 ON E1.DEPT_CODE = E2.DEPT_CODE
AND E1.JOB_CODE = E2.JOB_CODE
WHERE TO_CHAR(E1.HIRE_DATE, 'YYYY') = '2000'
AND E1.EMP_ID != E2.EMP_ID;
-- 205	정중하	D6	J3	99/09/09
-- E1이 2000년에 입사한 직원을 기준으로 동일한 부서/직급을 가진 다른 직원 E2를 찾음
-- E2는 2000년에 입사한 직원과 동일한 부서/직급을 가진 다른 직원

-- 유재식과 정중하 둘 다 출력되게 만들기
SELECT E2.EMP_ID, E2.EMP_NAME, E2.DEPT_CODE, E2.JOB_CODE, E2.HIRE_DATE
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 ON E1.DEPT_CODE = E2.DEPT_CODE
AND E1.JOB_CODE = E2.JOB_CODE
WHERE TO_CHAR(E1.HIRE_DATE, 'YYYY') = '2000'
AND E2.HIRE_DATE IS NOT NULL;


-- 5. 77년생 여자 사원과 동일한 부서이면서 동일한 사수를 가지고 있는 사원을 조회하시오
-- 사번, 이름, 부서코드, 사수번호, 주민번호, 고용일
SELECT E2.EMP_ID, E2.EMP_NAME, E2.DEPT_CODE, E2.MANAGER_ID, E2.EMP_NO, E2.HIRE_DATE
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 ON E1.DEPT_CODE = E2.DEPT_CODE
AND E1.MANAGER_ID = E2.MANAGER_ID
WHERE E2.EMP_NO LIKE '77%'
AND SUBSTR(E2.EMP_NO, 8, 1) = '2';

-- 6. 부서별 입사일이 가장 빠른 사원의
-- 사번, 이름, 부서명(NULL이면 '소속없음'), 직급명, 입사일을 조회하고
-- 입사일이 빠른 순으로 조회하시오
-- 단, 퇴사한 직원은 제외하고 조회..

-- 7. 직급별 나이가 가장 어린 직원의
-- 사번, 이름, 직급명, 나이, 보너스 포함 연봉을 조회하고
-- 나이순으로 내림차순 정렬하세요
-- 단 연봉은 \124,800,000 으로 출력되게 하세요. (\ : 원 단위 기호)