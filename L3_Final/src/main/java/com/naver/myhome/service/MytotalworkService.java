package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.Mytotalwork;

public interface MytotalworkService {

	

	public List<Mytotalwork> getMyTotalWorks();

	public List<Mytotalwork> getSearchList(String search_word);

}
