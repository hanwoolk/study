package com.lec.loopQuiz;

import java.util.Scanner;

//사용자로부터 원하는 구구단수를 입력받아 해당 구구단을 출력해 보자 (수업 시간에는 5단으로)
public class Quiz3 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("몇단?");
		int num = sc.nextInt();
		for (int i = 1; i < 10; i++) {
				System.out.println(num+" x "+i+" = " + i*num);
		}
		sc.close();
	}	
}
