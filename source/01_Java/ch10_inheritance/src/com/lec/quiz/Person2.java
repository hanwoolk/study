package com.lec.quiz;
//no, id, name / print() �Ǵ� infoString(), getter�� setter
public class Person2 {
	private String no;
	private String id;
	private String name;
	public Person2(String no, String id, String name) {
		this.no = no;
		this.id = id;
		this.name = name;
	}
	public String infoString() {
		return "(��ȣ)" + no + "(ID)" + id + "(�̸�)" + name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}

}
