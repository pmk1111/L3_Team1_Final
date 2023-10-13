package com.naver.myhome.mybatis.mapper;


import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.Company;
import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;

@Mapper
public interface AdminMapper {
	

	
		
		public List<Employee> findEmployee(String company_id);

		public int countEmployee(String company_id);

		public List<Employee> stopEmployee(String company_id);

		public int countStopEmployee(String company_id);

		public int stopEmployeeStatus(int employeeNo);

		public int noMoreAuth(int employeeNo);

		public int addAuth(int employeeNo);

		public int useEmployeeStatus(int employeeNo);

		public int addEmployee(int user_id, String company_id, String company_invited);

		public Company companyInfo(String company_id);

		public int updateCompanyName(String company_id);


	}

