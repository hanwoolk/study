package com.lec.ex;
/*
 �Ž����� 2680�� 500, 100, 50, 10¥�� �������� �� ��, ��� �־�� �ϳ�?
	��Ʈ :  coinUnit[i] + ���� ; �� + money/coinUnit[i]        
		money = money%coinUnit[i];

	��� : 2680����
		500��¥�� X��,	100��¥�� X��,	50��¥�� X��,  10��¥��X��
 ��Ʈ : coinUnit[i]
*/
public class Quiz3 {
	public static void main(String[] args) {
		int money = 2680;
		int[] coinUnit = {500, 100, 50, 10};
		System.out.println(money+"����");
		// �Ϲ� for�� ���
		for(int i=0 ; i<coinUnit.length ; i++) {
			System.out.print(coinUnit[i] + "��¥�� " + money/coinUnit[i]+"��,");
			money %=coinUnit[i]; //money = money%coinUnit[i];
		}
	}
}
