package com.lec.quiz;
//���̸� �Է¹޾� �Է¹��� ���̰� 65�� �̻��� ��, ����ο�롱 ���, �ƴϸ� ���Ϲݡ����
import java.util.Scanner;
public class Quiz4 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("���̸� �Է����ּ��� : ");
		int su = sc.nextInt();
		System.out.println((su >= 65) ? "��ο��" : ((su>=0)? "�Ϲ�" : "����"));
		sc.close();
	}
}
