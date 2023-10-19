package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.User;

public interface UserService {
	
//	public int isId(String id, String pass);
//
	public int insert(User user);
//
//	public int isId(String id);
//
//	public User user_info(String id);
//
//	public void delete(String id);
//
//	public int update(User m);
//
//	public List<User> getSearchList(int index, String search_word, int page, int limit);
//
//	public int getSearchListCount(int index, String search_word);


	//지니
	public List<User> findUser(int companyInvited);

	public int countUser( int companyInvited);

	public int approveUser(int userId);

	public int rejectUser(int userId);

	//지니 끝

}
