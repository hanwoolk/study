package strategy2.modularization;

import strategy.quiz.modularization.Person;

public class Staff extends Person {
	private String part;
	public Staff(String id, String name, String part) {
		super(id, name);
		this.part = part;
	}
	
}
