package com.lec.quiz;
// Friend 클래스형 ArrayList에 친구들 주소 저장,

// 스캐너 x로 종료 , 앞 두글자로 주소 검색, 존재하지 않을경우 메세지

import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Scanner;

public class Test {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		ArrayList<Friend> friends = new ArrayList<Friend>();
		friends.add(new Friend("홍길동", "서울시 용산구", "010-9999-1234",
				new Date(new GregorianCalendar(1990, 4, 22).getTimeInMillis())));
		friends.add(new Friend("신길동", "서울시 마포구", "010-9999-9999",
				new Date(new GregorianCalendar(1990, 5, 5).getTimeInMillis())));
		friends.add(new Friend("마길동", "안양시 동안구", "010-7777-9999",
				new Date(new GregorianCalendar(1990, 2, 2).getTimeInMillis())));
		friends.add(new Friend("박길동", "안양시 만안구", "010-6666-0986",
				new Date(new GregorianCalendar(1990, 6, 6).getTimeInMillis())));
		while (true) {
			boolean searchOk = false;
			System.out.println("검색할 주소 앞 글자 2자리 (단, 종료를 원하시면 x를 입력하시오) : ");
			String searchAdd = scanner.next();
			if (searchAdd.trim().equalsIgnoreCase("x"))
				break;
			for (Friend friend : friends) {
				String address = friend.getAddress();
				String key = address.substring(0,2);
				if (searchAdd.equals(key)) {
					System.out.println(friend);
					searchOk = true;
				}
			}
			if (!searchOk) {
				System.out.println("해당 지역의 친구는 없습니다\n");
			}
		}
		scanner.close();
	}
}