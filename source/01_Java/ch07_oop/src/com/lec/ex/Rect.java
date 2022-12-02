package com.lec.ex;

// Ŭ���� : �Ӽ�, (������, jvm�� �⺻���� ������ֱ���) �޼ҵ�, setter&getter
public class Rect {
	private int width;
	private int height;
	// �����ڰ� ���� ��� JVM�� �ڵ����� ����
	public Rect() {} //����Ʈ ������
	public Rect(int square) {
		width = square;
		height = square;
	}
	public Rect(int width, int height) { // �Ű����� 2��¥�� ������ �Լ�, ������ �Լ��� ���� ������ �ʱ�ȭ
		this.width = width;
		this.height = height;
	}
	public int area() {
		return width * height;
	}

	// getter & setter
	public int getWidth() {
		return width;
	}
	public int getHeight() {
		return height;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public void setHeight(int height) {
		this.height = height;
	}
}
