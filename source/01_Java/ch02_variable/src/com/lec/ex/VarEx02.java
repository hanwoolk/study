package com.lec.ex;
// println() : �ܼ�â ���(��������)
// print() : �ܼ�â ���(���� ������)
// printf() : �ܼ�â�� ���(������ ����)
public class VarEx02 {
	public static void main(String[] args) {
		//	Ÿ�� ������ �Ҵ翬���� ��;
		int i = 10; 		// 4byte
		byte j = 127;		// 1byte
		double h = 10.15;	// 8byte �Ҽ�
		i = 100;
		System.out.println("i=" + i + "\tj=" + j + "\th="+h); // \t:tap(8������)
		System.out.printf("i=%d \t j=%d \t h=%.1f \n", i, j, h);
		char c1 = 'A';		//char�� ���� 1���� ���� ����, �ѱ� ����
		char c2 = 'ȫ';
		System.out.printf("c1=%c \t c2=%c\n",  c1, c2);
		System.out.printf("c1=%d \t c2=%d\n", (int)c1, (int)c2);
		/* \n:�ٹٲ�, %c:����, %s:���ڿ�, %d:����, %f:�Ǽ�
		%5.2f -> ��ü5�ڸ�,�Ҽ�2�ڸ�������� %b:boolean
		*/
		System.out.println("���α׷� ��");
	}
}
