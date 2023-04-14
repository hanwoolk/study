package com.lec.ch19.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lec.ch19.service.BookService;

@Controller
public class MainController {
	@Autowired
	private BookService bookService;
	@RequestMapping(value="main")
	public String list(Model model) {
		model.addAttribute("mainList",bookService.mainList());
		return "main/main";
	}
}

