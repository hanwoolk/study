package com.lec.ch14.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@org.springframework.stereotype.Controller
public class Controller {
	@RequestMapping(value="home", method=RequestMethod.GET)
	public String hime() {
		return "home";
	}
}
