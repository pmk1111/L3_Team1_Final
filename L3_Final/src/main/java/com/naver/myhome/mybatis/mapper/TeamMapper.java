package com.naver.myhome.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface TeamMapper {

	public void addTeam(int projectId, int employeeId);
	
	public int teamCount(int projectId);
	
}
