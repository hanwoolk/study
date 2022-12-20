package com.lec.ex1_inputstreamOutputStream;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

// D:/KHW/material/bts.mp4 => D:/KHW/material/bts_copy.mp4 (8,075,033 byte)
public class Ex05_FileCopyStep1 {
	public static void main(String[] args) {
		long start = System.currentTimeMillis(); // 1970.1.1부터 시작 시점까지의 밀리세컨
		InputStream is = null;
		OutputStream os = null;
		try {
			is = new FileInputStream("d:\\KHW\\material\\bts.mp4"); // 1. 스트림 객체 생성
			os = new FileOutputStream("d:/KHW/material/bts_copy.mp4");
			int cnt = 0;
			while (true) { // 8,075,033 번 수행
				cnt++;
				int i = is.read(); // 2. read &write
				if (i == -1)
					break;
				os.write(i);
				if (cnt % 100000 == 0) {
					System.out.println(cnt + "/8,075,033 : " + (int) (cnt / 8075033.0 * 100) + "% 완성");
				}
			}
			System.out.println(cnt + "번 while문 실행하여 복사 성공");
		} catch (FileNotFoundException e) {
			System.out.println("파일 또는 폴더 못 찾음" + e.getMessage());
		} catch (IOException e) {
			System.out.println("read & write 오류 : " + e.getMessage());
		} finally {
			try {
				if (os != null)
					os.close(); // 3. 파일 닫기(스트림 해제)
				if (is != null)
					os.close(); // 스트림 만든 순서의 반대로 닫는게 일반적
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}//try-catch-finally
		long end = System.currentTimeMillis(); // 1970.1.1 ~ 끝나는 시점까지의 밀리세컨
		System.out.println((end-start)/1000+"초 걸림");
	}//main
}
