package com.lec.ex11_store;

public class Store2 extends HeadQuarterStore {

	public Store2(String storeName) {
		super(storeName);
	}
	@Override //�Ƚᵵ �۵� ,@�� ��ǻ�Ϳ� �ּ�
	public void bude() {
		System.out.println("�δ�� : 5,000��");
	}
	@Override
	public void bibim() {
		System.out.println("����� : 5,000��");
	}
	@Override
	public void gongibab() {
		System.out.println("����� : ����");
	}
}
