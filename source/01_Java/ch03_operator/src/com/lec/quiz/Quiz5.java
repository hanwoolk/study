package com.lec.quiz;
//국어, 영어, 수학 점수를 사용자에게 입력받아, 각 점수를 출력하고 총점, 평균(소수점2자리까지) 출력하는 프로그램을 구현 하시오
import java.util.Scanner;
public class Quiz5 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("국어 점수를 입력해주세요 : " );
		int kor = sc.nextInt();
		System.out.print("영어 점수를 입력해주세요 : " );
		int eng = sc.nextInt();
		System.out.print("수학 점수를 입력해주세요 : " );
		int mat = sc.nextInt();
		System.out.println("국어 점수 : " + kor + '점' + "\t영어 점수 : " + eng + '점' + "\t수학 점수 : " + mat);
		int tot = (kor + eng + mat);
		double avg = (tot/3.0);
		System.out.printf("총점 : %d 점 \t 평균 : %.2f점",tot ,avg);
		sc.close();
	}
}
