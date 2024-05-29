-- 한줄 주석 작성하기 단축키 ctrl + /
/* 여러줄 주석 작성하기*/

-- CMD 창에서 대표 관리자의 권한으로 SQL 에 접속하는 명령어
/*
  sqlplus: 오라클 데이터 베이스에서 제공하는 명령줄 도구이다.
      sys: 시스템(system) 의 단축어

as sysdba: 시스템 데이터 베이스 어드민(SYStem Data Base Admin)
설치할 때 작성한 비밀번호 그대로 설정하기
비밀번호는 입력하더라도 어떠한 표시도 눈에 보이지 않는다.
*/
sqlplus sys as sysdba;

-- 기존에는 계정을 생성하기 위해 ALTER 를 이용하여
-- SCRIPT TRUE 로 변경해 주어야만 했다.
-- 최신 버전부터는 하지 않아도 된다.
/*
  ALTER: 어떠한 상황을 변경하는 SQL 명령어이다.
SESSION: 사용자가 로그인해서 명령을 실행하고, 연결된 상태를 의미한다.
    SET: 무엇을 변경할 것인지 선택하겠다는 의미이다.
"_ORACLE_SCRIPT": DB 코드 작성
            TRUE: 허용하겠다.
*/
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- 계정 생성 방법
/*
       CREATE: 생성
         USER: 사용자
      아이디명: 사용자 이름
IDENTIFIED BY: 생성한 사용자 계정에 대한 비밀번호를 설정하는 코드
      비밀번호: 설치할 때 설정했던 비밀번호 입력
*/
CREATE USER 아이디명 IDENTIFIED BY 비밀번호;

-- 생성된 계정에 접속 및 기본 자원 관리 권한 추가하기
/*
  GRANT: 사용자에게 특정 권한이나 역할을 부여하기 위한 명령어
CONNECT: 사용자가 데이터 베이스에 접속할 수 있게 권한 부여
    ▶ KH학원 T반에 들어올 수 있는 권한

RESOURCE: 테이블, 인덱스, 뷰 등을 생성할 수 있는 권한
    ▶ T반 안에서 특정 행동이나 만들기, 변경, 설정등을 할 수 있는 권한

이외에도 여러가지 권한이 있으며, 
여러개의 권한을 한 번에 작성하고자 할 때는 , 를 사용하여 구분지어 작성해줄 수 있다.

TO 아이디명: 어떤 아이디에 권한을 줄 것인지 설정하겠다는 의미이다.
*/
GRANT CONNECT, RESOURCE TO 아이디명;

/*
테이블 생성하기

테이블이란 데이터 베이스에서, 모든 데이터를 포함하는 공간이다.
    테이블명: 중점이 되어, 중점과 관련된 내용을 설정할 수 있도록 작성
    
생성하는 방법
CREATE TABLE 테이블명 (칼럼명 데이터타입);
*/

-- 직원 테이블 생성하기
CREATE TABLE 직원 (직원번호 NUMBER(4), 직원이름 VARCHAR2(10));

/*
데이터 타입
      NUMBER: 숫자 값
    VARCHAR2: 문자열. String 과 똑같은 용법을 가지고 있다.
*/

-- INSERT 를 사용하여 데이터 추가하기
/*
데이터를 추가할 때는, INSERT 를 작성해 준다.

작성 방법
    INSERT INTO 테이블명 (칼럼명1, 칼럼명2, 칼럼명3, ...) VALUES (칼럼에해당하는값1, 칼럼에해당하는값2, 칼럼에해당하는값3, ...);
*/
INSERT INTO MEMBER (M_ID, M_NAME, M_AGE, M_PHONE, M_DATE) VALUES (1, '신짱구', '5', '01012345678', '2024-05-01');

CREATE TABLE MEMBER 
(
  M_ID NUMBER(10, 0) 
, M_NAME VARCHAR2(255 BYTE) 
, M_AGE VARCHAR2(20 BYTE) 
, M_PHONE VARCHAR2(11 BYTE) 
, M_DATE VARCHAR2(255 BYTE) 
) 

INSERT INTO MEMBER (M_ID, M_NAME, M_AGE, M_PHONE, M_DATE) VALUES (2, '봉미자', '22', '01012345679', '2024-05-02');

INSERT INTO MEMBER (M_ID, M_NAME, M_AGE, M_PHONE, M_DATE) VALUES (3, '신형만', '35', '01002345679', '2024-05-03');

INSERT INTO MEMBER (M_ID, M_NAME, M_AGE, M_PHONE, M_DATE) VALUES (4, '이유리', '5', '01098765432', '2024-05-04');

INSERT INTO MEMBER (M_ID, M_NAME, M_AGE, M_PHONE, M_DATE) VALUES (5, '김철수', '5', '01098765431', '2024-05-05');

INSERT INTO MEMBER (M_ID, M_NAME, M_AGE, M_PHONE, M_DATE) VALUES (6, '봉미소', '15', '01008765432', '2024-05-06');

-- KH CAFE 추가하기
INSERT INTO kh_cafe (C_ID, C_NAME, C_ADDRESS, C_PHONE, C_TIME) VALUES (1, '카페베네', '경기도 수원시 팔달구', '031-238-7736', '영업시간: 09:00 ~ 18:00');