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
	<form action="examPro.jsp">
		<button name="pick" value="1">1번</button>
		<button name="pick" value="2">2번</button>
		<button name="pick" value="3">3번</button>
	</form>
	<%
		String msg = request.getParameter("msg");
	if(msg!=null){
		out.println(msg);
	}
	%>
</body>
</html>