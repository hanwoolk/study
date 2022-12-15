package com.lec.ex5_scanner;

import java.util.Random;
import java.util.Scanner;

//��ǻ�Ϳ� ���������� ������ ����� �̱� ������ ���ѹݺ��ϴ� ������ �ۼ��Ͻÿ�.
public class Homework2 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Random random = new Random();
		int you, com;
		final int SCISSOR 	= 0;
		final int ROCK 		= 1;
		final int PAPER 	= 2;
		final int NOTHING 	= -1;
		
		do {
			com = random.nextInt(3);
			System.out.print("[����], [����], [��] �� �����Ͻÿ�(�̱涧���� ����) : ");
			String youStr = sc.next().trim();
			if(youStr.equals("����")) {
				you = SCISSOR;
			}else if(youStr.equals("����")) {
				you = ROCK;
			}else if(youStr.equals("��")) {
				you = PAPER;
			}else {
				you = NOTHING; 
				continue;
			}
				if ((you + 2) % 3 == com) {
					System.out.printf("'���'�� �̰���ϴ�.\n");
				} else if ((you + 1) % 3 == com) {
					System.out.printf("'��ǻ��'�� �̰���ϴ�.\n");
				} else {
					System.out.printf("�����ϴ�.\n");
				}
		} while ((you == NOTHING || (you + 1) % 3 == com) || you == com);
		sc.close();
		System.out.println("�����մϴ�.");
	}// main
}//class