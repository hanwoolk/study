package com.lec.quiz;

public class Example {
	public static void main(String[] args) {
		// ����, ����, ���� ���� �Ҵ�
		// ����, ���
		// ������ ���
		int kor = 100, eng = 99, math = 100;
		int tot = kor + eng + math;
		double avg = tot / 3.0; // or double avg = (double)tot / 3;
		System.out.println("���� = " + kor + "\t���� = " + eng + "\t���� = " + math);
		System.out.printf("���� = %d \t ��� = %.2f \n", tot, avg);
	}
}
