package com.lec.quiz;
import java.util.Scanner;
// 3�� ��� ���� �Ǵ��ϱ� : ����ڷκ��� ���ڸ� �Է� �ް�, �Է� ���� ���ڰ� 3�� ������� �ľ�
public class Quiz1 {
	public static void main(String[] args) {
		// String name = "ȫ�浿";
		Scanner sc = new Scanner(System.in); // new ������ ���� ����
		System.out.print("������ �Է��ϼ��� : ");
		int su = sc.nextInt(); // Ű����κ��� �Է¹��� ������ ��ȯ�ϴ� ���
		String result = (su %3 == 0) ? "3�� ����Դϴ�" : "3�� ����� �ƴմϴ�";
		System.out.println("�Է��Ͻ� �� (" + su + ")�� " + result);
		System.out.printf("�Է��Ͻ� �� (%d)�� %s\n", su, result);
		sc.close(); //�� �� �� ���� ��
	}
}
