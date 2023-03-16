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
		<c:set var="SUCCESS" value="1"/>
		<c:set var="FAIL" value="0"/>
		<c:if test="${modifyResult eq SUCCESS }">
			<script>alert('${param.fid}번 글 수정 성공')</script>
		</c:if>
		<c:if test="${modifyResult eq FAIL }">
			<script>
				alert('${param.fid}번 글 수정 실패')
				history.back();
			</script>
		</c:if>
		<table>
			<caption>상세보기</caption>
			<tr><th>작성자</th><td>${contentBoard.mname}(${contentBoard.mid})님</td></tr>
			<tr><th>제목</th><td>${contentBoard.ftitle }</td></tr>
			<tr><th>본문</th><td><pre>${contentBoard.fcontent }</pre></td></tr>
			<tr><th>첨부파일</th><td><pre>${contentBoard.ffilename }</pre></td></tr>
			<tr>
				<td colspan="2">
					<button onclick="location.href='${conPath}/boardModifyView.do?fid=${param.fid }&pageNum=${param.pageNum }'">수정</button>
					<button onclick="location.href='${conPath}/boardDelete.do?fid=${param.fid }&pageNum=${param.pageNum }'">삭제</button>
					<button onclick="location.href='${conPath}/boardReplyView.do?fid=${param.fid }&pageNum=${param.pageNum }'">답변</button>
					<button onclick="location.href='${conPath}/boardList.do?pageNum=${param.pageNum }'">목록</button>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>