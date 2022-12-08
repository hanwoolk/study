package com.lec.quiz;

public class Student extends Person {

	private String ban;
	private static int cntStudent = 0;
	public Student(String id, String name, String ban) {
		super(id, name);
		this.ban = ban;
		++cntStudent;
		setNo("student" + cntStudent); 
	}
@Override
public String infoString() {
	return super.infoString() + "\t(¹Ý)" + ban;
}
	}
	
