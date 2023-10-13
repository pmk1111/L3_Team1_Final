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
	
	public List<Project> getFavoritProjectList(int employeeNum);
	
	public List<Project> getPartProjectList(int employeeNum);
	
	public Project getDetail(int num);
	
	public int updateColor(int num, String color);

	public Integer checkFavorite(int projectNum, int employeeNum);

	public void addFavorite(int projectNum, int employeeNum);

	public void removeFavorite(int projectNum, int employeeNum);
}
