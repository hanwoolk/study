package com.lec.ex.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.ex.dto.BoardDto;

public class BoardDao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	private	DataSource ds;
	public	BoardDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	// 1. 글 목록 (startRow ~ endRow까지)
	public ArrayList<BoardDto> list(int startRow, int endRow){
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		Connection			conn 	= null;
		PreparedStatement	pstmt 	= null;
		ResultSet			rs		= null;
		String sql = "SELECT * " + 
				"    FROM (SELECT ROWNUM RN, A.* " + 
				"        FROM (SELECT * " + 
				"            FROM FILEBOARD ORDER BY fGROUP DESC, fSTEP)A)" + 
				"    WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int 	fid			= rs.getInt("fid");
				String 	mid			= rs.getString("mid");
				String 	ftitle		= rs.getString("ftitle");
				String	fcontent	= rs.getString("fcontent");
				String	ffilename	= rs.getString("ffilename");
				Date	frdate		= rs.getDate("frdate");
				int		fhit		= rs.getInt("fhit");
				int		fgroup		= rs.getInt("fgroup");
				int		fstep		= rs.getInt("fstep");
				int		findent		= rs.getInt("findent");
				String	fip			= rs.getString("fip");
				dtos.add(new BoardDto(fid, mid, ftitle, fcontent, ffilename, frdate, fhit, fgroup, fstep, findent, fip));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs	!= null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(conn	!= null) conn.close();
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dtos;
	}
	// 2. 전체 글 갯수
	public int getBoardTotCnt() {
		int totCnt = 0;
		Connection			conn 	= null;
		PreparedStatement	pstmt 	= null;
		ResultSet			rs		= null;
		String sql = "SELECT COUNT(*) FROM FILEBOARD";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totCnt = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs	!= null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(conn	!= null) conn.close();
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return totCnt;
	}
	// 3. 원글쓰기 (bname, btitle, bcontent, bip)
	public int write(String mid, String ftitle, String fcontent, String ffilename, String fip) {
		int result = FAIL;
		Connection			conn 	= null;
		PreparedStatement	pstmt 	= null;
		String sql = "INSERT INTO FILEBOARD (fID, mID, fTITLE, fCONTENT, fFILENAME," + 
				"    fHIT, fGROUP, fSTEP, fINDENT, fIP)" + 
				"    VALUES ((SELECT NVL(MAX(fID),0)+1 FROM FILEBOARD), ?,?,?," + 
				"    ?,0,(SELECT NVL(MAX(fID),0)+1 FROM FILEBOARD),0,0,?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, ftitle);
			pstmt.setString(3, fcontent);
			pstmt.setString(4, ffilename);
			pstmt.setString(5, fip);
			pstmt.executeUpdate();
			result = SUCCESS;
			System.out.println("원글쓰기 성공");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "원글쓰기 실패");
		} finally {
			try {
				if(pstmt!= null) pstmt.close();
				if(conn	!= null) conn.close();
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// 4. BID로 조회수 1회 올리기
	private void hitUp(int fid) {
		Connection			conn 	= null;
		PreparedStatement	pstmt 	= null;
		String sql = "UPDATE FILEBOARD SET fHIT = fHIT+1 WHERE fID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "조회수 up 실패");
		} finally {
			try {
				if(pstmt!= null) pstmt.close();
				if(conn	!= null) conn.close();
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
	// 5-1. bID로 DTO 가져오기 (글 상세보기) -- 조회수 올리고 dto 가져오기
	public BoardDto content(int fid) {
		BoardDto dto = null;
		hitUp(fid); //글 상세보기 시 조회수 1 올리기
		Connection			conn 	= null;
		PreparedStatement	pstmt 	= null;
		ResultSet			rs		= null;
		String sql = "SELECT MNAME, M.MID MID, FTITLE, FCONTENT, FFILENAME , FRDATE, FHIT, FGROUP, FSTEP ,FINDENT ,FIP FROM FILEBOARD F, MVC_MEMBER M WHERE F.mID = M.mID AND fID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String	mname		= rs.getString("mname");
				String 	mid			= rs.getString("mid");
				String 	ftitle		= rs.getString("ftitle");
				String	fcontent	= rs.getString("fcontent");
				String	ffilename	= rs.getString("ffilename");
				Date	frdate		= rs.getDate("frdate");
				int		fhit		= rs.getInt("fhit");
				int		fgroup		= rs.getInt("fgroup");
				int		fstep		= rs.getInt("fstep");
				int		findent		= rs.getInt("findent");
				String	fip			= rs.getString("fip");
				
				dto = new BoardDto(mname, fid, mid, ftitle, fcontent, ffilename, frdate, fhit, fgroup, fstep, findent, fip);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs	!= null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(conn	!= null) conn.close();
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dto;
	}
	// 5-2. bID로 DTO 가져오기 (글수정 VIEW, 답변글 VIEW) -- dto 가져오기 modifyview, reply view
	public BoardDto modifyView_replyView(int fid) {
		BoardDto dto = null;
		Connection			conn 	= null;
		PreparedStatement	pstmt 	= null;
		ResultSet			rs		= null;
		String sql = "SELECT * FROM FILEBOARD WHERE fID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String 	mid			= rs.getString("mid");
				String 	ftitle		= rs.getString("ftitle");
				String	fcontent	= rs.getString("fcontent");
				String	ffilename	= rs.getString("ffilename");
				Date	frdate		= rs.getDate("frdate");
				int		fhit		= rs.getInt("fhit");
				int		fgroup		= rs.getInt("fgroup");
				int		fstep		= rs.getInt("fstep");
				int		findent		= rs.getInt("findent");
				String	fip			= rs.getString("fip");
				dto = new BoardDto(fid, mid, ftitle, fcontent, ffilename, frdate, fhit, fgroup, fstep, findent, fip);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs	!= null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(conn	!= null) conn.close();
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dto;	
	}
	// 6. 글 수정 (특정 bid의 작성자, 글제목, 글본문, bip만 수정)
	public int modify(int fid, String ftitle, String fcontent,String ffilename, String fip) {
		int result = FAIL;
		Connection			conn 	= null;
		PreparedStatement	pstmt 	= null;
		String sql = "UPDATE FILEBOARD SET  ftitle     = ?," + 
				"                     		fcontent   = ?," + 
				"                     		ffilename  = ?," + 
				"                     		fip        = ?" + 
				"            WHERE fID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ftitle);
			pstmt.setString(2, fcontent);
			pstmt.setString(3, ffilename);
			pstmt.setString(4, fip);
			pstmt.setInt(5, fid);
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "글 수정 성공" : "글번호(bid) 오류");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "글 수정 실패");
		} finally {
			try {
				if(pstmt!= null) pstmt.close();
				if(conn	!= null) conn.close();
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// 7. 글 삭제
	public int delete(int fid) {
		int result = FAIL;
		Connection			conn 	= null;
		PreparedStatement	pstmt 	= null;
		String sql = "DELETE FROM FILEBOARD WHERE fID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fid);
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "글 삭제 성공" : "글번호(bid) 오류");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "글 삭제 실패");
		} finally {
			try {
				if(pstmt!= null) pstmt.close();
				if(conn	!= null) conn.close();
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}	
	// 8. 답변글 달기 전 작업 (STEP ⓐ : 예시에서는 2번글의 답변)
	private	void preReplyStep(int fgroup, int fstep) {
		Connection			conn 	= null;
		PreparedStatement	pstmt 	= null;
		String sql = "UPDATE FILEBOARD SET FSTEP = FSTEP + 1 WHERE FGROUP = ? AND FSTEP > ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fgroup);
			pstmt.setInt(2, fstep);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "preReplyStep에서 오류");
		} finally {
			try {
				if(pstmt!= null) pstmt.close();
				if(conn	!= null) conn.close();
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
	// 9. 답변글 쓰기 
	//		답변글쓴이 : bname, ntitle, bcontent
	//		시스템	: bip
	//		원글		: bgroup, bstep, bindent
	public int reply(String mid, String ftitle, String fcontent, String ffilename, int fgroup, int fstep, int findent, String fip) {
		int result = FAIL;
		preReplyStep(fgroup, fstep);
		Connection			conn 	= null;
		PreparedStatement	pstmt 	= null;
		String sql = "INSERT INTO FILEBOARD (fID, mID, fTITLE, fCONTENT, fFILENAME, fGROUP, fSTEP, fINDENT, fIP)" + 
				"        VALUES ((SELECT NVL(MAX(fID),0)+1 FROM FILEBOARD), ?,?,?,?,?,?,?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, ftitle);
			pstmt.setString(3, fcontent);
			pstmt.setString(4, ffilename);
			pstmt.setInt(5, fgroup);
			pstmt.setInt(6, fstep+1);
			pstmt.setInt(7, findent+1);
			pstmt.setString(8, fip);
			pstmt.executeUpdate();
			result = SUCCESS;
			System.out.println("답변글쓰기 성공");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "답변글쓰기 실패");
		} finally {
			try {
				if(pstmt!= null) pstmt.close();
				if(conn	!= null) conn.close();
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	//글 삭제
	public int withrawalDelete(String mid) {
		int result = FAIL;
		Connection			conn 	= null;
		PreparedStatement	pstmt 	= null;
		String sql = "DELETE FROM FILEBOARD WHERE mID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "글 삭제 성공" : "아이디(mid) 오류");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "글 삭제 실패");
		} finally {
			try {
				if(pstmt!= null) pstmt.close();
				if(conn	!= null) conn.close();
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}	
}
