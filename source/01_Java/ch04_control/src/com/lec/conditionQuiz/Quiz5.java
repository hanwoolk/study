package com.lec.conditionQuiz;

import java.util.Scanner;

// 수를 입력받아 절대값을 출력하는 프로그램
public class Quiz5 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("몇월인지 입력하세요 : ");
		int mon = sc.nextInt();
		switch (mon) {
		case 3:
		case 4:
		case 5:
			System.out.println("봄 입니다");
			break;
		case 6:
		case 7:
		case 8:
			System.out.println("여름 입니다");
			break;
		case 9:
		case 10:
		case 11:
			System.out.println("가을 입니다");
			break;
		case 12:
		case 1:
		case 2:
			System.out.println("겨울 입니다");
			break;
		default:
			System.out.println("유효하지 않은 숫자입니다");
		}
		sc.close();
	}
}
