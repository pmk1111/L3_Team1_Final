package com.naver.myhome.domain;

import java.sql.Date;

public class Company {
	private int company_id;
	private String company_password;
	private String company_name;
	private String company_email;
	private String company_domain;
	private Date company_created;
	public int getCompany_id() {
		return company_id;
	}
	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}
	public String getCompany_password() {
		return company_password;
	}
	public void setCompany_password(String company_password) {
		this.company_password = company_password;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getCompany_email() {
		return company_email;
	}
	public void setCompany_email(String company_email) {
		this.company_email = company_email;
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
