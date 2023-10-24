package com.naver.myhome.controller;

import java.io.File;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.myhome.domain.Files;
import com.naver.myhome.domain.Issue;
import com.naver.myhome.domain.ProjectAndUser;
import com.naver.myhome.service.FileService;
import com.naver.myhome.service.IssueService;
import com.naver.myhome.service.ProjectAndUserService;

@Controller
@RequestMapping(value = "/main")
public class BookmarkController {

	private static final Logger logger = LoggerFactory.getLogger(BookmarkController.class);

	private IssueService issueService;
	private FileService fileService;
	


	public BookmarkController(IssueService issueService, FileService fileService) {
		this.issueService = issueService;
		this.fileService = fileService;
		
	}
	
	@GetMapping(value = "/bookmark")
	public String bookmark(ModelAndView mv, HttpServletRequest request, Principal principal) {
		return "bookmark/bookmark";
	}





}
