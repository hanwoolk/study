<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	String conPath = request.getContextPath(); 
	if(session.getAttribute("customer")!=null){
		response.sendRedirect("main.jsp");
	}
String msg = request.getParameter("msg");
if(msg!=null){%>
	<script>
		alert('<%=msg%>');
	</script>
<%}%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%= conPath%>/css/login.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div id="loginForm_wrap">
		<div id="login_title">로그인</div>
		<form action="<%=conPath%>/member/loginPro.jsp" method="post">
				<input type="hidden" name="method" value="<%=request.getParameter("method")%>">
			<table>
				<tr><td></td></tr>
				<tr>
					<td><label for="cid">아이디</label></td>
					<td><input type="text" name="cid" id="cid" required="required"
								autofocus="autofocus" value="<%
									String sessionId = (String)session.getAttribute("cid");
									if(sessionId !=null){
										out.print(sessionId);
										}
										%>"></td>
				</tr>
				<tr>
					<td><label for="cpw">비밀번호</label></td>
					<td><input type="password" name="cpw" id="cpw" required="required"></td>
				</tr>
				<tr><td></td></tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="로그인" class="loginBtn_style">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<%
							if(msg!=null){ //로그인 실패해서 다시 옴%>
								<p id="login_findIdPw">아이디/비밀번호를 잊으셨나요?</p>
							<%}%>
					</td>
				</tr>
			</table>
			<p id="login_join">아직 회원이 아니신가요?
			<a href="<%=conPath %>/member/join.jsp">회원가입</a>
		</form>
	</div>
	<jsp:include page="../member/footer.jsp"/>
</body>
</html>