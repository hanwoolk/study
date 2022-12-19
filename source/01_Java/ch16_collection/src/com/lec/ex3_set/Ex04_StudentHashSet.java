package com.lec.ex3_set;

import java.util.HashSet;
import java.util.Iterator;

public class Ex04_StudentHashSet {
	public static void main(String[] args) {
		Student s1 = new Student(1, "È«±æµ¿");
		Student s2 = new Student(1, "È«±æµ¿");
		System.out.println(s1.hashCode() + " : " + s2.hashCode());
		System.out.println(s1.equals(s2));
		HashSet<Student> students = new HashSet<Student>();
		students.add(new Student(1, "È«±æµ¿"));
		students.add(new Student(1, "È«±æµ¿"));
		students.add(new Student(3, "Àåº¸°í"));
		students.add(new Student(6, "ÀÌ¼ø½Å"));
		students.add(new Student(3, "½Å±æµ¿"));
		System.out.println(students);
		students.remove(new Student(1, "È«±æµ¿"));
		System.out.println("È«±æµ¿ remove ÈÄ : " + students);
		Iterator<Student> iterator = students.iterator();
		while (iterator.hasNext()) {
			System.out.println(iterator.next());
		}
	}
}
