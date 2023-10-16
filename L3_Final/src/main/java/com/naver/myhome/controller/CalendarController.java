package com.naver.myhome.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naver.myhome.service.ScheduleService;

@Controller
@RequestMapping(value = "/calendar")
public class CalendarController {

    @RequestMapping(value = "/calendar-list", method = RequestMethod.GET)
    public String addcalendar() {
        return "calendar/calendar-list";
    }
    @RequestMapping(value = "/calendar", method = RequestMethod.GET)
    public String calendar() {
        return "calendar/calendar";
    }
    @Autowired
    ScheduleService calendarService;

    @RequestMapping(value = "/save-schedule", method = RequestMethod.POST)
    @ResponseBody
    public Map < String, Object > saveSchedule(@RequestParam Map < String, Object > map) {

        Map < String, Object > response = new HashMap < String, Object > ();
        String testId = "superAdmin";

        LocalDateTime dt1 = LocalDateTime.now();
        String testScheduleId = testId + dt1.format(DateTimeFormatter.ofPattern("yyMMddHHmmss"));

        System.out.println("testId : " + testId);
        System.out.println("testScheduleId : " + testScheduleId);

        map.put("scheduleId", testScheduleId);
        map.put("scheduleUserId", testId);
        calendarService.insertSchedule(map);
        response.put("rsltCd", "0");
        response.put("scheduleTitle", (String) map.get("eventTitle"));
        response.put("scheduleStartDate", (String) map.get("eventStartDate"));
        response.put("scheduleEndDate", (String) map.get("eventEndDate"));

        return response;
    }

    @RequestMapping(value = "/modify-schedule", method = RequestMethod.POST)
    @ResponseBody
    public Map < String, Object > modifySchedule(@RequestParam Map < String, Object > map) {

        Map < String, Object > response = new HashMap < String, Object > ();
        String testId = "superAdmin";

        LocalDateTime dt1 = LocalDateTime.now();
        String testScheduleId = testId + dt1.format(DateTimeFormatter.ofPattern("yyMMddHHmmss"));

        System.out.println("testId : " + testId);
        System.out.println("testScheduleId : " + testScheduleId);

        map.put("scheduleId", testScheduleId);
        map.put("scheduleUserId", testId);
        calendarService.insertSchedule(map);
        response.put("rsltCd", "0");
        response.put("scheduleTitle", (String) map.get("eventTitle"));
        response.put("scheduleStartDate", (String) map.get("eventStartDate"));
        response.put("scheduleEndDate", (String) map.get("eventEndDate"));

        return response;
    }
    @RequestMapping(value = "/remove-schedule", method = RequestMethod.POST)
    @ResponseBody
    public Map < String, Object > removeSchedule(@RequestParam String scheduleId) {
        // 일정 삭제 로직

        String testId = "superAdmin";

        Map < String, Object > map = new HashMap < > ();
        map.put("scheduleId", scheduleId);
        map.put("scheduleUserId", testId);

        calendarService.deleteSchedule(map);

        Map < String, Object > response = new HashMap < > ();
        response.put("rsltCd", "0");

        return response;
    }

}