package com.naver.myhome.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naver.myhome.domain.Team;
import com.naver.myhome.service.TeamService;

@Controller
@RequestMapping(value = "/team")
public class teamController {
	
	// JJ's Controller
	private TeamService teamService;
	private static final Logger logger = LoggerFactory.getLogger(teamController.class);
	
	@Autowired
	public teamController(TeamService teamService) {
		this.teamService = teamService;
	}
	
	@ResponseBody
	@PostMapping(value = "/team-list") 
	public Map<String, List<Team>> teamList(@RequestParam(name = "projectId", required = true) int projectId,
	            				   		    @RequestParam(name = "sessionId", required = true) int sessionId ) {
	  
		List<Team> team = teamService.getTeam(projectId, sessionId);
	  
		Map<String, List<Team>> data = new HashMap<>();
		data.put("team", team);
	  
		return data;
	  
	}
	 
	@ResponseBody
	@PostMapping(value = "/invite-team")
	public Map<String, List<Team>> inviteTeam(@RequestParam(name = "projectId", required = true) int projectId){
		
		List<Team> invitedUser = teamService.inviteTeam(projectId);
		
		Map<String, List<Team>> data = new HashMap<>();
		data.put("invitedUser", invitedUser);
		
		return data;
	}
	
	@ResponseBody
	@PostMapping(value="/insert-team")
	public void insertTeam(@RequestParam(name="empIds[]") List<Integer> empIds,
		            	   @RequestParam(name="projectId") int projectId) {
		
		logger.info("empIds = " + empIds.size());
		
	    for (int empId : empIds) {
	    	logger.info("empid = " + empId);
	        teamService.insertTeam(empId, projectId);
	    }

	}
	
	// JJ's Controller End

}
