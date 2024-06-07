/* SEQUENCE(순서, 연속)
--  순차적으로 일정한 간격의 숫자(번호) 를 발생시키는 객체이다.(자동 번호 생성기 같은 느낌이다.)

    PK 가 지정된 칼럼에 삽입될 값을 생성할 때 이용하면 편리하다.
    ex) 1번째 회원, 2번째 회원, 3번째 회원, ..., n번째 회원
    
    작성법
        CREATE SEQUENCE 시퀀스이름
        [START WITH 숫자] ◀ 처음 발생시킬 시작 값 설정 (생략하면 자동으로 1 이 기본값으로 설정된다.)
        [INCREMENT BY 숫자] ◀ 다음 값에 대한 증가 값을 설정 (생략하면 자동으로 1 씩 증가하게 된다.)
        [MAXVALUE 숫자 | NOMAXVALUE] ◀ 발생시킬 최대 값을 설정 (예를 들어 최대 100 명까지만 기록하겠다.)
        [MINVALUE 숫자 | NOMINVALUE] ◀ 발생시킬 최소 값을 설정 (예를 들어 10 번부터 다시 시작하겠다.)
        [CYCLE | NOCYCLE] ◀ 값 순환 여부 설정
        
        [CACHE 바이트크기 | NOCACHE] ◀ 캐시 메모리의 기본 값은 20 BYTE, 최소값은 2 BYTE 이다.
            시퀀스의 캐시 메모리는 미리 할당된 크기만큼 다음 값을 생성하여 저장해둔다.
            시퀀스 호출 시 미리 저장되어진 값들을 가져와 반환하므로,
            매번 시퀀스를 생성하여 반환하는 것보다 DB 의 속도를 향상시킬 수 있다.
            
    사용 방법
        시퀀스명.NEXTVAL: 다음 시퀀스 번호를 가져온다.
        
        시퀀스명.CURRVAL: 현재 시퀀스 번호를 가져온다.
            (주의사항: 시퀀스가 생성되자마자 호출할 경우, 오류가 발생할 수 있다.
             이 경우, 마지막으로 호출한 NEXTVAL 값을 반환할 수 있다.)
*/

-- 시퀀스 생성하기
CREATE TABLE TB_TEST (TEST_NO NUMBER PRIMARY KEY, -- NUMBER 의 크기 지정을 따로 하지 않을 경우, 자동으로 ORACLE 에서 지정한 최대 값(38자리) 이 설정된다.
TEST_NAME VARCHAR2(30) NOT NULL);

CREATE SEQUENCE SEQ_TEST_NO 
START WITH 100 -- 시작 번호 100
INCREMENT BY 5 -- NEXTVAL 호출할 때마다 5씩 증가
MAXVALUE 150 -- 증가 가능한 최대 값 150
NOMINVALUE -- 최소 값 없음
NOCYCLE -- 반복 없음
NOCACHE; -- 미리 생성해 둘 시퀀스 번호 없음

-- ▲ START ~ NOCACHE 까지 모두 생략 가능하다.
--- 생략할 경우, SQL 에서 설정한 기본 값이 자동으로 매겨진다.

INSERT INTO TB_TEST VALUES (SEQ_TEST_NO.NEXTVAL, '신짱구');
SELECT * FROM TB_TEST;

INSERT INTO TB_TEST VALUES (SEQ_TEST_NO.NEXTVAL, '김철수');

INSERT INTO TB_TEST VALUES (SEQ_TEST_NO.NEXTVAL, '신짱아');
SELECT * FROM TB_TEST;

-- 시퀀스 값 변경 ▶ ALTER
--- CREATE 구문과 똑같지만, START/WITH 옵션은 제외된다.
/* 
작성법
    CREATE SEQUENCE 시퀀스이름
        [INCREAMENT BY 숫자] ◀ 다음 값에 대한 증가 값을 설정 (생략하면 자동으로 1 씩 증가하게 된다.)
        [MAXVALUE 숫자 | NOMAXVALUE] ◀ 발생시킬 최대 값을 설정 (예를 들어 최대 100 명까지만 기록하겠다.)
        [MINVALUE 숫자 | NOMINVALUE] ◀ 발생시킬 최소 값을 설정 (예를 들어 10 번부터 다시 시작하겠다.)
        [CYCLE | NOCYCLE] ◀ 값 순환 여부 설정
        
        [CACHE 바이트크기 | NOCACHE] ◀ 캐시 메모리의 기본 값은 20 BYTE, 최소값은 2 BYTE 이다.
            시퀀스의 캐시 메모리는 미리 할당된 크기만큼 다음 값을 생성하여 저장해둔다.
            시퀀스 호출 시 미리 저장되어진 값들을 가져와 반환하므로,
            매번 시퀀스를 생성하여 반환하는 것보다 DB 의 속도를 향상시킬 수 있다.
*/

ALTER SEQUENCE SEQ_TEST_NO MAXVALUE 200;