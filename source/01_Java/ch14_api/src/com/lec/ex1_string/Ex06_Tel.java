package com.lec.ex1_string;

import java.util.Scanner;

/*
String tel;
while(){
  // ��ȣ(031-234-5678)�Է� �ϸ� (sc.next())
	"�Է��� ��ȭ��ȣ : 031-234-5678
	 ¦����° ���ڿ�  : 0 1 2 4 5 7
	���ڸ� ���ٷ�    : 8765-432-130
	��ȭ��ȣ �Ǿ��ڸ���: 031
	��ȭ��ȣ ���ڸ���: 5678"�� sysout
  // x(X)�� �Է��ϸ� ���α׷� ��
}

 */
public class Ex06_Tel {
	public static void main(String[] args) {
		String tel;
		int jjak;
		String reverse;
		String front;
		String back;
		Scanner scanner = new Scanner(System.in);
		while (true) {
			System.out.println("��ȭ��ȣ�� �Է��ϼ���. (���� :x)");
			tel = scanner.next();
			String[] arr = new String[tel.length()];
			System.out.println("��ȭ��ȣ�� : " + tel);
			for (int idx = 1; 0 < tel.length(); idx++) {
				System.out.println(arr[idx]);
				
			}
			for(int idx = tel.length() ; 0<= idx && idx < tel.length() ; idx--)
				System.out.println(arr[idx]);
			if(tel.equalsIgnoreCase("x"))
				break;
		}
	}
}