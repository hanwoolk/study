package com.lec.quiz;

public class StudentMain {
	public static void main(String[] args) {
		Student s1 = new Student("���켺", 90, 80, 95);
		Student s2 = new Student("���ϴ�", 100, 80, 95);
		Student s3 = new Student("Ȳ����", 95, 80, 90);
		Student s4 = new Student("������", 95, 90, 99);
		Student s5 = new Student("������", 90, 90, 90);
		Student[] students = { s1, s2, s3, s4, s5 };
		String[] title = { "��ȣ", "�̸�", "����", "����", "����", "����", "���" };
		int[] total = new int[5];
		line();
		System.out.println("\n\t\t\t\t����ǥ");
		line('-');
		for (String t : title) {
			System.out.print("\t" + t);
		}
		System.out.println(); // ����
		line('-');
		for (Student student : students) {
			System.out.println(student.infoString());
			total[0] += student.getKor();
			total[1] += student.getEng();
			total[2] += student.getMat();
			total[3] += student.getTot();
			total[4] += student.getAvg();
//			s1.infoString();
		}
		line('-');
		System.out.print("\t\t����");
		for (int t : total) {
			System.out.print("\t" + t);
		}
		System.out.print("\n\t\t���");
		for (int t : total) {
			System.out.printf("\t%d", t / students.length);
		}
		System.out.println();
		line();
	}

	private static void line(char c) {
		System.out.print("\t");
		for (int i = 0; i < 51; i++) {
			System.out.print('-');
		}
		System.out.println();
	}

	private static void line() {
		for (int i = 0; i < 67; i++)
			System.out.print("��");
	}
}