package com.naver.myhome.domain;

public class Mytotalwork {

	private int num; //프로젝트 pk
    private int issue_id; //issue id
    private String title; //project title
    private String issue_status;
	private String issue_subject;//issue title
	private int project_id;
	private int user_id;//유저 id
	
	   public int getProject_id() {
			return project_id;
		}
		public void setProject_id(int project_id) {
			this.project_id = project_id;
		}
    
    public String getIssue_status() {
  		return issue_status;
  	}
  	public void setIssue_status(String issue_status) {
  		this.issue_status = issue_status;
  	}
    
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getIssue_id() {
		return issue_id;
	}
	public void setIssue_id(int issue_id) {
		this.issue_id = issue_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIssue_subject() {
		return issue_subject;
	}
	public void setIssue_subject(String issue_subject) {
		this.issue_subject = issue_subject;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
    
	
}
