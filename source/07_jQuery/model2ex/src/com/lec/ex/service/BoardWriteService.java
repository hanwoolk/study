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
import javax.servlet.http.HttpSession;

import com.lec.ex.dao.BoardDao;
import com.lec.ex.dao.MemberDao;
import com.lec.ex.dto.BoardDto;
import com.lec.ex.dto.MemberDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
public class BoardWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("memberPhotoUp");
		int maxSize = 1024*1024*10; // 사진 업로드 제한 용량 : 10M
		String ffilename = ""; // 첨부된 파일이 저장된 파일 이름
		// mRequest 객체 생성 후 mPhoto 파일이름 얻어옴
		MultipartRequest mRequest = null;
		int result = 0; // 회원가입 결과를 저장할 변수(가입성공시 1, 실패시 0저장)
		try {
			//첨부된 파일을 서버에 저장하고, 파일이름(mphoto) 가져오기
			mRequest = new MultipartRequest(request, path, maxSize,
								"utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			//while(params.hasMoreElements()) {
				String param = params.nextElement();
				ffilename = mRequest.getFilesystemName(param);
			//}
			// mRequest을 이용하여 파라미터 받아와서 DB 저장
			String mid = mRequest.getParameter("mid");
			String ftitle = mRequest.getParameter("ftitle");
			String fcontent = mRequest.getParameter("fcontent");
			String fip = request.getRemoteAddr();
			ffilename = ffilename==null ? "NOIMG.JPG" : ffilename;
			BoardDao bDao = new BoardDao();
			result = bDao.write(mid, ftitle, fcontent, ffilename, fip);
			request.setAttribute("writeResult", result);
		} catch (IOException e) {
			System.out.println(e.getMessage());
			request.setAttribute("writeErrorMsg", "첨부 파일의 용량이 너무 큽니다. 10M가 이내로 업로드 해 주세요");
		}
		
		// 서버에 업로드된 파일을 소스 폴더로 복사
		File serverFile = new File(path + "/" + ffilename);
		if(serverFile.exists() && !ffilename.equals("NOIMG.JPG") && result==BoardDao.SUCCESS) {
			InputStream is = null;
			OutputStream os = null;
			try {
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("D:/KHW/source/07_jQuery/model2ex/WebContent/memberPhotoUp/"+ffilename);
				byte[] bs = new byte[(int) serverFile.length()];
				while(true) {
					int readByteCnt = is.read(bs);
					if(readByteCnt==-1) break;
					os.write(bs, 0, readByteCnt);
				}
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(os!=null) os.close();
					if(is!=null) is.close();
				} catch (IOException e) {
					// TODO: handle exception
				}
			}
		}
	}
}