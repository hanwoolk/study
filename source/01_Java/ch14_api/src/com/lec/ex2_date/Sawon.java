package com.lec.ex2_date;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

//������ : ���, �̸�, �μ�(COMPUTER, PLANNING, DESIGN, ACCOUNTING, HUMANRESOURCES), �Ի���.
//������ : ���, �̸�, �μ�, �Ի����� ��ü���� ���Ϸ� �մϴ�

public class Sawon {
	public static final String COMPUTER		  = "COMPUTER";
	public static final String PLANNING 	  = "PLANNING";
	public static final String DESIGN 		  = "DESIGN";
	public static final String ACCOUNTING	  = "ACCOUNTING";
	public static final String HUMANRESOURCES = "HUMANRESOURCES";
	private String sawonNo;
	private String name;
	private String part;
	private Date date;
	public Sawon(String sawonNo, String name, String part, int year, int month, int day) {
	this.sawonNo = sawonNo;
	this.name = name;
	this.part = part;
	date = new Date(new GregorianCalendar(year, month-1, day).getTimeInMillis());
}
		
	public Sawon(String sawonNo, String name, String part) {
		this.sawonNo = sawonNo;
		this.name = name;
		this.part = part;
		date = new Date();
		
	}
	@Override
	public String toString() {	// [���]a01	[�̸�]ȫ�浿	[�μ�]PLANNING	[�Ի���]2022��12��14��(��)
		SimpleDateFormat form = new SimpleDateFormat("yyyy��MM��dd��(E)");
		if(part.length()<8)
			return "[���]" + sawonNo + "\t[�̸�]" + name + "\t[�μ�]" + part + "\t[�Ի���]" + form.format(date);
		else 
			return "[���]" + sawonNo + "\t[�̸�]" + name + "\t[�μ�]" + part + "\t\t[�Ի���]" + form.format(date);
	}

}
