-- DDL(Data Definition Language)
--- 데이터 정의 언어. 객체를 만들고(CREATE), 수정하고(ALTER), 삭제(DROP) 하는 구문이다.

---- ALTER(바꾸다, 수정하다)
----- 수정 가능한 것들: 칼럼(추가/수정/삭제), 제약 조건(추가/삭제), 이름 변경(테이블, 칼럼, 제약 조건)
------ 작성법
------- TABLE 을 수정하는 경우
-------- ALTER TABLE 테이블명 ADD | MODIFY | DROP 수정할 내용;
--------- 1. 제약 조건의 추가 / 삭제
-------- 작성하는 방법 중, 대괄호 [ ] 는 생략 가능하다.(선택 사항)
------- 제약 조건을 추가하려면, ALTER TABLE 테이블명 ADD [[CONSTRAINT 제약조건명] 제약조건(칼럼명) [REFERENCES 테이블명(칼럼명)]];

-- 예제
CREATE TABLE DEPT_COPY AS SELECT * FROM DEPARTMENT;

ALTER TABLE DEPT_COPY ADD CONSTRAINT PK_DC PRIMARY KEY(DEPT_ID);
-- ALTER TABLE DEPT_COPY ◀ DEPT_COPY 테이블을 수정하겠다
--- ADD CONTRAINT PK_DC ◀ 새로운 제약 조건 PK_DC(제약조건 이름) 를 추가하겠다
---- PRIMARY KEY(DEPT_ID) ◀ DEPT_ID 를 기본 키로 설정하겠다

ALTER TABLE DEPT_COPY ADD CONSTRAINT U_DC UNIQUE(DEPT_TITLE);

--------- 2. 칼럼의 추가 / 수정 / 삭제
-------- 칼럼 추가: ALTER TABLE 테이블명 ADD (칼럼명 데이터타입 [DEFAULT '값']);

-------- 칼럼 수정: ALTER TABLE 테이블명 MODIFY 칼럼명 데이터타입; ◀ 데이터 타입 변경
--------- ALTER TABLE 테이블명 MODIFY DEFAULT '값'; ◀ 기본 값 변경

---------- 데이터 타입을 수정할 경우, 칼럼에 이미 저장된 값이 있다면 그 값의 크기 미만으로는 변경할 수 없다.
----------- 데이터 타입 VARCHAR2(100) 을 VARCHAR2(10) 으로 변경하고자 할 때,
---------- 기존에 이미 저장되어 있는 데이터 값이 10 을 초과한다면, 변경이 불가능하다.

-------- 칼럼 삭제: ALTER TABLE 테이블명 DROP (삭제할 칼럼명);
--------- ALTER TABLE 테이블명 DROP COLUMN 삭제할 칼럼명;
---------- 테이블에는 최소 1개 이상의 칼럼이 존재해야 하기 때문에, 모든 칼럼을 전부 다 삭제할 수는 없다.

SELECT * FROM DEPT_COPY;

ALTER TABLE DEPT_COPY ADD (C_NAME VARCHAR2(20));
ALTER TABLE DEPT_COPY ADD (L_NAME VARCHAR2(30) DEFAULT '한국');

-- ALTER TABLE 테이블명 MODIFY (칼럼명 데이터타입);
ALTER TABLE DEPT_COPY MODIFY (DEPT_ID VARCHAR2(3));
-- 기존에 이미 저장되어 있는 칼럼 값이 3 보다 크다면, VARCHAR2(3) 으로 변경할 수 없다.
--- 칼럼 값을 변경할 때(큰 값 ▶ 작은 값) , 이미 저장된 데이터 값이 변경할 값보다 크지 않은지 미리 확인하고 수정해야 한다.

-- ALTER TABLE 테이블명 DROP (삭제할 칼럼명);
ALTER TABLE DEPT_COPY DROP (C_NAME); -- 이 방식은 소괄호 ( ) 를 쓰지 않으면 오류가 발생한다.

SELECT * FROM DEPT_COPY;

ALTER TABLE DEPT_COPY DROP COLUMN L_NAME; -- 이 방식은 소괄호 ( ) 를 쓰면 오류가 발생한다.

ALTER TABLE DEPT_COPY DROP (DEPT_TITLE);
ALTER TABLE DEPT_COPY DROP COLUMN LOCATION_ID;
/*
table or view does not exist
만약, 존재하지 않는 테이블을 삭제하려 하면 발생하는 오류이다.

"칼럼명": invalid identifier
만약, 존재하지 않는 칼럼을 삭제하려 하면 발생하는 오류이다.
*/

--------- 3. 테이블 삭제
-------- 작성법
------- DROP TABLE 테이블명 [CASCADE CONSTRAINTS];

CREATE TABLE TB1 
(PK_TB1 NUMBER PRIMARY KEY,
TB1_COL NUMBER);

CREATE TABLE TB2 
(PK_TB2 NUMBER PRIMARY KEY,
TB2_COL NUMBER REFERENCES TB1); -- TB1 테이블의 PK 값을 참조하겠다

DROP TABLE DEPT_COPY; -- DEPT_COPY 테이블 삭제

DROP TABLE TB1;
/*
ORA-02449: unique/primary keys in table referenced by foreign keys
FK(외래 키) 에 의해 참조되는 PK(기본/고유 키) 가 존재하기 때문에 삭제할 수 없다는 오류가 발생한 것이다.
*/

-- 해결 방법 1: 자식 테이블(TB2) 먼저 삭제한 다음, 부모 테이블(TB1) 삭제하기
DROP TABLE TB2;
DROP TABLE TB1;

-- 해결 방법 2: CASCADE CONSTRAINTS 옵션 사용하기
--- 제약 조건까지 모두 한꺼번에 삭제하는 옵션으로, 제약 조건을 없애버려서 부모 - 자식 테이블 관계를 끊어버리는 것이다.
DROP TABLE TB1 CASCADE CONSTRAINTS;
SELECT * FROM TB2;
DROP TABLE TB2;

--------- 4. 제약 조건, 칼럼, 테이블의 이름 변경(RENAME)
-------- ALTER TABLE 기존테이블명 RENAME TO 새로운테이블명;
CREATE TABLE DEPT_COPY AS SELECT * FROM DEPARTMENT;

ALTER TABLE DEPT_COPY RENAME TO DCOPY;

SELECT * FROM DCOPY;
SELECT * FROM DEPT_COPY;