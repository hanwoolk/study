package com.lec.ex06_toy;

public class AirplneToy implements IMissile, ILight {
	public AirplneToy() {
		System.out.println("������Դϴ�.");
		canLight();
		canMissile();
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	}
	@Override
	public void canLight() {
		System.out.println("�Һ��߻� �� �� �ֽ��ϴ�.");

	}

	@Override
	public void canMissile() {
		System.out.println("�̻����� �� �� �ֽ��ϴ�.");

	}

}
