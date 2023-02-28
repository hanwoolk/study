<%@page import="com.lec.dto.FileboardDto"%>
<%@page import="com.lec.dao.FileboardDao"%>
<%@page import="com.lec.dto.CustomerDto"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		String path = request.getRealPath("fileboardUpload");
		int maxSize = 1024*1024*5; //최대 업로드 용량은 5MB
		String ffilename = null; // 첨부파일이 서버에 저장된 파일 이름
		MultipartRequest mRequest = null;
		try{
			mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> paramNames = mRequest.getFileNames();
			String param = paramNames.nextElement();
			ffilename = mRequest.getFilesystemName(param); // 서버에 첨부하여 서버에 저장된 파일 이름
		}catch(IOException e){
			System.out.println(e.getMessage());
		}
		// 서버에서 소스 폴더로 파일 복사
		if(ffilename!=null){
			InputStream 	is = null;
			OutputStream 	os = null;
			try{
				File serverFile = new File(path + "/" + ffilename);
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("D:/KHW/source/06_jsp/model1ex/WebContent/fileboardUpload/"+ffilename);
				byte[] bs = new byte[(int)serverFile.length()];
				int readByteCnt;
				while((readByteCnt = is.read(bs)) !=-1){
					os.write(bs, 0, readByteCnt);
				}
				System.out.println(ffilename+" 복사함");
			}catch(Exception e){
				System.out.println(e.getMessage());
			}finally{
				if(os!=null) os.close();
				if(is!=null) is.close();
			}
		}
		// 파라미터 정보(pageNum, fnum, fsubject, fcontent, fpw, fref, fre_step, fre_level) 가져오기
		String pageNum = mRequest.getParameter("pageNum");
		int fnum			 	= Integer.parseInt(mRequest.getParameter("fnum"));
		String cid 			= ((CustomerDto)session.getAttribute("customer")).getCid();
		String fsubject = mRequest.getParameter("fsubject");
		String fcontent = mRequest.getParameter("fcontent");
		String fpw 			= mRequest.getParameter("fpw");
		int fref 				= Integer.parseInt(mRequest.getParameter("fref"));
		int fre_step 		= Integer.parseInt(mRequest.getParameter("fre_step"));
		int fre_level 	= Integer.parseInt(mRequest.getParameter("fre_level"));
		String fip 			= request.getRemoteAddr();
		// dto생성 후 
		FileboardDao fDao = FileboardDao.getInstance();
		FileboardDto fDto = new FileboardDto(fnum, cid, fsubject, fcontent, ffilename, fpw, fref, fre_step, fre_level, fip);
		// fnum이 0이면 dao를 통해서 원글쓰기
		// fnum이 0이 아니면 dao를 통해 답변글 쓰기
		int result;
		if(fnum==0){ //원글쓰기
			result = fDao.insertBoard(fDto);
		}else{ //답글쓰기
			result = fDao.reply(fDto);
		}
		if(result == FileboardDao.SUCCESS){
	%>
			<script>
				alert('<%=fnum==0? "글쓰기 완료":"답글 쓰기 완료"%>');
				location.href='<%=conPath%>/fileboard/fboardList.jsp?pageNum=<%=pageNum%>';
			</script>	
	<%}else{%>
			<script>
				alert('<%=fnum==0? "글쓰기 실패":"답글 쓰기 실패"%> (데이터 길이를 확인하세요)');
				history.back();
			</script>	
	<%}%>
</body>
</html>