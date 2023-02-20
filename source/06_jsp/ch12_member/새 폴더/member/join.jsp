<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath();
		if(session.getAttribute("customer")!=null){
			response.sendRedirect("main.jsp");
		}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href='<%=conPath %>/css/join.css' rel='stylesheet'>
	<script>
		window.onload = function(){
			document.querySelector('form').onsubmit = function(){
				var pw = document.getElementById('cpw');
				var pwChk = document.getElementById('cpwChk');
				var patternMail = /^[a-zA-Z0-9_\.]+@[a-zA-Z0-9_]+(\.\w+){1,2}$/; // macth함수 사용
				var email = document.getElementById('cemail');
				if(cpw.value != cpwChk.value){
					alert('비밀번호를 확인하세요');
					cpw.value = '';
					cpwChk.value = '';
					cpw.focus();
					return false;
				}else	if(cemail.value && !cemail.value.match(patternMail)){
		      alert('메일 형식을 확인하세요');
		      cemail.focus();
		      return false;
		    }/* else if(!mailOption[0].selected && !mailOption[1].selected 
					&& !mailOption[2].selected && !mailOption[3].selected ){
					alert('메일수신을 한가지 이상 선택해 주세요');
					return false;
				} */
				/* 바로 위의 if문을 아래로 변경 가능() 
				var mailOptionCnt = 0;
				for(var i=0 ; i<mailOption.length ; i++){
					mailOptionCnt += mailOption[i].selected;
				}
				if(!mailOptionCnt){
					alert('메일수신을 한가지 이상 선택해 주세요');
					return false;
				} */
			};
		};
	</script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div id="joinForm_wrap">
		<div id="join_title">회원가입</div>
		<form action="joinPro.jsp" method="post">
			<input type="hidden" name="hiddenParam" value="xx">
			<table>
				<tr>
					<th><label for="cid">아이디</label></th>
					<td><input type="text" name="cid" id="cid" class="cid" required="required"></td>
				</tr>
				<tr>
					<th><label for="cpw">비밀번호</label></th>
					<td><input type="password" name="cpw" id="cpw" class="cpw" required="required"></td>
				</tr>
				<tr>
					<th><label for="cpwChk">비밀번호확인</label></th>
					<td><input type="password" name="cpwChk" id="cpwChk" class="cpwChk"></td>
				</tr>
				<tr>
					<th><label for="cname">이름</label></th>
					<td><input type="text" name="cname" id="cname" class="cname" required="required" autofocus="autofocus"></td>
				</tr>
				<tr>
					<th><label for="ctel">전화</label></th>
					<td><input type="text" name="ctel" id="ctel" class="ctel" placeholder="010-"></td>
				</tr>
				<tr>
					<th><label for="cemail">이메일</label></th>
					<td><input type="text" name="cemail" id="cemail" class="cemail"></td>
				</tr>
				<tr>
					<th><label for="caddress">주소</label></th>
					<td><input type="text" name="caddress" id="caddress" class="caddress"></td>
				</tr>
				<tr>
					<th><label for="tempBirth">생년월일</label></th>
					<td><input type="date" name="tempBirth" id="tempBirth" class="tempBirth"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="cgender" value="m" id="m"><label for="m">남자</label>
						<input type="radio" name="cgender" value="f" id="f"><label for="f">여자</label>
					</td>
				</tr>
				<tr>
					<td colspan="2"> </td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="가입하기" class="joinBtn_style">
						<input type="reset" value="다시하기" class="joinBtn_style">
						<input type="button" value="로그인" class="joinBtn_style" 
											onclick="location.href='<%=conPath%>/member/login.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="footer.jsp"/> <!-- jsp 소스가 include -->
</body>
</html>