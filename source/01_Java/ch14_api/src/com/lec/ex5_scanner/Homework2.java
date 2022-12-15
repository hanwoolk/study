package com.lec.ex5_scanner;

import java.util.Random;
import java.util.Scanner;

//컴퓨터와 가위바위보 게임을 당신이 이길 때까지 무한반복하는 게임을 작성하시오.
public class Homework2 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Random random = new Random();
		int you, com;
		final int SCISSOR 	= 0;
		final int ROCK 		= 1;
		final int PAPER 	= 2;
		final int NOTHING 	= -1;
		
		do {
			com = random.nextInt(3);
			System.out.print("[가위], [바위], [보] 중 선택하시오(이길때까지 진행) : ");
			String youStr = sc.next().trim();
			if(youStr.equals("가위")) {
				you = SCISSOR;
			}else if(youStr.equals("바위")) {
				you = ROCK;
			}else if(youStr.equals("보")) {
				you = PAPER;
			}else {
				you = NOTHING; 
				continue;
			}
				if ((you + 2) % 3 == com) {
					System.out.printf("'당신'이 이겼습니다.\n");
				} else if ((you + 1) % 3 == com) {
					System.out.printf("'컴퓨터'가 이겼습니다.\n");
				} else {
					System.out.printf("비겼습니다.\n");
				}
		} while ((you == NOTHING || (you + 1) % 3 == com) || you == com);
		sc.close();
		System.out.println("축하합니다.");
	}// main
}//class