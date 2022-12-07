package com.lec.ex07_this;
// this.~ : 내 객체의 ~
// this() : 현 클래스의 생성자 함수
public class Friend {
	private String name;
	private String tel;
	public Friend() {
		System.out.println("매개변수 없는 생성자");
	}
	public Friend(String name) {
		this(); // == Friend() //this()나 super()는 메소드의 첫번째 라인에 적어야함
		this.name = name;
		System.out.println("매개변수 하나인 생성자");
	}
	public Friend(String name, String tel ) {
		this(name); // == Friend(name)
		this.tel = tel;
		System.out.println("매개변수 두개인 생성자");
	}
	public String infoString() {
		return name + " : " + tel;
	}
}
