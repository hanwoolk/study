package com.lec.condition;
// �� ���� �Է¹޾� � ���� �󸶳� �� ū�� ����Ͻÿ�
import java.util.Scanner;
public class Ex02_if {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("ù��° ���� : ");
		int num1 = sc.nextInt();
		System.out.print("�ι�° ���� : ");
		int num2 = sc.nextInt();
		if(num1>=num2) {
			System.out.printf("ù��° ��(%d)�� %d��ŭ �� Ů�ϴ�", num1, (num1-num2));
		} else if(num1<num2) {
			System.out.printf("�ι�° ��(%d)�� %d��ŭ �� Ů�ϴ�", num2, (num2-num1));
		} else {
			System.out.println("���� ���� �Է��ϼ̽��ϴ�");
		} // if
		sc.close();
	}// main
}// class
