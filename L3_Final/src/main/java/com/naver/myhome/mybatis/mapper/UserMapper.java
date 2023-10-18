package com.naver.myhome.mybatis.mapper;


import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;

@Mapper
public interface UserMapper {
	

		

		public List<User> findUser(int companyInvited);

		public int countUser(int companyInvited);

		public int approveUser(int userId);

		public int rejectUser(int userId);

	

	}

