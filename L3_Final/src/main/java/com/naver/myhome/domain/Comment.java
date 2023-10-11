package com.naver.myhome.domain;

public class Comment {
	private int comment_id;
	private int issue_id;
	private String comment_created;
	private String comment_user_name;
	private String comment_content;
	
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public int getIssue_id() {
		return issue_id;
	}
	public void setIssue_id(int issue_id) {
		this.issue_id = issue_id;
	}
	public String getComment_created() {
		return comment_created;
	}
	public void setComment_created(String comment_created) {
		this.comment_created = comment_created;
	}
	public String getComment_user_name() {
		return comment_user_name;
	}
	public void setComment_user_name(String comment_user_name) {
		this.comment_user_name = comment_user_name;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	
	@Override
	public String toString() {
		return "Comment [comment_id=" + comment_id + ", issue_id=" + issue_id + ", comment_created=" + comment_created
				+ ", comment_user_name=" + comment_user_name + ", comment_content=" + comment_content + "]";
	}
	
	
}
