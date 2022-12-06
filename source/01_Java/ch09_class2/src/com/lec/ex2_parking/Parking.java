package com.lec.ex2_parking;

import com.lec.constant.Constant;

// 데이터 : Sting no,int inTime,int outTime
// 메소드 : out(int outTime)
public class Parking {
	private String no;
	private int inTime;
	private int outTime;
	private int fee;
//	private final int HOURLYPARKINGRATE = 2000; //상수(final 변수) 변경이 불가능
	public Parking() {}

	public Parking(String no, int inTime) {
		this.no = no;
		this.inTime = inTime;
		System.out.printf("\"%s\"님 어서오세요.\n입차시간 : %d시\n\n", no, inTime);
	}

	public void out(int outTime) {
		this.outTime = outTime;
		fee = (outTime - inTime) * Constant.HOURLYPARKINGRATE;
		System.out.printf("\"%s\"님 안녕히 가세요.\n* 입차시간 : %d시\n* 출차시간 : %d시\n* 주차요금 : %d원\n\n", no, inTime, outTime, fee);
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public int getInTime() {
		return inTime;
	}

	public void setInTime(int inTime) {
		this.inTime = inTime;
	}

	public int getOutTime() {
		return outTime;
	}

	public void setOutTime(int outTime) {
		this.outTime = outTime;
	}
}