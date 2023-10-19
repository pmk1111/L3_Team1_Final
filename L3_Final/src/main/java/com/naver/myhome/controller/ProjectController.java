package com.naver.myhome.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.myhome.domain.Access;
import com.naver.myhome.domain.Project;
import com.naver.myhome.service.ProjectService;
import com.naver.myhome.service.TeamService;

@Controller
@RequestMapping(value = "/project")
public class ProjectController {
	
	// JJ's Controller
	private ProjectService projectService;
	private TeamService teamService;
	
	@Autowired
	public ProjectController(ProjectService projectService, TeamService teamService) {
		this.projectService = projectService;
		this.teamService = teamService;
	}
	
	@GetMapping(value = "/gantt-chart")
	public String projectGanttChart() {
		return "project/gantt-chart";
	}
	
	@GetMapping(value = "/create-project") // board/write
	public String createProject() {
		return "project/create-project";
	}
	
	@PostMapping(value = "/create")
	@Transactional
	public String create(Project project) throws Exception {
	    projectService.insertProject(project);

	    int projectId = project.getID();
	    int employeeId = 1;

	    teamService.addTeam(projectId, employeeId);

	    return "redirect:project-list";
	}
    
	@GetMapping(value = "/project-list")
	public ModelAndView projectList(ModelAndView mv) {
		
		int employeeId = 1;
		
	    List<Project> favoritProjectList = projectService.getFavoritProjectList(employeeId);
	    List<Project> partProjectList = projectService.getPartProjectList(employeeId);
		
	    mv.setViewName("project/project-list");
	    mv.addObject("favoritProjectList", favoritProjectList);
	    mv.addObject("partProjectList", partProjectList);
	    
	    return mv;
	    
	}
	
	@ResponseBody
	@GetMapping(value = "/part-tabs")
	public Map<String, List<Project>> getPartTabs() {
		
		int employeeId = 1;
		
	    List<Project> favoritProjectList = projectService.getFavoritProjectList(employeeId);
	    List<Project> partProjectList = projectService.getPartProjectList(employeeId);
	    
	    Map<String, List<Project>> data = new HashMap<>();
	    data.put("favoritProjectList", favoritProjectList);
	    data.put("partProjectList", partProjectList);
	    
	    
		return data;
	}
	
	@ResponseBody	
	@GetMapping(value = "/all-tabs")
	public List<Project> getAllTabs() {
		
	    List<Project> data = projectService.getAllProjectList();
	    
		return data;
	}
	
	@ResponseBody
	@GetMapping("/participate")
	public Integer favoritCheck(@RequestParam(name="projectId", required=true) int projectId,
	                            @RequestParam(name="employeeId", required=true) int employeeId) {
	    
	    Integer result = projectService.checkFavorite(projectId, employeeId);
	    
	    return result == null ? -1 : result;
	}
	
	@ResponseBody
	@PostMapping("/favorite")
	public Integer toggleFavorite(@RequestParam(name = "projectId", required = true) int projectId,
								  @RequestParam(name = "employeeId", required = true) int employeeId) {

		Integer result = projectService.checkFavorite(projectId, employeeId);

		if (result == null) {
			projectService.addFavorite(projectId, employeeId);
			return 1;
		} else {
			projectService.removeFavorite(projectId, employeeId);
			return -1;
		}
	}
	
	@GetMapping(value = "/project")
	public ModelAndView projectBoard
	(int id, ModelAndView mv, HttpServletResponse response) {
		
		Project project = projectService.getDetail(id);
		
	    Cookie cookie = new Cookie("id", String.valueOf(id));
	    response.addCookie(cookie);
		
		mv.setViewName("project/project-board");
	    mv.addObject("project", project);
	      
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/update-color")
	public void updateColor(@RequestParam(name="color", required=false) String color,
	                        @RequestParam(name="id", required=true) int id){
		projectService.updateColor(id, color);
		
	}
	
	// JJ's Controller End
	

}
