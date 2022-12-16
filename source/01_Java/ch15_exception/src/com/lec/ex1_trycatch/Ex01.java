package com.lec.ex1_trycatch;

import java.util.Scanner;

public class Ex01 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int i, j; // ����ڿ��� �Է¹��� ���� ����
		System.out.print("ù��° ������?");
		i = sc.nextInt();
		System.out.print("�ι�° ������?");
		j = sc.nextInt();
		System.out.println("i = " + i + "\tj = " + j);
		System.out.println("i * j = " + (i * j));
		try {
			System.out.println("i / j = " + (i / j)); // ���ܰ� �߻��� ���� �ִ� �κ�
		} catch (ArithmeticException e) { // ���� �߻��� ���� �κ� (���ܰ�ü�� Ÿ�� + ����(���ܸ޼����� ���) �̸� �־���� /�ܼ�â�� ��������)
			System.out.println(e.getMessage()); // ���� �޼��� ���
		}
		System.out.println("i + j = " + (i + j));
		System.out.println("i - j = " + (i - j));
		System.out.println("DONE");
		sc.close();
	}
}
