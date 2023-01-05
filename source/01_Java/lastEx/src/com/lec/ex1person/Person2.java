package com.lec.ex1person;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

public class Person2 {
		public static void main(String[] args) {
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url    = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			Connection        conn = null;
			PreparedStatement pstmt = null; // 1, 2번 기능
			Statement         stmt  = null; // 3번 기능, 직업명들(jobs)
			ResultSet         rs    = null;
			Scanner           sc    = new Scanner(System.in);
			String fn, sql;
			ArrayList<String> jobs = new ArrayList<String>(); // 직업명들 저장
			// 직업명들을 jobs에 add
			try {
				sql = "SELECT JNAME FROM JOB";
				Class.forName(driver); // (1)드라이버 로드
				conn = DriverManager.getConnection(url, "scott", "tiger");//(2)
				stmt = conn.createStatement();//(3)
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					jobs.add(rs.getString("jname"));
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(rs  !=null) rs.close();
					if(stmt!=null) stmt.close();
					if(conn!=null) conn.close();
				} catch (SQLException e) {
					
				}
			}// 직업명 가져오기
			System.out.println(jobs);
			do {
				System.out.print("1:입력 || 2:직업별조회 || 3:전체조회 || 그외:종료");
				fn = sc.next();
				switch(fn) {
				case "1" : // 이름, 직업명(jobs), 국,영, 수 받아 insert
					sql = "INSERT INTO PERSON " + 
							"    VALUES (pNO.NEXTVAL,?, " + 
							"    (SELECT jNO FROM JOB WHERE jNAME=?),?,?,?)";
					try {
						conn = DriverManager.getConnection(url,"scott","tiger");
						pstmt = conn.prepareStatement(sql);
						System.out.println("이름은?");
						String pNAME = sc.next();
						System.out.println("직업은?");
						String jNAME = sc.next();
						System.out.println("국어 성적은?");
						int KOR = sc.nextInt();
						System.out.println("영어 성적은?");
						int ENG = sc.nextInt();
						System.out.println("수학 성적은?");
						int MAT = sc.nextInt();
						// 2~6단계
						pstmt.setString(1, pNAME);
						pstmt.setString(2, jNAME);
						pstmt.setInt(3, KOR);
						pstmt.setInt(4, ENG);
						pstmt.setInt(5, MAT);

					} catch (Exception e) {
						System.out.println(e.getMessage());
					} finally {
						try {
							if(pstmt!=null) pstmt.close();
							if(conn!=null) conn.close();
						} catch (SQLException e) {
							System.out.println(e.getMessage());
						}// 7단계 close
					}
					break;
				case "2": // 직업명받아 직업 출력
					sql = "SELECT ROWNUM||'등' RN2,pNAME ,jNAME,KOR,ENG,MAT,TOTAL" + 
							"    FROM (SELECT PNAME||'('||RN1||'번)' pNAME ,jNAME,KOR,ENG,MAT,TOTAL" + 
							"        FROM (SELECT ROWNUM RN1, pNAME,jNAME,KOR,ENG,MAT,KOR+ENG+MAT TOTAL " + 
							"            FROM PERSON P, JOB J WHERE P.jNO = J.jNO) WHERE jNAME = ? ORDER BY TOTAL DESC)A";
					try {
						// 2~6단계
						conn = DriverManager.getConnection(url,"scott","tiger");
						pstmt = conn.prepareStatement(sql);
						System.out.println("성적을 조회할 직업명은?");
						String jNAME = sc.next();
						pstmt.setString(1, jNAME);
						rs = pstmt.executeQuery();
						if(rs.next()) { // 출력
							System.out.println("등수\t 이름(pNO)\t 직업\t 국어(kor)\t 영어(eng)\t 수학(mat)\t 총점");
							do {
								int RN2 = rs.getInt("RN2");
								String pNAME = rs.getString("pNAME");
								String jNAME = rs.getString("jNAME");
								int sal = rs.getInt("sal");
								int grade = rs.getInt("grade");
								System.out.printf("%d\t %s\t %s\t %d\t %d\n", empno, worker, manager, sal, grade);
							}while(rs.next());
						}else {
							System.out.println("해당 부서 사원이 없습니다.");
						}
					} catch (Exception e) {
						// TODO: handle exception
					} finally {
						// 7단계 close
					}
					break;
				case "3":
					sql = "";
					try {
						// 2~6단계
					} catch (Exception e) {
						// TODO: handle exception
					} finally {
						// 7단계 close
					}
					break;
				}
			}while(fn.equals("1") || fn.equals("2") || fn.equals("3"));
			System.out.println("BYE");
		}
	}

