package com.lec.loop;

import java.util.Scanner;

// ��ǻ�Ϳ� ���������� ������ -1�� �Է��Ҷ����� ���ѹݺ��ϴ� ������ �ۼ��Ͻÿ�.
// (��, ������� 0, ������� 1, ����� 2, ���Ḧ ���ϸ� -1�� �Է��մϴ�)
public class Homework1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int com, you;
		while(true) {
			System.out.println("�ߴ� (-1), ����(0), ����(1), ��(2)�� �ϳ��� �����ϼ��� : ");
			you = sc.nextInt();
			if(you == -1) break;
			com = (int)(Math.random()*3);
			String youStr = (you == 0) ? "����" : (you == 1) ? "����" : "��";
			String comStr = (com == 0) ? "����" : (com == 1) ? "����" : "��";
			if(you<-1 || you>2) {
				System.out.println("�߸� �Է��Ͽ����ϴ�.");
			} else if ((you + 2) % 3 == com) {
				System.out.printf("��� : %s, \t ��ǻ�� : %s \t you win\n", youStr, comStr);
			} else if ((you + 1) % 3 == com) {
				System.out.printf("��� : %s, \t ��ǻ�� : %s \t you com\n", youStr, comStr);
			} else if (you == com) {
				System.out.printf("��� : %s, \t ��ǻ�� : %s \t �����ϴ�.\n", youStr, comStr);
			}
		}
		sc.close();
		System.out.println("�����Ͽ����ϴ�");
	}
}
