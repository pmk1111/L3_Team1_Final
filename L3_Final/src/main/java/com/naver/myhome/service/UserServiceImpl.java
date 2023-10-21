package com.naver.myhome.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.User;
import com.naver.myhome.mybatis.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	private final SqlSession sqlSession;
	
	private UserMapper dao;
	
	
	@Autowired
	public UserServiceImpl(UserMapper dao, SqlSession sqlSession) {
		this.dao = dao;
		this.sqlSession = sqlSession;
	}
	//지니
	
	@Override
	public int isId(String email) {
		User ruser = dao.isId(email);
		return (ruser == null) ? -1 : 1;
	}

	@Override
	public int update(User user) {
		return dao.update(user);
	}

	@Override
	public User userInfo(String email) {
		return dao.isId(email);
	}
	
	@Override
	public String checkPwd(String email) {
		return dao.checkPwd(email);
	}



	@Override
	public void updatePwd(String email, String newPwd) {
	 dao.updatePwd(email, newPwd);
		
	}

	//지니 끝
	
//	@Override
//	public int isId(String id, String pass) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
	
	
//
	@Override
	public int insert(User user) {
		
		return dao.insert(user);
	}
	

	@Override
	public User selectByMail(String eMail) {
		// TODO Auto-generated method stub
		return dao.selectByMail(eMail);
	}

	@Override
	public int getUserId(String eMail) {
		// TODO Auto-generated method stub
		return dao.getUserId(eMail);
	}
	
	



}
