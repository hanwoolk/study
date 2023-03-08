package com.lec.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BListServiceeeeeeeeeeeeeeeee implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null)	pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 10, BLOCKSIZE = 10;
		int startRow = (currentPage - 1)*PAGESIZE + 1;
	}

}
