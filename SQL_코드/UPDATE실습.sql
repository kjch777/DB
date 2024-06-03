/***** UPDATE 실습 *****/

UPDATE DEPARTMENT2 SET DEPT_TITLE = '인사팀' WHERE DEPT_ID = 'D1';
SELECT * FROM DEPARTMENT2 WHERE DEPT_ID = 'D1';

UPDATE DEPARTMENT2 SET DEPT_TITLE = '마케팅팀' WHERE DEPT_ID = 'D3';
SELECT * FROM DEPARTMENT2 WHERE DEPT_ID = 'D3';

UPDATE DEPARTMENT2 SET DEPT_TITLE = '기술지원팀' WHERE DEPT_ID = 'D8';
SELECT * FROM DEPARTMENT2 WHERE DEPT_ID = 'D8';

-- 수정한 내용을 저장하고 싶다면 COMMIT;
-- 저장하지 않겠다면 ROLLBACK;
COMMIT;

UPDATE EMPLOYEE2 SET BONUS = 0.1 WHERE BONUS IS NULL;
SELECT EMP_NAME, BONUS FROM EMPLOYEE2;

ROLLBACK;


UPDATE EMPLOYEE2 SET SALARY = SALARY + 1000000;
SELECT EMP_NAME, SALARY FROM EMPLOYEE2;
COMMIT;
ROLLBACK;

UPDATE EMPLOYEE2 SET BONUS = 0.4 WHERE DEPT_CODE = 'D9';
SELECT EMP_NAME, DEPT_CODE, BONUS FROM EMPLOYEE2 WHERE DEPT_CODE = 'D9';
COMMIT;
ROLLBACK;

UPDATE EMPLOYEE2 SET DEPT_CODE = 'D3' WHERE DEPT_CODE IS NULL;
SELECT EMP_NAME, DEPT_CODE FROM EMPLOYEE2 WHERE DEPT_CODE = 'D3';

UPDATE EMPLOYEE2 SET SALARY = SALARY * 1.1 WHERE HIRE_DATE > TO_DATE('2000-01-01', 'YYYY-MM-DD');
SELECT EMP_NAME, SALARY, HIRE_DATE FROM EMPLOYEE2 WHERE HIRE_DATE > TO_DATE('2000-01-01', 'YYYY-MM-DD');

UPDATE EMPLOYEE2 SET ENT_YN = 'Y' WHERE HIRE_DATE = TO_DATE('1997-09-12', 'YYYY-MM-DD');
SELECT EMP_NAME, ENT_YN FROM EMPLOYEE2 WHERE HIRE_DATE = TO_DATE('1997-09-12', 'YYYY-MM-DD');
ROLLBACK;

SELECT EMP_NAME, EMAIL FROM EMPLOYEE2;
UPDATE EMPLOYEE2 SET EMAIL = REPLACE(EMAIL, 'or.kr', 'kh.kh');
SELECT EMP_NAME, EMAIL FROM EMPLOYEE2;

-- LIKE 를 사용하여, 중간에 오는 010 은 변경하지 않고, 맨 앞에 오는 010 만 변경하기
update employee2 set phone = replace(phone, '010', '010-') where phone like '010%';
select emp_name, phone from employee2;
/*
EMPLOYEE2"."PHONE" (actual: 13, maximun: 12)
▶ 해당 행의 최대 크기를 12자리로 설정해놨기 때문에 발생하는 에러
▶ 해당 행의 최대 크기를 늘리거나, ROLLBACK;
*/

update employee2 set hire_date = to_date('2000-01-02', 'yyyy-mm-dd') where hire_date = to_date('1999-09-09', 'yyyy-mm-dd');

commit;

select * from department2;

update department2 set dept_title = '인사팀';
select * from department2;
rollback; -- rollback; 은 commit; 을 진행하기 전까지만 되돌릴 수 있다.

-- 여러 칼럼을 한 번에 UPDATE(수정) 하기
CREATE TABLE EMPLOYEE3 AS SELECT * FROM EMPLOYEE;

UPDATE EMPLOYEE3 SET EMAIL = 'moon@or.kr', phone = '01088887777' where emp_id = 200;
select emp_id, email, phone from employee3 where emp_id = 200;
rollback; -- rollback; 은 commit; 을 진행하기 전까지만 되돌릴 수 있다.

update employee3 set salary = salary * 1.1, bonus = 0.2 where dept_code = 'D9';
select dept_code, salary, bonus from employee3 where dept_code = 'D9';
rollback;

update employee3 set job_code = 'J5', dept_code = 'D5' where job_code = 'J3';
select job_code, dept_code from employee3 where job_code = 'J5';

update employee3 set emp_name = '신짱구', email = 'tlsWKd@or.kr' where emp_name = '송은희';
select emp_name, email from employee3 where emp_name = '신짱구';
rollback;

update employee3 set emp_name = '차승원', salary = 8000000 where emp_name = '차태연';
select emp_name, salary from employee3 where emp_name = '차승원';

update employee3 set EMAIL = REPLACE(EMAIL, 'or.kr', 'kh.kh'), dept_code = 'D4';
select email, dept_code from employee3;
rollback;

-- EMPLOYEE3 TABLE 의 칼럼 전체 삭제
DELETE FROM EMPLOYEE3;
-- 삭제 후 저장(완전 삭제) ▶ COMMIT;
-- 되돌리기(삭제 취소) ▶ ROLLBACK;
COMMIT;

DELETE FROM EMPLOYEE2;

SELECT * FROM EMPLOYEE2;

-- EMPLOYEE3 TABLE 자체를 삭제해버리기
DROP TABLE EMPLOYEE3;
DROP TABLE EMPLOYEE2;
COMMIT;