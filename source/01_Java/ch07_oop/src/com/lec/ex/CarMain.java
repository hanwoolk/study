package com.lec.ex;


public class CarMain {
	public static void main(String[] args) {
		Car myPorche = new Car(); // 기본적으로는 0이 들어가있음
		myPorche.setColor("빨강"); //myPorche.color = "빨강";
		System.out.println(myPorche.getColor() + "색 차량 배기량: " +myPorche.getCc());
		myPorche.drive();
		myPorche.park();
		myPorche.race();
		Car yourPorche = new Car();
		yourPorche.setColor("진회색");
		yourPorche.drive();
		System.out.println("내차 속도 : " + myPorche.getSpeed());
	}
}
