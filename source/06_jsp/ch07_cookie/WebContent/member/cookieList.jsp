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
			font-size:32px;
			text-align:center;
			width:400px;
			margin:0 auto;
		}
	</style>
</head>
<body>
	<jsp:include page="../member/header.jsp"/>
	<div id="mainform_wrap">
		<br><br>
		<%
			Cookie[] cookies = request.getCookies();
			if(cookies!=null){
				for(Cookie cookie:cookies){
					String cname = cookie.getName();
					String cvalue = cookie.getValue();
					out.println("<p>" + cname + "(쿠키이름) : " + cvalue + "(쿠키값)</p>");
				}
			}else{
				out.println("<p>존재하는 쿠키가 없습니다</p>");
			}
		%>
		
	</div>
	<jsp:include page="../member/footer.jsp"/>
</body>
</html>