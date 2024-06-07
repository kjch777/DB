/* 
계정(사용자)
    -- 관리자 계정: 데이터 베이스의 생성과 관리를 담당하는 계정이다.
                  (모든 권한과 책임을 가지는 계정이다.)
                  SYS(최고 관리자), SYSTEM(SYS 에서 권한 몇 개가 제외된 관리자)
                  
    -- 사용자 계정: 데이터 베이스에 대하여 질의, 갱신, 보고서 작성 등의 작업을 수행할 수 있는 계정으로,
                  업무에 필요한 최소한의 권한만을 가지는 것을 원칙으로 한다.
                    ex) kh_t, kh_workbook 등
*/

/*
DCL(Data Control Languge)
    계정 DB, DB 객체에 대한 접근 권한을 부여 / 회수하는 언어이다.
        -- GRANT: 권한 부여
        -- REVOKE: 권한 회수
        
        권한의 종류
            1. 시스템 권한: DB 접속, 객체 생성 권한
                CREATE USER: 사용자(계정) 생성 권한
                CREATE TABLE: 테이블 생성 권한
                CREATE SESSION: 데이터 베이스 접속 권한
                CREATE VIEW: 뷰 생성 권한
                CREATE SEQUENCE: 시퀀스 생성 권한
                CREATE PROCEDURE: 프로시저(함수) 생성 권한
                DROP USER: 사용자(계정) 삭제 권한
                DROP ANY TABLE: 임의 테이블 삭제 권한
                
            2. GRANT / REVOKE 사용 권한
                
                계정에 권한을 하나만 부여할 경우
                GRANT 권한 TO 계정명;
                
                계정에 권한을 두개 이상 부여할 경우 (, 를 사용하여 구분해서 작성한다.)
                GRANT 권한, 권한 TO 계정명;
                
                대표적 권한
                    CONNECT: 사용자가 데이터 베이스에 접속할 수 있게 설정해줄 때 사용한다.
                        ▶ 8가지 권한(SESSION(CREATE, ALTER), CLUSTER, LINK, SEQUENCE, SYNONYM, TABLE, VIEW) 을 묶은 패키지이다.
                        
                    RESOURCE: 사용자가 객체(TABLE, VIEW, INDEX) 를 생성할 수 있게 시스템 권한을 묶어놓은 것이다.
                        ▶ 5가지 권한(CLUSTER, PROCEDURE, SEQUENCE, TABLE, TRIGGER) 을 묶은 패키지이다.
                    
                    DBA: 시스템 관리에 필요한 모든 권한을 부여하는, 이른바 최고 설정이다.
*/

-- 사용자 계정 생성하기
CREATE USER 계정명 IDENTIFIED BY 비밀번호;

-- 생성한 사용자 계정에 접속 권한 부여하기
GRANT 부여할권한 TO 계정명;