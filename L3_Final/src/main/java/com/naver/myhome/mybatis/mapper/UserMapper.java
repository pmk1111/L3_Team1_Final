package com.naver.myhome.mybatis.mapper;


import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;

@Mapper
public interface UserMapper {
	

		

		public List<User> finduser(String company_invited);

		public int countuser(String company_invited);

		public int approveuser(int userid);

		public int rejectuser(int userid);

		public User isId(String UserEmail);

		public User isEmail(String username);
		
		public int insert(User user);

	}

