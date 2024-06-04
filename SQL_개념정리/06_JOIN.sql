/*
JOIN
 - 하나 이상의 TABLE 에서 데이터를 조회하기 위해 사용한다.
 - 수행 결과는 하나의 RESULT SET 으로 산출된다.
 - 관계형 데이터 베이스에서, SQL 을 이용하여 테이블 간 관계를 맺는 방법이다.
 
 - 관계형 데이터 베이스는 각각의 테이블에 최소한의 데이터만 담고 있기 때문에,
   원하는 정보를 조회하려면 한 개 이상의 테이블에서 데이터를 읽어와야 하는 경우가 많다.
   이 때, 테이블 간 관계를 맺기 위한 연결고리가 필요한데,
   두 개 이상의 테이블에서 서로 같은 데이터를 저장하는 칼럼이 연결고리가 된다.
   (칼럼명은 서로 달라도 되지만, 칼럼값이 같아야 한다.)
   
등가 조인 
 - 내부 조인(INNER JOIN), JOIN USING ON, 자연 조인(NATURAL JOIN)

포괄 조인
 - 왼쪽 외부 조인(LEFT OUTER), 오른쪽 외부 조인(RIGHT OUTER), 전체 외부 조인(FULL OUTER)
 
자체 조인(비 등가 조인)
 - JOIN ON
 
교차 조인
 - CROSS JOIN
*/

-- 서로 다른 테이블에서 데이터를 조회할 경우, 둘로 나눠서 조회한다.

SELECT EMP_ID, EMP_NAME, DEPT_CODE FROM EMPLOYEE;
-- DEPT_CODE: D9

SELECT DEPT_ID, DEPT_TITLE FROM DEPARTMENT;
-- DEPT_ID: D9

-- JOIN 을 사용하여 EMPLOYEE 테이블과 DEPARTMENT 테이블을 엮어, 한 번에 조회하기
SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_ID, DEPT_TITLE FROM EMPLOYEE JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
/*
EMPLOYEE 테이블과 DEPARTMENT 테이블을 JOIN 하여,
EMP_ID, EMP_NAME, DEPT_CODE, DEPT_ID, DEPT_TITLE 을 조회하는 쿼리이다.

JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

JOIN 은, 단순하게 TABLE 2개를 붙이는 것이 아닌,
        기준으로 삼은 TABLE 의 한 칼럼을 지정하여,
        다른 TABLE 의 한 칼럼과 같은 행을 찾아
        기준 TABLE 옆에 한 행씩 붙여나가는 것이다.
*/

-- 1. 내부 조인 INNER JOIN
---> 연결되는 칼럼의 값이 일치하는 행들만 JOIN 된다.
----> 일치하는 값이 없는 행은 JOIN 에서 제외된다.

-- 작성 방법은 크게 2가지로 나뉜다.

---> ANSI 표준 구문
----> 구문 기준을 정할 때, 정의되는 기준이다.
-----> 가장 유명한 표준으로는 ASCII 코드가 있다.
-- ANSI 표준 구문 예시
SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_ID, DEPT_TITLE FROM EMPLOYEE JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

---> ORACLE 표준 구문
----> FROM 절에 , 로 구분하여, 합칠 TABLE 명을 기술한다
-----> WHERE 절에다 합치기에 사용 할 칼럼명을 명시해 주어야 한다.
-- ORCALE 표준 구문 예시
SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_ID, DEPT_TITLE FROM EMPLOYEE,DEPARTMENT WHERE DEPT_CODE = DEPT_ID;

-- 1) 연결에 사용할 두 칼럼명이 서로 다른 경우 ▶ JOIN ON 을 사용
---> ORACLE 에서는 JOIN ON 을 사용하지 않고,
----> WHERE 절에 = 을 사용해 주면 된다.

-- 합치기 전, 칼럼 조회해보기
SELECT * FROM DEPARTMENT;
SELECT * FROM LOCATION;

-- ANSI 방식
SELECT DEPT_TITLE AS "부서명", LOCAL_NAME AS "지역명" FROM DEPARTMENT JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE);

-- ORACLE 방식
SELECT DEPT_TITLE AS "부서명", LOCAL_NAME AS "지역명" FROM DEPARTMENT, LOCATION WHERE LOCATION_ID = LOCAL_CODE;

/*
연결에 사용할 칼럼명이 서로 다른 경우 ▶ JOIN ON
연결에 사용할 칼럼명이 서로 같은 경우 ▶ JOIN USING

-- 2) 연결에 사용할 칼럼명이 서로 같은 경우 ▶ JOIN USING 을 사용한다.
    사용 방법 
        FROM 테이블명
        JOIN 테이블명 USING (칼럼명)
*/

-- ANSI 표준 형식
-- 연결에 사용할 칼럼명이 서로 같은 경우 ▶ USING(칼럼명) 을 사용한다.
SELECT EMP_NAME, EMP_ID, JOB_NAME, JOB_CODE FROM EMPLOYEE JOIN JOB USING (JOB_CODE);

-- ORACLE 형식
SELECT E.EMP_NAME, E.EMP_ID, J.JOB_NAME, J.JOB_CODE FROM EMPLOYEE E, JOB J WHERE E.JOB_CODE = J.JOB_CODE;

/***** 
NATURAL JOIN(자연 조인) 
    동일한 TYPE 과 이름을 가진 칼럼이 있는 TABLE 간의 JOIN 을 간단히 표현한 방법
    반드시 두 테이블 간 동일한 칼럼명, 동일한 타입을 가진 칼럼이 필요하며,
    만약 그렇지 않을 경우에는 교차 조인이 된다.
    
    EMPLOYEE.JOB_CODE(CHAR(2))
         JOB.JOB_CODE(CHAR(2))
            ▶ 칼럼명, 자료형이 모두 일치하는 경우에만 자연 조인 대상이 된다.
    
    SELECT 칼럼명1, 칼럼명2, 칼럼명3, ...
    FROM 테이블명
    NATURAL JOIN 테이블명
            
JOIN 에 별칭을 설정하여 TABLE 표현하기
    JOIN 과 FROM 에서 TABLE 을 설정할 때,
    쿼리를 좀 더 간결하고 읽기 쉽게 만드는 방법이다.
    TABLE 을 여러개 참조할 때 유용하다.
    
사용 방법
    1) SELECT TABLE명1.칼럼명, TABLE명2.칼럼명
       FROM TABLE명1, TABLE2명
       WHERE TABLE명1.칼럼명 = TABLE명2.칼럼명
       
    2) SELECT A.칼럼명, B.칼럼명
       FROM TABLE명 A, TABLE명 B
       WHERE A.칼럼명 = B.칼럼명
*****/

-- ***** OUTER JOIN 외부 조인 ***** --
/*
두 TABLE 에서 지정한 칼럼 값이 서로 일치하지 않는 행도 JOIN 에 포함시킨다.

OUTER JOIN 과 비교해볼 INNER JOIN 쿼리문 작성해보기
*/
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
/*INNER*/JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- 1) LEFT OUTER JOIN
---> 합치기에 사용한 두 테이블 중, 왼쪽 편에 작성된 테이블의 칼럼 수를 기준으로 JOIN 한다.

-- ANSI 표준
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE 
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
----> JOIN 구문을 기준으로, 왼쪽 편에 작성된 테이블의 모든 행이
-----> 최종 결과(RESULT SET) 에 포함되도록 하는 JOIN 이다.

-- ORACLE 표준
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT 
WHERE DEPT_CODE = DEPT_ID(+);
----> DEPT_CODE 와 DEPT_ID 값이 서로 일치하지 않더라도,
-----> 왼쪽 편에 있는 칼럼의 갯수에 맞게 표시를 해준 것이다.(NULL 값이라도 넣어 수를 맞춘 것이다.)


-- 2) RIGHT OUTER JOIN
---> 합치기에 사용한 두 테이블 중, 오른쪽 편에 작성된 테이블의 칼럼 수를 기준으로 JOIN 한다.

-- ANSI 표준
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE 
RIGHT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
----> JOIN 구문을 기준으로, 오른쪽 편에 작성된 테이블의 모든 행이
-----> 최종 결과(RESULT SET) 에 포함되도록 하는 JOIN 이다.

-- ORACLE 표준
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT 
WHERE DEPT_CODE(+) = DEPT_ID;
----> DEPT_CODE 와 DEPT_ID 값이 서로 일치하지 않더라도,
-----> 오른쪽 편에 있는 칼럼의 갯수에 맞게 표시를 해준 것이다.(NULL 값이라도 넣어 수를 맞춘 것이다.)


-- 3) FULL OUTER JOIN
---> 합치기에 사용한 두 테이블이 가진 모든 행을 결과에 포함시킨다.
----> ORACLE 에서는 FULL OUTER JOIN 구문을 사용할 수 없다.

-- ANSI 표준
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE 
FULL JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
----> JOIN 구문을 기준으로, 양쪽 편에 작성된 테이블의 모든 행이
-----> 최종 결과(RESULT SET) 에 포함되도록 하는 JOIN 이다.
/*
이건 사용 가능하다.
*/

-- ORACLE 표준
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT 
WHERE DEPT_CODE(+) = DEPT_ID(+);
----> DEPT_CODE 와 DEPT_ID 값이 서로 일치하지 않더라도,
-----> 양쪽 편에 있는 칼럼의 갯수에 맞게 표시를 해준 것이다.(NULL 값이라도 넣어 수를 맞춘 것이다.)
/*
ORA-01468: a predicate may reference only one outer-joined table
01468. 00000 -  "a predicate may reference only one outer-joined table"
*/