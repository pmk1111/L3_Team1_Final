package com.naver.myhome.mybatis.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.User;

@Mapper
public interface UserMapper {


		public List<User> findUser(int companyInvited);



		public User isEmail(String username);
		
		public int insert(User user);

		public int selectByMail(String eMail);

		public int getUserId(String eMail);


		public User getEmplyeeInfoById(User user);

		public int updateUserInfo(User user);
		
		//지니
		public User isId(String email);
		
		public int update(User user);


		public void updatePwd(String email, String newPwd);

		public int checkPwd(String usedPwd, String email);

		public void delete(String email);


	}


//지니끝


