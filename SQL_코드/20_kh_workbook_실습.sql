/* 새로운계정 에 테이블 생성하기*/

create table company (company_id number primary key,
company_name varchar2(100) not null,
company_address varchar2(55),
company_phone varchar2(20));

-- alter table 기존테이블명 rename to 변경할테이블명;


-- 시퀀스를 생성할 때는 , 를 쓰지 않는다.

-- 방법1
create sequence company_seq;

-- 방법2
create sequence company_seq start with 1 increment by 1 nocache nocycle;


-- insert into
insert into company values (company_seq.nextval, '농심', '서울시 강남구', '02-1234-5678');
insert into company values (company_seq.nextval, '롯데', '서울시 송파구', '02-2345-6789');
insert into company values (company_seq.nextval, '해태', '서울시 중랑구', '02-9876-5432');
select * from company;

-- create table
create table snacks 
(snack_id number(10, 0) primary key,
snack_name varchar2(100) not null,
snack_price number(10, 2) not null,
company_id number(10, 0), 
constraint fk_ci 
foreign key(company_id) 
references company(company_id) 
on delete cascade);

select * from company;
select * from snacks;

-- create sequence
create sequence snacks_seq 
start with 1 
increment by 1 
nocache 
nocycle;

-- .nextval
insert into snacks values (snacks_seq.nextval, '오예스', 1500, 1);
insert into snacks values (snacks_seq.nextval, '칸쵸', 1220, 1);
insert into snacks values (snacks_seq.nextval, '빼빼로', 1100, 2);
insert into snacks values (snacks_seq.nextval, '초코파이', 2000, 2);

select * from snacks;

select * from snacks where snack_price >= 1500;
select * from company where company_address = '서울시 강남구';
select * from snacks where company_id = 1;
select company_id, company_name, snack_name, snack_price from company join snacks using(company_id) where company_id = 1;