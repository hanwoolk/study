<%@page import="com.lec.customer.CustomerDto"%>
<%@page import="com.lec.customer.CustomerDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%= conPath%>/css/login.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
	  String msg="";
		request.setCharacterEncoding("utf-8");
		String cid = request.getParameter("cid");
		String cpw = request.getParameter("cpw");
		String method = request.getParameter("method");
		CustomerDao cDao = new CustomerDao();
		int result = cDao.loginCheck(cid, cpw);
		if(result == CustomerDao.LOGIN_SUCCESS){
			CustomerDto customer = cDao.getCustomer(cid);
			session.setAttribute("customer",customer);
			if(method.equals("null")){
				response.sendRedirect(conPath+"/member/main.jsp");
			}else{ 
				response.sendRedirect(method+".jsp");
			}
		}else{
			msg = URLEncoder.encode("로그인 정보를 체크하세요","utf-8");
			response.sendRedirect("login.jsp?msg="+msg);
		}
	%>
</body>
</html>