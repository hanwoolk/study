package com.lec.ex.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.ex.dao.MemberDao;
import com.lec.ex.dto.MemberDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MJoinService implements Service {
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
	String	path = request.getRealPath("memberPhotoUp");
	//out.print(path);
	int maxSize = 1024*1024*5; // 최대 업로드 사이즈 : 5MB
	String image = null;
	MultipartRequest mRequest = null;
	try{
		mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
		Enumeration<String> paramNames = mRequest.getFileNames(); //파라미터 이름들 bimage2, bimage1
		if(paramNames != null){
			String param = paramNames.nextElement();
			image = mRequest.getFilesystemName(param);
		}
	}catch(IOException e){
		System.out.print(e.getMessage());
	}
	//서버로 올려진 파일을 소스폴더로 복사
		InputStream is = null;
		OutputStream os = null;
		File serverFile = new File(path+"/"+image);
		if(serverFile.exists()){
			try{
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("D:/KHW/source/06_jsp/ch19_mvcMember/WebContent/memberPhotoUp/"+image);
				byte[] bs = new byte[(int)serverFile.length()];
				while(true){
					int readByteCnt = is.read(bs);
					if(readByteCnt == -1) break;
					os.write(bs, 0, readByteCnt);
				}
			}catch(Exception e){
				System.out.print(e.getMessage());
			}finally{
				try{
					if(os != null) os.close();
					if(is != null) is.close();
				}catch(Exception e){
					System.out.print(e.getMessage());
				}
			}// try-catch-finally
		}//if
		MemberDto dto = new MemberDto();
		String	mid			= mRequest.getParameter("mid");
		String	mpw			= mRequest.getParameter("mpw");
		String	mname		= mRequest.getParameter("mname");
		String	memail		= mRequest.getParameter("memail");
		String	mphoto		= image != null? image:"NOIMG.jpg";
		String	mbirthStr	= mRequest.getParameter("mbirthStr");
		String	maddress	= mRequest.getParameter("maddress");
		dto = new MemberDto(mid, mpw, mname, memail, mphoto, null, maddress, null);
		if(!mbirthStr.equals("")){
			dto.setMbirth(Date.valueOf(mbirthStr));
		}
		MemberDao mDao = new MemberDao();
		request.setAttribute("joinResult", mDao.join(dto));
	}

}
