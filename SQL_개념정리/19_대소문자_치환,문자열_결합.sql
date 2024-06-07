/*
LOWER / UPPER / INITCAP
칼럼의 문자 또는 문자열을, 전부 또는 맨 첫글자만 대/소문자로 변환하여 반환하는 것이다.
*/

-- LOWER: 모두 소문자로 변환
SELECT LOWER('hELLo wORLd') FROM DUAL;
-- 결과: hello world

-- UPPER: 모두 대문자로 변환
SELECT UPPER('hELLo wORLd') FROM DUAL;
-- 결과: HELLO WORLD

-- 첫글자만 대문자로 변환
SELECT INITCAP('hELLo wORLd') FROM DUAL;
-- 결과: Hello World

-- CONCAT: 문자 처리 함수
/*
CONCAT: 칼럼의 문자 또는 문자열을 2개 전달받아 하나로 합친 후 반환한다.

작성법
    CONCAT(STRING, STRING)
*/

SELECT CONCAT('가나다라', 'ABCD') FROM DUAL;
SELECT '가나다라' || 'ABCD' FROM DUAL;

/***** CONCAT 함수와 || 연산자의 차이점
CONCAT: 2개의 문자열을 결합할 수 있다. 2개를 초과하면 사용할 수 없다.
        (예를 들어, 성 + 이름 을 붙일 때 사용한다.)
작성법
    CONCAT(STRING1, STRING2)
        
||: 2개를 초과하는 문자열들을 서로 결합할 때 사용한다.

작성법
    STRING1 || STRING2 || STRING3 ... 여러개 결합 가능
*****/