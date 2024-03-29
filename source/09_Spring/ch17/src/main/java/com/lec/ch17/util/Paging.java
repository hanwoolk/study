package com.lec.ch17.util;

import com.lec.ch17.util.Paging;

import lombok.Data;

@Data
public class Paging {
	private int currentPage = 1;
	private int pageSize;
	private int blockSize;
	private int startRow;
	private int endRow;
	private int totCnt;
	private int pageCnt;
	private int startPage;
	private int endPage;
	private int orderNum;
	private int inverseNum;
	// empList.do 또는  empList.do?pageNum=2
	// Paging paginf = new Paging(14, 2, 10, 10);
	public Paging(int totCnt, String pageNum, int pageSize, int blockSize) {
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum); 
		}
		this.totCnt    = totCnt;
		this.pageSize  = pageSize;
		this.blockSize = blockSize;
		startRow = (currentPage - 1 ) * pageSize + 1;
		endRow = startRow + pageSize - 1 ;
		pageCnt = (int)Math.ceil((double)totCnt/pageSize);
		orderNum = startRow;
		inverseNum = totCnt - startRow + 1;
		startPage = ( (currentPage-1) / blockSize ) * blockSize + 1;
		startPage = currentPage - (currentPage-1) % blockSize;
		endPage = startPage + blockSize - 1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
	}
	// Paing paging = new Paging(14, null);
	public Paging(int totCnt, String pageNum) {
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum); 
		}else if(pageNum == null) {
			pageNum="1";
		}
		this.totCnt    = totCnt;
		this.pageSize  = 10;
		this.blockSize = 10;
		startRow = (currentPage - 1 ) * pageSize + 1;
		endRow = startRow + pageSize - 1 ;
		pageCnt = (int)Math.ceil((double)totCnt/pageSize);
		orderNum = startRow;
		inverseNum = totCnt - startRow + 1;
		System.out.println("inverseNum"+inverseNum);
		startPage = ( (currentPage-1) / blockSize ) * blockSize + 1;
		startPage = currentPage - (currentPage-1) % blockSize;
		endPage = startPage + blockSize - 1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
	}
}
