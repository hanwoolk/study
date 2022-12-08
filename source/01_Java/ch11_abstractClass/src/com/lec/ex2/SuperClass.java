package com.lec.ex2;
//method1(추상), method2, method3(일반)
public abstract class SuperClass {
	public abstract void method1(); //추상 메소드
	public void method2() { //일반 메소드
		System.out.println("SuperClass의 method2");
	}
	public void method3() {
		System.out.println("SuperClass의 method3");
	}
}
