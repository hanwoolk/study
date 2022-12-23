--[ III ] join : 2�� �̻��� ���̺��� �����Ͽ� �����͸� �˻��ϴ� ���
SELECT * FROM EMP WHERE ENAME = 'SCOTT'; -- 1��
SELECT * FROM DEPT; -- 4��
-- CROSS JOIN (FROM ���� ���̺��� 2���̻�)
SELECT * FROM EMP, DEPT WHERE ENAME = 'SCOTT'; -- 1(EMP���̺��� ����)*4(DEPT ���̺� ����)

SELECT * FROM EMP WHERE ENAME = 'SCOTT';

-- �� 1. EQUI JOIN(�����ʵ��� DEPTNO���� ��ġ�Ǵ� ���Ǹ� JOIN)
SELECT * FROM EMP, DEPT 
    WHERE ENAME = 'SCOTT' AND EMP.DEPTNO = DEPT.DEPTNO;
    -- EX. ��� ����� ���, �̸�, JOB, �����, �μ���ȣ, �μ��̸�, �ٹ���
SELECT EMPNO, ENAME, JOB, MGR, EMP.DEPTNO, DNAME, LOC 
    FROM EMP, DEPT
        WHERE EMP.DEPTNO = DEPT.DEPTNO;
SELECT EMPNO, ENAME, JOB, MGR, E.DEPTNO, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;
    -- EX. �޿��� 2000�̻��� ������ �̸�, ��å, �޿�, �μ���, �ٹ���
SELECT ENAME, JOB, SAL, DNAME, LOC
    FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO AND SAL>2000;
        -- EX. 20�� �μ��� ������ �̸�, �μ���ȣ, �ٹ��� ���
SELECT ENAME, E.DEPTNO, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO = 20;
    -- EX. LOC�� CHICAGO�� ����� �̸�, ����, �޿�, �μ���, �ٹ����� ���
SELECT ENAME, JOB, SAL, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND LOC = 'CHICAGO';
    -- EX. �μ���ȣ�� 10�̰ų� 20���� ����� �̸�, ����, �ٹ����� ���(�޿���)
SELECT ENAME, JOB, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO IN (10,20) ORDER BY E.SAL;
    -- EX. JOB�� SALESMAN�̰ų� MANAGER�� ����� �̸�, �޿�, ��, ����((SAL+COMM)*12), �μ���, �ٹ���, �ٹ��� ���(������ ū ������ ����)
SELECT ENAME, SAL, COMM, (SAL+NVL(COMM,0))*12 ANNUALSAL, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND JOB IN('SALESMAN', 'MANAGER') 
    ORDER BY ANNUALSAL DESC;

SELECT ENAME, SAL, COMM, (SAL+NVL(COMM,0))*12 ANNUALSAL, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND (JOB = 'SALESMAN' OR JOB = 'MANAGER') 
    ORDER BY ANNUALSAL DESC;
    -- EX. COMM�� NULL�̰� SAL�� 1200�̻��� ����� �̸�, �޿�, �Ի���, �μ���ȣ, �μ��� (�μ��� ��, �޿� ū �� ����)
SELECT ENAME, SAL, HIREDATE, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND COMM IS NULL AND SAL>=1200 
    ORDER BY DNAME, SAL DESC;

--?	źź������ ��������
--	���忡�� �ٹ��ϴ� ����� �̸��� �޿��� ����Ͻÿ�
SELECT ENAME, SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND LOC = 'NEW YORK';
    
--	ACCOUNTING �μ� �Ҽ� ����� �̸��� �Ի����� ����Ͻÿ�
SELECT ENAME, HIREDATE
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND DNAME = 'ACCOUNTING';
    
--	������ MANAGER�� ����� �̸�, �μ����� ����Ͻÿ�
SELECT ENAME, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND JOB = 'MANAGER';
--	Comm�� null�� �ƴ� ����� �̸�, �޿�, �μ��ڵ�, �ٹ����� ����Ͻÿ�.
SELECT ENAME, SAL, E.DEPTNO, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND COMM IS NOT NULL;

-- �� 2. NONE-EQUI JOIN 
SELECT * FROM EMP WHERE ENAME = 'SCOTT'; -- ���� ����
SELECT * FROM SALGRADE; -- �޿� ��� ����
SELECT * FROM EMP, SALGRADE
    WHERE ENAME = 'SCOTT';
SELECT * FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL AND ENAME = 'SCOTT'; --NONE-EQUI JOIN
    -- EX. ��� ����� ���, �̸�, ��å, ��� ���, �޿�, �޿����(1���, 2���,...)
SELECT EMPNO, ENAME, JOB, MGR, SAL, GRADE||'���' GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL;

--?	źź������ ��������
--	Comm�� null�� �ƴ� ����� �̸�, �޿�, ���, �μ���ȣ, �μ��̸�, �ٹ����� ����Ͻÿ�.
SELECT ENAME, SAL, GRADE, E.DEPTNO, DNAME, LOC
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL AND COMM IS NOT NULL;
--	�̸�, �޿�, �Ի���, �޿����
SELECT ENAME, SAL, HIREDATE, GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL;
--	�̸�, �޿�, �Ի���, �޿����, �μ���, �ٹ���
SELECT ENAME, SAL, HIREDATE, GRADE, DNAME, LOC
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL;
--	�̸�, �޿�, ���, �μ��ڵ�, �ٹ���. �� comm �� null�ƴ� ���
SELECT ENAME, SAL, GRADE,E.DEPTNO, LOC
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL 
        AND COMM IS NOT NULL;
--	�̸�, �޿�, �޿����, ����, �μ���, �μ��� ���, �μ��� ������ ������. ����=(sal+comm)*12 comm�� null�̸� 0
SELECT ENAME, SAL, GRADE, (SAL+NVL(COMM,0))*12 "ANNUAL SAL", DNAME
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL 
        ORDER BY E.DEPTNO, "ANNUAL SAL";
--	�̸�, ����, �޿�, ���, �μ��ڵ�, �μ��� ���. �޿��� 1000~3000����. �������� : �μ���, �μ������� ������, ���������� �޿� ū��
SELECT ENAME, JOB, SAL, GRADE, E.DEPTNO, DNAME
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL 
        AND SAL BETWEEN 1000 AND 3000 
        ORDER BY DNAME, JOB, SAL DESC;
--	�̸�, �޿�, ���, �Ի���, �ٹ���. 81�⿡ �Ի��� ���. ��� ū��
SELECT ENAME, SAL, GRADE, HIREDATE, LOC
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL 
        AND TO_CHAR(HIREDATE, 'RR') = 81 
        ORDER BY GRADE DESC;

-- �� 3. SELF-JOIN FROM���� ��Ī �ʼ�
SELECT EMPNO, ENAME, MGR FROM EMP WHERE ENAME = 'SMITH';
SELECT EMPNO, ENAME FROM EMP WHERE EMPNO = 7902; 
SELECT WORKER.EMPNO, WORKER.ENAME, WORKER.MGR, MNG.EMPNO, MNG.ENAME
    FROM EMP WORKER, EMP MNG
    WHERE WORKER.MGR=MNG.EMPNO AND WORKER.ENAME='SMITH';
    -- EX. ��� ����� ���, �̸�, ����� ���, ����� �̸�
SELECT W.EMPNO, W.ENAME, W.MGR, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO; -- 13�� (KING�� MGR�� NULL�̶�. EMPNO�� NULL)
DESC EMP;
    -- EX 'SMITH�� ���� FORD��' �������� ���
SELECT W.ENAME||'�� ����'|| M.ENAME||'��' MESSAGER
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;

--?	źź ������
--	�Ŵ����� KING�� ������� �̸��� ������ ����Ͻÿ�.
SELECT W.ENAME, W.JOB
    FROM EMP W,EMP M
    WHERE W.MGR=M.EMPNO AND M.ENAME = 'KING';
--	SCOTT�� ������ �μ���ȣ���� �ٹ��ϴ� ����� �̸��� ����Ͻÿ�
SELECT E2.ENAME
    FROM EMP E1, EMP E2
    WHERE E1.DEPTNO=E2.DEPTNO AND E1.ENAME ='SCOTT' AND E2.ENAME<>'SCOTT';
--	SCOTT�� ������ �ٹ������� �ٹ��ϴ� ����� �̸��� ����Ͻÿ�(2�ܰ� ��������)
/*SELECT *
    FROM EMP E, DEPT D1, DEPT D2
    WHERE D1.DEPTNO = D2.DEPTNO 
    AND E.DEPTNO = D1.DEPTNO 
    AND D1.LOC = 'DALLAS'
    AND E.ENAME<>'SCOTT';*/            --DALLAS���� ���ϴ� ����� SCOTT�� ����

SELECT E2.ENAME
    FROM EMP E1, DEPT D1, EMP E2, DEPT D2
    WHERE E1.DEPTNO=D1.DEPTNO
    AND E2.DEPTNO=D2.DEPTNO
    AND E1.ENAME='SCOTT'
    AND D1.LOC = D2.LOC
    AND E2.ENAME<>'SCOTT';
    
SELECT*FROM EMP E1, EMP E2, DEPT;

SELECT * FROM EMP;
SELECT * FROM DEPT;
INSERT INTO DEPT VALUES (50, 'IT', 'DALLAS');
INSERT INTO EMP VALUES (9999, 'ȫ', NULL, NULL, NULL, 6000, NULL, 50);

-- ȫ ������, 50�μ� ������ ���󺹱�(����)
ROLLBACK;

-- �� 4. OUTER JOIN : EQUI JOIN & SELF JOIN�� ���ǿ� �������� �ʴ� ����� ��Ÿ����
-- (1) SELF JOIN������ OUTER JOIN
SELECT W.ENAME, W.MGR, M.EMPNO, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO(+);
    -- EX. "SMITH�� ���� FORD" ... "KING�� ���� ����"
SELECT W.ENAME ||'�� ����' || NVL(M.ENAME,'����')
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO(+);
    -- EX ���ܻ��
SELECT W.ENAME, W.MGR, M.EMPNO, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR(+)=M.EMPNO AND W.ENAME IS NULL;
-- (2) EQUI JOIN������ OUTER JOIN
SELECT * FROM EMP ; -- 14��
SELECT * FROM DEPT; -- 4��(10,20,30,40 �μ�)
SELECT * FROM EMP E, DEPT D 
WHERE E.DEPTNO=D.DEPTNO; --40�� �μ� ��� �ȵ�
SELECT * FROM EMP E, DEPT D 
WHERE E.DEPTNO(+)=D.DEPTNO; -- 40�� �μ� ����

-- �� <��������> PART1
--1. �̸�, ���ӻ���
SELECT E1.ENAME, E2.ENAME SUPERVISOR
    FROM EMP E1, EMP E2
    WHERE E1.MGR=E2.EMPNO;
--2. �̸�, �޿�, ����, ���ӻ���
SELECT E1.ENAME, E1.SAL, E1.JOB, E2.ENAME SUPERVISOR
    FROM EMP E1, EMP E2
    WHERE E1.MGR=E2.EMPNO;
--3. �̸�, �޿�, ����, ���ӻ��� . (��簡 ���� �������� ��ü ���� �� ���.
    --��簡 ���� �� '����'���� ���)
SELECT E1.ENAME, E1.SAL, E1.JOB, NVL(E2.ENAME,'����') SUPERVISOR
    FROM EMP E1, EMP E2
    WHERE E1.MGR = E2.EMPNO(+);
--4. �̸�, �޿�, �μ���, ���ӻ���
SELECT E1.ENAME, E1.SAL, DNAME, E2.ENAME SUPERVISOR
    FROM EMP E1, EMP E2, DEPT D
    WHERE E1.DEPTNO=D.DEPTNO AND E1.MGR=E2.EMPNO;
--5. �̸�, �޿�, �μ��ڵ�, �μ���, �ٹ���, ���ӻ���, (��簡 ���� �������� ��ü ���� �� ���)
SELECT E1.ENAME, E1.SAL, E1.DEPTNO, DNAME, LOC, E2.ENAME SUPERVISOR
    FROM EMP E1, EMP E2, DEPT D
    WHERE E1.MGR = E2.EMPNO(+) AND E1.DEPTNO=D.DEPTNO;
--6. �̸�, �޿�, ���, �μ���, ���ӻ���. �޿��� 2000�̻��� ���
SELECT E1.ENAME, E1.SAL, GRADE, DNAME, E2.ENAME SUPERVISOR
    FROM EMP E1, DEPT D, EMP E2, SALGRADE
    WHERE E1.MGR=E2.EMPNO AND E1.SAL 
    BETWEEN LOSAL AND HISAL 
    AND E1.DEPTNO=D.DEPTNO 
    AND E1.SAL>=2000;

--7. �̸�, �޿�, ���, �μ���, ���ӻ���, (���ӻ�簡 ���� �������� ��ü���� �μ��� �� ����)
SELECT E1.ENAME, E1.SAL, GRADE, DNAME, E2.ENAME SUPERVISOR
    FROM EMP E1, EMP E2, SALGRADE, DEPT D
    WHERE E1.DEPTNO=D.DEPTNO 
    AND E1.MGR=E2.EMPNO(+) 
    AND E1.SAL BETWEEN LOSAL AND HISAL 
    ORDER BY DNAME;
--8. �̸�, �޿�, ���, �μ���, ����, ���ӻ���. ����=(�޿�+comm)*12 �� comm�� null�̸� 0
SELECT E1.ENAME, E1.SAL, GRADE, DNAME,(E1.SAL+NVL(E1.COMM,0))*12 "ANNUAL SAL", E2.ENAME SUPERVISOR
    FROM EMP E1, EMP E2, SALGRADE, DEPT D
    WHERE E1.DEPTNO=D.DEPTNO 
    AND E1.MGR=E2.EMPNO
    AND E1.SAL BETWEEN LOSAL AND HISAL;
--9. 8���� �μ��� �� �μ��� ������ �޿��� ū �� ����
SELECT E1.ENAME, E1.SAL, GRADE, DNAME,(E1.SAL+NVL(E1.COMM,0))*12 "ANNUAL SAL", E2.ENAME SUPERVISOR
    FROM EMP E1, EMP E2, SALGRADE, DEPT D
    WHERE E1.DEPTNO=D.DEPTNO 
    AND E1.MGR=E2.EMPNO
    AND E1.SAL BETWEEN LOSAL AND HISAL ORDER BY DNAME, E1.SAL DESC;
--  PART2
--1.EMP ���̺��� ��� ����� ���� �̸�, �μ���ȣ, �μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT ENAME, EMPNO, DNAME
    FROM EMP E,DEPT D
    WHERE E.DEPTNO=D.DEPTNO;
--2. EMP ���̺��� NEW YORK���� �ٹ��ϰ� �ִ� ����� ���Ͽ� �̸�, ����, �޿�, �μ����� ���
SELECT ENAME, JOB, SAL, DNAME
    FROM EMP E, DEPT D 
    WHERE E.DEPTNO=D.DEPTNO AND LOC = 'NEW YORK';
--3. EMP ���̺��� ���ʽ��� �޴� ����� ���Ͽ� �̸�,�μ���,��ġ�� ���
SELECT ENAME, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND COMM >0;
--4. EMP ���̺��� �̸� �� L�ڰ� �ִ� ����� ���Ͽ� �̸�,����,�μ���,��ġ�� ���
SELECT ENAME, JOB, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND ENAME LIKE '%L%';
--5. ���, �����, �μ��ڵ�, �μ����� �˻��϶�. ������������ ������������
SELECT EMPNO, ENAME, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO ORDER BY ENAME;
--6. ���, �����, �޿�, �μ����� �˻��϶�. 
    --�� �޿��� 2000�̻��� ����� ���Ͽ� �޿��� �������� ������������ �����Ͻÿ�
SELECT EMPNO, ENAME, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND SAL>=2000 ORDER BY SAL DESC;
--7. ���, �����, ����, �޿�, �μ����� �˻��Ͻÿ�. �� ������ MANAGER�̸� �޿��� 2500�̻���
-- ����� ���Ͽ� ����� �������� ������������ �����Ͻÿ�.
SELECT EMPNO, ENAME, JOB, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND JOB = 'MANAGER' AND SAL>=2500 
    ORDER BY EMPNO;
--8. ���, �����, ����, �޿�, ����� �˻��Ͻÿ�. ��, �޿����� ������������ �����Ͻÿ�
SELECT EMPNO, ENAME, JOB, SAL, GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL 
    ORDER BY SAL DESC;
--9. ������̺��� �����, ����� ��縦 �˻��Ͻÿ�(��簡 ���� �������� ��ü)
SELECT E1.ENAME,E2.ENAME SUPERVISOR
    FROM EMP E1, EMP E2
    WHERE E1.MGR=E2.EMPNO(+);
--10. �����, ����, ����� ������ �˻��Ͻÿ�
SELECT E1.ENAME,E2.ENAME SUPERVISOR, E3.ENAME "GRAND SUPERVISOR"
    FROM EMP E1, EMP E2, EMP E3
    WHERE E1.MGR=E2.EMPNO AND E2.MGR=E3.EMPNO;
--11. ���� ������� ���� ��簡 ���� ��� ������ �̸��� ��µǵ��� �����Ͻÿ�
SELECT E1.ENAME,E2.ENAME SUPERVISOR, E3.ENAME "GRAND SUPERVISOR"
    FROM EMP E1, EMP E2, EMP E3
    WHERE E1.MGR=E2.EMPNO(+) AND E2.MGR=E3.EMPNO(+);
