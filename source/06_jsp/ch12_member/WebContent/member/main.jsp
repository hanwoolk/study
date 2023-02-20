<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%= conPath%>/css/join.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../member/header.jsp"/>
	<div id="mainform_wrap">
		<h1>main 화면</h1>
	</div>
	<jsp:include page="../member/footer.jsp"/>
</body>
</html>