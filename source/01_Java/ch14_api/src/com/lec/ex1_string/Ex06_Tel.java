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
		Scanner scanner = new Scanner(System.in);
		while (true) {
			System.out.println("��ȭ��ȣ�� �Է��ϼ���. (���� :x)");
			tel = scanner.next();
			String[] arr = new String[tel.length()];
			if (tel.equalsIgnoreCase("x")) {
				break;
			}
			System.out.println("�Է��� ��ȭ��ȣ : " + tel);
			System.out.print("¦����° ���ڿ�  :");
			for (int idx = 0; idx < tel.length(); idx++) {
					if(idx%2==0) {
						System.out.print(tel.charAt(idx) + " ");
					}
//					if(idx%2==0) {
//						System.out.print(tel.charAt(idx));
//					}else {
//						System.out.print(" ");
//					}
////				System.out.print(" " + tel.charAt(idx));
////				idx += 1;
			} // ¦�� for
			System.out.println();
			System.out.print("��ȣ�� �Ųٷ� :");
			for (int idx = tel.length() - 1; 0 <= idx; idx--) {
				System.out.print(tel.charAt(idx));
			} // �Ųٷ� for
			System.out.println("��ȭ��ȣ �� ���ڸ� :" + tel.substring(0, tel.indexOf('-'))); // ���� �ʿ� - �ձ���
			System.out.println("��ȭ��ȣ �� ���ڸ� :" + tel.substring(tel.lastIndexOf('-')+1)); // ���� �ʿ� �ٽ� -�ڱ���
			System.out.println();
		}
		scanner.close();
		System.out.println("����");
	}
}