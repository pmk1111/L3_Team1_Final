package com.naver.myhome.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Company {
	private int id;
	private String password;
	private String name;
	private String email;
	private String domain;
	private Date created_at;

	
}
