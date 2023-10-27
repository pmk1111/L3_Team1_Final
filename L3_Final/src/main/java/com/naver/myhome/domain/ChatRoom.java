package com.naver.myhome.domain;

import lombok.Data;

@Data
public class ChatRoom {
	private int id;
	private int create_by;
	private int participant;
	private String resent_content;
	private String created_at;
	private String updated_at;
}
