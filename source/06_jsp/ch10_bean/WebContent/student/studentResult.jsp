<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%= conPath%>/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:useBean id="c" class="com.lec.quiz.Student" scope="request"/>
	<p>학번 : <jsp:getProperty name="c" property="num"/></p>
	<p>이름 : <jsp:getProperty name="c" property="name"/></p>
	<p>학년 : <jsp:getProperty name="c" property="grade"/></p>
	<p>반 &nbsp;   : <jsp:getProperty name="c" property="classNum"/></p>
	<p>점수 : <jsp:getProperty name="c" property="score"/></p>
</body>
</html>