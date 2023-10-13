package com.naver.myhome.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.myhome.domain.Project;
import com.naver.myhome.service.ProjectService;

@Controller
@RequestMapping(value = "/project")
public class ProjectController {
	
	// JJ's Controller
	private ProjectService projectService;
	
	@Autowired
	public ProjectController(ProjectService projectService) {
		this.projectService = projectService;
	}
	
	@GetMapping(value = "/GanttChart")
	public String ProjectGanttChart() {
		return "project/GanttChart";
	}
	
	@GetMapping(value = "/CreateProject") // board/write
	public String CreateProject() {
		return "project/CreateProject";
	}
	
	@GetMapping(value = "/Create")
	public String Create(Project project, HttpServletRequest request) throws Exception {
		projectService.insertProject(project);
		return "redirect:ProjectList";
	}
    
	@GetMapping(value = "/ProjectList")
	public ModelAndView ProjectList(ModelAndView mv) {
		
		int employeeNum = 1;
		
	    List<Project> allProjectList = projectService.getAllProjectList();
	    List<Project> favoritProjectList = projectService.getFavoritProjectList(employeeNum);
	    List<Project> partProjectList = projectService.getPartProjectList(employeeNum);
	    
	    mv.setViewName("project/ProjectList");
	    mv.addObject("allProjectlist", allProjectList);
	    mv.addObject("favoritProjectList", favoritProjectList);
	    mv.addObject("partProjectList", partProjectList);
	    
	    return mv;
	}
	
	@GetMapping(value = "/Project")
	public ModelAndView ProjectBoard
	(int num, ModelAndView mv,
	 @RequestHeader(value="referer", required=false) String beforeURL) {
		
		Project project = projectService.getDetail(num);
		
		mv.setViewName("project/ProjectBoard");
	    mv.addObject("project", project);
	      
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/updateColor")
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
	
	@RequestMapping(value = "/Project_Access_Stats", method = RequestMethod.GET)
	public String Project_Access_Stats() {
		return "project/Project_Access_Stats";
	}
	
	// JJ's Controller End
}
