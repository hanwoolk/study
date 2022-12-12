package strategy2.modularization;

import strategy.quiz.modularization.Person;

public class Student extends Person {
	private String ban;
	public Student(String id, String name, String ban) {
		super(id, name);
		this.ban = ban;
	}
	
}
