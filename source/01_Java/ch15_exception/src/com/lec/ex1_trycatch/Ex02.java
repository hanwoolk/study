package com.lec.ex1_trycatch;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Ex02 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int i, j=1; // ����ڿ��� �Է¹��� ���� ����
		System.out.print("ù��° ������?");
		do {
			try {
				i = sc.nextInt();
				break;
			} catch(InputMismatchException e) {
				System.out.println("���� ���ڸ� ���� ������");
				sc.nextLine(); 
			}
		}while(true);
			
		System.out.print("�ι�° ������?");
		try {
			j = sc.nextInt();
			System.out.println("i / j = " + (i / j)); // ���ܰ� �߻��� ���� �ִ� �κ�
		} catch (ArithmeticException e) { // ���� �߻��� ���� �κ� (���ܰ�ü�� Ÿ�� + ����(���ܸ޼����� ���) �̸� �־���� /�ܼ�â�� ��������)
			System.out.println(e.getMessage()); // ���� �޼��� ���
//			e.printStackTrace();
		} catch(InputMismatchException e) {
			System.out.println("���� �޼��� : " + e.getMessage());
			System.out.println("�߸� �Է��Ͽ� 1�� ��ü");
		}
		System.out.println("i = " + i + "\tj = " + j);
		System.out.println("i * j = " + (i * j));
		System.out.println("i + j = " + (i + j));
		System.out.println("i - j = " + (i - j));
		System.out.println("DONE");
		sc.close();
	}
}
