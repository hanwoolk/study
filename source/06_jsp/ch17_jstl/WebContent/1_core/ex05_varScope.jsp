<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
  <link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
	<h2>물품정보(ex05_varScope.jsp)</h2>
	<h4>code : ${code }</h4>
	<h4>price : ${price }</h4>
	<h4>name : ${name }</h4>
</body>
</html>