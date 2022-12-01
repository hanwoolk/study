package com.lec.ex;
//2차원 배열에 저장된 값의 합계를 구하시오

//int[][] arr = { {5,5,5,5,5}, {10, 10, 10, 10, 10}, {20, 20, 20, 20, 20}, {30, 30, 30, 30, 30}};	

public class Quiz2 {
	public static void main(String[] args) {
		int tot = 0;
		int[][] arr = { {  5,  5,  5,  5,  5 }, 
						{ 10, 10, 10, 10, 10 }, 
					    { 20, 20, 20, 20, 20 }, 
					    { 30, 30, 30, 30, 30 } };
		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr[i].length; j++) {
				tot += arr[i][j];
				System.out.printf("배열[%d][%d] = %d, 누적 : %d\n", i, j, arr[i][j], tot);
			}
		}
//		System.out.print(tot);     325만 출력
	}
}
