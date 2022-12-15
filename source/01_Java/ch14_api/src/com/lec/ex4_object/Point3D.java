package com.lec.ex4_object;

public class Point3D implements Cloneable {
	private double x;
	private double y;
	private double z;
// 1 생성자 매개변수 없으면 x=0, y=0, z=0, 3개면 (x,y,z) 
	public Point3D() {}
	public Point3D(double x, double y, double z) {
		this.x = x;
		this.y = y;
		this.z = z;
	}
// 2. x,y,z 실수값 같으면 true 아니면 false인 equals
	@Override
	public boolean equals(Object obj) {
		if(obj!=null && getClass() == obj.getClass()) {
			Point3D other = (Point3D)obj;
			boolean xChk = x == other.x;
			boolean yChk = y == other.y;
			boolean zChk = z == other.z;
			return xChk && yChk && zChk;
		}
		return false;
	}
// 3. 좌표값 [x값, y값, z값]을 리턴하는 toString() 재정의
	@Override
	public String toString() {
		return String.format("[%.1f, %.1f, %.1f]", x, y, z);
	}
// 4. 똑같은 좌표객체를 복사하는 clone() 재정의
	@Override
	protected Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
// 5. 위 네 조건을 모두 출력하는 main()함수 구현. 
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	public double getZ() {
		return z;
	}
	public void setZ(double z) {
		this.z = z;
	}
	
}
