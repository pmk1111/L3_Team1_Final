package com.naver.myhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.Project;
import com.naver.myhome.mybatis.mapper.ProjectMapper;

@Service
public class ProjectServiceImpl implements ProjectService {
	
	private ProjectMapper mapper;
	
	@Autowired
	public ProjectServiceImpl(ProjectMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public int insertProject(Project project) {
		return mapper.Insert(project);
	}
	
	@Override
	public List<Project> getAllProjectList() {
		return mapper.getAllProjectList();
	}
	
	@Override
	public List<Project> getFavoritProjectList(int employeeNum) {
		return mapper.getFavoritProjectList(employeeNum);
	}

	@Override
	public List<Project> getPartProjectList(int employeeNum) {
		return mapper.getPartProjectList(employeeNum);
	}
	
	@Override
	public Project getDetail(int num) {
		return mapper.getDetail(num);
	}
	
	@Override
	public int updateColor(int num, String color) {
		return mapper.updateColor(num, color);
	}

	@Override
	public Integer checkFavorite(int projectNum, int employeeNum) {
		return mapper.checkFavorite(projectNum, employeeNum);
	}

	@Override
	public void addFavorite(int projectNum, int employeeNum) {
		mapper.addFavorite(projectNum, employeeNum);
	}

	@Override
	public void removeFavorite(int projectNum, int employeeNum) {
		mapper.removeFavorite(projectNum, employeeNum);
	}

}
