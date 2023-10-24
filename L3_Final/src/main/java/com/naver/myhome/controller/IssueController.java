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
@RequestMapping(value = "/issue")
public class IssueController {

	private static final Logger logger = LoggerFactory.getLogger(IssueController.class);

	private IssueService issueService;
	private FileService fileService;
	private ProjectAndUserService projectAndUserService;

	@Value("${file.upload.path}")
	private String saveFolder;

	@Autowired
	public IssueController(IssueService issueService, FileService fileService, ProjectAndUserService projectAndUserService) {
		this.issueService = issueService;
		this.fileService = fileService;
		this.projectAndUserService = projectAndUserService;
	}

	@GetMapping(value = "/issue-list")
	public ModelAndView issuelist(int projectId, ModelAndView mv, HttpServletRequest request, Principal principal) {
		int listcount = issueService.getListCount();
		List<Issue> issuelist = issueService.getIssueList(projectId);

		//		시큐리티 적용 전 세션에서 id 가져오기
		//		HttpSession session = request.getSession();
		//		String id = session.getId();

		//		시큐리티 적용 후 세션에서 id 가져오기
		//		String id = principal.getName();
		//		List<Project> myProjectList = issueService.getMyProjectList(userId);

		mv.setViewName("issue/issue-list");
		mv.addObject("listcount", listcount);
		mv.addObject("issuelist" ,issuelist);
		return mv;
	}


	@ResponseBody
	@GetMapping("/getFilteredIssue")
	public List<Issue> getFilteredIssueList(
			@RequestParam(name = "issueStatus", required = false) String issueStatus,
			@RequestParam(name = "issuePriority", required = false) String issuePriority) {


		List<Issue> filteredIssues = issueService.getFilteredIssueList(issueStatus, issuePriority);
		return filteredIssues;
	}

	@ResponseBody
	@GetMapping("/getSearchedIssue")
	public List<Issue> getSearchedIssue(@RequestParam String searchText) {
		return issueService.searchIssues(searchText);
	}

	@ResponseBody
	@GetMapping("/getProjectAndTeamInfo")
	public List<ProjectAndUser> getProjectAndTeamInfo(@RequestParam int projectId){
		return projectAndUserService.getProjectAndUserInfo(projectId);
	}
	
	@PostMapping("createIssue")
	public String createIssue(Issue issue, HttpServletRequest request, MultipartFile[] uploadfiles) throws Exception {
		List<Files> fileList = new ArrayList<>();
		int issueId = issueService.getIssueId();
		logger.info("가져온 이슈 번호: " + issueId);

		// issue_id는 다음 시퀀스 번호를 가져오니, 
		// select issue_id.nextval from dual로 가져온 값을 id에 할당한 후 issue / files DTO에 할당해준다.

		issue.setId(issueId);
		issue.setProject_id(1);
		//issue.setProject_id(projectId);
		issue.setCreate_user(2);
		//작성자 정보는 세션에 저장된 user의 id를 불러와 저장한다.
		issueService.createIssue(issue);
		logger.info(issue.toString());


		for(MultipartFile file : uploadfiles) {
			Files files = new Files();
			if(file.getSize()>0) {
				files.setFile_size(file.getSize());
				logger.info("업로드 파일: " + file.getOriginalFilename());

				files.setIssue_id(issueId);
				files.setOriginal_name(file.getOriginalFilename());

				String saveName = fileDBName(file.getOriginalFilename(), saveFolder);
				files.setSave_name(saveName);

				logger.info("업로드한 파일 사이즈 = " + file.getSize());
				logger.info("업로드 경로 = " + saveFolder);

				file.transferTo(new File(saveFolder + saveName));
				fileList.add(files);
			}
		}
		logger.info("파일리스트 크기 = " + fileList.size());
		if(!fileList.isEmpty()) {
			fileService.uploadFile(fileList);
		}


		return "redirect:issue-list";
	}



	private String fileDBName(String fileName, String saveFolder) {
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH)+1;
		int date = c.get(Calendar.DATE);

		String homdir = saveFolder + "/" + year + "-" + month + "-" + date;
		logger.info(homdir);

		File path1 = new File(homdir);
		if(!(path1.exists())) {
			path1.mkdir();
		}

		Random r = new Random();
		int random = r.nextInt(10000000);

		int index = fileName.lastIndexOf(".");

		logger.info("index = " + index);

		String fileExtension = fileName.substring(index+1);
		logger.info("파일확장자 = " + fileExtension);

		String refileName = "bbs" + year + month + date + random + "." + fileExtension;
		logger.info("refileName = " + refileName);

		String fileDBName = File.separator + year + "-" + month + "-" + date + File.separator + refileName;
		logger.info("fileDBName = " + fileDBName);

		return fileDBName;
	}

	@ResponseBody
	@GetMapping("/down")
	public byte[] BoardFileDown(String saveName,
			HttpServletRequest request,
			String originalName,
			HttpServletResponse response) throws Exception{

		String sFilePath = saveFolder + saveName;

		File file = new File(sFilePath);

		byte[] bytes = FileCopyUtils.copyToByteArray(file);

		String sEncoding = new String(originalName.getBytes("utf-8"), "ISO-8859-1");

		response.setHeader("Content-Disposition", "attachment;filename=" + sEncoding);

		response.setContentLength(bytes.length);
		return bytes;
	}



	//=====테스트용 코드
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public ModelAndView fileupload(ModelAndView mv, MultipartFile[] uploadfiles) {

		for(MultipartFile file : uploadfiles) {

			logger.info("업로드 파일: " + file.getOriginalFilename());
		}


		return mv;
	}

	@GetMapping("/test")
	public String test(MultipartFile[] uploadfiles) {


		return "issue/test";
	}
	// ======여기까지 테스트




	@GetMapping("/issue-detail")
	public ModelAndView issueDetail(int num, ModelAndView mv, HttpServletRequest request, 
			@RequestHeader(value = "referer", required = false) String beforeURL) {
		logger.info("referer: " + beforeURL);

		Issue issue = issueService.getIssueDetail(num);
		List<Files> filelist = fileService.getFileList(num);

		if(issue==null) {
			logger.info("상세보기 실패");
			mv.setViewName("issue/no-issue-content");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("showAlert", true);
		} else {
			logger.info("상세보기 성공");
			mv.setViewName("issue/issue-detail");
			mv.addObject("issuedata", issue);
			mv.addObject("filelist",filelist);
			mv.addObject("showAlert", false);
		}

		return mv;
	}

	@PostMapping("/statusUpdate")
	@ResponseBody
	public Map<String, Object> statusUpdate(@RequestParam int issueId, 
			@RequestParam String status, 
			@RequestParam String selectedUserId) {
		Map<String, Object> response = new HashMap<>();
		try {
			issueService.updateStatus(issueId, status, selectedUserId);
			response.put("status", "success");
		} catch (Exception e) {
			response.put("status", "error");
			response.put("message", e.getMessage());
		}
		return response;
	}


	@PostMapping("/issue-update")
	public String issueUpdate(Issue issue, @RequestParam("num") int num, 
			@RequestParam("check") String check,
			HttpServletRequest request, RedirectAttributes rattr,
			MultipartFile[] uploadfiles) throws Exception{
		String url = "";
		issue.setId(num);
		int result = issueService.issueUpdate(issue);

		if(result==0) {
			logger.info("게시판 수정 실패");
		} else {
			if(check.equals("true")) {
				fileService.updateDeleteYn(num);
				List<Files> fileList = new ArrayList<>();

				for(MultipartFile file : uploadfiles) {
					Files files = new Files();
					if(file.getSize()>0) {
						files.setFile_size(file.getSize());
						logger.info("업로드 파일: " + file.getOriginalFilename());

						files.setIssue_id(num);
						files.setOriginal_name(file.getOriginalFilename());

						String saveName = fileDBName(file.getOriginalFilename(), saveFolder);
						files.setSave_name(saveName);

						logger.info("업로드한 파일 사이즈 = " + file.getSize());
						logger.info("업로드 경로 = " + saveFolder);

						file.transferTo(new File(saveFolder + saveName));
						fileList.add(files);
					}
				}
				logger.info("파일리스트 크기 = " + fileList.size());
				if(!fileList.isEmpty()) {
					fileService.uploadFile(fileList);
				}
			}
			logger.info("게시판 수정 완료");
			url = "redirect:issue-detail";
			rattr.addAttribute("num", issue.getId());
		}
		return url;
	}

	@PostMapping("/issue-delete")
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
