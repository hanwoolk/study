package com.lec.ex1_store;
// 1ȣ�� : �δ�� 5,000 ���뱹-���Ⱦ�
public class Store1 extends HeadQuarterStore {

	public Store1(String storeName) {
		super(storeName);
	}
	@Override
	public void bude() {
		System.out.println("�δ�� : 5,000��");
	}
	@Override
	public void sunde() {
		System.out.println("���뱹 ���Ⱦ�");
	}
	@Override
	public void kimchi() {
		System.out.println("��ġ� : 4,500��");
		
	}
	@Override
	public void bibim() {
		System.out.println("����� : 6,000��");
		
	}
	@Override
	public void gongibab() {
		System.out.println("����� : 1,000��");
	}
}
