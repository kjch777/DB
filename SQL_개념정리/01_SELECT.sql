/*
SELECT(조회)
지정된 TABLE 에서, 원하는 데이터만 선택하여 조회하는 SQL

작성된 구문에 맞는 행, 열 데이터가 조회된다.
    ▶ 조회된 결과(행의 집합) == RESULT SET(결과 집합)
    
RESULT SET 은 0행 이상 포함될 수 있다.
    ▶ 조건에 맞는 행이 없을 수도 있다는 것이다.
*/

/*
[SELECT 작성법 1(기초)]
    SELECT 칼럼명1, 칼럼명2, ... FROM 테이블명;
        ▶ 지정된 TABLE 의 모든 행에서, 칼럼명이 일치하는 칼럼값 조회
        
TABLE 의 모든 행(모든 칼럼) 을 한 번에 조회하는 방법
*(asterisk): 전부 포함하고자 할 때 사용
*/

-- EMPLOYEE TABLE 에서, 모든 행의 사번(EMP_ID), 이름(EMP_NAME), 급여(SALARY) 조회하기
SELECT EMP_ID, EMP_NAME, SALARY FROM EMPLOYEE;

-- EMPLOYEE TABLE 에서, 모든 행(모든 칼럼) 조회하기
SELECT * FROM EMPLOYEE;

/*
칼럼 값 산술 연산
    칼럼값: 행과 열이 교차되는 TABLE 한 칸에 작성된 값
    SELECT 절에 산술 연산을 직접 작성하면, 조회 결과(RESULT SET) 에 연산 결과가 반영되어 조회된다.
*/

-- EMPLOYEE TABLE 에서, 모든 사원의 이름, 급여, 급여 + 100만원 조회하기
SELECT EMP_NAME, SALARY, SALARY + 1000000 FROM EMPLOYEE;

-- EMPLOYEE TABLE 에서, 모든 사원의 이름, 연봉(급여 * 12) 조회하기
SELECT EMP_NAME, SALARY * 12 AS "연봉" FROM EMPLOYEE;

/*
SYSDATE.SYSTIMESTAMP
    (시스템이 나타내고 있는) 현재 시간
    
    SYSDATE: 현재 시간(년, 월, 일, 시, 분, 초) 조회
    SYSTIMESTAMP: 현재 시간(년, 월, 일, 시, 분, 초, MS + 지역(local)) 조회
    
    회원가입 시, DB 에 들어오는 현재 시간을 기록할 때 생성한다.
    컴퓨터에서 체크하는 시간을 기록할 때 사용한다.
*/

/*
날짜 사용하기
    DB 에 저장된 날짜들 중, 특정한 기간만 조회하거나, 변경하길 원할 때 사용한다.
    
    TO_DATE('문자열', '패턴')
    
    예를 들어, 2024-05-01 자 이후에 회원가입 한 회원을 조회하려면
        TO_DATE('2024-05-01', 'YYYY-MM-DD')
*/

/*
칼럼명에 별칭 지정하기
    별칭 지정 방법
        1. 칼럼명 AS "별칭" ◀ 문자, 띄어쓰기, 특수문자 모두 사용할 수 있다.
        2.    칼럼명 "별칭" ◀ 문자, 띄어쓰기, 특수문자 모두 사용할 수 있다.
        3. 칼럼명 별칭      ◀ 문자만 가능하다.
        4. 칼럼명 AS 별칭   ◀ 문자만 가능하다.
*/

-- EMPLOYEE TABLE 에서, 이름과 이메일 정보를 조회하는데, 이메일에 @ 포함이라는 별칭 설정해주기
--  1. 칼럼명 AS "별칭"
    SELECT EMP_NAME, EMAIL AS "이메일 @ 포함" FROM EMPLOYEE;
    
-- 2. 칼럼명 "별칭"
    SELECT EMP_NAME, EMAIL "이메일 @ 포함" FROM EMPLOYEE;
    
-- 3. 칼럼명 별칭
--  띄어쓰기와 특수문자 사용불가
    SELECT EMP_NAME, EMAIL 이메일포함 FROM EMPLOYEE;
    
-- 4. 칼럼명 AS 별칭
--  띄어쓰기와 특수문자 사용불가
    SELECT EMP_NAME, EMAIL AS 이메일포함 FROM EMPLOYEE;
    
/*
DISTINCT(별개의, 전혀 다른)
    ▶ 중복 제거
    
    조회 결과 집합(RESULT SET) 에서, 지정된 칼럼의 값이 중복되는 경우,
    중복되는 값을 한 번만 표시할 때 사용한다.
    
    사용 방법
    SELECT DISTINCT 중복제거할칼럼명(칼럼갯수제한x) FROM 테이블명
*/

-- EMPLOYEE TABLE 에서, 모든 사원의 부서 코드 조회하기
SELECT DEPT_CODE FROM EMPLOYEE;

-- EMPLOYEE TABLE 에서, 사원이 존재하는 부서 코드만 조회하기
SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;
--  ▶ D3, D4, D7 부서는 사원이 없기 때문에 조회되지 않는다.

-- EMPLOYEE TABLE 에 존재하는 직급 코드의 종류 조회하기
SELECT DISTINCT JOB_CODE AS "직급 코드" FROM EMPLOYEE;

/*
WHERE 절
    TABLE 에서, 조건을 충족하는 행만 조회할 때 사용한다.
    WHERE 절에는 조건식(TRUE/FALSE) 만 작성해야 한다.
    
    비교 연산자: >,   <, >=,    <=,  =(같다),   !=,  <>(같지 않다)
    논리 연산자: AND, OR,  NOT
    
    작성 방법
        SELECT 칼럼명1, 칼럼명2, ... FROM 테이블명 WHERE 조건식;
            ▶ 지정된 TABLE 의 모든 행에서, 칼럼명이 일치하는 칼럼값 조회
*/

-- EMPLOYEE TABLE 에서, 급여가 300만원을 초과하는 사원의 이름, 급여, 부서코드 조회하기
SELECT EMP_NAME, SALARY, DEPT_CODE FROM EMPLOYEE WHERE SALARY > 3000000;

-- EMPLOYEE TABLE 에서, D9 부서에 해당하는 사원의 이름 조회하기
SELECT EMP_NAME FROM EMPLOYEE WHERE DEPT_CODE = 'D9';

-- EMPLOYEE TABLE 에서, D9 부서에 해당하지 않는 사원의 이름 조회하기
SELECT EMP_NAME FROM EMPLOYEE WHERE DEPT_CODE != 'D9';

/*
IS NULL, NOT NULL

칼럼 값이 존재하지 않는 경우
IS NULL;

칼럼 값이 존재하는 경우
IS NOT NULL;
*/

-- EMPLOYEE TABLE 에서, DEPT_CODE 가 없는 사원의 모든 정보 조회하기
SELECT * FROM EMPLOYEE WHERE DEPT_CODE IS NULL;

-- EMPLOYEE TABLE 에서, DEPT_CODE 가 있는 사원의 모든 정보 조회하기
SELECT * FROM EMPLOYEE WHERE DEPT_CODE IS NOT NULL;