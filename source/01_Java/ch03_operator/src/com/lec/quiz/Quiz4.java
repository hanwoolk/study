package com.lec.quiz;
//나이를 입력받아 입력받은 나이가 65세 이상일 때, “경로우대” 출력, 아니면 “일반”출력
import java.util.Scanner;
public class Quiz4 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("나이를 입력해주세요 : ");
		int su = sc.nextInt();
		System.out.println((su >= 65) ? "경로우대" : ((su>=0)? "일반" : "오류"));
		sc.close();
	}
}
