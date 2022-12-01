package com.lec.test;

//{76,45,34,89,100,50,90,93}  8개의 값을 1차원 배열로 초기화 하고 
//값에 합계와  평균 그리고 최대값과 최소값을 구하는 프로그램을 작성 하시요
public class ProgramimgLan {
	public static void main(String[] args) {
		int[] arr = { 76, 45, 34, 89, 100, 50, 90, 93 };
		int tot = 0;
		int maxIdx = 0, maxNum = 0;
		int minIdx = 0, minNum = 999;
		for (int temp : arr) {
			tot += temp;
		}
		double avg = (double) tot / arr.length;
		System.out.printf("합      계 = %d  ", tot);
		System.out.printf("평      균 = %.2f\n", avg);
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] > maxNum) {
				maxNum = arr[i];
				maxIdx = i;
			} // if - 최대값
			if (arr[i] < minNum) {
				minNum = arr[i];
				minIdx = i;
			} // if - 최소값
		} // for
		System.out.printf("최대값은 = %d  ", maxNum);
		System.out.printf("최소값은 = %d\n", minNum);
	}// main
}// class