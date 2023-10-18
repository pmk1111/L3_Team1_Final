package com.naver.myhome.service;

import java.util.List;

import org.apache.catalina.mapper.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.Mytotalwork;
import com.naver.myhome.mybatis.mapper.MytotalworkMapper;

@Service
public class MytotalworkServiceImpl implements MytotalworkService{
	
	private MytotalworkMapper dao;
	
	@Autowired
	public MytotalworkServiceImpl (MytotalworkMapper dao) {
		this.dao  = dao;
	}

	
	@Override
	public List<Mytotalwork> getMyTotalWorks() {
		// TODO Auto-generated method stub
		return dao.getMyTotalWorks();
	}



	@Override
	public List<Mytotalwork> getSearchList(String search_word) {
		// TODO Auto-generated method stub
		return dao.getSearchList(search_word);
	}



}
