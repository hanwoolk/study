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













































