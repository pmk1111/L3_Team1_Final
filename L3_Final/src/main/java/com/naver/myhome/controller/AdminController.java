package com.naver.myhome.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.myhome.domain.Company;
import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;
import com.naver.myhome.service.AdminService;
import com.naver.myhome.service.UserService;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

		private static final Logger logger = LoggerFactory.getLogger(IssueController.class);
		//지니
		private AdminService adminservice;
		private UserService userservice;
		
		@Autowired
		public AdminController(AdminService adminservice, UserService userservice) {
			this.adminservice = adminservice;
			this.userservice = userservice;
		}
		
		
		@ResponseBody
		@GetMapping(value = "/companyinfo")
		public ModelAndView companyinfo(ModelAndView mv, String companyName, String companyDomain) {
		    String companyId = "1";
		  

		    
		    Company company = adminservice.companyInfo(companyId);
		    String DBcompanyname = company.getCompany_name();
		    mv.addObject("companyinfo", company);
		    
		    if ("companyName".equals(DBcompanyname)) {
		    	
		        // 회사명 업데이트
		        int updateCount = adminservice.updateName(companyId, companyName);
		        if (updateCount > 0) {
		            // 업데이트 성공
		            Company updatedCompany= adminservice.companyInfo(companyId);
		            mv.addObject("companyinfo", updatedCompany);
		            mv.addObject("message", "회사명이 성공적으로 업데이트되었습니다.");
		        } else {
		            // 업데이트 실패
		             mv.addObject("error", "회사명 업데이트 중 오류가 발생했습니다.");
		         }
		     } else if ("companyDomain".equals(companyDomain)) {
		         // 회사 도메인 업데이트
		         int updateCount= adminservice.updateDomain(companyId, companyDomain);
		         if (updateCount > 0) {
		             // 업데이트 성공
		             Company updatedCompany= adminservice.companyInfo(companyId);
		             mv.addObject("companyinfo", updatedCompany);
		             mv.addObject("message", "회사 URL이 성공적으로 업데이트되었습니다.");
		         } else {
		             // 업데이트 실패
		              mv.addObject("error", "회사 URL 업데이트 중 오류가 발생했습니다.");
		          }
		      }
		    mv.setViewName("admin/company_info");
		      return mv;
		}

//		//비밀번호 체크
//		@GetMapping(value = "/changePwd" )
//		public int checkPwd(Company company) {
//			String companyId="1";
//			
//			String checkPwd = adminservice.checkPwd(companyId);
//			
//			if(company ==null || checkPassword(company.getCompany_password(),checkPwd)) {
//				return 0;
//			}
//			return 1;
//		}
//		
//		
//		@PostMapping(value = "/updatePwd")
//		public String updatePwd(String companyId, String companyPwd, RedirectAttributes rttr, HttpSession session ){
//			//String hashedPw = BCrypt.hashpw(memberPw1, BCrypt.gensalt());
//			adminservice.updatePwd(companypwd);
//			session.invalidate();
//			rttr.addFlashAttribute("message","정보 수정이 완료되었습니다. 다시 로그인해주세요");
//			
//			return "redirect:/home/home";
//		});
//		
		@GetMapping(value = "/list")
		public ModelAndView employeelist( ModelAndView mv){
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
		    
		  
		      
		    return mv;
		}
		
		//직원 상태 업데이트 
	      @ResponseBody
	      @PostMapping(value = "/updateEmployeeStatus")
	      public int updateEmployeeStatus(@RequestParam("employeeNo") int employeeNo,
	                @RequestParam("employeeStatus") int employeeStatus,
	                @RequestParam("tab") String tab,
	            Model model, HttpServletRequest request, RedirectAttributes rattr) {
	         
	            int result = 0;
	            
	            if ("useruse".equals(tab)) { //정상 -> 이용중지
	             
	                 result = adminservice.stopEmployeeStatus(employeeNo);
	              
	            } else if ("userstop".equals(tab)) { //이용중지 -> 정상
	            	
		                 result = adminservice.useEmployeeStatus(employeeNo);
		              
	            }
	              System.out.println(result);
	              
	             return result;
	      } 



		//관리자 유무 
		@ResponseBody
		@PostMapping(value = "/employeeAuth")
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
		@PostMapping(value = "/regWait")
		public int regWait(@RequestParam("userid") int userid,
						   @RequestParam("action") String action,
				Model model, HttpServletRequest request, RedirectAttributes rattr) {
				String company_invited="widUs";
				String company_id = "1";
				
				int result = 0;
			    
				
				if("approve".equals(action)) {
					result = userservice.approveuser(userid);
					
					 if (result == 1) {
				          int addEmployee = adminservice.addEmployee(userid,company_id,company_invited);
				          return addEmployee;
				        }
					
				}else if("reject".equals(action)) {
					result = userservice.rejectuser(userid);
				}
				
				
		     
				System.out.println(result);
				
				return result;
				
		}

		//정상리스트 가져오기
		@ResponseBody
		@PostMapping(value = "/useruselist")
		public List<Employee> useruselist(@RequestParam("company_id")  String company_id){
			 
			
			// 회사의 직원 목록을 가져와서 모델에 추가
		    List<Employee> employee = adminservice.findEmployee(company_id);
		     
		    
		    return employee;
			
		}
		
		//이용중지 리스트 가져오기
		@ResponseBody
		@PostMapping(value = "/userstoplist")
		public List<Employee> userstoplist(@RequestParam("company_id")  String company_id){
			 
			
			// 회사의 직원 목록을 가져와서 모델에 추가
		    List<Employee> stopEmployee = adminservice.stopEmployee(company_id);
		    
		    return stopEmployee;
			
		}

		
		@GetMapping(value = "/invite")
		public String invite() {
		       return "admin/invite_employee";
		    }
		
		@GetMapping(value = "/waitapprove")
		public String regwait() {
		       return "admin/reg_wait";
		    }
			
		   

	//	
		//지니 끝
		
		

		
	}

