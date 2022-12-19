package com.lec.ex3_set;

import java.util.ArrayList;
import java.util.Scanner;

public class ArrayListTestMain {
	public static void main(String[] args) {
		ArrayList<Customer> cusList = new ArrayList<>();
		Scanner sc = new Scanner(System.in);
		String yesNo;
		do {
			System.out.println("회원가입을 하시겠습니까? Y/N");
			yesNo = sc.next().trim();
			if (yesNo.equalsIgnoreCase("y")) {
				System.out.println("이름을 입력하세요.");
				String name = sc.next();
				System.out.println("전화번호를 입력하세요.");
				String tel = sc.next();
				System.out.println("주소를 입력하세요");
				sc.nextLine();
				String address = sc.nextLine();
				cusList.add(new Customer(name, tel, address));
				System.out.println("종료 및 정보 확인: Y \n추가 가입 : N");
				yesNo = sc.next().trim();
			} else if (yesNo.equalsIgnoreCase("n")) {
				break;
			} else {
				System.out.println("잘못 입력하셨습니다.");
			}
		} while (!yesNo.equalsIgnoreCase("y"));
		if (cusList.size() > 0) {
			for (int i = 0; i < cusList.size(); i++)
				System.out.println(cusList.get(i));
		} else {
			System.out.println("가입한 회원 목록이 없습니다.");
		}
		sc.close();
	}
}
