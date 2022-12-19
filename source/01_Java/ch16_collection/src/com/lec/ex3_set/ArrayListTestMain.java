package com.lec.ex3_set;

import java.util.ArrayList;
import java.util.Scanner;

public class ArrayListTestMain {
	public static void main(String[] args) {
		ArrayList<Customer> cusList = new ArrayList<>();
		Scanner sc = new Scanner(System.in);
		String yesNo;
		do {
			System.out.println("ȸ�������� �Ͻðڽ��ϱ�? Y/N");
			yesNo = sc.next().trim();
			if (yesNo.equalsIgnoreCase("y")) {
				System.out.println("�̸��� �Է��ϼ���.");
				String name = sc.next();
				System.out.println("��ȭ��ȣ�� �Է��ϼ���.");
				String tel = sc.next();
				System.out.println("�ּҸ� �Է��ϼ���");
				sc.nextLine();
				String address = sc.nextLine();
				cusList.add(new Customer(name, tel, address));
				System.out.println("���� �� ���� Ȯ��: Y \n�߰� ���� : N");
				yesNo = sc.next().trim();
			} else if (yesNo.equalsIgnoreCase("n")) {
				break;
			} else {
				System.out.println("�߸� �Է��ϼ̽��ϴ�.");
			}
		} while (!yesNo.equalsIgnoreCase("y"));
		if (cusList.size() > 0) {
			for (int i = 0; i < cusList.size(); i++)
				System.out.println(cusList.get(i));
		} else {
			System.out.println("������ ȸ�� ����� �����ϴ�.");
		}
		sc.close();
	}
}
