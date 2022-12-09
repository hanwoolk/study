package com.lec.ex06_toy;

public class AirplneToy implements IMissile, ILight {
	public AirplneToy() {
		System.out.println("비행기입니다.");
		canLight();
		canMissile();
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	}
	@Override
	public void canLight() {
		System.out.println("불빛발사 할 수 있습니다.");

	}

	@Override
	public void canMissile() {
		System.out.println("미사일을 쏠 수 있습니다.");

	}

}
