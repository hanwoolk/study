<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		p{text-align:center;}
		p:last-child {
			color:red;
			font-weight:bold;
		}
		input{
			width : 40px;
		}
	</style>
</head>
<body>
	<form action="">
		<p><input type="text" name="no1" value="<%=(int)(Math.random()*9)+1 %>" readonly="readonly"> * 
		   <input type="text" name="no2" value="<%=(int)(Math.random()*9)+1 %>" readonly="readonly"> = 
		   <input type="number" name="ans"></p>
		<p><input type="submit" value="확인">
		<p>${param.no1 } * ${param.no2 } = ${param.ans} 는 ${param.no1 * param.no2 eq param.ans? " 정답": "오답"}</p>
	</form>
</body>
</html>