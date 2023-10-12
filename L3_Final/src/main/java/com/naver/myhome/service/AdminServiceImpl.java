package com.naver.myhome.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.Company;
import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;
import com.naver.myhome.mybatis.mapper.AdminMapper;
import com.naver.myhome.mybatis.mapper.UserMapper;

@Service
public class AdminServiceImpl implements AdminService {

	private AdminMapper dao;
	
	@Autowired
	public AdminServiceImpl(AdminMapper dao) {
		this.dao = dao;
	}

	@Override
	public Company company_info(String company_id) {
		
		return null;
	}
	
	@Override
	public List<Employee> findEmployee(String company_id){
		return dao.findEmployee(company_id);
	}

	@Override
	public int countEmployee(String company_id) {
		return dao.countEmployee(company_id);
	}

	@Override
	public List<Employee> stopEmployee(String company_id) {
		return dao.stopEmployee(company_id);
	}

	@Override
	public int countStopEmployee(String company_id) {
		return dao.countStopEmployee(company_id);
	}

	@Override
	public int stopEmployeeStatus(int employeeNo) {
		return dao.stopEmployeeStatus(employeeNo);
	}

	@Override
	public int noMoreAuth(int employeeNo) {
		return dao.noMoreAuth(employeeNo);
	}

	@Override
	public int addAuth(int employeeNo) {
		return dao.addAuth(employeeNo);
	}

	@Override
	public int useEmployeeStatus(int employeeNo) {
		return dao.useEmployeeStatus(employeeNo);
	}

	@Override
	public int addEmployee(int userid, String company_id, String company_invited) {
				return dao.addEmployee(userid, company_id, company_invited);
	}
	
	


}
