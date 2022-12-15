package com.lec.ex4_object;

public class Point3D implements Cloneable {
	private double x;
	private double y;
	private double z;
// 1 ������ �Ű����� ������ x=0, y=0, z=0, 3���� (x,y,z) 
	public Point3D() {}
	public Point3D(double x, double y, double z) {
		this.x = x;
		this.y = y;
		this.z = z;
	}
// 2. x,y,z �Ǽ��� ������ true �ƴϸ� false�� equals
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
// 3. ��ǥ�� [x��, y��, z��]�� �����ϴ� toString() ������
	@Override
	public String toString() {
		return String.format("[%.1f, %.1f, %.1f]", x, y, z);
	}
// 4. �Ȱ��� ��ǥ��ü�� �����ϴ� clone() ������
	@Override
	protected Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
// 5. �� �� ������ ��� ����ϴ� main()�Լ� ����. 
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
