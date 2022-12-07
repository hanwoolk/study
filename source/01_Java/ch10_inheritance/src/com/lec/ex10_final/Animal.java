package com.lec.ex10_final;

public class Animal {
	protected int speed;
	public void running() {
		speed += 5; //동물에따라 숫자를 달리할거라 final 안씀
		System.out.println("동물이 뛰고있어요. 현재 속도 : " + speed);
	}
	public final void stop() { // stop() 메소드는 override 금지
		speed = 0;
		System.out.println("멈춤");
	}
}
