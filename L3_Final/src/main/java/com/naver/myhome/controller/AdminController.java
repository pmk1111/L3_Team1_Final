package com.naver.myhome.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;
import com.naver.myhome.service.AdminService;
import com.naver.myhome.service.UserService;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

		//지니
		private AdminService adminservice;
		private UserService userservice;
		
		@Autowired
		public AdminController(AdminService adminservice, UserService userservice) {
			this.adminservice = adminservice;
			this.userservice = userservice;
		}
		
		@RequestMapping(value = "/companyinfo", method = RequestMethod.GET)
//	    public ModelAndView companyinfo( ModelAndView mv) {
//	          String id = principal.getName();
//	        
//	       if (id == null) {
//	          mv.setViewName("redirect:login");
//	          
//	       } else {
//	          Company company= adminservice.company_info(id);
//	          mv.setViewName("admin/company_info");
//	          mv.addObject("companyinfo",company);
//	       }
		public String companyinfo() {
	       return "admin/company_info";
	    }
		
		
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public ModelAndView employeelist(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
	         @RequestParam(value = "limit", defaultValue = "3", required = false) int limit, ModelAndView mv,
	         @RequestParam(value = "search_field", defaultValue = "-1", required = false) int index,
	         @RequestParam(value = "search_word", defaultValue = "", required = false) String search_word){
			String company_id = "1"; //회사번호
			String company_invited= "widUs" ;//직원 초대
			
			
		    // 회사의 직원 목록을 가져와서 모델에 추가
		    List<Employee> employee = adminservice.findEmployee(company_id);
		    int countValue = adminservice.countEmployee(company_id);
		    mv.addObject("employee", employee);
		    mv.addObject("employeecount", countValue);
		    
		    System.out.println(countValue);
	
		    //회사의 이용 중지 직원 목록
		    List<Employee> stopEmployee = adminservice.stopEmployee(company_id);
		    int countStopValue = adminservice.countStopEmployee(company_id);
		    mv.addObject("stopEmployee", stopEmployee);
		    mv.addObject("stopemployeecount", countStopValue);
		    
		    System.out.println(countStopValue);
				
		    // 유저 목록을 가져와서 모델에 추가
		    List<User> user = userservice.finduser(company_invited);
		    int count = userservice.countuser(company_invited);
		    mv.addObject("user", user);
		    mv.addObject("count", count);
		    mv.setViewName("admin/employee_list");
		    
		    System.out.println(count);
		    
		    //검색 
//		    int listcount = adminservice.getSearchListCount(index, search_word);
//		    List<Employee> list = adminservice.getSearchList(index, search_word, page, limit);
//            
//		      int maxpage = (listcount + limit - 1) / limit;
//
//		      //                                     (1, 11, 21   ...)
//		      int startpage = ((page - 1) / 10) * 10 + 1;
//
//		      //                                       (10, 20, 30   ...)
//		      int endpage = startpage + 10 - 1;
//
//		      if (endpage > maxpage)
//		         endpage = maxpage;
//
//		      mv.setViewName("member/member_list");
//		      mv.addObject("page", page);
//		      mv.addObject("maxpage", maxpage);
//		      mv.addObject("startpage", startpage);
//		      mv.addObject("endpage", endpage);
//		      mv.addObject("listcount", listcount);
//		      mv.addObject("memberlist", list);
//		      mv.addObject("search_field", index);
//		      mv.addObject("search_word", search_word);

		      
		    return mv;
		}
		
		//직원 상태 업데이트 
	      @ResponseBody
	      @RequestMapping(value = "/updateEmployeeStatus", method = RequestMethod.POST)
	      public int updateEmployeeStatus(@RequestParam("employeeNo") int employeeNo,
	                @RequestParam("employeeStatus") int employeeStatus,
	                @RequestParam("tab") String tab,
	            Model model, HttpServletRequest request, RedirectAttributes rattr) {
	         
	            int result = 0;
	            
	            if ("userstop".equals(tab)) {
	             
	                 result = adminservice.stopEmployeeStatus(employeeNo);
	              
	            } else if ("useruse".equals(tab)) {
	            	
		                 result = adminservice.useEmployeeStatus(employeeNo);
		              
	            }
	              System.out.println(result);
	              
	             return result;
	      } 



		//관리자 유무 
		@ResponseBody
		@RequestMapping(value = "/employeeAuth", method = RequestMethod.POST)
		public int employeeAuth(@RequestParam("employeeNo") int employeeNo,
							    @RequestParam("employeeAuth") String employeeAuth,
							    @RequestParam("tab") String tab,
				Model model, HttpServletRequest request, RedirectAttributes rattr) {
			
				int result = 0;
				
				 if ("userstop".equals(tab)) {
					 if(employeeAuth.equals("Y")) {
						 result=adminservice.noMoreAuth(employeeNo);
					 }else if(employeeAuth.equals("N")) {
						 result = adminservice.addAuth(employeeNo);
					 }
				 }else if("useruse".equals(tab)) {
					 if(employeeAuth.equals("Y")) {
						 result=adminservice.noMoreAuth(employeeNo);
					 }else if(employeeAuth.equals("N")) {
						 result = adminservice.addAuth(employeeNo);
					 }
				 }
		        System.out.println(result);
		        
		       return result;
		} 
		
		//가입대기
		@ResponseBody
		@RequestMapping(value = "/regWait", method = RequestMethod.POST)
		public int regWait(@RequestParam("userId") int userId,
						   @RequestParam("action") String action,
				Model model, HttpServletRequest request, RedirectAttributes rattr) {
				String company_invited="widUs";
				int result = 0;
			    
				
				if("approve".equals(action)) {
					result = userservice.approveuser(company_invited);
				}else if("reject".equals(action)) {
					result = userservice.rejectuser(company_invited);
				}
		     
				System.out.println(result);
				
				return result;
				
		}

		
		
		@RequestMapping(value = "/invite", method = RequestMethod.GET)
		public String invite() {
		       return "admin/invite_employee";
		    }
		
		@RequestMapping(value = "/regwait", method = RequestMethod.GET)
		public String regwait() {
		       return "admin/reg_wait";
		    }
			
		   

	//	
		//지니 끝
		
		

		
	}

