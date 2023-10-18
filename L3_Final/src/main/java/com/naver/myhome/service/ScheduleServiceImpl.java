package com.naver.myhome.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.mybatis.mapper.ScheduleMapper;

@Service
public class ScheduleServiceImpl implements ScheduleService{

	private ScheduleMapper mapper;
	
	@Autowired
	public ScheduleServiceImpl(ScheduleMapper mapper) {
		this.mapper = mapper;
	}
	

	@Override
	public void insertSchedule(Map<String, Object> map) {
		Map<String, String> paramMap = new HashMap<String, String>();
//		 
		paramMap.put("scheduleId", (String)map.get("scheduleId"));
		paramMap.put("scheduleUserId", (String)map.get("scheduleUserId"));
		paramMap.put("scheduleSubject", (String)map.get("eventTitle"));
		paramMap.put("scheduleStartDate", (String)map.get("eventStartDate"));
		paramMap.put("scheduleEndDate", (String)map.get("eventEndDate"));
		paramMap.put("scheduleCategory", (String)map.get("eventCategory"));
		paramMap.put("schedulePlace", (String)map.get("eventLocation"));
		paramMap.put("scheduleContent", (String)map.get("eventDescription"));
		 
		 mapper.insertSchedule(paramMap);
		
	}
	
	
}
