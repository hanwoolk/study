package com.lec.ex5_scanner;

import java.util.ArrayList;
import java.util.Scanner;

public class Ex01_nextLine {
	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		System.out.print("나이 : ");
		int age = sc.nextInt();
		System.out.println("입력한 나이는 " + age + "살");
		System.out.print("이름 : ");
		String name = sc.next();
		System.out.println("입력한 이름은 " +name);
		System.out.print("주소 : ");
		sc.nextLine(); // 버퍼에 남은 "\n"을 지우기
		String address = sc.nextLine(); //"\n"앞의 값을 retun하고 "\n" 뒤는 지워짐
		System.out.println("입력한 주소는 " + address);
		System.out.println("끝");
		sc.close();
	}
}
