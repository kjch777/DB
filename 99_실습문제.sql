CREATE TABLE tb_department (
    department_no   VARCHAR2(10) NOT NULL PRIMARY KEY,
    department_name VARCHAR2(20) NOT NULL,
    category        VARCHAR2(20),
    open_yn         CHAR(1),
    capacity        NUMBER
);

CREATE TABLE tb_student (
    student_no         VARCHAR2(10) NOT NULL PRIMARY KEY,
    department_no      VARCHAR2(10) NOT NULL,
    student_name       VARCHAR2(30) NOT NULL,
    student_ssn        VARCHAR(14),
    student_address    VARCHAR2(100),
    entrance_date      DATE,
    absence_yn         CHAR(1),
    coach_professor_no VARCHAR2(10)
);

CREATE TABLE tb_class (
    class_no              VARCHAR2(10) NOT NULL PRIMARY KEY,
    department_no         VARCHAR2(10) NOT NULL,
    preattending_class_no VARCHAR2(10),
    class_name            VARCHAR2(30) NOT NULL,
    class_type            VARCHAR2(10)
);

CREATE TABLE tb_class_professor (
    class_no     VARCHAR2(10) NOT NULL,
    professor_no VARCHAR2(10) NOT NULL,
    CONSTRAINT pk_class_professor PRIMARY KEY ( class_no,
                                                professor_no )
);

CREATE TABLE tb_professor (
    professor_no      VARCHAR2(10) NOT NULL PRIMARY KEY,
    professor_name    VARCHAR2(30) NOT NULL,
    professor_ssn     VARCHAR2(14),
    professor_address VARCHAR2(100),
    department_no     VARCHAR2(10)
);

CREATE TABLE tb_grade (
    term_no    VARCHAR2(10) NOT NULL,
    class_no   VARCHAR2(10) NOT NULL,
    student_no VARCHAR2(10) NOT NULL,
    point      NUMBER(3, 2),
    CONSTRAINT pk_gade PRIMARY KEY ( term_no,
                                     class_no,
                                     student_no )
);

ALTER TABLE tb_student
    ADD CONSTRAINT fk_department_no FOREIGN KEY ( department_no )
        REFERENCES tb_department ( department_no );

ALTER TABLE tb_student
    ADD CONSTRAINT fk_coach_professor_no FOREIGN KEY ( coach_professor_no )
        REFERENCES tb_professor ( professor_no );

ALTER TABLE tb_class
    ADD CONSTRAINT fk_department_no_2 FOREIGN KEY ( department_no )
        REFERENCES tb_department ( department_no );

ALTER TABLE tb_class_professor
    ADD CONSTRAINT fk_class_no_1 FOREIGN KEY ( class_no )
        REFERENCES tb_class ( class_no );

ALTER TABLE tb_class_professor
    ADD CONSTRAINT fk_professor_no FOREIGN KEY ( professor_no )
        REFERENCES tb_professor ( professor_no );

ALTER TABLE tb_professor
    ADD CONSTRAINT fk_department_no_3 FOREIGN KEY ( department_no )
        REFERENCES tb_department ( department_no );

ALTER TABLE tb_grade
    ADD CONSTRAINT fk_class_no_2 FOREIGN KEY ( class_no )
        REFERENCES tb_class ( class_no );

ALTER TABLE tb_grade
    ADD CONSTRAINT fk_student_no FOREIGN KEY ( student_no )
        REFERENCES tb_student ( student_no );