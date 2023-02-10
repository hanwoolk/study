<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
<link href="<%=conPath %>/css/exam.css" rel="stylesheet">
</head>
<body>
	<%int ans = (int)Math.floor((Math.random()*3)+1); 
		int pick = Integer.parseInt(request.getParameter("pick"));
		if(ans==pick){
			out.println("<span><h2>정답입니다</h2></span>");
			out.println("<h2>동전이 있던 곳은"+ans+"</h2>");
			out.println("<button onclick='location.href=\"exam.jsp\"\'>다시도전</button>");
		}else{
			request.setCharacterEncoding("utf-8");
			String msg = "<span><h2>Wrong! Try Again! <br>"+"("+pick+"은(는) 아니고 정답은"+ans+")</h2></span>";
			msg = URLEncoder.encode(msg, "utf-8");
			response.sendRedirect("exam.jsp?msg="+msg);
		}
	%>
</body>
</html>