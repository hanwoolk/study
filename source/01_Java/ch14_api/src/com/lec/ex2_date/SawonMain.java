package com.lec.ex2_date;

public class SawonMain {
	public static void main(String[] args) {
		Sawon[] sawons = {  new Sawon("a01", "ȫ�浿", Sawon.PLANNING),
							new Sawon("a02", "�ű浿", Sawon.ACCOUNTING, 2022,12,14), 
							new Sawon("b01", "��浿", Sawon.COMPUTER, 2022,12,14) };
//		for(int i=0 ; i<sawons.length ; i++) {
//			System.out.println(sawons[i]);
//		}
//		
		for(Sawon sawon : sawons) {
			System.out.println(sawon);
		}
	}
}