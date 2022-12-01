package com.lec.conditionQuiz;

import java.util.Scanner;

//컴퓨터와 가위바위보 게임을 하는 프로그램을 구현하시오. 
//단, 사용자는 가위를 내고자 할 때는 0을 입력하고 바위를 선택하고자 할 때는 1을 입력하고, 보를 선택하고자 할 때는 2를 입력하여 게임을 진행합니다
public class Quiz4 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("가위(0), 바위(1), 보(2)중 하나를 선택하세요 : ");
		int you = sc.nextInt();
		int com = (int) (Math.random() * 3);
		if ((you + 2) % 3 == com) {
			System.out.println("컴퓨터 : " + com + "\tyou win");
		} else if ((you + 1) % 3 == com) {
			System.out.println("컴퓨터 : " + com + "\tcom win");
		} else if ((you + 1) % 3 == com) {
			System.out.println("컴퓨터 : " + com + "\tcom win");
		} else if (you == com) {
			System.out.println("컴퓨터 : " + com + "\t비김");
		} else if(0<you || you>=3) {
			System.out.println("유효하지 않은 숫자입니다");
		}
		
		sc.close();
	}
}
