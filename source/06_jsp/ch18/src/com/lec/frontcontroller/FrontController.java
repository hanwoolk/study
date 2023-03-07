package com.lec.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.service.DeleteService;
import com.lec.service.InsertService;
import com.lec.service.SelectService;
import com.lec.service.Service;
import com.lec.service.UpdateService;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append("<h1>FrontController</h1>");
		// 무슨 요청이 들어왔는지 판별(select.do? delete.do? insert.do? update.do?)
		// 필요한것 -> uri-conPath
		String uri = request.getRequestURI();		// uri : /ch18/select.do
		String conPath = request.getContextPath();	// conPath : /ch18
		String command = uri.substring(conPath.length()); // /~~.do
		response.getWriter().append("<h1>"+command+"</h1>");
		System.out.println("uri : "+uri);
		System.out.println("conPath : "+conPath);
		System.out.println("들어온 요청 : "+command);
		//들어온 요청에 따라다른 일을 하고 뷰로 forward(분기)
		String viewPage = null; //뷰페이지를 저장할 변수
		Service service = null;  // InsertService나 UpdateService, DeleteService, ...
		if(command.equals("/insert.do")) {
			//insert로직
			service = new InsertService();
			service.execute(request, response);
			viewPage = "select.do";
		}else if(command.equals("/select.do")) {
			service = new SelectService();
			service.execute(request, response);
			viewPage = "ex2/select.jsp";
		}else if(command.equals("/update.do")) {
			service = new UpdateService();
			service.execute(request, response);
			viewPage = "select.do";
		}else if(command.equals("/delete.do")) {
			service = new DeleteService();
			service.execute(request, response);
			viewPage = "select.do";
		}
		// viewPage로 forward
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}

}
