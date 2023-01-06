package com.lec.ex1person;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

public class Person {
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
					String selectQuery = "SELECT COUNT(*) CNT FROM PERSON WHERE pNAME=?";
					sql = "INSERT INTO PERSON " + 
							"    VALUES (pNO.NEXTVAL,?, " + 
							"    (SELECT jNO FROM JOB WHERE jNAME=?),?,?,?)";
					try {
						conn = DriverManager.getConnection(url,"scott","tiger");
						pstmt = conn.prepareStatement(selectQuery);
						System.out.println("이름은?");
						String pNAME = sc.next();
						pstmt.setString(1, pNAME);
						rs = pstmt.executeQuery();
						rs.next();
						int cnt = rs.getInt("cnt");
						if(cnt!=0) {
							System.out.println("중복된 이름은 입력 불가");
						} else {
							System.out.println("직업"+jobs+"은?");
							String jNAME = sc.next();
							System.out.println("국어 성적은?");
							int KOR = sc.nextInt();
							System.out.println("영어 성적은?");
							int ENG = sc.nextInt();
							System.out.println("수학 성적은?");
							int MAT = sc.nextInt();
							// 2~6단계
							pstmt.setString(2, jNAME);
							pstmt.setInt(3, KOR);
							pstmt.setInt(4, ENG);
							pstmt.setInt(5, MAT);
							int result = pstmt.executeUpdate();
							System.out.println(result>0? "입력 성공" : "입력 실패");
						}
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
					sql = "SELECT ROWNUM RANK, A.*" + 
							"  FROM (SELECT pNAME||'('||pNO||'번)' pNAME, jNAME, KOR, ENG, MAT, KOR+ENG+MAT TOTAL" + 
							"            FROM PERSON P, JOB J" + 
							"            WHERE P.jNO=J.jNO AND jNAME=?" + 
							"            ORDER BY TOTAL DESC) A";
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
								int 	RANK 	= rs.getInt("RANK");
								String 	pNAME 	= rs.getString("pNAME");
										jNAME 	= rs.getString("jNAME");
								int 	KOR 	= rs.getInt("KOR");
								int 	ENG 	= rs.getInt("ENG");
								int 	MAT 	= rs.getInt("MAT");
								int 	TOTAL 	= rs.getInt("TOTAL");
								System.out.printf("%d등\t %s\t %s\t %d\t\t %d\t\t %d\t\t %d\n", RANK, pNAME, jNAME, KOR, ENG, MAT, TOTAL);
							}while(rs.next());
						}else {
							System.out.println("해당 직업의 사람이 없습니다.");
						}
					} catch (Exception e) {
						System.out.println(e.getMessage());
					} finally {
						// 7단계 close
							try {
								if(rs!=null) rs.close();
								if(pstmt!=null)pstmt.close();
								if(conn!=null) conn.close();
							} catch (SQLException e) {
								System.out.println(e.getMessage());
							}
					}
					break;
				case "3":
					sql = "SELECT ROWNUM RANK, A.*" + 
							"  FROM (SELECT PNAME||'('||pNO||'번)' pNAME, jNAME, KOR, ENG, MAT, KOR+ENG+MAT TOTAL" + 
							"            FROM PERSON P, JOB J" + 
							"            WHERE P.jNO=J.jNO" + 
							"            ORDER BY TOTAL DESC) A";
					try {
						conn = DriverManager.getConnection(url,"scott","tiger");
						stmt = conn.createStatement();
						rs = stmt.executeQuery(sql);
							System.out.println("등수\t 이름(pNO)\t 직업\t 국어(kor)\t 영어(eng)\t 수학(mat)\t 총점");
							while(rs.next()) {
								int RANK = rs.getInt("RANK");
								String pNAME = rs.getString("pNAME");
								String jNAME = rs.getString("jNAME");
								int KOR = rs.getInt("KOR");
								int ENG = rs.getInt("ENG");
								int MAT = rs.getInt("MAT");
								int TOTAL = rs.getInt("TOTAL");
								System.out.printf("%d등\t %s\t %s\t %d\t\t %d\t\t %d\t\t %d\n", RANK, pNAME, jNAME, KOR, ENG, MAT, TOTAL);
							}
					} catch (Exception e) {
						System.out.println(e.getMessage());
					} finally {
						try {
							if(rs!=null) rs.close();
							if(stmt!=null) stmt.close();
							if(conn!=null) conn.close();
						} catch (SQLException e) {
							System.out.println(e.getMessage());
						}
						// 7단계 close
					}
					break;
				}
			}while(fn.equals("1") || fn.equals("2") || fn.equals("3"));
			System.out.println("BYE");
		}
	}

