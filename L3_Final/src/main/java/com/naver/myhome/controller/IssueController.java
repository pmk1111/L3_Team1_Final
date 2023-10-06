package com.naver.myhome.controller;

import java.io.File;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	public ModelAndView issuelist(ModelAndView mv) {
		int listcount = issueService.getListCount();
		List<Issue> issuelist = issueService.getIssueList();

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


	@RequestMapping(value = "/issuedetail", method = RequestMethod.GET)
	public String issuedetail() {
		return "issue/issuedetail";
	}
}
