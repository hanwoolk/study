package com.lec.quiz;

public class Staff2 extends Person2 {
	private String department;
	private static int cntStaff = 1;
	public Staff2(String no, String id, String name, String department) {
		super(no, id, name);
		this.department = department;
		cntStaff++;
		setNo("staff" + cntStaff);
	}
	@Override
	public String infoString() {
		return super.infoString() + "(ºÎ¼­)" + department;
	}
}
