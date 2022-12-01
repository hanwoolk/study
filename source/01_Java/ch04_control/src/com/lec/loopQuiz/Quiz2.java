package com.lec.loopQuiz;
//1~10까지 숫자 중 짝수 또는 홀수의 합을 구해보자
public class Quiz2 {
	public static void main(String[] args) {
		int tot1 = 0;
		for (int i = 2; i < 11; i+=2) {
			tot1 = tot1 + i;
				System.out.println("1~10까지의 짝수의 합의 결과 : " + tot1);
		}
		int tot2 = 0;
		for (int j = 1; j < 11; j+=2) {
			tot2 = tot2 + j;
				System.out.println("1~10까지의 홀수의 합의 결과 : " + tot2);
		}
	}
}