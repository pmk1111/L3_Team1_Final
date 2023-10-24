package com.naver.myhome.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.naver.myhome.domain.Team;

@Mapper
@Repository
public interface TeamMapper {

	public void addTeam(int projectId, int employeeId);
	
	public int teamCount(int projectId);

	public List<Team> getTeam(int projectId, int sessionId);

	public List<Team> inviteTeam(int projectId);

    public List<Integer> findId(List<String> userNames);
    
    public void insertTeam(Map<String, Object> params);

	public void insertTeam(int empId, int projectId);

}
