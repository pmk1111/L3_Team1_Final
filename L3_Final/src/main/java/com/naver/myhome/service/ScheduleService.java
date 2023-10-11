package com.naver.myhome.service;

import java.util.Map;

public interface ScheduleService {

	void insertSchedule(Map<String, Object> map);
	
	void modifySchedule(Map<String, Object> map);

	void deleteSchedule(Map<String, Object> map);
}
