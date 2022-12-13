package com.lec.ex1_string;

import java.util.Scanner;

/*
String tel;
while(){
  // 번호(031-234-5678)입력 하면 (sc.next())
	"입력한 전화번호 : 031-234-5678
	 짝수번째 문자열  : 0 1 2 4 5 7
	문자를 꺼꾸로    : 8765-432-130
	전화번호 맨앞자리는: 031
	전화번호 뒷자리는: 5678"을 sysout
  // x(X)를 입력하면 프로그램 끝
}

 */
public class Ex06_Tel {
	public static void main(String[] args) {
		String tel;
		int jjak;
		String reverse;
		String front;
		String back;
		Scanner scanner = new Scanner(System.in);
		while (true) {
			System.out.println("전화번호를 입력하세요. (종료 :x)");
			tel = scanner.next();
			String[] arr = new String[tel.length()];
			System.out.println("전화번호는 : " + tel);
			for (int idx = 1; 0 < tel.length(); idx++) {
				System.out.println(arr[idx]);
				
			}
			for(int idx = tel.length() ; 0<= idx && idx < tel.length() ; idx--)
				System.out.println(arr[idx]);
			if(tel.equalsIgnoreCase("x"))
				break;
		}
	}
}