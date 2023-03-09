package com.lec.ex.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.ex.dto.MemberDto;

public class MemberDao {
	private final int EXIST = 1;
	private final int NOT_EXIST = 0;
	private final int SUCCESS = 1;
	private final int FAIL = 0;
	private	DataSource ds;
	public	MemberDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	// 1. ID중복체크
	public int idConfirm(String mid) {
		int result = EXIST;
		Connection			conn 	= null;
		PreparedStatement	pstmt 	= null;
		ResultSet			rs		= null;
		String sql = "SELECT COUNT(*) FROM MVC_MEMBER WHERE mID=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.getInt(1) ==EXIST) {
			System.out.println("아이디 중복");
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
		return result;		
	}
	// 2. JOIN
	public int join(MemberDto dto) {
		int result = FAIL;
		Connection			conn 	= null;
		PreparedStatement	pstmt 	= null;
		String sql = "INSERT INTO MVC_MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)" + 
				"    VALUES (?,?,?,?,?,?,?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getMpw());
			pstmt.setString(3, dto.getMname());
			pstmt.setString(4, dto.getMemail());
			pstmt.setString(5, dto.getMphoto());
			pstmt.setDate(6, dto.getMbirth());
			pstmt.setString(7, dto.getMaddress());
			pstmt.executeUpdate();
			result = SUCCESS;
			System.out.println("회원가입 성공");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "회원가입 실패");
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
	// 3. LOGIN
	public int login (String mid, String mpw) {
		int result = FAIL;
		Connection			conn 	= null;
		PreparedStatement	pstmt 	= null;
		ResultSet			rs		= null;
		String sql = "SELECT * FROM MVC_MEMBER WHERE mID = ? AND mPW = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mpw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = EXIST;
			}else {
				result = NOT_EXIST;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " 로그인 실패");
		} finally {
			try {
				if(rs	!= null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(conn	!= null) conn.close();
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}		
		return result;
	}
	// 4. mID로 MemberDto 가져오기 getMember
	public MemberDto getMember(String mid) {
		MemberDto dto = null;
		Connection			conn 	= null;
		PreparedStatement	pstmt 	= null;
		ResultSet			rs		= null;
		String sql = "SELECT * FROM MVC_MEMBER WHERE mID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String	mpw			= rs.getString("mpw");
				String	mname		= rs.getString("mname");
				String	memail		= rs.getString("memail");
				String	mphoto		= rs.getString("mphoto");
				Date	mbirth		= rs.getDate("mbirth");
				String	maddress	= rs.getString("maddress");
				Date	mrdate		= rs.getDate("mrdate");
				dto = new MemberDto(mid, mpw, mname, memail, mphoto, mbirth, maddress, mrdate);
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
}
