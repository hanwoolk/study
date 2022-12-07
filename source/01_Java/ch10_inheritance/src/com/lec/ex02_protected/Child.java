package com.lec.ex02_protected;
// private i,j / public setI(), getI(), setJ(), getJ()
public class Child extends SuperIJ{
	private int total;
	public Child() {
		System.out.println("매개변수 없는 Child 생성자 함수");
	}
	public Child(int i, int j) {
		System.out.println("매개변수 있는 child 생성자 함수 - i, j 초기화");
		setI(i);//this.i = i; 부모가 private이라 access 불가, setter로 접근 가능
		setJ(j);//this.j = j; 부모가 protected로 바뀌어 같은 패키지가 아니더라도 상속받아 access 가능.
	}
	public void sum() {
		//total = getI() + getJ(); 
		total = i + j;; //부모가 protected로 바뀌어 같은 패키지가 아니더라도 상속받아 access 가능.
		System.out.println("i = " + getI() + ", j = " + getJ() + ", total = " + total);
	}
}
