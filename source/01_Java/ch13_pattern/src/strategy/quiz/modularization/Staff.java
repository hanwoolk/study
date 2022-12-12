package strategy.quiz.modularization;

import strategy.quiz.interfaces.GetSalary;
import strategy.quiz.interfaces.JobMng;

public class Staff extends Person {

	public Staff() {
		setJob(new JobMng());
		setGet(new GetSalary());

	}
}
