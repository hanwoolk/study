package com.lec.quiz;
//����, ����, ���� ������ ����ڿ��� �Է¹޾�, �� ������ ����ϰ� ����, ���(�Ҽ���2�ڸ�����) ����ϴ� ���α׷��� ���� �Ͻÿ�
import java.util.Scanner;
public class Quiz5 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("���� ������ �Է����ּ��� : " );
		int kor = sc.nextInt();
		System.out.print("���� ������ �Է����ּ��� : " );
		int eng = sc.nextInt();
		System.out.print("���� ������ �Է����ּ��� : " );
		int mat = sc.nextInt();
		System.out.println("���� ���� : " + kor + '��' + "\t���� ���� : " + eng + '��' + "\t���� ���� : " + mat);
		int tot = (kor + eng + mat);
		double avg = (tot/3.0);
		System.out.printf("���� : %d �� \t ��� : %.2f��",tot ,avg);
		sc.close();
	}
}
