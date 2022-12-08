package com.lec.ex5_car;

import com.lec.cons.CarSpec;

public class TestMain {
	public static void main(String[] args) {
		Car lowCar = new LowGradeCar(CarSpec.COLOR_GRAY, CarSpec.TIER_NORMAL, CarSpec.DISPLACEMENT_800, CarSpec.HANDLE_POWER);
		Car highCar = new HighGradeCar(CarSpec.COLOR_WHITE, CarSpec.TIER_WIDE, CarSpec.DISPLACEMENT_2000, CarSpec.HANDLE_POWER);
		//Car highCar = new
		lowCar.getSpec();
		highCar.getSpec();
	}
}
