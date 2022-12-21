package com.lec.ex05_booklib;

import java.util.Scanner;

public class BookMain {
	public static void main(String[] args) throws Exception {
		Book[] books = {new Book("890-01-11", "java", "ȫ�浿"),
						new	Book("890-01-12", "oracle", "���浿"),
						new	Book("890-02-01", "mysql", "���浿"),
						new	Book("890-01-01", "jdbc", "���̵�"),
						new	Book("890-01-02", "html", "�̿���")};
		Scanner scanner = new Scanner(System.in);
		int fn;	//��ɹ�ȣ (1:����/2:�ݳ�/3:ålist/0:����)
		int idx; // �����ϰų� �ݳ��� ��, ��ȸ�� å�� index
		String bTitle, borrower; // ����ڿ��� ���� å�̸�, ������, ������ 
		do {
			System.out.print("1:����/ 2:�ݳ�/ 3:ålist /0:����");
			fn = scanner.nextInt();
			switch(fn) {
			case 1: //������� : 1.å�̸��Է� 2.å��ȸ 3.å����Ȯ�� 4.�������Է� 5.�������Է� 6.����޼ҵ� ȣ��
				// 1.å�̸��Է�
				System.out.println("�����ϰ��� �ϴ� å�̸���?");
				bTitle = scanner.next(); // white-space �ձ����� String�� ����
				// 2.å��ȸ
				for(idx = 0 ; idx <books.length ; idx++) { //idx�� 5���� ���� ���°�
					if(bTitle.equals(books[idx].getBookTitle())) {
						break;
					}
				}//for
				if(idx == books.length) {
					System.out.println("���� �������� ���� �����Դϴ�.");
				}else { // books[idx] ������ ����
					// 3.å����Ȯ��
					if(books[idx].getState() == Book.STATE_BORROWED) {
						System.out.println("���� �������� �����Դϴ�.");
					}else {
						// 4.�������Է�
						System.out.println("��������? ");
						borrower = scanner.next();
						// 5.�������Է�
						// 6.����޼ҵ� ȣ��
						books[idx].checkOut(borrower);
					}//if - ����Ȯ��
				}//if ������ȸ
				break;
			case 2: //�ݳ����� : 1.å�̸��Է� 2.å��ȸ 3.�ݳ��޼ҵ� ȣ��
				System.out.println("�ݳ��ϰ��� �ϴ� å�̸���?");
				bTitle = scanner.next(); // white-space �ձ����� String�� ����
				// 2.å��ȸ
				for(idx = 0 ; idx <books.length ; idx++) { //idx�� 5���� ���� ���°�
					if(bTitle.equals(books[idx].getBookTitle())) {
						break;
					}
				}//for
				if(idx == books.length) {
					System.out.println("�ش� ������ �� �������� å�� �ƴմϴ�.");
				}else {
					//3. �ݳ� �޼ҵ� ȣ��
					books[idx].checkIn();
				}
				break;
			case 3: //å list ��� : for���� �̿��Ͽ� ��� �Ǵ� printState()�޼ҵ� ȣ��
				for(Book book : books) {
					System.out.println(book);
				}
			}
		}while(fn!=0);
		System.out.println("����");
		scanner.close();
	}
}