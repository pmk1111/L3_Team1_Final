package com.naver.myhome.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.Bookmark;

@Mapper
public interface BookmarkMapper {

	int addBookmark(int userId, int issueId);

	int deleteBookmark(int userId, int issueId);

	int checkBookmark(int userId, int issueId);
	
	int countBookmark(int userId);
	
	List<Bookmark> getBookmarkList(int userId);

}
