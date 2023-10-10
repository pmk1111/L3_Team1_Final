package com.naver.myhome.mybatis.mapper;


import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;

@Mapper
public interface AdminMapper {
	

	
		
		public List<Employee> findEmployee(String company_id);

		public int countEmployee(String company_id);

		public List<Employee> getSearchList(Map<String, Object> map);

		public List<Employee> stopEmployee(String company_id);

		public int countStopEmployee(String company_id);

		public int stopEmployeeStatus(int employeeNo);

		public int noMoreAuth(int employeeNo);

		public int addAuth(int employeeNo);

		public int useEmployeeStatus(int employeeNo);

	//	public int getSearchListCount(Map<String, String> map);

	}

