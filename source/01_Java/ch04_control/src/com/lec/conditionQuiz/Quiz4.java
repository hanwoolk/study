package com.lec.conditionQuiz;

import java.util.Scanner;

//��ǻ�Ϳ� ���������� ������ �ϴ� ���α׷��� �����Ͻÿ�. 
//��, ����ڴ� ������ ������ �� ���� 0�� �Է��ϰ� ������ �����ϰ��� �� ���� 1�� �Է��ϰ�, ���� �����ϰ��� �� ���� 2�� �Է��Ͽ� ������ �����մϴ�
public class Quiz4 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("����(0), ����(1), ��(2)�� �ϳ��� �����ϼ��� : ");
		int you = sc.nextInt();
		int com = (int) (Math.random() * 3);
		if ((you + 2) % 3 == com) {
			System.out.println("��ǻ�� : " + com + "\tyou win");
		} else if ((you + 1) % 3 == com) {
			System.out.println("��ǻ�� : " + com + "\tcom win");
		} else if ((you + 1) % 3 == com) {
			System.out.println("��ǻ�� : " + com + "\tcom win");
		} else if (you == com) {
			System.out.println("��ǻ�� : " + com + "\t���");
		} else if(0<you || you>=3) {
			System.out.println("��ȿ���� ���� �����Դϴ�");
		}
		
		sc.close();
	}
}
