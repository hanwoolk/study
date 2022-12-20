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
				System.out.println("회원가입을 하시겠습니까? (가입 : Y / 종료 : N");
				if(scanner.next().trim().equalsIgnoreCase("n")) break;
				System.out.println("이름을 입력하세요 : ");
				name = scanner.next();
				System.out.println("전화번호를 입력하세요 : ");
				tel = scanner.next();
				System.out.println("생일을 입력하세요(ex 1995-12-12) : ");
				String birthday = scanner.next();
				System.out.println("주소를 입력하세요 : ");
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
