package com.naver.myhome.service;

import java.util.List;
import java.util.Map;

import com.naver.myhome.domain.User;

public interface UserService {
	
//	public int isId(String id, String pass);
//
	public int insert(User user);
//
//	public void delete(String id);
//
//	public List<User> getSearchList(int index, String search_word, int page, int limit);
//
//	public int getSearchListCount(int index, String search_word);

	public int getUserId(String eMail);

	public User selectByMail(String eMail);

	// 지니
	
	public User userInfo(String email);

	public int isId(String email);

	public void updatePwd(String email, String newPwd);

	public int checkPwd(String usedPwd, String email);

	public int update(User user);

	public void delete(String email);
	
	//지니 끝


}
