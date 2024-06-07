/*
VIEW
    논리적 가상 테이블이다.
    테이블 모양을 갖추고 있지만, 실제로 값을 저장하고 있지는 않다.
    SELECT 절 실행 결과(RESULT SET) 를 저장하는 객체이다.

VIEW 사용 목적
    복잡한 SELECT 절을 쉽게 재사용할 수 있게 도와주고, 테이블의 진짜 모습을 감출 수 있어 보안 상 유리하다.
    
VIEW 사용 시 주의사항
    가상 테이블(실체 없음) 이기 때문에, ALTER 구문을 사용할 수 없다.
    VIEW 를 이용한 DML(INSERT, UPDATE, DELETE) 을 사용할 수 있는 경우도 있지만,
    제약이 많이 따르기 때문에 주로 조회(SELECT) 용도로 사용한다.

VIEW 작성법
    CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW 뷰이름 [칼럼 별칭] AS 서브 쿼리(SELECT 절) [WITH CHECK OPTION] [WITH READ ONLY];
        1. OR REPLACE
            기존에 동일한 이름의 VIEW 가 존재하면 이름을 변경하고, 없다면 새로 생성하는 옵션이다.
        2. FORCE | NOFORCE
              FORCE: 서브 쿼리에 사용된 테이블이 존재하지 않아도 VIEW 를 생성하는 옵션이다.
            NOFORCE: (기본 값) 서브 쿼리에 사용된 테이블이 존재해야만, VIEW 를 생성하는 옵션이다.
            
        3. 칼럼 별칭 옵션
            조회되는 VIEW 의 칼럼명을 생성하는 옵션이다.
        
        4. WITH CHECK OPTION
            옵션을 지정한 칼럼의 값을 수정 불가능하게 지정하는 옵션이다.
        
        5. WITH READ ONLY
            VIEW 에 대해 SELECT 만 가능하도록 지정하는 옵션이다.
*/

CREATE VIEW ALL_COMPANIES AS SELECT * FROM COMPANY;
/*
ORA-01031: insufficient privileges
VIEW 를 생성할 권한이 부족하다는 오류이다.

해결 방법
    데이터 베이스 관리자(DBA) 또는 시스템 관리자에게 권한을 요청하거나,
    CMD 창에서 GRANT CREATE VIEW TO kh_workbook; 을 입력하여, 
    현재 사용하고 있는 계정에 VIEW 를 생성할 권한을 부여하면 된다.
    
VIEW 는 주로 테이블을 복제하거나, 조합하여 테스트 용 SELECT 문을 출력해볼 때 많이 사용한다.
SELECT 문을 저장하고, 다시보기로 사용한다.
*/

CREATE VIEW ONETWO_SNACKS AS SELECT * FROM SNACKS WHERE SNACK_PRICE >= 1500;
CREATE VIEW COMPANY_IN_GANGNAM AS SELECT * FROM COMPANY WHERE COMPANY_ADDRESS = '서울시 강남구';