/*
형 변환(Parsing) 함수
    -- 문자열(CHAR, VARCHAR2) <-> 숫자(NUMBER)
    -- 문자열(CHAR, VARCHAR2) <-> 날짜(DATE)
    -- 숫자(NUMBER) ------------> 날짜(DATE)
*/

/*
TO_CHAR(날짜 | 숫자 [, 포맷]) ◀ 문자열로 변환한다.

숫자 -> 문자열 포맷
    1) 9: 숫자 한 칸을 의미한다. 오른쪽 정렬
    2) 0: 숫자 한 칸을 의미한다. 오른쪽 정렬, 빈 칸에 0을 추가한다.
    3) L: 시스템이나 DB 에 설정된 국가의 화폐 기호
    4) ,: 숫자의 자릿수 구분
*/

-- 가상 테이블(DUAL) 을 사용하여 조회해보기
SELECT 1234, TO_CHAR(1234) FROM DUAL; -- 데이터 타입 변경(숫자 -> 문자열)

SELECT 1234, TO_CHAR(1234, '999999999') FROM DUAL; -- '      1234' 앞에 공백 6칸 생성
-- 9를 사용하지 않으면 자동으로 왼쪽 정렬이 되기 때문에 왼쪽으로 정렬하고 싶다면 아무것도 작성하지 않으면 된다.

SELECT 1234, TO_CHAR(1234, '00000') FROM DUAL; -- 1234 앞에 0이 1칸 생성

-- 숫자 -> 문자열 변환 시 주의 사항
---> 지정된 칸 수가 숫자의 길이보다 적으면, 전부 #으로 변환되어 출력
SELECT 1234, TO_CHAR(1234, '000') FROM DUAL;
-- ▲ 지정된 자릿값보다 변환해야 하는 숫자값의 길이가 더 길기 때문에 #으로 변환되어 출력

-- 화폐 기호 + 자릿수 구분
SELECT TO_CHAR(123456789, 'L999999999'), -- L: 현재 시스템에서 설정된 국가의 화폐 기호
TO_CHAR(123456789, '$999999999'), 
TO_CHAR(123456789, '$999,999,999')
FROM DUAL;

SELECT EMP_NAME 이름, TO_CHAR(SALARY * 12, 'L999,999,999') 연봉 FROM EMPLOYEE;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD') 현재날짜 FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY') 현재날짜 FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD (DY)') 현재날짜 FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD (DY) AM HH:MI:SS') 현재날짜 FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY"년" MM"월" DD"일" AM HH"시" MI"분" SS"초"') 현재날짜 FROM DUAL;

/*
TO_DATE(문자열 | 숫자 [, 포맷])
    문자열 또는 숫자를 날짜 형식으로 변환한다.
*/

-- 가상 테이블(DUAL) 의 문자열이 날짜를 표현하는 형식이면, 형식 지정없이 바로 변경 가능하다.
SELECT TO_DATE('2024-05-05') FROM DUAL;

SELECT TO_DATE('06-06-2024', 'DD-MM-YYYY') FROM DUAL; -- TO_DATE 가 포맷을 무시한다. 
SELECT TO_DATE('06월 06일 목요일 12시 50분', 'MM"월" DD"일" DAY HH"시" MI"분"') FROM DUAL; -- TO_DATE 가 포맷을 무시한다. 

-- 숫자 -> 날짜
SELECT TO_DATE(20240605, 'YYYYMMDD') FROM DUAL;

-- RR 과 YY 의 차이점
---> 연도가 2자리만 작성되어 있는 경우
-- 50 이상: Y 현재 세기(2000년대 기준) // R 이전 세기(1900년대 기준)
-- 50 미만: Y, R 둘 다 현재 세기(2000년대 기준)

SELECT TO_DATE('49-04-09', 'YY-MM-DD') AS "YY", -- 2049년
TO_DATE('49-04-09', 'RR-MM-DD') AS "RR" -- 2049년
FROM DUAL;

SELECT TO_DATE('50-04-09', 'YY-MM-DD') AS "YY", -- 2050년
TO_DATE('50-04-09', 'RR-MM-DD') AS "RR"  -- 1950년
FROM DUAL;