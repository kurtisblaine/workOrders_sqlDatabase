CREATE TABLE project
(
proj# NUMBER(10) NOT NULL,
p_name VARCHAR2(15) NOT NULL,
p_desc VARCHAR2(40),
p_budget NUMBER(9,2),
CONSTRAINT proj#_pk PRIMARY KEY (proj#),
CONSTRAINT p_name_uk UNIQUE (p_name)
);

CREATE TABLE workorders
(
wo# NUMBER(10),
proj# NUMBER(10),
wo_desc VARCHAR2(40) NOT NULL,
wo_assigned VARCHAR2(15),
wo_hours NUMBER(3) NOT NULL,
wo_start DATE DEFAULT SYSDATE,
wo_due DATE DEFAULT SYSDATE,
wo_complete CHAR(1),
CONSTRAINT wo#_pk PRIMARY KEY (wo#),
CONSTRAINT proj#_fk FOREIGN KEY (proj#)
REFERENCES project (proj#), 
CONSTRAINT wo_desc_uk UNIQUE (wo_desc),
CONSTRAINT wo_hours_ck CHECK (wo_hours > 0),
CONSTRAINT wo_complete_ck CHECK (wo_complete IN ('Y','N'))
);

SELECT *
FROM project, workorders;