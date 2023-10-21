package com.naver.myhome.mybatis.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.User;

@Mapper
public interface UserMapper {

		public User isEmail(String username);
		
		public int insert(User user);

		public User selectByMail(String eMail);

		public int getUserId(String eMail);

		//지니
		public int update(User user);

		public User isId(String email);
		
		public void updatePwd(String email, String newPwd);

		public String checkPwd(String email);


		//지니 끝



	}


//지니끝


