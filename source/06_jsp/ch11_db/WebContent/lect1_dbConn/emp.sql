SELECT * FROM EMP WHERE JOB='MANAGER'; -- 실행 하고자하는 SQL문을 블럭잡고 ALT + X ex2_oracle.jsp
-- ex3.jsp
SELECT * FROM DEPT;
SELECT * FROM EMP;
SELECT * FROM EMP WHERE DEPTNO LIKE '%'||'';

SELECT * FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME LIKE '%'||''||'%';
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, E.DEPTNO "ENAME", DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME LIKE '%'||'S'||'%';


							int empno		 = rs.getInt("empno");
							String ename = rs.getString("ename");
							String job	 = rs.getString("job");
							int mgr			 = rs.getInt("mgr");
							Date hiredate = rs.getDate("hiredate");
							int sal			 = rs.getInt("sal");
							int deptno 	 = rs.getInt("deptno");
							String dname = rs.getString("dname");