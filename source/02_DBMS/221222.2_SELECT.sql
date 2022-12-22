--[ II ] SELECT문 - 조회
-- 1. SELECT 문장 작성법
    -- 현재 계정(실행 : CTRL + ENTER)
SHOW USER ;
SELECT * FROM TAB; -- 현 계정이 가지고있는 테이블 정보
SELECT * FROM EMP; -- EMP 테이블의 모든 열(필드), 모든 행
SELECT * FROM DEPT; --DEPT 테이블의 모든 열(필드), 모든 행
SELECT * FROM SALGRADE;

-- 2. 특정 열만 출력
-- DESC EMP테이블의 구조
DESC EMP;   
SELECT EMPNO, ENAME, SAL, JOB FROM EMP; -- EMPNO, ENAME, SAL, JOB필드 모든 행 검색
SELECT EMPNO, ENAME, SAL, JOB, MGR, SAL, COMM FROM EMP;
SELECT EMPNO AS "사 번", ENAME AS "이름", SAL AS "급여", JOB AS "직책" FROM EMP;
SELECT EMPNO  "사 번", ENAME  "이름", SAL  "급여", JOB  "직책" FROM EMP;
SELECT EMPNO  "사 번", ENAME  이름, SAL  급여, JOB  직책 FROM EMP;
SELECT EMPNO NO, ENAME NAME, SAL SALARY, JOB FROM EMP; -- 필드에 별칭을 두는 경우

-- 3. 특정 행 출력 : WHERE 절(조건절) --비교연산자 : 같다(=), 다르다(!+, ^=, <>)
SELECT EMPNO "사번", ENAME "이름", SAL "급여" FROM EMP WHERE SAL = 3000; --같다
SELECT EMPNO NO, ENAME NAME, SAL FROM EMP WHERE SAL != 3000; --다르다
SELECT EMPNO NO, ENAME NAME, SAL FROM EMP WHERE SAL ^= 3000; --다르다
SELECT EMPNO NO, ENAME NAME, SAL FROM EMP WHERE SAL <> 3000; --다르다
    -- 비교연산자는 숫자, 문자, 날짜형 모두 가능
    -- ex 1. 사원 이름(ENAME)이 'A','B','C'로 시작하는 사원의 모든 필드
    -- A < AA < AAA < AAAA < AAAAA < AAAAAA < AAAAAAA < AA...A< A...AB
SELECT * FROM EMP WHERE ENAME < 'D';
    -- EX 2. 81년도 이전에 입사한 사원의 모든 필드
SELECT * FROM EMP WHERE HIREDATE < '81/01/01';
    -- EX 3. 10번 부서번호 (DEPTNO)가 10번 사원의 모든 필드
SELECT * FROM EMP WHERE DEPTNO =10;
    -- EX 4. 이름(ENAME) 이 FORD인 직원의 EMPNO, ENAME, MGR(상사의 사번)을 출력
    -- SQL문 대소문자 구별 없음. 데이터 대소문자 구별
select empno, ename, mgr from emp where ename ='FORD';

-- 4. 조건절에 논리연산자 : AND OR NOT
    -- EX 1. 급여(SAL)가 2000이상 3000이하인 직원의 모든 필드
SELECT * FROM EMP WHERE SAL >=2000 AND SAL<=3000;
    -- EX 2. 82년도에 입사한 사원의 모든 필드
SELECT * FROM EMP WHERE HIREDATE >= '82/01/01' AND HIREDATE < '83/01/01';
-- 날짜 표기법 셋팅 (현재 : YY/MM/DD 또는 RR/MM/DD)
ALTER SESSION SET NLS_DATE_FORMAT = 'MM-DD-YYYY';
SELECT * FROM EMP;
SELECT * FROM EMP WHERE HIREDATE >= '01-01-1982' AND HIREDATE < '01-01-1983';
SELECT * FROM EMP 
    WHERE TO_CHAR(HIREDATE, 'RR/MM/DD')>='82/01/01' 
        AND TO_CHAR(HIREDATE, 'RR/MM/DD')<'83/01/01';
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
    -- EX 3. 연봉이 2400 이상인 직원 ENAME, SAL, 연봉(SAL*12)을 출력
SELECT ENAME, SAL, SAL*12 ANNUALSAL 
    FROM EMP                        -- (1) 
    WHERE ANNUALSAL >= 2400;        -- (2) WHERE절에는 필드 별칭 사용 불가
    
SELECT ENAME, SAL, SAL*12 ANNUALSAL -- (3)
    FROM EMP                        -- (1)
    WHERE SAL*12 >= 2400;            -- (2)
    -- EX 4. 연봉이 10,000 이상인 직원의 ENAME, SAL, 연봉(연봉순으로)
SELECT ENAME, SAL, SAL*12 "연봉"       -- (3)
    FROM EMP                        -- (1)
    WHERE SAL*12 >= 10000           -- (2)
    ORDER BY 연봉;                   -- (4)
    -- EX 5. 10번 부서(DEPTNO)이거나 JOB이 MANAGER인 직원의 모든 필드
SELECT * FROM EMP WHERE DEPTNO=10 OR JOB = 'MANAGER';
    -- EX 6. 부서 번호가 10번 부서가 아닌 직원의 모든 필드
SELECT * FROM EMP WHERE DEPTNO!=10;
SELECT * FROM EMP WHERE NOT DEPTNO=10;

-- 5. 산술연산자
SELECT EMPNO, ENAME, SAL, SAL*1.1 UPSAL FROM EMP;
    -- EX 모든 사원의 이름(ENAME), 월급(SAL), 상여(COMM), 연봉(SAL*12+COMM)을 출력
SELECT ENAME, SAL, COMM, SAL*12+COMM 연봉 FROM EMP;
    -- 산술 연산의 결과는 NULL을 포함하면 결과는 NULL
    -- NVL(NULL일 수도 있는 필드명, 대치값)을 이용 , 필드명과 대치값은 타입이 일치
SELECT ENAME, SAL, COMM, SAL*12+NVL(COMM,0) 연봉 FROM EMP;
    -- 모든 사원의 ENAME, MGR(상사 사번) 을 출력 (상사가 없으면 CEO로 출력)
SELECT ENAME, NVL(TO_CHAR(MGR),'CEO') MGR FROM EMP;

-- 6. 연결연산자(||) : 필드나 문자를 연결
SELECT ENAME || '은' || JOB EMPLOYEE FROM EMP;
    -- EX. 모든 사원에 대하여 'SMITH : 1YEAR ANNUAL SALARY = XXXX' 포맷으로 출력 (연봉 = SAL*12+COMM)
SELECT ENAME || ': 1YEAR ANNUAL SALARY = ' || (SAL*12+NVL(COMM,0)) MESSAGE FROM EMP; -- 연결 연산자가 산술 연산자보다 우선순위가 높아 () 사용

-- 7. 중복제거(DISTINCT)
SELECT DISTINCT JOB FROM EMP;
SELECT DISTINCT DEPTNO FROM EMP;

-- ★ 연습문제 꼭 풀기
--1. emp 테이블의 구조 출력
DESC EMP;

--2. emp 테이블의 모든 내용을 출력 
SELECT * 
    FROM EMP;
    
--3. 현 scott 계정에서 사용가능한 테이블 출력
SHOW USER;
SELECT * 
    FROM TAB;
    
--4. emp 테이블에서 사번, 이름, 급여, 업무, 입사일 출력
SELECT EMPNO, ENAME, SAL, JOB, HIREDATE 
    FROM EMP;
    
--5. emp 테이블에서 급여가 2000미만인 사람의 사번, 이름, 급여 출력
SELECT EMPNO, ENAME, SAL 
    FROM EMP 
        WHERE SAL<2000;
        
--6. 입사일이 81/02이후에 입사한 사람의 사번, 이름, 업무, 입사일 출력
SELECT EMPNO, ENAME, JOB, HIREDATE 
    FROM EMP 
        WHERE TO_CHAR(HIREDATE, 'RR/MM')>='82/02';
        
--7. 업무가 SALESMAN인 사람들 모든 자료 출력
SELECT * 
    FROM EMP 
        WHERE JOB = 'SALESMAN';
        
--8. 업무가 CLERK이 아닌 사람들 모든 자료 출력
SELECT * 
    FROM EMP 
        WHERE NOT JOB = 'CLERK';
        
--9. 급여가 1500이상이고 3000이하인 사람의 사번, 이름, 급여 출력
SELECT EMPNO, ENAME, SAL 
    FROM EMP 
        WHERE SAL >=1500 AND SAL <= 3000;
        
--10. 부서코드가 10번이거나 30인 사람의 사번, 이름, 업무, 부서코드 출력
SELECT EMPNO, ENAME, JOB, DEPTNO 
    FROM EMP 
        WHERE DEPTNO=10 OR DEPTNO=30;
        
--11. 업무가 SALESMAN이거나 급여가 3000이상인 사람의 사번, 이름, 업무, 부서코드 출력
SELECT EMPNO, ENAME, JOB, DEPTNO 
    FROM EMP 
        WHERE JOB = 'SALESMAN' OR SAL >=3000;
        
--12. 급여가 2500이상이고 업무가 MANAGER인 사람의 사번, 이름, 업무, 급여 출력
SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE SAL>=2500 AND JOB = 'MANAGER';

--13.“ename은 XXX 업무이고 연봉은 XX다” 스타일로 모두 출력(연봉은 SAL*12+COMM)
SELECT ename ||'은'||job ||'업무이고 연봉은'|| (sal*12+NVL(COMM,0)) ||'다' FROM EMP;

-- CF."ENAME의 상여는 800" (연결연산자로 하면 NULL은 출력 안 됨)
SELECT ENAME||'의 상여는'||NVL(COMM,0) FROM EMP;

--------------------------------------------------------------------------------
-- 8. SQL연산자(BETWEEN, IN, LIKE, IS NULL)
 -- (1) BETWEEN A AND B; A부터 B까지 (A,B포함)
    -- EX. SAL이 1500이상 3000이하인 직원의 사번, 이름, 금여
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL>=1500 AND SAL<=3000;
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL BETWEEN 1500 AND 3000; --숫자 문자 날짜
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL BETWEEN 3000 AND 1500; --불가
    -- EX. SAL이 1500미만 3000초과
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL NOT BETWEEN 1500 AND 3000;
    -- EX. 이름이 'A','B','C'로 시작하는 직원의 모든 필드
SELECT * FROM EMP WHERE ENAME BETWEEN 'A' AND 'D' AND ENAME!='D'; -- 'A'부터 'D'까지 / 'D'는 제외
    -- EX. 82년도에 입사한 직원의 모든 필드 출력
SELECT * FROM EMP WHERE HIREDATE BETWEEN '82/01/01' AND '82/12/31';

 -- (2) IN 
    -- EX. 부서 번호가 10, 20, 40인 직원의 모든 필드 출력
SELECT * FROM EMP WHERE DEPTNO=10 OR DEPTNO=20 OR DEPTNO=40;
SELECT * FROM EMP WHERE DEPTNO IN(10,20,40); -- 숫자 문자 날짜
    -- EX. 부서 번호가 10, 20, 40을 제외한 직원의 모든 필드 출력
SELECT * FROM EMP WHERE NOT(DEPTNO=10 OR DEPTNO=20 OR DEPTNO=40);
SELECT * FROM EMP WHERE DEPTNO NOT IN(10,20,40);
    -- EX. 사번이 7902, 7788, 7566인 사원의 모든 필드
SELECT * FROM EMP WHERE EMPNO IN(7902, 7788, 7566);
    -- EX. 직책이 MANAGER이거나 ANALYST인 사원의 모든 필드
SELECT * FROM EMP WHERE JOB IN('MANAGER','ANALYST');    

 -- (3) LIKE %(0글자이상),_(한글자)를 포함한 패턴
    -- EX. 이름이 M으로 시작하는 사원의 모든 필드
SELECT * FROM EMP WHERE ENAME LIKE 'M%'; -- M, MA, MAA,..., MZZZZ..
    -- EX. 이름에 N이 들어가는 사원의 모든 필드
SELECT * FROM EMP WHERE ENAME LIKE '%N%';
    -- EX. 이름에 N이 들어가거나 JOB에 N이 들어가는 모든 사원의 필드
SELECT * FROM EMP WHERE ENAME LIKE '%N%' OR JOB LIKE '%N%';
    -- EX. 이름이 'S'로 끝나는 사원의 모든 필드
SELECT * FROM EMP WHERE ENAME LIKE '%S';
    -- EX. SAL이 5로 끝나는 사원의 모든 필드
SELECT * FROM EMP WHERE SAL LIKE '%5';
    -- EX. 82년도에 입사한 사원의 모든 필드
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'RR/MM/DD') LIKE '82/%';
    -- EX. 1월에 입사한 사원의 모든 필드
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'RR/MM/DD') LIKE '%/01/%';
    -- EX. 이름에 '%'가 들어간 사원의 모든 필드
INSERT INTO EMP VALUES (9999, 'LISA%', NULL, NULL, NULL, 6000, 1500, 40); -- 추가
SELECT * FROM EMP WHERE ENAME='LISA%';
SELECT * FROM EMP WHERE ENAME LIKE '%\%%' ESCAPE '\';
ROLLBACK; -- DML(데이터 조작어;추가, 수정, 삭제)를 취소 검색은 제외

    --(4) IS NULL (NULL인지를 검색할때는 반드시)
      -- EX. 상여금이 없는 사원의 모든 필드 출력(COMM이 NULL, 0)
SELECT * FROM EMP WHERE COMM IS NULL OR COMM = 0;
      -- EX. 상여금을 받는 사원의 모든
SELECT * FROM EMP WHERE COMM IS NOT NULL AND COMM != 0;      
SELECT * FROM EMP WHERE NOT COMM IS NULL AND COMM != 0;    
--SELECT * FROM EMP WHERE COMM NOT IS NULL AND COMM != 0; 불가  
--SELECT * FROM EMP WHERE COMM != NULL AND COMM != 0; 불가    

 -- 9. 정렬(오름차순, 내림차순) ; ORDER BY 절 
SELECT ENAME, SAL, HIREDATE FROM EMP ORDER BY SAL ASC; -- 급여 오름차순 정렬(ASC은 생략 가능)
SELECT ENAME, SAL, HIREDATE FROM EMP ORDER BY SAL DESC;-- 급여 내림파순 정렬
SELECT ENAME, SAL, HIREDATE FROM EMP ORDER BY SAL DESC, HIREDATE DESC; --급여 내림차순, 입사일 내림차순
SELECT ENAME, SAL, HIREDATE FROM EMP ORDER BY ENAME ; -- ABC순 정렬
SELECT ENAME, SAL, HIREDATE FROM EMP ORDER BY HIREDATE;
SELECT ENAME, SAL, SAL*12+NVL(COMM,0) ANNUALSAL FROM EMP ORDER BY ANNUALSAL;
SELECT ENAME, SAL, SAL*12+NVL(COMM,0) ANNUALSAL FROM EMP ORDER BY SAL*12+NVL(COMM,0);

 --형변환 함수
 -- 날짜형(HIREDATE)을 문자형으로 변환 : TO_CHAR(날짜형 데이터, 패턴)
SELECT TO_CHAR(HIREDATE, 'YYYY-MM-DD') FROM EMP;
 -- 문자형을 날짜형으로 변환 : TO_DATE(문자데이터, 패턴)
 SELECT TO_DATE('01-12-1996','MM-DD-YYYY') FROM DUAL; -- DUAL 1행1열만 있는 가상의 테이블
 ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
 

--<시험 연습문제>

--1.	EMP 테이블에서 sal이 3000이상인 사원의 empno, ename, job, sal을 출력
SELECT EMPNO, ENAME, JOB, SAL 
    FROM EMP 
    WHERE SAL>=3000;
--2.	EMP 테이블에서 empno가 7788인 사원의 ename과 deptno를 출력
SELECT ENAME, DEPTNO 
    FROM EMP 
    WHERE EMPNO = 7788;
--3.	연봉이 24000이상인 사번, 이름, 급여 출력 (급여순정렬)
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL*12>24000 ORDER BY SAL;
--4.	입사일이 1981년 2월 20과 1981년 5월 1일 사이에 입사한 사원의 사원명, 직책, 입사일을 출력 (단 hiredate 순으로 출력)
SELECT ENAME, JOB, HIREDATE 
    FROM EMP 
    WHERE HIREDATE 
        BETWEEN '1981/02/20' AND '1981/05/01' ORDER BY HIREDATE;
        
SELECT ENAME, JOB, HIREDATE 
    FROM EMP 
    WHERE HIREDATE 
        BETWEEN TO_DATE('1981/02/20','YYYY/MM/DD')
            AND TO_DATE('1981/05/01','YYYY/MM/DD') ORDER BY HIREDATE;
--5.	deptno가 10,20인 사원의 모든 정보를 출력 (단 ename순으로 정렬)
SELECT * 
    FROM EMP 
    WHERE DEPTNO IN(10,20) ORDER BY ENAME;
--6.	sal이 1500이상이고 deptno가 10,30인 사원의 ename과 sal를 출력
-- (단 HEADING을 employee과 Monthly Salary로 출력)
SELECT ENAME employee, SAL "Monthly Salary" 
    FROM EMP 
    WHERE SAL>=1500 AND DEPTNO IN (10,30);
--7.	hiredate가 1982년인 사원의 모든 정보를 출력
SELECT * 
    FROM EMP 
    WHERE TO_CHAR(HIREDATE, 'yyyy/mm/dd') LIKE '1982/%/%';
--8.	이름의 첫자가 C부터  P로 시작하는 사람의 이름, 급여 이름순 정렬
SELECT ENAME, SAL 
    FROM EMP 
    WHERE ENAME BETWEEN 'C%' AND 'P%' ORDER BY ENAME; 
--9.	comm이 sal보다 10%가 많은 모든 사원에 대하여 이름, 급여, 상여금을 
--출력하는 SELECT 문을 작성
SELECT ENAME, SAL, COMM 
    FROM EMP 
    WHERE NVL(COMM,0)>SAL*1.1;
--10.	job이 CLERK이거나 ANALYST이고 sal이 1000,3000,5000이 아닌 모든 사원의 정보를 출력
SELECT * 
    FROM EMP 
    WHERE JOB IN ('CLERK' , 'ANALYST') 
        AND SAL NOT IN (1000, 3000, 5000);
--11.	ename에 L이 두 자가 있고 deptno가 30이거나 또는 mgr이 7782인 사원의 
--모든 정보를 출력하는 SELECT 문을 작성하여라.
SELECT * 
    FROM EMP 
    WHERE (ENAME LIKE '%L%L%' AND DEPTNO = 30) 
       OR (ENAME LIKE '%L%L%'AND MGR = 7782);
--12.	입사일이 81년도인 직원의 사번,사원명, 입사일, 업무, 급여를 출력
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL 
    FROM EMP 
    WHERE TO_CHAR(HIREDATE,'yy') = 81;
--13.	입사일이81년이고 업무가 'SALESMAN'이 아닌 직원의 사번, 사원명, 입사일, 
-- 업무, 급여를 검색하시오.
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL 
    FROM EMP 
    WHERE TO_CHAR(HIREDATE,'yy') = 81 AND NOT JOB = 'SALESMAN';
--14.	사번, 사원명, 입사일, 업무, 급여를 급여가 높은 순으로 정렬하고, 
-- 급여가 같으면 입사일이 빠른 사원으로 정렬하시오.
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL 
    FROM EMP
    ORDER BY SAL DESC, HIREDATE;
--15.	사원명의 세 번째 알파벳이 'N'인 사원의 사번, 사원명을 검색하시오
SELECT EMPNO, ENAME 
    FROM EMP 
    WHERE ENAME LIKE '__N%';
--16.	사원명에 'A'가 들어간 사원의 사번, 사원명을 출력
SELECT EMPNO, ENAME 
    FROM EMP 
    WHERE ENAME LIKE '%A%';
--17.	연봉(SAL*12)이 35000 이상인 사번, 사원명, 연봉을 검색 하시오.
SELECT EMPNO, ENAME, SAL*12 연봉
    FROM EMP 
    WHERE SAL*12>=35000;



