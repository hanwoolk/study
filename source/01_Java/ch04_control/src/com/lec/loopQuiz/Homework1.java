package com.lec.loopQuiz;

import java.util.Scanner;

// ��ǻ�Ϳ� ���������� ������ -1�� �Է��Ҷ����� ���ѹݺ��ϴ� ������ �ۼ��Ͻÿ�.
// (��, ������� 0, ������� 1, ����� 2, ���Ḧ ���ϸ� -1�� �Է��մϴ�)
public class Homework1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int com = (int) (Math.random() * 3);
		int you;
		do {
			System.out.println("�ߴ� (-1), ����(0), ����(1), ��(2)�� �ϳ��� �����ϼ��� : ");
			you = sc.nextInt();
			if ((you + 2) % 3 == com) {
				System.out.println("��ǻ�� : " + com + "\tyou win");
			} else if ((you + 1) % 3 == com) {
				System.out.println("��ǻ�� : " + com + "\tcom win");
			} else if (you == com) {
				System.out.println("��ǻ�� : " + com + "\t���");
			} else if (0 < you || you >= 3) {
				System.out.println("��ȿ���� ���� �����Դϴ�");
			}
		} while (you != -1);
		System.out.println("������������ �ߴ��ϼ̽��ϴ�.");
		sc.close();
	}

}
