package com.naver.myhome.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naver.myhome.domain.Company;
import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;
import com.naver.myhome.service.CompanyService;
import com.naver.myhome.service.EmployeeService;
import com.naver.myhome.service.UserService;

import oracle.jdbc.proxy.annotation.Post;


@Controller
@RequestMapping(value = "/company")
public class CompanyController {

	private CompanyService companyService;
	private EmployeeService employeeService; 
	private UserService userService;
	 
	@Autowired
	public CompanyController(CompanyService companyService, EmployeeService employeeService,UserService userService) {
		this.companyService = companyService;
		this.employeeService = employeeService;
		this.userService= userService;
	} 
	
	@GetMapping("/create-company-domain")
	public String createCompanyDomain(@AuthenticationPrincipal User user) {
		if(user == null) {
			return "user/login";
		}
	   return "company/create-company-domain";
	}
	
	@ResponseBody	 
	@PostMapping("/check-duplication-domain")
	public String chkDuplDomain(String domain) {
		String errCode = "";
    	System.out.println("companyDomain" + domain);		 	//입력받은 eMail;
             
        Company tmpCompany = companyService.selectByDomain(domain);
        
        if(tmpCompany != null) {
        	errCode = "1";											//이미 Email로 가입한 경우
         }else {
        	errCode = "0";
         }
        
        return errCode;
    }
	
	@ResponseBody	 
	@PostMapping("/create-company")
	public Map<String, Object> createComapny(Company company,@AuthenticationPrincipal User user, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		String errCode = "0";
		
		company.setUserId(user.getId());
		
		int resultCnt = companyService.insert(company);
        
        if(resultCnt > 0) {
        	
        	Company companyResult = companyService.selectCompanyByUser(user);
        	User tempUser = user;
        	
        	tempUser.setId(user.getId());  
            tempUser.setEmail(user.getEmail());
        	tempUser.setSecurity("ROLE_ADMIN");
        	tempUser.setCompanyInvited(companyResult.getId());
        	tempUser.setCompanyStatus("1");
        	
            UsernamePasswordAuthenticationToken newAuthentication = new UsernamePasswordAuthenticationToken(tempUser, user.getPassword(), user.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(newAuthentication);
            session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, SecurityContextHolder.getContext());
        	
        	userService.updateUserInfo(user);
        	
        	System.out.println("변경된 사용자 정보 : " + user.toString());
        	
        	System.out.println(companyResult.toString());
        	Employee insertEmployee = new Employee();
        	insertEmployee.setUser_id(user.getId());
        	insertEmployee.setCompany_id(companyResult.getId());
        	insertEmployee.setDepartment("HQ");
        	insertEmployee.setPosition("OWNER");
        	insertEmployee.setAuth("Y");

        	employeeService.insert(insertEmployee);
        }else {
        	errCode = "1";
        }
        map.put("user", user);
        map.put("errCode", errCode);
        return map;
    }
	
	@GetMapping("/join-company")
	public String joinCompany() {
	   return "company/join-company";
	}
	
	@PostMapping("/sign-up-domain")
    @ResponseBody
    public String signUpDomain(@AuthenticationPrincipal User user,String domain) {
		
		String retResult = "0";
		Company domainCompany = companyService.selectByDomain(domain);
		
		if(domainCompany == null) {
			retResult =  "1";							//입력한 도메인을 가진 회사가 없을경우에 오류를 리턴 
		}else {
			user.setCompanyInvited(domainCompany.getId());
			user.setCompanyStatus("0");
			userService.updateUserInfo(user);
			retResult = "0";
		}
		
		return retResult;

	}
	
}

