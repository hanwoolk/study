package com.lec.ex;
/*
 거스름돈 2680을 500, 100, 50, 10짜리 동전으로 줄 때, 몇개씩 주어야 하나?
	힌트 :  coinUnit[i] + “원 ; ” + money/coinUnit[i]        
		money = money%coinUnit[i];

	결과 : 2680원은
		500원짜리 X개,	100원짜리 X개,	50원짜리 X개,  10원짜리X개
 힌트 : coinUnit[i]
*/
public class Quiz3 {
	public static void main(String[] args) {
		int money = 2680;
		int[] coinUnit = {500, 100, 50, 10};
		System.out.println(money+"원은");
		// 일반 for문 사용
		for(int i=0 ; i<coinUnit.length ; i++) {
			System.out.print(coinUnit[i] + "원짜리 " + money/coinUnit[i]+"개,");
			money %=coinUnit[i]; //money = money%coinUnit[i];
		}
	}
}
