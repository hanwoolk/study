package com.lec.quiz;

public class Staff extends Person {

	private String department;
	private static int cntStaff =0;
	public Staff(String id, String name, String department) {
		super(id, name);
		this.department = department;
		++cntStaff;
		setNo("staff"+cntStaff);
	}

	@Override
	public String infoString() {
		return super.infoString() + "\t(ºÎ¼­)" + department;
	}
}
