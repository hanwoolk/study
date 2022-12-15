package com.lec.ex4_object;

public class QuizPoint3DMain {
	public static void main(String[] args) throws CloneNotSupportedException {
		// 1 생성자 매개변수 없으면 x=0, y=0, z=0, 3개면 (x,y,z)
		// 3. 좌표값 [x값, y값, z값]을 리턴하는 toString() 재정의
		Point3D p1 = new Point3D();
		Point3D p2 = new Point3D(1, 2, 3);
		Point3D p3 = new Point3D(1, 2, 3);
		Point3D p4 = new Point3D(3, 2, 1);
		Point3D p5 = (Point3D) p4.clone();
		System.out.println(p1);
		System.out.println(p2);
		
		// 2. x,y,z 실수값 같으면 true 아니면 false인 equals
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

		// 4. 똑같은 좌표객체를 복사하는 clone() 재정의
		if(p4.equals(p5)) {
			System.out.println("같은 내용의 객체");
		}else {
			System.out.println("다른 내용의 객체");
		}
		if(p4==p5) {
			System.out.println("같은 주소");
		}else {
			System.out.println("다른 주소");
		}
		if(p4!=p5 && p4.equals(p5)) {
			System.out.println("복제 성공");
		}else {
			System.out.println("복제 실패");
		}
	}
}
