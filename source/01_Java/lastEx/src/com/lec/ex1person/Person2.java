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
					sql = "INSERT INTO PERSON " + 
							"    VALUES (pNO.NEXTVAL,?, " + 
							"    (SELECT jNO FROM JOB WHERE jNAME=?),?,?,?)";
					try {
						conn = DriverManager.getConnection(url,"scott","tiger");
						pstmt = conn.prepareStatement(sql);
						System.out.println("�̸���?");
						String pNAME = sc.next();
						System.out.println("������?");
						String jNAME = sc.next();
						System.out.println("���� ������?");
						int KOR = sc.nextInt();
						System.out.println("���� ������?");
						int ENG = sc.nextInt();
						System.out.println("���� ������?");
						int MAT = sc.nextInt();
						// 2~6�ܰ�
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
						}// 7�ܰ� close
					}
					break;
				case "2": // ������޾� ���� ���
					sql = "SELECT ROWNUM||'��' RN2,pNAME ,jNAME,KOR,ENG,MAT,TOTAL" + 
							"    FROM (SELECT PNAME||'('||RN1||'��)' pNAME ,jNAME,KOR,ENG,MAT,TOTAL" + 
							"        FROM (SELECT ROWNUM RN1, pNAME,jNAME,KOR,ENG,MAT,KOR+ENG+MAT TOTAL " + 
							"            FROM PERSON P, JOB J WHERE P.jNO = J.jNO) WHERE jNAME = ? ORDER BY TOTAL DESC)A";
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
								int RN2 = rs.getInt("RN2");
								String pNAME = rs.getString("pNAME");
								String jNAME = rs.getString("jNAME");
								int sal = rs.getInt("sal");
								int grade = rs.getInt("grade");
								System.out.printf("%d\t %s\t %s\t %d\t %d\n", empno, worker, manager, sal, grade);
							}while(rs.next());
						}else {
							System.out.println("�ش� �μ� ����� �����ϴ�.");
						}
					} catch (Exception e) {
						// TODO: handle exception
					} finally {
						// 7�ܰ� close
					}
					break;
				case "3":
					sql = "";
					try {
						// 2~6�ܰ�
					} catch (Exception e) {
						// TODO: handle exception
					} finally {
						// 7�ܰ� close
					}
					break;
				}
			}while(fn.equals("1") || fn.equals("2") || fn.equals("3"));
			System.out.println("BYE");
		}
	}

