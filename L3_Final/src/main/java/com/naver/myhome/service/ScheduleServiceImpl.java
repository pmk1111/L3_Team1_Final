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
		paramMap.put("id", (String)map.get("id"));
		paramMap.put("user_id", (String)map.get("user_id"));
		paramMap.put("subject", (String)map.get("subject"));
		paramMap.put("start_date", (String)map.get("start_date"));
		paramMap.put("end_date", (String)map.get("end_date"));
		paramMap.put("category", (String)map.get("category"));
		paramMap.put("place", (String)map.get("place"));
		paramMap.put("content", (String)map.get("content"));
		 
		mapper.insertSchedule(paramMap);
		
	}
	
	
}
