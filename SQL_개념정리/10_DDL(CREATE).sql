/*
DDL(Data Definition Language): 데이터 정의 언어
    객체를     OBJECT
    만들고     CREATE
    수정하고    ALTER
    삭제하는    DROP
    언어이다.
    
    ORACLE 에서 객체는 
        TABLE, 
        VIEW, 
        SEQUENCE, 
        INDEX, 
        PACKAGE, 
        TRIGGER, 
        PROCEDURE, 
        FUNCTION(함수), 
        SYNONYM(동의어), 
        USER(사용자) 등이 있다.
        
-----------------------------------------------------------------

CREATE
    - 테이블이나 인덱스, 뷰 등의 다양한 데이터 베이스 객체를 생성하는 구문으로,
      테이블로 생성된 객체는 DROP 구문을 사용하여 제거할 수 있다.
      
    1. 테이블 생성하기
        - 테이블이란, 행(ROW) 과 열(COLUMN) 로 구성되는 가장 기본적인 데이터 베이스 객체이다.
          데이터 베이스 안에서 모든 데이터는 테이블을 통해 저장된다.
          
       [표현식]
           CREATE TABLE 테이블명 (칼럼명1 자료형(크기), 칼럼명2 자료형(크기), ...);
            
           [자료형]
                   NUMBER: 숫자형(정수, 실수)
                CHAR(크기): 고정길이 문자형(최대 2000 BYTE)
            VARCHAR2(크기): 가변길이 문자형(최대 4000 BYTE). VARCHAR1 의 업그레이드 버전이다.
            
                ABC 문자열을 CHAR 와 VARCHAR2 에 각각 저장한다면,
                    CHAR(10) 칼럼: CHAR 는 10 을 모두 소진한다.
                    VARCHAR2(10) 칼럼: VARCHAR2 는 3 만큼만 소진하고, 나머지 7은 반환한다.
            
            DATE: 날짜 타입
            BLOB: 대용량 사진/동영상/파일 데이터를 저장할 때 사용한다.(최대 4GB)
            CLOB: 대용량 문자 데이터를 저장할 때 사용한다.(최대 4GB)
            
                UTF-8
                    영어, 숫자, 특수문자 == 1 BYTE
                        나머지(한글 등) == 3 BYTE
*/

CREATE TABLE USER_MEMBER (USER_ID VARCHAR2(20), USER_PW VARCHAR2(20), USER_NAME VARCHAR2(15), USER_SSN CHAR(14), ENROLL_DATE DATE DEFAULT SYSDATE);
-- DEFAULT(=기본값): 칼럼의 기본값을 지정할 수 있다.(필수 아님)
---> DEFAULT 를 사용하여 기본값을 지정하고 INSERT 또는 UPDATE 절을 작성한다면,
----> 지정한 기본값이 들어간다.

SELECT * FROM USER_MEMBER;

-- 주석으로 칼럼에 대한 설명 추가하기
--- [표현식]
---- COMMENT ON COLUMN 테이블명.칼럼명 IS '주석 내용'; ◀ 주석 내용은 반드시 작은 따옴표 ' ' 를 사용해 주어야 한다.
COMMENT ON COLUMN USER_MEMBER.USER_ID IS '회원아이디';


/*
제약 조건(CONSTRAINTS)
    사용자가 원하는 조건의 데이터만 유지하기 위해, 특정 칼럼에 설정하는 제약이다.
    
    데이터 무결성 보장을 목적으로 한다.
    (+ 입력 데이터에 문제가 없는지 자동으로 검사하는 목적)
    
    데이터 수정/삭제가 가능한지 여부를 검사하기 등을 목적으로 한다.
    ▶ 제약조건을 위배하는 DML 구문은 수행할 수 없다.
    
    제약 조건의 종류
    PRIMARY KEY, FOREIGN KEY, CHECK, UNIQUE, NOT NULL
    
    제약 조건의 확인
    USER_CONSTRAINTS: 사용자가 작성한 제약 조건을 확인하는 딕셔너리 뷰
    
    OWNER: 유저 아이디
    CONSTRAINTS_NAME: 제약 조건의 이름
    CONSTRAINTS_TYPE: 제약 조건의 유형
        
        C: CHECK
        P: PRIMARY KEY
        U: UNIQUE
        R: FOREIGN KEY
        V: VIEW
        O: 읽기 전용 뷰
    
    TABLE_NAME: 제약 조건이 적용된 테이블의 이름
*/
DESC USER_CONSTRAINTS;
-- 제약 조건을 모두 지우는 단축키: CTRL + SHIFT + D

SELECT * FROM USER_CONSTRAINTS;

-- 1. NOT NULL
--- 해당 칼럼에 값이 반드시 존재해야 하는 경우에 사용한다.
--- 삽입 / 수정 시에 NULL 값을 허용하지 않도록 칼럼 레벨에서 제한하는 것이다.
CREATE TABLE USER_TEST_TABLE 
(USER_NO NUMBER(10, 0) NOT NULL, 
USER_ID VARCHAR2(30), 
USER_PW VARCHAR2(30), 
USER_NAME VARCHAR2(20), 
GENDER VARCHAR2(10), 
PHONE VARCHAR2(30), 
EMAIL VARCHAR2(50));

INSERT INTO USER_TEST_TABLE
VALUES(1, '사용자1', '비번1', '홍길동', '남자', '010-1111-2222', 'hong@hong.co.kr');

INSERT INTO USER_TEST_TABLE
VALUES(NULL, '사용자1', '비번1', '홍길동', '남자', '010-1111-2222', 'hong@hong.co.kr');
/*
SQL 오류: ORA-01400: cannot insert NULL into 
("KH_T"."USER_TEST_TABLE"."USER_NO")

USER_NO NUMBER(10, 0) NOT NULL
NULL 값을 넣을 수 없다고 설정해놨기 때문에, NULL(빈 값) 값을 넣을 수 없는 것이다.
*/

-- 2. UNIQUE
--- 칼럼에 입력할 값에 대하여 중복을 제한하는 제약 조건이다.
--- 테이블 레벨, 칼럼 레벨에서 설정 가능하다.
--- 단, UNIQUE 제약 조건이 설정된 칼럼에 대하여, NULL 값 삽입이 가능하다.
--- UNIQUE 칼럼이 여러개 존재한다면, 각 칼럼마다 중복 삽입이 가능하다.
--- 테이블 상품명 / 상품 갯수 / 설명(UNIQUE) - NULL / 품절유무(UNIQUE) - NULL
--- ANSI 형식이 국제 표준이다.
CREATE TABLE UNIQUE_TABLE 
(USER_NO NUMBER(10, 0),
USER_ID VARCHAR2(20) CONSTRAINT USER_ID_U UNIQUE, -- CONSTRAINT 제약조건명 제약조건종류
                                                  -- 칼럼 레벨 제약 조건(이름 필수)

USER_NAME VARCHAR2(30), CONSTRAINT USER_NAME_U UNIQUE(USER_NAME) -- 테이블 레벨 제약 조건(이름 필수)
);

-------------------------------------------------------------------

CREATE TABLE KH_CAFE
(CAFE_ID NUMBER(10, 0) PRIMARY KEY,
CAFE_NAME VARCHAR2(100) NOT NULL,
CAFE_PHONE VARCHAR2(20) CONSTRAINT CAFE_PHONE_U UNIQUE,
CAFE_ADDRESS VARCHAR2(100), CONSTRAINT CAFE_ADDRESS_U UNIQUE(CAFE_ADDRESS));

INSERT INTO KH_CAFE
VALUES (1, '메가커피', '02-1111-1111', '서울시 강남구 역삼동');

-- ALTER 를 사용하여 칼럼 크기 수정하기
--- ALTER TABLE 테이블명 MODIFY(수정할칼럼명 수정할크기);
---- ALTER TABLE KH_CAFE MODIFY(CAFE_PHONE VARCHAR2(100));

COMMIT;

-- 3. PRIMARY KEY(기본 키) 제약 조건
--- 테이블에서, 한 행의 정보를 찾기 위해 사용할 칼럼을 의미한다.
--- 테이블에 대한 식별자(IDENTIFIER) 역할을 한다.
--- NOT NULL + UNIQUE 제약 조건을 합친 것과 같다.
--- 한 테이블 당 한 개만 설정이 가능하다.
--- 테이블 레벨, 칼럼 레벨 둘 다 설정이 가능하다.
--- 한 개의 칼럼에 설정할 수 있고, 여러개의 칼럼을 묶어서 설정할 수도 있다.
/*
CREATE TABLE 테이블명 
(칼럼명 자료형(정수자리값, 실수자리값) PRIMARY KEY, -- 방법1
칼럼명 자료형(정수자리값, 실수자리값) CONSTRAINT 인덱스에저장할이름 PRIMARY KEY, -- 방법2
칼럼명 자료형(정수자리값, 실수자리값), CONSTRAINT 인덱스에저장할이름 PRIMARY KEY(연결할칼럼명)); -- 방법3
*/
CREATE TABLE USER_PRIMARY_TABLE 
(USER_NO NUMBER(10, 0) CONSTRAINT USER_NO_PK PRIMARY KEY,
USER_NAME VARCHAR2(200));

COMMIT;

INSERT INTO USER_PRIMARY_TABLE VALUES(1, '신짱구');

INSERT INTO USER_PRIMARY_TABLE VALUES(1, '김철수');
/*
기본 키 중복으로 오류가 발생한다.
ORA-00001: unique constraint (KH_T.USER_NO_PK) violated
USER_PRIMARY_TABLE 테이블에서, USER_NO 칼럼에 이미 기본 키 1 에 해당하는 값 신짱구 가 존재하는데,
1 에 또 다른 값을 중복으로 넣겠다고 했기 때문에 오류가 발생한 것이다.
*/

INSERT INTO USER_PRIMARY_TABLE VALUES(NULL, '김철수'); -- NULL(빈 값) 값
/*
기본 키는 NULL 일 수 없기 때문에 오류가 발생한다.
SQL 오류: ORA-01400: cannot insert NULL into ("KH_T"."USER_PRIMARY_TABLE"."USER_NO")
기본 키를 NULL 로 지정할 수는 없다.
*/

/*
FOREIGN KEY(외부 키) 제약 조건
    참조된 다른 테이블의 칼럼이 제공하는 값만 사용할 수 있다.

    FOREIGN KEY 사용 시 주의 사항
        삭제, 부모 테이블까지 삭제하는 데에 있어 오류가 발생할 수 있다.
    
    CONSTRAINT 인덱스값 REFERENCES 칼럼명(참조할 키);
*/

CREATE TABLE USER_GRADE 
(GRADE_CODE NUMBER(10, 0) PRIMARY KEY,
GRADE_NAME VARCHAR2(30) NOT NULL);

INSERT INTO USER_GRADE VALUES(10, '일반 회원');
INSERT INTO USER_GRADE VALUES(20, '우수 회원');
INSERT INTO USER_GRADE VALUES(30, '특별 회원');

COMMIT;

CREATE TABLE USER_FK 
(USER_NO NUMBER(10, 0) PRIMARY KEY,
USER_ID VARCHAR2(20) UNIQUE,
USER_PW VARCHAR2(30) NOT NULL,
GRADE_CODE NUMBER CONSTRAINT F_GC REFERENCES USER_GRADE(GRADE_CODE));

SELECT * FROM USER_GRADE;

INSERT INTO USER_FK VALUES(1, '유저01', '비번01', 10);

SELECT * FROM USER_FK;

INSERT INTO USER_FK VALUES(2, '유저02', '비번02', 20);
INSERT INTO USER_FK VALUES(3, '유저03', '비번03', 30);

INSERT INTO USER_FK VALUES(4, '유저04', '비번04', 40);
/*
부모 키인 USER_GRADE 에 40 이라는 값이 없기 때문에, 40 은 넣을 수 없다.
ORA-02291: integrity constraint (KH_T.F_GC) violated - parent key not found
*/

INSERT INTO USER_GRADE VALUES(40, '플래티넘 회원');
INSERT INTO USER_FK VALUES(4, '유저04', '비번04', 40);
-- 부모 키인 USER_GRADE 에 40 이라는 값이 새로 생겼기 때문에, 40 이 삽입 가능해졌다.

INSERT INTO USER_GRADE VALUES(00, '임시 회원'); -- 정수에서 맨 앞자리 숫자 0 은 사라진다.
-- 따라서, 전화번호를 기입할 때는 VARCHAR2 를 사용하여 010 이 모두 온전하게 들어갈 수 있도록 설정해준다.

-- 만약, 유저01 이 이미 일반 회원으로 지정되어 있는 상태에서 일반 회원이라는 등급을 없애려고 시도하는 경우
--- 일반 회원이라는 등급이 이미 유저01 회원의 등급으로 지정되어 있기 때문에, 쉽게 없앨 수 없게 설정이 되어있다.
DELETE FROM USER_GRADE WHERE GRADE_CODE = 10;
/*
10 을 참조하는 자식이 존재하므로 삭제할 수 없다는 오류가 발생한다.
ORA-02292: integrity constraint (KH_T.F_GC) violated - child record found
*/

-- CASCADE ◀ 부모 키 삭제 시, 참조하는 자식의 행도 모두 삭제한다.
-- 삭제 대신 값만 NULL 로 변경하고 싶다면, NULL 을 적용해주면 된다.

/* ---------------------------------------------------------

CREATE TABLE 부모테이블명
(부모칼럼명1 자료형(크기) PRIMARY KEY,
부모칼럼명2 자료형(크기) NOT NULL);

CREATE TABLE 자식테이블명 
(칼럼명1 자료형(크기) PRIMARY KEY,
칼럼명2 자료형(크기) UNIQUE,
칼럼명3 자료형(크기) NOT NULL,
칼럼명4 자료형 CONSTRAINT 인덱스에저장될이름 REFERENCES 부모테이블명(부모칼럼명1));

방법 1 - 마음대로 삭제하지 못하게 하기
칼럼명4 자료형 CONSTRAINT 인덱스에저장될이름 REFERENCES 부모테이블명(부모칼럼명1))

방법 2 - 부모 키 삭제 시 자식 키를 NULL 로 변경하는 옵션: ON DELETE SET NULL
칼럼명4 자료형 CONSTRAINT 인덱스에저장될이름 REFERENCES 부모테이블명(부모칼럼명1)) ON DELETE SET NULL

방법 3 - 부모 키 삭제 시 자식 키도 함께 삭제하는 옵션: ON DELETE CASCADE
칼럼명4 자료형 CONSTRAINT 인덱스에저장될이름 REFERENCES 부모테이블명(부모칼럼명1)) ON DELETE CASCADE

------------------------------------------------------------------------------------------- */

-- 5. CHECK 제약 조건 ◀ 칼럼에 기록되는 값에 조건을 설정할 수 있다.
--- CHECK (칼럼명 비교연산자 비교값);
-- 비교 값에는 변하는 값이나 함수를 사용할 수 없다.

CREATE TABLE USER_CHECK 
(USER_NO NUMBER PRIMARY KEY,
USER_ID VARCHAR2(20) UNIQUE,
USER_PW VARCHAR2(30) NOT NULL,
USER_NAME VARCHAR2(30),
GENDER VARCHAR2(10) CHECK (GENDER IN ('남', '여')));
-- GENDER 칼럼에는 남 또는 여 라는 글자만 들어갈 수 있게 조건을 설정한 것이다.

INSERT INTO USER_CHECK VALUES (1, '유저01', '비번01', '신짱구', '남');

INSERT INTO USER_CHECK VALUES (2, '유저02', '비번02', '김철수', '남자');
/*
ORA-02290: check constraint (KH_T.SYS_C007304) violated
CHECK 제약 조건으로 남 또는 여 라는 글자만 들어갈 수 있게 조건을 설정해 놨는데,
남자 라는 글자가 들어와서 오류가 발생한 것이다.
*/

-- CHECK 사용 방법
--- 방법 1번: INDEX 에 따로 기록하지 않고, 조건 설정만 할 경우
---- 칼럼명 자료형(크기) CHECK(칼럼명 IN ('조건1', '조건2'));

--- 방법 2번: INDEX 에 기록하고, 조건 설정 할 경우(한 줄 작성)
---- 칼럼명 자료형(크기) CONSTRAINT 인데스에기록할이름 CHECK(칼럼명 IN ('조건1', '조건2'));

--- 방법 2-1번: INDEX 에 기록하고, 조건 설정 할 경우(여러 줄 작성)
---- 칼럼명 자료형(크기), 
----- CONSTRAINT 인데스에기록할이름 CHECK(칼럼명 IN ('조건1', '조건2'));