package com.naver.myhome.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/issue")
public class IssueController {
	
	@RequestMapping(value = "/issuelist", method = RequestMethod.GET)
	public String issuelist() {
		return "issue/issuelist";
	}

	@RequestMapping(value = "/issuedetail", method = RequestMethod.GET)
	public String issuedetail() {
		return "issue/issuedetail";
	}
}
