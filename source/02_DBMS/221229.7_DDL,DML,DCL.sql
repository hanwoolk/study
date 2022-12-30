-- [ VII ] DDL, DCL, DML
-- SQL = DDL + DML + DCL
--       DDL : ���̺� ����, ���̺� ����, ���̺� ���� ����, ���̺� ��� ������ ����)
--       DML : SELECT, INSERT, UPDATE, DELETE
--       DCL : ����� ���� ����, ����ڿ��� ���� �ο�, ���� ��Ż, ����� ���� ����, Ʈ������ ��ɾ�

-- �ڡڡ� DDL �ڡڡ�
-- 1. ���̺� ����(CREATE TABLE ���̺��...) : ���̺� ������ �����ϱ�
CREATE TABLE BOOK (
    BOOKID      NUMBER(4),      -- BOOKID �ʵ��� Ÿ���� ���� 4�ڸ�
    BOOKNAME    VARCHAR2(50),   -- BOOKNAME�ʵ��� Ÿ���� ���� 50BYTE
    PUCBISHER   VARCHAR2(50),   -- PUBLISHER �ʵ��� Ÿ���� ���� 50BYTE
    RDATE       DATE,           -- RDATE�ʵ��� Ÿ���� DATE��
    PRICE       NUMBER(8,2),    -- PRICE�ʵ��� Ÿ���� ���� ��ü 8�ڸ�, �Ҽ���2, �Ҽ����� 6.
    PRIMARY KEY(BOOKID)         -- ���� ���� : BOOKID�ʵ尡 ��Ű(PRIMARY KEY : NOT NULL, UNIQUE)
);
SELECT *FROM BOOK;

DROP TABLE BOOK; -- ���̺� ����

CREATE TABLE BOOK(
    BID         NUMBER(4) PRIMARY KEY,
    BNAME       VARCHAR2(20),
    PUBLISHER   VARCHAR2(20),
    RDATE       DATE,
    PRICE       NUMBER(8)
    );

    -- EX EMP�� ������ EMP01 ���̺� : EMPNO (����4), ENAME(����10),SAL(����7,2)
CREATE TABLE EMP01(
    EMPNO   NUMBER(4),
    ENAME   VARCHAR2(10),
    SAL     NUMBER(7,2)
    );

    -- EX. DEPT01 ���̺� : DEPTNO(����2:PK), DNAME(����14), LOC(����13�ڸ�)
CREATE TABLE DEPT01 (
    DEPTNO  NUMBER(2) PRIMARY KEY,
    DNAME   VARCHAR2(14),
    LOC     VARCHAR2(13)
);
-- ���������� �̿��� ���̺� ����
CREATE TABLE EMP02
    AS
    SELECT * FROM EMP; -- �������� ����� EMP02 ���̺� ���� �� �����͵� ��(�������� ������)
SELECT * FROM EMP02;
DESC EMP02;
    -- EMP03 : EMP ���̺��� EMPNO, ENAME, DEPTNO�� ������ ������
CREATE TABLE EMP03 AS SELECT EMPNO, ENAME, DEPTNO FROM EMP;
    -- EMP04 : EMP���̺��� 10�� �μ��� ������ ������
CREATE TABLE EMP04 AS SELECT * FROM EMP WHERE DEPTNO=10;
SELECT*FROM EMP04;
    -- EMP05 : EMP���̺� ������ ����(�����͸� �������� ����)
CREATE TABLE EMP05 AS SELECT * FROM EMP WHERE 0=1;
SELECT * FROM EMP05;

DESC EMP;
SELECT *FROM EMP;
SELECT ROWNUM, EMPNO, ENAME, JOB FROM EMP; --   ���̺��� ���� ���� ����(�о���� ����)

-- 2. ���̺� ���� ���� (ALTER TABLE ���̺�� ADD || MODIFY || DROP ~)
-- (1) �ʵ� �߰�(ADD)
SELECT * FROM EMP03; -- EMPNO(��4), ENAME(��10), DEPTNO(��2)
ALTER TABLE EMP03 ADD (JOB VARCHAR2(20), SAL NUM(7,2));
SELECT * FROM EMP03; -- �ʵ� �߰��� ������ NULL��
ALTER TABLE EMP03 ADD (COMM NUMBER(7,2));
-- (2) �ʵ� ����(MODIFY)
SELECT * FROM EMP03; -- EMPNO(��4), ENAME(��10), DEPTNO(��2), JOB, SAL, COMM�� NULL
ALTER TABLE EMP03 MODIFY (EMPNO VARCHAR2(5)); -- ���� �����Ͱ� ����־ ���ڷθ� ����
ALTER TABLE EMP03 MODIFY (EMPNO NUMBER(5));
ALTER TABLE EMP03 MODIFY (EMPNO NUMBER(4)); -- ���� �����ʹ� ���̴� �� �� ��
ALTER TABLE EMP03 MODIFY (SAL VARCHAR2(10)); -- NULL�ʵ�� ������� ���� ����
ALTER TABLE EMP03 MODIFY (ENAME VARCHAR2(20)); -- ���ڵ����� �ø��ų� ���̰ų� ����
DESC EMP03;
SELECT MAX(LENGTH(ENAME)) FROM EMP03;
ALTER TABLE EMP03 MODIFY (ENAME VARCHAR2(6)); -- ����
ALTER TABLE EMP03 MODIFY (ENAME VARCHAR2(5)); -- �Ұ���
-- (3) �ʵ� ����(DROP)
ALTER TABLE EMP03 DROP COLUMN JOB; -- NULL�� �ʵ� ����(NULL�� �ƴ� �ʵ�� �����ͱ��� ����)
SELECT*FROM EMP03;
ALTER TABLE EMP03 DROP COLUMN DEPTNO;
-- �������� Ư�� �ʵ带 ���� ���ϵ���(��)
ALTER TABLE EMP03 SET UNUSED (COMM);
SELECT*FROM EMP03;
-- �������� ���� �Ұ��ߴ� �ʵ� ���������� ����(����)
ALTER TABLE EMP03 DROP UNUSED COLUMNS;

-- 3. ���̺� ����(DROP TABLE ���̺��)
DROP TABLE EMP01;
SELECT *FROM EMP01;
DROP TABLE DEPT; -- EMP���̺��� DEPT ���̺��� �����ϴ� ��� EMP���̺��� ������ �� DEPT ���̺� ����

-- 4. ���̺��� ��� ���� ����(TRUNCATE TABLE ���̺��) 
SELECT*FROM EMP03;
TRUNCATE TABLE EMP03; -- ROLLBACK �ȵ�

-- 5. ���̺�� ����(RENAME ���̺�� TO �ٲ� ���̺��)
SELECT*FROM EMP02;
RENAME EMP02 TO EMP2;
SELECT*FROM EMP2;

-- 6. ������ ��ųʸ�(���ٺҰ�) VS. ������ ��ųʸ� ��(���ٿ�)
-- ����
    -- (1) USER_XXX : �� ������ �����ϰ��ִ� ��ü(���̺�, ��������, ��, �ε���)
       -- USER_TABLES, USER_CONSTRAINT, USER_INDEXES, USER_VIEWS
SELECT*FROM USER_TABLES;
SELECT*FROM USER_CONSTRAINTS;
SELECT*FROM USER_INDEXES;
SELECT*FROM USER_VIEWS;
    -- (2) ALL_XXX : �� �������� ���� ������ ��ü
       -- ALL_TABLES, ALL_CONSTRAINT, ALL_INDEXES, ALL_VIEWS
SELECT*FROM ALL_TABLES;
SELECT*FROM ALL_VIEWS;
    -- (3) DBA_XXX : DBA���ѿ����� ���ٰ���. DBMS�� ��� ��ü
        -- DBA__TABLES, DBA_CONSTRAINT, DBA_INDEXES, DBA_VIEWS
SELECT * FROM DBA_TABLES;
UPDATE DEPT01 SET DEPTNO=70 WHERE DEPTNO = 30;
-- �ڡڡ� DML �ڡڡ�
-- 1. INSERT INTO ���̺�� VALUES(��1, ��2, ...);
    --INSERT INTO ���̺�� (�ʵ��1, �ʵ��2, ...) VALUES(��1, ��2, ...);
SELECT * FROM DEPT01;
INSERT INTO DEPT01 VALUES (50, 'ACCOUNTING', 'NEW YOURK');
INSERT INTO DEPT01 VALUES (60, 'SALES', NULL); -- ��������� NULL �߰�
INSERT INTO DEPT01 (DEPTNO, DNAME, LOC) VALUES (70, 'RESEARCH', '���빮');
INSERT INTO DEPT01 (LOC,DEPTNO, DNAME) VALUES ('����', 80, 'IT');  80
INSERT INTO DEPT01 (DEPTNO, DNAME) VALUES (90, 'OPERATION'); -- ���������� NULL �߰�  90
--���������� �̿��� INSERT
    -- EX. DEPT ���̺��� 10~30�� �μ��� DETP01 ���̺��
INSERT INTO DEPT01 SELECT *FROM DEPT WHERE DEPTNO<40;
-- EX. BOOK (BID�� 11, BNAME�� '��������������', ���ǻ�� '�Ѽ�����', �������� ����, ������ 90000
DESC BOOK;
INSERT INTO BOOK VALUES (11, '����������', '�Ѽ�����', SYSDATE, 90000);


--Ʈ������ ��ɾ� (DML��ɾ���� ����)
    --Ʈ�������� ������ ó���� �� ����. DML ��ɾ���� ����ʰ� ���ÿ� Ʈ������� ����.
COMMIT; --�� Ʈ������� �۾��� DB�� �ݿ�
INSERT INTO BOOK VALUES (12, '����������', '�Ѽ�����', SYSDATE, 90000);
SELECT * FROM BOOK;
ROLLBACK; --�� Ʈ������� �۾��� ���

-- �������� (1������)
CREATE TABLE SAM01(
    EMPNO   NUMBER(4) PRIMARY KEY,
    ENAME   VARCHAR2(10),
    JOB     VARCHAR2(9),
    SAL     NUMBER(7,2)
    );
INSERT INTO SAM01 VALUES(1000, 'APPLE', 'POLICE', 10000);
INSERT INTO SAM01 VALUES(1010, 'BANANA', 'NURSE', 15000);
INSERT INTO SAM01 VALUES(1020, 'ORANGE', 'DOCTOR', 25000);
INSERT INTO SAM01 (EMPNO, ENAME, SAL) VALUES (1030, 'VERY',25000);
INSERT INTO SAM01 (EMPNO, ENAME, SAL) VALUES(1040, 'CAT', 2000);
INSERT INTO SAM01 SELECT EMPNO, ENAME, JOB,SAL FROM EMP WHERE DEPTNO=10;
SELECT * FROM SAM01;
COMMIT;

-- 2. UPDATE ���̺�� SET �ʵ��1 = ��1 [, �ʵ��2 = ��2, �ʵ��N = ��N...] [WHERE ����]
SELECT * FROM EMP01;
CREATE TABLE EMP01 AS SELECT *FROM EMP;
    -- EX. �μ���ȣ�� 30���� ����
UPDATE EMP01 SET DEPTNO = 30;
SELECT * FROM EMP01;
ROLLBACK;
SELECT * FROM EMP01;
    -- EX. ��� ����(EMP01)�� �޿�(SAL)�� 10%�λ�
UPDATE EMP01 SET SAL = SAL*1.1;
SELECT * FROM EMP01;
    -- EX. EMP01���̺� : 10�� �μ� ������ �Ի����� ���÷�, �μ���ȣ�� 30������ �����Ͻÿ�
UPDATE EMP01 SET HIREDATE = SYSDATE, DEPTNO = 30 WHERE DEPTNO = 10;
SELECT * FROM EMP01;
    -- EX. SAL�� 3000�̻��� ����� �޿��� 10% �λ�
UPDATE EMP01 SET SAL = SAL*1.1 WHERE SAL >=3000;
    -- EX. DALLAS�� �ٹ��ϴ� ������ �޿��� 1000$�λ�
UPDATE EMP01 SET SAL = SAL + 1000 WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');
    -- EX. SCOTT�� �μ���ȣ 20����, JOB�� MANAGER��, SAL�� COMM�� 500$�� �λ�, ���� KING���� ����
UPDATE EMP01 
    SET DEPTNO=20, 
        JOB='MANAGER', 
        SAL=SAL+500, 
        COMM=NVL(COMM,0)+500, 
        MGR=(SELECT EMPNO FROM EMP WHERE ENAME='KING')
    WHERE ENAME = 'SCOTT';
ROLLBACK;
    -- EX. DEPT01���� 60�� �μ��� �������� 20�� �μ��� �������� ���� 
SELECT * FROM DEPT01;
UPDATE DEPT01 SET LOC=(SELECT LOC FROM DEPT01 WHERE DEPTNO=20)
    WHERE DEPTNO=60;
        -- EMP01���� ��� ����� �޿��� �Ի����� 'KING'�� �޿��� �Ի��Ϸ� ����
        SELECT SAL, HIREDATE FROM EMP WHERE ENAME='KING'; -- UPDATE�� �� ���������� ������ ���Ͽ��� �����ϱ⶧���� �Ʒ��� ���� �ɰ�����
        SELECT HIREDATE FROM EMP WHERE ENAME='KING';
        SELECT SAL FROM EMP WHERE ENAME='KING';
UPDATE EMP01 SET SAL = (SELECT SAL FROM EMP WHERE ENAME='KING'),
                HIREDATE = (SELECT HIREDATE FROM EMP WHERE ENAME='KING');
UPDATE EMP01 SET (SAL,HIREDATE) = (SELECT SAL, HIREDATE FROM EMP WHERE ENAME='KING');  -- ������ �� �Ⱦ�

-- 3. DELETE FROM ���̺�� [WHERE ����];  --TRUNCATE�� �ٸ��� ROLLBACK�� ����
SELECT *FROM EMP01;
DELETE FROM EMP01;
ROLLBACK;
    -- EX. EMP01���� 30�� �μ� ������ ����
DELETE FROM EMP01 WHERE DEPTNO=30;
SELECT *FROM EMP01;
    -- EX. 'FORD'��� ���
DELETE FROM EMP01 WHERE ENAME='FORD';
    -- EX. SAM01���̺��� JOB�� �������� ���� ����� ����
SELECT * FROM SAM01;
DELETE FROM SAM01 WHERE JOB IS NULL;
    -- EMP01 : �μ����� SALES�� ����� ����(�������� �̿�)
DELETE FROM EMP01 WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');
    -- EMP01 : �μ����� RESEARCH �μ��� �ٹ��ϴ� ��� ����
DELETE FROM EMP01 WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'RESEARCH');
SELECT *FROM EMP01;
COMMIT;

-- �ڡ� �������� (PDF 2~3������)

--1. �Ǝm�� ������ �����ϴ� MY_DATA ���̺��� �����Ͻÿ�. �� ID�� PRIMARY KEY�̴�.
CREATE TABLE MY_DATA (
    ID  NUMBER(4) PRIMARY KEY,
    NAME    VARCHAR2(10),
    USERID  VARCHAR2(30),
    SALARY  NUMBER(10,2)
    );
--2. ������ ���̺� ���� ��ǥ�� ���� ���� �Է��ϴ� SQL���� �ۼ��Ͻÿ�.
/*
1 Scott sscott 10,000.00
2 Ford fford 13,000.00
3 Patel ppatel 33,000.00
4 Report rreport 23,500.00
5 Good ggood 44,450.00 
*/
INSERT INTO MY_DATA VALUES (1, 'Scott', 'sscott', 10000);
INSERT INTO MY_DATA VALUES (2, 'Ford', 'fford', 13000);
INSERT INTO MY_DATA VALUES (3, 'Patel', 'ppatel', 33000);
INSERT INTO MY_DATA VALUES (4, 'Report', 'rreport', 23500);
INSERT INTO MY_DATA VALUES (5, 'Good', 'ggood', 44450);

--3. TO_CHAR ���� �Լ��� �̿��Ͽ� �Է��� �ڷḦ ���� ��ǥ�� ���� �������� ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT ID, INITCAP(NAME) NAME, 
       LOWER(USERID) USERID, 
       TO_CHAR(SALARY,'99,999.00') SALARY 
       FROM MY_DATA;
--4. �ڷḦ ���������� �����ͺ��̽��� ����ϴ� ��ɾ �ۼ��Ͻÿ�.
COMMIT;

--5. ID�� 3���� ����� �޿��� 65000.00���� �����ϰ� ���������� �����ͺ��̽��� �ݿ��϶�.
UPDATE MY_DATA SET SALARY = 65000 WHERE ID=3;
COMMIT;

--6. NAME�� Ford�� ����� �����ϰ� ���������� �����ͺ��̽��� �ݿ��϶�.
DELETE FROM MY_DATA WHERE NAME = INITCAP('FORD');
COMMIT;

--7. SALARY�� 15,000.00 ������ ����� �޿��� 15,000.00���� �����϶�
UPDATE MY_DATA 
    SET SALARY = 15000 
    WHERE SALARY<=15000;

--8. ������ ������ ���̺��� �����϶�.
DROP TABLE MY_DATA;

-- EMP ���̺�� ���� ������ ���� ������ ���̺� EMP01�� ����(���̺��� ������
--������ ��)�ϰ�, ��� ����� �μ���ȣ�� 10������ �����մϴ�.
CREATE TABLE EMP01 AS SELECT * FROM EMP;
UPDATE EMP01 SET DEPTNO=10;
SELECT*FROM EMP01;
-- EMP01���̺��� ��� ����� �޿��� 10% �λ��Ű�� UPDATE���� �ۼ�
UPDATE EMP01 SET SAL = SAL*1.1;
-- �޿��� 3000�̻��� ����� �޿��� 10%�λ�
UPDATE EMP01 SET SAL=SAL*1.1 WHERE SAL>=3000;
-- EMP01���̺��� ��DALLAS������ �ٹ��ϴ� �������� ������ 1000�λ�
UPDATE EMP01 SET SAL=SAL+1000 WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS');
-- SCOTT����� �μ���ȣ�� 20������, ������ MANAGER�� �Ѳ����� ����
UPDATE EMP01 SET DEPTNO = 20, JOB = 'MANAGER' WHERE ENAME='SCOTT';
-- �μ����� SALES�� ����� ��� �����ϴ� SQL�ۼ�
DELETE FROM EMP01 WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='SALES');
-- ������� ��FORD���� ����� �����ϴ� SQL �ۼ�
DELETE FROM EMP01 WHERE ENAME='FORD';
-- SAM01 ���̺��� JOB�� NULL�� ����� �����Ͻÿ�
SELECT *FROM SAM01;
DELETE FROM SAM01 WHERE JOB IS NULL;
-- SAM01���̺��� ENAME�� ORANGE�� ����� �����Ͻÿ�
DELETE FROM SAM01 WHERE ENAME='ORANGE';


-- �ڡڡ� ��������
-- (1) PRIMARY KEY : ���̺��� �� ���� ������ ������ �ĺ��ϱ� ���� �ʵ�
-- (2) FOREIGN KEY : ���̺��� ���� �ٸ� ���̺��� ���� ����
-- (3) NOT NULL    : NULL�� �������� �ʴ´�
-- (4) UNIQUE      : ��� ���� ���� �����ؾ��Ѵ� NULL���� ���(NULL�� ������ �Է� ����)
-- (5) CHECK(����)  : �ش� ������ ����(NULL�� ���)
-- DEAULT      : �⺻�� ���� (�ش� ���� ������ �Է��� ���� ������ ������ NULL�� �� ���� DEFAULT���� ��)

    -- DEPT1 & EMP1 ���̺� ����
DROP TABLE EMP1;
DROP TABLE DEPT1;
CREATE TABLE DEPT1 (
    DEPTNO  NUMBER(2) PRIMARY KEY,
    DNAME   VARCHAR2(14) NOT NULL UNIQUE,
    LOC     VARCHAR2(13) NOT NULL    
);
SELECT*FROM USER_CONSTRAINTS WHERE TABLE_NAME='DEPT1';
DROP TABLE DEPT1;

CREATE TABLE DEPT1 (
    DEPTNO  NUMBER(2) CONSTRAINT DEPT_PK PRIMARY KEY,
    DNAME   VARCHAR2(14) CONSTRAINT DEPT_U NOT NULL UNIQUE,
    LOC     VARCHAR2(13) CONSTRAINT DEPT_LOC NOT NULL    
);
SELECT*FROM USER_CONSTRAINTS WHERE TABLE_NAME='DEPT1';
DROP TABLE DEPT1;

CREATE TABLE DEPT1 (
    DEPTNO  NUMBER(2) ,
    DNAME   VARCHAR2(14) NOT NULL,
    LOC     VARCHAR2(13) NOT NULL,
    CONSTRAINT DEPTNO_P PRIMARY KEY(DEPTNO),
    CONSTRAINT DNAME_U UNIQUE(DNAME)
);
SELECT*FROM USER_CONSTRAINTS WHERE TABLE_NAME='DEPT1';
SELECT*FROM DEPT1;
SELECT*FROM USER_INDEXES WHERE TABLE_NAME='DEPT1';

CREATE TABLE EMP1(
    EMPNO     NUMBER(4)     PRIMARY KEY,
    ENAME     VARCHAR2(10)  NOT NULL,
    JOB       VARCHAR2(9)   NOT NULL,
    MGR       NUMBER(4),
    HIREDATE  DATE          DEFAULT SYSDATE,
    SAL       NUMBER(7,2)   NOT NULL CHECK(SAL>0),
    COMM      NUMBER(7,2),
    DEPTNO    NUMBER(2)     REFERENCES DEPT1(DEPTNO)
);

SELECT*FROM EMP1;
DROP TABLE EMP1;

CREATE TABLE EMP1(
    EMPNO     NUMBER(4),
    ENAME     VARCHAR2(10)  NOT NULL,
    JOB       VARCHAR2(9)   NOT NULL,
    MGR       NUMBER(4),
    HIREDATE  DATE          DEFAULT SYSDATE,
    SAL       NUMBER(7,2),
    COMM      NUMBER(7,2),
    DEPTNO    NUMBER(2),
    PRIMARY KEY(EMPNO),
    CHECK(SAL>0),
    FOREIGN KEY(DEPTNO) REFERENCES DEPT1(DEPTNO)  -- �ؿ� ���°�찡 ����
);

INSERT INTO DEPT1 SELECT * FROM DEPT;
INSERT INTO DEPT1 (DEPTNO, DNAME, LOC)
VALUES (40, 'IT', 'SEOUL'); -- ����
VALUES (50, 'IT', 'SEOUL');
INSERT INTO DEPT1 VALUES(60, 'IT', 'PUSAN'); -- ����
INSERT INTO DEPT1 VALUES(60, 'PLANNING', 'PUSAN');
INSERT INTO DEPT1 (DEPTNO, DNAME) VALUES(70, 'CS'); -- ����
INSERT INTO DEPT1 (DEPTNO, DNAME, LOC) VALUES(70, 'CS', 'GANGNAM');
SELECT * FROM DEPT1;

INSERT INTO EMP1 (EMPNO, ENAME, JOB)
    VALUES(1001, 'HONG', 'MANAGER'); -- SAL, DEPTNO NULL ����
SELECT*FROM EMP1;
INSERT INTO EMP1(EMPNO, ENAME, JOB, SAL)
    VALUES(1002, 'KIM', 'MANAGER', 0); -- ����
INSERT INTO EMP1(EMPNO, ENAME, JOB, SAL)
    VALUES(1002, 'KIM', 'MANAGER', 10000);
INSERT INTO EMP1(EMPNO, ENAME, JOB, SAL)
    VALUES(1002, 'KIM', 'MANAGER', 100000);-- ����

INSERT INTO EMP1
    VALUES (1003, 'KIM', 'MANAGER', NULL, NULL, NULL, NULL, 90); --����
INSERT INTO EMP1
    VALUES (1003, 'KIM', 'MANAGER', NULL, NULL, NULL, NULL, 70);
SELECT * FROM EMP1;


-- BOOKCATEGORY & BOOK ���̺� �� DATA ����

DROP TABLE BOOK;
DROP TABLE BOOKCATEGORY;
DROP TABLE BOOKCATEGORY CASCADE CONSTRAINTS; --�����ϴ� ���̺�� ������� ���� (����)

CREATE TABLE BOOKCATEGORY (
    CATEGORY_CODE   NUMBER(3),
    CATEGORY_NAME   VARCHAR2(30),
    OFFICE_LOC      VARCHAR2(30)    NOT NULL,
    PRIMARY KEY(CATEGORY_CODE),
    UNIQUE(CATEGORY_NAME)
);

DESC BOOKCATEGORY;
SELECT * FROM BOOKCATEGORY;

CREATE TABLE BOOK (
    CATEGORY_CODE   NUMBER(3)       NOT NULL,
    bookNO          VARCHAR2(7),
    bookNAME        VARCHAR2(60)    NOT NULL,
    PUBLISHER       VARCHAR2(60)    NOT NULL,
    PUBYEAR         NUMBER(4)       DEFAULT EXTRACT(YEAR FROM SYSDATE),
    PRIMARY KEY(bookNO),
    FOREIGN KEY(CATEGORY_CODE) REFERENCES BOOKCATEGORY(CATEGORY_CODE)
);

DESC BOOK;
SELECT * FROM BOOK;

-- BOOKCATEGORY DATA
INSERT INTO BOOKCATEGORY VALUES (100, 'ö��', '3�� �ι���');
INSERT INTO BOOKCATEGORY VALUES (200, '�ι�', '3�� �ι���');
INSERT INTO BOOKCATEGORY VALUES (300, '�ڿ�����', '4�� ���н�');
INSERT INTO BOOKCATEGORY VALUES (400, 'IT', '4�� ���н�');
-- BOOK DATA
INSERT INTO BOOK VALUES (100, '100A01', 'ö������ ��', '��������', 2021);
INSERT INTO BOOK (CATEGORY_CODE, bookNO, bookNAME, PUBLISHER) 
            VALUES (400, '400A01', '�̰���DB��', '��������');
            
SELECT * FROM BOOK;
SELECT * FROM BOOKCATEGORY;

--������ ������
SELECT * FROM BOOKCATEGORY; --  200, 300, 400
SELECT * FROM BOOK ; --  400
DELETE FROM BOOKCATEGORY WHERE CATEGORY_CODE=100; -- CHILD���� �����ϰ� �ִ� ������
DELETE FROM BOOK WHERE CATEGORY_CODE=100;
DELETE FROM BOOKCATEGORY WHERE CATEGORY_CODE=100; -- �����ϴ� �����Ͱ� ������ ���� ����
DELETE FROM BOOKCATEGORY CATEGORY WHERE CATEGORY_CODE IN (200,300);
DELETE FROM BOOK;
SELECT * FROM BOOK;
COMMIT;
DELETE FROM BOOKCATEGORY; -- �ڽ� ���̺� �����ϴ� �����Ͱ� ���� ��� DELETE ����
DROP TABLE BOOK;
DROP TABLE BOOKCATEGORY;
DROP TABLE BOOKCATEGORY CASCADE CONSTRAINTS; -- ����

--�� DCL ( ����ڰ��� ����, ����ڱ��� �ο�, ���� ��Ż, ����ڰ��� ����)
CREATE USER scott2 IDENTIFIED BY tiger; --scott2 ���� ����
-- ���� �ο�(���Ǻο�)
GRANT CREATE SESSION TO scott2;
-- ���Ѻο�(TABLE, VIEW����)
CREATE ROLE ROLEex;
GRANT CREATE TABLE, CREATE VIEW TO ROLEex;
GRANT ROLEex TO scott2;
--���Ѻο� (EMP ���̺��� ��� ����)
GRANT ALL ON EMP TO scott2;
-- ���� �ο�(DEPT���̺��� SELECT ����)
GRANT ALL ON DEPT TO scott2;

-- ���� ��Ż(DEPT���̺�, EMP���̺� ����) ; ���� ���� ��
REVOKE ALL ON EMP FROM scott2;
REVOKE ALL ON DEPT FROM scott2;
-- ����� ���� ����(�������� ���� ���� �Ұ�)
DROP USER scott2 CASCADE;

