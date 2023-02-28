<%@page import="com.lec.dto.CustomerDto"%>
<%@page import="com.lec.dao.CustomerDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		String msg = "";
		request.setCharacterEncoding("utf-8");
		String cid = request.getParameter("cid");
		String cpw = request.getParameter("cpw");
		String method = request.getParameter("method"); // "null" 또는 "modify"
		CustomerDao cDao = CustomerDao.getInstance();
		int result = cDao.loginCheck(cid, cpw);
		// DB에 id와 pw 확인 작업 : SELECT * FROM MEMBER WHERE ID=? and pw=?
		if(result==CustomerDao.LOGIN_FAIL){
			msg = URLEncoder.encode("아이디/비밀번호를 체크하세요","utf-8");
			response.sendRedirect(conPath+"/customer/loginForm.jsp?msg="+msg);
		}else{
			CustomerDto customer = cDao.getCustomer(cid);
			session.setAttribute("customer", customer);
			if(method.equals("null")){
				response.sendRedirect(conPath+"/main/main.jsp");
			}else{
				response.sendRedirect(conPath+"/"+method+".jsp");
			}
		}
	%>
</body>
</html>






