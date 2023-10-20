package com.naver.myhome.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naver.myhome.domain.Company;
import com.naver.myhome.domain.User;
import com.naver.myhome.service.CompanyService;


@Controller
@RequestMapping(value = "/company")
public class CompanyController {

	private CompanyService companyService;
	private PasswordEncoder passwordEncoder;
	 
	@Autowired
	public CompanyController(CompanyService companyService,PasswordEncoder passwordEncoder) {
		this.companyService = companyService;
		this.passwordEncoder= passwordEncoder;
	} 
	
	@ResponseBody	 
	@PostMapping("/chk-dupl-domain")
	public String chkDuplDomain(String companyDomain) {
		String errCode = "";
    	System.out.println("companyDomain" + companyDomain);		 	//입력받은 eMail;
             
        Company tmpCompany = companyService.selectByDomain(companyDomain);
        
        System.out.println("tmpUser" + tmpCompany);					//고객 조회 (Email을 통해서)
        if(tmpCompany != null) {
        	errCode = "1";											//이미 Email로 가입한 경우
         }else {
        	errCode = "0";
         }
        
        return errCode;
    }
	
	@ResponseBody
	@PostMapping("/save-tmp-data")
	public String saveTmpData( HttpServletRequest request , HttpSession session) {
		
		String companyDomain = request.getParameter("companyDomain");
		String companyName = request.getParameter("companyName");
		String eid = request.getParameter("eid");
		
		session.setAttribute("companyDomain", companyDomain);
		session.setAttribute("companyName", companyName);
		session.setAttribute("eid", eid);
    	
		return "";
    }
	
	  @ResponseBody
	    @PostMapping("/chk-auth-code")
	    public String chkAuthCode(Company company, HttpSession session,HttpServletRequest request) throws Exception {
	    	String errMsg = "";
	    	int verCode = (int) session.getAttribute("verificationCode");
	    	int userAuthCode = Integer.parseInt(request.getParameter("authNum"));
	    	System.out.println("verificationCode== > " + verCode);
	    	System.out.println("userInputAuthNum== > " + userAuthCode);
	    	System.out.println("password== > " + company.getPassword());
	    	
	    	if(verCode == userAuthCode || userAuthCode == 0) {
	    		String encPassword = passwordEncoder.encode(company.getPassword());
	    		
	    		System.out.println(request.getParameter("name"));
	    		System.out.println(request.getParameter("recipientEmail"));
	    		System.out.println(company.getPassword());
	    		System.out.println(session.getAttribute("companyDomain"));
	    		System.out.println(session.getAttribute("companyName"));
	    		System.out.println(session.getAttribute("eid"));
	    		 
    			company.setPassword(encPassword);
    			company.setDomain((String)session.getAttribute("companyDomain"));
    			company.setName((String)session.getAttribute("companyName"));
    			company.setEmail(request.getParameter("recipientEmail"));
    			
    			companyService.insert(company);
	    		
	    	}else {
	    		errMsg = "인증코드를 확인해주세요!";
	    	}
	    	
	    	return errMsg;
    }
	  	@ResponseBody
	    @PostMapping("/chk-dupl-email")
	    public String chkduplEmail(String email, HttpSession session) throws Exception {
	    	String errCode = "";
	    	System.out.println("CompanyEMail" + email);			//입력받은 eMail;
	             
	    	Company tmpCompany = companyService.selectByEmail(email);
	        System.out.println("tmpCompany" + tmpCompany);					//고객 조회 (Email을 통해서)
	        if(tmpCompany != null) {
	        	errCode = "1";											//이미 Email로 가입한 경우
	         }else {
	        	errCode = "0";
	         }
	        
	        return errCode;
	    }  
	
	
}

