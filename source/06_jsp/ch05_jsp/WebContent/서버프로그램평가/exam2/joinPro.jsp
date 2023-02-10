<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href='../../css/join.css' rel='stylesheet'>
</head>
<body>
	<div id="joinForm_wrap">
		<div id="join_title">회원가입</div>
			<table>
<% 
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH:mm:s");
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String id = request.getParameter("id");
String pwStr = request.getParameter("pw");
String birth = request.getParameter("birth");
/* Date birth1 = sdf.parse(birthStr); */
String hobby = request.getParameter("hobby");
String gender = request.getParameter("gender");
String email = request.getParameter("email");
String[] mailSend = request.getParameterValues("mailSend");
Date date = new Date(System.currentTimeMillis());
String ip = request.getRemoteAddr();
String pw="";
for(int i=1; i<=pwStr.length(); i++){
	pw+="＊";
}


out.print("<h2>name :" + name+ "</h2>");
out.print("<h2>id :" +id + "</h2>");
out.print("<h2>pw :" +pw + "</h2>");
out.print("<h2>birth :" +birth + "</h2>");
out.print("<h2>birth2 :" +birth + "</h2>");
out.print("<h2>hobby :" +hobby+ "</h2>");
out.print("<h2>gender :" +gender + "</h2>");
out.print("<h2>email :" +email + "</h2>");
	String emailSend = "";
if(mailSend==null){
	out.print("<h2>emailSend : 모두 수신 거부</h2>");
}else{
	for(int i=0; i<mailSend.length; i++){
	emailSend += mailSend[i] + " ";
	}	
}
out.print("<h2>emailSend :" +emailSend + "</h2>");
out.print("<h2>가입일 :" +date + "</h2>");
out.print("<h2>가입IP :" +ip + "</h2>");


%>
</table>
</div>
	<%@include file="./footer.jsp" %>
</body>
</html>