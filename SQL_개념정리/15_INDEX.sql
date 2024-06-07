/*
INDEX
    SQL SELECT 구문에서, 처리 속도를 향상시키기 위하여 칼럼에 대해 생성하는 객체이다.
    자동으로 정렬하고, 검색 속도를 향상시킨다.
    조회 시 테이블의 전체 내용을 확인하며 조회하는 것이 아니라,
    인덱스가 지정된 칼럼만 이용하여 조회하기 때문에, 시스템 부하가 낮아진다.
    
주의 사항
    데이터 변경(INSERT, UPDATE, DELETE) 작업 시, 시스템 과부하로 성능이 낮아진다.
    인덱스도 하나의 객체이기 때문에 별도의 저장 공간이 필요하며, 메모리를 소비한다.
    인덱스가 생성될 수 있는 시간이 필요하다.
    
작성법
    CREATE [UNIQUE] INDEX 인덱스명 ON 테이블명 (칼럼명1 [, 칼럼명 | 함수명]);
    
삭제하기
    DROP INDEX 인덱스명;
    
인덱스가 자동으로 생성되는 경우
    PRIMARY KEY 또는 UNIQUE 제약 조건이 설정된 칼럼에 대하여, UNIQUE INDEX 가 자동으로 생성된다.
*/

-- 인덱스 사용 방법
--> WHERE 절에 INDEX 가 지정된 칼럼을 기입할 수 있다.
SELECT * FROM EMPLOYEE; -- 인덱스를 사용하지 않고, 단순 조회하는 방법

SELECT * FROM EMPLOYEE WHERE EMP_ID != 0; -- EMP_ID 라는 INDEX 를 사용하겠다 라는 의미이다.
--> EMP_ID 가 PRIMARY KEY 로 정렬하는 숫자 값이기 때문에, 조회가 가능한 것이다.
---> INDEX 는, 숫자로 무언가를 찾기 위한 값이다.
/*
현재 사용하고 있는 계정이 kh_workbook 이기 때문에, 
ORA-00942: table or view does not exist
오류가 발생한다.
▶ kh_T 로 사용하고 있는 계정을 변경하면 된다.
*/