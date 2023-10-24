package com.naver.myhome.service;

import com.naver.myhome.domain.Notify;


public interface NotifyService {

	public void createalarm(Notify notify);


	public void updatealarm(Notify notify);

	public int existsNotifyWithName(int userid);

	
}
