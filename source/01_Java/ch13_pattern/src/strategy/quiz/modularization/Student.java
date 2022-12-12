package strategy.quiz.modularization;

import strategy.quiz.interfaces.GetStudentPay;
import strategy.quiz.interfaces.JobStudy;

public class Student extends Person {

	public Student() {
		setJob(new JobStudy());
		setGet(new GetStudentPay());

	}
}
