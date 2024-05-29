/*
아래는 테이블을 만들 때, NULL 값이 들어갈 수 있도록 허용한 칼럼에서만 가능한 방법이다.
(널이 아님에 체크를 해주지 않은 칼럼에서만 가능하다.
 널이 아님에 체크를 해준 칼럼에서는 값을 필수로 넣어주어야 한다.)
 
예를 들어, 회원가입을 할 때 아이디, 이름, 이메일, 전화번호, 주소, 기념일 항목이 있을 때,
기념일은 널이 아님 체크를 해주지 않는 식이다.

INSERT 에서, 값을 선택하여 넣을 수 있는 칼럼이라면,

INSERT 다음에 값을 집어넣는 공간 ( ) 에
선택해서 넣을 수 있는 칼럼명을 지워주거나 또는 작성하지 않은 다음,

VALUES 다음에 값을 집어넣는 공간 ( ) 에도
값을 추가하지 않으면 된다.
*/

/*
공백이나 띄어쓰기에 관계없이, 원하는 SQL 구문을 전부 드래그해서 실행해 주어도 된다.
*/
INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time) VALUES (2, '커피빈', '서울시 강남구 역삼동', '02-555-5555', '영업시간: 12:00 ~ 14:00');

INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time) VALUES (3, '바나프레소', '경기도 하남시 숭례동', '031-333-3333', '영업시간: 15:00 ~ 17:00');

INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time) VALUES (4, '스타벅스', '인천시 남동구 창룡동', '032-888-8888', '영업시간: 10:00 ~ 18:00');

INSERT INTO kh_cafe (c_id, c_name, c_address, c_time) VALUES (5, '메가커피', '서울시 강남구 역삼동', '영업시간: 10:00 ~ 13:00');

INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time) VALUES (6, '할리스커피', '서울시 종로구 효로동', '02-111-2222', '영업시간: 08:00 ~ 22:00');
INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time) VALUES (7, '이디야커피', '서울시 동대문구 장안동', '02-2222-3333', '영업시간: 10:00 ~ 20:00');
INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time) VALUES (8, '탐앤탐스', '서울시 송파구 잠실동', '02-333-4444', '영업시간: 09:00 ~ 21:00');

-- 저장된 내용 보기
SELECT * FROM kh_cafe;

/*
SELECT: 저장된 데이터를 눈으로 보고싶을 때 사용한다.
    ▶ 로그인, 게시판 글 가져오기, 회원정보 조회, 회사 내의 직원정보 조회, 급여 내역, 스터디 명단 조회 등의 경우에 사용한다.
    
    SELECT 어떤칼럼을볼지설정 FROM 어느테이블에서가져올지테이블명작성;
    
    한 테이블에 있는 모든 칼럼을 보려면
    SELECT * FROM 테이블명;
    
    한 테이블에서 특정한 칼럼만 보려면
    SELECT 특정칼럼명 FROM 테이블명;
    
    한 테이블에서 특정한 칼럼들만 보려면
    SELECT 특정칼럼명, 특정칼럼명 FROM 테이블명;
*/
SELECT C_NAME FROM KH_CAFE;

SELECT c_address FROM kh_cafe;

SELECT C_NAME, C_ADDRESS FROM KH_CAFE;

SELECT * FROM MEMBER;
SELECT m_name FROM member;
SELECT m_name, m_age FROM member;

SELECT m_name AS 멤버이름, m_phone AS 멤버번호 FROM member;
-- AS: ALIAS 별칭 이라는 뜻의 영단어 줄임말이다.

SELECT c_name AS 카페이름, c_phone AS 카페번호 FROM KH_CAFE;