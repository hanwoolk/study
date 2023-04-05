package com.lec.ch05.ex1;

import org.springframework.context.EnvironmentAware;
import org.springframework.core.env.Environment;

import lombok.Data;
@Data
public class Admin implements EnvironmentAware{
	private	String adminId;
	private	String adminPw;
	private	Environment env;
	@Override
	public void setEnvironment(Environment environment) { // Admin형 객체 생성되자마자 실행
		env = environment;
		adminId = env.getProperty("admin.id");
		adminPw = env.getProperty("admin.pw");
		
	}
	
}
