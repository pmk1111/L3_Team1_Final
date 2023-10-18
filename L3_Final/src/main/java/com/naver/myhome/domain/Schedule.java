package com.naver.myhome.domain;

import org.springframework.stereotype.Repository;

@Repository
public class Schedule {
	String scheduleId ;
	String scheduleUserId;
	String scheduleSubject;
	String scheduleStartDate;
	String scheduleEndDate;
	String scheduleCategory;
	String schedulePlace;
	String scheduleContent;
	
	public String getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(String scheduleId) {
		this.scheduleId = scheduleId;
	}
	public String getScheduleUserId() {
		return scheduleUserId;
	}
	public void setScheduleUserId(String scheduleUserId) {
		this.scheduleUserId = scheduleUserId;
	}
	public String getScheduleSubject() {
		return scheduleSubject;
	}
	public void setScheduleSubject(String scheduleSubject) {
		this.scheduleSubject = scheduleSubject;
	}
	public String getScheduleStartDate() {
		return scheduleStartDate;
	}
	public void setScheduleStartDate(String scheduleStartDate) {
		this.scheduleStartDate = scheduleStartDate;
	}
	public String getScheduleEndDate() {
		return scheduleEndDate;
	}
	public void setScheduleEndDate(String scheduleEndDate) {
		this.scheduleEndDate = scheduleEndDate;
	}
	public String getScheduleCategory() {
		return scheduleCategory;
	}
	public void setScheduleCategory(String scheduleCategory) {
		this.scheduleCategory = scheduleCategory;
	}
	public String getSchedulePlace() {
		return schedulePlace;
	}
	public void setSchedulePlace(String schedulePlace) {
		this.schedulePlace = schedulePlace;
	}
	public String getScheduleContent() {
		return scheduleContent;
	}
	public void setScheduleContent(String scheduleContent) {
		this.scheduleContent = scheduleContent;
	}
	
	
	
}
