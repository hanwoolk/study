package com.lec.ex3_account;

public class AccointMain {
	public static void main(String[] args) {
		Account hong = new Account("110-1", "ȫ�浿", 1000);
		//hong.infoPrint();
		System.out.println(hong.infoString());
		Account hong1 = new Account("110-2", "ȫ�浿");
		System.out.println(hong1.infoString());
		Account hong2 = new Account();
		System.out.println(hong2.infoString());
		hong.withdraw(500);
		hong.deposite(5000);
		hong1.deposite(2200000000L);
		hong1.withdraw(2200000001L); // �ܾ��� �����ϸ� ���� �Ұ�
		
	}
}
