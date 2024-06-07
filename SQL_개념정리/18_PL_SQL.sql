/* PL / SQL ◀ 해석할 수 있으면 좋다.
    SQL 의 조작 언어로, 
    SQL 의 단점을 보완하여 
    SQL 문장 안에서 변수의 정의, 조건 처리, 반복 처리 등을 지원한다.
    ORACLE 자체에 내장되어 있는 절차적 언어이다.

사용법
    DECLARE SECTION 
        DECLARE 변수나 상수를 선언하는 부분

    EXCUTABLE SECTION 
        BEGIN 으로 시작한다. 
        제어문, 반복문, 함수, 정의 등의 로직을 기술한다.

자바에서 System.out.println(' ' + ); 를 사용하는 방법 대신

PS / SQL 에서는 DBMS_OUTPUT.PUT_LINE(' : ' ||); 를 사용한다.

예외가 없는 경우에는 END; 를 작성하여 마무리한다.

EXCEPTION SECTION EXCEPTION 으로 시작하고, 예외 사항 발생 시 해결하기 위한 문장을 기술한다.(자바처럼 코딩)
한 문장이 끝날 때마다 ; 을 붙여주어야 한다.
*/

DECLARE 
    EMP_ID NUMBER; 
    EMP_NAME VARCHAR2(30);

BEGIN 
    EMP_ID := 888; 
    EMP_NAME := '신짱구'; 

    DBMS_OUTPUT.PUT_LINE('EMP_ID : ' || EMP_ID);
    DBMS_OUTPUT.PUT_LINE('EMP_NAME : ' || EMP_NAME);
END;