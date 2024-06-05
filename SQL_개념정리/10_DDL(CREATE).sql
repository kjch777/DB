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