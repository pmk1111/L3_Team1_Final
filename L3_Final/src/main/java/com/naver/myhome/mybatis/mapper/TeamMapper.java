package com.naver.myhome.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface TeamMapper {

	public void addTeam(int projectNum, int employeeNum);
	
	public int teamCount(int projectNum);
	
}
