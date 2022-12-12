package com.lec.ex08_booklib;
//Book book = new Book("890-01-11", "java", "ȫ�浿")
public class Book implements ILendable {
	private String bookNo;		// å��ȣ
	private String bookTitle;	// å�̸�
	private String writer;		// ����
	private String borrower;	// ������
	private String checkOutDate; //������
	private byte state;			// ���� ����(0), ������(1)
	public Book(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
	}

	@Override
	public void checkOut(String borrower, String checkOutDate) {
		if(state == STATE_BORROWED) { // �������̸� �޼��� �Ѹ��� ��
			System.out.println(bookTitle +"�� �������Դϴ�");
			return;	//ȣ���� ������ ���ư�
		}
		//state�� 0(STATE_NORMAL)�̶� ���� ����
		this.borrower = borrower;
		this.checkOutDate = checkOutDate;
		state = STATE_BORROWED; //"������" ���·� ��ȯ
		System.out.println(bookTitle + "������ ����ó�� �Ǿ����ϴ�.");
		System.out.println("������ : " + borrower + "\t������ : " + checkOutDate);
	}
	@Override
	public void checkIn() {
		if(state == STATE_NORMAL) {
			System.out.println(bookTitle+"������ �ݳ� �Ϸ�� å�Դϴ�. Ȯ�� �ʿ�.");
			return;
		}
		// state�� ������(1:STATE_BORROWED)�̶� �ݳ� ó��
		borrower = null;
		checkOutDate = null;
		state = STATE_NORMAL;
		System.out.println(bookTitle + "������ �ݳ� �Ϸ�Ǿ����ϴ�.");
		
	}

	@Override
	public void printState() {
//		if(state == STATE_NORMAL) {
//			System.out.println(bookNo + "\t" + bookTitle + "(" + writer + "��)-���Ⱑ��");
//		}else if(state == STATE_BORROWED) {
//			System.out.println(bookNo + "\t" + bookTitle + "(" + writer + "��)-������");
//		}
		String msg = bookNo + "\t" + bookTitle + "(" + writer + " ��)-";
		msg += state == STATE_NORMAL ? "���Ⱑ��" : "������";
		System.out.println(msg);
	}
	// getters
	public String getBookNo() {
		return bookNo;
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

	public String getCheckOutDate() {
		return checkOutDate;
	}

	public byte getState() {
		return state;
	}
	
}