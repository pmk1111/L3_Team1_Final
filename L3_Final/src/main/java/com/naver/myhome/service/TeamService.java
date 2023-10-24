package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.Team;

public interface TeamService {

	public void addTeam(int projectId, int employeeId);
	
	public int teamCount(int projectId);

	public List<Team> getTeam(int projectId, int sessionId);
	
}
