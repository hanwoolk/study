package com.lec.ex5_car;
// HighGradeCar high = new HighGradeCar("����", "�Ϲ�Ÿ�̾�", "2000", "�Ŀ��ڵ�")
// low.getSpec();
public class HighGradeCar extends Car {
	private int tax;
	public HighGradeCar(String color, String tire, int displacement, String handle) {
		super(color, tire, displacement, handle);
		tax = 100000;
	}

	@Override
	public void getSpec() { // tax�� ������ Spec�� ���
		if(getDisplacement() > 1500) {
			tax += (getDisplacement()-1500) * 600;
			// tax = tax + (getDisplacement()-1500) * 600;
		}
		System.out.println("��   �� : " + getColor());
		System.out.println("Ÿ�̾� : " + getTire());
		System.out.println("��ⷮ : " + getDisplacement());
		System.out.println("��   �� : " + getHandle());
		System.out.println("��   �� : " + tax);
		System.out.println("================================");
		
	}

}
