package com.naver.myhome.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.Bookmark;

@Mapper
public interface BookmarkMapper {

   public int addBookmark(int userId, int issueId);

   public int deleteBookmark(int userId, int issueId);

   public int checkBookmark(int userId, int issueId);
   
   public int countBookmark(int userId);
   
  // public List<Bookmark> getBookmarkList(int userId);

   public List<Bookmark> getSearchList(Map<String, Object> map);

}