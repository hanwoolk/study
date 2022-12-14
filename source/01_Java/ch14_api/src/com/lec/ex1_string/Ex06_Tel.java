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
		Scanner scanner = new Scanner(System.in);
		while (true) {
			System.out.println("전화번호를 입력하세요. (종료 :x)");
			tel = scanner.next();
			String[] arr = new String[tel.length()];
			if (tel.equalsIgnoreCase("x")) {
				break;
			}
			System.out.println("입력한 전화번호 : " + tel);
			System.out.print("짝수번째 문자열  :");
			for (int idx = 0; idx < tel.length(); idx++) {
					if(idx%2==0) {
						System.out.print(tel.charAt(idx) + " ");
					}
//					if(idx%2==0) {
//						System.out.print(tel.charAt(idx));
//					}else {
//						System.out.print(" ");
//					}
////				System.out.print(" " + tel.charAt(idx));
////				idx += 1;
			} // 짝수 for
			System.out.println();
			System.out.print("번호를 거꾸로 :");
			for (int idx = tel.length() - 1; 0 <= idx; idx--) {
				System.out.print(tel.charAt(idx));
			} // 거꾸로 for
			System.out.println("전화번호 맨 앞자리 :" + tel.substring(0, tel.indexOf('-'))); // 수정 필요 - 앞까지
			System.out.println("전화번호 맨 뒷자리 :" + tel.substring(tel.lastIndexOf('-')+1)); // 수정 필요 다시 -뒤까지
			System.out.println();
		}
		scanner.close();
		System.out.println("종료");
	}
}