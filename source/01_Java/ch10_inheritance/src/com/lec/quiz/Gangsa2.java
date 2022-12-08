package com.lec.quiz;

public class Gangsa2 extends Person2 {
	private String subject;
	private static int cntGangsa = 0;
	public Gangsa2(String no, String id, String name, String subject) {
		super(no, id, name);
		this.subject = subject;
		++cntGangsa;
		setNo("lecturer" + cntGangsa);
	}
	@Override
	public String infoString() {
		return super.infoString() + "(°ú¸ñ)" + subject;
	}
	}
	
