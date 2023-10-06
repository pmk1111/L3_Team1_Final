package com.naver.myhome.domain;

import org.springframework.web.multipart.MultipartFile;

public class Issue {
	private int issue_id;
	private int project_id;
	private String create_user;
	private String issue_type;
	private String issue_priority;
	private String issue_subject;
	private String issue_content;
	private String issue_status;
	private String issue_reporter;
	private String issue_assigned;
	private String issue_file;
	private String issue_created;
	
	public String getIssue_priority() {
		return issue_priority;
	}
	public void setIssue_priority(String issue_priority) {
		this.issue_priority = issue_priority;
	}
	public int getIssue_id() {
		return issue_id;
	}
	public void setIssue_id(int issue_id) {
		this.issue_id = issue_id;
	}
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	public String getCreate_user() {
		return create_user;
	}
	public void setCreate_user(String create_user) {
		this.create_user = create_user;
	}
	public String getIssue_type() {
		return issue_type;
	}
	public void setIssue_type(String issue_type) {
		this.issue_type = issue_type;
	}
	public String getIssue_subject() {
		return issue_subject;
	}
	public void setIssue_subject(String issue_subject) {
		this.issue_subject = issue_subject;
	}
	public String getIssue_content() {
		return issue_content;
	}
	public void setIssue_content(String issue_content) {
		this.issue_content = issue_content;
	}
	public String getIssue_status() {
		return issue_status;
	}
	public void setIssue_status(String issue_status) {
		this.issue_status = issue_status;
	}
	public String getIssue_reporter() {
		return issue_reporter;
	}
	public void setIssue_reporter(String issue_reporter) {
		this.issue_reporter = issue_reporter;
	}
	public String getIssue_assigned() {
		return issue_assigned;
	}
	public void setIssue_assigned(String issue_assigned) {
		this.issue_assigned = issue_assigned;
	}
	public String getIssue_file() {
		return issue_file;
	}
	public void setIssue_file(String issue_file) {
		this.issue_file = issue_file;
	}
	public String getIssue_created() {
		return issue_created;
	}
	public void setIssue_created(String issue_created) {
		this.issue_created = issue_created.substring(0, 10);
	}
	
	
}
