package strategy2.modularization;

import strategy.quiz.modularization.Person;

public class Lecturer extends Person {
	private String subject;
	public Lecturer(String id, String name, String subject) {
		super(id, name);
		this.subject = subject;
	}
	
}
