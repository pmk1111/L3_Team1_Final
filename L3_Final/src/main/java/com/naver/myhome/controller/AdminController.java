package com.naver.myhome.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
//	          String id =S principal.getName();
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
		public ModelAndView employeelist(ModelAndView mv) {
			String company_id = "1"; //회사번호
		    // 회사의 직원 목록을 가져와서 모델에 추가
		    List<Employee> employee = adminservice.findEmployee(company_id);
		    int countValue = adminservice.countEmployee(company_id);
		    mv.addObject("employee", employee);
		    mv.addObject("employeecount", countValue);
		    mv.setViewName("admin/employee_list");
		    System.out.println(countValue);

		    // 유저 목록을 가져와서 모델에 추가
		    List<User> user = userservice.finduser(company_id);
//		    int count = userservice.countuser();
		    mv.addObject("user", user);
//		    mv.addObject("count", count);
		    mv.setViewName("admin/employee_list");
	    
		    return mv;
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

