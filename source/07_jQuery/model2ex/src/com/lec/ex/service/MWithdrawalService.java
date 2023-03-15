package com.lec.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.ex.dao.BoardDao;
import com.lec.ex.dao.MemberDao;
import com.lec.ex.dto.MemberDto;

public class MWithdrawalService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String mid = null;
		MemberDto sessionMember = (MemberDto) session.getAttribute("member");
		if(sessionMember!=null) {
			mid = sessionMember.getMid();
		}
		MemberDao mDao = MemberDao.getInstance();
		BoardDao bDao = new BoardDao();
		int result = mDao.withdrawalMember(mid); // 회원탈퇴
		bDao.withrawalDelete(mid);
		session.invalidate(); // 세션 삭제
		if(result == MemberDao.SUCCESS) {
			request.setAttribute("withdrawalResult", "회원 탈퇴 및 작성 글 삭제가 완료되었습니다.");
		}else {
			request.setAttribute("withdrawalResult", "로그인이 되어 있지 않습니다.");
		}
	}

}
