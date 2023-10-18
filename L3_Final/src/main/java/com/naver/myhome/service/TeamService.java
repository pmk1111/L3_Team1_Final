package com.naver.myhome.service;

public interface TeamService {

	public void addTeam(int projectId, int employeeId);
	
	public int teamCount(int projectId);
	
}
