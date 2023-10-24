package com.naver.myhome.service;

import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;

public interface EmployeeService {
	//주영START
	public Employee getEmplyeeInfoById(User user);
	public int insert(Employee employee);
	//주영END
}
