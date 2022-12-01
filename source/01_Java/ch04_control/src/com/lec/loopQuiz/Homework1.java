package com.lec.loopQuiz;

import java.util.Scanner;

// 컴퓨터와 가위바위보 게임을 -1을 입력할때까지 무한반복하는 게임을 작성하시오.
// (단, 가위대신 0, 바위대신 1, 보대신 2, 종료를 원하면 -1을 입력합니다)
public class Homework1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int com = (int) (Math.random() * 3);
		int you;
		do {
			System.out.println("중단 (-1), 가위(0), 바위(1), 보(2)중 하나를 선택하세요 : ");
			you = sc.nextInt();
			if ((you + 2) % 3 == com) {
				System.out.println("컴퓨터 : " + com + "\tyou win");
			} else if ((you + 1) % 3 == com) {
				System.out.println("컴퓨터 : " + com + "\tcom win");
			} else if (you == com) {
				System.out.println("컴퓨터 : " + com + "\t비김");
			} else if (0 < you || you >= 3) {
				System.out.println("유효하지 않은 숫자입니다");
			}
		} while (you != -1);
		System.out.println("가위바위보를 중단하셨습니다.");
		sc.close();
	}

}
