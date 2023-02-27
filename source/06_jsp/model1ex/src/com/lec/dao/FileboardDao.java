package com.lec.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.dto.FileboardDto;

public class FileboardDao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	private static FileboardDao instance;
	public static FileboardDao getInstance() {
		if(instance==null) {
			instance = new FileboardDao();
		}
		return instance;
	}
	private FileboardDao() {}
	// 커넥션 풀에서 conn 객체 가져와 반환
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	//글 목록
	public ArrayList<FileboardDto> fileboardList() {
		ArrayList<FileboardDto> fileboard = null;
		Connection			conn	= null;
		PreparedStatement	pstmt	= null;
		ResultSet			rs		= null;
		String sql ="    SELECT F.*, CNAME, CEMAIL" + 
				"        FROM FILEBOARD F, CUSTOMER C" + 
				"        WHERE F.CID = C.CID" + 
				"        ORDER BY FREF DESC, FRE_STEP";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int		fnum		=rs.getInt("fnum");
				String	cid			=rs.getString("cid");
				String	fsubject	=rs.getString("fsubject");
				String	fcontent	=rs.getString("fcontent");
				String	ffilename	=rs.getString("ffilename");
				String	fpw			=rs.getString("fpw");
				int		fhit		=rs.getInt("fhit");
				int		fref		=rs.getInt("fref");
				int		fre_step	=rs.getInt("fre_step");
				int		fre_level	=rs.getInt("fre_level");
				String	fip			=rs.getString("fip");
				Date	frdate		=rs.getDate("frdate");
				String	cname		=rs.getString("cname");
				String	cemail		=rs.getString("cemail");
				fileboard.add(new FileboardDto(fnum, cid, fsubject, fcontent, ffilename, fpw, fhit, fref, fre_step, fre_level, fip, frdate, cname, cemail));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs	!= null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(conn	!= null) conn.close();
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}		
		return fileboard;
	}
	//글 갯수
	public int getFileboardCnt() {
		int fileboardCnt = 0;
		Connection			conn 	= null;
		PreparedStatement	pstmt 	= null;
		ResultSet			rs		= null;
		String sql ="SELECT COUNT(*) FROM FILEBOARD";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			fileboardCnt = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs	!= null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(conn	!= null) conn.close();
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}		
		return fileboardCnt;
	}
	//글쓰기
	public int insertboard (FileboardDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO FILEBOARD  " + 
				"           (FNUM, CID, FSUBJECT, FCONTENT, FFILENAME, FPW, FREF, FRE_STEP, FRE_LEVEL, FIP)" + 
				"    VALUES (FILEBOARD_SEQ.NEXTVAL, ?, ?,?,?,?," + 
				"            FILEBOARD_SEQ.CURRVAL, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCid());
			pstmt.setString(2, dto.getFsubject());
			pstmt.setString(3, dto.getFcontent());
			pstmt.setString(4, dto.getFfilename());
			pstmt.setString(5, dto.getFpw());
			pstmt.setInt(6, dto.getFref());
			pstmt.setInt(7, dto.getFre_step());
			pstmt.setInt(8, dto.getFre_level());
			pstmt.setString(9, dto.getFip());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("원글쓰기 중 예외발생 : " + dto);
		}finally {
			try {
				if(pstmt!= null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}		
		return result;
	}
	//답변글 쓰기 전 STEP A --4번글에 대한 답변글 쓰기 전작업
	private	void preReplyStep(int fref, int fre_step) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE FILEBOARD SET FRE_STEP = FRE_STEP+1 WHERE FREF=? AND FRE_STEP>?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, fref);
				pstmt.setInt(2, fre_step);
				int result = pstmt.executeUpdate();
				System.out.println("답변글 "+ result + "개 조정됨");
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(pstmt!= null) pstmt.close();
					if(conn != null) conn.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}		
	}
	//답변글 쓰기 -- 4번글의 답변
	public int reply(FileboardDto dto) {
		int result = FAIL;
		Connection 			conn  = null;
		PreparedStatement 	pstmt = null;
		String sql = "INSERT INTO FILEBOARD " + 
				"           (fNUM, CID, fSUBJECT, fCONTENT, fFILENAME, fPW, fREF, fRE_STEP, fRE_LEVEL, fIP)" + 
				"    VALUES (FILEBOARD_SEQ.NEXTVAL, ?, ?, ?,?, ?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCid());
			pstmt.setString(2, dto.getFsubject());
			pstmt.setString(3, dto.getFcontent());
			pstmt.setString(4, dto.getFfilename());
			pstmt.setString(5, dto.getFpw());
			pstmt.setInt(6, dto.getFref());
			pstmt.setInt(7, dto.getFre_step());
			pstmt.setInt(8, dto.getFre_level());
			pstmt.setString(9, dto.getFip());
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "답변쓰기 성공" : "답변쓰기 실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("답변글쓰기 중 예외발생 : " + dto);
		}finally {
			try {
				if(pstmt!= null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}		
		return result;
	}
	//글 상세보기
	public FileboardDto getBoardOneLine(int fnum) {
		FileboardDto dto = null;
		Connection 			conn 	= null;
		PreparedStatement 	pstmt 	= null;
		ResultSet			rs		= null;
		String sql = "SELECT * FROM FILEBOARD WHERE FNUM=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fnum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String	cid			=rs.getString("cid");
				String	fsubject	=rs.getString("fsubject");
				String	fcontent	=rs.getString("fcontent");
				String	ffilename	=rs.getString("ffilename");
				String	fpw			=rs.getString("fpw");
				int		fhit		=rs.getInt("fhit");
				int		fref		=rs.getInt("fref");
				int		fre_step	=rs.getInt("fre_step");
				int		fre_level	=rs.getInt("fre_level");
				String	fip			=rs.getString("fip");
				Date	frdate		=rs.getDate("frdate");
				String	cname		=rs.getString("cname");
				String	cemail		=rs.getString("cemail");
				dto = new FileboardDto(cid, fsubject, fcontent, ffilename, fpw, fref, fre_step, fre_level, fip);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs	!= null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dto;
	}	
	//조회수 올리기 -1
	public void readCountUp(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE FILEBOARD SET FHIT=FHIT+1 WHERE FNUM=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!= null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
	//조회수 올리기 -2
	public void readCountUp(String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE FILEBOARD SET FHIT=FHIT+1 WHERE FNUM=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!= null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
	//글수정
	public int modifyBoard(FileboardDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE FILEBOARD SET FSUBJECT  = ?, " + 
				"                     FCONTENT  = ?, " + 
				"                     FFILENAME = ?, " + 
				"                     FPW       = ?, " + 
				"                     FIP       = ? " + 
				"            WHERE FNUM = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getFsubject());
			pstmt.setString(2, dto.getFcontent());
			pstmt.setString(3, dto.getFfilename());
			pstmt.setString(4, dto.getFpw());
			pstmt.setString(5, dto.getFip());
			pstmt.setInt(6, dto.getFnum());
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "글 수정 성공" : "실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("글 수정중 예외발생 : " + dto);
		}finally {
			try {
				if(pstmt!= null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}		
		return result;
	}
	//글 삭제
	public int deleteBoard(int fnum, String fpw) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM FILEBOARD  WHERE FNUM=? AND FPW=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fnum);
			pstmt.setString(2, fpw);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "글 삭제 성공" : "실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!= null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}		
		return result;
	}	
}
