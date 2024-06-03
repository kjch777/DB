---------- INSERT ----------

CREATE TABLE EMPLOYEE2 AS SELECT * FROM EMPLOYEE;
create table department2 as select * from department;

INSERT INTO EMPLOYEE2 VALUES (223, '김영수', '850101-1234567', 'kim_ys@or.kr', '01012345678', 'D1', 'J4', 'S2', 3500000, 0.1, 200, '15/06/20', null, 'N');
-- ▲ insert into 테이블명 (칼럼명1, 칼럼명2, ...) values (칼럼값1, 칼럼값2, ...); 형식을 사용해도 상관없다.
insert into department2 values ('D10', '연구개발부', 'L6');
/*
오류 보고 -
SQL 오류: ORA-12899: value too large for column "KH_T"."DEPARTMENT2"."DEPT_ID" (actual: 3, maximum: 2)

▲ 칼럼의 최대 크기가 2Byte로, 영어 또는 숫자 2글자까지만 가능하지만, 3글자를 입력하려 했기 때문에 에러가 발생한 것이다.
▶ department2 테이블에서 'dept_id' 에 해당하는 칼럼의 크기를 2에서 3으로 늘려주거나, 
  데이터 유형을 char에서 varchar2 로 변경하여 크기를 255까지 늘려주는 방법을 쓸 수 있다. 
  varchar2 는 알아서 공간의 크기를 조정한다.
  char 는 공간 크기를 알아서 조정하지 못하기 때문에, 처음부터 크기를 잘 지정해 주어야 한다.
*/

INSERT INTO EMPLOYEE2 VALUES (224, '이수진', '900101-2345678', 'lee_sj@or.kr', '01098765432', 'D2', 'J2', 'S3', 3000000, 0.15, 201, '16/07/01', null, 'N');
-- ▲ insert into 테이블명 (칼럼명1, 칼럼명2, ...) values (칼럼값1, 칼럼값2, ...); 형식을 사용해도 상관없다.
INSERT INTO DEPARTMENT2 VALUES ('D11', '품질관리부', 'L7');


---------- UPDATE ----------

UPDATE EMPLOYEE2 SET EMAIL = 'sun_di_updated@or.kr', phone = '01012345678' where emp_id = 200;
update EMPLOYEE2 set salary = salary * 1.10, bonus = bonus + 0.05 where dept_id = 'D1';
update employee2 set job_code = 'J5', dept_code = 'D3' where job_code = 'J2';
update employee2 set salary = salary * 1.05, bonus = bonus + 0.02 where hire_date > to_date ('2000-01-01', 'yyyy-mm-dd');
update employee2 set manager_id = 210, dept_code = 'D5' where manager_id = 200;
update employee2 set email = replace('or.kr', 'company.com'), phone = substr(phone, 1, 3) || '-' || substr(phone, 4, 4) || '-' || substr(phone,8);
update employee2 set salary = 4000000, job_code = 'J4' where sal_level = 'S3';
update employee2 set ent_date = to_date('2024-09-12', 'yyyy-mm-dd'), ent_yn = 'Y' where hire_date = to_date('1997-09-12', 'yyyy-mm-dd');
update employee2 set emp_name = '김영호', email = 'kim_yh@or.kr' where emp_name = '김영수';
update employee2 set phone = '01198765432', email = 'song_jk_updated@or.kr' where phone = '01045686656';
update employee2 set bonus = 0.2, salary = 3200000 where bonus = 0.1;
update employee2 set salary = 3800000, dept_code = 'D7' where emp_no = '861015-1356452';