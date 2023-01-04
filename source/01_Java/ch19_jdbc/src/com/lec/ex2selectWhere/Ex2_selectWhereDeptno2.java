package com.lec.ex2selectWhere;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

// ����ڿ��� ���ϴ� �μ���ȣ�� �޾� �μ� ������ �Ѹ���, �ش� �μ��� ��� ������ ���
	// 1. �ش� �μ� ��ȣ�� ���� ��� : �������� �ʴ� �μ��Դϴ�.
	// 2. �ش� �μ� ��ȣ�� �ִ� ��� : �μ� ������ ���
		// 2-1. �ش� �μ� ����� �ִ� ���: ��� ������ ���
		// 2-2. �ش� �μ� ����� ���� ��� : �ش� �μ� ���(���, �̸�, �޿�, ����̸�)�� �����ϴ�.
public class Ex2_selectWhereDeptno2 {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Scanner scanner = new Scanner(System.in);
		System.out.println("�����Ͻ� ���ϴ� �μ� ��ȣ��?");
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
				System.out.println(deptno +"�� �μ� ������ ������ �����ϴ�.");
				System.out.println("�μ��� : "+dname);
				System.out.println("�μ� ��ġ : "+loc);
				rs.close();
				rs = stmt.executeQuery(sql2);
				if(rs.next()) {
					System.out.println("���\t�̸�\t�޿�\t����");
					do {
						int 	empno 	= rs.getInt("empno");
						String	worker 	= rs.getString("worker");
						int		sal		= rs.getInt("sal");
						String	manager = rs.getString("manager");
						System.out.println(empno +"\t"+ worker +"\t"+ sal +"\t"+ manager);
					}while(rs.next());
				}else {
					System.out.println("�ش� �μ� ����� �����ϴ�.");
				}
			} else {
				System.out.println("�������� �ʴ� �μ��Դϴ�.");
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
