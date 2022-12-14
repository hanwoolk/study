package com.lec.ex3_math;

import java.util.Random;

public class Ex06_lotto {
	public static void main(String[] args) {
		int[] lotto = new int[6];
		int i, j;
		int temp;
		Random random = new Random();
		for (i = 0; i < lotto.length; i++) {
			do { // 발생된 난수가 중복되었는지 체크
				temp = random.nextInt(45) + 1;
				for (j = 0; j < i; j++) {
					if (lotto[j] == temp) {
						System.out.println("중복되서 다시 함 " + temp);
						break;
					} // if - temp랑 같은 번호가 있으면 for문을 빠져나감
				} // for
			} while (i != j);
			lotto[i] = temp;
		}
		for (int l : lotto) {
			System.out.print(l + "\t");
		}
		System.out.println("\n정렬 후");
		// lotto 배열 값을 sort : 35 17 16 26 15 33
		for (i = 0; i < lotto.length - 1; i++) {
			for (j = i + 1; j < lotto.length; j++) {
				if (lotto[i] > lotto[j]) {
					temp = lotto[i];
					lotto[i] = lotto[j];
					lotto[j] = temp;

				}
			}
		}
		for (int l : lotto) {
			System.out.print(l + "\t");
		}
	}
}