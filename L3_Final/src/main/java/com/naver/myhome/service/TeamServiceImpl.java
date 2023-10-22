package com.naver.myhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.Team;
import com.naver.myhome.mybatis.mapper.TeamMapper;

@Service
public class TeamServiceImpl implements TeamService {
	
	private TeamMapper mapper;
	
	@Autowired
	public TeamServiceImpl(TeamMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public void addTeam(int projectId, int employeeId) {
		mapper.addTeam(projectId, employeeId);
	}
	
	@Override
	public int teamCount(int projectId){
		return mapper.teamCount(projectId);
	}

	@Override
	public List<Team> getTeam(int projectId, int sessionId) {
		return mapper.getTeam(projectId, sessionId);
	}

	
}
