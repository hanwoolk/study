package com.lec.ex2selectWhere;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

// 사용자에게 원하는 부서번호를 받아 부서 정보를 뿌리고, 해당 부서의 사원 정보도 출력
	// 1. 해당 부서 번호가 없는 경우 : 존재하지 않는 부서입니다.
	// 2. 해당 부서 번호가 있는 경우 : 부서 정보를 출력
		// 2-1. 해당 부서 사원이 있는 경우: 사원 정보를 출력
		// 2-2. 해당 부서 사원이 없는 경우 : 해당 부서 사원(사번, 이름, 급여, 상사이름)이 없습니다.
public class Ex2_selectWhereDeptno2 {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Scanner scanner = new Scanner(System.in);
		System.out.println("열람하실 원하는 부서 번호는?");
		int deptno = scanner.nextInt();
		String sql = "SELECT * FROM DEPT WHERE DEPTNO="+deptno;
		String sql2 = "SELECT E1.EMPNO , E1.ENAME WORKER, E1.SAL ,E2.ENAME MANAGER "
					+ "FROM EMP E1, EMP E2 "  
					+ "WHERE E1.MGR=E2.EMPNO AND E1.DEPTNO="+deptno;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "scott","tiger");
			stmt = conn.createStatement();
			rs	 = stmt.executeQuery(sql);
			if(rs.next()) {
				String dname = rs.getString("dname");
				String loc	 = rs.getString("loc");
				System.out.println(deptno +"번 부서 정보는 다음과 같습니다.");
				System.out.println("부서명 : "+dname);
				System.out.println("부서 위치 : "+loc);
				rs.close();
				rs = stmt.executeQuery(sql2);
				if(rs.next()) {
					System.out.println("사번\t이름\t급여\t상사명");
					do {
						int 	empno 	= rs.getInt("empno");
						String	worker 	= rs.getString("worker");
						int		sal		= rs.getInt("sal");
						String	manager = rs.getString("manager");
						System.out.println(empno +"\t"+ worker +"\t"+ sal +"\t"+ manager);
					}while(rs.next());
				}else {
					System.out.println("해당 부서 사원이 없습니다.");
				}
			} else {
				System.out.println("존재하지 않는 부서입니다.");
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null)   rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			
		}
	}
}
