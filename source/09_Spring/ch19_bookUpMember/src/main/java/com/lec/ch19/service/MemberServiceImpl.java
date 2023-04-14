package com.lec.ch19.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.lec.ch19.dto.Member;
@Service
public class MemberServiceImpl implements MemberService {

	@Override
	public int idConfirm(String mid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int joinMember(Member member, HttpSession httpSession) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member getMember(String mid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String loginCheck(String mid, String mpw, HttpSession httpSession) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modifyMember(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

}
