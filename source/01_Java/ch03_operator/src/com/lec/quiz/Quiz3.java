package com.lec.quiz;
//두수를 입력받아 
//두 수가 같은지 결과를 O나 X로 출력.
//첫번째 수가 더 큰지 결과를 O나 X로 출력한다.
import java.util.Scanner;
public class Quiz3 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("1.비교할 첫번째 정수를 입력하세요 : ");
		int su1 = sc.nextInt();
		System.out.print("2.비교할 두번째 정수를 입력하세요 : ");
		int su2 = sc.nextInt();
		String result1 = (su1 == su2) ? "O" : "X";
		String result2 = (su1 > su2) ? "O" : "X";
		System.out.println("두 수는 같은가? " + result1);
		System.out.println("첫번째 수가 더 큰가? " + result2);
		sc.close();
	}
}
