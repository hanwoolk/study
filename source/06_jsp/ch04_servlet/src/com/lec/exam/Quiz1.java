package com.lec.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Quiz1")
public class Quiz1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] numStr = request.getParameterValues("num");
		response.setContentType("text/html; charset=utf-8;");
		PrintWriter out = response.getWriter();
		if(numStr == null) {
			response.getWriter().print("단수를 고르세요");
		}else {
		out.println("<html>");
		out.println("<head>");
		out.println("<link href=\"css/quiz1.css\" rel=\"stylesheet\">");
		out.println("</head>");
		out.println("<body>");
		out.println("<table>");
		out.println("<tr>");
		for(int i=0; i<numStr.length; i++) {
			out.println("<td id='dansu'>");
			out.println("<h3>"+numStr[i] + "단</h3>");
			for(int j=1; j<10; j++) {
				int num = Integer.parseInt(numStr[i]);
				out.println("<p>" + num + " * "+ j + " = " + num*j +"</p>");
			}
			out.println("</td>");
		}
		out.println("</tr>");
		out.println("</table>");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
