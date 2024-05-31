/***** 
DML: 데이터 조작 언어
     TABLE 에 값을 삽입, 수정, 삭제하는 구문
     실행한 후 반드시 COMMIT ROLLBACK 까지 진행해야 한다.
     
    INSERT: 삽입
    UPDATE: 수정
    DELETE: 삭제
     
     지금은 훈련 중이기 때문에 단독으로 진행하지만,
     COMMIT ROLLBACK 은 원래 팀원이나 협업하는 사람들과 상의 후에 진행해야 한다.
*****/

-- INSERT UPDATE DELETE 를 연습하기 위한 TABLE 만들기

-- EMPLOYEE 테이블에 있는 값을 전부 복사하여, 새로 만든 EMPLOYEE2 테이블에 집어넣기
CREATE TABLE EMPLOYEE2 AS SELECT * FROM EMPLOYEE;
-- TABLE 을 만들 때, 다른 TABLE 과 동일(칼럼, 데이터) 한 TABLE 을 만드려면
-- CREATE 테이블명 AS SELECT 복사할 값 FROM 복사할 테이블명;

SELECT * FROM EMPLOYEE2;

CREATE TABLE DEPARTMENT2 AS SELECT * FROM DEPARTMENT;
SELECT * FROM DEPARTMENT2;

-----------------------------------------------------
-- 1. INSERT
--  TABLE 에 새로운 행을 추가하는 구문

-- 1) INSERT INTO 테이블명 VALUES(데이터1, 데이터2, ...);
--  TABLE 의 모든 칼럼에 대한 값을 INSERT 할 때 사용한다.
--  INSERT 하고자 하는 칼럼이 전체 칼럼일 경우, 칼럼명은 생략이 가능하다.
--  단, 칼럼의 순서를 지켜서 VALUES 값을 기입하여야 한다.
INSERT INTO EMPLOYEE2 VALUES (800, '동그라미', '911229-1234567', 'ehdrm@or.kr', '01044521234', 'D1', 'J7', 'S3', 5000000, 0.2, 200, SYSDATE, NULL, 'N');

COMMIT;

SELECT * FROM EMPLOYEE2 WHERE EMP_ID = 800;

INSERT INTO DEPARTMENT2 VALUES ('D0', '개발운영부', 'L1');
ROLLBACK; -- 돌아가기(저장 취소)

-- INSERT 에서, 특정 부분을 선택하여 넣을 때는 칼럼명을 작성해서 넣어준다.
-- INSERT INTO 테이블명 (칼럼명1, 칼럼명2, ...) VALUES (칼럼명1에 해당하는값, 칼럼명2에 해당하는값, ...);


-----------------------------------------------------
-- 2. UPDATE
--  TABLE 에 기록된 칼럼의 값을 수정하는 구문


-- 2) UPDATE 테이블명 SET 칼럼명 = 변경할값
--    WHERE 칼럼명 비교연산자 비교값; ◀ 필수 아님
SELECT * FROM DEPARTMENT2 WHERE DEPT_ID = 'D9';

