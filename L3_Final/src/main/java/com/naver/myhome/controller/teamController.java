package com.naver.myhome.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	 
	// JJ's Controller End
	

}
