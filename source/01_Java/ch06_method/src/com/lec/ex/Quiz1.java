package com.lec.ex;

import java.util.Scanner;

/*
����ڷκ��� ���ϴ� �ܼ�(2~9) �������� ����ϴ� ���α׷��� �����Ͻÿ�.
(��, �ܼ��� �Ű������� �޾� �ش� �ܼ��� �������� ����ϴ� �κ��� method�� ó���Ѵ�. 
����ڰ� 2~9 ������ ���� �ƴ� ���� �Է��� �� 2~9������ ���� �Է��� ������ ��� �Է� �޴´�.)
*/
public class Quiz1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Quiz1 ex = new Quiz1();
		int dan;
		do {
			System.out.print("2~9���� ���ϴ� �����ܼ��� �Է��Ͻÿ� : ");
			dan = sc.nextInt();
			if(dan < 2 || dan > 9) {			//���� �޼��� �߰�
				System.out.println("�߸� �Է��ϼ̽��ϴ�.2~9���� �ٽ� �Է��ϼ���.\n");
			}//if
			} while (dan < 2 || dan > 9); 
		ex.gu(dan);
		sc.close();
	}//main

	public void gu(int dan) {
		int i;
		for (i = 1; i < 10; i++) {
			System.out.println(dan + " X " + i + " = " + dan * i);
		}//for
	}//gu
}//class
