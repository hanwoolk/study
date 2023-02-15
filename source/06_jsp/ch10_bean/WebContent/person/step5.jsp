<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<!-- 프로세스단 (위치는 아무곳이나 상관없음)-->
	<jsp:useBean id="p" class="com.lec.ex.Person" scope="request"/> <!-- step1의 빈 생성자함수 만드는것과 같음 -->
	<jsp:setProperty name="p" property="name" param="name"/>
	<jsp:setProperty name="p" property="age" param="age"/>
	<jsp:setProperty name="p" property="gender" param="gender"/>
	<jsp:setProperty name="p" property="address" param="address"/>
	<jsp:forward page="personView.jsp"/>
</body>
</html>