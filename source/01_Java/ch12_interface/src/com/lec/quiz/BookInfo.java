package com.lec.quiz;

public class BookInfo {
	private String bookNo;		// å��ȣ
	private String bookTitle;	// å�̸�
	private String writer;		// ����
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
