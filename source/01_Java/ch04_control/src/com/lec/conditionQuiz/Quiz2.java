package com.lec.conditionQuiz;
// 변수는 {} 블럭 안에서 유효 
public class Quiz2 {
	public static void main(String[] args) {
		int num1 = 27;
		int num2 = 32;
		int max;
		if(num1>num2) {
			max = num1;
		}else {
			max = num2;
		}
		System.out.println("최대값은 " + max);
	}
}
