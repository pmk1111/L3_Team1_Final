package com.naver.myhome.controller;

import java.util.List;

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
	
	@GetMapping(value = "/create")
	@Transactional
	public String create(Project project) throws Exception {
	    projectService.insertProject(project);

	    int projectNum = project.getNUM();
	    int employeeNum = 1;

	    teamService.addTeam(projectNum, employeeNum);

	    return "redirect:project-list";
	}
    
	@GetMapping(value = "/project-list")
	public ModelAndView projectList(ModelAndView mv) {
		
		int employeeNum = 1;
		
	    List<Project> allProjectList = projectService.getAllProjectList();
	    List<Project> favoritProjectList = projectService.getFavoritProjectList(employeeNum);
	    List<Project> partProjectList = projectService.getPartProjectList(employeeNum);
	    
	    mv.setViewName("project/project-list");
	    mv.addObject("allProjectlist", allProjectList);
	    mv.addObject("favoritProjectList", favoritProjectList);
	    mv.addObject("partProjectList", partProjectList);
	    
	    return mv;
	    
	}
	
	@GetMapping(value = "/project")
	public ModelAndView projectBoard
	(int num, ModelAndView mv) {
		
		Project project = projectService.getDetail(num);
		
		mv.setViewName("project/project-board");
	    mv.addObject("project", project);
	      
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/update-color")
	public void updateColor(@RequestParam(name="color", required=false) String color,
	                        @RequestParam(name="num", required=true) int num){
		projectService.updateColor(num, color);
		
	}
	
	@ResponseBody
	@GetMapping("/check")
	public Integer favoritCheck(@RequestParam(name="projectNum", required=true) int projectNum,
	                            @RequestParam(name="employeeNum", required=true) int employeeNum) {
	    
	    Integer result = projectService.checkFavorite(projectNum, employeeNum);
	    System.out.println(result);
	    
	    return result == null ? -1 : result;
	}
	
	@ResponseBody
	@PostMapping("/favorite")
	public Integer toggleFavorite(@RequestParam(name = "projectNum", required = true) int projectNum,
								  @RequestParam(name = "employeeNum", required = true) int employeeNum) {

		Integer result = projectService.checkFavorite(projectNum, employeeNum);

		if (result == null) {
			projectService.addFavorite(projectNum, employeeNum);
			return 1;
		} else {
			projectService.removeFavorite(projectNum, employeeNum);
			return -1;
		}
		
	}
	
	@RequestMapping(value = "/project-access-stats", method = RequestMethod.GET)
	public String projectAccessStats() {
		return "project/project-access-stats";
	}
	
	// JJ's Controller End
}
