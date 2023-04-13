package com.lec.ch17.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.ch17.dto.Board;
import com.lec.ch17.service.BoardService;
import com.lec.ch17.util.Paging;

@Controller
public class MvcBoardController {
	@Autowired
	private BoardService boardService;
	@RequestMapping(value="list", method= {RequestMethod.GET,RequestMethod.POST} )
	public String list(String pageNum, Model model) {
		// mvcBoard/list.do
		// mvcBoard/list.do?pageNum=10
		model.addAttribute("boardList",boardService.boardList(pageNum));
		model.addAttribute("paging",new Paging(boardService.boardTotCnt(), pageNum));
		return "list";
	}
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String write() {
		return "write";
	}
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write_post(Board board, Model model,HttpServletRequest request) {
		model.addAttribute("writeResult",boardService.boardWrite(board, request));
		return "forward:list.do";
	}

	@RequestMapping(value="content", method= {RequestMethod.GET, RequestMethod.POST})
	public String content(int bid, Model model) {
		model.addAttribute("contentBoard",boardService.boardContent(bid));
		return "content";
	}
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String modify(int bid, Model model) {
		model.addAttribute("board",boardService.boardModifyReplyView(bid));
		return "modify";
	}
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modify(Board board, HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("modifyResult",boardService.boardModify(board, request));
		return "forward:content.do";
	}
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(int bid, Model model) {
		model.addAttribute("deleteResult",boardService.boardDelete(bid));
		return "forward:list.do";
	}
	@RequestMapping(value="reply", method=RequestMethod.GET)
	public String reply(int bid, Model model) {
		model.addAttribute("board",boardService.boardModifyReplyView(bid));
		return "reply";
	}
	@RequestMapping(value="reply", method=RequestMethod.POST)
	public String reply_post(Board board, HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		model.addAttribute("replyResult",boardService.boardReply(board, request));
		return "forward:list.do";
	}
}
