package com.lec.quiz;
// ��ü ���� : ��ȣ, �̸�, ��, ��, ��, ��, �� new Student("���켺",90, 80, 100); 0> ��ȣ, ����, ��յ� ���� �ʱ�ȭ
// �޼ҵ� : 
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
//		avg = tot/3; //����
		avg = (int)(tot/3.0+0.5); //�ݿø�
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

