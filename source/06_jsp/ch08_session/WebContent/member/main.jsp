<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		#mainform_wrap{
			height:600px;
			line-height:600px;
			font-size:32px;
			text-align:center;
			width:1000px;
			margin:0 auto;
			border:1px solid #D4A190;
		}
		#mainform_wrap h1{
			color:#D4A190;
		}
	</style>
</head>
<body>
	<jsp:include page="../member/header.jsp"/>
	<div id="mainform_wrap">
		<h1>main 화면</h1>
	</div>
	<jsp:include page="../member/footer.jsp"/>
</body>
</html>