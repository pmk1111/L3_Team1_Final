package com.naver.myhome.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/project")
public class ProjectController {
	
	// JJ's Controller
	
	@RequestMapping(value = "/ProjectBoard", method = RequestMethod.GET)
	public String ProjectBoard() {
		return "project/ProjectBoard";
	}
	
	@RequestMapping(value = "/GanttChart", method = RequestMethod.GET)
	public String ProjectGanttChart() {
		return "project/GanttChart";
	}
	
	@RequestMapping(value = "/CreateProject", method = RequestMethod.GET)
	public String CreateProject() {
		return "project/CreateProject";
	}

	/*
	 * @RequestMapping(value = "/TeamInvite", method = RequestMethod.GET) public
	 * String TeamInvite() { return "project/Team_Invite"; }
	 */
	
	@RequestMapping(value = "/ProjectList", method = RequestMethod.GET)
	public String ProjectList() {
		return "project/ProjectList";
	}
	
	@RequestMapping(value = "/Project_Access_Stats", method = RequestMethod.GET)
	public String Project_Access_Stats() {
		return "project/Project_Access_Stats";
	}
	
	// JJ's Controller End
}
