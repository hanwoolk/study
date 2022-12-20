package com.lec.quiz;
// Friend Ŭ������ ArrayList�� ģ���� �ּ� ����,

// ��ĳ�� x�� ���� , �� �α��ڷ� �ּ� �˻�, �������� ������� �޼���

import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Scanner;

public class Test {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		ArrayList<Friend> friends = new ArrayList<Friend>();
		friends.add(new Friend("ȫ�浿", "����� ��걸", "010-9999-1234",
				new Date(new GregorianCalendar(1990, 4, 22).getTimeInMillis())));
		friends.add(new Friend("�ű浿", "����� ������", "010-9999-9999",
				new Date(new GregorianCalendar(1990, 5, 5).getTimeInMillis())));
		friends.add(new Friend("���浿", "�Ⱦ�� ���ȱ�", "010-7777-9999",
				new Date(new GregorianCalendar(1990, 2, 2).getTimeInMillis())));
		friends.add(new Friend("�ڱ浿", "�Ⱦ�� ���ȱ�", "010-6666-0986",
				new Date(new GregorianCalendar(1990, 6, 6).getTimeInMillis())));
		while (true) {
			boolean searchOk = false;
			System.out.println("�˻��� �ּ� �� ���� 2�ڸ� (��, ���Ḧ ���Ͻø� x�� �Է��Ͻÿ�) : ");
			String searchAdd = scanner.next();
			if (searchAdd.trim().equalsIgnoreCase("x"))
				break;
			for (Friend friend : friends) {
				String address = friend.getAddress();
				String key = address.substring(0,2);
				if (searchAdd.equals(key)) {
					System.out.println(friend);
					searchOk = true;
				}
			}
			if (!searchOk) {
				System.out.println("�ش� ������ ģ���� �����ϴ�\n");
			}
		}
		scanner.close();
	}
}