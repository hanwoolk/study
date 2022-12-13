package com.lec.ex1_string;

public class Ex03_regex {
	public static void main(String[] args) {
		/*  ����ǥ���� (regex)
		  1. ����(https://goo.gl/HLntbd)
		  2. ���� ����
		  	\d (���ڿ� ��ġ, [0-9]�� ����)
		  	\D (���ڰ� �ƴ� ��)
		  	\w (�����ڳ� ����, [A-Za-z] or [a-zA-Z] �� ����
		  	\W (�����ڳ� ���ڰ� �ƴ� ����)
		  	.  (����1��)
		  	+  (1�� �̻� �ݺ�)
		  	{2,} (2ȸ �̻� �ݺ�)
		  	{2,4} (2~4ȸ �ݺ�)
		  	*  (0�� �̻� �ݺ�)
		  	?  (0���̳� 1�� �ݺ�)
		  	\s (�� �����̽� ���� �� white space)
		  
		  3. ����ǥ���� ������ : https://regexr.com/   ,  https://regexpal.com/ 
		  	ip�ּ� : 198.168.2.125   0.0.0.0								
		  			=> ([0-9]{1,3}\.){3}[0-9]{1,3}
		  	��ȭ��ȣ : 02 712 6100 / 010 9999 9999 / 010- / 010. / 02)		
		  			=> \d{2,3}.?\d{3,4}.?\d{4}
	 	  	�ֹι�ȣ : 981212-205 / 981212205								
	 	 			=> \d{2}[0-1]\d[0-3]\d-?[1-4]\d{6}
		  	�̸��� : zol212@naver.com / zol212@sec.co.kr / .or		    	
		  			=> \w+@\w+(\.\w+){1,2}
		 4. �ҽ� ����
		 */
		String juminNo = "981212-2054545";
		//Ư�� ����ǥ������ ���ڿ� ����
		System.out.println("�ֹι�ȣ : " + juminNo.replaceAll("-[1-4][0-9]{6}","-*******"));
		String str = "010-9999-999 yisy0703@naver.com �ݰ����ϴ�. 981212-2054545 ���� ����";
		System.out.println("�̸����� ���� str :" + str.replaceAll("\\w+@\\w+(\\.\\w+){1,2}", ""));
		System.out.println("��ȭ��ȣ ������ str : " + str.replaceAll("\\d{2,3}.?\\d{3,4}.?\\d{4}", ""));
		System.out.println("���� ���ŵ� str : " + str.replaceAll("[��-��]", ""));
	}
}
