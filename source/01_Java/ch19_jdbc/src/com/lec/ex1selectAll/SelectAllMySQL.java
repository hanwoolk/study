package com.lec.ex1selectAll;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

public class SelectAllMySQL {
	public static void main(String[] args) {
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://127.0.0.1:3306/kimdb?serverTimezone=UTC";
		String sql= "SELECT * FROM PERSONAL"; // 상수와 sql문만 대문자
		Connection	conn = null; // DB 연결 객체
		Statement	stmt = null; // SQL 전송할 객체
		ResultSet	rs 	 = null; // select 전송 결과를 받을 객체
		try {
			Class.forName(driver); // 1단계 드라이버 로드
			conn = DriverManager.getConnection(url, "root","mysql"); // 2단계 DB연결 객체 생성
			stmt = conn.createStatement(); // 3단계 SQL 전송 객체 생성
			//rs=DriverManager.getConnection(url, "root","mysql").createStatement().executeQuery("SELECT * FROM PERSONAL");
			rs	 = stmt.executeQuery(sql); // 4단계 SQL전송 + 5단계 SQL결과 받기
			// 6단계 결과받아 원하는 로직 수행
			System.out.println("사번\t이름\t직책\t\t상사사번\t        입사일\t 급여\t상여\t부서번호");
			while(rs.next()) {
				int		pno 	= rs.getInt("pno");
				String  pname 	= rs.getString("pname"); // pname 타이틀의 필드값
				String	job		= rs.getString(3); // 3번째 필드
				int		manager	= rs.getInt("manager"); //null값은 0
				Date	startdate = rs.getDate("startdate");
				//String	startdate = rs.getString("startdate");
				Timestamp startdate1 = rs.getTimestamp("startdate"); //0시0분0초
				int		pay		= rs.getInt("pay");
				int		bonus	= rs.getInt("bonus");
				int		dno		= rs.getInt("dno");
				if(job.length() <= 7) {
					System.out.printf("%d\t%s\t%s\t\t%d\t %TF\t %d\t%d\t%d\n", 
								pno, pname, job, manager, startdate, pay, bonus, dno);
				}else {
					System.out.printf("%d\t%s\t%s\t%d\t %TF\t %d\t%d\t%d\n", 
							pno, pname, job, manager, startdate, pay, bonus, dno);
				}
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try { // 7단계 연결해제
				if(rs  !=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
