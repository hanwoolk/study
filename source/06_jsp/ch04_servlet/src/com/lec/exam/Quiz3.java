package com.lec.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Quiz3")
public class Quiz3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8;");
		PrintWriter out = response.getWriter();
		String suStr = request.getParameter("su");
		int su = Integer.parseInt(request.getParameter("su"));
		int tot=0;
		out.println("<html>");
		out.println("<head>");
		out.println("<link href=\"css/quiz3.css\" rel=\"stylesheet\">");
		out.println("</head>");
		out.println("<body>");
		for(int i=0; i<=su; i++) {
			tot+=i;
		}
		out.println("<h1>1부터 "+su+"까지 누적합은"+tot+"</h1>");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
