/*
선택 함수
    -- 여러가지 경우에 따라 알맞은 결과를 선택하는 함수이다.
       IF, SWITCH 와 비슷하다.
    
    -- DECODE(칼럼명 | 계산식, 조건1, 결과1, 조건2, 결과2, ... [, 아무것도 만족하지 않는 값])
    
    -- 칼럼명 | 계산식의 값이 서로 일치하는 조건이 있으면,
       해당 조건 오른쪽에 작성된 결과를 반환한다.
*/

-- 예제 1번
SELECT EMP_NAME, EMP_NO, DECODE(SUBSTR(EMP_NO, 8, 1), -- 주민번호 8번째 자리가 성별을 정하는 1 또는 2
                                '1', '남자', 
                                '2', '여자') AS "성별" FROM EMPLOYEE;
/*
CASE
    WHEN 조건1 THEN 결과1
    WHEN 조건2 THEN 결과2
    WHEN 조건3 THEN 결과3
    ...
    ELSE 결과 END
    
-- DECODE 는 계산식 | 칼럼 값이 딱 떨어지는 경우에 사용이 가능하다.
-- CASE 는 계산식 | 칼럼 값을 범위로 지정 가능하다.
*/

-- 예제 1번
SELECT EMP_ID, EMP_NAME, SALARY, 
CASE 
WHEN SALARY >= 5000000 -- IF(SALARY >= 5000000) {
THEN '고급' -- SYSTEM.OUT.PRINTLN("고급");
WHEN SALARY >= 3000000 -- } ELSE IF(SALARY >= 3000000) {
THEN '중급' -- SYSTEM.OUT.PRINTLN("중급");
ELSE '초급' -- } ELSE { SYSTEM.OUT.PRINTLN("초급"); }
END 구분 -- AS "구분" 과 같다. THEN 값으로 출력될 칼럼명
FROM EMPLOYEE;