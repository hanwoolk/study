package com.lec.ex1_store;

public class Store2 extends HeadQuarterStore {

	public Store2(String storeName) {
		super(storeName);
	}
	@Override //안써도 작동 ,@는 컴퓨터용 주석
	public void bude() {
		System.out.println("부대찌개 : 5,000원");
	}
	@Override
	public void bibim() {
		System.out.println("비빔밥 : 5,000원");
	}
	@Override
	public void gongibab() {
		System.out.println("공기밥 : 무료");
	}
	@Override
	public void kimchi() {
		System.out.println("김치찌개 : 5,000원");
		
	}
	@Override
	public void sunde() {
		System.out.println("순대국 : 5,000원");
		
	}
}
