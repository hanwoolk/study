package com.lec.quiz;

public class Main2 {

	public static void main(String[] args) {
		Person2 st1 = new Student2("A01","������","JAVA��");
		Person2 st2 = new Student2("A02","ȫ�浿","C++��");
		Person2 sf1 = new Staff2("S01","���浿","�������");
		Person2 sf2 = new Staff2("S01","���浿","���������");
		Person2 ga1 = new Gangsa2("G01","�̱浿","��ü����");
		Person2[] p = {st1, st2, sf1, sf2, ga1};
		for(Person2 pp : p)
			System.out.println(pp.infoString());

	}

}
