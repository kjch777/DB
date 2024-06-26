/***** CREATE TABLE 실습 *****/

CREATE TABLE CUSTOMER 
(CUSTOMER_ID NUMBER(10, 0) PRIMARY KEY,
CUSTOMER_NAME VARCHAR2(100) NOT NULL,
CUSTOMER_EMAIL VARCHAR2(100) CONSTRAINT U_CE UNIQUE,
CUSTOMER_PHONE VARCHAR2(20),
CONSTRAINT U_CP UNIQUE(CUSTOMER_PHONE),
CUSTOMER_ADDRESS VARCHAR2(255));

COMMENT ON COLUMN CUSTOMER.CUSTOMER_ID IS '고객 아이디';
COMMENT ON COLUMN CUSTOMER.CUSTOMER_NAME IS '고객 이름';
COMMENT ON COLUMN CUSTOMER.CUSTOMER_EMAIL IS '고객 이메일';
COMMENT ON COLUMN CUSTOMER.CUSTOMER_PHONE IS '고객 전화번호';
COMMENT ON COLUMN CUSTOMER.CUSTOMER_ADDRESS IS '고객 주소';

/*
큰 따옴표 " " 를 사용하면, 그 안에 있는 문자열은 대/소문자를 구분하기 때문에 주의해야 한다.
*/

COMMIT;

CREATE TABLE PRODUCT 
(PRODUCT_ID NUMBER(10, 0) CONSTRAINT P_PI PRIMARY KEY,
PRODUCT_NAME VARCHAR2(100) NOT NULL,
PRODUCT_PRICE NUMBER(10, 2) NOT NULL,
PRODUCT_DESC VARCHAR2(200) CONSTRAINT U_PD UNIQUE);

INSERT INTO PRODUCT VALUES(1, '아메리카노', '3000', '신선한 원두로 만든 아메리카노');
INSERT INTO PRODUCT VALUES(2, '카페라떼', '2500', '부드러운 우유가 들어간 라떼');
INSERT INTO PRODUCT VALUES(3, '카푸치노', '3500', '진한 커피와 거품이 어우러진 카푸치노');
INSERT INTO PRODUCT VALUES(4, '카라멜 마키아토', '4000', '달콤한 카라멜 시럽이 들어간 마키아토');

COMMIT;

-- UNIQUE 와 PRIMARY KEY 의 차이점
--- UNIQUE 는 칼럼에서 NULL 값이 한 개까지는 허용된다.(2개 이상부터는 불가하다.)
--- PRIMARY KEY 는 NULL 값이 불가하고, 중복도 안 된다.

CREATE TABLE FOOD_COMPANY 
(COMPANY_ID NUMBER(10, 0) PRIMARY KEY,
COMPANY_NAME VARCHAR2(100) NOT NULL,
COMPANY_ADDRESS VARCHAR2(255),
COMPANY_PHONE VARCHAR2(20));

CREATE TABLE SNACKS 
(SNACK_ID NUMBER(10, 0) PRIMARY KEY,
SNACK_NAME VARCHAR2(100) NOT NULL,
SNACK_PRICE NUMBER(10, 2) NOT NULL,

COMPANY_ID NUMBER(10, 0), -- 이게 없으면
-- ORA-00904: "COMPANY_ID": invalid identifier 오류가 발생한다.
---> 부모 테이블의 칼럼명과 자식 테이블의 칼럼명은(이어져 있더라도) 서로 달라도 된다.

CONSTRAINT FK_COMPANY 
FOREIGN KEY(COMPANY_ID) 
REFERENCES FOOD_COMPANY(COMPANY_ID) ON DELETE CASCADE);

-- FOREIGN KEY(를 참조할 변수명)
---> 참조할 변수명(규칙명) 을 설정할 때, 규칙명은 모든 테이블을 통틀어서 동일한 이름을 쓸 수 없다.
----> FOREIGN KEY(참조할 변수명(규칙명)) 과 같은 이름을 가진 칼럼이 자식 테이블에 존재해야 한다.

COMMIT;
ROLLBACK;

---------------------------------------------------------------------------------

CREATE TABLE DRINK_COMPANY 
(DRINK_ID NUMBER(10, 0) PRIMARY KEY,
DRINK_NAME VARCHAR2(100) NOT NULL,
DRINK_ADDRESS VARCHAR2(255),
DRINK_PHONE VARCHAR2(20));

CREATE TABLE SOFTS 
(SOFTS_ID NUMBER(10, 0) PRIMARY KEY,
SOFTS_NAME VARCHAR2(100) NOT NULL,
SOFTS_PRICE NUMBER(10, 2) NOT NULL,
COMPANY_ID NUMBER(10, 0),
CONSTRAINT FK_COMPANY2
FOREIGN KEY(COMPANY_ID)
REFERENCES DRINK_COMPANY(DRINK_ID) ON DELETE CASCADE);

INSERT INTO DRINK_COMPANY VALUES(1, '코카콜라', '서울시 강남구', '02-1234-5678');
INSERT INTO DRINK_COMPANY VALUES(2, '펩시', '서울시 중랑구', '02-8765-4321');

INSERT INTO SOFTS VALUES(1, '콜라', '1500', 1);
INSERT INTO SOFTS VALUES(2, '사이다', '1200', 1);
INSERT INTO SOFTS VALUES(3, '스프라이트', '1000', 2);
INSERT INTO SOFTS VALUES(4, '마운틴듀', '2000', 2);