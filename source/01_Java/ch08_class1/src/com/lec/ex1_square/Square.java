package com.lec.ex1_square;

// 속성, 생성자, 메소드, [getter&setter](필요시)
// Square s = new Square(); // s의 side는 0으로 초기화
// Square s1= new Square(10); // s의 side를 10으로 초기화하면서 객체 생성
public class Square {
	private int side; // 인터페이스 아닌 이상 대부분의 데이터는 private
	public Square() { // 생성자 함수 : return type이 없고 클래스명과 같은 함수
		System.out.println("매개변수 없는 생성자 함수 호출");
	}

	public Square(int side) { // 매개변수가 있는 생성자 함수 용도 : 데이터의 초기화
		this.side = side;
		System.out.println("매개변수 있는 생성자 함수 호출");
	}
	public int area () {
		return side*side;
	}
	// setter
	// setter : s1.setSide(5);
	public void setSide(int side) {
		this.side = side;
	}
	// getter : sysout("s1.getSide()
	public int getSide () {
		return side;
	}
}
