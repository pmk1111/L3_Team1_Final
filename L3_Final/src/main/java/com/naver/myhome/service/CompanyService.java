package com.naver.myhome.service;

import com.naver.myhome.domain.Company;

public interface CompanyService {
	public Company selectByDomain(String companyDomain);
	public int insert(Company company);
	public Company selectByEmail(String email);
}
