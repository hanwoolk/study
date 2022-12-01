package com.lec.loop;

import java.util.Scanner;

//컴퓨터와 가위바위보 게임을 당신이 질 때까지 무한반복하는 게임을 작성하시오.
//(단, 가위대신 0, 바위대신 1, 보대신 2)
public class Homework2 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int you, com;
		do {
			System.out.println("가위(0), 바위(1), 보(2) 중 선택하시오 : ");
			you = sc.nextInt();
			com = (int) (Math.random() * 3);
			String youStr = (you == 0) ? "가위" : (you == 1) ? "바위" : "보";
			String comStr = (com == 0) ? "가위" : (com == 1) ? "바위" : "보";
			if (2 < you || you > 0) {
				System.out.println("잘못 선택하셨습니다");
			} else {
				if ((you + 2) % 3 == com) {
					System.out.printf("당신은 %s, 컴퓨터는%s \t당신이 이겼습니다.\n", youStr, comStr);
				} else if ((you + 1) % 3 == com) {
					System.out.printf("당신은 %s, 컴퓨터는%s \te당신이 졌습니다.\n", youStr, comStr);
				} else {
					System.out.printf("당신은 %s, 컴퓨터는%s \te비겼습니다.\n", youStr, comStr);
				}
			}
		} while ((you + 2) % 3 == com || you == com);
		sc.close();
		System.out.println("종료합니다");
	}// main
}//class