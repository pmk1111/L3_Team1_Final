package com.naver.myhome.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Memo {
	private int memo_id;
	private int user_id;
	private String memo_content;
	
	@Override
	public String toString() {
		return "Memo [memo_id=" + memo_id + ", user_id=" + user_id + ", memo_content=" + memo_content + "]";
	}
	
	
}
