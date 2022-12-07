package com.lec.ex02_protected.copy;
// private i,j / public setI(), getI(), setJ(), getJ()
public class Child extends SuperIJ{
	private int total;
	public Child() {
		System.out.println("�Ű����� ���� Child ������ �Լ�");
	}
	public Child(int i, int j) { // super�� �̿��Ͽ� ����
		super(i,j);
		System.out.println("�Ű����� �ִ� child ������ �Լ� - i, j �ʱ�ȭ");
//		setI(i);//this.i = i; �θ� private�̶� access �Ұ�, setter�� ���� ����
//		setJ(j);//this.j = j; �θ� protected�� �ٲ�� ���� ��Ű���� �ƴϴ��� ��ӹ޾� access ����.
	}
	public void sum() {
		//total = getI() + getJ(); 
		total = i + j;; //�θ� protected�� �ٲ�� ���� ��Ű���� �ƴϴ��� ��ӹ޾� access ����.
		System.out.println("i = " + getI() + ", j = " + getJ() + ", total = " + total);
	}
}
