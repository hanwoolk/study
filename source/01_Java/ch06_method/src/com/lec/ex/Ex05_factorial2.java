package com.lec.ex;

import java.util.Scanner;

// s! = s*(s-1)*(s-2)*...2*1
public class Ex05_factorial2 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int num;
		do {
			System.out.print("�� !�� ����ұ��? ");
			num = sc.nextInt();
		} while (num <= 0);
		long res = factorial(num);
		System.out.println(num + "! = " + res);
		sc.close();
	}

	// s! = s*(s-1)!
	// 1! = 1 (factorial ����� ����� �Է��ϴ� ������ �Ѵ�)
	private static long factorial(int s) {
		if (s == 1) {
			return 1;
		} else {
			return s * factorial(s - 1); //����� �޼ҵ� ȣ��
		}
	}
}
