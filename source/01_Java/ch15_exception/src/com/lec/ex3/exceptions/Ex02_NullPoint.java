package com.lec.ex3.exceptions;

import java.util.Date;
import java.util.GregorianCalendar;

public class Ex02_NullPoint {
	public static void main(String[] args) {
		Friend hong = new Friend("È«±æµ¿", "010-9999-9999", new Date(new GregorianCalendar(1996,1-1,1).getTimeInMillis()));
		System.out.println(hong);
		Friend kim = new Friend("±è±æµ¿", "010-8888-8888");
		System.out.println(kim);
				
	}
}
