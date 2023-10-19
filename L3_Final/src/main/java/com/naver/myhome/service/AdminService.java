package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.Access;
import com.naver.myhome.domain.Company;
import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;

public interface AdminService {
	


	public List<Employee> findEmployee(int companyId);

//	Company companyInfo(int companyId);
	
	String companyName(int companyId);
	
	String companyDomain(int companyId);

	public int countEmployee(int companyId);

	public List<Employee> stopEmployee(int companyId);

	public int countStopEmployee(int companyId);

	public int stopEmployeeStatus(int employeeId);

	public int noMoreAuth(int employeeId);

	public int addAuth(int employeeId);

	public int useEmployeeStatus(int employeeId);

	public int addEmployee(int userId, int companyId);

	public int updateName(int companyId, String companyName);

	public int updateDomain(int companyId, String companyDomain);

	public List<Access> getAccesslist();

	public List<Access> getDayCount();

	public List<Access> getMonthCount();




	
	
}
