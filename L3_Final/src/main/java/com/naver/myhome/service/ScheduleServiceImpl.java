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
		paramMap.put("schedule_id", (String)map.get("scheduleId"));
		paramMap.put("schedule_user_id", (String)map.get("scheduleUserId"));
		paramMap.put("schedule_subject", (String)map.get("eventTitle"));
		paramMap.put("schedule_start_date", (String)map.get("eventStartDate"));
		paramMap.put("schedule_end_date", (String)map.get("eventEndDate"));
		paramMap.put("schedule_category", (String)map.get("eventCategory"));
		paramMap.put("schedule_place", (String)map.get("eventLocation"));
		paramMap.put("schedule_content", (String)map.get("eventDescription"));
		 
		 mapper.insertSchedule(paramMap);
		
	}
	
	@Override
    public void modifySchedule(Map<String, Object> map){
        Map<String, String> paramMap = new HashMap<String, String>();
        
        paramMap.put("schedule_id", (String)map.get("scheduleId"));
		paramMap.put("schedule_user_id", (String)map.get("scheduleUserId"));
		paramMap.put("schedule_subject", (String)map.get("eventTitle"));
		paramMap.put("schedule_start_date", (String)map.get("eventStartDate"));
		paramMap.put("schedule_end_date", (String)map.get("eventEndDate"));
		paramMap.put("schedule_category", (String)map.get("eventCategory"));
		paramMap.put("schedule_place", (String)map.get("eventLocation"));
		paramMap.put("schedule_content", (String)map.get("eventDescription"));

        mapper.updateSchedule(paramMap);
    }

    @Override
    public void deleteSchedule(Map<String, Object> map){
        Map<String, String> paramMap = new HashMap<String, String>();
        
    	paramMap.put("schedule_user_id", (String)map.get("scheduleUserId"));
 
        mapper.deleteSchdule(paramMap);
   }
	
}
