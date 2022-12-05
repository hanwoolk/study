package com.lec.ex;

public class RectMain { // class명 반드시 대문자로 시작, 알파벳,숫자,_,$ 이지만 $는 오라클사에서만, _는 되도록 x
	public static void main(String[] args) {
		Rect r1 = new Rect(10,5);
		Rect r2 = new Rect();
		Rect r3 = new Rect(7);
		// 가로 세로 길이
		System.out.printf("r1의 데이터 : %d %d\n", r1.getWidth(), r1.getHeight());
		System.out.printf("r2의 데이터 : %d %d\n", r2.getWidth(), r2.getHeight());
		System.out.printf("r3의 데이터 : %d %d\n", r3.getWidth(), r3.getHeight());
		//r1.setWidth(10); r1.setHeight(5);
		//System.out.printf("r1의 데이터 변경후: %d %d\n", r1.getWidth(), r1.getHeight());
		//System.out.printf("r2의 데이터 : %d %d\n", r2.getWidth(), r2.getHeight());
		System.out.println("r1의 넓이 : " + r1.area());
		System.out.println("r2의 넓이 : " + r2.area());
		System.out.println("r3의 넓이 : " + r3.area());
	}
}
