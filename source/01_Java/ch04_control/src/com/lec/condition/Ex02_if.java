package com.lec.condition;
// 두 수를 입력받아 어떤 수가 얼마나 더 큰지 출력하시오
import java.util.Scanner;
public class Ex02_if {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("첫번째 수는 : ");
		int num1 = sc.nextInt();
		System.out.print("두번째 수는 : ");
		int num2 = sc.nextInt();
		if(num1>=num2) {
			System.out.printf("첫번째 수(%d)가 %d만큼 더 큽니다", num1, (num1-num2));
		} else if(num1<num2) {
			System.out.printf("두번째 수(%d)가 %d만큼 더 큽니다", num2, (num2-num1));
		} else {
			System.out.println("같은 수를 입력하셨습니다");
		} // if
		sc.close();
	}// main
}// class
