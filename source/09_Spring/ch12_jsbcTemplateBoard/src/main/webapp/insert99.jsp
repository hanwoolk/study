<%@page import="com.lec.ch17.dto.Board"%>
<%@page import="com.lec.ch17.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<%
		BoardDao bDao = new BoardDao();
			Board bDto = new Board();
			for(int i = 0; i<99 ; i++){
		if(i%3==0){
			bDto.setBname("홍길동");
		}else if(i%3==1){
			bDto.setBname("심방탄");
		}else{
			bDto.setBname("이순신");
		}
		bDto.setBtitle("제목" + i + "입니다");
		bDto.setBcontent("본문"+i);
		bDto.setBip("192.168.0."+1);
		int result = bDao.write(bDto);
		System.out.println(result == 1 ? i + "번째 성공" : i + "번째 실패");
			}
			response.sendRedirect("mvcBoard/list.do");
	%>	
</body>
</html>