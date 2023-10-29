package com.naver.myhome.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.Bookmark;
import com.naver.myhome.mybatis.mapper.BookmarkMapper;



@Service
public class BookmarkServiceImpl implements BookmarkService {

	private BookmarkMapper dao;
	
	@Autowired
	public BookmarkServiceImpl(BookmarkMapper dao) {
		this.dao = dao;
	}

	@Override
	public int addBookmark(int userId, int issueId) {
		return dao.addBookmark(userId, issueId);
	}

	@Override
	public int deleteBookmark(int userId, int issueId) {
		return dao.deleteBookmark(userId, issueId);
	}

	@Override
	public int checkBookmark(int userId, int issueId) {
		return dao.checkBookmark(userId, issueId);
	}

	@Override
	public int countBookmark(int userId) {
		return dao.countBookmark(userId);
	}

	@Override
	public List<Bookmark> getBookmarkList(int userId) {
		return dao.getBookmarkList(userId);
	}

	


	
}
