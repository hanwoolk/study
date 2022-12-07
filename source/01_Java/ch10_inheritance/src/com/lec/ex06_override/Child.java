package com.lec.ex06_override;
// method1(), method2()
public class Child extends Parent {
	public Child() { // overloading = 함수의 중복정의
		System.out.println("매개변수 없는 Child 생성자");
	}
	public Child(int i) {
		System.out.println("매개변수 있는 Child 생성자");
	}
	@Override
	public void method1() { // override = 함수의 재정의
		System.out.println("Child의 method1()");
	}
	public void method3() {
		System.out.println("Child의 method3()");
	}
	@Override //@ : 어노테이션 : 바로 다음줄이 이것이다 라고 설명 , override : 제한자, return타입 같아야함
	public boolean equals(Object obj) {
		return true;
	}
}
