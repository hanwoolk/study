package com.lec.conditionQuiz;

import java.util.Scanner;

// ���� �Է¹޾� ���밪�� ����ϴ� ���α׷�
public class Quiz5 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("������� �Է��ϼ��� : ");
		int mon = sc.nextInt();
		switch (mon) {
		case 3:
		case 4:
		case 5:
			System.out.println("�� �Դϴ�");
			break;
		case 6:
		case 7:
		case 8:
			System.out.println("���� �Դϴ�");
			break;
		case 9:
		case 10:
		case 11:
			System.out.println("���� �Դϴ�");
			break;
		case 12:
		case 1:
		case 2:
			System.out.println("�ܿ� �Դϴ�");
			break;
		default:
			System.out.println("��ȿ���� ���� �����Դϴ�");
		}
		sc.close();
	}
}
