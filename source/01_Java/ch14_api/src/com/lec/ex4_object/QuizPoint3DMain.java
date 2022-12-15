package com.lec.ex4_object;

public class QuizPoint3DMain {
	public static void main(String[] args) throws CloneNotSupportedException {
		// 1 ������ �Ű����� ������ x=0, y=0, z=0, 3���� (x,y,z)
		// 3. ��ǥ�� [x��, y��, z��]�� �����ϴ� toString() ������
		Point3D p1 = new Point3D();
		Point3D p2 = new Point3D(1, 2, 3);
		Point3D p3 = new Point3D(1, 2, 3);
		Point3D p4 = new Point3D(3, 2, 1);
		Point3D p5 = (Point3D) p4.clone();
		System.out.println(p1);
		System.out.println(p2);
		
		// 2. x,y,z �Ǽ��� ������ true �ƴϸ� false�� equals
		if (p1.equals(p2)) {
			System.out.println(true);
		} else {
			System.out.println(false);
		}
		if (p2.equals(p3)) {
			System.out.println(true);
		} else {
			System.out.println(false);
		}

		// 4. �Ȱ��� ��ǥ��ü�� �����ϴ� clone() ������
		if(p4.equals(p5)) {
			System.out.println("���� ������ ��ü");
		}else {
			System.out.println("�ٸ� ������ ��ü");
		}
		if(p4==p5) {
			System.out.println("���� �ּ�");
		}else {
			System.out.println("�ٸ� �ּ�");
		}
		if(p4!=p5 && p4.equals(p5)) {
			System.out.println("���� ����");
		}else {
			System.out.println("���� ����");
		}
	}
}
