/*
TCL(Transaction Control Language): 트랜잭션 제어 언어
    Transaction: 업무, 처리
    변경된 사항을 묶어, 하나의 트랜잭션에서 처리한다.
    트랜잭션에서의 데이터 변경 대상: INSERT, UPDATE, DELETE ◀ DML
        
        ex) INSERT INTO 값 추가                                               ▶ DB 반영 X
            INSERT INTO 값 추가      ▶ 트랜잭션에 추가               ▶ COMMIT   ▶ DB 반영 O
            INSERT INTO 값 10번 추가 ▶ 1개의 트랜잭션에 10개의 값 추가 ▶ ROLLBACK ▶ DB 반영 X
        
        1) COMMIT: 메모리 트랜잭션에 임시 저장된 데이터를 DB 에 완전히 추가함
        
        2) ROLLBACK: 메모리 트랜잭션에 임시 저장된 데이터를 삭제하고,
                     마지막 COMMIT 상태로 돌아감
        
        3) SAVEPOINT: 메모리 트랜잭션에 저장 지점을 정의하고,
                      ROLLBACK 수행 시 전체 작업을 삭제하는 것이 아닌
                      저장 지점까지만 일부 삭제를 진행함
*/

-- 복제 테이블 DEPARTMENT3
CREATE TABLE DEPARTMENT3 AS SELECT * FROM DEPARTMENT;
SELECT * FROM DEPARTMENT3;

-- 1. COMMIT 예제
INSERT INTO DEPARTMENT3 VALUES ('D0', '경리부', 'L2');
SELECT * FROM DEPARTMENT3;

UPDATE DEPARTMENT3 SET DEPT_TITLE = '전략기획팀', LOCATION_ID = 'L3' WHERE DEPT_ID = 'D9';
SELECT * FROM DEPARTMENT3;

COMMIT; -- 추가, 수정된 사항들을 최종적으로 저장한 것
ROLLBACK; -- 마지막 COMMIT; 이후까지로만 돌아갈 수 있다.

-- 2. ROLLBACK 예제
DELETE FROM DEPARTMENT3 WHERE DEPT_ID = 'D0';
SELECT * FROM DEPARTMENT3;

DELETE FROM DEPARTMENT3 WHERE DEPT_ID = 'D9';
SELECT * FROM DEPARTMENT3;

DELETE FROM DEPARTMENT3 WHERE DEPT_ID = 'D8';
ROLLBACK;

-- 3. SAVEPOINT 예제
DELETE FROM DEPARTMENT3 WHERE DEPT_ID = 'D0';

-- SAVEPOINT "저장지점이름"; 형식으로 작성해 주어야 한다.
SAVEPOINT "SP1"; -- SP1 이라는 이름의 저장 지점을 설정한 것

DELETE FROM DEPARTMENT3 WHERE DEPT_ID = 'D9';

SAVEPOINT "SP2"; -- SP2 라는 이름의 저장 지점을 설정한 것

DELETE FROM DEPARTMENT3;

SELECT * FROM DEPARTMENT3;

-- 저장 지점 SP2 로 돌아가고 싶다면
ROLLBACK TO "SP2";

-- 저장 지점 SP1 으로 돌아가고 싶다면
ROLLBACK TO "SP1";

-- 마지막 COMMIT 이후까지 되돌리고 싶다면
ROLLBACK;