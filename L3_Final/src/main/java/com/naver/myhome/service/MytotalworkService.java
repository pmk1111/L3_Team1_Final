package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.Mytotalwork;

public interface MytotalworkService {

	public List<Mytotalwork> searchMyTotalWork(String searchtitle);

	public List<Mytotalwork> getMyTotalWorks();

}
