package com.lec.conditionQuiz;

import java.util.Scanner;

//���ڸ� �޾� ���밪�� ��Ÿ���ÿ�
public class Quiz1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("���밪�� ���� ���� �Է��ϼ���");
		int num = sc.nextInt();
		if (num < 0) {
			System.out.println("���밪 : " + num * -1);
		} else {
			System.out.println("���밪 : " + num);
		}
		sc.close();
	}
}
