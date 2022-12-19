package com.lec.ex3_set;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;

public class HashMapTestMain {
	public static void main(String[] args) {
		HashMap<String, Customer> cusList = new HashMap<String, Customer>();
//		ArrayList<String> cusList = new ArrayList<>();
		Scanner sc = new Scanner(System.in);
		String yesNo, tel;
		do {
			System.out.println("ȸ�������� �Ͻðڽ��ϱ�? Y/N");
			yesNo = sc.next().trim();
			if (yesNo.equalsIgnoreCase("y")) {
				Customer newCustomer = new Customer();
				System.out.print("�����Ͻ� ȸ���� �̸���?");
				newCustomer.setName(sc.next());
				System.out.print("�����Ͻ� ȸ���� ��ȭ��?");
				tel = sc.next();
				// ������ ������ ��ȭ��ȣ���� Ȯ���ϴ� ���
				if(cusList.get(tel)!=null) {
					System.out.println("�̹� ���ԵǾ� �ִ� ��ȭ��ȣ�Դϴ�. ��ȣ��ȣ�� �ߺ��Ͽ� ���� �Ұ��մϴ�");
					continue;
				}
				newCustomer.setTel(tel);
				System.out.print("�����Ͻ� ȸ���� �ּҴ�?");
				sc.nextLine();// ��������� �뵵
				newCustomer.setAddress(sc.nextLine());
				cusList.put(tel, newCustomer);
//				System.out.println("�̸��� �Է��ϼ���.");
//				String name = sc.next();
//				System.out.println("��ȭ��ȣ�� �Է��ϼ���.");
//				String tel = sc.next();
//				System.out.println("�ּҸ� �Է��ϼ���");
//				sc.nextLine();
//				String address = sc.nextLine();
//				cusList.put(tel, new Customer(name, tel, address));
				System.out.println("���� �� ���� Ȯ��: Y \n�߰� ���� : N");
				yesNo = sc.next().trim();
			} else if (yesNo.equalsIgnoreCase("n")) {
				break;
			} else {
				System.out.println("�߸� �Է��ϼ̽��ϴ�.");
			}
		} while (!yesNo.equalsIgnoreCase("y"));
		if (cusList.size() > 0) {
			Iterator<String> iterator = cusList.keySet().iterator(); // �ݺ���
			while (iterator.hasNext()) {
				String key = iterator.next();
				System.out.println(cusList.get(key));
			}
		} else {
			System.out.println("������ ȸ�� ����� �����ϴ�.");
		}
		sc.close();
	}
}
