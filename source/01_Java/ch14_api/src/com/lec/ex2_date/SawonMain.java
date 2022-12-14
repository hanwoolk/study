package com.lec.ex2_date;

public class SawonMain {
	public static void main(String[] args) {
		Sawon[] sawons = {  new Sawon("a01", "È«±æµ¿", Sawon.PLANNING),
							new Sawon("a02", "½Å±æµ¿", Sawon.ACCOUNTING, 2022,12,14), 
							new Sawon("b01", "±è±æµ¿", Sawon.COMPUTER, 2022,12,14) };
//		for(int i=0 ; i<sawons.length ; i++) {
//			System.out.println(sawons[i]);
//		}
//		
		for(Sawon sawon : sawons) {
			System.out.println(sawon);
		}
	}
}