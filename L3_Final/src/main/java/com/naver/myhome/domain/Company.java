package com.naver.myhome.domain;

import java.sql.Date;

public class Company {
	private int company_id;
	private String password;
	private String name;
	private String email;
	private String company_domain;
	private Date company_created;
	
	public int getCompany_id() {
		return company_id;
	}
	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCompany_domain() {
		return company_domain;
	}
	public void setCompany_domain(String company_domain) {
		this.company_domain = company_domain;
	}
	public Date getCompany_created() {
		return company_created;
	}
	public void setCompany_created(Date company_created) {
		this.company_created = company_created;
	}
	
	

	
}
