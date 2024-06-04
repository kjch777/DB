/*
SELECT 절 정리(맨 앞의 숫자는 해석 순서이다.)
    5 SELECT 칼럼명1, 칼럼명2 AS "별칭", 칼럼명3, ... 
    1 FROM 참조할테이블명 
    2 WHERE 칼럼명 | 함수식, 비교연산자, 비교값 등등...;
    3 GROUP BY 그룹을 묶을 칼럼명
    4 HAVING 그룹함수식, 비교연산자, 비교값 등등...;
    6 ORDER BY 칼럼명 | 별칭 | 칼럼순번 등등... 정렬방식;
    
SELECT WHERE 절까지만 존재할 경우
    3 SELECT 칼럼명 ◀ 가장 마지막 순서에 결과를 보여주겠다.
    1 FROM 테이블명
    2 WHERE 조건식
    
SELECT ORDER BY 절까지만 존재할 경우 (WHERE 절이 없을 때)
    2 SELECT 칼럼명
    1 FROM 테이블명
    3 ORDER BY 정렬기준
    
SELECT ORDER BY 절까지만 존재할 경우 (WHERE 절이 있을 때)
    3 SELECT 칼럼명
    1 FROM 테이블명
    2 WHERE 조건식
    4 ORDER BY 정렬기준
    
GROUP BY 절 정리
    같은 값들이 여러개 기록된 칼럼을 가지고, 그 같은 값들을 하나의 그룹으로 묶은 것이다.
    여러개의 값을 묶어 하나로 처리할 목적으로 사용하며, 그룹으로 묶은 값에 대하여 SELECT 절에서 그룹 함수를 사용한다.
    그룹 함수는 단 한개의 결과 값만 산출해내기 때문에, 그룹이 여러개일 경우 오류가 발생한다.
    따라서 여러개의 결과 값을 산출해내기 위하여 그룹 함수가 적용된 그룹의 기준을 ORDER BY 절에 기술해 사용한다.
*/

SELECT DEPT_CODE, SUM(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE;
/*
SELECT DEPT_CODE, SUM(SALARY): 부서코드와, 각 부서 별 급여의 합계를 선택한 것
GROUP BY DEPT_CODE: 부서코드를 기준으로 그룹을 생성한다.
                    동일한 부서코드를 가진 사람들을 하나의 그룹으로 묶고,
                    각 그룹에 급여 합계 SUM(SALARY) 를 적용하여,
                    해당 부서의 모든 직원의 급여의 합계를 계산한 것이다.

(NULL): 빈 칸
NUL	5210000
D1	7820000
D9	17700000
D5	15760000
D6	10100000
D2	6520000
D8	6986240
*/

SELECT DEPT_CODE AS "부서코드", COUNT(*) AS "보너스 수령자" FROM EMPLOYEE WHERE BONUS IS NOT NULL GROUP BY DEPT_CODE ORDER BY 부서코드;
/*
GROUP BY 절의 해석 순서는 SELECT 절의 해석 순서보다 앞 이므로, 별칭을 사용할 수 없다.
ORDER BY 절의 해석 순서는 SELECT 절의 해석 순서보다 뒤 이므로, 별칭을 사용할 수 있다.

NUL	1
D1	2
D9	1
D5	2
D6	1
D8	2
*/

SELECT DEPT_CODE AS "부서코드", FLOOR(AVG(SALARY)) AS "급여평균" FROM EMPLOYEE WHERE DEPT_CODE IN ('D5', 'D6') GROUP BY DEPT_CODE;
-- GROUP BY 절의 해석 순서는 SELECT 절의 해석 순서보다 앞 이므로, 별칭을 사용할 수 없다.

-- 여러 칼럼을 묶어 그룹으로 지정 가능하다.

-- GROUP BY 사용 시 주의 사항
--> SELECT 절에 GROUP BY 절을 사용할 경우,
--  SELECT 절에 명시한 조회하고자 하는 칼럼 중, 그룹 함수가 적용되지 않은 칼럼은 모두 GROUP BY 절에 작성해야 한다.
/*
만약 그렇게 하지 않을 경우,
ORA-00979: not a GROUP BY expression
00979. 00000 -  "not a GROUP BY expression"
이라는 문제가 발생한다.
*/
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE, JOB_CODE ORDER BY DEPT_CODE;
/*
D1	J6	6440000
D1	J7	1380000
D2	J4	6520000
D5	J3	3500000
D5	J5	8460000
D5	J7	3800000
D6	J3	7300000
D6	J4	2800000
D8	J6	6986240
D9	J1	8000000
D9	J2	9700000
NUL	J6	2320000
NUL	J7	2890000
*/

/*
WHERE 절: 지정된 테이블에서, 어떤 행을 조회 결과로 삼을 것인지에 대한 조건을 지정하는 구문이다.
         (테이블 안에서, 어떤 특정 칼럼만 뽑아 사용하겠다는 조건문)

HAVING 절: 그룹 함수로 구해 올 그룹에 대한 조건을 설정할 때 사용한다.
          (그룹에 대한 조건, 어떤 특정 그룹만 조회하겠다는 조건문)
*/

--> 급여가 3백만원 이상인 사원들만 추려서, 각 부서의 평균 급여를 계산한 것이다.
SELECT DEPT_CODE, AVG(SALARY) FROM EMPLOYEE WHERE SALARY >= 3000000 GROUP BY DEPT_CODE ORDER BY DEPT_CODE;
/*
D1	3660000
D5	3630000
D6	3650000
D9	5900000

D6	3366666.66666666666666666666666666666667
D9	5900000
*/
--> 모든 직원들을 대상으로 그룹화하여, 각 부서 별로 평균 급여를 계산한 것이다.
---> HAVING 절을 이용하여, 계산된 평균 급여가 3백만원 이상인 부서만 필터링한 것이다.
----> 모든 급여를 고려하여 평균을 계산한 다음, 조건에 맞는 결과만 필터링한 것이다.
SELECT DEPT_CODE, AVG(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE HAVING AVG(SALARY) >= 3000000 ORDER BY DEPT_CODE;

/*
 WHERE 절: 조건에 맞는 값만 가지고 온 다음 보여준다.
HAVING 절: 모든 값을 확인하고, 조건에 부합하는 그룹만 보여준다.
*/

-- 집계 함수(ROLLUP, CUBE)
-- 그룹 별로 산출한 결과 값의 집계를 계산하는 함수이다.
-- GROUP BY 절에서만 작성할 수 있는 함수로,
-- WHERE, ORDER BY, SELECT 절에서 사용하지 않고, GROUP BY 절에서만 작성한다.

-- ROLLUP 함수: 그룹 별로 중간 집계를 처리하는 함수이다.
-- 그룹 별로 묶여진 값에 대한 '중간 집계' 와, '총 집계' 를 계산하여 자동으로 추가하는 함수이다.
-- * 인자로 전달받은 그룹 중에서, 가장 먼저 지정한 그룹 별 합계와 총 합계를 구하는 함수이다.

SELECT DEPT_CODE, JOB_CODE, SUM(SALARY) FROM EMPLOYEE GROUP BY ROLLUP(DEPT_CODE, JOB_CODE) ORDER BY DEPT_CODE;
/*
▶ DEPT_CODE 와 JOB_CODE 를 기준으로, SALARY 의 합계를 구한 것
  특정 그룹의 합계: 부서 코드가 동일한 모든 행의 합계
  전체 그룹의 합계: 모든 합계
부서 직급 월급합계
D1	J6	6440000 <-- D1 부서 내의 J6 직급의 급여 합계
D1	J7	1380000 <-- D1 부서 내의 J7 직급의 급여 합계
D1	NUL	7820000 <-- D1 부서 전체(J6, J7) 의 급여 합계
D2	J4	6520000 <-- D2 부서 내의 J4 직급의 급여 합계
D2	NUL	6520000 <-- D2 부서 전체의 급여 합계
D5	J3	3500000 <-- D5 부서 내의 J3 직급의 급여 합계
D5	J5	8460000 <-- D5 부서 내의 J5 직급의 급여 합계
D5	J7	3800000 <-- D5 부서 내의 J7 직급의 급여 합계
D5	NUL	15760000 <-- D5 부서 전체(J3, J5, J7) 의 급여 합계
D6	J3	7300000 <-- D6 부서 내의 J3 직급의 급여 합계
D6	J4	2800000 <-- D6 부서 내의 J4 직급의 급여 합계
D6	NUL	10100000 <-- D6 부서 전체(J3, J4) 의 급여 합계
D8	J6	6986240 <-- D8 부서 내의 J6 직급의 급여 합계
D8	NUL	6986240 <-- D8 부서 전체의 급여 합계
D9	J1	8000000
D9	J2	9700000
D9	NUL	17700000
NUL	J6	2320000
NUL	J7	2890000
NUL	NUL	5210000
NUL	NUL	70096240
*/

-- CUBE 함수: 그룹 별로 산출한 결과를 집계하는 함수이다.
-- 그룹으로 지정된 모든 값에 대한 집계와 총 합계를 구하는 함수이다.

SELECT DEPT_CODE, JOB_CODE, SUM(SALARY) FROM EMPLOYEE GROUP BY CUBE(DEPT_CODE, JOB_CODE) ORDER BY DEPT_CODE;
/*
CUBE 는 ROLLUP 보다 더 포괄적인 집계 결과를 생성한다.
CUBE 는 존재 가능한 모든 경우의 수를 조합하고, 조합에 대한 결과와 총합을 계산한다.
부서 직급 월급합계
D1	J6	6440000 <-- D1 부서 내의 J6 직급의 급여 합계
D1	J7	1380000 <-- D1 부서 내의 J7 직급의 급여 합계
D1	NUL	7820000 <-- D1 부서 전체(J6, J7) 의 급여 합계
D2	J4	6520000 <-- D2 부서 내의 J4 직급의 급여 합계
D2	NUL	6520000 <-- D2 부서 전체의 급여 합계
D5	J3	3500000 <-- D5 부서 내의 J3 직급의 급여 합계
D5	J5	8460000 <-- D5 부서 내의 J5 직급의 급여 합계
D5	J7	3800000 <-- D5 부서 내의 J7 직급의 급여 합계
D5	NUL	15760000 <-- D5 부서 전체(J3, J5, J7) 의 급여 합계
D6	J3	7300000 <-- D6 부서 내의 J3 직급의 급여 합계
D6	J4	2800000 <-- D6 부서 내의 J4 직급의 급여 합계
D6	NUL	10100000 <-- D6 부서 전체(J3, J4) 의 급여 합계
D8	J6	6986240 <-- D8 부서 내의 J6 직급의 급여 합계
D8	NUL	6986240 <-- D8 부서 전체의 급여 합계
D9	J1	8000000 <-- D9 부서 내의 J1 직급의 급여 합계
D9	J2	9700000 <-- D9 부서 내의 J2 직급의 급여 합계
D9	NUL	17700000 <-- D9 부서 전체(J1, J2) 의 급여 합계
NUL	J1	8000000 <-- 모든 부서의 J1 직급의 급여 합계
NUL	J2	9700000 <-- 모든 부서의 J2 직급의 급여 합계
NUL	J3	10800000 <-- 모든 부서의 J3 직급의 급여 합계
NUL	J4	9320000 <-- 모든 부서의 J4 직급의 급여 합계
NUL	J5	8460000 <-- 모든 부서의 J5 직급의 급여 합계
NUL	J6	2320000 <-- ?
NUL	J6	15746240 <-- 모든 부서의 J6 직급의 급여 합계
NUL	J7	2890000 <-- ?
NUL	J7	8070000 <-- 모든 부서의 J7 직급의 급여 합계
NUL	NUL	5210000 <-- ?
NUL	NUL	70096240 <-- 전체 데이터의 급여 합계
*/

-- UNION INTERSECT MINUS

/*****
집합 연산(SET OPERATION)
    여러개의 SELECT 결과물을 하나의 쿼리로 만드는 연산자이다.
    여러가지 조건이 있을 때, 그에 해당하는 여러개의 결과 값을 결합시키고 싶을 경우에 사용한다.

        장점: 초보자들이 사용하기 좋다.(조건을 덜 생각해도 된다.)
    주의할 점: 집합 연산에 사용되는 SELECT 절은, SELECT 절 항목이 서로 동일해야 한다.
    
        UNION: OR 같은 개념이다.(중복 제거)
    INTERSECT: AND 같은 개념이다.
        MINUS: 차집합 같은 개념이다.
    UNION ALL: OR 결과 값에 AND 결과 값이 더해진 값이다.(중복이 제거되지 않은 채로 합쳐진 것)
*****/

-- UNION: 여러개의 쿼리 결과를 하나로 합치는 연산자이다.
--        중복된 영역을 제외하여 하나로 합친다.
SELECT EMP_NAME, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE = 'D5'
UNION
SELECT EMP_NAME, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE = 'D6';

-- UNION ALL: 여러개의 쿼리 결과를 하나로 합치는 연산자이다.
--            UNION 과는 다르게 중복 영역을 모두 포함한다.
SELECT EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE WHERE DEPT_CODE = 'D5'
UNION ALL
SELECT EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE WHERE SALARY > 3000000;

--  INTERSECT: 여러개의 SELECT 한 결과에서, 공통 부분만 결과로 추출
select emp_name, dept_code, salary from employee where dept_code = 'D5' 
intersect 
select emp_name, dept_code, salary from employee where salary > 3000000;
--> INTERSECT 를 사용하지 않아도, GROUP BY 또는 WHERE 절로 구분지을 수 있기 때문에, 자주 사용되지는 않는다.

--  MINUS: 선행 SELECT 결과에서, 다음 SELECT 결과와 겹치는 부분을 제외한 나머지 부분만 추출
select emp_name, dept_code, salary from employee where dept_code = 'D5' 
minus
select emp_name, dept_code, salary from employee where salary > 3000000;
--> MINUS 를 사용하지 않아도, GROUP BY 또는 WHERE 절로 구분지을 수 있기 때문에, 자주 사용되지는 않는다.