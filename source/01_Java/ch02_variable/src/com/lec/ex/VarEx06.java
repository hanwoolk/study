package com.lec.ex;
// ����ȯ
public class VarEx06 {
	public static void main(String[] args) {
		int i = 10;
		double d = i;	// d = 10.0 �������� ����ȯ, �����ͼս� x
		System.out.println("d = " + d);
		i = (int)10.6;	// ������� ����ȯ, �����ͼս��� ���� �� ����.
		System.out.println("i = " + i);
	}
}
