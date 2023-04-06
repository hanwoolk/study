<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
<c:set var="tot" value="${student.kor + student.eng + student.mat}"/>
	<form action="" method="get">
		<table>
			<tr><td colspan="2" id="right">현재 총 ${cnt }명</td></tr>
			<tr><th>이 름 :</th><td>${student.name }</td></tr>
			<tr><th>국 어 :</th><td>${student.kor }</td></tr>
			<tr><th>영 어 :</th><td>${student.eng }</td></tr>
			<tr><th>수 학 :</th><td>${student.mat }</td></tr>
			<tr><th>총 점 :</th><td>${tot }</td></tr>
			<tr><th>평 균 :</th><td><fmt:formatNumber value="${tot/3 }" pattern="###.00"/></td></tr>
			<tr>
				<td colspan="2" id="center">
					<button onclick="history.back()">뒤로가기</button>
					<button onclick="input.do">다시입력</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>