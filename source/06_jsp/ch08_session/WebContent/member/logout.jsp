<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		#logoutform_wrap{
			height:600px;
			line-height:600px;
			font-size:32px;
			text-align:center;
			width:1000px;
			margin:0 auto;
			border:1px solid #D4A190;
		}
		#logoutform_wrap p{
			color:#D4A190;
			font-size:1.2em;
		}	
	</style>
	<script>
		setTimeout(function(){location.href='<%=conPath%>/member/main.jsp';},3000);
	</script>
</head>
<body>
	<%
			session.invalidate();	
	%>
	<jsp:include page="header.jsp"/>
	<div id="logoutform_wrap">
		<p>로그아웃 되었습니다. 잠시후 페이지 이동이 있겠습니다</p>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>