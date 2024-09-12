create table member 
(member_id number primary key,
member_name varchar2(50),
member_age number,
member_phone varchar2(50));

create sequence member_seq start with 1 increment by 1;

-- goods 테이블 시퀀스 생성하기
create table goods 
(goods_id number primary key, 
goods_name varchar2(100), 
goods_price number, 
goods_quantity number);

create sequence goods_seq start with 1 increment by 1;

-- 

create table drink
(drink_id number primary key,
drink_name varchar2(100),
drink_price number,
drink_quantity number);

create sequence drink_seq start with 1 increment by 1 nocache;

create table khmember 
(member_id number(4) primary key,
member_name varchar2(50) not null,
member_pw varchar2(50) not null,
member_email varchar2(100),
created_at date default sysdate);

create sequence khmember_seq start with 1 increment by 1;

UPDATE member
		SET member_name = '박세모',
			member_phone = '01012345678', -- number 는 맨 앞에 0 이 생략되기 때문에, '맨 앞에 0을 넣고 싶다면 이렇게 작은 따옴표 안에 작성한다.' 
			member_age = 30
		WHERE member_id = 6;
        
commit;

CREATE TABLE image_upload (
    id NUMBER PRIMARY KEY,
    file_name VARCHAR2(255) NOT NULL,
    upload_dir VARCHAR2(255) NOT NULL,
    upload_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE SEQUENCE image_upload_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;
    
COMMIT;

CREATE TABLE TODO_MEMBER (
    TODO_MEMBER_NO NUMBER PRIMARY KEY,
    ID VARCHAR2(50) NOT NULL,
    PW VARCHAR2(100) NOT NULL,
    NAME VARCHAR2(100) NOT NULL
);


CREATE SEQUENCE SEQ_TODO_MEMBER_NO;


CREATE TABLE TODO (
    TODO_NO NUMBER PRIMARY KEY,
    TITLE VARCHAR2(255) NOT NULL,
    IS_DONE CHAR(1) DEFAULT 'N' NOT NULL CHECK (IS_DONE IN ('Y', 'N')),
    TODO_MEMBER_NO NUMBER,
    CONSTRAINT FK_TODO_MEMBER FOREIGN KEY (TODO_MEMBER_NO) REFERENCES TODO_MEMBER(TODO_MEMBER_NO)
);


CREATE SEQUENCE SEQ_TODO_NO;

COMMIT;