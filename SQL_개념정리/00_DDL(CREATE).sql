/*
   올림: CEIL
  반올림: ROUND
   버림: FLOOR
오름차순: ASC(ASCENDING)
내림차순: DESC(DESCENDING)

자료형
    NUMBER: 숫자형(정수, 실수)
            실수 자리: 소수 자리 몇번째까지 가능한지
            NUMBER(2, 2) ▶ NUMBER(0 ~ 99, 0.99) ▶ 0.00 ~ 99.99 까지 가능
            
    CHAR(크기): 고정 길이 문자형 ▶ 현재는 거의 사용되지 않는다.
    
    VARCHAR: 이전 버전으로, 현재는 거의 사용되지 않는다.
    
    VARCHAR2: 최신 버전으로, 현재 가장 많이 사용된다.
              가변 길이 문자형
              
              CHAR vs VARCHAR2
               고정    가변
               
              예를 들어, CHAR(10 BYTE)      VARCHAR2(10 BYTE)
                  CHAR = 1; ▶ 1 하나를 넣는 데에 10 을 모두 사용한다.
              VARCHAR2 = 1; ▶ 1 하나를 넣고나면, 나머지 99를 돌려준다.
              
    VARCHAR2 는, 공간 확보는 하되, 사용하지 않은 크기는 돌려준다.
    
    DATE: 날짜 타입
    
    CLOB: 메일, 소설 등 VARCHAR2 에서 감당하지 못할 크기의 많은 글을 삽입할 때 사용한다.
    
    BLOB: 이미지, 동영상 같은 파일을 저장할 때 사용한다.
    
          영어, 숫자, 특수문자 == 1 BYTE
        
        이외의 문자(한글 포함) == 3 BYTE
                        ㄱ == 3 BYTE
                        가 == 3 BYTE
                        힇 == 3 BYTE
*/

/*
PRIMARY KEY(기본 키)
    TABLE 에서, 한 행의 정보를 찾기 위해 사용할 칼럼을 의미한다.
    NOT NULL + UNIQUE ◀ 한 행(COLUMN) 에서, 똑같은 모양의 데이터는 존재해선 안 된다.
    한 TABLE 당 한개만 설정해야 한다.
    칼럼 레벨이나 TABLE 레벨도 설정 가능하다.
*/

/*
테스트를 진행하거나, 칼럼에 대한 설정을 변경한 후 특정한 내용을 확인하고 싶다면,
TABLE 을 복제하여 진행하는 것이 좋다.(사본 만들기)

사본 만드는 법

    모든 값이 동일한 사본 만들기
    CREATE TABLE 새로만들테이블이름 AS SELECT * FROM 복사해올 테이블 이름;

    특정 칼럼 값만 동일한 사본 만들기
    CREATE TABLE 새로만들테이블이름 AS SELECT 선택할칼럼명1, 선택할칼럼명2, ... FROM 복사해올 테이블 이름;
*/

CREATE TABLE EMPLOYEE2 AS SELECT * FROM EMPLOYEE;
-- TABLE 을 만들 때, 다른 TABLE 과 동일(칼럼, 데이터) 한 TABLE 을 만드려면
-- CREATE 테이블명 AS SELECT 복사할 값 FROM 복사할 테이블명;

-- 사본이 제대로 만들어졌는지 확인하기
--  SELECT * FROM 새로만든사본테이블명;
SELECT * FROM EMPLOYEE2;