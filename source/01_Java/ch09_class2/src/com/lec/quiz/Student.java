package com.lec.quiz;
// 객체 생성 : 번호, 이름, 국, 영, 수, 총, 평 new Student("정우성",90, 80, 100); 0> 번호, 총점, 평균도 같이 초기화
// 메소드 : 
public class Student {
	private static int cnt;
	private int		no;
	private String  name;
	private int 	kor;
	private int 	eng;
	private int 	mat;
	private int		tot;
	private int		avg;
	public Student() {}
	public Student(String name, int kor, int eng, int mat) {
		no = ++cnt;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		tot = kor + eng + mat;
//		avg = tot/3; //버림
		avg = (int)(tot/3.0+0.5); //반올림
	}
	public String infoString() {
		return String.format("\t%d\t%s\t%d\t%d\t%d\t%d\t%d",no , name, kor, eng, mat, tot, avg);
	}
//	public void infoPrint() {
//		System.out.printf("\t%s\t%d\t%d\t%d\t%d\t%d\t%d\n", name, kor, eng, mat, tot, avg);
//	}
	public void setName(String name) {
		this.name = name;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public void setMat(int mat) {
		this.mat = mat;
	}
	//getters
	public String getName() {
		return name;
	}
	public int getKor() {
		return kor;
	}
	public int getEng() {
		return eng;
	}
	public int getMat() {
		return mat;
	}
	public int getTot() {
		return tot;
	}
	public int getAvg() {
		return avg;
	}
}

