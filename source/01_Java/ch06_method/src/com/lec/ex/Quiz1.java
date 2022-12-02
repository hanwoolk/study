package com.lec.ex;

import java.util.Scanner;

/*
사용자로부터 원하는 단수(2~9) 구구단을 출력하는 프로그램을 구현하시오.
(단, 단수를 매개변수로 받아 해당 단수의 구구단을 출력하는 부분을 method로 처리한다. 
사용자가 2~9 사이의 수가 아닌 수를 입력할 시 2~9사이의 수를 입력할 때까지 계속 입력 받는다.)
*/
public class Quiz1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Quiz1 ex = new Quiz1();
		int dan;
		do {
			System.out.print("2~9단중 원하는 구구단수를 입력하시오 : ");
			dan = sc.nextInt();
			if(dan < 2 || dan > 9) {			//오류 메세지 추가
				System.out.println("잘못 입력하셨습니다.2~9단중 다시 입력하세요.\n");
			}//if
			} while (dan < 2 || dan > 9); 
		ex.gu(dan);
		sc.close();
	}//main

	public void gu(int dan) {
		int i;
		for (i = 1; i < 10; i++) {
			System.out.println(dan + " X " + i + " = " + dan * i);
		}//for
	}//gu
}//class
