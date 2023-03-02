<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
  <link href="<%=conPath %>/css/style.css" rel="stylesheet">
</head>
<body>
	<h1>표현식 태그 이용</h1>
	<p>산술연산자 : 10+1 = <%=10+1 %></p>
	<p>산술연산자 : 10/0.0 = <%=10/0.0 %></p> <!-- 0으로 나누면 에러, 0.0으로 나누면 가능 -->
	<p>관계 연산자 : 1 > 2 = <%=1>2 %>
	<p>관계 연산자 : 1 == 2 = <%=1==2 %>
	<p>관계 연산자 : 1 != 2 = <%=1!=2 %>  
	<p>조건 연산자 : <%=(1>2)? "1이 2보다 큽니다 " : "1이 2보다 크지않습니다" %>  
	<p>논리 연산자 : (1>2) || (1&lt;2) = <%=(1>2) || (1<2)%>   <!-- '<' 대신 &lt; 사용 -->
	<p>로그인 여부 : <%=session.getAttribute("customer") == null ? "로그인 안함" : "로그인 함" %>
	<p>로그인 여부 : <%=session.getAttribute("customer") != null ? "로그인 함" : "로그인 안함" %>
	<p>pageNum 파라미터 여부 : <%=request.getParameter("pageNum") == null ? "pageNum 안옴":"pageNum 옴" %>
	<P>su파라미터 값 : <%=request.getParameter("su") %></P>
	<%-- <P>su파라미터 값 : <%=request.getParameter("su").toUpperCase() %></P> su가 null이라 오류 --%>
	
	<h1>EL 표기법(표현식 안에 쓸 수 있는 연산자는 다 사용 가능)</h1>
	<p>산술연산자 : 10+1 = ${10+1}</p>
	<p>산술연산자 : 10/0 = ${10/0}</p>
	<p>관계 연산자 : 1 > 2 = ${1>2 }</p>
	<p>관계 연산자 : 1 == 2 = ${1 eq 2 }</p>
	<p>관계 연산자 : 1 != 2 = ${1!=2}</p>  
	<p>조건 연산자 : ${(1>2)? "1이 2보다 큽니다 " : "1이 2보다 크지않습니다"}  </p>
	<p>논리 연산자 : (1>2) || (1&lt;2) = ${(1>2) || (1<2)}  </p>
	<p>로그인 여부 : ${customer eq null? "로그인 안함" : "로그인 함" }</p>
	<p>로그인 여부 : ${empty customer? "로그인 안함" : "로그인 함" }</p>
	<p>로그인 여부 : ${not empty customer? "로그인 함" : "로그인 안함" }</p>
	<p>pageNum 파라미터 여부 : ${empty param.pageNum ? "pageNum 안옴":"pageNum 옴"}</p>
	<P>su파라미터 값 : ${param.su }</P>
	<P>su파라미터의 대문자 변경 : ${param.su.toUpperCase()}</P>
</body>
</html>