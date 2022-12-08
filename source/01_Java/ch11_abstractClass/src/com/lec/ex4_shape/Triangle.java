package com.lec.ex4_shape;

public class Triangle extends Shape {
	private int h; // ����
	private int w; // �غ�
	public Triangle() {}
	public Triangle(int h, int w) {
		super();
		this.h = h;
		this.w = w;
	}

	@Override
	public double area() {

		return w*h*0.5;
	}
	@Override
	public void draw() {
		System.out.print("�ﰢ�� ");
		super.draw();
	}
	public int getH() {
		return h;
	}
	public void setH(int h) {
		this.h = h;
	}
	public int getW() {
		return w;
	}
	public void setW(int w) {
		this.w = w;
	}

}
