package com.lec.test;

//{76,45,34,89,100,50,90,93}  8���� ���� 1���� �迭�� �ʱ�ȭ �ϰ� 
//���� �հ��  ��� �׸��� �ִ밪�� �ּҰ��� ���ϴ� ���α׷��� �ۼ� �Ͻÿ�
public class ProgramimgLan {
	public static void main(String[] args) {
		int[] arr = { 76, 45, 34, 89, 100, 50, 90, 93 };
		int tot = 0;
		int maxIdx = 0, maxNum = 0;
		int minIdx = 0, minNum = 999;
		for (int temp : arr) {
			tot += temp;
		}
		double avg = (double) tot / arr.length;
		System.out.printf("��      �� = %d  ", tot);
		System.out.printf("��      �� = %.2f\n", avg);
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] > maxNum) {
				maxNum = arr[i];
				maxIdx = i;
			} // if - �ִ밪
			if (arr[i] < minNum) {
				minNum = arr[i];
				minIdx = i;
			} // if - �ּҰ�
		} // for
		System.out.printf("�ִ밪�� = %d  ", maxNum);
		System.out.printf("�ּҰ��� = %d\n", minNum);
	}// main
}// class