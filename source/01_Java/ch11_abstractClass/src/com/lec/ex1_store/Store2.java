package com.lec.ex1_store;

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
	@Override
	public void kimchi() {
		System.out.println("��ġ� : 5,000��");
		
	}
	@Override
	public void sunde() {
		System.out.println("���뱹 : 5,000��");
		
	}
}
