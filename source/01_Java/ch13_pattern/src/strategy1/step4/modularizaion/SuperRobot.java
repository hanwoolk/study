package strategy1.step4.modularizaion;

import strategy1.step4.interfaces.FlyImpl;
import strategy1.step4.interfaces.FlyYes;
import strategy1.step4.interfaces.KnifeImpl;
import strategy1.step4.interfaces.KnifeLaser;
import strategy1.step4.interfaces.MissileImpl;
import strategy1.step4.interfaces.MissileYes;

public class SuperRobot extends Robot {
	private FlyImpl 	fly ;
	private MissileImpl missile;
	private KnifeImpl	knife;
//	private int i;
	public SuperRobot() {
//		setI(10); //i=10;
		setFly(new FlyYes()); 			//fly 	  = new FlyYes();
		setMissile(new MissileYes()); 	//missile = new MissileYes();
		setKnife(new KnifeLaser()); 	//knife   = new KnifeLaser();
	}
	@Override
	public void actionFly() {
		fly.fly();
	}

	@Override
	public void actionMissile() {
		missile.missile();
	}

	@Override
	public void actionKnife() {
		knife.knife();
	}
	// setter ÇÊ¿ä
	public void setFly(FlyImpl fly) {
		this.fly = fly;
	}
	public void setMissile(MissileImpl missile) {
		this.missile = missile;
	}
	public void setKnife(KnifeImpl knife) {
		this.knife = knife;
	}
//	public void setI(int i) {
//		this.i = i;
//	}
	

}
