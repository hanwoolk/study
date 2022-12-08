package com.lec.quiz;

public class Gangsa extends Person {

	private String subject;
	private static int cntGangsa =0;
	public Gangsa(String id, String name, String subject) {
		super(id, name);
		this.subject = subject;
		++cntGangsa;
		setNo("lecturer" + cntGangsa);
	}
@Override
public String infoString() {
	return super.infoString() + "\t(°ú¸ñ)" + subject;
}
	}
	
