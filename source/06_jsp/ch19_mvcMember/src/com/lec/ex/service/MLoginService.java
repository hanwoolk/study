package com.lec.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.ex.dao.MemberDao;

public class MLoginService implements Service {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		session.setAttribute("mid", mid);
		session.setAttribute("mpw", mpw);
		session.setAttribute("mname", mname);
		MemberDao mDao = new MemberDao();
		request.setAttribute("loginResult", mDao.login(mid, mpw));
		System.out.println(mDao.login(mid, mpw));
		System.out.println(mid + mpw);

	}

}
