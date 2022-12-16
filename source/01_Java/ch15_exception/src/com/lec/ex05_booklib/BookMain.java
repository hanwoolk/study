package com.lec.ex05_booklib;

import java.util.Scanner;

public class BookMain {
	public static void main(String[] args) throws Exception {
		Book[] books = {new Book("890-01-11", "java", "홍길동"),
						new	Book("890-01-12", "oracle", "오길동"),
						new	Book("890-02-01", "mysql", "마길동"),
						new	Book("890-01-01", "jdbc", "제이디"),
						new	Book("890-01-02", "html", "이에이")};
		Scanner scanner = new Scanner(System.in);
		int fn;	//기능번호 (1:대출/2:반납/3:책list/0:종료)
		int idx; // 대출하거나 반납할 때, 조회된 책의 index
		String bTitle, borrower; // 사용자에게 받을 책이름, 대출인, 대출일 
		do {
			System.out.print("1:대출/ 2:반납/ 3:책list /0:종료");
			fn = scanner.nextInt();
			switch(fn) {
			case 1: //대출로직 : 1.책이름입력 2.책조회 3.책상태확인 4.대출인입력 5.대출일입력 6.대출메소드 호출
				// 1.책이름입력
				System.out.println("대출하고자 하는 책이름은?");
				bTitle = scanner.next(); // white-space 앞까지의 String만 받음
				// 2.책조회
				for(idx = 0 ; idx <books.length ; idx++) { //idx가 5까지 가면 없는것
					if(bTitle.equals(books[idx].getBookTitle())) {
						break;
					}
				}//for
				if(idx == books.length) {
					System.out.println("현재 보유하지 않은 도서입니다.");
				}else { // books[idx] 도서를 대출
					// 3.책상태확인
					if(books[idx].getState() == Book.STATE_BORROWED) {
						System.out.println("현재 대출중인 도서입니다.");
					}else {
						// 4.대출인입력
						System.out.println("대출인은? ");
						borrower = scanner.next();
						// 5.대출일입력
						// 6.대출메소드 호출
						books[idx].checkOut(borrower);
					}//if - 상태확인
				}//if 도서조회
				break;
			case 2: //반납로직 : 1.책이름입력 2.책조회 3.반납메소드 호출
				System.out.println("반납하고자 하는 책이름은?");
				bTitle = scanner.next(); // white-space 앞까지의 String만 받음
				// 2.책조회
				for(idx = 0 ; idx <books.length ; idx++) { //idx가 5까지 가면 없는것
					if(bTitle.equals(books[idx].getBookTitle())) {
						break;
					}
				}//for
				if(idx == books.length) {
					System.out.println("해당 도서는 본 도서관의 책이 아닙니다.");
				}else {
					//3. 반납 메소드 호출
					books[idx].checkIn();
				}
				break;
			case 3: //책 list 출력 : for문의 이용하여 출력 또는 printState()메소드 호출
				for(Book book : books) {
					System.out.println(book);
				}
			}
		}while(fn!=0);
		System.out.println("종료");
		scanner.close();
	}
}
