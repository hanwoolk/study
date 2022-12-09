package com.lec.ex04.actor;

public class ActorMain {
	public static void main(String[] args) {
		Actor gong = new Actor("공유");
		gong.makePizza();	gong.makeSpaghetti();
		gong.outFire();		gong.saveMan();
		gong.canCatchCriminal();	gong.canSearch();

		Chef chefGong = new Actor("공유");
		chefGong.makePizza();	chefGong.makeSpaghetti();
//		chefGong.outFire();	chefGong.saveMan();
//		chefGong.canCatchCriminal();	chefGong.canSearch();

		FireFighter fireGong = gong;
//		fireGong.makePizza();	fireGong.makeSpaghetti();
		fireGong.outFire();		fireGong.saveMan();
//		fireGong.canCatchCriminal();	fireGong.canSearch();

		PoliceMan policeGong = gong;
//		policeGong.makePizza();	policeGong.makeSpaghetti();
//		fireGong.outFire();		policeGong.saveMan();
		policeGong.canCatchCriminal();	policeGong.canSearch();
	}
	}
