package com.naver.myhome.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.naver.myhome.domain.Project;

@Mapper
@Repository
public interface ProjectMapper {
	
	public int Insert(Project project);
	
	public List<Project> getAllProjectList();
	
	public List<Project> getFavoritProjectList(int employeeId);
	
	public List<Project> getPartProjectList(int employeeId);
	
	public Project getDetail(int id);
	
	public int updateColor(int id, String color);

	public Integer checkFavorite(int projectId, int employeeId);

	public void addFavorite(int projectId, int employeeId);

	public void removeFavorite(int projectId, int employeeId);

	public Integer getDoneCount(int projectId);

	public Integer getUpdateCount(int projectId);

	public Integer getCreateCount(int projectId);

	public Integer getCriticalCount(int projectId);

	public Integer todoCount(int projectId);

	public Integer progressCount(int projectId);

	public Integer allDoneCount(int projectId);

	public Integer resolveCount(int projectId);
	
	public Integer allCriticalCount(int projectId);

	public Integer highCount(int projectId);

	public Integer middleCount(int projectId);

	public Integer lowCount(int projectId);
}
