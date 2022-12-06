package com.lec.ex2_parking;

import com.lec.constant.Constant;

// ������ : Sting no,int inTime,int outTime
// �޼ҵ� : out(int outTime)
public class Parking {
	private String no;
	private int inTime;
	private int outTime;
	private int fee;
//	private final int HOURLYPARKINGRATE = 2000; //���(final ����) ������ �Ұ���
	public Parking() {}

	public Parking(String no, int inTime) {
		this.no = no;
		this.inTime = inTime;
		System.out.printf("\"%s\"�� �������.\n�����ð� : %d��\n\n", no, inTime);
	}

	public void out(int outTime) {
		this.outTime = outTime;
		fee = (outTime - inTime) * Constant.HOURLYPARKINGRATE;
		System.out.printf("\"%s\"�� �ȳ��� ������.\n* �����ð� : %d��\n* �����ð� : %d��\n* ������� : %d��\n\n", no, inTime, outTime, fee);
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