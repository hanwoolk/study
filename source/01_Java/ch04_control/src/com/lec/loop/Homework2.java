package com.lec.loop;

import java.util.Scanner;

//��ǻ�Ϳ� ���������� ������ ����� �� ������ ���ѹݺ��ϴ� ������ �ۼ��Ͻÿ�.
//(��, ������� 0, ������� 1, ����� 2)
public class Homework2 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int you, com;
		do {
			System.out.println("����(0), ����(1), ��(2) �� �����Ͻÿ� : ");
			you = sc.nextInt();
			com = (int) (Math.random() * 3);
			String youStr = (you == 0) ? "����" : (you == 1) ? "����" : "��";
			String comStr = (com == 0) ? "����" : (com == 1) ? "����" : "��";
			if (2 < you || you > 0) {
				System.out.println("�߸� �����ϼ̽��ϴ�");
			} else {
				if ((you + 2) % 3 == com) {
					System.out.printf("����� %s, ��ǻ�ʹ�%s \t����� �̰���ϴ�.\n", youStr, comStr);
				} else if ((you + 1) % 3 == com) {
					System.out.printf("����� %s, ��ǻ�ʹ�%s \te����� �����ϴ�.\n", youStr, comStr);
				} else {
					System.out.printf("����� %s, ��ǻ�ʹ�%s \te�����ϴ�.\n", youStr, comStr);
				}
			}
		} while ((you + 2) % 3 == com || you == com);
		sc.close();
		System.out.println("�����մϴ�");
	}// main
}//class