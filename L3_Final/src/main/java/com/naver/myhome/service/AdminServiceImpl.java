package com.naver.myhome.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.Access;
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

	//구성원 관리
//	@Override
//	public Company companyInfo(int companyId) {
//		
//		return dao.companyInfo(companyId);
//	}
	
	@Override
	public String companyName(int companyId) {
		// TODO Auto-generated method stub
		return dao.companyName(companyId);
	}

	@Override
	public String companyDomain(int companyId) {
		// TODO Auto-generated method stub
		return dao.companyDomain(companyId);
	}
	
	
	@Override
	public List<Employee> findEmployee(int companyId){
		return dao.findEmployee(companyId);
	}

	@Override
	public int countEmployee(int companyId) {
		return dao.countEmployee(companyId);
	}

	@Override
	public List<Employee> stopEmployee(int companyId) {
		return dao.stopEmployee(companyId);
	}

	@Override
	public int countStopEmployee(int companyId) {
		return dao.countStopEmployee(companyId);
	}

	@Override
	public int stopEmployeeStatus(int employeeId) {
		return dao.stopEmployeeStatus(employeeId);
	}

	@Override
	public int noMoreAuth(int employeeId) {
		return dao.noMoreAuth(employeeId);
	}

	@Override
	public int addAuth(int employeeId) {
		return dao.addAuth(employeeId);
	}

	@Override
	public int useEmployeeStatus(int employeeId) {
		return dao.useEmployeeStatus(employeeId);
	}

	@Override
	public int addEmployee(int userId, int companyId) {
				return dao.addEmployee(userId, companyId);
	}

	//회사정보 수정
	@Override
	public int updateName(int companyId,String companyName) {
		return dao.updateName(companyId, companyName);
	}

	@Override
	public int updateDomain(int companyId, String companyDomain) {
		return dao.updateDomain(companyId, companyDomain);
	}

	@Override
	public List<Access> getAccesslist() {
		// TODO Auto-generated method stub
		return dao.getAccesslist();
	}

	@Override
	public List<Access> getDayCount() {
		// TODO Auto-generated method stub
		return dao.getDayCount();
	}

	@Override
	public List<Access> getMonthCount() {
		// TODO Auto-generated method stub
		return dao.getMonthCount();
	}

		


}
