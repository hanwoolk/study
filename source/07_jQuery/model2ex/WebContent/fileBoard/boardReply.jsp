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
	<div id="content_form">
	<!-- reply_view.jsp : param.pageNum, param.fid(안쓸예정), requestScope.replyBoard(원글정보) -->
		<form action="${conPath }/boardReply.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="fid" value="${param.fid }">
			<!--<input type="hidden" name="fid" value="${replyBoard.fid }">-->
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="fgroup" value="${replyBoard.fgroup }">		<!-- 원글 -->
			<input type="hidden" name="fstep" value="${replyBoard.fstep }">			<!-- 원글 -->
			<input type="hidden" name="findent" value="${replyBoard.findent }"> <!-- 원글 -->
			<table>
				<caption>${param.fid }번의 답변글 쓰기</caption>
				<tr>
					<th>작성자</th>
					<td>
						<input type="text" name="mid" required="required" autofocus="autofocus"> 
					</td>
				</tr>
				<tr>
					<th>글제목</th>
					<td>
						<input type="text" name="ftitle" required="required" value="[답]${replyBoard.ftitle.substring(0,1) }">
					</td>
				</tr>
				<tr>
					<th>본문</th>
					<td>
						<textarea rows="5" cols="20" name="fcontent"></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="file" name="ffilename"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="답글쓰기" class="btn">
						<input type="reset" value="취소" class="btn">
						<input type="button" value="목록" class="btn"
							onclick="location.href='${conPath}/boardList.do?pageNum=${param.pageNum }'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>