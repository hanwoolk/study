package com.lec.quiz;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Scanner;
import java.util.StringTokenizer;

public class MemberTestMain_outputStream {
	public static void main(String[] args) {
		ArrayList<Member> members = new ArrayList<Member>();
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		String today = sdf.format(now); // "12-20"
		Scanner scanner = new Scanner(System.in);
		String name, tel, birthStr, address;
		Date birthday = null;
		OutputStream os = null;
		try {
			os = new FileOutputStream("d:/KHW/source/01_Java/ch17_io/src/com/lec/quiz/members.txt", true);
			while (true) {
				System.out.println("ȸ�������� �Ͻðڽ��ϱ�? (���� : Y / ���� : N)");
				String yesNo = scanner.next().trim();
				if (yesNo.equalsIgnoreCase("y")) {
					System.out.println("�̸��� �Է��ϼ��� : ");
					name = scanner.next();
					System.out.println("��ȭ��ȣ�� �Է��ϼ��� : ");
					tel = scanner.next();
					System.out.println("������ �Է��ϼ���(ex 1995-12-12) : ");
					birthStr = scanner.next();
					StringTokenizer birthToken = new StringTokenizer(birthStr, "-");
					String[] arr = new String[birthToken.countTokens()];
					int idx = 0;
					while (birthToken.hasMoreTokens()) {
						arr[idx++] = birthToken.nextToken();
					}
					int year = Integer.parseInt(arr[0]);
					int month = Integer.parseInt(arr[1]);
					int date = Integer.parseInt(arr[2]);
					birthday = new Date(new GregorianCalendar(year, month - 1, date).getTimeInMillis());
					if (today.equals(sdf.format(birthday))) {
						System.out.println("���������մϴ�.");
					}
					System.out.println("�ּҸ� �Է��ϼ��� : ");
					scanner.nextLine();
					address = scanner.nextLine();

					members.add(new Member(name, tel, birthday, address));

				} else if (!yesNo.equalsIgnoreCase("n")) {
					System.out.println("�߸� �Է��ϼ̽��ϴ�.");
				} else {
					for (Member per : members) {
						System.out.println(per);
					}
					System.out.print("\t\t      .....����" + members.size() + "�� ����");
					break;
				} // if
			} // while
			for(Member memberData : members) {
				
				String msg = (memberData.aaa() + "\n");
				byte[] Data = msg.getBytes();
				os.write(Data);
			}
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (os != null)
					os.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		scanner.close();
	}// main
}// class
