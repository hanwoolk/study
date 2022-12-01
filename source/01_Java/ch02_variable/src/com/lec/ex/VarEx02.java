package com.lec.ex;
// println() : 콘솔창 출력(개행포함)
// print() : 콘솔창 출력(개행 미포함)
// printf() : 콘솔창에 출력(포맷을 지정)
public class VarEx02 {
	public static void main(String[] args) {
		//	타입 변수명 할당연산자 값;
		int i = 10; 		// 4byte
		byte j = 127;		// 1byte
		double h = 10.15;	// 8byte 소수
		i = 100;
		System.out.println("i=" + i + "\tj=" + j + "\th="+h); // \t:tap(8개간격)
		System.out.printf("i=%d \t j=%d \t h=%.1f \n", i, j, h);
		char c1 = 'A';		//char는 문자 1개만 저장 가능, 한글 가능
		char c2 = '홍';
		System.out.printf("c1=%c \t c2=%c\n",  c1, c2);
		System.out.printf("c1=%d \t c2=%d\n", (int)c1, (int)c2);
		/* \n:줄바꿈, %c:문자, %s:문자열, %d:정수, %f:실수
		%5.2f -> 전체5자리,소수2자리까지출력 %b:boolean
		*/
		System.out.println("프로그램 끝");
	}
}
