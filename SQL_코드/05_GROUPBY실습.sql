/*HAVING 절 실습*/

SELECT DEPT_CODE AS "부서코드", SUM(SALARY) AS "급여합계" FROM EMPLOYEE WHERE SUM(SALARY) >= 5000000 GROUP BY DEPT_CODE ORDER BY 급여합계 DESC;
/*
ORA-00934: group function is not allowed here
00934. 00000 -  "group function is not allowed here"

▶ WHERE 절에서는, 집계 함수(SUM, AVG, MAX, MIN, COUNT 등) 를 사용할 수 없다.
  집계 함수(SUM, AVG, MAX, MIN, COUNT 등) 는, 
  HAVING 이나 WHERE 또는 GROUP BY 를 다른 방식으로 사용하여 작성한다.
*/

SELECT DEPT_CODE AS "부서코드", MAX(SALARY) AS "최대급여" FROM EMPLOYEE GROUP BY DEPT_CODE;
SELECT DEPT_CODE AS "부서코드", MIN(SALARY) AS "최소급여" FROM EMPLOYEE GROUP BY DEPT_CODE ORDER BY 최소급여;
-- ORDER BY 별칭 형식으로 작성할 때, 별칭 사이에 띄어쓰기가 있을 경우, 별칭 앞/뒤를 큰 따옴표 " " 로 묶어주어야 한다.

SELECT DEPT_CODE AS "부서코드", SUM(BONUS) AS "총 보너스율" FROM EMPLOYEE GROUP BY DEPT_CODE ORDER BY "총 보너스율" DESC;
-- ORDER BY 별칭 형식으로 작성할 때, 별칭 사이에 띄어쓰기가 있을 경우, 별칭 앞/뒤를 큰 따옴표 " " 로 묶어주어야 한다.

SELECT JOB_CODE AS "직급코드", COUNT(*) AS "총 사원수" FROM EMPLOYEE GROUP BY JOB_CODE ORDER BY "총 사원수" DESC;
SELECT SAL_LEVEL AS "급여등급", AVG(BONUS) AS "평균 보너스율" FROM EMPLOYEE GROUP BY SAL_LEVEL ORDER BY "평균 보너스율" DESC;
SELECT DEPT_CODE AS "부서코드", MIN(HIRE_DATE) AS "최초 입사일자" FROM EMPLOYEE GROUP BY DEPT_CODE ORDER BY "최초 입사일자";
SELECT DEPT_CODE AS "부서코드", COUNT(*) AS "급여기준 이상" FROM EMPLOYEE WHERE SALARY >= 3000000 GROUP BY DEPT_CODE;
/*
오타를 빠르게 찾는 방법
    1. 문제가 되는 구문 복사
    2. CTRL + F 로 찾기
*/
SELECT DEPT_CODE AS "부서코드", COUNT(*) AS "보너스지급 사원수" FROM EMPLOYEE WHERE BONUS > 0 GROUP BY DEPT_CODE ORDER BY "보너스지급 사원수" DESC;
SELECT JOB_CODE AS "직급코드", COUNT(*) AS "사원수" FROM EMPLOYEE WHERE SALARY <= 4000000 GROUP BY JOB_CODE ORDER BY 사원수 DESC;
SELECT DEPT_CODE AS "부서코드", AVG(SALARY) AS "평균급여" FROM EMPLOYEE WHERE SALARY >= 5000000 GROUP BY DEPT_CODE ORDER BY 평균급여 DESC;