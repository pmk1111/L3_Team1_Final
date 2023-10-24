package com.naver.myhome.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.Notify;
import com.naver.myhome.mybatis.mapper.NotifyMapper;


@Service
public class NotifyServiceImpl implements NotifyService{
	
	private NotifyMapper dao;
	
	
	@Autowired
	public NotifyServiceImpl(NotifyMapper dao) {
		this.dao = dao;

	}
	
	@Override
	public void createalarm(Notify notify) {
		dao.createalarm(notify);
		
	}

	@Override
	public int existsNotifyWithName(int userid) {
		// TODO Auto-generated method stub
		
		return dao.existsNotifyWithName(userid);
	}

	@Override
	public void updatealarm(Notify notify) {
		// TODO Auto-generated method stub
		dao.updatealarm(notify);
	}

	





}
