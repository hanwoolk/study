package com.lec.ex;
// �������� : &&(AND) �� �� true���� true, ||(OR) �� �� �ϳ��� true�� true, !
public class Ex04 {
	public static void main(String[] args) {
		int i=1, j=10, h=10;
		System.out.println("&& : (i<j) && (++j>h) ��" + ((i<j) && (++j>h)));
		System.out.println("j= " + j); // j=11
		// &&������ ��� �������� false�� ��� ������ ���� ���� �ʴ´�
		System.out.println("&& : (i>j) && (++j>h) ��" + ((i>j) && (++j>h)));
		System.out.println("j= " + j); // i>j�� false�̱⶧���� ++������ �۵� x
		
		System.out.println("|| : (i<j) || (++j>h) ��" + ((i<j) || (++j>h)));
		System.out.println("j= " + j); // j=11
		// ||������ ��� �������� true�� ��� ������ ���� ���� �ʴ´�
		System.out.println("|| : (i>j) || (++j>h) ��" + ((i>j) || (++j>h)));
		System.out.println("j= " + j);
	}
}
