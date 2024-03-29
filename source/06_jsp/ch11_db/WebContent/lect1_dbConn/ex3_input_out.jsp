<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	String conPath = request.getContextPath(); %>
<%!
	String driver= "oracle.jdbc.driver.OracleDriver";
	String url	 = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String uid	 = "scott";
	String upw	 = "tiger";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%= conPath%>/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form action="">
		<p>
			부서번호
			<select name="deptno">
				<option value="0">전체 부서</option>
				<%
					String deptnoStr	= request.getParameter("deptno"); 
					if(deptnoStr==null){
						deptnoStr = "0";
					}
					int deptnoInput = Integer.parseInt(deptnoStr); //파라미터에서 전달 받은 값이 없으면 0
					
					Connection 					conn 	= null;
					PreparedStatement 	pstmt = null;
					ResultSet						rs		= null;
					String sql = "SELECT * FROM DEPT";
					try{
						Class.forName(driver);
						conn 	= DriverManager.getConnection(url, uid, upw);
						pstmt	= conn.prepareStatement(sql);
						rs		= pstmt.executeQuery();
						while(rs.next()){ //6단계
							int deptno 	 = rs.getInt("deptno");
							String dname = rs.getString("dname");
							String loc	 = rs.getString("loc");
							if(deptnoInput == deptno){
								out.println("<option value='"+deptno+"'selected='selected'>"+deptno+" - "+dname+" - "+loc+"</option>");
							}else{
								out.println("<option value='"+deptno+"'>"+deptno+" - "+dname+" - "+loc+"</option>");
							}
						}
					}catch(Exception e){
						System.out.println(e.getMessage());
					}finally{ //7단계
						if(rs		!= null) rs.close();
						if(pstmt!= null) pstmt.close();
						if(conn	!= null) conn.close();
					}
				%>
			</select>
			<input type="submit" value="검색">
		</p>
	</form>
	<table>
		<tr><th>사번</th><th>이름</th><th>입사일</th><th>부서번호</th></tr>
		<%
			sql = "SELECT * FROM EMP WHERE DEPTNO LIKE '%'||?";
			try{
				conn = DriverManager.getConnection(url, uid, upw);
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,deptnoInput);
				rs = pstmt.executeQuery();
				if(rs.next()){
					do{
						int 		empno 		= rs.getInt("empno");
						String	ename 		= rs.getString("ename");
						Date		hiredate	=	rs.getDate("hiredate");
						int			deptno		=	rs.getInt("deptno");
						out.print("<tr><td>" + empno + "</td>");
						out.print("    <td>" + ename + "</td>");
						out.print("		 <td>" + hiredate + "</td>");
						out.print("		 <td>" + deptno + "</td></tr>");
					}while(rs.next());
				}else{
					out.println("<tr><td colspan='4'> 해당 부서번호의 사원이 없습니다</td></tr>");
				}
			}catch(Exception e){
				System.out.println(e.getMessage());
			}finally{ //7단계
				if(rs		!= null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(conn	!= null) conn.close();
			}
		%>
	</table>
</body>
</html>