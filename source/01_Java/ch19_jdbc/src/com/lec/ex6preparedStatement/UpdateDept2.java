package com.lec.ex6preparedStatement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

// 수정할 부서번호를 받아 존재하는 부서번호인지 확인 후, 부서명, 근무지 입력받아 update
public class UpdateDept2 {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Scanner sc = new Scanner(System.in);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet 	 rs = null;
		String selectQuery = "SELECT COUNT(*) CNT FROM DEPT WHERE DEPTNO=?";
		String updateQuery = "UPDATE DEPT SET DNAME=?, LOC=? WHERE DEPTNO=?";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "scott", "tiger");
			pstmt = conn.prepareStatement(selectQuery);
			//while(true) {
				System.out.print("수정할 부서 번호는?");
				int deptno = sc.nextInt();
				pstmt.setInt(1, deptno); // ?를 채우기
				rs = pstmt.executeQuery();
				rs.next();
				int cnt = rs.getInt("cnt");
				if (cnt == 0) {
					System.out.println("없는 부서입니다.");
				} else {
					System.out.println("수정할 부서 명은?");
					String dname = sc.next();
					System.out.println("수정할 부서 위치는?");
					String loc = sc.next();
					rs.close();
					pstmt.close();
					pstmt = conn.prepareStatement(updateQuery);
					pstmt.setString(1,dname);
					pstmt.setString(2,loc);
					pstmt.setInt(3, deptno);
					int result = pstmt.executeUpdate(); // insert, update, delete
					System.out.println(result > 0 ? "수정성공" : "해당 부서는 없어 수정 실패");
					System.out.println("수정된 부서 번호 : " + deptno);
					System.out.println("수정된 부서명 : " + dname);
					System.out.println("수정된 부서 위치 : " + loc);
				//}
			}
		} catch (java.util.InputMismatchException e) {
			System.out.println("문자를 입력하셨습니다.");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		sc.close();
	}
}