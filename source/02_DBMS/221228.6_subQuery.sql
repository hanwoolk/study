--[ VI ] Sub Query : ���� QUERY(SQL��) �ȿ� QUERY(SQL���� ����

--�� 1. �������� ����
    -- ���������� ����� EX �޿��� ���� ���� �޴� ����� �̸��� �޿�
SELECT ENAME, MAX(SAL) FROM EMP;  --����
SELECT ENAME, MANX(SAL) FROM GROUP BY ENAME --������
SELECT ENAME, SAL FROM EMP
    WHERE  SAL = (SELECT MAX(SAL) FROM EMP); -- ���� ����
    
SELECT DNAME 
    --�������� ����(1) ������ ��������(���������� �������� ������) : => >= < <= !=
        -- EX. SCOTT�� �ٹ��ϴ� �μ� �̸����
SELECT DEPTNO FROM EMP E, EPT D WHERE ENAME = 'SCOTT';
SELECT DEPYNO FROM DEPT
        WHERE DEPTNO =(SELECT DEPTNO FROM EMP) ;
        
-- �������� ����(2) ������ ��������(�������� �������� 2���̻�) IN, > ALL, ANY, EXISTS
    -- EX. JOB�� MANAGER�� ����� �μ��̸�
    --EX. JOB�� MANAGER�� ����� �μ���ȣ 
    SELECT DEPTNO FROM EMP WHERE JOB = 'MANAGER'; -- �������� ����� 3��
    SELECT DNAME FROM DEPT
        WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB = 'MANAGER'); -- ��������
        
-- �� 2. �����༭������
    -- EX. SCOTT�� ������ �μ���ȣ���� �ٹ��ϴ� ����� �̸��� �޿�
    SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT'; -- ��������
    SELECT ENAME, SAL FROM EMP
        WHERE DEPTNO=( SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT') AND ENAME<>'SCOTT';-- ��������
    -- EX. SCOTT�� ������ �ٹ������� �ٹ��ϴ� ����� �̸��� �޿�
        --������ �߰� (DALLAS 50�� �μ�, 50�� �μ��� HONG ���
        SELECT * FROM DEPT WHERE LOC='DALLAS';
        INSERT INTO DEPT VALUES (50, 'IT', 'DALLAS');
        INSERT INTO EMP (EMPNO, ENAME, DEPTNO) VALUES ('9999','ȫ', 50);
SELECT*FROM EMP;
SELECT LOC
    FROM EMP E, DEPT D 
    WHERE D.DEPTNO = E.DEPTNO AND ENAME = 'SCOTT'; -- ��������
SELECT ENAME, SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND LOC=(SELECT LOC FROM EMP E, DEPT D 
    WHERE D.DEPTNO = E.DEPTNO AND ENAME = 'SCOTT') AND ENAME!='SCOTT'; -- ��������
    ROLLBACK; -- DML(�߰�,����,����,�˻�) ��ɾ� ���
-- EX. ���� �Ի��ϰ� �����Ի��ڸ� ���
SELECT MIN(HIREDATE) FROM EMP; -- ������ ��������
SELECT HIREDATE, ENAME FROM EMP
    WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP); -- ��������
-- EX. �ֱ� �Ի��ϰ� �ֱ��Ի��ڸ� ���
SELECT MAX(HIREDATE) FROM EMP;
SELECT HIREDATE, ENAME FROM EMP
    WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP); -- ��������
    -- EX. �����Ի���, �����Ի���, �ֱ��Ի���, �ֱ��Ի���, �ֱ��Ի��� �̸�
SELECT E1.HIREDATE, E1.ENAME, E2.HIREDATE, E2.ENAME
    FROM EMP E1, EMP E2
    WHERE E1.HIREDATE = (SELECT MIN(HIREDATE) FROM EMP)
      AND E2.HIREDATE = (SELECT MAX(HIREDATE) FROM EMP); -- ��������
      
SELECT 
   (SELECT MIN(HIREDATE) FROM EMP) FISTDAY,
   (SELECT ENAME FROM EMP WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP)) FIRSTMAN,
   (SELECT MAX(HIREDATE) FROM EMP) LASTDAY,
   (SELECT ENAME FROM EMP WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP)) LASTMAN
   FROM DUAL;

    -- EX. SCOTT�� ���� �μ��� �ٹ��ϴ� ������� �޿���
SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT'; -- ��������
SELECT SUM(SAL) FROM EMP 
    WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT'); -- ��������
    --EX. SCOTT�� ������ JOB�� ���� ����� ��� �ʵ�
SELECT JOB FROM EMP WHERE ENAME='SCOTT'; --��������
SELECT * FROM EMP 
    WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME='SCOTT'); -- ��������
    -- EX. DALLAS���� �ٹ��ϴ� ����� �̸��� �μ���ȣ
SELECT DETPNO FROM DEPT WHERE LOC='DALLAS'; --��������
SELECT ENAME, DEPTNO 
    FROM EMP
    WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS');
    -- EX. 'KING'�� ���ӻ���� ����� �̸��� �޿�
SELECT EMPNO FROM EMP WHERE ENAME='KING'; -- ��������
SELECT ENAME, SAL
    FROM EMP
    WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME='KING'); -- ��������

    -- EX1. ��ձ޿� ���Ϸ� �޴� ����� �̸��� �޿��� ���
SELECT AVG(SAL) FROM EMP; -- ��������
SELECT ENAME, SAL
    FROM EMP
    WHERE SAL<=(SELECT AVG(SAL) FROM EMP);
    
    -- EX2. ��ձ޿� ���Ϸ� �޴� ����� �̸��� �޿�, ��ձ޿��� ���
SELECT ENAME, SAL, ROUND((SELECT AVG(SAL) FROM EMP)) AVG_SAL
    FROM EMP
    WHERE SAL<=(SELECT AVG(SAL) FROM EMP);   -- ��������  
    
    -- EX3. ��ձ޿� ���Ϸ� �޴� ����� �̸��� �޿�, ��ձ޿�, ��հ��� ���̸� ���        
SELECT ENAME, SAL, ROUND((SELECT AVG(SAL) FROM EMP)) AVG_SAL, 
    ABS(ROUND((SELECT AVG(SAL) FROM EMP)) - SAL) "SAL DIFF"
    FROM EMP
    WHERE SAL<=(SELECT AVG(SAL) FROM EMP);  
        
-- ������ ���߿� ��������
    -- EX. SCOTT�� JOB�� �μ���ȣ�� ���� ������ ��� �ʵ� ���
SELECT JOB, DEPTNO FROM EMP WHERE ENAME='SCOTT'; -- ������ ���߿� ��������
SELECT * FROM EMP
    WHERE (JOB, DEPTNO) = (SELECT JOB, DEPTNO FROM EMP WHERE ENAME='SCOTT') -- WHWERE( , ) ���� ���� �߿�
    AND ENAME<>'SCOTT';
 
-- �� 3. ������ �������� : IN, (ALL, ANY=SOME,) EXISTS
-- (1) IN : �������� ��� �� �ϳ��� ��ġ�ϸ� ��
    -- EX. �μ��� �Ի����� ���� ���� ����� �̸�, �Ի���, �μ���ȣ
SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO; -- ������ ���߿� ��������
SELECT ENAME, HIREDATE, DEPTNO FROM EMP
    WHERE (DEPTNO, HIREDATE) IN
    (SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO);
    -- EX. �޿��� 3000�̻� �޴� ����� �Ҽӵ� �μ��� ������� ��� �ʵ�
SELECT DEPTNO FROM EMP WHERE SAL>=3000; -- ������ ���Ͽ� ��������
SELECT * FROM EMP
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL>=3000); -- ��������

-- (2) ALL : �������� ����� ��� �����̸� ��
    -- EX. 30�� �μ� �޿� �� ���� ū ������ �� ū �޿��� ������ ��� �ʵ�
SELECT SAL FROM EMP WHERE DEPTNO=30; -- 950, 1250, 1500, 1600, 2850 ��������
SELECT * FROM EMP
    WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO=30); -- ������ �������� �̿�
    
SELECT * FROM EMP
    WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30); -- ������ �������� �̿�
-- (3) ANY=SOME ; �������� ����� �ϳ��� �����ϸ� ��
    -- EX. 30�� �μ������� �ϳ����̶� �޿��� �� ū ������ ��� �ʵ�
SELECT SAL FROM EMP WHERE DEPTNO=30;
SELECT * FROM EMP
    WHERE SAL> ANY (SELECT SAL FROM EMP WHERE DEPTNO=30); -- ������ �������� �̿�

SELECT * FROM EMP
    WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30); -- ������ �������� �̿�

-- (4) EXISTS : �������� ����� �����ϸ� ��
    --���Ӻ��ϰ� �ִ� �������� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL 
    FROM EMP MANAGER
    WHERE EXISTS (SELECT * FROM EMP WHERE MANAGER.EMPNO=MGR); -- �������� �̿�
    
SELECT DISTINCT M.EMPNO, M.ENAME, M.SAL
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO; -- SELF JOIN �̿�

    -- ���Ӻ��ϰ� ���� �������� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL
    FROM EMP MANAGER
    WHERE NOT EXISTS ( SELECT * FROM EMP WHERE MANAGER.EMPNO=MGR); -- �������� �̿�
    
 SELECT M.EMPNO, M.ENAME, M.SAL
    FROM EMP W, EMP M
    WHERE W.MGR(+)=M.EMPNO AND W.ENAME IS NULL;   
    
-- (4)	źź������ (������, ������)
-- EX1. �μ����� ���� �޿��� ���� �޴� ����� ����(��� ��ȣ, ����̸�, �޿�, �μ���ȣ)�� ���(IN ������ �̿�)
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE (DEPTNO,SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- EX2. ����(JOB)�� MANAGER�� ����� ���� �μ��� �μ� ��ȣ�� �μ���� ������ ���(IN)
SELECT DEPTNO, DNAME, LOC
    FROM DEPT
    WHERE DEPTNO IN(SELECT DEPTNO FROM EMP WHERE JOB='MANAGER');
-- EX3 �޿��� 3000�̻��� ����� �� ���� ����� ����� �ش� ��޺� �ְ� ������ �޴� ������� ���, �̸�, ����, �Ի���, �޿�, �޿������ ���
SELECT GRADE, MAX(SAL)
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL AND SAL >=3000
    GROUP BY GRADE;
SELECT EMPNO, ENAME, JOB, HIREDATE, SAL, GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL 
    AND (GRADE,SAL) IN (SELECT GRADE, MAX(SAL)
        FROM EMP, SALGRADE
        WHERE SAL BETWEEN LOSAL AND HISAL AND SAL >=3000
        GROUP BY GRADE);
-- EX4 �����ȭ : �Ի��� �б⺰�� ���� ���� ������ �޴� ������� �б�, ���, �̸�, JOB, �����, �Ի���, �޿�, �󿩸� ����ϼ���
SELECT HIREDATE, CEIL(EXTRACT(MONTH FROM HIREDATE)/3) "QUARTER" FROM EMP;
SELECT HIREDATE, CEIL(TO_CHAR(HIREDATE, 'MM')/3) "QUARTER" FROM EMP;
SELECT HIREDATE, TO_CHAR(HIREDATE, 'Q') "QUARTER" FROM EMP;
SELECT TO_CHAR(HIREDATE, 'Q') "QUARTER", MAX(SAL) FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'Q');
SELECT TO_CHAR(HIREDATE, 'Q') "QUARTER", EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, NVL(COMM,0)
    FROM EMP
    WHERE (TO_CHAR(HIREDATE, 'Q'),SAL) 
    IN (SELECT TO_CHAR(HIREDATE, 'Q') "QUARTER", MAX(SAL) 
            FROM EMP
            GROUP BY TO_CHAR(HIREDATE, 'Q'));
-- EX5 �޿��� 3000�̸��� ��� �߿� ���� �ֱٿ� �Ի��� ����� �����ȣ�� �̸�, ����, �Ի����� ���
SELECT EMPNO, ENAME, SAL, HIREDATE
    FROM EMP
    WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP) AND SAL <3000;

-- EX6 SALESMAN ��� ����� ���� �޿��� ���� �޴� ������� �̸��� �޿��� ����(��� ����)�� ����ϵ� ���� ����� ������� �ʴ´�.(ALL�̿�)
SELECT ENAME, SAL, JOB
    FROM EMP
    WHERE SAL > ALL (SELECT SAL FROM EMP WHERE JOB ='SALESMAN') ;
-- EX7 SALESMAN �Ϻ� � �� ������� �޿��� ���� �޴� ������� �̸��� �޿��� ����(��� ����)�� ����ϵ� ���� ����� ���(ANY)
SELECT ENAME, SAL, JOB
    FROM EMP
    WHERE SAL > ANY (SELECT SAL FROM EMP WHERE JOB ='SALESMAN') ;

    
-- �� �� ��������
--1. ������̺��� ���� ���� �Ի��� ����� �̸�, �޿�, �Ի���
SELECT MIN(HIREDATE) FROM EMP;
SELECT ENAME, SAL, HIREDATE
    FROM EMP
    WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP);
    
-- 2. ȸ�翡�� ���� �޿��� ���� ����� �̸�, �޿�
SELECT ENAME, SAL
    FROM EMP
    WHERE SAL = (SELECT MIN(SAL) FROM EMP);
    
-- 3. ȸ�� ��պ��� �޿��� ���� �޴� ����� �̸�, �޿�, �μ��ڵ�
SELECT ENAME, SAL, DEPTNO
    FROM EMP
    WHERE SAL>(SELECT AVG(SAL) FROM EMP);
    
--4. ȸ�� ��� ������ �޿��� �޴� ����� �̸�, �޿�, �μ���
SELECT ENAME, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND SAL<=(SELECT AVG(SAL) FROM EMP);
    
--5. SCOTT���� ���� �Ի��� ����� �̸�, �޿�, �Ի���, �޿� ���
SELECT ENAME, SAL, HIREDATE, GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL 
    AND HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME ='SCOTT');

--6. 5��(SCOTT���� ���� �Ի��� ����� �̸�, �޿�, �Ի���, �޿� ���)�� �μ��� �߰��ϰ� �޿��� ū �� ����
SELECT ENAME, SAL, HIREDATE, GRADE, DNAME
    FROM EMP E, SALGRADE, DEPT D
    WHERE SAL BETWEEN LOSAL AND HISAL 
    AND E.DEPTNO = D.DEPTNO
    AND HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME ='SCOTT')
    ORDER BY SAL DESC;
    
--7. BLAKE ���� �޿��� ���� ������� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'BLAKE');
    
--8. MILLER���� �ʰ� �Ի��� ����� ���, �̸�, �Ի���
SELECT EMPNO, ENAME, HIREDATE
    FROM EMP
    WHERE HIREDATE>(SELECT HIREDATE FROM EMP WHERE ENAME='MILLER');
    
--9. �����ü ��� �޿����� �޿��� ���� ������� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL > (SELECT AVG(SAL) FROM EMP);
    
--10. CLARK�� ���� �μ���ȣ�̸�, ����� 7698�� ������ �޿����� ���� �޿��� �޴� ����� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='CLARK') 
        AND SAL > (SELECT SAL FROM EMP WHERE EMPNO=7698);
--11.  �����ȭ. CLARK�� ���� �μ����̸�, ����� 7698�� ������ �޿����� ���� �޿��� �޴� ����� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
        AND DNAME = (SELECT DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME='CLARK') 
        AND SAL > (SELECT SAL FROM EMP WHERE EMPNO=7698);

--12. BLAKE�� ���� �μ��� �ִ� ��� ����� �̸��� �Ի�����
SELECT ENAME, HIREDATE
    FROM EMP
    WHERE DEPTNO =(SELECT D.DEPTNO FROM EMP E,DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME = 'BLAKE');
    
--13. ��� �޿� �̻��� �޴� ��� �������� ���ؼ� �����ȣ�� �̸� �� �޿��� ���� ������ ���)
SELECT EMPNO, ENAME
    FROM EMP
    WHERE SAL>(SELECT AVG(SAL) FROM EMP)
    ORDER BY SAL DESC;
        
 -- ���⼭���ʹ� �����༭�������� �����༭������, ������ �����༭������
-- 14.  �̸��� ��T���� �ִ� ����� �ٹ��ϴ� �μ����� �ٹ��ϴ� ��� ������ ��� ��ȣ,�̸�,�޿�(�� ��� �� ���)
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE('%T%'))
    ORDER BY EMPNO;
    
-- 15. �μ� ��ġ�� Dallas�� ��� �������� ���� �̸�,����,�޿�
SELECT ENAME, JOB, SAL
    FROM EMP E, DEPT D 
    WHERE E.DEPTNO = D.DEPTNO AND LOC IN (SELECT LOC FROM DEPT WHERE LOC='DALLAS');

-- 16. EMP ���̺��� King���� �����ϴ� ��� ����� �̸��� �޿�
SELECT ENAME, SAL
    FROM EMP
    WHERE MGR IN (SELECT EMPNO FROM EMP WHERE ENAME = 'KING'); 
    
-- 17. SALES�μ� ����� �̸�, ����
SELECT ENAME, JOB
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO 
    AND DNAME IN (SELECT DNAME FROM DEPT WHERE DNAME='SALES');
    
-- 18. ������ �μ� 30�� ���� ���޺��� ���� ����� ��� �ʵ�
SELECT * FROM EMP
    WHERE SAL >(SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30);
    
-- 19.  FORD�� ������ ���޵� ���� ����� ��� �ʵ�
SELECT * FROM EMP
    WHERE (JOB,SAL) IN (SELECT JOB, SAL FROM EMP WHERE ENAME='FORD');
    
-- 20. �̸��� JONES�� ������ JOB�� ���ų� FORD�� SAL �̻��� �޴� ����� ������ �̸�, ����, �μ���ȣ, �޿�
    -- ��, ������ ���ĺ� ��, ������ ���� ������ ���
SELECT ENAME, JOB, DEPTNO, SAL
    FROM EMP
    WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'JONES') 
        OR SAL>(SELECT SAL FROM EMP WHERE ENAME='FORD')
        ORDER BY JOB, SAL DESC;
        
-- 21. SCOTT �Ǵ� WARD�� ������ ���� ����� ������ �̸�,����,�޿�
SELECT * FROM EMP
    WHERE SAL IN (SELECT SAL FROM EMP WHERE ENAME IN('SCOTT','WARD'));
    
-- 22. CHICAGO���� �ٹ��ϴ� ����� ���� ������ �ϴ� ������� �̸�,����
SELECT ENAME, JOB
    FROM EMP
    WHERE JOB IN (SELECT JOB FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND LOC='CHICAGO'); 
    
-- 23. �μ� ��� ���޺��� ������ ���� ����� ���, �̸�, �޿�, �μ���ȣ
SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO
    FROM EMP E
    WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO);
    -- ���, �̸�, �޿�, �μ���ȣ, �ش� �μ��� ���
SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO,
    ROUND((SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO)) AVG
    FROM EMP E
    WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO);    
    
-- 24. �������� ��� ���޺��� ���� ������ �޴� ����� �μ���ȣ, �̸�, �޿�
SELECT JOB, AVG(SAL) FROM EMP GROUP BY JOB;
SELECT E.DEPTNO, E.ENAME, E.SAL
    FROM EMP E
    WHERE SAL < (SELECT AVG(SAL) FROM EMP WHERE JOB=E.JOB )
    ORDER BY DEPTNO;
-- 25. ��� �� �� �̻����κ��� ���� ���� �� �ִ� ����� ����, �̸�, ���, �μ���ȣ�� ���(��, �μ���ȣ ������ �������� ����)
SELECT JOB, ENAME, EMPNO, DEPTNO
    FROM EMP
    WHERE EMPNO IN (SELECT MGR FROM EMP);
    SELECT * FROM EMP;
-- 26.  ���� ����� ���, �̸�, ����, �μ���ȣ
SELECT EMPNO, ENAME, JOB, DEPTNO
    FROM EMP
    WHERE EMPNO IN (SELECT EMPNO FROM EMP); 