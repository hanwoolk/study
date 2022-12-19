package com.lec.ex3_set;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;

public class HashMapTestMain {
	public static void main(String[] args) {
		HashMap<String, Customer> cusList = new HashMap<String, Customer>();
//		ArrayList<String> cusList = new ArrayList<>();
		Scanner sc = new Scanner(System.in);
		String yesNo, tel;
		do {
			System.out.println("회원가입을 하시겠습니까? Y/N");
			yesNo = sc.next().trim();
			if (yesNo.equalsIgnoreCase("y")) {
				Customer newCustomer = new Customer();
				System.out.print("가입하실 회원님 이름은?");
				newCustomer.setName(sc.next());
				System.out.print("가입하실 회원님 전화는?");
				tel = sc.next();
				// 기존에 가입한 전화번호인지 확인하는 방법
				if(cusList.get(tel)!=null) {
					System.out.println("이미 가입되어 있는 전화번호입니다. 전호번호는 중복하여 가입 불가합니다");
					continue;
				}
				newCustomer.setTel(tel);
				System.out.print("가입하실 회원님 주소는?");
				sc.nextLine();// 버퍼지우는 용도
				newCustomer.setAddress(sc.nextLine());
				cusList.put(tel, newCustomer);
//				System.out.println("이름을 입력하세요.");
//				String name = sc.next();
//				System.out.println("전화번호를 입력하세요.");
//				String tel = sc.next();
//				System.out.println("주소를 입력하세요");
//				sc.nextLine();
//				String address = sc.nextLine();
//				cusList.put(tel, new Customer(name, tel, address));
				System.out.println("종료 및 정보 확인: Y \n추가 가입 : N");
				yesNo = sc.next().trim();
			} else if (yesNo.equalsIgnoreCase("n")) {
				break;
			} else {
				System.out.println("잘못 입력하셨습니다.");
			}
		} while (!yesNo.equalsIgnoreCase("y"));
		if (cusList.size() > 0) {
			Iterator<String> iterator = cusList.keySet().iterator(); // 반복자
			while (iterator.hasNext()) {
				String key = iterator.next();
				System.out.println(cusList.get(key));
			}
		} else {
			System.out.println("가입한 회원 목록이 없습니다.");
		}
		sc.close();
	}
}
