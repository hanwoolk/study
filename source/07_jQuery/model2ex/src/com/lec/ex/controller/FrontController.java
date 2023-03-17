package com.lec.ex.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.ex.service.ALoginService;
import com.lec.ex.service.BoardContentService;
import com.lec.ex.service.BoardListService;
import com.lec.ex.service.BoardModifyService;
import com.lec.ex.service.BoardModifyViewService;
import com.lec.ex.service.BoardReplyService;
import com.lec.ex.service.BoardReplyViewService;
import com.lec.ex.service.BoardWriteService;
import com.lec.ex.service.JoinService;
import com.lec.ex.service.MAllViewService;
import com.lec.ex.service.MLoginService;
import com.lec.ex.service.MLogoutService;
import com.lec.ex.service.MModifyService;
import com.lec.ex.service.MWithdrawalService;
import com.lec.ex.service.MemailConfirmService;
import com.lec.ex.service.MidConfirmService;
import com.lec.ex.service.Service;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private	int viewControl = 0;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actiondo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actiondo(request, response);
	}
	private void actiondo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		String viewPage = null;
		Service service = null;
		if(command.equals("/main.do")) {
			viewPage = "main/main.jsp";
		////////////////////////////////////////////////////////////////
		//////////////////////member 관련 요청////////////////////////////
		////////////////////////////////////////////////////////////////	
		}else if(command.equals("/joinView.do")) {
			viewPage = "member/join.jsp";
		}else if(command.equals("/idConfirm.do")) {
			service = new MidConfirmService();
			service.execute(request, response);
			viewPage = "member/idConfirm.jsp";
		}else if(command.equals("/emailConfirm.do")) {
			service = new MemailConfirmService();
			service.execute(request, response);
			viewPage = "member/emailConfirm.jsp";
		}else if(command.equals("/join.do")) { // 회원가입 DB 처리
			service = new JoinService(); // execute메소드 : mId중복체크 후 회원가입
			service.execute(request, response);
			viewPage = "loginView.do";
		}else if(command.equals("/loginView.do")) { // 로그인 화면
			viewPage = "member/login.jsp";
		}else if(command.equals("/login.do")) { // 로그인 DB 및 세션 처리
			service = new MLoginService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(command.equals("/logout.do")) {//로그아웃 - 세션 날리기
			service = new MLogoutService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(command.equals("/modifyView.do")) { //정보 수정하기 위한 view
			viewPage = "member/modify.jsp";
		}else if(command.equals("/modify.do")) { // db의 정보 수정
			service = new MModifyService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(command.equals("/withdrawal.do")) {
			service = new MWithdrawalService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		////////////////////////////////////////////////////////////////
		//////////////////////admin 관련 요청/////////////////////////////
		////////////////////////////////////////////////////////////////
		}else if(command.equals("/adminLoginView.do")) {
			viewPage = "admin/adminLogin.jsp";
			viewControl = 1;
		}else if(command.equals("/adminLogin.do")) {
			if(viewControl == 1) {
				service = new ALoginService();
				service.execute(request, response);
				viewControl = 0;
			}
			viewPage = "allView.do";
		}else if(command.equals("/allView.do")) { //회원 목록 출력(페이징처리)
			service = new MAllViewService();
			service.execute(request, response);
			viewPage = "member/mAllView.jsp";
		////////////////////////////////////////////////////////////////
		//////////////////////파일첨부 관련 요청/////////////////////////////
		////////////////////////////////////////////////////////////////	
		}else if(command.equals("/boardList.do")) {
			service = new BoardListService();
			service.execute(request, response);
			viewPage = "fileBoard/boardList.jsp";
		}else if(command.equals("/boardWriteView.do")) {
			viewPage = "fileBoard/boardWrite.jsp";
			viewControl = 1;
		}else if(command.equals("/boardWrite.do")) {
			if(viewControl == 1) {
				service = new BoardWriteService();
				service.execute(request, response);
				viewControl = 0;
			}
			viewPage = "boardList.do";
		}else if(command.equals("/boardContent.do")) {
			service = new BoardContentService();
			service.execute(request, response);
			viewPage = "fileBoard/boardContent.jsp";
		}else if(command.equals("/boardModifyView.do")) {
			service = new BoardModifyViewService();
			service.execute(request, response);
			viewPage = "fileBoard/boardModify.jsp";
		}else if(command.equals("/boardModify.do")) {
			service = new BoardModifyService();
			service.execute(request, response);
			viewPage = "boardList.do";
		}else if(command.equals("/boardReplyView.do")) {
			service = new BoardReplyViewService();
			service.execute(request, response);
			viewPage = "fileBoard/boardReply.jsp";
		}else if(command.equals("/boardReply.do")) {
			service = new BoardReplyService();
			service.execute(request, response);
			viewPage = "boardList.do";
		}
	
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}