package com.lec.loopQuiz;

import java.util.Scanner;

//����ڷκ��� ���ϴ� �����ܼ��� �Է¹޾� �ش� �������� ����� ���� (���� �ð����� 5������)
public class Quiz3 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("���?");
		int num = sc.nextInt();
		for (int i = 1; i < 10; i++) {
				System.out.println(num+" x "+i+" = " + i*num);
		}
		sc.close();
	}	
}
