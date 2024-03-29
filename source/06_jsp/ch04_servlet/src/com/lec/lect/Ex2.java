package com.lec.lect;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex2
 */
@WebServlet("/Ex2")
public class Ex2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Ex2() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 같은 이름의 파라미터 전달받았을 때 (menu,rest)
		String[] menu = request.getParameterValues("menu");
		String[] rest = request.getParameterValues("rest");
		String nation = request.getParameter("nation");
		response.setContentType("text/html; charset=utf-8;");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		if(menu!=null){
//			out.println("<h2>선택한 메뉴는" + Arrays.toString(menu)+"</h2>");
			out.print("<h2>선택한 메뉴는 ");
//			for(String m : menu) {
//				out.println(m + "  ");
//			}
			for(int i=0; i<menu.length; i++) {
				if(i == menu.length-1) {
					out.print(menu[i]);
				}else {
					out.print(menu[i]+", ");
				} // 중간에 "," 넣기위한 일반 for문
			}
			out.println("입니다</h2>");
		}else {
			out.println("<h2>선택한 메뉴가 없습니다</h2>");
			
		}
		if(rest!=null){
			out.println("<h2>선택한 식당은 " + Arrays.toString(rest)+"</h2>");
			
		}else {
			out.println("<h2>선택한 식당이 없습니다</h2>");
		}
		out.println("<h2> 선택한 국적은 "+nation+"</h2>");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
