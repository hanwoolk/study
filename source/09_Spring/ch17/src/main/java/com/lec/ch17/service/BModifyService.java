package com.lec.ch17.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lec.ch17.dao.BoardDao;
import com.lec.ch17.dto.Board;

public class BModifyService implements Service {

	@Override
	public void execute(Model model) {
//		Map<String, Object> map = model.asMap();
//		Board boardDto = (Board) map.get("boardDto");
//		HttpServletRequest request = (HttpServletRequest) map.get("request");
//		boardDto.setBip(request.getRemoteAddr());
//		BoardDao bDao = new BoardDao();
//		model.addAttribute("modifyResult",bDao.modify(boardDto));
	}

}
