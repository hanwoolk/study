<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="c" class="com.lec.quiz.Student" scope="request"/>
	<jsp:setProperty name="c" property="*"/>
	<jsp:forward page="studentResult.jsp"/>
</body>
</html>