SELECT * FROM EMP WHERE ENAME LIKE '%'||'A'||'%';
SELECT * FROM EMP WHERE JOB LIKE '%'||'A'||'%';
SELECT * FROM EMP WHERE DEPTNO=20;
-- Dept.xml의 id=deptList
SELECT * FROM DEPT;
-- Emp.xml의 id=empList
SELECT * FROM EMP; -- 1
SELECT * FROM EMP WHERE ENAME LIKE '%'||'A'||'%'; -- 2
SELECT * FROM EMP WHERE ENAME LIKE '%'||'A'||'%' AND JOB LIKE '%'||'M'||'%'; --3
SELECT * FROM EMP WHERE ENAME LIKE '%'||'A'||'%' AND JOB LIKE '%'||'M'||'%' AND DEPTNO=20; -- 4
-- Dept.xml의 id=deptList
SELECT * FROM DEPT;