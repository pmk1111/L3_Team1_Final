package com.naver.myhome.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.Notify;


@Mapper
public interface NotifyMapper {

	

	public int existsNotifyWithName(int userid);
	
	public void createalarm(Notify notify);

	public void updatealarm(Notify notify);

}
