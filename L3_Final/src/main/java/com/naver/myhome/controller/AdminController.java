package com.naver.myhome.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.myhome.domain.User;
import com.naver.myhome.service.AdminService;
import com.naver.myhome.service.UserService;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

		//지니
		private AdminService adminservice;
		
		@Autowired
		public AdminController(adminService adminService) {
			this.adminService = adminService;
		}
		
		@RequestMapping(value = "/companyinfo", method = RequestMethod.GET)
//	    public ModelAndView user_update(Principal principal, ModelAndView mv) {
//	          String id =S principal.getName();
//	        
//	       if (id == null) {
//	          mv.setViewName("redirect:login");
//	          
//	       } else {
//	          User user= userservice.user_info(id);
//	          mv.setViewName("user/profile");
//	          mv.addObject("userinfo",user);
//	       }
		public String companyinfo() {
	       return "admin/company_info";
	    }
		
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public String employeelist(String key, Model model) {
		       return "admin/employee_list";
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

