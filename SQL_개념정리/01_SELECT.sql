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

/*
칼럼명 BETWEEN (A) AND (B)
--  칼럼의 값이 A 이상 B 이하면 TRUE

칼럼명 NOT BETWEEN (A) AND (B)
--  칼럼의 값이 A 이상 B 이하면 FALSE
--  칼럼의 값이 A 미만이거나 B 를 초과한다면 TRUE (||와 비슷하다.)
*/

-- 월급이 300만원 이상 500만원 이하라면
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE SALARY BETWEEN 3000000 AND 5000000;

-- 월급이 300만원 미만이거나 500만원을 초과한다면
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE SALARY NOT BETWEEN 3000000 AND 5000000;

/*
WHERE OR 절을 사용하여 값1, 값2, 값3, ... 과 같은 표시를 진행하기도 한다.

칼럼명 IN (값1, 값2, 값3, ...)
-- 칼럼의 값이 괄호 ( ) 안의 값과 일치하면 TRUE

칼럼명 NOT IN (값1, 값2, 값3, ...)
-- 칼럼의 값이 괄호 ( ) 안의 값과 일치하지 않으면 TRUE
*/

-- EMPLOYEE TABLE 에서, 부서 코드가 'D5', 'D6', 'D9' 인 사원의 이름, 부서 코드, 급여 조회해보기
-- (OR 사용)
SELECT EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE WHERE DEPT_CODE = 'D5' OR DEPT_CODE = 'D6' OR DEPT_CODE = 'D9';

-- EMPLOYEE TABLE 에서, 부서 코드가 'D5', 'D6', 'D9' 인 사원의 이름, 부서 코드, 급여 조회해보기
-- (IN 사용)
SELECT EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE WHERE DEPT_CODE IN ('D5', 'D6', 'D9');

-- EMPLOYEE TABLE 에서, 부서 코드가 'D5', 'D6', 'D9' 가 아닌 사원의 이름, 부서 코드, 급여 조회해보기
-- (NOT IN 사용)
SELECT EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE WHERE DEPT_CODE NOT IN ('D5', 'D6', 'D9');

/*
LIKE: 비교하려는 값이 특정한 패턴을 만족시키면 조회할 수 있게 해주는 연산자이다.
    WHERE 칼럼명 LIKE '패턴'
    
    %(포함)
          %A : 앞은 어떤 문자건 포함하고, 마지막은 A 로 끝나는 문자열
            예를 들어 %륨 이라면, 검색창에 륨으로 끝나는 단어를 검색한 것과 비슷하다.
            
         %A% : 시작과 끝 문자는 관계없이, 중간에 A 가 들어있는 문자열
            예를 들어 %로% 라면, 검색창에다 중간에 로가 들어가는 단어를 검색한 것과 비슷하다.
            
          A% : A 로 시작하고, 어떤 문자로 끝나건 상관없는 문자열
            예를 들어 림% 라면, 검색창에 림으로 시작하는 단어를 검색한 것과 비슷하다.
            
- 글자 수
    A_% : A 뒤에 아무거나 한글자만 있는 문자열
        예 : AB, A1, AQ, A가
             가_% : 가로 시작하는 두글자 단어만 검색
            나__% : 나로 시작하는 세글자 단어만 검색
            
    _A% : A 앞에 아무거나 한글자만 있는 문자열
        예 : BA, 1A, QA, 가A
             _가% : 가로 끝나는 두글자 단어만 검색
            __나% : 나로 끝나는 세글자 단어만 검색
*/

-- EMPLOYEE TABLE 에서, 성이 전씨인 사원의 사번, 이름 조회하기
SELECT EMP_ID, EMP_NAME FROM EMPLOYEE WHERE EMP_NAME LIKE '전%';

-- EMPLOYEE TABLE 에서, 이름이 수로 끝나는 사원의 사번, 이름 조회하기
SELECT EMP_ID, EMP_NAME FROM EMPLOYEE WHERE EMP_NAME LIKE '%수';

-- EMPLOYEE TABLE 에서, 이름에 하가 포함되는 사원의 사번, 이름 조회하기
SELECT EMP_ID, EMP_NAME FROM EMPLOYEE WHERE EMP_NAME LIKE '%하%';

-- EMPLOYEE TABLE 에서, 성이 전씨이고, 이름이 돈으로 끝나는 사원의 사번, 이름 조회하기
SELECT EMP_ID, EMP_NAME FROM EMPLOYEE WHERE EMP_NAME LIKE '전%돈';


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

LIKE '___#@%' ESCAPE '#' ◀ # 으로 구분 짓고, @
*/

/*
DUAL(DUmmy tAbLe)
          Dummy: 실제로 사용되지 않은 데이터
    DUMMY TABLE: 실제로 존재하지 않는 테이블
        ▶ 테이블 만들기는 번거롭지만 테스트나 사용은 해봐야겠을 때,
        ▶ 단순히 데이터를 조회만 하거나, 확인만 할 때 사용한다.
*/

-- 존재하지 않는 테이블을 이용하여 현재시간 확인하기
SELECT SYSDATE, SYSTIMESTAMP FROM DUAL;

/*
WHERE 절에서 별칭을 사용하는 것이 불가능할 때
*/

-- 부서 코드 D6 확인
SELECT EMP_NAME, DEPT_CODE AS "부서코드" FROM EMPLOYEE WHERE 부서코드 = 'D6';

ORA-00904: "부서코드": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
6행, 66열에서 오류 발생

-- 부서코드 라는 칼럼명이 존재하지 않는다.
-- 별칭은 사용자가 식별하기 쉽게 작성하는 것일뿐,
-- WHERE 절에서 조회를 할 때 사용할 순 없다.

/*
그러나, ORDER BY 절에서는 별칭을 사용한 조회가 가능하다.
*/
SELECT EMP_NAME, SALARY * 12 AS "연봉" FROM EMPLOYEE ORDER BY 연봉 DESC;
-- ORDER BY 는, 칼럼에서 무언가를 찾아오는 것이 아니라, 
-- 이미 나타난 정보를 어떻게 정렬할지 (오름차순 또는 내림차순) 선택만 하는 것이기 때문에
-- 별칭을 사용해서 조회할 수도 있는 것이다.

-- EMPLOYEE TABLE 에서, 이름, 부서코드, 급여를 각각 부서코드는 오름차순으로, 급여는 내림차순으로 조회하기
-- 정렬은 ASC 가 기본이다.
SELECT EMP_NAME AS "이름", DEPT_CODE AS "부서코드", SALARY AS "급여" FROM EMPLOYEE ORDER BY DEPT_CODE, 급여 DESC;
-- 부서코드 먼저 오름차순 정렬되고, 그 안에서 급여가 내림차순으로 정렬된 것이다.

-- EMPLOYEE TABLE 에서, 이름, 부서코드, 직급코드를 각각 부서코드는 오름차순, 직급코드는 내림차순, 이름은 오름차순으로 , 를 사용하여 조회하기
SELECT EMP_NAME AS "이름", DEPT_CODE AS "부서코드", JOB_CODE AS "직급코드" FROM EMPLOYEE ORDER BY 부서코드 ASC, 직급코드 DESC, 이름 ASC;
-- 부서코드 먼저 오름차순 정렬되고, 그 안에서 직급코드 내림차순, 또 그 안에서 이름이 오름차순으로 정렬된 것이다.

/*
|| 연결 연산자
    문자열을 이어쓸 때, + 나 , 로 연결하지 않고 || 를 사용하여 연결한다.
*/
SELECT EMP_NAME || '의 월급은 ' || SALARY || '원 입니다.' FROM EMPLOYEE;

-- 직급코드가 J5 인 사원의 명수 조회하기
-- J5 몇 명?
select count(*) as "J5 COUNT" from employee where job_code = 'J5';

-- 사원의 이름과 이메일을 결합하여 조회하기
select emp_name || '(' || email || ')' from employee;

select emp_name || ' - ' || phone from employee;

select emp_id || ' - ' || job_code from employee;

select emp_name || ' : ' || salary as "이름 : 급여" from employee;

select emp_name || ' - ' || salary * 12 as "이름 - 연봉" from employee;