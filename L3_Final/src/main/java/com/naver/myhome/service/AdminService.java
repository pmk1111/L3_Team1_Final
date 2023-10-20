package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;

public interface AdminService {

	String companyName(int companyId);
	
	String companyDomain(int companyId);

	public int updateName(int companyId, String companyName);

	public int updateDomain(int companyId, String companyDomain);
	
	public List<User> waitUser(int companyId);

	public void approveUser(int userId, int companyId);
	
	public void addEmployee(int userId, int companyId);

	public void rejectUser(int userId, int companyId);
	
	public List<Employee> findEmployee(int companyId);
	
	public int stopEmployeeStatus(int employeeId);

	public void updateAuth(int employeeId);

	public int countUser( int companyId);
	
	public int countStop (int companyId);
	
	public int countEmp (int companyId);

	public List<Employee> getStopList(int companyId);

	public void backEmp(int empId);
	

}
