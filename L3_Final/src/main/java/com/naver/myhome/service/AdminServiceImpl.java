package com.naver.myhome.service;

import java.util.List;

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

}
