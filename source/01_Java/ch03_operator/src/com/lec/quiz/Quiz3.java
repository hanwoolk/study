package com.lec.quiz;
//�μ��� �Է¹޾� 
//�� ���� ������ ����� O�� X�� ���.
//ù��° ���� �� ū�� ����� O�� X�� ����Ѵ�.
import java.util.Scanner;
public class Quiz3 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("1.���� ù��° ������ �Է��ϼ��� : ");
		int su1 = sc.nextInt();
		System.out.print("2.���� �ι�° ������ �Է��ϼ��� : ");
		int su2 = sc.nextInt();
		String result1 = (su1 == su2) ? "O" : "X";
		String result2 = (su1 > su2) ? "O" : "X";
		System.out.println("�� ���� ������? " + result1);
		System.out.println("ù��° ���� �� ū��? " + result2);
		sc.close();
	}
}
