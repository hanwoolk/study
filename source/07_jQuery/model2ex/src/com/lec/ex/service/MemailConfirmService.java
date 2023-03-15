package com.lec.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.ex.dao.MemberDao;

public class MemailConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("memail");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.memailConfirm(mid);
		if(result == MemberDao.EXISTENT){
			request.setAttribute("memailConfirmResult", "<b>중복된 email입니다</b>");
		}else{
			request.setAttribute("memailConfirmResult", "사용 가능한 email입니다");
		}

	}

}
