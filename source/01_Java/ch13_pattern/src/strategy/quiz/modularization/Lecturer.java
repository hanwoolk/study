package strategy.quiz.modularization;

import strategy.quiz.interfaces.GetSalary;
import strategy.quiz.interfaces.JobLec;

public class Lecturer extends Person {

	public Lecturer() {
		setJob(new JobLec());
		setGet(new GetSalary());

	}
	
}
