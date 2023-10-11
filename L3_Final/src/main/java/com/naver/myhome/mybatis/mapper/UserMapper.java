package com.naver.myhome.mybatis.mapper;


import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;

@Mapper
public interface UserMapper {
	

		

		public List<User> getSearchList(Map<String, Object> map);

		public List<User> finduser(String company_invited);

		public int countuser(String company_invited);

		public int approveuser(String company_invited);

		public int rejectuser(String company_invited);

	

	}

