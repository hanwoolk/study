package com.lec.conditionQuiz;

import java.util.Scanner;

//숫자를 받아 절대값을 나타내시오
public class Quiz1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("절대값을 구할 수를 입력하세요");
		int num = sc.nextInt();
		if (num < 0) {
			System.out.println("절대값 : " + num * -1);
		} else {
			System.out.println("절대값 : " + num);
		}
		sc.close();
	}
}
