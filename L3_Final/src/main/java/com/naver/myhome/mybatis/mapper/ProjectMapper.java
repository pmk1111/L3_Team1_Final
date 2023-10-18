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
}
