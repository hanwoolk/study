--SELECT �μ����� �޾� �ش� �μ� ����� ���(���, �̸�, ����̸�,
--       �޿�, �޿����, ��簡 ���� ����� CEO)������ ���ٰ�
SELECT E1.EMPNO, E1.ENAME WORKER, NVL(E2.ENAME,'CEO') MANAGER, E1.SAL, GRADE
    FROM EMP E1, EMP E2, SALGRADE, DEPT D
    WHERE E1.MGR=E2.EMPNO AND E1.DEPTNO=D.DEPTNO 
        AND E1.SAL BETWEEN LOSAL AND HISAL
        AND DNAME = UPPER('SALES');