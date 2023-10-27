package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.Bookmark;


public interface BookmarkService {

   public int addBookmark(int userId, int issueId);

   public int deleteBookmark(int userId, int issueId);

   public int checkBookmark(int userId, int issueId);

   public int countBookmark(int userId);

  // public List<Bookmark> getBookmarkList(int userId);

   public List<Bookmark> getSearchList(int userId, String search_word);



}