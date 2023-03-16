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
  <script src="https://code.jquery.com/jquery-3.6.4.js"></Script>
  <script>
	  $(document).ready(function(){
	  	$('tr').click(function(){
	  		var fid =$(this).children().eq(0).text().trim();
	  		if(!isNaN(Number(fid))){
	  			location.href='${conPath }/boardContent.do?fid='+fid+'&pageNum=${pageNum}';
	  		}
	  	});
	  });
  </script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
		<c:set var="SUCCESS" value="1"/>
		<c:set var="FAIL" value="0"/>
		<c:if test="${writeResult eq SUCCESS }">
			<script>alert('글쓰기 성공');</script>
		</c:if>
		<c:if test="${not empty writeErrorMsg}">
			<script>alert('${writeErrorMsg}');</script>
		</c:if>
		<c:if test="${modifyResult eq SUCCESS }">
			<script>alert('수정 성공');</script>
		</c:if>
		<c:if test="${modifyResult eq FAIL }">
			<script>
				alert('${param.fid}번 글 수정 실패');
				history.back();
			</script>
		</c:if>
		<c:if test="${not empty deleteResult }">
			<script>
				alert('${deleteResult}');
			</script>
		</c:if>
		<c:if test="${replyResult eq SUCCESS }">
			<script>alert('${param.fid}번 글의 답변글 쓰기 성공')</script>
		</c:if>
		<c:if test="${replyResult eq FAIL }">
			<script>
				alert('${param.fid}번 글의 답변글 쓰기 실패')
				history.go(-1);
			</script>
		</c:if>
		
		<table>
			<caption>게시판</caption>
			<tr><td><a href="${conPath}/boardWriteView.do">글쓰기</a></td></tr>
		</table>
		<table>
			<tr>
				<th>글번호</th><th>작성자ID</th><th>글제목</th>
				<th>IP</th><th>작성일</th><th>조회수</th>
			</tr>
			<c:if test="${list.size() eq 0 }">
				<tr>
					<td colspan="6">해당 페이지의 글이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${list.size() != 0 }">
				<c:forEach var="dto" items="${list }">
					<tr>
						<td>${dto.fid }</td>
						<td>${dto.mid }</td>
						<td class="left">
							<c:forEach var="i" begin="1" end="${dto.findent }">
								<c:if test="${i != dto.findent}">
									&nbsp; &nbsp;
								</c:if>
								<c:if test="${i eq dto.findent }">
									└
								</c:if>
							</c:forEach> <!-- 답글 들여쓰기 처리 -->
							<!--<a href="${conPath }/contentView.do?fid=${dto.fid}&pageNum=${pageNum}">-->
							${dto.ftitle}
							<!-- </a> -->
							<c:if test="${dto.fhit > 10}">
								<b> * </b>
							</c:if>
						</td>
						<td>${dto.fip }</td>
						<td>
							<fmt:formatDate value="${dto.frdate }" pattern="yy/MM/dd(E)"/>
						</td>
						<td>${dto.fhit }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div class="paging">
			<c:if test="${startPage > BLOCKSIZE}">
				[ <a href="${conPath }/boardList.do?pageNum=${startPage-1}">이전</a> ]
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage}">
				<c:if test="${i eq pageNum }">
					[ <b>${i }</b> ]
				</c:if>
				<c:if test="${i != pageNum }">
					[ <a href="${conPath}/boardList.do?pageNum=${i }">${i}</a> ]
				</c:if>
			</c:forEach>
			<c:if test="${endPage < pageCnt }">
				[ <a href="${conPath }/boardList.do?pageNum=${endPage+1}">다음</a> ]
			</c:if>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>