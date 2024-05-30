-- 자동정렬 단축키: CTRL + F7
-- 작성한 시트 자체를 실행하는 단축키: F5

-- MENU TABLE 생성하기
CREATE TABLE menu (
    menu_id    NUMBER(10, 0) PRIMARY KEY, -- 메뉴 ID(기본 키)
    menu_name  VARCHAR2(100 BYTE),
    menu_desc  VARCHAR2(255 BYTE),
    menu_price NUMBER(10, 2)
);

-- 데이터 집어넣기
INSERT INTO menu (
    menu_id,
    menu_name,
    menu_desc,
    menu_price
) VALUES (
    1,
    '아메리카노',
    '신선한 원두로 만든 아메리카노',
    3000
);

INSERT INTO menu (
    menu_id,
    menu_name,
    menu_desc,
    menu_price
) VALUES (
    2,
    '카페라떼',
    '부드러운 우유가 들어간 카페라떼',
    3500
);

INSERT INTO menu (
    menu_id,
    menu_name,
    menu_desc,
    menu_price
) VALUES (
    3,
    '카푸치노',
    '진한 커피와 거품이 어우러진 카푸치노',
    3500
);

INSERT INTO menu (
    menu_id,
    menu_name,
    menu_desc,
    menu_price
) VALUES (
    4,
    '카라멜 마키아토',
    '달콤한 카라멜 시럽이 들어간 마키아토',
    4000
);

INSERT INTO menu (
    menu_id,
    menu_name,
    menu_desc,
    menu_price
) VALUES (
    5,
    '에스프레소',
    '강한 맛과 향의 에스프레소',
    2500
);


-- MENU TABLE 에서, MENU 이름 맨 앞이 카 인 MENU 출력
select menu_name from menu where menu_name like '카%';

-- MENU 가격이 3500 인 MENU 출력
select menu_name, menu_price from menu where menu_price = 3500;

-- 키오스크에서 1을 눌렀을 때 나올 MENU 출력
select menu_id, menu_name from menu where menu_id = 1;

-- 카라멜 이라는 단어가 포함된 MENU의 설명 조회하기
select menu_name, menu_desc from menu where menu_name like '%카라멜%';

-- 가격이 낮은 순으로 MENU 조회하기
select * from menu order by menu_price asc;