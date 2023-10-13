package com.naver.myhome.controller;

import java.io.File;
import java.security.Principal;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.myhome.domain.Issue;
import com.naver.myhome.service.FileService;
import com.naver.myhome.service.IssueService;

import lombok.Getter;
import lombok.Setter;
import oracle.jdbc.proxy.annotation.Post;

@Getter
@Setter
@Controller
@RequestMapping(value = "/issue")
public class IssueController {

	private static final Logger logger = LoggerFactory.getLogger(IssueController.class);

	private IssueService issueService;
	private FileService fileService;
//    private FileUtils fileUtils;

	@Autowired
	public IssueController(IssueService issueService) {
		this.issueService = issueService;
//		this.fileService = fileService;
//		this.fileUtils = fileUtils;
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
	public String issueAdd(Issue issue, HttpServletRequest request, MultipartFile[] uploadfiles) throws Exception{
		
		/* List<MultipartFile> fileList = mtfRequest.getFiles("uploadFiles"); */
		int id = issueService.getIssueId();
		//issue_id는 다음 시퀀스 번호를 가져오니, 
		//select issue_id.nextval from dual로 가져온 값을 id에 할당해 saveFile의 매개변수로 넣어도 되는가...?
		
		issueService.issueAdd(issue);

        
		logger.info(issue.toString());
		return "redirect:issuelist";
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	   public ModelAndView fileupload(ModelAndView mv, MultipartFile[] uploadfiles) {
	      
	      for(MultipartFile file : uploadfiles) {
	         
	         logger.info("업로드 파일: " + file.getOriginalFilename());
	      }
	      
	      
	      return mv;
	   }
	
	@GetMapping("/test")
	public String test(MultipartFile[] uploadfiles) {
		
		for(MultipartFile file :  uploadfiles) {
			logger.info("업로드 파일: " + file.getOriginalFilename());
		}
		return "issue/test";
	}
	
	
	
	

	@GetMapping("/issuedetail")
	public ModelAndView issuedetail(int num, ModelAndView mv, HttpServletRequest request, 
			@RequestHeader(value = "referer", required = false) String beforeURL) {
		logger.info("referer: " + beforeURL);
		
		Issue issue = issueService.getIssueDetail(num);
		
		if(issue==null) {
			logger.info("상세보기 실패");
			mv.setViewName("issue/noissuecontent");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("showAlert", true);
		} else {
			logger.info("상세보기 성공");
			mv.setViewName("issue/issuedetail");
			mv.addObject("issuedata", issue);
			mv.addObject("showAlert", false);
		}
		
		return mv;
	}
	
	@PostMapping("/statusUpdate")
	@ResponseBody
	public Map<String, Object> statusUpdate(@RequestParam int issueId, @RequestParam String status, @RequestParam String selectedUserName) {
	    Map<String, Object> response = new HashMap<>();
	    try {
	        issueService.updateStatus(issueId, status, selectedUserName);
	        response.put("status", "success");
	    } catch (Exception e) {
	        response.put("status", "error");
	        response.put("message", e.getMessage());
	    }
	    return response;
	}

	
	@PostMapping("/issueUpdate")
	public String issueUpdate(Issue issue, @RequestParam("num") int num, HttpServletRequest request, RedirectAttributes rattr){
		String url = "";
		issue.setIssue_id(num);
		int result = issueService.issueUpdate(issue);
		
		if(result==0) {
			logger.info("게시판 수정 실패");
		} else {
			logger.info("게시판 수정 완료");
			url = "redirect:issuedetail";
			rattr.addAttribute("num", issue.getIssue_id());
		}
		return url;
	}
	
	@PostMapping("/issueDelete")
	@ResponseBody
	public int deleteIssue(@RequestParam int issueId) {
	    try {
	        issueService.issueDelete(issueId);
	        return 1;
	    } catch (Exception e) {
	        return 0;
	    }
	}



}
