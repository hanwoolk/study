<%@page import="com.lec.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String conPath = request.getContextPath();
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
  <link href="<%=conPath %>/css/style.css" rel="stylesheet">
</head>
<body>
	<jsp:useBean id="dto" class="com.lec.dto.CustomerDto"/>
	<jsp:setProperty property="*" name="dto"/>
	<%
		CustomerDao cDao = new CustomerDao();
		int result = cDao.idChk(dto.getCid());
		if(result==CustomerDao.AVAILABLE){
			result = cDao.joinCustomer(dto);
			if(result == CustomerDao.SUCCESS){
				session.setAttribute("id", dto.getCid());
				
			%>
				<script>
					alert("회원가입 감사합니다. 로그인 이후에 서비스 이용하세요")
					location.href='<%=conPath%>/customer/loginForm.jsp';
				</script>
			<%}else{%>
				<script>
					alert("회원가입 실패했습니다. 정보를 확인해주세요")
					history.back();
				</script>
			<%}
		}else{%>
			<script>
				alert("중복된 ID입니다.다른 아이디를 사용하세요")
				history.back();
			</script>
		<%}
	%>
</body>
</html>