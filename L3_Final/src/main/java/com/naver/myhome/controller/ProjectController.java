package com.naver.myhome.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.myhome.domain.Issue;
import com.naver.myhome.domain.Project;
import com.naver.myhome.domain.User;
import com.naver.myhome.service.IssueService;
import com.naver.myhome.service.ProjectService;
import com.naver.myhome.service.TeamService;

@Controller
@RequestMapping(value = "/project")
public class ProjectController {

	// JJ's Controller
	private ProjectService projectService;
	private TeamService teamService;
	private IssueService issueService;

	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	@Autowired
	public ProjectController(ProjectService projectService, TeamService teamService, IssueService issueService) {
		this.issueService = issueService;
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
	public String create(Project project, @AuthenticationPrincipal User customUser) throws Exception {

		projectService.insertProject(project);

		int projectId = project.getID();

		logger.info("createprojectId = " + projectId);

		int sessionId = customUser.getId();
		logger.info("session아이디" + sessionId);

		int employeeId = projectService.getEmpId(sessionId);
		logger.info("employeeId아이디" + employeeId);

		teamService.addTeam(projectId, employeeId);

		return "redirect:project-list";
	}

	@GetMapping(value = "/project-list")
	public ModelAndView projectList(ModelAndView mv, @AuthenticationPrincipal User customUser, HttpSession session) {

		if (session.getAttribute("projectId") != null) {
			session.removeAttribute("projectId");
		}

		int sessionId = customUser.getId();

		int employeeId = projectService.getEmpId(sessionId);

		List<Project> favoritProjectList = projectService.getFavoritProjectList(employeeId);
		List<Project> partProjectList = projectService.getPartProjectList(employeeId);

		mv.setViewName("project/project-list");
		mv.addObject("favoritProjectList", favoritProjectList);
		mv.addObject("partProjectList", partProjectList);

		return mv;

	}

	@ResponseBody
	@GetMapping(value = "/part-tabs")
	public Map<String, List<Project>> getPartTabs(@AuthenticationPrincipal User customUser) {

		int sessionId = customUser.getId();

		int employeeId = projectService.getEmpId(sessionId);

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
	public Integer favoritCheck(@RequestParam(name = "projectId", required = true) int projectId,
			@AuthenticationPrincipal User customUser) {

		int sessionId = customUser.getId();

		int employeeId = projectService.getEmpId(sessionId);

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
	
	 @GetMapping("/project-select") 
	 public String setProjectId(HttpSession session) {
		int selectedProjectId = (int) session.getAttribute("projectId");
		return "redirect:/project/project?projectId="+selectedProjectId;
	 }
	 

	@GetMapping(value = "/project")
	public ModelAndView projectBoard(ModelAndView mv, @AuthenticationPrincipal User customUser, 
			HttpSession session, int projectId) {
		
		if(session.getAttribute("projectId") == null) {
			session.setAttribute("projectId", projectId);
		}

		int selectedProjectId = (int) session.getAttribute("projectId");

		int sessionId = customUser.getId();

		Project project = projectService.getDetail(selectedProjectId);

		logger.info("눌려진 프로젝트 " + project);

		List<Issue> issuelist = issueService.getIssueList(selectedProjectId);

		Integer getAuth = teamService.getAuth(sessionId, selectedProjectId);

		logger.info("session " + getAuth);

		Integer doneCount = projectService.getDoneCount(selectedProjectId);
		Integer updateCount = projectService.getUpdateCount(selectedProjectId);
		Integer createCount = projectService.getCreateCount(selectedProjectId);
		Integer criticalCount = projectService.getCriticalCount(selectedProjectId);

		Integer todoCount = projectService.todoCount(selectedProjectId);
		Integer progressCount = projectService.progressCount(selectedProjectId);
		Integer allDoneCount = projectService.allDoneCount(selectedProjectId);
		Integer resolveCount = projectService.resolveCount(selectedProjectId);

		Integer allCriticalCount = projectService.allCriticalCount(selectedProjectId);
		Integer highCount = projectService.highCount(selectedProjectId);
		Integer middleCount = projectService.middleCount(selectedProjectId);
		Integer lowCount = projectService.lowCount(selectedProjectId);

		mv.setViewName("project/project-board");
		mv.addObject("projectId", selectedProjectId);
		mv.addObject("project", project);

		mv.addObject("getAuth", getAuth);

		mv.addObject("issuelist", issuelist);

		mv.addObject("doneCount", doneCount);
		mv.addObject("updateCount", updateCount);
		mv.addObject("createCount", createCount);
		mv.addObject("criticalCount", criticalCount);
		mv.addObject("todoCount", todoCount);
		mv.addObject("progressCount", progressCount);
		mv.addObject("allDoneCount", allDoneCount);
		mv.addObject("resolveCount", resolveCount);
		mv.addObject("allCriticalCount", allCriticalCount);
		mv.addObject("highCount", highCount);
		mv.addObject("middleCount", middleCount);
		mv.addObject("lowCount", lowCount);

		return mv;
	}

	@ResponseBody
	@GetMapping("/update-color")
	public void updateColor(@RequestParam(name = "color", required = false) String color,
			@RequestParam(name = "id", required = true) int projectId) {
		projectService.updateColor(projectId, color);
	}

	@ResponseBody
	@DeleteMapping("/delete")
	public void deleteProject(@RequestParam(name = "projectId") int projectId) {
		projectService.deleteProject(projectId);
	}
	// JJ's Controller End

}
