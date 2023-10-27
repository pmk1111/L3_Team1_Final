package com.naver.myhome.domain;

import lombok.Data;

@Data
public class RecentStatus {
	
	private String TABLE_NAME;
	private String CHANGE_TYPE;
	
	private String INVITED_USER;
	private String UPDATE_DATA;
	private String MASTER;
	
}