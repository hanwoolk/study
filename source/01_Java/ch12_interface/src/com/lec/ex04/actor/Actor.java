package com.lec.ex04.actor;

public class Actor implements PoliceMan, FireFighter, Chef {
	private String name;
	public Actor(String name) {
		this.name = name;
	}

	@Override
	public void makePizza() {
		System.out.println(name+"는 요리사입니다. 피자를 만듭니다.");
	}

	@Override
	public void makeSpaghetti() {
		System.out.println(name+"는 요리관입니다. 스파게티를 만듭니다.");
	}

	@Override
	public void outFire() {
		System.out.println(name+"는 소방관입니다. 불을 끕니다.");

	}

	@Override
	public void saveMan() {
		System.out.println(name+"는 소방관입니다. 사람을 살립니다.");

	}

	@Override
	public void canCatchCriminal() {
		System.out.println(name+"는 경찰관입니다. 범인을 잡습니다.");

	}

	@Override
	public void canSearch() {
		System.out.println(name+"는 경찰관입니다. 물건을 찾습니다.");

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
