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
			PreparedStatement pstmt = null; // 1, 2�� ���
			Statement         stmt  = null; // 3�� ���, �������(jobs)
			ResultSet         rs    = null;
			Scanner           sc    = new Scanner(System.in);
			String fn, sql;
			ArrayList<String> jobs = new ArrayList<String>(); // ������� ����
			// ��������� jobs�� add
			try {
				sql = "SELECT JNAME FROM JOB";
				Class.forName(driver); // (1)����̹� �ε�
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
			}// ������ ��������
			System.out.println(jobs);
			do {
				System.out.print("1:�Է� || 2:��������ȸ || 3:��ü��ȸ || �׿�:����");
				fn = sc.next();
				switch(fn) {
				case "1" : // �̸�, ������(jobs), ��,��, �� �޾� insert
					String selectQuery = "SELECT COUNT(*) CNT FROM PERSON WHERE pNAME=?";
					sql = "INSERT INTO PERSON " + 
							"    VALUES (pNO.NEXTVAL,?, " + 
							"    (SELECT jNO FROM JOB WHERE jNAME=?),?,?,?)";
					try {
						conn = DriverManager.getConnection(url,"scott","tiger");
						pstmt = conn.prepareStatement(selectQuery);
						System.out.println("�̸���?");
						String pNAME = sc.next();
						pstmt.setString(1, pNAME);
						rs = pstmt.executeQuery();
						rs.next();
						int cnt = rs.getInt("cnt");
						if(cnt!=0) {
							System.out.println("�ߺ��� �̸��� �Է� �Ұ�");
						} else {
							System.out.println("����"+jobs+"��?");
							String jNAME = sc.next();
							System.out.println("���� ������?");
							int KOR = sc.nextInt();
							System.out.println("���� ������?");
							int ENG = sc.nextInt();
							System.out.println("���� ������?");
							int MAT = sc.nextInt();
							// 2~6�ܰ�
							pstmt.setString(2, jNAME);
							pstmt.setInt(3, KOR);
							pstmt.setInt(4, ENG);
							pstmt.setInt(5, MAT);
							int result = pstmt.executeUpdate();
							System.out.println(result>0? "�Է� ����" : "�Է� ����");
						}
					} catch (Exception e) {
						System.out.println(e.getMessage());
					} finally {
						try {
							if(pstmt!=null) pstmt.close();
							if(conn!=null) conn.close();
						} catch (SQLException e) {
							System.out.println(e.getMessage());
						}// 7�ܰ� close
					}
					break;
				case "2": // ������޾� ���� ���
					sql = "SELECT ROWNUM RANK, A.*" + 
							"  FROM (SELECT pNAME||'('||pNO||'��)' pNAME, jNAME, KOR, ENG, MAT, KOR+ENG+MAT TOTAL" + 
							"            FROM PERSON P, JOB J" + 
							"            WHERE P.jNO=J.jNO AND jNAME=?" + 
							"            ORDER BY TOTAL DESC) A";
					try {
						// 2~6�ܰ�
						conn = DriverManager.getConnection(url,"scott","tiger");
						pstmt = conn.prepareStatement(sql);
						System.out.println("������ ��ȸ�� ��������?");
						String jNAME = sc.next();
						pstmt.setString(1, jNAME);
						rs = pstmt.executeQuery();
						if(rs.next()) { // ���
							System.out.println("���\t �̸�(pNO)\t ����\t ����(kor)\t ����(eng)\t ����(mat)\t ����");
							do {
								int 	RANK 	= rs.getInt("RANK");
								String 	pNAME 	= rs.getString("pNAME");
										jNAME 	= rs.getString("jNAME");
								int 	KOR 	= rs.getInt("KOR");
								int 	ENG 	= rs.getInt("ENG");
								int 	MAT 	= rs.getInt("MAT");
								int 	TOTAL 	= rs.getInt("TOTAL");
								System.out.printf("%d��\t %s\t %s\t %d\t\t %d\t\t %d\t\t %d\n", RANK, pNAME, jNAME, KOR, ENG, MAT, TOTAL);
							}while(rs.next());
						}else {
							System.out.println("�ش� ������ ����� �����ϴ�.");
						}
					} catch (Exception e) {
						System.out.println(e.getMessage());
					} finally {
						// 7�ܰ� close
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
							"  FROM (SELECT PNAME||'('||pNO||'��)' pNAME, jNAME, KOR, ENG, MAT, KOR+ENG+MAT TOTAL" + 
							"            FROM PERSON P, JOB J" + 
							"            WHERE P.jNO=J.jNO" + 
							"            ORDER BY TOTAL DESC) A";
					try {
						conn = DriverManager.getConnection(url,"scott","tiger");
						stmt = conn.createStatement();
						rs = stmt.executeQuery(sql);
							System.out.println("���\t �̸�(pNO)\t ����\t ����(kor)\t ����(eng)\t ����(mat)\t ����");
							while(rs.next()) {
								int RANK = rs.getInt("RANK");
								String pNAME = rs.getString("pNAME");
								String jNAME = rs.getString("jNAME");
								int KOR = rs.getInt("KOR");
								int ENG = rs.getInt("ENG");
								int MAT = rs.getInt("MAT");
								int TOTAL = rs.getInt("TOTAL");
								System.out.printf("%d��\t %s\t %s\t %d\t\t %d\t\t %d\t\t %d\n", RANK, pNAME, jNAME, KOR, ENG, MAT, TOTAL);
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
						// 7�ܰ� close
					}
					break;
				}
			}while(fn.equals("1") || fn.equals("2") || fn.equals("3"));
			System.out.println("BYE");
		}
	}

