package com.lec.loopQuiz;
//1~10���� ���� �� ¦�� �Ǵ� Ȧ���� ���� ���غ���
public class Quiz2 {
	public static void main(String[] args) {
		int tot1 = 0;
		for (int i = 2; i < 11; i+=2) {
			tot1 = tot1 + i;
				System.out.println("1~10������ ¦���� ���� ��� : " + tot1);
		}
		int tot2 = 0;
		for (int j = 1; j < 11; j+=2) {
			tot2 = tot2 + j;
				System.out.println("1~10������ Ȧ���� ���� ��� : " + tot2);
		}
	}
}