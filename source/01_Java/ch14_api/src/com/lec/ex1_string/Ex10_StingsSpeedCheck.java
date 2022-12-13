package com.lec.ex1_string;

public class Ex10_StingsSpeedCheck {
	public static void main(String[] args) {
		// System.out.println("1970.1.1부터 현재까지의 밀리세컨 : " + System.currentTimeMillis());
		String str = "a";
		long start = System.currentTimeMillis(); // 시작 시점의 밀리세컨
		// String 변수 10만번 변경하기
		for (int i = 0; i < 100000; i++)
			;
		{
			str.concat("b");
		}
		long end = System.currentTimeMillis(); // 킅난 시점의 밀리세컨
		System.out.println("스트링 10만번 변경 경과 시간 : " + (end - start));
		StringBuffer strBuf = new StringBuffer("a");
		start = System.currentTimeMillis(); // 시작시점 밀리세컨
		for (int i = 0; i < 100000; i++) {
			strBuf.append("b");
		}
		end = System.currentTimeMillis(); // 시작시점 밀리세컨
		System.out.println("스트링 버퍼 10만번 변경 경과 시간 : " + (end - start));
		StringBuilder strBui = new StringBuilder("a");
		start = System.currentTimeMillis(); // 시작시점 밀리세컨
		for (int i = 0; i < 100000; i++) {
			strBui.append("b");
		}
		end = System.currentTimeMillis(); // 시작시점 밀리세컨
		System.out.println("스트링 빌더 10만번 변경 경과 시간 : " + (end - start));
	}

}
