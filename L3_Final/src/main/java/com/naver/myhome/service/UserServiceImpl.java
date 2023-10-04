package com.naver.myhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.User;
import com.naver.myhome.mybatis.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	private UserMapper dao;
	
	@Autowired
	public UserServiceImpl(UserMapper dao) {
		this.dao = dao;
	}
	@Override
	public int isId(String id) {
		User ruser = dao.isId(id);
		return (ruser == null) ? -1 : 1;
	}
	@Override
	public int isId(String id, String pass) {
		User dbuser = dao.isId(id);
		int result = -1;
		if(dbuser !=null) {
			result = 1;
		} else 
			result = 0;
	
	return result;
}
	@Override
	public int insert(User user) {
		
		return dao.insert(user);
	}


	@Override
	public User user_info(String id) {
		// TODO Auto-generated method stub
		return dao.isId(id);
	}

	@Override
	public void delete(String id) {
		dao.delete(id);
		
	}

	@Override
	public int update(User user) {
    	return	dao.update(user);
		
	}

	@Override
	public List<User> getSearchList(int index, String search_word, int page, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getSearchListCount(int index, String search_word) {
		// TODO Auto-generated method stub
		return 0;
	}

}
