package com.lec.ex2_date;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

//데이터 : 사번, 이름, 부서(COMPUTER, PLANNING, DESIGN, ACCOUNTING, HUMANRESOURCES), 입사일.
//생성자 : 사번, 이름, 부서, 입사일은 객체생성 당일로 합니다

public class Sawon2 {
	private String sawonNo;
	private String name;
	private Dept part;
	private Date date;
	public Sawon2(String sawonNo, String name, Dept part, int year, int month, int day) {
	this.sawonNo = sawonNo;
	this.name = name;
	this.part = part;
	date = new Date(new GregorianCalendar(year, month-1, day).getTimeInMillis());
}
		
	public Sawon2(String sawonNo, String name, Dept part) {
		this.sawonNo = sawonNo;
		this.name = name;
		this.part = part;
		date = new Date();
		
	}
	@Override
	public String toString() {	// [사번]a01	[이름]홍길동	[부서]PLANNING	[입사일]2022년12월14일(목)
		SimpleDateFormat form = new SimpleDateFormat("yyyy년MM월dd일(E)");
		if((part+"").length()<8) // 열거형 + "" = String
			return "[사번]" + sawonNo + "\t[이름]" + name + "\t[부서]" + part + "\t[입사일]" + form.format(date);
		else 
			return "[사번]" + sawonNo + "\t[이름]" + name + "\t[부서]" + part + "\t\t[입사일]" + form.format(date);
	}

}
