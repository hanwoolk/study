package com.lec.ex09_customer;
import com.lec.ex09_customer.Person;

import cons.Constant;
// name, tel, address
public class Customer extends Person {
	private String	address;
	private int		sum;	// ���� �ݾ� ����
	private int		point;	// ����Ʈ(���Ž� 5%) ��� - static final
	private String	date;	// String�� �����ֺ��ʹ� Date��
	private boolean	vip;		
	// Customer c = new Customer("ȫ�浿", "010-999-9999", "����", "12-12")
	public Customer(String name, String tel, String address, String date) {
		super(name, tel);
		this.address = address;
		this.date = date;
		point = 1000;
		System.out.println(name + "�� ���� �����մϴ�. ����Ʈ 1000���� ��Ƚ��ϴ�.");
	}
	public void buy(int price) { // c.buy(2000);
		sum += price; // ���� �ݾ׿� ����
		//int tempPoint = (int)(price * 0.05);
		int tempPoint = (int)(price * Constant.RATE);
		point += tempPoint; //����Ʈ ����
		System.out.println(getName() + "�� �����մϴ�. �ݹ� ����Ʈ : " + tempPoint);
		System.out.println("���� ����Ʈ : " + point);
		System.out.println("���űݾ� : " + price);
		if(vip == false && sum >= Constant.VIPLIMIT) {
			vip = true;
			System.out.println(getName() + "�� VIP ������ ���׷��̵� �Ǽ̽��ϴ�. ���� �˰ڽ��ϴ�.");
		}// if
	}// buy
	@Override
	public String infoString() {
		return super.infoString() + "  [�ּ�]" + address + "  [����Ʈ]" + point + "   [�������űݾ�]" + sum +"�� " + "    [vip����]" + vip;
	}
}// class
