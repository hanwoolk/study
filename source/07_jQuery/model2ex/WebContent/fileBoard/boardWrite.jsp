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
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<c:if test="${member eq null}">
		<script>
			alert('로그인이 필요합니다')
			location.href="${conPath }/member/login.jsp?method=write";
		</script>
	</c:if>
	<div id="content_form">
		<form action="${conPath }/boardWrite.do" method="post" enctype="multipart/form-data">
			<table>
				<caption>원글 쓰기</caption>
				<tr>
					<th>ID</th>
					<td>
						<input type="text" name="mid" required="required" autofocus="autofocus" value="${member.mid }" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>글제목</th>
					<td>
						<input type="text" name="ftitle" required="required">
					</td>
				</tr>
				<tr>
					<th>본문</th>
					<td>
						<textarea rows="5" cols="20" name="fcontent"></textarea>
					</td>
				</tr>
				<tr>
					<th>파일 첨부</th>
					<td><input type="file" name="ffilename"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="글쓰기" class="btn">
						<input type="reset" value="취소" class="btn">
						<input type="button" value="목록" class="btn"
							onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>