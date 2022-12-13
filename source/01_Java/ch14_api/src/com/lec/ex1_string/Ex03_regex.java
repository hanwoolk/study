package com.lec.ex1_string;

public class Ex03_regex {
	public static void main(String[] args) {
		/*  정규표현식 (regex)
		  1. 참조(https://goo.gl/HLntbd)
		  2. 간략 문법
		  	\d (숫자와 매치, [0-9]와 동일)
		  	\D (숫자가 아닌 것)
		  	\w (영문자나 숫자, [A-Za-z] or [a-zA-Z] 와 동일
		  	\W (영문자나 숫자가 아닌 문자)
		  	.  (문자1개)
		  	+  (1번 이상 반복)
		  	{2,} (2회 이상 반복)
		  	{2,4} (2~4회 반복)
		  	*  (0번 이상 반복)
		  	?  (0번이나 1번 반복)
		  	\s (탭 스페이스 엔터 등 white space)
		  
		  3. 정규표현식 연습장 : https://regexr.com/   ,  https://regexpal.com/ 
		  	ip주소 : 198.168.2.125   0.0.0.0								
		  			=> ([0-9]{1,3}\.){3}[0-9]{1,3}
		  	전화번호 : 02 712 6100 / 010 9999 9999 / 010- / 010. / 02)		
		  			=> \d{2,3}.?\d{3,4}.?\d{4}
	 	  	주민번호 : 981212-205 / 981212205								
	 	 			=> \d{2}[0-1]\d[0-3]\d-?[1-4]\d{6}
		  	이메일 : zol212@naver.com / zol212@sec.co.kr / .or		    	
		  			=> \w+@\w+(\.\w+){1,2}
		 4. 소스 구현
		 */
		String juminNo = "981212-2054545";
		//특정 정규표현식의 문자열 변경
		System.out.println("주민번호 : " + juminNo.replaceAll("-[1-4][0-9]{6}","-*******"));
		String str = "010-9999-999 yisy0703@naver.com 반갑습니다. 981212-2054545 ㅋㅋ ㅎㅎ";
		System.out.println("이메일을 지운 str :" + str.replaceAll("\\w+@\\w+(\\.\\w+){1,2}", ""));
		System.out.println("전화번호 삭제된 str : " + str.replaceAll("\\d{2,3}.?\\d{3,4}.?\\d{4}", ""));
		System.out.println("자음 제거된 str : " + str.replaceAll("[ㄱ-ㅎ]", ""));
	}
}
