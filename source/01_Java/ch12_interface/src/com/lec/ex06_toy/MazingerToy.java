package com.lec.ex06_toy;

public class MazingerToy implements IMissile, IMoveArmLeg {
	public MazingerToy() {
		System.out.println("마징가입니다.");
		canMoveArmLeg();
		canMissile();
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	}
	@Override
	public void canMoveArmLeg() {
		System.out.println("팔 다리를 움직일 수 있습니다.");
	}

	@Override
	public void canMissile() {
		System.out.println("미사일을 쏠 수 있습니다.");
	}

}
