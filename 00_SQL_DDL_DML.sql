/*
DDL: SQL 을 관리하고, 구조를 정의하기 위한 명령어의 집합이다.

DDL 명령어
    CREATE: USER 의 ID 를 만들거나, TABLE 을 만들 때 주로 사용한다.
     ALTER: USER 에 대한 정보나, TABLE 이름을 수정할 때 주로 사용한다.
      DROP: USER 에 대한 정보를 삭제하거나, TABLE 이름을 삭제할 때 주로 사용한다.
      
DML: 데이터 베이스의 데이터를 조작하기 위한 SQL 명령어들의 집합이다.

DML 명령어
    INSERT: TABLE 에 새로운 행(ROW) 삽입
        기본 문법: INSERT INTO 테이블명 (칼럼1, 칼럼2, ...) VALUES (값1, 값2, ...);
    
    UPDATE: TABLE 의 기존 데이터를 수정
        기본 문법: UPDATE 테이블명 SET 칼럼1 = 변경할 값1, 칼럼2 = 변경할 값2, ... WHERE 조건;
    
    DELETE: TABLE 의 데이터를 삭제
        기본 문법: DELETE 테이블명 WHERE 조건;
                 TABLE에서 삭제하고자 하는 특정 조건을 선택하여 삭제 진행
    
    SELECT: TABLE 의 데이터를 조회
        기본 문법: SELECT * FROM 테이블명;
                 TABLE 에 적혀있는 모든 내용을 보겠다는 의미
                 
                 SELECT 칼럼1, 칼럼2, ... FROM 테이블명;
                 TABLE 에 원하는 칼럼을 선택해서 보겠다는 의미
                 
                 SELECT 칼럼1 AS 별칭1, 칼럼2 AS 별칭2, ... FROM 테이블명;
                 TABLE 에 원하는 칼럼에 별칭을 붙여 출력하겠다는 의미
*/