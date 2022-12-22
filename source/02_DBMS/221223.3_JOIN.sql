--[ III ] join : 2개 이상의 테이블을 연결하여 데이터를 검색하는 방법
SELECT * FROM EMP WHERE ENAME = 'SCOTT'; -- 1행
SELECT * FROM DEPT; -- 4행
-- CROSS JOIN (FROM 절에 테이블을 2개이상)
SELECT * FROM EMP, DEPT WHERE ENAME = 'SCOTT'; -- 1(EMP테이블의 갯수)*4(DEPT 테이블 갯수)

SELECT * FROM EMP WHERE ENAME = 'SCOTT';

-- ★ 1. EQUI JOIN(공통필드인 DEPTNO값이 일치되는 조건만 JOIN)
SELECT * FROM EMP, DEPT 
    WHERE ENAME = 'SCOTT' AND EMP.DEPTNO = DEPT.DEPTNO;
    -- EX. 모든 사원의 사번, 이름, JOB, 상사사번, 부서번호, 부서이름, 근무지
SELECT EMPNO, ENAME, JOB, MGR, EMP.DEPTNO, DNAME, LOC 
    FROM EMP, DEPT
        WHERE EMP.DEPTNO = DEPT.DEPTNO;
SELECT EMPNO, ENAME, JOB, MGR, E.DEPTNO, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;
    -- EX. 급여가 2000이상인 직원만 이름, 직책, 급여, 부서명, 근무지
SELECT ENAME, JOB, SAL, DNAME, LOC
    FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO AND SAL>2000;
        -- EX. 20번 부서의 직원만 이름, 부서번호, 근무지 출력
SELECT ENAME, E.DEPTNO, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO = 20;