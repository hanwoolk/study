package com.lec.ex3supermarket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.lec.ex2person_dtodao.PersonDto;

public class CustomerDao2 {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	public final static int SUCCESS = 1;
	public final static int FAIL = 0;
	private static CustomerDao2 INSTANCE;

	public static CustomerDao2 getInstance() {
		if (INSTANCE == null) {
			INSTANCE = new CustomerDao2();
		}
		return INSTANCE;
	}

	private CustomerDao2() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
	}
		//1
	public int insertCustomer(CustomerDto dto) {
		int result1 = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO CUSTOMER (CID,CTEL,CNAME) " + "    VALUES (CSEQ.NEXTVAL,?,?)";
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCname());
			pstmt.setString(2, dto.getCtel());
			result1 = pstmt.executeUpdate();
			System.out.println(result1 == SUCCESS ? "회원가입 감사합니다. 포인트 1000점을 회원가입선물로 드립니다" : "가입 실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn  != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result1;
	}
		//2
	public ArrayList<CustomerDto> selectCtel(String ctel) {
		ArrayList<CustomerDto> dtos = new ArrayList<CustomerDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT C.* ,LEVELNAME,(NVL(HIC,CAMOUNT-1)-CAMOUNT+1) NEXTLEVEL " + "    FROM CUSTOMER C, CLEVEL "
				+ "    WHERE CAMOUNT BETWEEN LOC AND NVL(HIC,CAMOUNT+1) " + "        AND SUBSTR(CTEL,-4,4)=? "
				+ "    ORDER BY CAMOUNT DESC";
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ctel);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int cid = rs.getInt("cid");
				ctel = rs.getString("ctel");
				String cname = rs.getString("cname");
				int cpoint = rs.getInt("cpoint");
				int camount = rs.getInt("camount");
				String levelname = rs.getString("levelname");
				int nextlevel = rs.getInt("nextlevel");
				dtos.add(new CustomerDto(cid, ctel, cname, cpoint, camount, levelname, nextlevel));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs 	  != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn  != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dtos;
	}
		//3
	public int updateCustomer(CustomerDto dto) {
		int result = FAIL;
		Connection 		  conn  = null;
		PreparedStatement pstmt = null;
		ResultSet 		  rs 	= null;
		String selectQuery = "SELECT COUNT(*) CNT FROM CUSTOMER WHERE CID=?";
		String updateQuery = "UPDATE CUSTOMER SET CAMOUNT = CAMOUNT + ? , CPOINT = CPOINT+(?*0.05) WHERE CID=?";
			try {
				conn = DriverManager.getConnection(url, "scott", "tiger");
				pstmt = conn.prepareStatement(selectQuery);
				pstmt.setInt(1, dto.getCid());
				rs = pstmt.executeQuery();
				rs.next();
				int cnt = rs.getInt("cnt");
				if (cnt == 0) {
					System.out.println("존재하지 않는 회원번호입니다.");
				} else {
					pstmt.close();
					pstmt = conn.prepareStatement(updateQuery);
					pstmt.setInt(2, dto.getCamount());
					pstmt.setInt(1, dto.getCamount());
					result = pstmt.executeUpdate();
					System.out.println(result == SUCCESS? "물품 구매 및 레벨 조정 성공" : "업데이트 실패");
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(pstmt!= null) pstmt.close();
					if(conn	!= null) conn.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}
		return result;
	} //4
	public ArrayList<CustomerDto> selectlevel(String levelname) {
		ArrayList<CustomerDto> dtos = new ArrayList<CustomerDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT C.* , LEVELNAME, (NVL(HIC,CAMOUNT-1)-CAMOUNT+1) NEXTLEVEL, COUNT(LEVELNAME) COUNTL" + 
				"    FROM CUSTOMER C, CLEVEL" + 
				"    WHERE CAMOUNT BETWEEN LOC AND NVL(HIC,CAMOUNT+1) AND LEVELNAME = ? " + 
				"    ORDER BY CAMOUNT DESC";
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, levelname);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int cid = rs.getInt("cid");
				String ctel = rs.getString("ctel");
				String cname = rs.getString("cname");
				int cpoint = rs.getInt("cpoint");
				int camount = rs.getInt("camount");
				int nextlevel = rs.getInt("nextlevel");
				dtos.add(new CustomerDto(cid, ctel, cname, cpoint, camount, levelname, nextlevel));
			}
			int countl = rs.getInt("countl");
			System.out.println("총" + countl + "명");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs 	  != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn  != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dtos;
	} //5
	public ArrayList<CustomerDto> selectAll() {
		ArrayList<CustomerDto> dtos = new ArrayList<CustomerDto>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT C.* , LEVELNAME, (NVL(HIC,CAMOUNT-1)-CAMOUNT+1) NEXTLEVEL" + 
				"    FROM CUSTOMER C, CLEVEL" + 
				"    WHERE CAMOUNT BETWEEN LOC AND NVL(HIC,CAMOUNT+1)" + 
				"    ORDER BY CAMOUNT DESC";
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				CustomerDto dto = new CustomerDto(); // ★dto 객체생성은 while문 안에
				dto.setCid(rs.getInt("cid"));
				dto.setCtel(rs.getString("ctel"));
				dto.setCname(rs.getString("cname"));
				dto.setCpoint(rs.getInt("cpoint"));
				dto.setCamount(rs.getInt("camount"));
				dto.setLevelname(rs.getString("levelname"));
				dto.setNextlevel(rs.getInt("nextlevel"));
				dtos.add(dto);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dtos;
	}
	public int deleteCustomer(CustomerDto dto) {
		int result = FAIL;
		Connection 		  conn  = null;
		PreparedStatement pstmt = null;
		ResultSet 		  rs 	= null;
		String selectQuery = "SELECT COUNT(*) CNT FROM CUSTOMER WHERE CTEL=?";
		String deleteQuery = "DELETE FROM CUSTOMER WHERE CTEL=?";
			try {
				conn = DriverManager.getConnection(url, "scott", "tiger");
				pstmt = conn.prepareStatement(selectQuery);
				pstmt.setString(1, dto.getCtel());
				rs = pstmt.executeQuery();
				rs.next();
				int cnt = rs.getInt("cnt");
				if (cnt == 0) {
					System.out.println("존재하지 않는 회원번호입니다.");
				} else {
					rs.close();
					pstmt.close();
					pstmt = conn.prepareStatement(deleteQuery);
					pstmt.setString(1, dto.getCtel());
					result = pstmt.executeUpdate();
					System.out.println(result == SUCCESS? "물품 구매 및 레벨 조정 성공" : "업데이트 실패");
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(pstmt!= null) pstmt.close();
					if(conn	!= null) conn.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}
		return result;
	} //4
}
