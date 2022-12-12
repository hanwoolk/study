package strategy2.modularization;

import strategy2.interfaces.FuelHybrid;
import strategy2.interfaces.Km20;

public class TestMain {
	public static void main(String[] args) {
		Genesis genesis = new Genesis();
		Sonata sonata = new Sonata();
		Accent accent = new Accent();
		Car[] cars = {new Genesis(), new Sonata(), new Accent()};
		for(Car car : cars) {
			car.shape();
			car.drive();
			car.isEngine();
			car.isKmPerLitter();
			car.isFuel();
		}
		System.out.println("Sonata의 FuelHybrid로 교체하고 연비를 20으로 업그레이드");
		sonata.setFuel(new FuelHybrid());
		sonata.setKm(new Km20());
		cars[2].isFuel();
		cars[2].isKmPerLitter();
		
	}
	
}
