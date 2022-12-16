package com.lec.ex05_booklib;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

//Book book = new Book("890-01-11", "java", "ȫ�浿")
public class Book implements ILendable {
	public final static int DUEDATE = 14;
	public final static int FEE = 100;
	private String bookNo; // å��ȣ
	private String bookTitle; // å�̸�
	private String writer; // ����
	private String borrower; // ������
	private byte state; // ���� ����(0), ������(1)
	Date now = new Date();
	Date checkOutDate = new Date();

	public Book(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
	}

	@Override
	public void checkOut(String borrower) {
		if (state == STATE_BORROWED) { // �������̸� �޼��� �Ѹ��� ��
			System.out.println(bookTitle + "�� �������Դϴ�.");
			return; // ȣ���� ������ ���ư�
		}
		// state�� 0(STATE_NORMAL)�̶� ���� ����
		this.borrower = borrower;
		checkOutDate = new Date();
		state = STATE_BORROWED; // "������" ���·� ��ȯ
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy�� MM�� dd��(E)");
		System.out.println(bookTitle + "������ �ڴ���ó���� �Ǿ����ϴ�.");
		System.out.println("������ : " + borrower + "\n������ : " + sdf1.format(now.getTime()) + "\n");
	}

	@Override
	public void checkIn() throws Exception {
		if (state == STATE_NORMAL) {
			throw new Exception(bookTitle + "������ �ݳ� �Ϸ�� å�Դϴ�. Ȯ�� �ʿ�.");
		}
		long nowMillis = now.getTime();
		long checkMillis = checkOutDate.getTime();
		long feeCollect = (nowMillis - checkMillis) / (1000 * 60 * 60 * 24) * FEE;
		if (nowMillis - checkMillis > DUEDATE) {
			System.out.println("��ü�� " + feeCollect + "��");
			Scanner sc = new Scanner(System.in);
			System.out.println("��ü�� ���� 100�� �ΰ��մϴ�");
			System.out.println("���ž��� ��ü���" + feeCollect + "�� �Դϴ�. ��ü�Ḧ �޾ҽ��ϱ�?");
			String confirm = sc.next().trim();
			if (!confirm.equalsIgnoreCase("y")) {
				System.out.println("��ü�Ḧ �����ؾ� �ݳ� �����մϴ�.");
				return;
			}
		}
		borrower = null;
		checkOutDate = null;
		state = STATE_NORMAL;
		System.out.println(bookTitle + "������ �ݳ� �Ϸ�Ǿ����ϴ�.");
	}
	// checkOutDate�� ������ ���� ��¥ ���
	// ��ü�� ��� - > ��ü�� �´��� ���ο����� -> y or Y �Է½� �ݳ�ó�� �ƴϸ� �ٽ�
	// state�� ������(1:STATE_BORROWED)�̶� �ݳ� ó��

	@Override
	public String toString() {
//		if(state == STATE_NORMAL) {
//			System.out.println(bookNo + "\t" + bookTitle + "(" + writer + "��)-���Ⱑ��");
//		}else if(state == STATE_BORROWED) {
//			System.out.println(bookNo + "\t" + bookTitle + "(" + writer + "��)-������");
//		}
		SimpleDateFormat sdf2 = new SimpleDateFormat("yy-MM-dd E����");
		String aa2 = sdf2.format(now.getTime());
		String msg = bookNo + "\t" + bookTitle + "(" + writer + " ��)-";
		msg += state == STATE_NORMAL ? "���Ⱑ��" : "����(" + aa2 + ")��";
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
