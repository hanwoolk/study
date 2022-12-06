package com.lec.ex1_student;

public class StudentMain {
	public static void main(String[] args) {
		Student s1 = new Student("정우성", 90, 90, 90);
		Student s2 = new Student("김하늘", 90, 90, 91);
		Student s3 = new Student("황정민", 80, 80, 90);
		Student s4 = new Student("강동원", 80, 90, 90);
		Student s5 = new Student("유아인", 70, 70, 90);
		Student[] students = { s1, s2, s3, s4, s5 };
		String[] title = { "이름", "국어", "영어", "수학", "총점", "평균" };
//		int korTot = 0;
//		int engTot = 0;
//		int matTot = 0;
//		int titTit = 0;
//		int avgTot = 0;
		int[] total = new int [5]; // 0번 idx : 국어 누적, 1번 idx : 영어누적...4번 idx : 평균 누적
		line();
		System.out.println("\n\t\t\t       성적표");
		line('-');
		for(String t : title) {
			System.out.print("\t" + t);
		}
		System.out.println(); //개행
		line('-');
		for(Student student : students) {
			System.out.println(student.infoString());
			//student.infoString();
			// 총점변수(국,영,수,총,평) 누적
			total[0] += student.getKor(); //국어점수 누적
			total[1] += student.getEng();
			total[2] += student.getMat();
			total[3] += student.getTot();
//			total[4] = total[4] + student.getAvg(); // 8byte가 4byte에 들어가지 않아 평균 누적 에러
			total[4] += student.getAvg(); //위와 같지만 4byte로 전환되어 평균 누적
		}
		line('-');
		System.out.print("\t총점");
		for(int t : total) {
			System.out.print("\t" + t);
		}
		System.out.print("\n\t평균");
		for(int t : total) {
//			System.out.print("\t" + t/5.0);
			System.out.printf("\t%.1f",(double)t/students.length);
		}
		System.out.println();
		line();
	}

	private static void line(char c) {
		System.out.print("\t");
		for (int i = 0; i < 44; i++) {
			System.out.print('-');
		}
		System.out.println();
	}

	private static void line() {
		for (int i = 0; i < 60; i++)
			System.out.print("■");
	}
}
