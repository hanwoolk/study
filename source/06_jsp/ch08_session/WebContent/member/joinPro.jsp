<%@page import="java.sql.Date"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href='<%=conPath %>/css/join.css' rel='stylesheet'>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String hiddenParam = request.getParameter("hiddenParam");
	String name       = request.getParameter("name");
	String id     		= request.getParameter("id");
	String pw 				= request.getParameter("pw");
	String birth 			= request.getParameter("birth");
	//Date   birthDate  = Date.valueOf(birth);
	//Timestamp birthTimestamp = Timestamp.valueOf(birth + " 00:00:00");
	Timestamp birthTimestamp = null;
	if(birth!=null && !birth.equals("")){
		birthTimestamp = Timestamp.valueOf(birth + " 00:00:00");
	}
	String[] hobby 		= request.getParameterValues("hobby");
	String gender 		= request.getParameter("gender");
	String email 			= request.getParameter("email");
	String[] mailSend = request.getParameterValues("mailSend");
	/* session.setAttribute("name", name); */
	session.setAttribute("id", id);
	session.setAttribute("pw", pw);
	//받은 파라미터 값을 Member DB에 저장
%>
	<script>
		alert('<%=name%>님 회원가입 안료되었습니다. 감사합니다.'); /* 스크립트릿도 홑따옴표 안에 넣어야함 */
	</script>

 	<jsp:include page="header.jsp"/>
	<div id="joinForm_wrap">
		<div id="join_title">회원가입정보</div>
		<h3>hiddenParam : <%=hiddenParam%> </h3>
		<h3>name : <%=name %></h3>
		<h3>id : <%=id %></h3>
		<h3>pw : <%=pw.replaceAll("[a-zA-Z0-9~`!@#$%^&*()\\-_+=|\\{}\\[\\]:;\"'?/<>,\\.]", "*") %></h3>
		<h3>birth : <%=birthTimestamp!=null? birthTimestamp:"" %></h3>
		<h3>hobby : <% 
				if(hobby!=null) {
					for(int i=0 ; i<hobby.length ; i++)
						if(i==hobby.length-1)
							out.print(hobby[i]);
						else
							out.print(hobby[i]+", ");
				}else {
					out.print("없음");
				}
		%></h3>
		<h3>gender : <%=gender %></h3>
		<h3>email : <%=email %></h3>
		<h3>mailSend : 
		<%
				if(mailSend!=null){
					out.print(Arrays.toString(mailSend));
				}else{
					out.print("모두 수신 거부");
				}
		
		%></h3>
	</div>
	<jsp:include page="footer.jsp"/><!-- jsp 소스가 include -->
</body>
</html>