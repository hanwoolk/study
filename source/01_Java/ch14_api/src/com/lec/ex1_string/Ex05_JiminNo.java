package com.lec.ex1_string;

import java.util.Scanner;

public class Ex05_JiminNo {
	public static void main(String[] args) {
		String jmNo;
		Scanner scanner = new Scanner(System.in);
		System.out.println("주민번호를 입력하세요 : ");
		jmNo = scanner.next();
		
		// 방법1 char 추출
		char gender = jmNo.charAt(7); // '2'
		if (gender == '1' || gender == '3') {
			System.out.println("남성");
		} else if (gender == '2' || gender == '4') {
			System.out.println("여성");
		} else {
			System.out.println("유효하지 않은 주민번호입니다.");
		}
		
		// 방법2 String추출
		String genderStr = jmNo.substring(7,8); // "2"
		if(genderStr.equals("1") || genderStr.equals("3")) {
			System.out.println("남성");
		}else if (genderStr.equals("2") || genderStr.equals("4")) {
			System.out.println("여성");
		}else {
			System.out.println("유효하지 않은 주민번호입니다.");
		}
		
		//방법3. genderStr을 정수로 전환
		int genderInt = Integer.parseInt(genderStr); //정수 스트링을 정수로 ("2"을 2로)
		if(genderInt==1 || genderInt==3) {
			System.out.println("남성");
			
		}else if(genderInt==2 || genderInt==4) {
			System.out.println("여성");
		}else {
			System.out.println("유효하지 않은 주민번호입니다.");
		}
	}
}
