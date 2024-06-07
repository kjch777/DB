SELECT DEPT_CODE, 
SUM(SALARY) AS "합계", 
FLOOR(AVG(SALARY)) AS "평균", 
COUNT(*) AS "인원 수"
FROM EMPLOYEE 
WHERE SALARY > 2800000
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE ASC;
-- invalid identifier: 존재하는 칼럼이 아니기 때문에 발생하는 오류이다.

/*
ROWNUM
    쿼리의 결과 집합에서, 각 행에 1 부터 시작하는 번호를 순차적으로 부여한다.
    결과 집합의 크기를 제한한다.
*/

-- 예제 1번: 상위 5개의 행만 선택하기
SELECT ROWNUM, EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE ROWNUM <= 5;

-- 예제 2번: 정렬된 결과 집합에서, 상위 5개의 행만 선택하기
SELECT ROWNUM, EMP_ID, EMP_NAME, SALARY
FROM (SELECT EMP_ID, EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY DESC)
WHERE ROWNUM <= 5;

---> 주의 사항
-- 상위 5개의 행을 제외한 상위 6 ~ 10 개 행을 선택할 수 있을까?
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE ROWNUM > 5;
-- ROWNUM 은 무조건 1부터 시작하기 때문에, ROWNUM > 5 (5 이후) 는 애초에 불가능한 조건이다.

SELECT ROWNUM, EMP_NAME, SALARY
FROM (SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY DESC)
WHERE ROWNUM <= 3;

SELECT EMP_NAME, SALARY
FROM EMPLOYEE
ORDER BY 2 DESC;

/*
NVL: NULL 로 되어있는 칼럼의 값을, 지정한 숫자 또는 문자로 변경하여 반환하는 것이다.

사용법
    NVL(칼럼명, 칼럼값이 NULL일때 변경할값)
    
NVL2: NULL 이 아닌 칼럼의 값을, 지정한 숫자 또는 문자로 변경하여 반환하는 것이다.

사용법
    NVL2(칼럼명, 칼럼값이 NULL이 아닐때 변경할값, 칼럼값이 NULL일때 변경할값)
*/

SELECT EMP_ID, EMP_NAME, NVL(PHONE, '없음') AS "전화번호"
FROM EMPLOYEE;

SELECT EMP_ID, EMP_NAME, NVL(PHONE, '없음') AS "전화번호"
FROM EMPLOYEE;

SELECT EMP_NAME, SALARY, BONUS, NVL((SALARY * BONUS), 0) AS "인센티브"
FROM EMPLOYEE;

SELECT EMP_ID, EMP_NAME, NVL2(PHONE, '010********', '없음') AS "전화번호"
FROM EMPLOYEE;