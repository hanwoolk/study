package com.lec.quiz;

public class Student2 extends Person2 {
	private String ban;
	private static int cntStudent=0;
	public Student2(String no, String id, String name, String ban) {
		super(no, id, name);
		this.ban = ban;
		++cntStudent;
		setNo("student" + cntStudent);
	}
	@Override
	public String infoString() {
		return super.infoString() + "(¹Ý)" + ban;
	}
}
	
	
