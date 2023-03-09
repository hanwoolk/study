<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
  <link href="${conPath }/css/style.css" rel="stylesheet">
  <style>
  	div{
  		border:1px solid darkblue;
  		margin: 0 auto;
  		padding: 10;
  		width : 350px;
  	}
  	p{
  		text-align:center;
  	}
  	input{
  		text-align:center;
  	}
  </style>
</head>
<body>
	<div>
		<c:if test="${not empty loginResult }">
			<p>${session.mname}(${param.mid })님 어서 오세요</p>
			<p>--------------------------------</p>
			<p>
				<button onclick="location='logout.do'">로그아웃</button>
			</p>
		</c:if>
		<c:if test="${empty loginResult }">
			<p>로그인 상태가 아닙니다</p>
			<p>--------------------------------</p>
			<p>
				<button onclick="location='loginView.do'">로그인</button>
				<button onclick="location='joinView.do'">회원가입</button>
			</p>
		</c:if>
	</div>
</body>
</html>