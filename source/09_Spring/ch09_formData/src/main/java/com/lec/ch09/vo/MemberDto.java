package com.lec.ch09.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class MemberDto {
	private String name;
	private String id;
	private String pw;
	private int age;
	private String email;
	private String address;
}
