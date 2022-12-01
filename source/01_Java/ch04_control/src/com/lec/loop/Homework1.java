package com.lec.loop;

import java.util.Scanner;

// 컴퓨터와 가위바위보 게임을 -1을 입력할때까지 무한반복하는 게임을 작성하시오.
// (단, 가위대신 0, 바위대신 1, 보대신 2, 종료를 원하면 -1을 입력합니다)
public class Homework1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int com, you;
		while(true) {
			System.out.println("중단 (-1), 가위(0), 바위(1), 보(2)중 하나를 선택하세요 : ");
			you = sc.nextInt();
			if(you == -1) break;
			com = (int)(Math.random()*3);
			String youStr = (you == 0) ? "가위" : (you == 1) ? "바위" : "보";
			String comStr = (com == 0) ? "가위" : (com == 1) ? "바위" : "보";
			if(you<-1 || you>2) {
				System.out.println("잘못 입력하였습니다.");
			} else if ((you + 2) % 3 == com) {
				System.out.printf("당신 : %s, \t 컴퓨터 : %s \t you win\n", youStr, comStr);
			} else if ((you + 1) % 3 == com) {
				System.out.printf("당신 : %s, \t 컴퓨터 : %s \t you com\n", youStr, comStr);
			} else if (you == com) {
				System.out.printf("당신 : %s, \t 컴퓨터 : %s \t 비겼습니다.\n", youStr, comStr);
			}
		}
		sc.close();
		System.out.println("종료하였습니다");
	}
}
