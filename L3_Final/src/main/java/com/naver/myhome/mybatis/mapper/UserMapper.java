package com.naver.myhome.mybatis.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.MentionUser;
import com.naver.myhome.domain.User;

@Mapper
public interface UserMapper {

		public List<User> findUser(int companyInvited);

		public User isId(String UserEmail);

		public User isEmail(String username);
		
		public int insert(User user);

		public User selectByMail(String eMail);

		public int getUserId(String eMail);

		



		public List<MentionUser> mentionUser(String requestData);

	}

