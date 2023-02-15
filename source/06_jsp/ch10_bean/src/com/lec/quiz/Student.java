package com.lec.quiz;

public class Student {
	private String	num;
	private	String	name;
	private int		grade;
	private	char	classNum;
	private	int		score;
	public Student() {}
	public Student(String num, String name, int grade, char classNum, int score) {
		this.num = num;
		this.name = name;
		this.grade = grade;
		this.classNum = classNum;
		this.score = score;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public char getClassNum() {
		return classNum;
	}
	public void setClassNum(char classNum) {
		this.classNum = classNum;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
}
