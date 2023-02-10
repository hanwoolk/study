<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
		window.onload = function(){
			document.querySelector('form').onsubmit = function(){
				var su = document.querySelector('input[type="text"]');
				var suNum = Number(su.value.trim());
				if(isNaN(suNum) || suNum<=0 || suNum%1!=0){
					alert('자연수를 입력하세요');
					su.value = '';
					su.focus();
					return false;
					
				}
			};
		};
	</script>
</head>
<body>
<%
	String su = request.getParameter("su"); 
	if(su!=null){
		su=su.trim();
	}else if(su == null){
		su=" ";
	}
%>
	<fieldset>
	<legend>숫자 입력</legend>
	<form action="">
<%-- 	<p>숫자 <input type="text" name="su" value="<%=su==null? "":su%>"> <input type="submit"></p>--%>
	<p>숫자 <input type="text" name="su" value="<%
																							if(su!=null){
																							 out.print(su);
																							 }
																						 %>">
																							<input type="submit"></p>

	</form>
	</fieldset>
	<%
		if(su!=null){
			int n = Integer.parseInt(su);
			int total = 0;
			for(int i=1; i<=n; i++){
				total+=i;
			}
			out.println("<h2>1부터 "+n+"까지 누적합은 "+total+"입니다</h2>");
	%>
	1부터 <%=n %>까지 누적합은 <%=total %>입니다.
		<%}%>
</body>
</html>