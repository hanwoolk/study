<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%= conPath%>/css/join.css" rel="stylesheet" type="text/css">
	<script>
		setTimeout(function(){
			location.href='<%=conPath%>/member/main.jsp';
		},3000);
	</script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div id="logoutform_wrap">
	<%
		if(session.getAttribute("customer")!=null){
			session.invalidate();	
			out.print("<p>로그아웃 되었습니다. 잠시후 메인 페이지로 이동합니다</p>");			
		}else{
			out.print("<p>로그인 상태가 아닙니다. 잠시후 메인 페이지로 이동합니다</p>");			
		}
	%>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>