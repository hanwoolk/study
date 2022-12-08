package com.lec.quiz;

public class Main2 {

	public static void main(String[] args) {
		Person2 st1 = new Student2("A01","강유미","JAVA반");
		Person2 st2 = new Student2("A02","홍길동","C++반");
		Person2 sf1 = new Staff2("S01","유길동","운영지원팀");
		Person2 sf2 = new Staff2("S01","유길동","취업지원팀");
		Person2 ga1 = new Gangsa2("G01","이길동","객체지향");
		Person2[] p = {st1, st2, sf1, sf2, ga1};
		for(Person2 pp : p)
			System.out.println(pp.infoString());

	}

}
