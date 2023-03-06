-- EmpDao에 들어갈 query
-- 전체 리스트 public ArrayList<EmpDto> getListEmp()
SELECT * FROM EMP;
-- ename과 job을 받아 출력 public ArrayList<EmpDto> getListEmp(String ename, String job)
SELECT * FROM EMP 
    WHERE ENAME LIKE '%'||TRIM(UPPER('g'))||'%' AND 
          JOB LIKE '%'||TRIM(UPPER('s'))||'%'; 