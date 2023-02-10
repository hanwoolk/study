package com.lec.examex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Quiz4")
public class Quiz4_실습 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>GET방식 요청입니다.</h1>");
		out.println("</body>");
		out.println("</html>");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>POST방식 요청입니다.</h1>");
		out.println("</body>");
		out.println("</html>");
		actionDo(request, response);
		
		
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8;");
		PrintWriter out = response.getWriter();
		String bg = request.getParameter("bg");
		String[] col = { "red", "orange", "yellow", "green", "blue", "navy", "purple" };
		out.println("<html>");
		out.println("<head>");
		out.println("<style>");
		int bgIdx;
		for (bgIdx = 0; bgIdx < col.length; bgIdx++) {
			if (col[bgIdx].equals(bg)) {
				break;
//					String bgC = null;
//					String txC = null;
//					if (i == 0) {
//						bgC = col[i];
//						txC = col[col.length - 1];
//						out.println("h1{color:" + txC + ";}");
//						out.println("body{background-color:" + bgC + ";}");
//						break;
//					} else {
//						bgC = col[i];
//						txC = col[i - 1];
//						out.println("h1{color:" + txC + ";}");
//						out.println("body{background-color:" + bgC + ";}");
//						break;
//					}
			}
		} // for
		int fontIdx = bgIdx == 0 ? 6 : bgIdx - 1;
		out.println("h1{color:" + col[fontIdx] + ";}");
		out.println("body{background-color:" + col[bgIdx] + ";}");
		out.println("</style>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>배경색은" + col[bgIdx] + " 글자색은" + col[fontIdx] + "</h1>");
		out.println("</body>");
		out.println("</html>");
	}
}
