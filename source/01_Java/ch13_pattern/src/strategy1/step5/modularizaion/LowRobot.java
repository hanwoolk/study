package strategy1.step5.modularizaion;

import strategy1.step4.interfaces.FlyNo;
import strategy1.step4.interfaces.KnifeNo;
import strategy1.step4.interfaces.MissileNo;

public class LowRobot extends Robot {
	public LowRobot() {
		setFly(new FlyNo());// fly = new FlyNo();
		setMissile(new MissileNo());// missile = new MissileYes();
		setKnife(new KnifeNo());// knife = new KnifeWood();
	}
}
