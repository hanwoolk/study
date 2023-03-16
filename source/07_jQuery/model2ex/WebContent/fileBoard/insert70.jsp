<%@page import="com.lec.ex.dto.BoardDto"%>
<%@page import="com.lec.ex.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
  <link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
	<%
		String mid = null, ftitle = null, fcontent = null, ffilename = null, fip = null;
		BoardDao bDao = new BoardDao();
		for(int i=0; i<=70; i++){
			mid = "go";
			ftitle = "제목"+i;
			fcontent = "본문"+i;
			ffilename = "NOIMG.JPG";
			fip = "192.168.1."+i;
			int result = bDao.write(mid, ftitle, fcontent, ffilename, fip);
			System.out.println(result == 1? i+"번째 성공" : i+"번째 실패");
		}
	response.sendRedirect("../boardList.do");
%>
</body>
</html>