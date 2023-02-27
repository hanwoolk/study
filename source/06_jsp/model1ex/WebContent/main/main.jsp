<%@page import="com.lec.dto.CustomerDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
  <link href="<%=conPath %>/css/content.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
	<%
		//main.jsp 또는 main.jsp?pageNum=2
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 5, BLOCKSIZE = 2;
		int startRow = (currentPage-1) * PAGESIZE + 1;
		int endRow 	 = startRow + PAGESIZE - 1;
		CustomerDao cDao = CustomerDao.getInstance();
		ArrayList<CustomerDto> customers = cDao.listCustomer(startRow, endRow);
				
	%>
		<table>
			<tr style="height:60px;"><th>회원ID</th><th>비밀번호</th><th>이름</th><th>메일</th><th>주소</th></tr>
			<%
				if(customers.size()==0){%>
					<tr><td colspan="5">해당 회원이 없습니다</td></tr>
			<%}else{ 
					for(int i=0; i<customers.size(); i++){
						String cemail = customers.get(i).getCemail();
						String caddress = customers.get(i).getCaddress();
						out.print("<tr>");
						out.print("<td>" + customers.get(i).getCid() + "</td>");
						out.print("<td>" + customers.get(i).getCpw() + "</td>");
						out.print("<td>" + customers.get(i).getCname() + "</td>");
						out.print("<td>" + (cemail ==null? "":cemail) + "</td>");
						out.print("<td>" + (caddress ==null? "":caddress) + "</td>");
						
						out.print("</tr>");
					}
			}
			%>
		</table>
		<div class="paging">
			<%
				int totCnt = cDao.getCustomerCnt();
				int	pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE);
				int	startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE +1;
				int endPage = startPage + BLOCKSIZE -1;
				if(endPage>pageCnt){
					endPage = pageCnt;
				}
				if(startPage > BLOCKSIZE){
			%>
				[ <a href="<%=conPath%>/main/main.jsp?pageNum=<%=startPage-1%>">이전</a> ]	
			<%}
				for(int i=startPage; i<=endPage; i++){
					if(i==currentPage){
						out.print("[ " + i + " ]");
					}else{
						out.print("[ <a href='"+conPath+"/main/main.jsp?pageNum="+i+"'>" + i + "</a> ]");
					}
				}
				if(endPage<pageCnt){
					out.println("[ <a href='"+conPath+"/main/main.jsp?pageNum="+(endPage+1)+"'>이전</a> ]	");
				}
			%>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>