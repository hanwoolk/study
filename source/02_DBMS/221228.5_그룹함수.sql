-- [ V ] 그룹함수 : SUM, AVG, MIN, MAX, COUNT, STDDEV (표준편차), VARIANCE(분산)
SELECT MAX(SAL) FROM EMP;
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO; -- 부서별
SELECT MAX(SAL) FROM EMP; -- 최대급여를 받는 사람의 이름과 최대 급여 VI. 서브쿼리
SELECT ENAME, SAL FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP);

-- ★ 1. 그룹함수들 실습
SELECT ROUND(AVG(SAL),2) FROM EMP;
SELECT AVG(SAL), SUM(SAL)/COUNT(SAL) FROM EMP;
SELECT * FROM ( EMP);
SELECT SUM(COMM) FROM EMP; -- 평균 : 2200/14 (157.14) OR 2200/4(550)
SELECT SUM(COMM), COUNT(COMM), AVG(COMM) FROM EMP; -- 모든 그룹합수는 NULL값을 제외
SELECT COUNT(*) FROM EMP; -- 테이블 행수





































































































