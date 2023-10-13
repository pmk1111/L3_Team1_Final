package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.Project;

public interface ProjectService {
	
	public int insertProject(Project project);
	
	public List<Project> getAllProjectList();
	
	public List<Project> getFavoritProjectList(int employeeNum);

	public List<Project> getPartProjectList(int employeeNum);

	public Project getDetail(int num);
	
	public int updateColor(int num, String color);

	public Integer checkFavorite(int projectNum, int employeeNum);

	public void addFavorite(int projectNum, int employeeNum);

	public void removeFavorite(int projectNum, int employeeNum);

}
