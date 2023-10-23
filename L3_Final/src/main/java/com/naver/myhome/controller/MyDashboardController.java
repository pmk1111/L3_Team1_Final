package com.naver.myhome.controller;

import java.security.Principal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
import com.naver.myhome.domain.Schedule;
import com.naver.myhome.service.IssueService;
import com.naver.myhome.service.MemoService;
import com.naver.myhome.service.ScheduleService;
import com.naver.myhome.service.UserService;

import lombok.Getter;
import lombok.Setter;

@Controller
@RequestMapping("/mainboard")
public class MyDashboardController {

	private static final Logger logger = LoggerFactory.getLogger(MyDashboardController.class);

	private UserService userService;
	private IssueService issueService;
	private MemoService memoService;
	private ScheduleService scheduleService;

	static int userId = 1;

	@Autowired
	public MyDashboardController(UserService userService, IssueService issueService, 
			MemoService memoService, ScheduleService scheduleService) {
		this.userService = userService;
		this.issueService = issueService;
		this.memoService = memoService;
		this.scheduleService = scheduleService;
	}

	@GetMapping("/my-dashboard")
	public ModelAndView myDashBoard(ModelAndView mv, HttpServletRequest request, Principal principal) {

		//		시큐리티 적용 전 세션에서 id 가져오기
		//		HttpSession session = request.getSession();
		//		String id = session.getId();

		//		시큐리티 적용 후 세션에서 id 가져오기
		//		String userEmail = principal.getName();
		//		int userId = userService.getUserId(userEmail);
		//나중에는 저 int는 세션에 저장된 사용자 식별번호

		int userId = 1;

		LocalDate currentDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formattedDate = currentDate.format(formatter); // 오늘날짜 포맷팅한 값

		String toDo = "To Do";
		List<Issue> myWork = issueService.getMyWork(toDo);
		List<Memo> memoList = memoService.getMemoContent(userId);
		List<Schedule> scheduleList = scheduleService.getSelectedScheduleList(formattedDate, userId);

		mv.setViewName("mainboard/my-dashboard");
		mv.addObject("memolist", memoList);
		mv.addObject("issuelist", myWork);	
		mv.addObject("schedulelist", scheduleList);
		return mv;
	}

	@GetMapping("/get-selected-schedule-list")
	@ResponseBody
	public List<Schedule> getSelectedScheduleList(Principal principal, @RequestParam("pickedDate") String pickedDate){

		//		String userEmail = principal.getName();
		//		int userId = userService.getUserId(userEmail);

		int userId = 1;
		List<Schedule> scheduleList = scheduleService.getSelectedScheduleList(pickedDate, userId);

		return scheduleList;
	}
	
	@GetMapping("/get-schedule-info")
	@ResponseBody
	public Schedule getScheduleInfo(@RequestParam("scheduleId") int scheduleId) {
		return scheduleService.getScheduleInfo(scheduleId);
	}
	

	@GetMapping("/CountPerStatus")
	@ResponseBody
	public List<Issue> CountPerStatus(){
		List<Issue> issuecount = issueService.getStatusCount();

		for (Issue issue : issuecount) {
			System.out.println("Total Count: " + issue.getTotalcount());
			System.out.println("To Do Count: " + issue.getTodocount());
			System.out.println("Progress Count: " + issue.getProgresscount());
			System.out.println("Resolved Count: " + issue.getResolvedcount());
			System.out.println("Done Count: " + issue.getDonecount());
		}

		return issuecount;
	}

	@GetMapping("/mywork")
	@ResponseBody
	public List<Issue> getMyWork(@RequestParam String status){
		List<Issue> mywork = issueService.getMyWork(status);

		return mywork;
	}

	@GetMapping("/saveMemoContent")
	@ResponseBody
	public int saveMemoContent(Memo memo, @RequestParam("memoTxt") String memoTxt) {
		List<Memo> memoList = memoService.getMemoContent(userId);
		String currentMemo = memo.getContent();

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
