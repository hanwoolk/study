package strategy2.interfaces;

public class FuelGasoline implements FuelImpl {

	@Override
	public void fuel() {
		System.out.println("휘발유 연료룰 사용합니다.");
	}
}
