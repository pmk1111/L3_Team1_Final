package com.naver.myhome.domain;

import java.util.List;

public class Mytotalwork {
    private int ID; // 프로젝트 pk
    private String TITLE; // 프로젝트 title
 
	private String SUBJECT;

    private String STATUS;
    private int project_id; // 프로젝트 id
    private int user_id; // 유저 id
    private List<String> issues; // 이슈 목록
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public List<String> getIssues() {
		return issues;
	}
	public void setIssues(List<String> issues) {
		this.issues = issues;
	}
	   public String getSUBJECT() {
			return SUBJECT;
		}
		public void setSUBJECT(String sUBJECT) {
			SUBJECT = sUBJECT;
		}


}
