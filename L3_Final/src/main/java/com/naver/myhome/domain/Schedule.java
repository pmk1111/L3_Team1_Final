package com.naver.myhome.domain;

import org.springframework.stereotype.Repository;

@Repository
public class Schedule {
	String schedule_id ;
	String schedule_user_id;
	String schedule_subject;
	String schedule_start_date;
	String schedule_end_date;
	String schedule_category;
	String schedule_place;
	String schedule_content;
	
	public String getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(String schedule_id) {
		this.schedule_id = schedule_id;
	}
	public String getSchedule_user_id() {
		return schedule_user_id;
	}
	public void setSchedule_user_id(String schedule_user_id) {
		this.schedule_user_id = schedule_user_id;
	}
	public String getSchedule_subject() {
		return schedule_subject;
	}
	public void setSchedule_subject(String schedule_subject) {
		this.schedule_subject = schedule_subject;
	}
	public String getSchedule_start_date() {
		return schedule_start_date;
	}
	public void setSchedule_start_date(String schedule_start_date) {
		this.schedule_start_date = schedule_start_date;
	}
	public String getSchedule_end_date() {
		return schedule_end_date;
	}
	public void setSchedule_end_date(String schedule_end_date) {
		this.schedule_end_date = schedule_end_date;
	}
	public String getSchedule_category() {
		return schedule_category;
	}
	public void setSchedule_category(String schedule_category) {
		this.schedule_category = schedule_category;
	}
	public String getSchedule_place() {
		return schedule_place;
	}
	public void setSchedule_place(String schedule_place) {
		this.schedule_place = schedule_place;
	}
	public String getSchedule_content() {
		return schedule_content;
	}
	public void setSchedule_content(String schedule_content) {
		this.schedule_content = schedule_content;
	}
	
}
