package com.naver.myhome.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Schedule {
	int id ;
	int user_id;
	String subject;
	String start_date;
	String end_date;
	String category;
	String place;
	String content;
}
