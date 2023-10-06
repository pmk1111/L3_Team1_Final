package com.naver.myhome.controller;

import java.io.File;
import java.security.Principal;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.naver.myhome.domain.Issue;
import com.naver.myhome.service.IssueService;

@Controller
@RequestMapping(value = "/issue")
public class IssueController {

	private static final Logger logger = LoggerFactory.getLogger(IssueController.class);

	private IssueService issueService;

	@Autowired
	public IssueController(IssueService issueService) {
		this.issueService = issueService;
	}

	@GetMapping(value = "/issuelist")
	public ModelAndView issuelist(ModelAndView mv, HttpServletRequest request, Principal principal) {
		int listcount = issueService.getListCount();
		List<Issue> issuelist = issueService.getIssueList();
		
//		시큐리티 적용 전 세션에서 id 가져오기
//		HttpSession session = request.getSession();
//		String id = session.getId();
		
//		시큐리티 적용 후 세션에서 id 가져오기
//		String id = principal.getName();
//		List<Project> myProjectList = issueService.getMyProjectList(userId);
		
		mv.setViewName("issue/issuelist");
		mv.addObject("listcount", listcount);
		mv.addObject("issuelist" ,issuelist);
		return mv;
	}


	@ResponseBody
	@PostMapping("/list_ajax")
	public List<Issue> getFilteredIssueList(
			@RequestParam(name = "issueType", required = false) String issueType,
			@RequestParam(name = "issuePriority", required = false) String issuePriority) {


		List<Issue> filteredIssues = issueService.getFilteredIssueList(issueType, issuePriority);
		return filteredIssues;
	}

	@ResponseBody
	@PostMapping("/issue_search")
	public List<Issue> searchIssues(@RequestParam String searchText) {
		return issueService.searchIssues(searchText);
	}

	@PostMapping("issue_add")
	public String issueAdd(Issue issue, HttpServletRequest request) throws Exception{
		
		issueService.issueAdd(issue);
		logger.info(issue.toString());
		return "redirect:issuelist";
	}

	@GetMapping("/issuedetail")
	public ModelAndView issuedetail(int num, ModelAndView mv, HttpServletRequest request, 
			@RequestHeader(value = "referer", required = false) String beforeURL) {
		logger.info("referer: " + beforeURL);
		
		Issue issue = issueService.getIssueDetail(num);
		
		if(issue==null) {
			logger.info("상세보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURI());
		} else {
			logger.info("상세보기 성공");
//			int count = commentService.getListCount(num);
			mv.setViewName("issue/issuedetail");
//			mv.addObject("count", count);
			mv.addObject("issuedata", issue);
		}
		
		return mv;
	}
}
