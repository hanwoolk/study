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
    -- EX. LOC이 CHICAGO인 사람의 이름, 업무, 급여, 부서명, 근무지를 출력
SELECT ENAME, JOB, SAL, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND LOC = 'CHICAGO';
    -- EX. 부서번호가 10이거나 20번인 사원의 이름, 업무, 근무지를 출력(급여순)
SELECT ENAME, JOB, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO IN (10,20) ORDER BY E.SAL;
    -- EX. JOB이 SALESMAN이거나 MANAGER인 사원의 이름, 급여, 상여, 연봉((SAL+COMM)*12), 부서명, 근무지, 근무지 출력(연봉이 큰 순으로 정렬)
SELECT ENAME, SAL, COMM, (SAL+NVL(COMM,0))*12 ANNUALSAL, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND JOB IN('SALESMAN', 'MANAGER') 
    ORDER BY ANNUALSAL DESC;

SELECT ENAME, SAL, COMM, (SAL+NVL(COMM,0))*12 ANNUALSAL, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND (JOB = 'SALESMAN' OR JOB = 'MANAGER') 
    ORDER BY ANNUALSAL DESC;
    -- EX. COMM이 NULL이고 SAL이 1200이상인 사원의 이름, 급여, 입사일, 부서번호, 부서명 (부서명 순, 급여 큰 순 정렬)
SELECT ENAME, SAL, HIREDATE, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND COMM IS NULL AND SAL>=1200 
    ORDER BY DNAME, SAL DESC;

--?	탄탄다지기 연습문제
--	뉴욕에서 근무하는 사원의 이름과 급여를 출력하시오
SELECT ENAME, SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND LOC = 'NEW YORK';
    
--	ACCOUNTING 부서 소속 사원의 이름과 입사일을 출력하시오
SELECT ENAME, HIREDATE
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND DNAME = 'ACCOUNTING';
    
--	직급이 MANAGER인 사원의 이름, 부서명을 출력하시오
SELECT ENAME, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND JOB = 'MANAGER';
--	Comm이 null이 아닌 사원의 이름, 급여, 부서코드, 근무지를 출력하시오.
SELECT ENAME, SAL, E.DEPTNO, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND COMM IS NOT NULL;

-- ★ 2. NONE-EQUI JOIN 
SELECT * FROM EMP WHERE ENAME = 'SCOTT'; -- 직원 정보
SELECT * FROM SALGRADE; -- 급여 등급 정보
SELECT * FROM EMP, SALGRADE
    WHERE ENAME = 'SCOTT';
SELECT * FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL AND ENAME = 'SCOTT'; --NONE-EQUI JOIN
    -- EX. 모든 사원의 사번, 이름, 직책, 상사 사번, 급여, 급여등급(1등급, 2등급,...)
SELECT EMPNO, ENAME, JOB, MGR, SAL, GRADE||'등급' GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL;

--?	탄탄다지기 연습문제
--	Comm이 null이 아닌 사원의 이름, 급여, 등급, 부서번호, 부서이름, 근무지를 출력하시오.
SELECT ENAME, SAL, GRADE, E.DEPTNO, DNAME, LOC
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL AND COMM IS NOT NULL;
--	이름, 급여, 입사일, 급여등급
SELECT ENAME, SAL, HIREDATE, GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL;
--	이름, 급여, 입사일, 급여등급, 부서명, 근무지
SELECT ENAME, SAL, HIREDATE, GRADE, DNAME, LOC
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL;
--	이름, 급여, 등급, 부서코드, 근무지. 단 comm 이 null아닌 경우
SELECT ENAME, SAL, GRADE,E.DEPTNO, LOC
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL 
        AND COMM IS NOT NULL;
--	이름, 급여, 급여등급, 연봉, 부서명, 부서별 출력, 부서가 같으면 연봉순. 연봉=(sal+comm)*12 comm이 null이면 0
SELECT ENAME, SAL, GRADE, (SAL+NVL(COMM,0))*12 "ANNUAL SAL", DNAME
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL 
        ORDER BY E.DEPTNO, "ANNUAL SAL";
--	이름, 업무, 급여, 등급, 부서코드, 부서명 출력. 급여가 1000~3000사이. 정렬조건 : 부서별, 부서같으면 업무별, 업무같으면 급여 큰순
SELECT ENAME, JOB, SAL, GRADE, E.DEPTNO, DNAME
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL 
        AND SAL BETWEEN 1000 AND 3000 
        ORDER BY DNAME, JOB, SAL DESC;
--	이름, 급여, 등급, 입사일, 근무지. 81년에 입사한 사람. 등급 큰순
SELECT ENAME, SAL, GRADE, HIREDATE, LOC
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL 
        AND TO_CHAR(HIREDATE, 'RR') = 81 
        ORDER BY GRADE DESC;

-- ★ 3. SELF-JOIN FROM절에 별칭 필수
SELECT EMPNO, ENAME, MGR FROM EMP WHERE ENAME = 'SMITH';
SELECT EMPNO, ENAME FROM EMP WHERE EMPNO = 7902; 
SELECT WORKER.EMPNO, WORKER.ENAME, WORKER.MGR, MNG.EMPNO, MNG.ENAME
    FROM EMP WORKER, EMP MNG
    WHERE WORKER.MGR=MNG.EMPNO AND WORKER.ENAME='SMITH';
    -- EX. 모든 사원의 사번, 이름, 상사의 사번, 상사의 이름
SELECT W.EMPNO, W.ENAME, W.MGR, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO; -- 13행 (KING의 MGR이 NULL이라서. EMPNO는 NULL)
DESC EMP;
    -- EX 'SMITH의 상사는 FORD다' 포맷으로 출력
SELECT W.ENAME||'의 상사는'|| M.ENAME||'다' MESSAGER
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;

--?	탄탄 다지기
--	매니저가 KING인 사원들의 이름과 직급을 출력하시오.
SELECT W.ENAME, W.JOB
    FROM EMP W,EMP M
    WHERE W.MGR=M.EMPNO AND M.ENAME = 'KING';
--	SCOTT과 동일한 부서번호에서 근무하는 사원의 이름을 출력하시오
SELECT E2.ENAME
    FROM EMP E1, EMP E2
    WHERE E1.DEPTNO=E2.DEPTNO AND E1.ENAME ='SCOTT' AND E2.ENAME<>'SCOTT';
--	SCOTT과 동일한 근무지에서 근무하는 사원의 이름을 출력하시오(2단계 최종문제)
/*SELECT *
    FROM EMP E, DEPT D1, DEPT D2
    WHERE D1.DEPTNO = D2.DEPTNO 
    AND E.DEPTNO = D1.DEPTNO 
    AND D1.LOC = 'DALLAS'
    AND E.ENAME<>'SCOTT';*/            --DALLAS에서 일하는 사람중 SCOTT만 제외

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
INSERT INTO EMP VALUES (9999, '홍', NULL, NULL, NULL, 6000, NULL, 50);

-- 홍 데이터, 50부서 데이터 원상복귀(삭제)
ROLLBACK;

-- ★ 4. OUTER JOIN : EQUI JOIN & SELF JOIN시 조건에 만족하지 않는 행까지 나타나게
-- (1) SELF JOIN에서의 OUTER JOIN
SELECT W.ENAME, W.MGR, M.EMPNO, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO(+);
    -- EX. "SMITH의 상사는 FORD" ... "KING의 상사는 없다"
SELECT W.ENAME ||'의 상사는' || NVL(M.ENAME,'없다')
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO(+);
    -- EX 말단사원
SELECT W.ENAME, W.MGR, M.EMPNO, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR(+)=M.EMPNO AND W.ENAME IS NULL;
-- (2) EQUI JOIN에서의 OUTER JOIN
SELECT * FROM EMP ; -- 14행
SELECT * FROM DEPT; -- 4행(10,20,30,40 부서)
SELECT * FROM EMP E, DEPT D 
WHERE E.DEPTNO=D.DEPTNO; --40번 부서 출력 안됨
SELECT * FROM EMP E, DEPT D 
WHERE E.DEPTNO(+)=D.DEPTNO; -- 40번 부서 포함

-- ★ <연습문제> PART1
--1. 이름, 직속상사명
SELECT E1.ENAME, E2.ENAME SUPERVISOR
    FROM EMP E1, EMP E2
    WHERE E1.MGR=E2.EMPNO;
--2. 이름, 급여, 업무, 직속상사명
SELECT E1.ENAME, E1.SAL, E1.JOB, E2.ENAME SUPERVISOR
    FROM EMP E1, EMP E2
    WHERE E1.MGR=E2.EMPNO;
--3. 이름, 급여, 업무, 직속상사명 . (상사가 없는 직원까지 전체 직원 다 출력.
    --상사가 없을 시 '없음'으로 출력)
SELECT E1.ENAME, E1.SAL, E1.JOB, NVL(E2.ENAME,'없음') SUPERVISOR
    FROM EMP E1, EMP E2
    WHERE E1.MGR = E2.EMPNO(+);
--4. 이름, 급여, 부서명, 직속상사명
SELECT E1.ENAME, E1.SAL, DNAME, E2.ENAME SUPERVISOR
    FROM EMP E1, EMP E2, DEPT D
    WHERE E1.DEPTNO=D.DEPTNO AND E1.MGR=E2.EMPNO;
--5. 이름, 급여, 부서코드, 부서명, 근무지, 직속상사명, (상사가 없는 직원까지 전체 직원 다 출력)
SELECT E1.ENAME, E1.SAL, E1.DEPTNO, DNAME, LOC, E2.ENAME SUPERVISOR
    FROM EMP E1, EMP E2, DEPT D
    WHERE E1.MGR = E2.EMPNO(+) AND E1.DEPTNO=D.DEPTNO;
--6. 이름, 급여, 등급, 부서명, 직속상사명. 급여가 2000이상인 사람
SELECT E1.ENAME, E1.SAL, GRADE, DNAME, E2.ENAME SUPERVISOR
    FROM EMP E1, DEPT D, EMP E2, SALGRADE
    WHERE E1.MGR=E2.EMPNO AND E1.SAL 
    BETWEEN LOSAL AND HISAL 
    AND E1.DEPTNO=D.DEPTNO 
    AND E1.SAL>=2000;

--7. 이름, 급여, 등급, 부서명, 직속상사명, (직속상사가 없는 직원까지 전체직원 부서명 순 정렬)
SELECT E1.ENAME, E1.SAL, GRADE, DNAME, E2.ENAME SUPERVISOR
    FROM EMP E1, EMP E2, SALGRADE, DEPT D
    WHERE E1.DEPTNO=D.DEPTNO 
    AND E1.MGR=E2.EMPNO(+) 
    AND E1.SAL BETWEEN LOSAL AND HISAL 
    ORDER BY DNAME;
--8. 이름, 급여, 등급, 부서명, 연봉, 직속상사명. 연봉=(급여+comm)*12 단 comm이 null이면 0
SELECT E1.ENAME, E1.SAL, GRADE, DNAME,(E1.SAL+NVL(E1.COMM,0))*12 "ANNUAL SAL", E2.ENAME SUPERVISOR
    FROM EMP E1, EMP E2, SALGRADE, DEPT D
    WHERE E1.DEPTNO=D.DEPTNO 
    AND E1.MGR=E2.EMPNO
    AND E1.SAL BETWEEN LOSAL AND HISAL;
--9. 8번을 부서명 순 부서가 같으면 급여가 큰 순 정렬
SELECT E1.ENAME, E1.SAL, GRADE, DNAME,(E1.SAL+NVL(E1.COMM,0))*12 "ANNUAL SAL", E2.ENAME SUPERVISOR
    FROM EMP E1, EMP E2, SALGRADE, DEPT D
    WHERE E1.DEPTNO=D.DEPTNO 
    AND E1.MGR=E2.EMPNO
    AND E1.SAL BETWEEN LOSAL AND HISAL ORDER BY DNAME, E1.SAL DESC;
--  PART2
--1.EMP 테이블에서 모든 사원에 대한 이름, 부서번호, 부서명을 출력하는 SELECT 문장을 작성하여라.
SELECT ENAME, EMPNO, DNAME
    FROM EMP E,DEPT D
    WHERE E.DEPTNO=D.DEPTNO;
--2. EMP 테이블에서 NEW YORK에서 근무하고 있는 사원에 대하여 이름, 업무, 급여, 부서명을 출력
SELECT ENAME, JOB, SAL, DNAME
    FROM EMP E, DEPT D 
    WHERE E.DEPTNO=D.DEPTNO AND LOC = 'NEW YORK';
--3. EMP 테이블에서 보너스를 받는 사원에 대하여 이름,부서명,위치를 출력
SELECT ENAME, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND COMM >0;
--4. EMP 테이블에서 이름 중 L자가 있는 사원에 대하여 이름,업무,부서명,위치를 출력
SELECT ENAME, JOB, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND ENAME LIKE '%L%';
--5. 사번, 사원명, 부서코드, 부서명을 검색하라. 사원명기준으로 오름차순정열
SELECT EMPNO, ENAME, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO ORDER BY ENAME;
--6. 사번, 사원명, 급여, 부서명을 검색하라. 
    --단 급여가 2000이상인 사원에 대하여 급여를 기준으로 내림차순으로 정열하시오
SELECT EMPNO, ENAME, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND SAL>=2000 ORDER BY SAL DESC;
--7. 사번, 사원명, 업무, 급여, 부서명을 검색하시오. 단 업무가 MANAGER이며 급여가 2500이상인
-- 사원에 대하여 사번을 기준으로 오름차순으로 정열하시오.
SELECT EMPNO, ENAME, JOB, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND JOB = 'MANAGER' AND SAL>=2500 
    ORDER BY EMPNO;
--8. 사번, 사원명, 업무, 급여, 등급을 검색하시오. 단, 급여기준 내림차순으로 정렬하시오
SELECT EMPNO, ENAME, JOB, SAL, GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL 
    ORDER BY SAL DESC;
--9. 사원테이블에서 사원명, 사원의 상사를 검색하시오(상사가 없는 직원까지 전체)
SELECT E1.ENAME,E2.ENAME SUPERVISOR
    FROM EMP E1, EMP E2
    WHERE E1.MGR=E2.EMPNO(+);
--10. 사원명, 상사명, 상사의 상사명을 검색하시오
SELECT E1.ENAME,E2.ENAME SUPERVISOR, E3.ENAME "GRAND SUPERVISOR"
    FROM EMP E1, EMP E2, EMP E3
    WHERE E1.MGR=E2.EMPNO AND E2.MGR=E3.EMPNO;
--11. 위의 결과에서 상위 상사가 없는 모든 직원의 이름도 출력되도록 수정하시오
SELECT E1.ENAME,E2.ENAME SUPERVISOR, E3.ENAME "GRAND SUPERVISOR"
    FROM EMP E1, EMP E2, EMP E3
    WHERE E1.MGR=E2.EMPNO(+) AND E2.MGR=E3.EMPNO(+);


--상사가 없는 직원과 상사가 있는 직원들 모두에 대해 사원명, 급여, 직책, 직속상사명을 출력하시오.

