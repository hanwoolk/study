package com.lec.ex;


public class CarMain {
	public static void main(String[] args) {
		Car myPorche = new Car(); // �⺻�����δ� 0�� ������
		myPorche.setColor("����"); //myPorche.color = "����";
		System.out.println(myPorche.getColor() + "�� ���� ��ⷮ: " +myPorche.getCc());
		myPorche.drive();
		myPorche.park();
		myPorche.race();
		Car yourPorche = new Car();
		yourPorche.setColor("��ȸ��");
		yourPorche.drive();
		System.out.println("���� �ӵ� : " + myPorche.getSpeed());
	}
}
