package com.lec.ex2_date;

public class SawonMain2 {
	public static void main(String[] args) {
		Sawon2[] sawons = {  new Sawon2("a01", "È«±æµ¿", Dept.PLANNING),
							new Sawon2("a02", "½Å±æµ¿", Dept.ACCOUNTING, 2022,12,14), 
							new Sawon2("b01", "±è±æµ¿", Dept.COMPUTER, 2022,12,14) };
//		for(int i=0 ; i<sawons.length ; i++) {
//			System.out.println(sawons[i]);
//		}
//		
		for(Sawon2 sawon : sawons) {
			System.out.println(sawon);
		}
	}
}