/*
함수
    칼럼 값이나 지정된 값을 읽어 연산한 결과를 반환하는 것
    
        단일 행 함수: n개의 행의 칼럼 값을 전달하여, n개의 결과를 반환한다.
           그룹 함수: n개의 행의 칼럼 값을 전달하여, 1개의 결과를 반환한다.
           
    함수는 SELECT 절, WHERE 절, ORDER BY 절, GROUP BY 절, HAVING 절에서 사용 가능하다.
    
    SELECT 절: 찾는 기준이 아닌, 눈으로 볼 수 있는 총합, 계산 결과 등에 대한 것을
              눈으로 볼 때 기준으로 정리해놓은 칼럼
              ▶ 정리해서 보여주는 기능
              
    WHERE 절: 찾는 조건이 되는 행을 작성해 준다. 
             길이, 크기 등의 조건을 설정하고, 그 조건에 부합하는 결과만 볼 수 있도록 설정할 수 있다.
             ▶ 내가 원하는 조건에 대한 결과값만 보고싶을 때 사용한다.
*/

/*****  단일 행 함수 *****/

-- 문자열 관련 함수

-- LENGTH(문자열 | 칼럼명): 문자열의 길이 반환
SELECT
    'HELLO WORLD',
    length('HELLO WORLD')
FROM
    dual;

-- 이메일 길이를 기준으로 오름차순 정렬
SELECT
    emp_name,
    email,
    length(email) AS "이메일 길이"
FROM
    employee
WHERE
    length(email) <= 12
ORDER BY
    "이메일 길이";
    
-- INSTR(문자열 | 칼럼명, '찾을 문자열'[, 찾는 것을 시작할 위치[, 순번 ] ] )

-- 찾는 것을 시작할 위치부터, 지정된 순번째? 찾은 문자열의 시작 위치를 반환한다.

-- LIKE 와 INSTR 의 차이점
--  예를 들어 LIKE 는 특정 문자가 들어간 값이 있는지 조회할 때 사용하지만,
--          INSTR 는 특정 문자가 몇번째에 있는지 조회할 때 사용한다.

-- 문자열에서, 'B' 가 맨 처음 나타나는 위치만 어디인지 조회해보기
SELECT 'AABAACAABBAA', INSTR('AABAACAABBAA', 'B') FROM DUAL; -- DUAL 은 존재하지 않는 TABLE 로, 테스트할 때 사용한다.
-- ▲ 'B' 가 맨 처음 나타나는 위치가, 조회 대상 문자열에서 어디인지 찾아본 것이다.

-- 문자열에서, 5번째부터 검색하여 'B' 가 5번째 이후부터 맨 처음 나타나는 위치만 어디인지 조회해보기
SELECT 'AABAACAABBAA', INSTR('AABAACAABBAA', 'B', 5) FROM DUAL; -- DUAL 은 존재하지 않는 TABLE 로, 테스트할 때 사용한다.
-- AABAA ◀ 5번째부터 'B' 찾기 시작
-- 5번째 이후 9번째에 'B' 가 처음 나타났기 때문에, 결과 값으로 9가 나온 것이다.

-- 문자열에서, 5번째부터 검색하여 'B' 가 5번째 이후부터 두번째로 나타나는 위치만 어디인지 조회해보기
SELECT 'AABAACAABBAA', INSTR('AABAACAABBAA', 'B', 5, 2) FROM DUAL; -- DUAL 은 존재하지 않는 TABLE 로, 테스트할 때 사용한다.
-- AABAA ◀ 5번째부터 'B' 찾기 시작
-- 5번째 이후 10번째에 'B' 가 두번째로 나타났기 때문에, 결과 값으로 10이 나온 것이다.

-- SUBSTR(문자열 | 칼럼명, 시작 위치[, 길이])
-- 문자열을 시작 위치부터 지정된 길이만큼 잘라내어 반환한다.
-- 길이를 지정하지 않은 경우, 시작 위치부터 끝까지 잘라내서 반환한다.

-- 시작 위치, 자를 길이 지정
SELECT SUBSTR('ABCDE', 2, 3) FROM DUAL;
-- ▲ 2번째 자리에 존재하는 B 부터 시작하여,
-- 총 길이 3 까지 가지고 오겠다는 의미로,
-- 따라서 BCD 를 가지고 오게 된 것이다.

-- 시작 위치만 지정하고, 자를 길이는 지정하지 않기
SELECT SUBSTR('ABCDE', 4) FROM DUAL;
-- ABCDE 에서, 4번째 자리에 위치한 D부터 시작하여
-- 끝까지 모두 가지고 오겠다는 의미로,
-- 따라서 DE 를 가지고 오게 된 것이다.


-- ▼ 외우기

-- EMPLOYEE TABLE 에서,
-- 이메일 주소를 @ 앞에 있는 아이디만 가져오고,
-- 그 아이디를 기준으로 오름차순 정렬하여 조회하기
SELECT EMP_NAME, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') -1) AS "이메일 아이디" FROM EMPLOYEE ORDER BY "이메일 아이디";
-- INSTR(EMAIL, '@') ◀ 이메일 주소에서 @ 위치 찾기
-- 찾은 다음, @ 까지 출력되지 않게 -1 작성을 하여 @ 을 제거한 것

SELECT EMP_NAME, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')) AS "이메일 아이디" FROM EMPLOYEE ORDER BY "이메일 아이디";
-- ▲ -1 을 해주지 않으면 @ 까지 출력된다.

-- INSTR(EMAIL, 1) 을 작성하게 되면 나타나는 결과 값 확인하기
SELECT EMP_NAME, SUBSTR(EMAIL, 1) AS "이메일 아이디" FROM EMPLOYEE ORDER BY "이메일 아이디";

-- 값을 앞에서부터 가지고올 때는 +(양수) 를 작성하고
-- 값을 뒤에서부터 가지고올 때는 -(음수) 를 작성해주면 된다.
select substr(phone, -4) as "전화번호 뒷자리" from employee where phone is not null;


/***** 그룹 관련 함수 *****/

-- COUNT: 행의 총 갯수를 셀 때 사용한다.
/*
COUNT 함수 사용 방법
       COUNT(*): 조회된 모든 행의 갯수를 반환한다. ▶ 이름, 주소 등의 항목이 몇 개나 존재하는지 확인할 때 사용한다.
    COUNT(칼럼명): 지정된 칼럼 값이 NULL 이 아닌 행의 갯수를 반환한다. ◀ NULL 을 제외한 나머지의 갯수를 확인하겠다는 것이다.
               ▶ 예를 들어, 검색한 결과 OO개 조회
    COUNT(DISTINCT 칼럼명): 지정된 칼럼에서 중복 값을 제외한 나머지 행의 갯수를 반환한다.
*/

-- EMPLOYEE TABLE 이 가지고 있는 전체 칼럼의 갯수
SELECT COUNT(*) FROM EMPLOYEE;

-- 전화번호가 있는 사원의 수
SELECT COUNT(*) FROM EMPLOYEE WHERE PHONE IS NOT NULL;

-- WHERE 절을 사용하지 않고, 전화번호가 있는 사원의 수 조회하기
SELECT COUNT(PHONE) FROM EMPLOYEE;

-- AVG(평균)

-- 모든 사원의 급여 평균 조회
SELECT AVG(SALARY) FROM EMPLOYEE;

-- 올림(CEIL) 내림(FLOOR) 반올림(ROUND) 을 사용하여 정수로 출력하기
SELECT CEIL (AVG (SALARY)) FROM EMPLOYEE;
SELECT FLOOR (AVG (SALARY)) FROM EMPLOYEE;
SELECT ROUND (AVG (SALARY)) FROM EMPLOYEE;

/***** TRIM(공백) *****/
/*
공백 관련 함수

TRIM([[옵션] 문자열 | 칼럼명 FROM] 문자열 | 칼럼명)
    주어진 문자열의 앞쪽 | 뒤쪽 | 양쪽 에 존재하는 지정된 문자열을 제거할 수 있다.
    
-- 옵션 앞쪽(LEADING) 공백 제거
       뒤쪽(TRAILING) 공백 제거
       양쪽(BOTH) 공백 제거 ◀ 기본값
*/

SELECT '     점     심     ', TRIM(LEADING ' ' FROM '     점     심     ') FROM DUAL;
/*
TRIM 은, 작은 따옴표 ' ' 안에 문자 딱 1개만 입력 가능하다. 띄어쓰기도 1번만 입력 가능하다.
예를 들어, TRIM(LEADING '가')
*/

SELECT '     점     심     ', TRIM(TRAILING ' ' FROM '     점     심     ') FROM DUAL;
-- ▲ 뒤쪽 공백 제거는 눈으로 봤을 때 티가 나지 않을 수도 있지만, 정상적으로 공백 제거가 실행된다.
SELECT '     점     심     ', TRIM(BOTH ' ' FROM '     점     심     ') FROM DUAL;

-- 앞/뒤/양쪽 공백 제거 한 번에 실행해서 비교해보기
SELECT '     점     심     ', 
TRIM(LEADING ' ' FROM '     점     심     '),
TRIM(TRAILING ' ' FROM '     점     심     '),
TRIM(BOTH ' ' FROM '     점     심     ')
FROM DUAL;

/*
REPLACE: 특정 문자열을 다른 문자열로 치환할 때 사용한다.
사용방법
    (문자열 | 칼럼명, 찾을 문자열, 바꿀 문자열)
*/

-- NATIONAL TABLE 에서, 한국을 대한민국으로 바꾸기
SELECT * FROM NATIONAL;
SELECT NATIONAL_CODE, NATIONAL_NAME, REPLACE(NATIONAL_NAME, '한국', '대한민국') FROM NATIONAL;