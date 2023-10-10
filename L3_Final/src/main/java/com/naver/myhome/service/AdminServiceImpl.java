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
	public List<Employee> getSearchList(int index, String search_word, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		//http://localhost:8088/myhome4/member/list로 접속하는 경우
		//select를 선택ㅎ사지 않아 index는 "-1"의 값을 갖습니다.
		//이 경우 아래의 문장을 수행하지 않기 때문에 "search_field"키에 대한
		//map.get("search_field")의 값은 null이 됩니다.
		if(index!=-1) {
			String[] search_field = new String[] {"id","name","age","gender"};
			map.put("search_field",  search_field[index]);
			map.put("search_word","%"+search_word+"%");
		}
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getSearchList(map);
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
	
//	@Override
//	public int getSearchListCount(int index, String search_word) {
//		Map<String, String> map = new HashMap<String, String>();
//		if(index!=-1) {
//			String[] search_field = new String[] {"id", "name", "age", "gender"};
//			map.put("search_field", search_field[index]);
//			map.put("search_word","%"+search_word+"%");
//		}
//		return dao.getSearchListCount(map);
//	}


}
