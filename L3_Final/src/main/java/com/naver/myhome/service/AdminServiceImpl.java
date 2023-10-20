package com.naver.myhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;
import com.naver.myhome.mybatis.mapper.AdminMapper;

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
	public int useEmployeeStatus(int employeeId) {
		return dao.useEmployeeStatus(employeeId);
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
	public List<User> waitUser(int companyId) {
		return dao.waitUser(companyId);
	}

	@Override
	public void approveUser(int userId, int companyId) {
		dao.approveUser(userId, companyId);
	}
	
	@Override
	public void addEmployee(int userId, int companyId) {
		dao.addEmployee(userId, companyId);
	}

	@Override
	public void rejectUser(int userId, int companyId) {
		dao.rejectUser(userId, companyId);
	}

	@Override
	public int stopEmployeeStatus(int employeeId) {
		return dao.stopEmpStatus(employeeId);
	}

	@Override
	public void updateAuth(int employeeId) {
		dao.updateAuth(employeeId);
	}

	@Override
	public int countUser(int companyId) {
		return dao.countUser(companyId);
	}
	
	@Override
	public int countStop(int companyId) {
		return dao.countStop(companyId);
	}

	@Override
	public int countEmp(int companyId) {
		return dao.countEmp(companyId);
	}

	@Override
	public List<Employee> getStopList(int companyId) {
		return dao.getStopList(companyId);
	}

	@Override
	public void backEmp(int empId) {
		dao.backEmp(empId);
	}
	
	

}
