package com.lec.ex1_string;

import java.util.Scanner;

public class Ex05_JiminNo {
	public static void main(String[] args) {
		String jmNo;
		Scanner scanner = new Scanner(System.in);
		System.out.println("�ֹι�ȣ�� �Է��ϼ��� : ");
		jmNo = scanner.next();
		
		// ���1 char ����
		char gender = jmNo.charAt(7); // '2'
		if (gender == '1' || gender == '3') {
			System.out.println("����");
		} else if (gender == '2' || gender == '4') {
			System.out.println("����");
		} else {
			System.out.println("��ȿ���� ���� �ֹι�ȣ�Դϴ�.");
		}
		
		// ���2 String����
		String genderStr = jmNo.substring(7,8); // "2"
		if(genderStr.equals("1") || genderStr.equals("3")) {
			System.out.println("����");
		}else if (genderStr.equals("2") || genderStr.equals("4")) {
			System.out.println("����");
		}else {
			System.out.println("��ȿ���� ���� �ֹι�ȣ�Դϴ�.");
		}
		
		//���3. genderStr�� ������ ��ȯ
		int genderInt = Integer.parseInt(genderStr); //���� ��Ʈ���� ������ ("2"�� 2��)
		if(genderInt==1 || genderInt==3) {
			System.out.println("����");
			
		}else if(genderInt==2 || genderInt==4) {
			System.out.println("����");
		}else {
			System.out.println("��ȿ���� ���� �ֹι�ȣ�Դϴ�.");
		}
	}
}
