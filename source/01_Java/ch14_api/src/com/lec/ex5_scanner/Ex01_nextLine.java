package com.lec.ex5_scanner;

import java.util.ArrayList;
import java.util.Scanner;

public class Ex01_nextLine {
	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		System.out.print("���� : ");
		int age = sc.nextInt();
		System.out.println("�Է��� ���̴� " + age + "��");
		System.out.print("�̸� : ");
		String name = sc.next();
		System.out.println("�Է��� �̸��� " +name);
		System.out.print("�ּ� : ");
		sc.nextLine(); // ���ۿ� ���� "\n"�� �����
		String address = sc.nextLine(); //"\n"���� ���� retun�ϰ� "\n" �ڴ� ������
		System.out.println("�Է��� �ּҴ� " + address);
		System.out.println("��");
		sc.close();
	}
}
