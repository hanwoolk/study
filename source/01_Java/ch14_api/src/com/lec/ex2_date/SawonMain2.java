package com.lec.ex2_date;

public class SawonMain2 {
	public static void main(String[] args) {
		Sawon2[] sawons = {  new Sawon2("a01", "ȫ�浿", Dept.PLANNING),
							new Sawon2("a02", "�ű浿", Dept.ACCOUNTING, 2022,12,14), 
							new Sawon2("b01", "��浿", Dept.COMPUTER, 2022,12,14) };
//		for(int i=0 ; i<sawons.length ; i++) {
//			System.out.println(sawons[i]);
//		}
//		
		for(Sawon2 sawon : sawons) {
			System.out.println(sawon);
		}
	}
}