package com.lec.ex04.actor;

public class Actor implements PoliceMan, FireFighter, Chef {
	private String name;
	public Actor(String name) {
		this.name = name;
	}

	@Override
	public void makePizza() {
		System.out.println(name+"�� �丮���Դϴ�. ���ڸ� ����ϴ�.");
	}

	@Override
	public void makeSpaghetti() {
		System.out.println(name+"�� �丮���Դϴ�. ���İ�Ƽ�� ����ϴ�.");
	}

	@Override
	public void outFire() {
		System.out.println(name+"�� �ҹ���Դϴ�. ���� ���ϴ�.");

	}

	@Override
	public void saveMan() {
		System.out.println(name+"�� �ҹ���Դϴ�. ����� �츳�ϴ�.");

	}

	@Override
	public void canCatchCriminal() {
		System.out.println(name+"�� �������Դϴ�. ������ ����ϴ�.");

	}

	@Override
	public void canSearch() {
		System.out.println(name+"�� �������Դϴ�. ������ ã���ϴ�.");

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
