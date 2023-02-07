<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		table{
		width:1000px;
		margin : 0 auto;
		text-align: center;
		}
		tr td{
		padding:20px;
		}
	</style>
</head>
<body>
	<table>
		<tr>
			<%int su1 = Integer.parseInt(request.getParameter("su1"));
				int su2 = Integer.parseInt(request.getParameter("su2"));
				%>
				<caption><h2>구구단 <%=su1 %>단부터 <%=su2 %>단까지</h2></caption>
			<% for(int j=su1;j<=su2; j++){%>
			<td>
					<h3><%= j +"단 "%></h3>
					<% for(int i=1; i<10; i++){%>
					<p><%= j + " * " + i + " = " +(j*i)%></p>
					<%} %>
			</td>
			<%} %>
		</tr>
	</table>
</body>
</html>