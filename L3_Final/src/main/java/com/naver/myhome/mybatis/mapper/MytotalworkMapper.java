package com.naver.myhome.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.Mytotalwork;

@Mapper
public interface MytotalworkMapper {

	List<Mytotalwork> searchMyTotalWork(String searchtitle);

	List<Mytotalwork> getMyTotalWorks();

	

}
