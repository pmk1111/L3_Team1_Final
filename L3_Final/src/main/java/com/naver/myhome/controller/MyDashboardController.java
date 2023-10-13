package com.naver.myhome.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.myhome.domain.Issue;
import com.naver.myhome.domain.Memo;
import com.naver.myhome.service.IssueService;
import com.naver.myhome.service.MemoService;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Controller
@RequestMapping("/mainboard")
public class MyDashboardController {
	
	private static final Logger logger = LoggerFactory.getLogger(MyDashboardController.class);
	
	private IssueService issueService;
	private MemoService memoService;
	
	static int userId = 1;
	
	@Autowired
	public MyDashboardController(IssueService issueService, MemoService memoService) {
		this.issueService = issueService;
		this.memoService = memoService;
	}
	
	@GetMapping("/mydashboard")
	public ModelAndView myDashBoard(ModelAndView mv, HttpServletRequest request, Principal principal) {
		
//		시큐리티 적용 전 세션에서 id 가져오기
//		HttpSession session = request.getSession();
//		String id = session.getId();
		
//		시큐리티 적용 후 세션에서 id 가져오기
//		String id = principal.getName();
		//나중에는 저 int는 세션에 저장된 사용자 식별번호
		
		String toDo = "To Do";
		List<Issue> mywork = issueService.getMyWork(toDo);
		List<Memo> memolist = memoService.getMemoContent(userId);
		
		mv.setViewName("mainboard/mydashboard");
		mv.addObject("memolist", memolist);
		mv.addObject("issuelist", mywork);		
		return mv;
	}
	
	
	
	@GetMapping("/CountPerStatus")
	@ResponseBody
	public List<Issue> CountPerStatus(){
		List<Issue> issuecount = issueService.getStatusCount();
		return issuecount;
	}
	
	@PostMapping("/mywork")
	@ResponseBody
	public List<Issue> getMyWork(@RequestParam String status){
		List<Issue> mywork = issueService.getMyWork(status);
		
		return mywork;
	}
	
	@PostMapping("/memoSave")
	@ResponseBody
	public int memoSave(Memo memo, @RequestParam("memoTxt") String memoTxt) {
		List<Memo> memoList = memoService.getMemoContent(userId);
		String currentMemo = memo.getMemo_content();
		
		int response;
		
		try {
			if((memoTxt != "" && memoTxt != null) && memoList.size()==0) {
				memoService.memoInsert(memoTxt, userId);
			} else if((memoTxt != "" && memoTxt != null && memoTxt != currentMemo) && memoList.size()!=0) {
				memoService.memoUpdate(memoTxt, userId);
			} else if((memoTxt.trim() == "" || memoTxt == null)  && memoList.size()!=0) {
				memoService.memoDelete(userId);
			}
			
			response = 1;
		} catch (Exception e) {
			e.printStackTrace();
			response = 0;
		}
		
		return response;
	}
	
}
