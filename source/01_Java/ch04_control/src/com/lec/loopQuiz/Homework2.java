package com.lec.loopQuiz;

import java.util.Scanner;

//��ǻ�Ϳ� ���������� ������ ����� �� ������ ���ѹݺ��ϴ� ������ �ۼ��Ͻÿ�.
//(��, ������� 0, ������� 1, ����� 2)
public class Homework2 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int you, com;
			System.out.println("����(0), ����(1), ��(2), ����(-1) : ");
			you = sc.nextInt();
			com = (int)(Math.random()*3);
			String youStr = (you == 0) ? "����" : (you==1) ? "����" : "��";
			String comStr = (com == 0) ? "����" : (com==1) ? "����" : "��";
			if (you == -1)	
				break;
			if((you+2)%3 == com) {
						System.out.printf("����� %s, ��ǻ�ʹ�%s \t����� �̰���ϴ�.\n", youStr, comStr);
			}else if((you+3)%2 == com) {
				System.out.printf("����� %s, ��ǻ�ʹ�%s \te����� �����ϴ�.\n", youStr, comStr);
			}else {
				System.out.printf("����� %s, ��ǻ�ʹ�%s \te����� �����ϴ�.\n", youStr, comStr);
			}
		}
	}
}
