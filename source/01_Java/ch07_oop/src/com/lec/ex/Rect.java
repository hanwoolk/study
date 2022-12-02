package com.lec.ex;

// 클래스 : 속성, (생성자, jvm이 기본으로 만들어주긴함) 메소드, setter&getter
public class Rect {
	private int width;
	private int height;
	// 생성자가 없을 경우 JVM이 자동으로 생성
	public Rect() {} //디폴트 생성자
	public Rect(int square) {
		width = square;
		height = square;
	}
	public Rect(int width, int height) { // 매개변수 2개짜리 생성자 함수, 생성자 함수를 통해 정보를 초기화
		this.width = width;
		this.height = height;
	}
	public int area() {
		return width * height;
	}

	// getter & setter
	public int getWidth() {
		return width;
	}
	public int getHeight() {
		return height;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public void setHeight(int height) {
		this.height = height;
	}
}
