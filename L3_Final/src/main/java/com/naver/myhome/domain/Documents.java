package com.naver.myhome.domain;

import lombok.Data;

@Data
public class Documents  {
	private String original_name;
	private long file_size;
	private int create_user;
	private String created_at;
}
