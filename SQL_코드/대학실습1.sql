SELECT DEPARTMENT_NAME AS "학과 이름", CATEGORY AS "계열" FROM TB_DEPARTMENT;

SELECT DEPARTMENT_NAME || '의 정원은 ' || CAPACITY || ' 명 입니다.'
FROM TB_DEPARTMENT;

SELECT *
FROM TB_STUDENT
WHERE SUBSTR (STUDENT_SSN, 8, 1) = 2
AND ABSENCE_YN = 'Y'
AND DEPARTMENT_NO = 001;

SELECT STUDENT_NAME, STUDENT_NO
FROM TB_STUDENT
WHERE STUDENT_NO IN ('A513079', 'A513090', 'A513091', 'A513110', 'A513119')
ORDER BY 1 DESC;

SELECT DEPARTMENT_NAME AS "학과 이름", CATEGORY AS "계열"
FROM TB_DEPARTMENT
WHERE CAPACITY BETWEEN 20 AND 30;

SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;

SELECT CLASS_NAME, PREATTENDING_CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

SELECT DISTINCT CATEGORY
FROM TB_DEPARTMENT
ORDER BY 1;

SELECT STUDENT_NO AS "학번", STUDENT_NAME AS "이름", TO_CHAR(ENTRANCE_DATE, 'YYYY-MM-DD') AS "입학년도"
FROM TB_STUDENT
WHERE DEPARTMENT_NO = 002
ORDER BY ENTRANCE_DATE;

SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE PROFESSOR_NAME NOT LIKE '___';

SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO NOT LIKE 'A%';

SELECT STUDENT_NO, ROUND(AVG(POINT)) AS "학점 평균"
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178'
GROUP BY STUDENT_NO;
-- 소수점 자리수 지정해서 표기하기
---> 소수점 한자리만 표기하려면 
----> ROUND(AVG(칼럼명),1)

SELECT COUNT(*) AS "학생 수"
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL;


SELECT SUBSTR(TERM_NO, 1, 4) AS "연도", ROUND(AVG(POINT),1) AS "연도 별 평점"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO, 1, 4)
ORDER BY 1;

SELECT STUDENT_NAME, COUNT(*)
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(*) > 1
ORDER BY 1;