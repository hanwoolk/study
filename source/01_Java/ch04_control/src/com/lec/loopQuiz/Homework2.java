package com.lec.loopQuiz;

import java.util.Scanner;

//컴퓨터와 가위바위보 게임을 당신이 질 때까지 무한반복하는 게임을 작성하시오.
//(단, 가위대신 0, 바위대신 1, 보대신 2)
public class Homework2 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int you, com;
			System.out.println("가위(0), 바위(1), 보(2), 종료(-1) : ");
			you = sc.nextInt();
			com = (int)(Math.random()*3);
			String youStr = (you == 0) ? "가위" : (you==1) ? "바위" : "보";
			String comStr = (com == 0) ? "가위" : (com==1) ? "바위" : "보";
			if (you == -1)	
				break;
			if((you+2)%3 == com) {
						System.out.printf("당신은 %s, 컴퓨터는%s \t당신이 이겼습니다.\n", youStr, comStr);
			}else if((you+3)%2 == com) {
				System.out.printf("당신은 %s, 컴퓨터는%s \te당신이 졌습니다.\n", youStr, comStr);
			}else {
				System.out.printf("당신은 %s, 컴퓨터는%s \te당신은 비겼습니다.\n", youStr, comStr);
			}
		}
	}
}
