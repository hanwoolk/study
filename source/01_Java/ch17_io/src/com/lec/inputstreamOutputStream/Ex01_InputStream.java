package com.lec.inputstreamOutputStream;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

// (1) ������ ����(��Ʈ�� ��ü ����) (2) ������ �д´�(read�޼ҵ� ���) (3)������ �ݴ´�(close�޼ҵ� ���)
public class Ex01_InputStream {
	public static void main(String[] args) {
		InputStream is = null;
		try {
			is = new FileInputStream("txtFile/inTest.txt"); // 1. ������ ����
			// 2. �����͸� �д´� (���� ������ 1byte�� �ݺ������� �д´�)
			while(true) {
				int i = is.read(); // 1byte�� �б�
				if(i == -1) break; // ������ ���̸� break;
				System.out.print((char)i + "(" + i + ")"); // �ƽ�Ű�ڵ带 char�� ����ȯ
			}
			System.out.println("\nDONE");
		} catch (FileNotFoundException e) {
			System.out.println("���ܸ޼��� : ���� �� ã��" + e.getMessage());
		} catch (IOException e) {
			System.out.println("���ܸ޼��� : ������" + e.getMessage());
		} finally {
			//3. ������ �ݴ´�
			try {
				if(is!=null) is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}// try-catch-finally
	}//main
}
