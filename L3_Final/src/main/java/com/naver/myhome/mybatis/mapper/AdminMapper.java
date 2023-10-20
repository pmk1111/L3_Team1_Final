package com.naver.myhome.mybatis.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.Company;
import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;

@Mapper
public interface AdminMapper {
	
		public List<Employee> findEmployee(int companyId);

		public List<Employee> stopEmployee(int companyId);

		public int noMoreAuth(int employeeId);

		public int addAuth(int employeeId);

		public int useEmployeeStatus(int employeeId);

		Company companyInfo(int companyId);
		
		public int updateName(int companyId,String companyName);

		public int updateDomain(int companyId,String companyDomain);

		public String companyName(int companyId);

		public String companyDomain(int companyId);

		public List<User> waitUser(int companyId);

		public int approveUser(int userId, int companyId);
		
		public int addEmployee(int userId, int companyId);

		public void rejectUser(int userId, int companyId);

		public int stopEmpStatus(int employeeId);

		public void updateAuth(int employeeId);
		
		public int countUser(int companyId);

		public int countStop(int companyId);

		public int countEmp(int companyId);

		public List<Employee> getStopList(int companyId);

		public void backEmp(int empId);
		
	}

