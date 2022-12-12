package com.lec.quiz;

public class BookInfo {
	private String bookNo;		// 책번호
	private String bookTitle;	// 책이름
	private String writer;		// 저자
	public BookInfo(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
	}
	public String getBookNo() {
		return bookNo;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public String getWriter() {
		return writer;
	}
	
	
}
