package com.naver.myhome.controller;

import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naver.myhome.domain.Schedule;
import com.naver.myhome.service.ScheduleService;
import com.naver.myhome.service.UserService;

@Controller
@RequestMapping(value = "/calendar")
public class CalendarController {
	
	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	UserService userService;
	ScheduleService scheduleService;
	
	
    @Autowired
    public CalendarController(UserService userService, ScheduleService scheduleService) {
    	this.userService = userService;
    	this.scheduleService = scheduleService;
    }

    @GetMapping("/calendar-list")
    public String addcalendar() {
        return "calendar/calendar-list";
    }
    @GetMapping("/calendar")
    public String calendar() {
        return "calendar/calendar";
    }

    @PostMapping("/create-schedule")
    @ResponseBody
    public Map < String, Object > saveSchedule(@RequestParam Map < String, Object > map,
    											Principal principal, Schedule schedule) {

//    	String userEmail = principal.getName();
//    	int userId = userService.getUserId(userEmail);
//    	
//    	schedule.setId(userId);
    	schedule.setId(1);
    	
        Map < String, Object > response = new HashMap < String, Object > ();
        String testId = "superAdmin";

        LocalDateTime dt1 = LocalDateTime.now();
        String testScheduleId = testId + dt1.format(DateTimeFormatter.ofPattern("yyMMddHHmmss"));

        System.out.println("testId : " + testId);
        System.out.println("testScheduleId : " + testScheduleId);

        map.put("scheduleId", testScheduleId);
        map.put("scheduleUserId", testId);
        scheduleService.insertSchedule(map);
        response.put("rsltCd", "0");
        response.put("scheduleTitle", (String) map.get("eventTitle"));
        response.put("scheduleStartDate", (String) map.get("eventStartDate"));
        response.put("scheduleEndDate", (String) map.get("eventEndDate"));

        return response;
    }



}