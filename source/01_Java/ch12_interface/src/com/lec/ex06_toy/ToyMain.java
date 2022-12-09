package com.lec.ex06_toy;

public class ToyMain {
	public static void main(String[] args) {
		PoohToy pooh = new PoohToy();
		MazingerToy mazinger = new MazingerToy();
		AirplneToy airplane = new AirplneToy();
		IToy[] toy = {pooh, mazinger, airplane};
		for (IToy t : toy) {
			//객체의 클래스 이름 출력
			System.out.println(t.getClass().getName());
		}
	}
}
