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