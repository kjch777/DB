CREATE TABLE tb_department2 (
    department_no   VARCHAR2(10) NOT NULL PRIMARY KEY,
    department_name VARCHAR2(20) NOT NULL,
    category        VARCHAR2(20),
    open_yn         CHAR(1),
    capacity        NUMBER
);

CREATE TABLE tb_student2 (
    student_no         VARCHAR2(10) NOT NULL PRIMARY KEY,
    department_no      VARCHAR2(10) NOT NULL,
    student_name       VARCHAR2(30) NOT NULL,
    student_ssn        VARCHAR(14),
    student_address    VARCHAR2(100),
    entrance_date      DATE,
    absence_yn         CHAR(1),
    coach_professor_no VARCHAR2(10)
);

CREATE TABLE tb_class2 (
    class_no              VARCHAR2(10) NOT NULL PRIMARY KEY,
    department_no         VARCHAR2(10) NOT NULL,
    preattending_class_no VARCHAR2(10),
    class_name            VARCHAR2(30) NOT NULL,
    class_type            VARCHAR2(10)
);

CREATE TABLE tb_class_professor2 (
    class_no     VARCHAR2(10) NOT NULL,
    professor_no VARCHAR2(10) NOT NULL,
    CONSTRAINT pk_cp PRIMARY KEY ( class_no,
                                                professor_no )
);

CREATE TABLE tb_professor2 (
    professor_no      VARCHAR2(10) NOT NULL PRIMARY KEY,
    professor_name    VARCHAR2(30) NOT NULL,
    professor_ssn     VARCHAR2(14),
    professor_address VARCHAR2(100),
    department_no     VARCHAR2(10)
);

CREATE TABLE tb_grade2 (
    term_no    VARCHAR2(10) NOT NULL,
    class_no   VARCHAR2(10) NOT NULL,
    student_no VARCHAR2(10) NOT NULL,
    point      NUMBER(3, 2),
    CONSTRAINT pk_g PRIMARY KEY ( term_no,
                                     class_no,
                                     student_no )
);

ALTER TABLE tb_student2
    ADD CONSTRAINT fk_dn FOREIGN KEY ( department_no )
        REFERENCES tb_department2 ( department_no );

ALTER TABLE tb_student2
    ADD CONSTRAINT fk_cpn FOREIGN KEY ( coach_professor_no )
        REFERENCES tb_professor2 ( professor_no );

ALTER TABLE tb_class2
    ADD CONSTRAINT fk_dn2 FOREIGN KEY ( department_no )
        REFERENCES tb_department2 ( department_no );

ALTER TABLE tb_class_professor2
    ADD CONSTRAINT fk_cn FOREIGN KEY ( class_no )
        REFERENCES tb_class2 ( class_no );

ALTER TABLE tb_class_professor2
    ADD CONSTRAINT fk_pn FOREIGN KEY ( professor_no )
        REFERENCES tb_professor2 ( professor_no );

ALTER TABLE tb_professor2
    ADD CONSTRAINT fk_dn3 FOREIGN KEY ( department_no )
        REFERENCES tb_department2 ( department_no );

ALTER TABLE tb_grade2
    ADD CONSTRAINT fk_cn2 FOREIGN KEY ( class_no )
        REFERENCES tb_class2 ( class_no );

ALTER TABLE tb_grade2
    ADD CONSTRAINT fk_sn FOREIGN KEY ( student_no )
        REFERENCES tb_student2 ( student_no );