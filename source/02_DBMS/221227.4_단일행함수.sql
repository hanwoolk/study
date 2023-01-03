--[ IV ] �������Լ�
-- �Լ� = �������Լ� + �׷��Լ�(�����Լ�)
SELECT HIREDATE, TO_CHAR(HIREDATE,'YYYY-MM-DD') FROM EMP; --�����ึ�� ����
SELECT ENAME, INITCAP(ENAME) FROM EMP; -- ������ �Լ�(INPUT 1�� -> OUTPUT 1��)
SELECT SUM(SAL), AVG(SAL) FROM EMP; -- �׷��Լ� (INPUT N�� -> OUTPUT 1��)
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO; -- �׷��Լ� (INPUT N�� -> OUTPUT 1��)

-- �� �������Լ��� ���� : ���ڰ����Լ�, ���ڰ����Լ�, ��¥�����Լ�, ����ȯ�Լ�, NVL(), ETC...
-- 1. ���� �����Լ�
    -- DUAL ���̺� : ����Ŭ���� ������ 1��1��¥�� DUMMY TABLE
SELECT*FROM DUAL;
DESC DUAL;
SELECT * FROM DUMMY;
DESC DUMMY; 
SELECT ABS(-1) FROM DUAL; -- ���밪�Լ�
SELECT FLOOR(34.5678) FROM DUAL; -- �Ҽ������� ����(����)
SELECT FLOOR(34.5678*100)/100 FROM DUAL; --�Ҽ��� ����°�ڸ����� ����(����)
SELECT TRUNC(34.5678,2) FROM DUAL;  -- �Ҽ��� ����°�ڸ����� ����(����)
SELECT TRUNC(34.5678) FROM DUAL;    -- �Ҽ������� ����(����)
SELECT TRUNC(34.5678, -1) FROM DUAL; -- ���� �ڸ����� ����(����)
    -- EX. EMP���̺��� �̸�, �޿�(���� �ڸ����� ����)
SELECT ENAME, TRUNC(SAL,-2) FROM EMP;
SELECT CEIL (34.5678) FROM DUAL; -- �Ҽ������� �ø�
SELECT ROUND (34.5678) FROM DUAL; -- �Ҽ������� �ݿø�
SELECT ROUND (34.5678,2) FROM DUAL; -- �Ҽ��� ����° �ڸ����� �ݿø�
SELECT ROUND (34.5678,-1) FROM DUAL; --�����ڸ����� �ݿø�

SELECT MOD(9,2) FROM DUAL; -- ������ ������
    -- EX. Ȧ���⵵�� �Ի��� ����� ��� ����
SELECT * FROM EMP WHERE MOD(TO_CHAR(HIREDATE,'RR'),2) = 1;
-- 2. ���ڰ����Լ�
-- �� ��ҹ��� ����
SELECT INITCAP('WELCOME TO ORACLE') FROM DUAL; -- ù���ڸ� �빮�ڷ�
SELECT INITCAP('welcome to oracle') FROM DUAL; -- ù���ڸ� �빮�ڷ�
SELECT UPPER('ABCabc') FROM DUAL; -- �빮�ڷ�
SELECT LOWER('ABCabc') FROM DUAL; -- �ҹ��ڷ�
    -- EX. �̸��� SCOTT�� ������ ��� �ʵ�
SELECT * FROM EMP WHERE UPPER(ENAME)='SCOTT';
SELECT * FROM EMP WHERE INITCAP(ENAME)='Scott';
    -- EX. job�� MANAGER�� ������ ��� �ʵ�
SELECT * FROM EMP WHERE UPPER(JOB)='MANAGER';
SELECT * FROM EMP WHERE INITCAP(JOB)='Manager';
SELECT * FROM EMP WHERE LOWER(JOB)='manager';
-- �� ���ڿ���(CONCAT�Լ�, ||������)
SELECT 'AB'||'CD'||'EF'||'GH' FROM DUAL;
SELECT CONCAT(CONCAT('AB','CD'),CONCAT('EF','GH')) FROM DUAL;
    -- EX. SMITH�� MANAGER��
SELECT CONCAT(CONCAT(ENAME,'��'),CONCAT(JOB,'��')) FROM EMP;
SELECT ENAME||'��'||JOB||'��' FROM EMP;

-- �� SUBSTR(STR, ������ġ, ���ڰ���) : STR�� ������ġ���� ���� ������ŭ �����ϴ°�(������ġ�� 1����, ���� �̸� ������ �ڸ����� ����)
  -- SUBSTRB(STR,���۹���Ʈ��ġ, ���ڹ���Ʈ��)
SELECT SUBSTR('ORACLE', 3, 2) FROM DUAL; -- 3��° ���ں��� 2���� ����
SELECT SUBSTRB('ORACLE', 3, 2) FROM DUAL; -- 3��° ����Ʈ���� 2����Ʈ ����
SELECT SUBSTR('�����ͺ��̽�', 4, 3) FROM DUAL; -- 4��° ���ں��� 3���� ���� (���̽�)
SELECT SUBSTRB('�����ͺ��̽�', 4, 3) FROM DUAL; --4��° ����Ʈ���� 3����Ʈ ���� (��)
    --  O R A C L E
    --  1 2 3 4 5 6 (��ġ)
    -- -6-5-6-3-2-1 (��ġ)
SELECT SUBSTR('WELCOME TO ORACLE',-1,1) FROM DUAL; -- -1��° ���ں��� �ѱ��� ����
SELECT SUBSTR('ORACLE', -2,2) FROM DUAL; -- ������ ���� 2���� ����
SELECT SUBSTR(123, 2, 1) FROM DUAL; -- ���ڵ� ����(���ڸ� ���ڷ� �ٲ� 2��° ���� 1���� ����)
    -- EX. 9���� �Ի��� ����� ��� �ʵ� 'RR/MM/DD'
SELECT * FROM EMP WHERE SUBSTR(TO_CHAR(HIREDATE,'RR/MM/DD'),4,2) = '09';
    -- EX. 9�Ͽ� �Ի��� ����� ��� �ʵ� 'RR/MM/DD'
SELECT * FROM EMP WHERE SUBSTR(TO_CHAR(HIREDATE,'RR/MM/DD'),-2,2) = '09';

-- �� LENGTH (STR) : STR�� ���ڼ�
   -- LENGTHB(STR) : STR�� ����Ʈ ��
SELECT LENGTH('ABCD') FROM DUAL; -- ���ڼ�
SELECT LENGTHB('ABCD') FROM DUAL; -- ����Ʈ ��
SELECT LENGTH('����Ŭ') FROM DUAL; -- ��� : 3
SELECT LENGTHB('����Ŭ') FROM DUAL; -- ��� : 9

-- �� INSTR(STR, ã�� ����) : STR���� ù��° ���ں��� ã�� ���ڰ� ������ ��ġ (������ 0)
  -- INTSTR(STR, ã�� ����, ���� ��ġ)STR���� ���� ��ġ�� ���ں��� ã�� ���ڰ� ������ ��ġ
SELECT INSTR('ABCABC', 'B') FROM DUAL; -- ó������ ã�Ƽ� ó�� ������ B�� ��ġ : 2
SELECT INSTR('ABCABC', 'B', 5) FROM DUAL; --3��° ���ں��� ã�Ƽ� ó�� ������ B�� ��ġ : 5
SELECT INSTR('ABCABC', 'B', -3) FROM DUAL; -- �� 3��°���� �ڷ� ã�� ó�� ������ B�� ��ġ : 2
SELECT INSTR('ABCABCABC', 'B', -3) FROM DUAL; -- �� 3��°���� �ڷ� ã�� ó�� ������ B��ġ : 5
    -- EX. 9���� �Ի��� ���(INSTR�̿�) 'RR/MM/DD'
SELECT*FROM EMP WHERE INSTR(TO_CHAR(HIREDATE,'RR/MM/DD'),'09',4)=4;
    -- EX. 9�Ͽ� �Ի��� ���(INSTR���)
SELECT*FROM EMP WHERE INSTR(TO_CHAR(HIREDATE, 'RR/MM/DD'),'09',6)=7;
    -- EX. 9���� �ƴ� �ٸ� ���� �Ի��� ����� ��� �ʵ� (INSTR���)
SELECT*FROM EMP WHERE INSTR(HIREDATE, '09',7) = 0;

-- �� LPAD(STR, �ڸ���, ä�﹮��) : STR�� �ڸ�����ŭ Ȯ���ϰ� ���� �� �ڸ��� ä�� ���ڷ� ���
  -- LPAD(STR, �ڸ���) : STR�� �ڸ�����ŭ Ȯ���ϰ� ���� ���ڸ��� ' '�� ���
  -- RPAD(STR, �ڸ���, ä�﹮��) : STR�� �ڸ�����ŭ Ȯ���ϰ� ������ �� �ڸ��� ä�� ���ڷ� ���
  -- LPAD(STR, �ڸ���) : STR�� �ڸ�����ŭ Ȯ���ϰ� ������ ���ڸ��� ' '�� ���
SELECT LPAD('ORACLE', 10, '#') FROM DUAL;
SELECT RPAD('ORACLE', 10, '#') FROM DUAL;
SELECT ENAME, SAL FROM EMP;
DESC EMP; -- �̸��� 10���ڱ���, SAL�� 5�ڸ����� �Է°���
SELECT RPAD(ENAME, 11,'-'), LPAD(SAL, 6, '*') 
    FROM EMP;
    -- EX. ���, �̸� (7369 S**** / 7654 M***** / 7521 W*** ...)
SELECT EMPNO, RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*') ENAME 
    FROM EMP;
    
    -- ���, �̸�, ��å(9�ڸ�Ȯ��), �Ի���
       -- (7369 SMITH ____****K 80/12/**)
       -- (7499 ALLEN __******N 81/02/**)
SELECT EMPNO, ENAME, 
    LPAD(LPAD(SUBSTR(JOB,-1,1),LENGTH(JOB),'*'),9,'_') JOB , 
    RPAD(SUBSTR(TO_CHAR(HIREDATE,'RR/MM/DD'),1,6),LENGTH(HIREDATE),'*') HIREDATE 
    FROM EMP;
    
SELECT EMPNO, ENAME, 
    LPAD(LPAD(SUBSTR(JOB,-1,1),LENGTH(JOB),'*'),9,'_') JOB , 
    TO_CHAR(HIREDATE,'RR/MM/') || '**'
    FROM EMP;
    -- EX. �̸��� ����° �ڸ� ���ڰ� R�� ����� ��� �ʵ� ���(LIKE�̿�, INSTR�̿�, SUBSTR�̿�)
SELECT * FROM EMP WHERE ENAME LIKE '__R%';
SELECT * FROM EMP WHERE INSTR(ENAME,'R',3)=3; -- RARA���� ��µǱ����� 3��°���ں��� �˻�
SELECT * FROM EMP WHERE SUBSTR(ENAME,3,1)='R';

-- �� ���� ���� : TRIM(STR), LTRIM(STR), RTRIM(STR)
SELECT ('   ORACLE   ') MSG FROM DUAL;
SELECT TRIM('   ORACLE   ') MSG FROM DUAL;
SELECT LTRIM('   ORACLE   ') MSG FROM DUAL;
SELECT RTRIM('   ORACLE   ') MSG FROM DUAL;

-- �� REPLACE(STR, �ٲ���ҹ���, �ٲܹ���) : STR���� �ٲ���� ���ڸ� �ٲ� ���ڷ� ��ü
SELECT REPLACE(ENAME,'A', 'XX') FROM EMP;
SELECT REPLACE(SAL, 0, 'X') FROM EMP;
SELECT REPLACE(HIREDATE, '0', 'X') FROM EMP;

-- 3. ��¥�����Լ� �� �����
-- �� SYSDATE : ���� / SYSTIMESTAMP
SELECT SYSDATE FROM DUAL;
SELECT SYSTIMESTAMP FROM DUAL;
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD HH24:MI:SS';
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD'; -- DATE ���� ���󺹱�
-- �� ��¥ ��� : ����Ŭ Ÿ��(����, ����, ��¥) �� ����, ��¥�� ���� ����
SELECT SYSDATE-1 "���� �� �ð�", SYSDATE, SYSDATE+1 "���� �� �ð�" FROM DUAL;
    -- EX. �ݳ�������
SELECT SYSDATE+14 FROM DUAL;
    -- EX. ������ ���� ~ ��������� ���� ������?
SELECT TRUNC(SYSDATE - TO_DATE('22/11/28 09:30', 'RR/MM/DD HH24:MI')) DAY FROM DUAL;
    -- EX. ���� ~ �����ϱ��� ���� ���Ҵ���?
SELECT TRUNC(TO_DATE('230512 12:20','RRMMDD HH24:MI') - SYSDATE) DAY FROM DUAL;
    -- EX. EMP���� �̸�, �Ի���, �ٹ��ϼ�
SELECT ENAME, HIREDATE, TRUNC((SYSDATE-HIREDATE)/365) "WORK YEAR" FROM EMP;
    --EX. �̸�, �Ի���, �ٹ��ϼ�, �ٹ��ּ�, �ٹ� ���
SELECT ENAME, HIREDATE, TRUNC(SYSDATE-HIREDATE) "WORK DAY",
    TRUNC((SYSDATE-HIREDATE)/7) "WORK WEEK",
    TRUNC((SYSDATE-HIREDATE)/365) "WORK YEAR"
    TRUNC((SYSDATE-HIREDATE)/MONTHS_BETWEEN(SYSDATE,HIREDATE)) "WORK MONTHS"
    FROM EMP;

-- �� MONTHS_BETWEEN(����1, ����2) : �� �������� ������
    -- EX. �̸�, �Ի���, �ٹ�����
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) MONTH FROM EMP;
    -- EX. �̸�, �Ի��� ���� ȸ�翡�� ���� ��(SAL�� 1�⿡ 12��, COMM�� 2��)�� ���
SELECT ENAME, SAL*TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) + 
    NVL(COMM,0)*2*TRUNC((SYSDATE-HIREDATE)/365) FROM EMP;

-- �� ADD_MONTHS (Ư�� ����, ������) ; Ư�� �������� ��� �� ��¥
    -- EX. �̸�, �Ի���, �����������(�����Ⱓ 6����)
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 6) FROM EMP;
    -- �Ի����� 81/08/30�̸� ���� ���� ���� 81/02/28
INSERT INTO EMP VALUES ( 9999,'HONG', 'MANAGER', NULL, '81/08/30', NULL, NULL, 40);
ROLLBACK;

-- �� NEXT_DAY(Ư������, '��') : Ư���������� ó�� �����ϴ� ������
SELECT NEXT_DAY(SYSDATE,'��') FROM DUAL;

-- �� LAST_DAY(Ư������) : Ư�� ������ ���� (28, 29, 30, 31)
SELECT LAST_DAY(SYSDATE) FROM DUAL;
    -- EX. �̸�, �Ի���, ù���޳�(���޳��� ����)
SELECT ENAME, HIREDATE, LAST_DAY(HIREDATE) FROM EMP;

-- �� ROUND(��¥, XX) : ��¥ �ݿø� (XX:YEAR ����� 01/01, MONTH ����� 1��, DAY ����� �Ͽ���)
   -- TRUNC(��¥, XX) : ��¥ ����
SELECT ROUND(34.5678, 2) FROM DUAL;
SELECT ROUND(SYSDATE, 'YEAR')FROM DUAL;  -- ��� : ����� 1��1��
SELECT ROUND(SYSDATE, 'MONTH')FROM DUAL; -- ��� : ����� 1�� (1~15�ϱ����� �̹��� 1��/ 16�� ���Ĵ� ������ 1��)
SELECT ROUND(SYSDATE, 'DAY') FROM DUAL;  -- ��� : ����� �Ͽ���
SELECT ROUND(SYSDATE) FROM DUAL; -- ��� : ����� 0��0��
SELECT TRUNC(SYSDATE, 'YEAR') FROM DUAL; -- ������ 1��1��
SELECT TRUNC(SYSDATE, 'MONTH') FROM DUAL; -- ������ 1��
SELECT TRUNC(SYSDATE, 'DAY') FROM DUAL; -- ���� �Ͽ���
SELECT TO_CHAR(TRUNC(SYSDATE), 'RR/MM/DD HH24:MI') FROM DUAL; -- ���� 0��0��
    -- EX1. �̸�, �Ի���, ù���޳�(11��) : 10�� ���� : �̹��� 11 / 11�� ���ĸ� ������ 11��
SELECT ENAME, HIREDATE, ROUND(HIREDATE+5, 'MONTH') + 10 FROM EMP; -- ���޳� 11��
    -- EX2. ���޳� 10�� : 9�ϱ����� �̹���, 10�Ϻ��ʹ� ������
SELECT ENAME, HIREDATE, ROUND(HIREDATE+6, 'MONTH') + 9 FROM EMP;
    -- EX3. ���޳� 25�� : 24�ϱ����� �̹���, 25�Ϻ��ʹ� ������
SELECT ENAME, HIREDATE, ROUND(HIREDATE-9, 'MONTH') + 24 FROM EMP;
-- 4. ����ȯ �Լ� (TO_CHAR : ���ڷ� ��ȯ�ϴ� �Լ�, TO_DATE : ��¥������ ��ȭ�ϴ� �Լ�)
-- (1) TO_CHAR(��¥��, '�������')
    -- YYYY �⵵4�ڸ� / RR �⵵ 2�ڸ� / MM �� / DD �� / DY ����
    -- HH24 / HH12 / AM�̳� PM / MI �� / SS ��
    -- ������Ŀ� ���ڸ� ������ ��� ""
SELECT ENAME, TO_CHAR(HIREDATE, 'YYYY-MM-DD HH24:MI:SS') FROM EMP;
SELECT TO_CHAR(SYSDATE, 'YYYY"��" MM"��" DD"��" DY"����" AM HH12"��" MI"��"')FROM DUAL;
SELECT TO_CHAR(SYSTIMESTAMP, 'RR-MM-DD AM HH12:MI:SS:FF') FROM DUAL;

-- (2) TO_CHAR(����, '�������')
    -- 0 : �ڸ���, ��������� �ڸ����� ������ 0���� ä��
    -- 9 : �ڸ���, ��������� �ڸ����� ���Ƶ� ���ڸ�ŭ�� ���
    -- , : ���ڸ����� , ����
    -- . : �Ҽ���
    -- $ : ��ȭ���� $�߰��ϰ��� �� ��
    -- L : ������ȭ������  �߰��ϰ��� �� ��
SELECT TO_CHAR(12345678, '000,000,000.00') FROM DUAL; -- 012,345,678.00
SELECT TO_CHAR(12345678, '999,999,999.99') FROM DUAL; -- 12,345,678.00
SELECT TO_CHAR(100.76, '999.9') FROM DUAL; -- �Ҽ��� �ڸ����� ������ ��� �ݿø�
SELECT TO_CHAR(1200, 'L9,999') FROM DUAL;
DESC EMP; -- SAL NUM(7,2) ; ��ü �ڸ����� 7�ڸ�, ���� 2�ڸ��� �Ҽ���
SELECT ENAME, SAL, TO_CHAR(SAL, '$99,999') FROM EMP;

-- (3) TO_DATE(����, '����')
SELECT TO_DATE('20221227 14:53', ' YYYYMMDD HH24:MI') FROM DUAL;
    -- 81/5/1 ~ 83/5/1 ���̿� �Ի��� ������ ��� �ʵ�
SELECT * FROM EMP 
    WHERE HIREDATE BETWEEN TO_DATE('81/05/01','RR/MM/DD') 
        AND TO_DATE('83/05/01','RR/MM/DD');

-- (4) TO_NUMBER(����, "����")
SELECT '3456'+1 FROM DUAL;
SELECT TO_NUMBER('3,456','9,999')+1 FROM DUAL;

-- 5. NVL(NULL�ϼ����ִ� ������, NULL�̶�� ����� ��) - �Ű����� 2���� Ÿ�� ��ġ
    -- EX. ����̸�, ���ӻ���̸�(���ӻ�簡 ������ CEO�� ���)
SELECT W.ENAME, NVL(M.ENAME,'CEO')
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);
    -- EX. ����̸�, ���ۻ���� ���(���ӻ�簡 ������ 'CEO'���)
SELECT ENAME, NVL(TO_CHAR(MGR,9999),'CEO') MGR FROM EMP;
DESC EMP;

-- 6. ETC
-- (1) EXTRACT : �⵵, ��, �ϸ� �����ϰ��� �� ��
SELECT HIREDATE, EXTRACT(YEAR FROM HIREDATE) FROM EMP;  -- �⵵�� ���ڷ� ������
SELECT HIREDATE, TO_CHAR(HIREDATE, 'YYYY') FROM EMP;    -- �⵵ 4�ڸ��� ���ڷ� ������
SELECT SYSDATE, EXTRACT(MONTH FROM SYSDATE) FROM DUAL;  -- ���� ���ڷ� ����
SELECT SYSDATE, TO_CHAR(SYSDATE, 'MM') FROM DUAL;       -- �� 2�ڸ��� ���ڷ� ������
SELECT SYSDATE, EXTRACT(DAY FROM SYSDATE) FROM DUAL;    -- �ϸ� ���ڷ� ������
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DD') FROM DUAL;       -- �� 2�ڸ��� ���ڷ� ������
-- (2) ������ ���
SELECT * FROM EMP;
SELECT LPAD('��', LEVEL*2)|| ENAME FROM EMP
    START WITH MGR IS NULL
    CONNECT BY PRIOR EMPNO = MGR ;

-- <�� ��������>
-- 1. ���� ��¥�� ����ϰ� TITLE�� ��Current Date���� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT SYSDATE "Current Date" FROM DUAL;
-- 2. EMP ���̺��� ���� �޿��� 15%�� ������ �޿��� ����Ͽ�,
-- �����ȣ,�̸�,����,�޿�,������ �޿�(New Salary),������(Increase)�� ����ϴ� SELECT ����
SELECT EMPNO, ENAME, JOB, SAL, 
    SAL*1.15 "New Salary", SAL*0.15 Increase 
    FROM EMP; 
--3. �̸�, �Ի���, �Ի��Ϸκ��� 6���� �� ���ƿ��� ������ ���Ͽ� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, HIREDATE, 
    NEXT_DAY(ADD_MONTHS(HIREDATE,6),'��') "+6Month / Monday"
    FROM EMP;
--4. �̸�, �Ի���, �Ի��Ϸκ��� ��������� ������, �޿�, �Ի��Ϻ��� ��������� ���� �޿��� �Ѱ踦 ���
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) "WORK MONTHS",
    SAL, SAL*TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) "TOTAL SAL"
    FROM EMP;
--5. ��� ����� �̸��� �޿�(15�ڸ��� ��� ������ �� ���� ��*���� ��ġ)�� ���
SELECT ENAME, LPAD(SAL,15,'*') SAL FROM EMP;
--6. ��� ����� ������ �̸�,����,�Ի���,�Ի��� ������ ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, JOB, HIREDATE, TO_CHAR(HIREDATE, 'DY') "DATE"
    FROM EMP;
--7. �̸��� ���̰� 6�� �̻��� ����� ������ �̸�,�̸��� ���ڼ�,������ ���
SELECT ENAME, LENGTH(ENAME) "NAME LEN", JOB
   FROM EMP 
   WHERE LENGTH(ENAME) >= 6 ;
--8. ��� ����� ������ �̸�, ����, �޿�, ���ʽ�, �޿�+���ʽ��� ���
SELECT ENAME, JOB, SAL, 
    NVL(COMM,0) COMM, SAL+NVL(COMM,0) "SAL+COMM" 
    FROM EMP;

-- 9.��� ���̺��� ������� 2��° ���ں��� 3���� ���ڸ� �����Ͻÿ�. 
SELECT SUBSTR(ENAME,2,3) 
    FROM EMP;
--10. ��� ���̺��� �Ի����� 12���� ����� ���, �����, �Ի����� �˻��Ͻÿ�. 
--  �ý��ۿ� ���� DATEFORMAT �ٸ� �� �����Ƿ� �Ʒ��� ����� �˾ƺ��ڿ� (EXTRACT�Լ�, TO_CHAR�Լ�)
SELECT EMPNO, ENAME, HIREDATE
    FROM EMP
    WHERE EXTRACT(MONTH FROM HIREDATE) = 12;

SELECT EMPNO, ENAME, HIREDATE
    FROM EMP
    WHERE TO_CHAR(HIREDATE, 'MM') = 12;
--11. ������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ�
--EMPNO		ENAME		�޿�
--7369		       SMITH		*******800
--7499		       ALLEN		******1600
--7521		       WARD		******1250
--����. 
SELECT EMPNO, ENAME, LPAD(SAL,10,'*') �޿� 
    FROM EMP;
-- 12. ������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ�
-- EMPNO	 ENAME 	�Ի���
-- 7369	  SMITH		1980-12-17
-- ��.
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE, 'YYYY-MM-DD') �Ի��� 
    FROM EMP;
--13. ��� ���̺��� �μ� ��ȣ�� 20�� ����� ���, �̸�, ����, �޿��� ����Ͻÿ�.
    --(�޿��� �տ� $�� �����ϰ�3�ڸ����� ,�� ����Ѵ�)
SELECT EMPNO, ENAME, JOB, TO_CHAR(SAL, '$999,999,999') SAL
    FROM EMP
    WHERE DEPTNO = 20;


















