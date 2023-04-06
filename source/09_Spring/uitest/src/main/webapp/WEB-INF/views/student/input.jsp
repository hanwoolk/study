<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<script>
	function nameChk(){
		var name = document.form.name.value;
		if(name.length < 1){
			alert('이름 한글자 이상 입력 필수')
			return false;
		}
	}
</script>
<body>
	<form action="${conPath }/student/input.do" name="form" method="post" onsubmit="return nameChk()">
		<table>
			<tr><td colspan="2" id="right">현재 총 ${cnt }명</td></tr>
			<tr><th colspan="2" id="center">개인 정보 입력</th></tr>
			<tr><th>이 름</th><td><input type="text" name="name" placeholder="홍길동"></td></tr>
			<tr><th>국 어</th><td><input type="number" min="0" max="100" name="kor" placeholder="100"></td></tr>
			<tr><th>영 어</th><td><input type="number" min="0" max="100" name="eng" placeholder="100"></td></tr>
			<tr><th>수 학</th><td><input type="number" min="0" max="100" name="mat" placeholder="99"></td></tr>
			<tr><td colspan="2" id="center"><input type="submit" value="입 력"></td></tr>
		</table>
	</form>
</body>
</html>