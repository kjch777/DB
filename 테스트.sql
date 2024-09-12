create table userMember(us_id number(4) primary key, us_email varchar2(100));

create sequence userMember_seq;

CREATE TABLE goods_items (
    item_id NUMBER PRIMARY KEY,
    item_name VARCHAR2(100) NOT NULL,
    item_description VARCHAR2(500)
);

CREATE SEQUENCE goods_items_seq;

INSERT INTO goods_items (item_id, item_name, item_description)
VALUES (1, '야구공', '야구공 상품의 설명입니다.');

commit;

create table members(
member_id number(4) primary key,
username varchar2(50) not null,
password varchar2(50) not null,
email varchar2(100),
created_at DATE default SYSDATE
);

create sequence members_seq start with 1 increment by 1;

commit;

insert into members(member_id, username, password, email, created_at) values (members_seq.nextval, 'semo', 'semo1234', 'semo@kh.kh', sysdate);
insert into members(member_id, username, password, email) values (members_seq.nextval, 'nemo', 'nemo9876', 'nemo@kh.kh');
insert into members(member_id, username, password, email) values (members_seq.nextval, 'momo', 'momo1234', 'momo@kh.kh');
insert into members(member_id, username, password, email) values (members_seq.nextval, 'test_user', 'test_password', 'test_user@example.com');

rollback;

update members set email = 'nemo@kh.com' where username = 'nemo';
update members set email = 'updated_user@example.com' where username = 'test_user';
update members set password = 'new_password' where username = 'test_user';
update members set created_at = sysdate where username = 'test_user';

delete members where created_at < '2024-07-07';
delete members where email = 'updated_user@example.com';
delete members where created_at < '2023-01-01';

select * from members;
select * from members where substr(email, 1, 2) = 'se';
select * from members where username like 's%';

--------------------------------------------------------------------------------
create table products(
product_id number(10), 
product_name varchar2(25), 
price number(10), 
stock number(10)
);

create table orders(
order_id number(10), 
member_id number(10), 
product_id number(10), 
quantity number(10), 
order_date date
);

create sequence products_seq start with 1 increment by 1;

create sequence orders_seq start with 1 increment by 1;

INSERT INTO members (member_id, username, password, email, created_at)
VALUES (members_seq.NEXTVAL, '강숙', 'kim1234', 'kimseok@example.com', SYSDATE);

INSERT INTO members (member_id, username, password, email, created_at)
VALUES (members_seq.NEXTVAL, '이민숙', 'lee9876', 'leemin@example.com', SYSDATE);

INSERT INTO members (member_id, username, password, email, created_at)
VALUES (members_seq.NEXTVAL, '박진수', 'park5678', 'parkjin@example.com', SYSDATE);

INSERT INTO members (member_id, username, password, email, created_at)
VALUES (members_seq.NEXTVAL, '최우석', 'choi1234', 'choisoo@example.com', SYSDATE);

INSERT INTO products (product_id, product_name, price, stock)
VALUES (products_seq.NEXTVAL, '삼성 TV', 1000000, 10);

INSERT INTO products (product_id, product_name, price, stock)
VALUES (products_seq.NEXTVAL, 'LG 냉장고', 800000, 5);

INSERT INTO products (product_id, product_name, price, stock)
VALUES (products_seq.NEXTVAL, '다이슨 청소기', 500000, 20);

INSERT INTO products (product_id, product_name, price, stock)
VALUES (products_seq.NEXTVAL, '애플 아이폰', 1200000, 15);

INSERT INTO orders (order_id, member_id, product_id, quantity, order_date)
VALUES (orders_seq.NEXTVAL, 1, 1, 1, SYSDATE);

INSERT INTO orders (order_id, member_id, product_id, quantity, order_date)
VALUES (orders_seq.NEXTVAL, 1, 2, 1, SYSDATE);

INSERT INTO orders (order_id, member_id, product_id, quantity, order_date)
VALUES (orders_seq.NEXTVAL, 2, 3, 2, SYSDATE);

INSERT INTO orders (order_id, member_id, product_id, quantity, order_date)
VALUES (orders_seq.NEXTVAL, 3, 4, 1, SYSDATE);

INSERT INTO orders (order_id, member_id, product_id, quantity, order_date)
VALUES (orders_seq.NEXTVAL, 4, 1, 1, SYSDATE);

INSERT INTO orders (order_id, member_id, product_id, quantity, order_date)
VALUES (orders_seq.NEXTVAL, 4, 2, 1, SYSDATE);


1. 각 회원이 주문한 서로 다른 상품 종류의 수를 조회하세요.
select count(distinct product_id) as "주문한 상품 종류의 수" from orders;

1-1. username이 '강숙'인 회원이 주문한 상품의 이름, 가격, 주문 날짜를 조회하세요..
select product_name, price, order_date from members join orders using (member_id) join products using (product_id) where username = '강숙';

1-2. username이 '이민숙'인 회원이 2023년 1월 1일부터 2023년 12월 31일까지 주문한 총 금액을 조회하세요.
select price * quantity as "총 금액" from members join orders using (member_id) join products using (product_id) where username = '이민숙' and order_date between to_date('23/01/01', 'yy/mm/dd') and to_date('23/12/31', 'yy/mm/dd');



2.각 products 테이블에서 가격이 가장 높은 순으로 상품 이름과 가격을 조회하세요.
select product_name, price from products order by price desc;

2-1. product_name이 '삼성 TV'인 상품을 주문한 회원들의 이름, 이메일, 주문 날짜를 조회하세요.
select username, email, order_date from members join orders using (member_id) join products using (product_id) where product_name = '삼성 TV';

2-2. 각 월별로 주문된 상품의 총 금액을 조회하세요.
select price * quantity as "총 금액" from orders join products using (product_id)


3. 2023년 6월 1일부터 2023년 6월 30일까지의 주문 내역을 조회하세요.
select * from orders where order_date between to_date('23/06/01', 'yy/mm/dd') and to_date('23/06/30', 'yy/mm/dd');

3-1. 'LG 냉장고'를 2개 이상 주문한 회원의 이름과 주문 수량을 조회하세요.
select username, quantity from members join orders using (member_id) join products using (product_id) where product_name = 'LG 냉장고' and quantity >= 2;

3-2. 회원별 첫 번째 주문과 마지막 주문의 날짜를 조회하시오.
select


4. 각 회원의 주문 평균 수량을 조회하세요.
select round(avg(quantity)) as "평균 수량" from orders;

4-1. products 테이블에서 재고가 10개 이하인 상품의 이름과 재고 수량을 조회하세요.
select distinct product_name, stock from products join orders using (product_id) where stock <= 10;

4-2. 2023년 7월 1일에 주문된 모든 상품의 이름, 가격, 주문 수량을 조회하세요.
select product_name, price, quantity, order_date from products join orders using (product_id) where to_date(order_date, 'yy/mm/dd') = '24/06/18';

1. 각 회원이 주문한 서로 다른 상품 종류의 수를 조회하세요.
SELECT m.username, COUNT(DISTINCT o.product_id) AS unique_products_count

FROM members m

JOIN orders o ON m.member_id = o.member_id

GROUP BY m.username;



1-1. username이 '강숙'인 회원의 최근 주문한 상품의 이름, 가격, 주문 날짜를 조회하세요.

SELECT p.product_name, p.price, o.order_date

FROM orders o

JOIN members m ON o.member_id = m.member_id

JOIN products p ON o.product_id = p.product_id

WHERE m.username = '강숙'

ORDER BY o.order_date DESC

FETCH FIRST 1 ROW ONLY;



1-2. username이 '이민숙'인 회원이 2023년 1월 1일부터 2023년 12월 31일까지 주문한 총 금액을 조회하세요.

SELECT SUM(p.price * o.quantity) AS total_amount

FROM orders o

JOIN members m ON o.member_id = m.member_id

JOIN products p ON o.product_id = p.product_id

WHERE m.username = '이민숙'

AND o.order_date BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-12-31', 'YYYY-MM-DD');



2. 각 products 테이블에서 가격이 가장 높은 순으로 상품 이름과 가격을 조회하세요.

SELECT product_name, price

FROM products

ORDER BY price DESC;



2-1. product_name이 '삼성 TV'인 상품을 주문한 회원들의 이름, 이메일, 주문 날짜를 조회하세요.

SELECT m.username, m.email, o.order_date

FROM orders o

JOIN members m ON o.member_id = m.member_id

JOIN products p ON o.product_id = p.product_id

WHERE p.product_name = '삼성 TV';



2-2. 각 월별로 주문된 상품의 총 금액을 조회하세요.

SELECT TO_CHAR(o.order_date, 'YYYY-MM') AS month, SUM(p.price * o.quantity) AS total_amount

FROM orders o

JOIN products p ON o.product_id = p.product_id

GROUP BY TO_CHAR(o.order_date, 'YYYY-MM')

ORDER BY month;



3. 2023년 6월 1일부터 2023년 6월 30일까지의 주문 내역을 조회하세요.

SELECT o.order_id, o.member_id, o.product_id, o.quantity, o.order_date

FROM orders o

WHERE o.order_date BETWEEN TO_DATE('2023-06-01', 'YYYY-MM-DD') AND TO_DATE('2023-06-30', 'YYYY-MM-DD');



3-1. 'LG 냉장고'를 2개 이상 주문한 회원의 이름과 주문 수량을 조회하세요.

SELECT m.username, o.quantity

FROM orders o

JOIN members m ON o.member_id = m.member_id

JOIN products p ON o.product_id = p.product_id

WHERE p.product_name = 'LG 냉장고'

AND o.quantity >= 2;



3-2. 회원별 첫 번째 주문과 마지막 주문의 날짜를 조회하시오.

SELECT m.username, MIN(o.order_date) AS first_order_date, MAX(o.order_date) AS last_order_date

FROM orders o

JOIN members m ON o.member_id = m.member_id

GROUP BY m.username;



4. 각 회원의 주문 평균 수량을 조회하세요.

SELECT m.username, AVG(o.quantity) AS average_quantity

FROM orders o

JOIN members m ON o.member_id = m.member_id

GROUP BY m.username;



4-1. products 테이블에서 재고가 10개 이하인 상품의 이름과 재고 수량을 조회하세요.

SELECT product_name, stock

FROM products

WHERE stock <= 10;



4-2. 2023년 7월 1일에 주문된 모든 상품의 이름, 가격, 주문 수량을 조회하세요.

SELECT p.product_name, p.price, o.quantity

FROM orders o

JOIN products p ON o.product_id = p.product_id

WHERE o.order_date = TO_DATE('2023-07-01', 'YYYY-MM-DD');

