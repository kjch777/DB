create table users 
(user_id number not null, 
user_name varchar2(50) not null, 
user_email varchar2(100) not null, 
user_pw varchar2(100) not null, 
created_date date default SYSDATE);

create sequence users_seq;

insert into users(user_id, user_name, user_email, user_pw) values(users_seq.nextval, '신짱구', 'shin@example.com', 'password123');
insert into users(user_id, user_name, user_email, user_pw) values(users_seq.nextval, '김철수', 'kim@example.com', 'mypassword0');
insert into users(user_id, user_name, user_email, user_pw) values(users_seq.nextval, '이훈이', 'lee@example.com', 'securepw');

create table board
(post_id number not null,
user_id number not null,
title varchar2(200) not null,
content clob not null,
created_date date default SYSDATE);

create sequence board_seq;
create sequence board_seq2;

insert into board(post_id, user_id, title, content) values(board_seq.nextval, board_seq2.nextval, '첫번째 게시물', '이것은 첫번째 게시물의 내용입니다.');
insert into board(post_id, user_id, title, content) values(board_seq.nextval, board_seq2.nextval, '두번째 게시물', '이것은 두번째 게시물의 내용입니다.');
insert into board(post_id, user_id, title, content) values(board_seq.nextval, board_seq2.nextval, '세번째 게시물', '이것은 세번째 게시물의 내용입니다.');