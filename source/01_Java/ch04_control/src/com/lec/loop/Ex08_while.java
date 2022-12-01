package com.lec.loop;

/*
 * 콘솔창에 다음과 같이 출력되도록 for문과 while문을 이용하여 구현하시오.
		i가 1일 때 누적합은 1이다
		i가 2일 때 누적합은 3이다
		i가 3일 때 누적합은 6이다
		i가 4일 때 누적합은 10이다
		i가 5일 때 누적합은 15이다
		i가 6일 때 누적합은 21이다
		i가 7일 때 누적합은 28이다
		i가 8일 때 누적합은 36이다
		i가 9일 때 누적합은 45이다
		i가 10일 때 누적합은 55이다
 */
public class Ex08_while {
	public static void main(String[] args) {
		int tot = 0; // 누적합 변수
		int i = 1;
		while (i <= 10) {
			tot += 1;
			System.out.printf("i가 %d일 때 누적합은 %d이다\n", i, tot);
			i++;
		}
//		for(int i=1 ; i<11 ; i++) {
//			tot += i;
//		System.out.printf("i가 %d일 때 누적합은 %d이다\n",i , tot);
//		}
	}
}
