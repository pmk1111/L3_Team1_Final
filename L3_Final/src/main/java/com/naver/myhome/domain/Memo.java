package com.naver.myhome.domain;

public class Memo {
	private int memo_id;
	private int user_id;
	private String memo_content;
	
	public int getMemo_id() {
		return memo_id;
	}
	public void setMemo_id(int memo_id) {
		this.memo_id = memo_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getMemo_content() {
		return memo_content;
	}
	public void setMemo_content(String memo_content) {
		this.memo_content = memo_content;
	}
	
	@Override
	public String toString() {
		return "Memo [memo_id=" + memo_id + ", user_id=" + user_id + ", memo_content=" + memo_content + "]";
	}
	
	
}
