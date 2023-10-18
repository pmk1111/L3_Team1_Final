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
	public List<Project> getFavoritProjectList(int employeeId) {
		return mapper.getFavoritProjectList(employeeId);
	}

	@Override
	public List<Project> getPartProjectList(int employeeId) {
		return mapper.getPartProjectList(employeeId);
	}
	
	@Override
	public Project getDetail(int id) {
		return mapper.getDetail(id);
	}
	
	@Override
	public int updateColor(int id, String color) {
		return mapper.updateColor(id, color);
	}

	@Override
	public Integer checkFavorite(int projectId, int employeeId) {
		return mapper.checkFavorite(projectId, employeeId);
	}

	@Override
	public void addFavorite(int projectId, int employeeId) {
		mapper.addFavorite(projectId, employeeId);
	}

	@Override
	public void removeFavorite(int projectId, int employeeId) {
		mapper.removeFavorite(projectId, employeeId);
	}

}
