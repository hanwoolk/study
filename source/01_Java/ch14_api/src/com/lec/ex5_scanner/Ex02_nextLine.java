package com.lec.ex5_scanner;

import java.util.Scanner;

public class Ex02_nextLine {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("�ּҴ� : ");
//		sc.nextLine(); //���������
		String address = sc.nextLine();
		System.out.println("�Է��Ͻ� �ּҴ� " + address);
		System.out.println("���� : ");
		int age = sc.nextInt();
		System.out.println("���̴�" + age);
		System.out.println("�̸� :");
		//���� ���ۿ� "\n"�� �ִ� ����
		sc.nextLine(); // ���� ����� ����
		String name = sc.nextLine();
		System.out.println("�Է��Ͻ� �̸��� " + name);
		System.out.println("���α׷� ��");
	}
}
