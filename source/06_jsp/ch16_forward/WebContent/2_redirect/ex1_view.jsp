<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
  <link href="<%=conPath %>/css/style.css" rel="stylesheet">
</head>
<body>
	<jsp:useBean id="member" class="com.lec.ex.Member" scope="page"/>
	<jsp:setProperty property="*" name="member"/>
	<h2>회원정보(ex1_view.jsp)</h2>
	<%-- <h3>회원 : <%=request.getAttribute("member") %></h3> --%>
	<h3>회원 : ${member }</h3>
	<h3>ID : ${member.id}</h3>
	<h3>PW : ${member.pw}</h3>
	<h3>name : ${member.name}</h3>
</body>
</html>