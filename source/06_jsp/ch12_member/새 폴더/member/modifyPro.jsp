<%@page import="com.lec.customer.CustomerDao"%>
<%@page import="com.lec.customer.CustomerDto"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%= conPath%>/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<% request.setCharacterEncoding("utf-8");%>
	<jsp:useBean id="dto" class="com.lec.customer.CustomerDto"/>
	<jsp:setProperty property="*" name="dto"/>
	<%
		String tempBirth = request.getParameter("tempBirth");
		if(!tempBirth.equals("")){
			dto.setCbirth(Date.valueOf(tempBirth));
		}
		CustomerDto customer = (CustomerDto)session.getAttribute("customer");
		String sessionCpw = null;
		if(customer!=null){
			sessionCpw = customer.getCpw();
		}
		String oldPw = request.getParameter("oldPw");
		if(sessionCpw.equals(oldPw)){
			if(dto.getCpw()==null){
				dto.setCpw(oldPw);
			}
			CustomerDao cDao = new CustomerDao();
			int result = cDao.modifyCustomer(dto);
			if(result == CustomerDao.SUCCESS){
				session.setAttribute("customer",dto);
				%>
				<script>
					alert("정보수정이 완료되었습니다");
					location.href='main.jsp';
				</script>
		<%}else{ %>
				<script>
					alert("회원정보 수정이 실패되었습니다. 정보가 너무 깁니다");
					location.href='modify.jsp';
				</script>
		<%} %>
	<%}else{ %>
			<script>
				alert("현재 비밀번호와 다릅니다. 확인하세요")
				history.back();
			</script>
	<%} %>
</body>
</html>