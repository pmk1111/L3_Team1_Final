package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.Company;
import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;

public interface AdminService {
	


	public List<Employee> findEmployee(String company_id);

	Company company_info(String company_id);

	public int countEmployee(String company_id);
	
}
