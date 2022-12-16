package com.lec.ex05_booklib;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

//Book book = new Book("890-01-11", "java", "홍길동")
public class Book implements ILendable {
	public final static int DUEDATE = 14;
	public final static int FEE = 100;
	private String bookNo; // 책번호
	private String bookTitle; // 책이름
	private String writer; // 저자
	private String borrower; // 대출인
	private byte state; // 대출 가능(0), 대출중(1)
	Date now = new Date();
	Date checkOutDate = new Date();

	public Book(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
	}

	@Override
	public void checkOut(String borrower) {
		if (state == STATE_BORROWED) { // 대출중이면 메세지 뿌리고 끝
			System.out.println(bookTitle + "는 대출중입니다.");
			return; // 호출한 곳으로 돌아감
		}
		// state가 0(STATE_NORMAL)이라서 대출 진행
		this.borrower = borrower;
		checkOutDate = new Date();
		state = STATE_BORROWED; // "대출중" 상태로 전환
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy년 MM월 dd일(E)");
		System.out.println(bookTitle + "도서가 ★대출처리★ 되었습니다.");
		System.out.println("대출인 : " + borrower + "\n대출일 : " + sdf1.format(now.getTime()) + "\n");
	}

	@Override
	public void checkIn() throws Exception {
		if (state == STATE_NORMAL) {
			throw new Exception(bookTitle + "도서는 반납 완료된 책입니다. 확인 필요.");
		}
		long nowMillis = now.getTime();
		long checkMillis = checkOutDate.getTime();
		long feeCollect = (nowMillis - checkMillis) / (1000 * 60 * 60 * 24) * FEE;
		if (nowMillis - checkMillis > DUEDATE) {
			System.out.println("연체료 " + feeCollect + "원");
			Scanner sc = new Scanner(System.in);
			System.out.println("연체료 일일 100원 부가합니다");
			System.out.println("내셔야할 연체료는" + feeCollect + "원 입니다. 연체료를 받았습니까?");
			String confirm = sc.next().trim();
			if (!confirm.equalsIgnoreCase("y")) {
				System.out.println("연체료를 납부해야 반납 가능합니다.");
				return;
			}
		}
		borrower = null;
		checkOutDate = null;
		state = STATE_NORMAL;
		System.out.println(bookTitle + "도서가 반납 완료되었습니다.");
	}
	// checkOutDate와 현시점 간의 날짜 계산
	// 연체료 출력 - > 연체료 냈는지 여부에따라 -> y or Y 입력시 반납처리 아니면 다시
	// state가 대출중(1:STATE_BORROWED)이라 반납 처리

	@Override
	public String toString() {
//		if(state == STATE_NORMAL) {
//			System.out.println(bookNo + "\t" + bookTitle + "(" + writer + "저)-대출가능");
//		}else if(state == STATE_BORROWED) {
//			System.out.println(bookNo + "\t" + bookTitle + "(" + writer + "저)-대출중");
//		}
		SimpleDateFormat sdf2 = new SimpleDateFormat("yy-MM-dd E요일");
		String aa2 = sdf2.format(now.getTime());
		String msg = bookNo + "\t" + bookTitle + "(" + writer + " 저)-";
		msg += state == STATE_NORMAL ? "대출가능" : "대출(" + aa2 + ")중";
		return msg;
	}

	// getters
	public String getBookNo() {
		return bookNo;
	}

	public void setCheckOutDate(Date checkOutDate) {
		this.checkOutDate = checkOutDate;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public String getWriter() {
		return writer;
	}

	public String getBorrower() {
		return borrower;
	}

	public Date getCheckOutDate() {
		return checkOutDate;
	}

	public byte getState() {
		return state;
	}

}
