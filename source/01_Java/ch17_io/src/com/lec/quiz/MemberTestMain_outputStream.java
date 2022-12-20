package com.lec.quiz;

import java.io.DataOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Scanner;

public class MemberTestMain_outputStream {
	public static void main(String[] args) {
		ArrayList<Member> members = new ArrayList<Member>();
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		String today = sdf.format(now); //"12-20"
		Scanner scanner = new Scanner(System.in);
		String name, tel, birthStr, address;
		OutputStream fos = null;
		DataOutputStream dos = null;
		try {
			fos = new FileOutputStream("D:\\KHW\\source\\01_Java\\ch17_io\\src\\com\\lec\\quiz");
			dos = new DataOutputStream(fos);
			while(true) {
				System.out.println("ȸ�������� �Ͻðڽ��ϱ�? (���� : Y / ���� : N");
				if(scanner.next().trim().equalsIgnoreCase("n")) break;
				System.out.println("�̸��� �Է��ϼ��� : ");
				name = scanner.next();
				System.out.println("��ȭ��ȣ�� �Է��ϼ��� : ");
				tel = scanner.next();
				System.out.println("������ �Է��ϼ���(ex 1995-12-12) : ");
				String birthday = scanner.next();
				System.out.println("�ּҸ� �Է��ϼ��� : ");
				scanner.next();
				address = scanner.nextLine();
				members.add(new Member(name, tel, birthday, address));
			}
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(dos!=null) dos.close();
				if(fos!=null) fos.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
